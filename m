Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DAC8548E0
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 13:02:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680677.1058725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDy0-0005gE-A4; Wed, 14 Feb 2024 12:02:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680677.1058725; Wed, 14 Feb 2024 12:02:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDy0-0005eN-7O; Wed, 14 Feb 2024 12:02:20 +0000
Received: by outflank-mailman (input) for mailman id 680677;
 Wed, 14 Feb 2024 12:02:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1raDxy-0005eH-BK
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 12:02:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1raDxy-0002Ab-54; Wed, 14 Feb 2024 12:02:18 +0000
Received: from [15.248.2.25] (helo=[10.24.67.29])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1raDxx-0006Lh-TW; Wed, 14 Feb 2024 12:02:18 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=YRM/j+EA91QLN+z8xGAnc5ab9MB8UUZAVjVKosB1qus=; b=54PH/F8O8KJeuElzWEZahHU/Nd
	wW8LIxFepqRis+nSmkltT/h+8B4EV3DcsXKxCHnOCo9PqM5oeTkh+vRK5DfafHzmX+amwCnS5xCPV
	IUPv68/gsmgg5QYSRsvtgX7T4gmSmYjpeU+ji2D0avZmUMs3yy8U8nSWB5EZl4N0pP2I=;
Message-ID: <aa89e2b8-7251-4cd4-a2f9-cfb32a642af3@xen.org>
Date: Wed, 14 Feb 2024 12:02:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] mm: add the __must_check attribute to {gfn,mfn}_add()
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20240214103741.16189-1-roger.pau@citrix.com>
 <20240214103741.16189-6-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240214103741.16189-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 14/02/2024 10:37, Roger Pau Monne wrote:
> It's not obvious from the function itself whether the incremented value will be
> stored in the parameter, or returned to the caller.  That has leads to bugs in
> the past as callers assume the incremented value is stored in the parameter.
> 
> Add the __must_check attribute to the function to easily spot callers that
> don't consume the returned value, which signals an error in the caller logic.

I like the patch. We should add more __must_check in the code :). I 
think ECLAIR will also help us to spot any place where we don't use the 
returned value.

> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
>   xen/include/xen/mm-frame.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/include/xen/mm-frame.h b/xen/include/xen/mm-frame.h
> index 922ae418807a..c25e836f255a 100644
> --- a/xen/include/xen/mm-frame.h
> +++ b/xen/include/xen/mm-frame.h
> @@ -23,7 +23,7 @@ TYPE_SAFE(unsigned long, mfn);
>   #undef mfn_x
>   #endif
>   
> -static inline mfn_t mfn_add(mfn_t mfn, unsigned long i)
> +static inline mfn_t __must_check mfn_add(mfn_t mfn, unsigned long i)
>   {
>       return _mfn(mfn_x(mfn) + i);
>   }
> @@ -62,7 +62,7 @@ TYPE_SAFE(unsigned long, gfn);
>   #undef gfn_x
>   #endif
>   
> -static inline gfn_t gfn_add(gfn_t gfn, unsigned long i)
> +static inline gfn_t __must_check gfn_add(gfn_t gfn, unsigned long i)
>   {
>       return _gfn(gfn_x(gfn) + i);
>   }

Cheers,

-- 
Julien Grall

