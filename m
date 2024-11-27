Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEB19DA691
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 12:09:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844703.1260188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGFv0-0006ak-Fe; Wed, 27 Nov 2024 11:09:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844703.1260188; Wed, 27 Nov 2024 11:09:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGFv0-0006Yz-D6; Wed, 27 Nov 2024 11:09:14 +0000
Received: by outflank-mailman (input) for mailman id 844703;
 Wed, 27 Nov 2024 11:09:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGFuz-0006Yt-OM
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 11:09:13 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 068abccc-acb0-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 12:09:09 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9e8522445dso919427166b.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2024 03:09:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b2f5322sm695483066b.70.2024.11.27.03.09.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2024 03:09:08 -0800 (PST)
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
X-Inumbo-ID: 068abccc-acb0-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzQiLCJoZWxvIjoibWFpbC1lajEteDYzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjA2OGFiY2NjLWFjYjAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNzA1NzQ5Ljc0NTMyMiwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732705749; x=1733310549; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DtWUoEJJOTp5dtyTI9bQHOGqEU/+GJdQOs9wTNXQv9o=;
        b=gc5cRh656CFDhnc+q8N5cyYWLMjRalrO3RUqYV/R+2izYh39lrCOVC5GeFdCSydV32
         eYp2DQx+RKw1FuVfnE8oy9NTSercaosQizuhM4f8fhd6sId2HzYYgvkRVDR4o3jOamFn
         WkPzmpkXg/+O5XGBvIAj9wMzQKurBHm57Fo4fx0DibRpKXEWL1OjV68CBK3p5UnlAkxi
         SVNyY2tIAxkf3YO3jrl6dMH2M4glhuxdMKQWKg2CSeEna6vTBFBqo5Ed35ClNBTLrnV4
         BqPhN7/exfzTXH5BYQe3z6Kb03/MACivkMKH6s4tZXDLXCsmhaU/zd8053zWSD/32/sm
         WMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705749; x=1733310549;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtWUoEJJOTp5dtyTI9bQHOGqEU/+GJdQOs9wTNXQv9o=;
        b=OD0L1EimIcHdolpGQG8eAT6Pt6pfC+97DjbebZQCcyBd4F4mu1clJY1Kra1aqsvjNw
         ZVrFMp50GP4SBM4DnXk94UmDhIC5uwdPpvbmf6ndt8yqMkLepoiGLWvFeaVjwEkmpY9o
         xgIHka2nQ44o90dgp946/Tzc8jRT3K451GDyMjGIlqkFGK3zsRR2Ipxs2wGDxU+Elw8w
         7XVEBjuULhwICBUr0jJDm0YqsOVLVefwGlLfyiEe75XUXL2kpstrSBEaaWs8D99TgvBP
         gE4mbL0687TeZLO6fW+fQg3NNtj9S//pn6jcuKyBQPAZawVxqZMSuvySZId1GPbGaqdy
         wvwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZiNR6E3IDe0HqEztFxFNNIGWcSyncgaTVMTIZJXvp+OGIrT3AJnpo0mIls60/kOGOmtqajEbe7hg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIr6P3Bxa/Yh1jsobLv+gOM6PUQnm8LovTCC9VYklUrG+KK3FD
	KvHdxxY92N3deBj059HarzMFCe1qI/jt5da/WEjza34zQVM5M+Q6l+CP3eQ7fg==
X-Gm-Gg: ASbGncsfjZILHJpN3osN0wOCtXHTO/Unvm1zXZEYSNBM3npCax17mYhjJ0z++MRZDYK
	VCixP7lHkmT04eR1Jbe5j+wW/Ziqq+/UD4uje0sQf1ObR5eCNoEHTkhwRt3XrXWGBuBnL0eZ9vQ
	wj51MNJviVPQaZ6SPVJluUlhxTy/gmBJ+CuGSEF2U3V7okbLEkOs8DUP3htWNChE2a6j3Ycg5qJ
	T4Bx3COMfqa6oXv/zGaUjBx75rTUqnB58oQN4ixAqbqlI+IfuiLTm8EtmmVhZsJ//3GwD0lx3qw
	K+8Wad7QTQvZu+/ZU8uWrGQgjnYo2L5f4+4=
X-Google-Smtp-Source: AGHT+IF1PVTI+Wx/U8AxtylbHPk9jL2YQQRT09KP25tOCwZSTdt7iI9C52lrqybaLv3+6UpUreBnAg==
X-Received: by 2002:a17:906:dc95:b0:a99:543e:94b4 with SMTP id a640c23a62f3a-aa58108aa8cmr218534866b.56.1732705749188;
        Wed, 27 Nov 2024 03:09:09 -0800 (PST)
Message-ID: <0e3ddfc0-af52-4127-a130-76299101f6ec@suse.com>
Date: Wed, 27 Nov 2024 12:09:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm32: Get rid of __memzero()
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20241127105512.88703-1-julien@xen.org>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20241127105512.88703-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.11.2024 11:55, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> All the code in arch/arm32/lib/ where copied from Linux 3.16
> and never re-synced since then.
> 
> A few years ago, Linux got rid of __memzero() because the implementation
> is very similar to memset(p,0,n) and the current use of __memzero()
> interferes with optimization. See full commit message from Linux below.
> 
> So it makes sense to get rid of __memzero in Xen as well.
> 
>     From ff5fdafc9e9702846480e0cea55ba861f72140a2 Mon Sep 17 00:00:00 2001
>     From: Nicolas Pitre <nicolas.pitre@linaro.org>
>     Date: Fri, 19 Jan 2018 18:17:46 +0100
>     Subject: [PATCH] ARM: 8745/1: get rid of __memzero()
> 
>     The __memzero assembly code is almost identical to memset's except for
>     two orr instructions. The runtime performance of __memset(p, n) and
>     memset(p, 0, n) is accordingly almost identical.
> 
>     However, the memset() macro used to guard against a zero length and to
>     call __memzero at compile time when the fill value is a constant zero
>     interferes with compiler optimizations.
> 
>     Arnd found tha the test against a zero length brings up some new
>     warnings with gcc v8:
> 
>       https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82103
> 
>     And successively rremoving the test against a zero length and the call
>     to __memzero optimization produces the following kernel sizes for
>     defconfig with gcc 6:
> 
>         text     data     bss       dec       hex  filename
>     12248142  6278960  413588  18940690   1210312  vmlinux.orig
>     12244474  6278960  413588  18937022   120f4be  vmlinux.no_zero_test
>     12239160  6278960  413588  18931708   120dffc  vmlinux.no_memzero
> 
>     So it is probably not worth keeping __memzero around given that the
>     compiler can do a better job at inlining trivial memset(p,0,n) on its
>     own. And the memset code already handles a zero length just fine.
> 
>     Suggested-by: Arnd Bergmann <arnd@arndb.de>
>     Signed-off-by: Nicolas Pitre <nico@linaro.org>
>     Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>     Acked-by: Arnd Bergmann <arnd@arndb.de>
>     Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> 
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git ff5fdafc9e97
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with a suggestion:

> --- a/xen/arch/arm/README.LinuxPrimitives
> +++ b/xen/arch/arm/README.LinuxPrimitives
> @@ -108,10 +108,9 @@ linux/arch/arm/lib/memchr.S             xen/arch/arm/arm32/lib/memchr.S
>  linux/arch/arm/lib/memcpy.S             xen/arch/arm/arm32/lib/memcpy.S
>  linux/arch/arm/lib/memmove.S            xen/arch/arm/arm32/lib/memmove.S
>  linux/arch/arm/lib/memset.S             xen/arch/arm/arm32/lib/memset.S
> -linux/arch/arm/lib/memzero.S            xen/arch/arm/arm32/lib/memzero.S
>  
>  for i in copy_template.S memchr.S memcpy.S memmove.S memset.S \
> -         memzero.S ; do
> +        ; do
>      diff -u linux/arch/arm/lib/$i xen/arch/arm/arm32/lib/$i
>  done

Also do away with the line continuation at the same time? E.g.

for i in copy_template.S memchr.S memcpy.S memmove.S memset.S; do
    diff -u linux/arch/arm/lib/$i xen/arch/arm/arm32/lib/$i
done

or

for i in copy_template.S memchr.S memcpy.S memmove.S memset.S
do
    diff -u linux/arch/arm/lib/$i xen/arch/arm/arm32/lib/$i
done

?

Jan

