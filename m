Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F6F367FF0
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 14:01:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115340.219973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZY1Z-0002st-8P; Thu, 22 Apr 2021 12:01:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115340.219973; Thu, 22 Apr 2021 12:01:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZY1Z-0002sU-4h; Thu, 22 Apr 2021 12:01:37 +0000
Received: by outflank-mailman (input) for mailman id 115340;
 Thu, 22 Apr 2021 12:01:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZY1X-0002sP-8L
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 12:01:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 453c8495-831f-4500-813c-fcee4237b7fb;
 Thu, 22 Apr 2021 12:01:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B0C59AECB;
 Thu, 22 Apr 2021 12:01:33 +0000 (UTC)
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
X-Inumbo-ID: 453c8495-831f-4500-813c-fcee4237b7fb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619092893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jfmllAJETuTJI8/yiNsCHOA7bOf90gyg5EtanQuwziw=;
	b=HurDBztcKkhDLGYLAsYBu3Ut/igzBtFedujPiE+/JKFpIL3MONZcEBA1iMV3nPHUGCOANt
	sYcFlGj1mgpLOlcN5W+9EbYqlYfFV34KyPh2JHqf2433DwvSBPs4e5yjCGcYmG9Ri5HI0b
	9pRkRnhwB3Y1ujL+XMw0RoL5eSYWJjA=
Subject: Re: [PATCH v10 02/13] x86/mm: switch to new APIs in map_pages_to_xen
To: Hongyan Xia <hx242@xen.org>
Cc: jgrall@amazon.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1619014052.git.hongyxia@amazon.com>
 <f8a422d4da4a93cd9b2f788c4594a1efe82bf389.1619014052.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <31581ebc-0afd-f856-1937-7a8e0b5022a5@suse.com>
Date: Thu, 22 Apr 2021 14:01:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <f8a422d4da4a93cd9b2f788c4594a1efe82bf389.1619014052.git.hongyxia@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.04.2021 16:15, Hongyan Xia wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> Page tables allocated in that function should be mapped and unmapped
> now.
> 
> Take the opportunity to avoid a potential double map in
> map_pages_to_xen() by initialising pl1e to NULL and only map it if it
> was not mapped earlier.
> 
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


