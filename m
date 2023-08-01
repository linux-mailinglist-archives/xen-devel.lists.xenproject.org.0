Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E798D76B9F1
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 18:51:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574438.899698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQsa1-0006cR-Gx; Tue, 01 Aug 2023 16:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574438.899698; Tue, 01 Aug 2023 16:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQsa1-0006ao-DV; Tue, 01 Aug 2023 16:50:41 +0000
Received: by outflank-mailman (input) for mailman id 574438;
 Tue, 01 Aug 2023 16:50:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PUJK=DS=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qQsa0-0006ai-EG
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 16:50:40 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a0748e9-308b-11ee-b25c-6b7b168915f2;
 Tue, 01 Aug 2023 18:50:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4790682855CD;
 Tue,  1 Aug 2023 11:50:36 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id dxiFkFjZgdqP; Tue,  1 Aug 2023 11:50:35 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 0F1B38285615;
 Tue,  1 Aug 2023 11:50:35 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id B0wLQ-t1NMT0; Tue,  1 Aug 2023 11:50:34 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 5030D82855CD;
 Tue,  1 Aug 2023 11:50:34 -0500 (CDT)
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
X-Inumbo-ID: 8a0748e9-308b-11ee-b25c-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 0F1B38285615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1690908635; bh=O0CDEXKqIDdnsT6c++fa+0YtT9ok5dHmC7fBHzW1hdc=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=dCtPdWOdKJzuqfNh8AmUcTG/EeZ5h3/fG4LjPiJlPGAOx0+R8rYTGtWjckovFgBsn
	 DRPrxRaWMD8wiT+Mhpu+nqvPhHpfIskOJiJesSZVLeGDMBqvmqcXkp0HvjIkIgKpeq
	 75RI3lCpkShe6kC7tNdjFj+4Dq+HqJLGs1F/dUZo=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <56795c25-1b81-32d3-e839-a3331c1922a4@raptorengineering.com>
Date: Tue, 1 Aug 2023 11:50:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] common: move simple_strto{,u}l{,l}() to lib/
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <4ba63342-6200-1f76-bf63-8df62e8955a4@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <4ba63342-6200-1f76-bf63-8df62e8955a4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/1/23 5:34 AM, Jan Beulich wrote:
> Convert style from a Xen/Linux mix to pure Xen while doing the move. No
> other changes, despite having been heavily tempted to do some - at the
> very least to make simple_strtoul() and simple_strtoull() the same in
> how they deal with non-numeric digits.
> 
> Requested-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Further changes I was considering:
> - "value" doesn't need to be unsigned long, and even less so unsigned
>   long long,
> - strtoull.c could simply include strtoul.c, after #define-ing "long"
>   to "long long" and "simple_strtoul" to "simple_strtoull",
> - "else if ( base == 16 )" wants folding with its inner if().
> 
> --- a/xen/common/vsprintf.c
> +++ b/xen/common/vsprintf.c
> @@ -24,108 +24,6 @@
>  #include <asm/div64.h>
>  #include <asm/page.h>
>  
> -/**
> - * simple_strtoul - convert a string to an unsigned long
> - * @cp: The start of the string
> - * @endp: A pointer to the end of the parsed string will be placed here
> - * @base: The number base to use
> - */
> -unsigned long simple_strtoul(
> -    const char *cp, const char **endp, unsigned int base)
> -{
> -    unsigned long result = 0,value;
> -
> -    if (!base) {
> -        base = 10;
> -        if (*cp == '0') {
> -            base = 8;
> -            cp++;
> -            if ((toupper(*cp) == 'X') && isxdigit(cp[1])) {
> -                cp++;
> -                base = 16;
> -            }
> -        }
> -    } else if (base == 16) {
> -        if (cp[0] == '0' && toupper(cp[1]) == 'X')
> -            cp += 2;
> -    }
> -    while (isxdigit(*cp) &&
> -           (value = isdigit(*cp) ? *cp-'0' : toupper(*cp)-'A'+10) < base) {
> -        result = result*base + value;
> -        cp++;
> -    }
> -    if (endp)
> -        *endp = cp;
> -    return result;
> -}
> -
> -EXPORT_SYMBOL(simple_strtoul);
> -
> -/**
> - * simple_strtol - convert a string to a signed long
> - * @cp: The start of the string
> - * @endp: A pointer to the end of the parsed string will be placed here
> - * @base: The number base to use
> - */
> -long simple_strtol(const char *cp, const char **endp, unsigned int base)
> -{
> -    if(*cp=='-')
> -        return -simple_strtoul(cp+1,endp,base);
> -    return simple_strtoul(cp,endp,base);
> -}
> -
> -EXPORT_SYMBOL(simple_strtol);
> -
> -/**
> - * simple_strtoull - convert a string to an unsigned long long
> - * @cp: The start of the string
> - * @endp: A pointer to the end of the parsed string will be placed here
> - * @base: The number base to use
> - */
> -unsigned long long simple_strtoull(
> -    const char *cp, const char **endp, unsigned int base)
> -{
> -    unsigned long long result = 0,value;
> -
> -    if (!base) {
> -        base = 10;
> -        if (*cp == '0') {
> -            base = 8;
> -            cp++;
> -            if ((toupper(*cp) == 'X') && isxdigit(cp[1])) {
> -                cp++;
> -                base = 16;
> -            }
> -        }
> -    } else if (base == 16) {
> -        if (cp[0] == '0' && toupper(cp[1]) == 'X')
> -            cp += 2;
> -    }
> -    while (isxdigit(*cp) && (value = isdigit(*cp) ? *cp-'0' : (islower(*cp)
> -                                                               ? toupper(*cp) : *cp)-'A'+10) < base) {
> -        result = result*base + value;
> -        cp++;
> -    }
> -    if (endp)
> -        *endp = cp;
> -    return result;
> -}
> -
> -EXPORT_SYMBOL(simple_strtoull);
> -
> -/**
> - * simple_strtoll - convert a string to a signed long long
> - * @cp: The start of the string
> - * @endp: A pointer to the end of the parsed string will be placed here
> - * @base: The number base to use
> - */
> -long long simple_strtoll(const char *cp,const char **endp,unsigned int base)
> -{
> -    if(*cp=='-')
> -        return -simple_strtoull(cp+1,endp,base);
> -    return simple_strtoull(cp,endp,base);
> -}
> -
>  static int skip_atoi(const char **s)
>  {
>      int i=0;
> --- a/xen/lib/Makefile
> +++ b/xen/lib/Makefile
> @@ -28,6 +28,10 @@ lib-y += strrchr.o
>  lib-y += strsep.o
>  lib-y += strspn.o
>  lib-y += strstr.o
> +lib-y += strtol.o
> +lib-y += strtoll.o
> +lib-y += strtoul.o
> +lib-y += strtoull.o
>  lib-$(CONFIG_X86) += xxhash32.o
>  lib-$(CONFIG_X86) += xxhash64.o
>  
> --- /dev/null
> +++ b/xen/lib/strtol.c
> @@ -0,0 +1,28 @@
> +/*
> + *  Copyright (C) 1991, 1992  Linus Torvalds
> + */
> +
> +#include <xen/lib.h>
> +
> +/**
> + * simple_strtol - convert a string to a signed long
> + * @cp: The start of the string
> + * @endp: A pointer to the end of the parsed string will be placed here
> + * @base: The number base to use
> + */
> +long simple_strtol(const char *cp, const char **endp, unsigned int base)
> +{
> +    if ( *cp == '-' )
> +        return -simple_strtoul(cp + 1, endp, base);
> +    return simple_strtoul(cp, endp, base);
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
> --- /dev/null
> +++ b/xen/lib/strtoll.c
> @@ -0,0 +1,28 @@
> +/*
> + *  Copyright (C) 1991, 1992  Linus Torvalds
> + */
> +
> +#include <xen/lib.h>
> +
> +/**
> + * simple_strtoll - convert a string to a signed long long
> + * @cp: The start of the string
> + * @endp: A pointer to the end of the parsed string will be placed here
> + * @base: The number base to use
> + */
> +long long simple_strtoll(const char *cp, const char **endp, unsigned int base)
> +{
> +    if ( *cp == '-' )
> +        return -simple_strtoull(cp + 1, endp, base);
> +    return simple_strtoull(cp, endp, base);
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
> --- /dev/null
> +++ b/xen/lib/strtoul.c
> @@ -0,0 +1,61 @@
> +/*
> + *  Copyright (C) 1991, 1992  Linus Torvalds
> + */
> +
> +#include <xen/ctype.h>
> +#include <xen/lib.h>
> +
> +/**
> + * simple_strtoul - convert a string to an unsigned long
> + * @cp: The start of the string
> + * @endp: A pointer to the end of the parsed string will be placed here
> + * @base: The number base to use
> + */
> +unsigned long simple_strtoul(
> +    const char *cp, const char **endp, unsigned int base)
> +{
> +    unsigned long result = 0, value;
> +
> +    if ( !base )
> +    {
> +        base = 10;
> +        if ( *cp == '0' )
> +        {
> +            base = 8;
> +            cp++;
> +            if ( (toupper(*cp) == 'X') && isxdigit(cp[1]) )
> +            {
> +                cp++;
> +                base = 16;
> +            }
> +        }
> +    }
> +    else if ( base == 16 )
> +    {
> +        if ( cp[0] == '0' && toupper(cp[1]) == 'X' )
> +            cp += 2;
> +    }
> +
> +    while ( isxdigit(*cp) &&
> +            (value = isdigit(*cp) ? *cp - '0'
> +                                  : toupper(*cp) - 'A' + 10) < base )
> +    {
> +        result = result * base + value;
> +        cp++;
> +    }
> +
> +    if ( endp )
> +        *endp = cp;
> +
> +    return result;
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
> --- /dev/null
> +++ b/xen/lib/strtoull.c
> @@ -0,0 +1,62 @@
> +/*
> + *  Copyright (C) 1991, 1992  Linus Torvalds
> + */
> +
> +#include <xen/ctype.h>
> +#include <xen/lib.h>
> +
> +/**
> + * simple_strtoull - convert a string to an unsigned long long
> + * @cp: The start of the string
> + * @endp: A pointer to the end of the parsed string will be placed here
> + * @base: The number base to use
> + */
> +unsigned long long simple_strtoull(
> +    const char *cp, const char **endp, unsigned int base)
> +{
> +    unsigned long long result = 0, value;
> +
> +    if ( !base )
> +    {
> +        base = 10;
> +        if ( *cp == '0' )
> +        {
> +            base = 8;
> +            cp++;
> +            if ( (toupper(*cp) == 'X') && isxdigit(cp[1]) )
> +            {
> +                cp++;
> +                base = 16;
> +            }
> +        }
> +    }
> +    else if ( base == 16 )
> +    {
> +        if ( cp[0] == '0' && toupper(cp[1]) == 'X' )
> +            cp += 2;
> +    }
> +
> +    while ( isxdigit(*cp) &&
> +            (value = isdigit(*cp) ? *cp - '0'
> +                                  : (islower(*cp) ? toupper(*cp)
> +                                                  : *cp) - 'A' + 10) < base )
> +    {
> +        result = result * base + value;
> +        cp++;
> +    }
> +
> +    if ( endp )
> +        *endp = cp;
> +
> +    return result;
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

Reviewed-by: Shawn Anastasio <sanastasio@raptorengineering.com>

