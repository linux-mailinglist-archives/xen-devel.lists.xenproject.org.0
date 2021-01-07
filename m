Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 059292ED135
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 14:55:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62906.111588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxVlL-0001Uz-5p; Thu, 07 Jan 2021 13:55:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62906.111588; Thu, 07 Jan 2021 13:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxVlL-0001Ua-2L; Thu, 07 Jan 2021 13:55:39 +0000
Received: by outflank-mailman (input) for mailman id 62906;
 Thu, 07 Jan 2021 13:55:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3gRj=GK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kxVlJ-0001UC-U1
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 13:55:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e898e3e-f7e6-41ef-872a-90babe743a91;
 Thu, 07 Jan 2021 13:55:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 565E1B718;
 Thu,  7 Jan 2021 13:55:36 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 8e898e3e-f7e6-41ef-872a-90babe743a91
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610027736; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eYTYjV4It1PCbzIf/Zh5VJWkIMJ9E7gg8oW1ZWj5P4k=;
	b=UwoPoiT7w9w/Yx90PWi1JRC9azGDqcsOVJXzztb++ZfXXL1Yr0zVLIITCQFCqPfd85fW94
	8pboGE3nyDwfje4m4V5a4lVzEPxLbbxsFz3yRx8Hkg88icXFMSUPSvL35vAA4hmls+k/F4
	4hnIBcgoOPpcnk+ZucIIO4SnGHhWQsU=
Subject: Re: [PATCH v2] x86/mem_sharing: Resolve mm-lock order violations when
 forking VMs with nested p2m
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <253be1190a5cdc452611b3741d852d1c7d2bc8d4.1610025394.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <355cf640-6027-816d-70c5-9a4ed445eb9c@suse.com>
Date: Thu, 7 Jan 2021 14:55:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <253be1190a5cdc452611b3741d852d1c7d2bc8d4.1610025394.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07.01.2021 14:23, Tamas K Lengyel wrote:
> Several lock-order violations have been encountered while attempting to fork
> VMs with nestedhvm=1 set. This patch resolves the issues.
> 
> The order violations stems from a call to p2m_flush_nestedp2m being performed
> whenever the hostp2m changes. This functions always takes the p2m lock for the
> nested_p2m. However, with sharing the p2m locks always have to be taken before
> the sharing lock. To resolve this issue we avoid taking the sharing lock where
> possible (and was actually unecessary to begin with). But we also make
> p2m_flush_nestedp2m aware that the p2m lock may have already been taken and
> preemptively take all nested_p2m locks before unsharing a page where taking the
> sharing lock is necessary.
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

