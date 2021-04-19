Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E7C36478A
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 17:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113077.215481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYWFL-0000fS-63; Mon, 19 Apr 2021 15:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113077.215481; Mon, 19 Apr 2021 15:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYWFL-0000f3-2e; Mon, 19 Apr 2021 15:55:35 +0000
Received: by outflank-mailman (input) for mailman id 113077;
 Mon, 19 Apr 2021 15:55:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lYWFJ-0000ex-FC
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 15:55:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f50f4fd-a19b-4a08-a9db-bc182e882eef;
 Mon, 19 Apr 2021 15:55:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 224A9AF35;
 Mon, 19 Apr 2021 15:55:32 +0000 (UTC)
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
X-Inumbo-ID: 4f50f4fd-a19b-4a08-a9db-bc182e882eef
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618847732; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RYCU9eeifG8uo6Ntpdp3zFmbaF9Ujr1GBSnf+RV8s6w=;
	b=odVmxvd2kDYAM+CMK7z/+jxQak80kW4eO+Dex5pz1frCxa7oBdfPNnVajfbbYD7iNe5xd9
	7QmBDfC1hhGLoyz61mrXPpknWnCbRRUpvnl6sGxUbxGQpmBeP6yDic8IjyEK+qbgsnCIHB
	tranmfur/4+fICKiysRGNBUGGCh+lmc=
Subject: Re: [PATCH] x86/shim: Simplify compat handling in write_start_info()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210419144524.32608-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a048d155-085d-b942-40cc-00624b5bbd11@suse.com>
Date: Mon, 19 Apr 2021 17:55:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210419144524.32608-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.04.2021 16:45, Andrew Cooper wrote:
> Factor out a compat boolean to remove the lfence overhead from multiple
> is_pv_32bit_domain() calls.
> 
> For a compat guest, the upper 32 bits of rdx are zero, so there is no need to
> have any conditional logic at all when mapping the start info page.

Iirc the contents of the upper halves hold unspecified contents after
a switch from compat to 64-bit mode. Therefore only with this part of
the change dropped ...

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

