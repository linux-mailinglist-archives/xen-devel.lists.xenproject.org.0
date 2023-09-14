Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C1D7A0F7E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 23:07:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602734.939464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgtXz-0004gV-Du; Thu, 14 Sep 2023 21:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602734.939464; Thu, 14 Sep 2023 21:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgtXz-0004dk-Ai; Thu, 14 Sep 2023 21:06:47 +0000
Received: by outflank-mailman (input) for mailman id 602734;
 Thu, 14 Sep 2023 21:06:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qgtXy-0004db-0C
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 21:06:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qgtXx-0004vU-0O; Thu, 14 Sep 2023 21:06:45 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qgtXw-0002zC-Pv; Thu, 14 Sep 2023 21:06:44 +0000
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
	bh=8ajguOp4E4Oinn/VMR30oSEBJ+bCppWK4vigMBm4qF4=; b=hZDSdBN70zqWKnsBJ3ACuYFnPU
	2GPJXOWMK55iGFNpntQ3BDkN7bYDCO/NUZk7OW6BRhAelqQfcGGYBbI5ZpH+QLx2n12rETHCvmN7m
	hsGnPQL/a5ZdV+FTbkK/XnOvBzbluGEzGRI4tq4E6q1XjqA182N2w6u0XLn8roZlqmPQ=;
Message-ID: <7b1582d2-8c1f-4694-995c-c92e83590b3a@xen.org>
Date: Thu, 14 Sep 2023 22:06:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] common: assembly entry point type/size annotations
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <bfc597f3-c61c-727a-159a-859f57997d02@suse.com>
 <8ed43968-311e-263b-4dd7-9f8a49a394dc@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8ed43968-311e-263b-4dd7-9f8a49a394dc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 04/08/2023 07:26, Jan Beulich wrote:
> Recent gas versions generate minimalistic Dwarf debug info for items
> annotated as functions and having their sizes specified [1]. Furthermore
> generating live patches wants items properly annotated. "Borrow" Arm's
> END() and (remotely) derive other annotation infrastructure from
> Linux'es, for all architectures to use.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> [1] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=591cc9fbbfd6d51131c0f1d4a92e7893edcc7a28
> ---
> v3: New, generalized from earlier x86-only version. LAST() (now
>      LASTARG()) moved to macros.h.
> ---
> TBD: What to set CODE_ALIGN to by default? Or should we requires arch-es
>       to define that in all cases?

The code alignment is very specific to an architecture. So I think it 
would be better if there are no default.

Otherwise, it will be more difficult for a developper to figure out that 
CODE_ALIGN may need an update.

> 
> TBD: {CODE,DATA}_ALIGN are byte granular, such that a value of 0 can be
>       specified (in case this has some special meaning on an arch;
>       conceivably it could mean to use some kind of arch default). We may
>       not strictly need that, and hence we could also make these power-of
>       -2 values (using .p2align).

I don't have a strong opinion on this one.

> 
> Note that we can't use ALIGN() (in place of SYM_ALIGN()) as long as we
> still have ALIGN.
> 
> Note further that FUNC()'s etc "algn" parameter is intended to allow for
> only no or a single argument. If we wanted to also make the fill value
> customizable per call site, the constructs would need re-doing to some
> degree.
> 
> --- /dev/null
> +++ b/xen/include/xen/linkage.h
> @@ -0,0 +1,56 @@
> +#ifndef __LINKAGE_H__
> +#define __LINKAGE_H__
> +
> +#ifdef __ASSEMBLY__
> +
> +#include <xen/macros.h>
> +
> +#ifndef CODE_ALIGN
> +# define CODE_ALIGN ??
> +#endif
> +#ifndef CODE_FILL
> +# define CODE_FILL ~0
> +#endif

What's the value to allow the architecture to override CODE_FILL and ...

> +
> +#ifndef DATA_ALIGN
> +# define DATA_ALIGN 0
> +#endif
> +#ifndef DATA_FILL
> +# define DATA_FILL ~0
> +#endif

... DATA_FILL?

> +
> +#define SYM_ALIGN(algn...) .balign algn

I find the name 'algn' confusing (not even referring to the missing 
'i'). Why not naming it 'args'?

> +
> +#define SYM_L_GLOBAL(name) .globl name
> +#define SYM_L_WEAK(name)   .weak name
> +#define SYM_L_LOCAL(name)  /* nothing */
> +
> +#define SYM_T_FUNC         STT_FUNC
> +#define SYM_T_DATA         STT_OBJECT
> +#define SYM_T_NONE         STT_NOTYPE

SYM_* will be used only in SYM() below. So why not using STT_* directly?

> +
> +#define SYM(name, typ, linkage, algn...)          \
> +        .type name, SYM_T_ ## typ;                \
> +        SYM_L_ ## linkage(name);                  \
> +        SYM_ALIGN(algn);                          \
> +        name:
> +
> +#define END(name) .size name, . - name
> +
> +#define FUNC(name, algn...) \
> +        SYM(name, FUNC, GLOBAL, LASTARG(CODE_ALIGN, ## algn), CODE_FILL)
> +#define LABEL(name, algn...) \
> +        SYM(name, NONE, GLOBAL, LASTARG(CODE_ALIGN, ## algn), CODE_FILL)
> +#define DATA(name, algn...) \
> +        SYM(name, DATA, GLOBAL, LASTARG(DATA_ALIGN, ## algn), DATA_FILL)

I think the alignment should be explicit for DATA. Otherwise, at least 
on Arm, we would default to 0 which could lead to unaligned access if 
not careful.

> +
> +#define FUNC_LOCAL(name, algn...) \
> +        SYM(name, FUNC, LOCAL, LASTARG(CODE_ALIGN, ## algn), CODE_FILL)
> +#define LABEL_LOCAL(name, algn...) \
> +        SYM(name, NONE, LOCAL, LASTARG(CODE_ALIGN, ## algn), CODE_FILL)
> +#define DATA_LOCAL(name, algn...) \
> +        SYM(name, DATA, LOCAL, LASTARG(DATA_ALIGN, ## algn), DATA_FILL)

Same here.

> +
> +#endif /*  __ASSEMBLY__ */
> +
> +#endif /* __LINKAGE_H__ */
> --- a/xen/include/xen/macros.h
> +++ b/xen/include/xen/macros.h
> @@ -15,6 +15,15 @@
>   #define count_args(args...) \
>       count_args_(., ## args, 8, 7, 6, 5, 4, 3, 2, 1, 0)
>   
> +#define ARG1_(x, y...) (x)
> +#define ARG2_(x, y...) ARG1_(y)
> +#define ARG3_(x, y...) ARG2_(y)
> +#define ARG4_(x, y...) ARG3_(y)
> +
> +#define ARG__(nr) ARG ## nr ## _
> +#define ARG_(nr)  ARG__(nr)
> +#define LASTARG(x, y...) ARG_(count_args(x, ## y))(x, ## y)
> +
>   /* Indirect macros required for expanded argument pasting. */
>   #define PASTE_(a, b) a ## b
>   #define PASTE(a, b) PASTE_(a, b)
> 

Cheers,

-- 
Julien Grall

