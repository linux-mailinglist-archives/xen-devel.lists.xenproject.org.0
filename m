Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E6FAB313D
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 10:12:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980950.1367340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEOHE-0007dw-BY; Mon, 12 May 2025 08:12:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980950.1367340; Mon, 12 May 2025 08:12:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEOHE-0007bN-8Q; Mon, 12 May 2025 08:12:44 +0000
Received: by outflank-mailman (input) for mailman id 980950;
 Mon, 12 May 2025 08:12:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uEOHD-0007bH-9S
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 08:12:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uEOHC-0046GR-2R;
 Mon, 12 May 2025 08:12:42 +0000
Received: from [2a02:8012:3a1:0:e418:e534:35e5:729f]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uEOHC-00HBB7-16;
 Mon, 12 May 2025 08:12:42 +0000
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
	bh=wMhMM3mFYIBgz1H0tcaMRxSBgo0nSNRZ2Pqjuhy1X5U=; b=MSUAKWBosAg7rV2hHbdsReOfFX
	5MIg+/gYFffWAQHmGMOxZkiPkelE30tEYi/SAz+JpmKi01wVLlWlfJoQjvcHFBnwHZbTJwAAWhhGN
	2fcbnqrbLB8+Kh0R76h+ktrQqmGnLrWSFDI3n/20pyw4HSs6PYmp1a+ogM/xvrXp8Rqk=;
Message-ID: <97909432-2199-4d57-98bf-3aaa373a46bf@xen.org>
Date: Mon, 12 May 2025 09:12:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/bitmap: Drop unused headers
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250510131245.3062123-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250510131245.3062123-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 10/05/2025 14:12, Andrew Cooper wrote:
> Nothing in bitmap.h uses lib.h.  Reduce to just macros.h and string.h.  Drop
> types.h while at it, as it comes in through bitops.h
> 
> cpumask.h and nodemask.h only include kernel.h to get container_of().  Move it
> into macros.h where it belongs.

The wording implies that container_of() will be moved as-is (barring 
coding style). However...

[...]

> -/**
> - * container_of - cast a member of a structure out to the containing structure
> - *
> - * @ptr:	the pointer to the member.
> - * @type:	the type of the container struct this is embedded in.
> - * @member:	the name of the member within the struct.
> - *
> - */
> -#define container_of(ptr, type, member) ({                      \
> -        typeof_field(type, member) *__mptr = (ptr);             \
> -        (type *)( (char *)__mptr - offsetof(type,member) );})
> -

I see the cast was switch from "char *" to ...

>   /**
>    * __struct_group() - Create a mirrored named and anonyomous struct
>    *
> diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
> index cd528fbdb127..58affb1588c5 100644
> --- a/xen/include/xen/macros.h
> +++ b/xen/include/xen/macros.h
> @@ -102,6 +102,19 @@
>    */
>   #define sizeof_field(type, member) sizeof(((type *)NULL)->member)
>   
> +/**
> + * container_of - cast a member of a structure out to the containing structure
> + *
> + * @ptr:	the pointer to the member.
> + * @type:	the type of the container struct this is embedded in.
> + * @member:	the name of the member within the struct.
> + */
> +#define container_of(ptr, type, member)                         \
> +    ({                                                          \
> +        typeof_field(type, member) *__mptr = (ptr);             \
> +        (type *)((void *)__mptr - offsetof(type, member));      \

... "void *". AFAICT, this is doesn't change anything. However, I think 
it is worth mentioning in the commit message to show this was intended.

With that:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


