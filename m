Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F66360660
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 12:01:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111007.212158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWynb-0004Ct-Cr; Thu, 15 Apr 2021 10:00:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111007.212158; Thu, 15 Apr 2021 10:00:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWynb-0004CX-9c; Thu, 15 Apr 2021 10:00:35 +0000
Received: by outflank-mailman (input) for mailman id 111007;
 Thu, 15 Apr 2021 10:00:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x7n8=JM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWynZ-0004CS-Ix
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 10:00:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 601d5360-3883-4a65-90f1-342a65b5c9aa;
 Thu, 15 Apr 2021 10:00:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D28EFAC6E;
 Thu, 15 Apr 2021 10:00:31 +0000 (UTC)
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
X-Inumbo-ID: 601d5360-3883-4a65-90f1-342a65b5c9aa
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618480831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ioUWuPsbx/s6giZpQsdPZKdLpDXqGxqPVk3s4U++FZM=;
	b=lvYyWxxTca7lzABZZRnLf80qD52vq2MUYgYt1peLOlUjGi9ScKJjqxFIp3M2X35txeb7rB
	ftKGIwsEqxEiAf+82VFMSJiX2cvY+NDA0BmV2KDQiaqlGi5cB4cJo2MzpIcI5Om3JkZkqr
	hUkbmZ5cDlDYlgt5wMKqGuZyWGi0KQc=
Subject: Ping (x86): [PATCH 01/23] lib: move muldiv64()
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
 <d798d6c4-fbbd-966d-df22-42a22ed6b260@suse.com>
Message-ID: <48621f47-4c7b-a249-014a-9f5bc65abaaf@suse.com>
Date: Thu, 15 Apr 2021 12:00:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <d798d6c4-fbbd-966d-df22-42a22ed6b260@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.04.2021 12:19, Jan Beulich wrote:
> Make this a separate archive member under lib/. While doing so, don't
> move latently broken x86 assembly though: Fix the constraints, such
> that properly extending inputs to 64-bit won't just be a side effect of
> needing to copy registers, and such that we won't fail to clobber %rdx.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

While this is a change to common code, there being a specific x86
aspect here I can understand that Julien would prefer to not ack
this without an x86 maintainer having reviewed the change. May I
ask for feedback here, as I'd prefer to commit at least the first
few patches of this series before re-posting the rest.

Thanks, Jan

> --- a/xen/common/lib.c
> +++ b/xen/common/lib.c
> @@ -393,35 +393,6 @@ s64 __ldivmod_helper(s64 a, s64 b, s64 *
>  }
>  #endif /* BITS_PER_LONG == 32 */
>  
> -/* Compute with 96 bit intermediate result: (a*b)/c */
> -uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
> -{
> -#ifdef CONFIG_X86
> -    asm ( "mul %%rdx; div %%rcx" : "=a" (a) : "0" (a), "d" (b), "c" (c) );
> -    return a;
> -#else
> -    union {
> -        uint64_t ll;
> -        struct {
> -#ifdef WORDS_BIGENDIAN
> -            uint32_t high, low;
> -#else
> -            uint32_t low, high;
> -#endif            
> -        } l;
> -    } u, res;
> -    uint64_t rl, rh;
> -
> -    u.ll = a;
> -    rl = (uint64_t)u.l.low * (uint64_t)b;
> -    rh = (uint64_t)u.l.high * (uint64_t)b;
> -    rh += (rl >> 32);
> -    res.l.high = rh / c;
> -    res.l.low = (((rh % c) << 32) + (rl & 0xffffffff)) / c;
> -    return res.ll;
> -#endif
> -}
> -
>  /*
>   * Local variables:
>   * mode: C
> --- a/xen/lib/Makefile
> +++ b/xen/lib/Makefile
> @@ -4,6 +4,7 @@ lib-y += bsearch.o
>  lib-y += ctors.o
>  lib-y += ctype.o
>  lib-y += list-sort.o
> +lib-y += muldiv64.o
>  lib-y += parse-size.o
>  lib-y += rbtree.o
>  lib-y += sort.o
> --- /dev/null
> +++ b/xen/lib/muldiv64.c
> @@ -0,0 +1,44 @@
> +#include <xen/lib.h>
> +
> +/* Compute with 96 bit intermediate result: (a*b)/c */
> +uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
> +{
> +#ifdef CONFIG_X86
> +    asm ( "mulq %1; divq %2" : "+a" (a)
> +                             : "rm" ((uint64_t)b), "rm" ((uint64_t)c)
> +                             : "rdx" );
> +
> +    return a;
> +#else
> +    union {
> +        uint64_t ll;
> +        struct {
> +#ifdef WORDS_BIGENDIAN
> +            uint32_t high, low;
> +#else
> +            uint32_t low, high;
> +#endif
> +        } l;
> +    } u, res;
> +    uint64_t rl, rh;
> +
> +    u.ll = a;
> +    rl = (uint64_t)u.l.low * (uint64_t)b;
> +    rh = (uint64_t)u.l.high * (uint64_t)b;
> +    rh += (rl >> 32);
> +    res.l.high = rh / c;
> +    res.l.low = (((rh % c) << 32) + (rl & 0xffffffff)) / c;
> +
> +    return res.ll;
> +#endif
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> 
> 


