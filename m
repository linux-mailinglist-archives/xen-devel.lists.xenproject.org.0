Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 511547B2F28
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 11:29:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610471.949889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm9nm-0006Q1-8L; Fri, 29 Sep 2023 09:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610471.949889; Fri, 29 Sep 2023 09:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm9nm-0006NS-51; Fri, 29 Sep 2023 09:28:50 +0000
Received: by outflank-mailman (input) for mailman id 610471;
 Fri, 29 Sep 2023 09:28:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fe2t=FN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qm9nk-0006NM-NC
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 09:28:48 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9733b2eb-5eaa-11ee-878b-cb3800f73035;
 Fri, 29 Sep 2023 11:28:47 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-406618d0992so377835e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 Sep 2023 02:28:47 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 u1-20020adfed41000000b003247d3e5d99sm2073784wro.55.2023.09.29.02.28.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Sep 2023 02:28:46 -0700 (PDT)
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
X-Inumbo-ID: 9733b2eb-5eaa-11ee-878b-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695979726; x=1696584526; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gMDLHMVgoYbOdpdm2cv/nAe98keOQzBHp6Q/s1TSvfM=;
        b=h3kj0AeMl67r/G4xY8GGnBLQYfqDB7BMBeNkV4hYtcmEu272jLxjskMSpYFaf3oRf4
         Rnr813u1wXPEFt/DV8taw+qDF03gvC00lq+jwTLo9/osbbU3uAXCJ+tvBG/dhqWwkgwZ
         UQqROifzCukZiJubVLa6U1eqP3IwgtQvyTvvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695979726; x=1696584526;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gMDLHMVgoYbOdpdm2cv/nAe98keOQzBHp6Q/s1TSvfM=;
        b=GC2O4/BjE0VWMDwsCMxk+D9Y3iT+njuY01OW/OGB5BI/vQaengxjhdptoV03aNi9Yg
         chr5Fp1zMxIFLvHJIPAeSjhmT9gljELdaM8PoMrfwlzrAzoBfgPMsuLXb0wFGb9glMlp
         LkHGg/crvZK/vDrf7oqnCs6KdHsU8rJ7bQkkC4a0H4ogeCgD4JwyFYRDD0raPXGIAaMi
         0K8C8oWc8kz6Te+leH4SjjSMxbb0NP+3xJksmvMEuilBu/gUmdpmtNTE1Uf8tvrnd0Xv
         sg/sL6EozVva/svq0cvlRfoDh+4aC8B3/FCQSnV2FZ19RiyK7FssBTOj50ntnuk8OKsi
         yI7w==
X-Gm-Message-State: AOJu0Yw4HhaghItjVJmZK1d/+D5V8hMVwqffTlhWof4u14YrrxtK6j1+
	5VNQpjdaIgnH5UN/YNCJd+1g+g==
X-Google-Smtp-Source: AGHT+IHWWxd370tGTCgbkbbcaftSsY3Hfwt+KwapyEMeqi+RlInxERSNxnie9UWowRox+hXx+/2rDQ==
X-Received: by 2002:a5d:50c9:0:b0:317:64f4:5536 with SMTP id f9-20020a5d50c9000000b0031764f45536mr3190210wrt.44.1695979726439;
        Fri, 29 Sep 2023 02:28:46 -0700 (PDT)
Message-ID: <dc966303-6b94-4b82-8b66-4c55bc325449@citrix.com>
Date: Fri, 29 Sep 2023 10:28:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/ppc: Add .text.exceptions section for exception
 vectors
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Jan Beulich <jbeulich@suse.com>, Henry Wang <Henry.Wang@arm.com>
References: <cover.1695942864.git.sanastasio@raptorengineering.com>
 <de5b99d79671a7fe11c5720797aaa6e3207661d1.1695942864.git.sanastasio@raptorengineering.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <de5b99d79671a7fe11c5720797aaa6e3207661d1.1695942864.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/09/2023 12:19 am, Shawn Anastasio wrote:
> On Power, the exception vectors must lie at a fixed address, depending
> on the state of the Alternate Interrupt Location (AIL) field of the
> Logical Partition Control Register (LPCR). Create a .text.exceptions
> section in the linker script at an address suitable for AIL=3 plus an
> accompanying assertion to pave the way for implementing exception
> support.

Thanks - this is a perfect level of detail as far as I'm concerned as a
PPC novice.

>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
>  xen/arch/ppc/include/asm/config.h | 3 +++
>  xen/arch/ppc/xen.lds.S            | 7 +++++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/xen/arch/ppc/include/asm/config.h b/xen/arch/ppc/include/asm/config.h
> index a11a09c570..e012b75beb 100644
> --- a/xen/arch/ppc/include/asm/config.h
> +++ b/xen/arch/ppc/include/asm/config.h
> @@ -42,6 +42,9 @@
>  
>  #define XEN_VIRT_START _AC(0xc000000000000000, UL)
>  
> +/* Fixed address for start of the section containing exception vectors */
> +#define EXCEPTION_VECTORS_START _AC(0xc000000000000100, UL)

The patch looks fine, but a PPC question.  Does AIL=3 really mean a hard
coded address at 0xc000000000000100 ?

Or is it +0x100 from something else that happens to be programmed to
XEN_VIRT_START ?

> +
>  #define VMAP_VIRT_START (XEN_VIRT_START + GB(1))
>  #define VMAP_VIRT_SIZE  GB(1)
>  
> diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
> index 9e46035155..9e888d7383 100644
> --- a/xen/arch/ppc/xen.lds.S
> +++ b/xen/arch/ppc/xen.lds.S
> @@ -24,6 +24,10 @@ SECTIONS
>          _stext = .;            /* Text section */
>          *(.text.header)
>  
> +        . = ALIGN(256);
> +        _stext_exceptions = .;

If this is really only used for the linker assertion, then it wants to be

    HIDDEN(_stext_exceptions = .);

otherwise the debugging symbols will have _stext_exceptions typically
hiding exc_sysreset in the disassembly and symbol table.

> +        *(.text.exceptions)
> +
>          *(.text.cold)
>          *(.text.unlikely .text.*_unlikely .text.unlikely.*)
>  
> @@ -184,3 +188,6 @@ ASSERT(IS_ALIGNED(__bss_end,        POINTER_ALIGN), "__bss_end is misaligned")
>  
>  ASSERT(!SIZEOF(.got),      ".got non-empty")
>  ASSERT(!SIZEOF(.got.plt),  ".got.plt non-empty")
> +
> +ASSERT(_stext_exceptions == EXCEPTION_VECTORS_START, \
> +       ".text.exceptions not at expected location -- .text.header too big?");

No need for ; at the end, and no need for \ either.

As I said for patch 1, we're now at 4.18-rc1.   Does this need to be
included now, or wait for 4.19?  There's something to be said for having
a basic exception handler, but it is technically a new feature...

~Andrew

