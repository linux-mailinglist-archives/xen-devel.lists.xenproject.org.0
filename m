Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5109A324B92
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 08:56:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89637.168993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFBV7-0008FG-Rr; Thu, 25 Feb 2021 07:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89637.168993; Thu, 25 Feb 2021 07:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFBV7-0008Er-OW; Thu, 25 Feb 2021 07:55:57 +0000
Received: by outflank-mailman (input) for mailman id 89637;
 Thu, 25 Feb 2021 07:55:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qWJX=H3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFBV5-0008Em-QO
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 07:55:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 318bbade-817a-444c-956d-03ab6ed3a7cf;
 Thu, 25 Feb 2021 07:55:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A2627ACD9;
 Thu, 25 Feb 2021 07:55:49 +0000 (UTC)
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
X-Inumbo-ID: 318bbade-817a-444c-956d-03ab6ed3a7cf
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614239749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jbKpuDf0o7OZ/JEyCs4U3YPWK3Nnhe4HPGSfszlKtV4=;
	b=FjsJb7d44+Ga3LC6+ou1gbnCdLUyOf64M9bv1vk6TJI/ncUhbzdG9kv6+CVtu5qHHngoRW
	Aapl2zxNpbwzxwXgcYed5Uz3CCyH2EBUqq6/Uw3RNoeDgfF5gdh6jSXxSXvd+8BArBfomP
	nzfx36KcQ0hO+EvlENcAGg4qZvdr96w=
Subject: Re: [PATCH] xen: introduce XENFEAT_direct_mapped and
 XENFEAT_not_direct_mapped
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>,
 andrew.cooper3@citrix.com, julien@xen.org, xen-devel@lists.xenproject.org
References: <20210225012243.28530-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <96d764b6-a719-711c-31ea-235381bfd0ce@suse.com>
Date: Thu, 25 Feb 2021 08:55:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210225012243.28530-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.02.2021 02:22, Stefano Stabellini wrote:
> --- a/xen/include/public/features.h
> +++ b/xen/include/public/features.h
> @@ -114,6 +114,13 @@
>   */
>  #define XENFEAT_linux_rsdp_unrestricted   15
>  
> +/*
> + * A direct-mapped (or 1:1 mapped) domain is a domain for which its
> + * local pages have gfn == mfn.
> + */
> +#define XENFEAT_not_direct_mapped       16
> +#define XENFEAT_direct_mapped           17

Why two new values? Absence of XENFEAT_direct_mapped requires
implying not-direct-mapped by the consumer anyway, doesn't it?

Further, quoting xen/mm.h: "For a non-translated guest which
is aware of Xen, gfn == mfn." This to me implies that PV would
need to get XENFEAT_direct_mapped set; not sure whether this
simply means x86'es is_domain_direct_mapped() is wrong, but if
it is, uses elsewhere in the code would likely need changing.

Also, nit: Please keep the right sides aligned with #define-s
higher up in the file.

Jan

