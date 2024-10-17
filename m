Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D081D9A2A76
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:13:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820924.1234654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U3q-0002cI-Is; Thu, 17 Oct 2024 17:13:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820924.1234654; Thu, 17 Oct 2024 17:13:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U3q-0002ac-Fs; Thu, 17 Oct 2024 17:13:18 +0000
Received: by outflank-mailman (input) for mailman id 820924;
 Thu, 17 Oct 2024 17:13:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2/Py=RN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t1U3o-0002aT-7M
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:13:16 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17ccb6cc-8cab-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:13:14 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a99f3a5a44cso138745966b.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 10:13:14 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a29844739sm321594766b.171.2024.10.17.10.13.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2024 10:13:12 -0700 (PDT)
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
X-Inumbo-ID: 17ccb6cc-8cab-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729185193; x=1729789993; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IkLHiZ/qjVTDpUeGwLUHZrwXAY+Uv7XRFyXyBc3jX0g=;
        b=M5slW+jgTMMJb4UKPFdiOjn5THr6VRPWF452VUu0iHZdRRtL5zO3WMQ/gqrMdB9kD0
         7cj8U0cF50rXQSmLo3nGNpJpZtQ2l08gxzWCxEi89Vg2Eyv/ZMdK2QXif1dy+solJVvS
         ABLODnnnLcXFB/mZg+gVi5kkT+pQf9KOKC8P4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729185193; x=1729789993;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkLHiZ/qjVTDpUeGwLUHZrwXAY+Uv7XRFyXyBc3jX0g=;
        b=C0uMlyZGGsanlgT65zZ8wx0cgXjgoHhHDwLTWn+wxDl9mVyCkNbEb7F5KT+5rfdNdM
         a5NHvRvDcQn3DJ9F/3W8VP64OdPP+KVWP0cf65CDa6xF/wCBqSzWLBs762+BDhBnkYSt
         0nV9n4L+ag7ydvAG3Eo01et+OMJddg0QC3eQUD+59thq2sS5Bqyi0sc0Ehqm8QLojHdi
         ZcLMeZTmk8pm3HA9aiGguDBotCTm6hc47K5kf6iNLIMGYTZNzkTzNGJCVCY++cRfEhTp
         atCTUomTMJ5gN67n+pnW6UFTycpw+3yot5D/ZIXLQ/80tx1Zj4oORkI+xQATwGO1qvf0
         rstg==
X-Forwarded-Encrypted: i=1; AJvYcCWDikyuYBTQlI+11Trw6Af6TPW1tocDIrQZk1TxR2NsTa/qV85RKwFKCnq5OYM6sq//CKt+2mZyVGQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzdz6c0WKBe3GUGEB6UnPvwY0tgRU2BV+JCG6fydASkiK6J7Aum
	GoENPSznmLogBe3pGI8nEx1kHjH47NQ/xZmnoXxd8Qm3PJOsY7rUlMgQ5BhucVM=
X-Google-Smtp-Source: AGHT+IESP+9oVq28xWQpQuFHl7pEtiaXkQ2oazakehQ3/jNXEDmu/0I7VglDGVIuZdKD9cg3Z03opQ==
X-Received: by 2002:a17:907:d2df:b0:a99:f656:2bd8 with SMTP id a640c23a62f3a-a9a34dd96e5mr694341266b.42.1729185193238;
        Thu, 17 Oct 2024 10:13:13 -0700 (PDT)
Message-ID: <a5745a93-1d82-45f1-bb88-81a737ebcce3@citrix.com>
Date: Thu, 17 Oct 2024 18:13:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] x86/boot: create a C bundle for 32 bit boot code
 and use it
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241017133123.1946204-1-frediano.ziglio@cloud.com>
 <20241017133123.1946204-2-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241017133123.1946204-2-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/10/2024 2:31 pm, Frediano Ziglio wrote:
> The current method to include 32 bit C boot code is:
> - compile each function we want to use into a separate object file;
> - each function is compiled with -fpic option;
> - convert these object files to binary files. This operation removes GOP
>   which we don't want in the executable;
> - a small assembly part in each file add the entry point;
> - code can't have external references, all possible variables are passed
>   by value or pointer;
> - include these binary files in head.S.
>
> There are currently some limitations:
> - code is compiled separately, it's not possible to share a function
>   (like memcpy) between different functions to use;
> - although code is compiled with -fpic there's no certainty there are
>   no relocations, specifically data ones. This can lead into hard to
>   find bugs;
> - it's hard to add a simple function;
> - having to pass external variables makes hard to do multiple things
>   otherwise functions would require a lot of parameters so code would
>   have to be split into multiple functions which is not easy.
>
> Current change extends the current process:
> - all object files are linked together before getting converted making
>   possible to share code between the function we want to call;
> - a single object file is generated with all functions to use and
>   exported symbols to easily call;
> - variables to use are declared in linker script and easily used inside
>   C code. Declaring them manually could be annoying but makes also
>   easier to check them. Using external pointers can be still an issue if
>   they are not fixed. If an external symbol is not declared this gives a
>   link error.
>
> Some details of the implementation:
> - C code is compiled with -fpic flags (as before);
> - object files from C code are linked together;
> - the single bundled object file is linked with 2 slightly different
>   script files to generate 2 bundled object files;
> - the 2 bundled object files are converted to binary removing the need
>   for global offset tables;
> - a Python script is used to generate assembly source from the 2
>   binaries;
> - the single assembly file is compiled to generate final bundled object
>   file;
> - to detect possible unwanted relocation in data/code code is generated
>   with different addresses. This is enforced starting .text section at
>   different positions and adding a fixed "gap" at the beginning.
>   This makes sure code and data is position independent;
> - to detect used symbols in data/code symbols are placed in .text
>   section at different offsets (based on the line in the linker script).
>   This is needed as potentially a reference to a symbol is converted to
>   a reference to the containing section so multiple symbols could be
>   converted to reference to same symbol (section name) and we need to
>   distinguish them;
> - --orphan-handling=error option to linker is used to make sure we
>   account for all possible sections from C code;
>
> Current limitations:
> - the main one is the lack of support for 64 bit code. It would make
>   sure that even the code used for 64 bit (at the moment EFI code) is
>   code and data position independent. We cannot assume that code that
>   came from code compiled for 32 bit and compiled for 64 bit is code and
>   data position independent, different compiler options lead to
>   different code/data.
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

This commit message is not particularly easy to follow.  Can I recommend
the following:

---%<---
x86/boot: Rework how 32bit C is linked/included for early boot

Right now, the two functions which were really too complicated to write
in asm are compiled as 32bit PIC, linked to a blob and included
directly, using global asm() to arrange for them to have function semantics.

This is limiting and fragile; the use of data relocations will compile
fine but malfunction when used, creating hard-to-debug bugs.

Furthermore, we would like to increase the amount of C, to
deduplicate/unify Xen's boot logic, as well as making it easier to
follow.  Therefore, rework how the 32bit objects are included.

Link all 32bit objects together first.  This allows for sharing of logic
between translation units.  Use differential linking and explicit
imports/exports to confirm that we only have the expected relocations,
and write the object back out as an assembly file so it can be linked
again as if it were 64bit, to integrate with the rest of Xen.

This allows for the use of external references (e.g. access to global
variables) with reasonable assurance of doing so safely.

No functional change.
---%<---

which I think is an accurate and more concise summary of what's changing?

> diff --git a/xen/arch/x86/boot/.gitignore b/xen/arch/x86/boot/.gitignore
> index a379db7988..7e85549751 100644
> --- a/xen/arch/x86/boot/.gitignore
> +++ b/xen/arch/x86/boot/.gitignore
> @@ -1,3 +1,4 @@
>  /mkelf32
> -/*.bin
> -/*.lnk
> +/build32.*.lds
> +/built-in-32.*.bin
> +/built-in-32.*.map

/built-in-32.S too

And from a glance at the file, this adjustment in the combine script too:

-print('\n\t.section\t.note.GNU-stack,"",@progbits', file=out)
+print('\n\t.section .note.GNU-stack, "", @progbits', file=out)

to have both .section's formatted in the same way.


> diff --git a/xen/arch/x86/boot/build32.lds b/xen/arch/x86/boot/build32.lds.S
> similarity index 70%
> rename from xen/arch/x86/boot/build32.lds
> rename to xen/arch/x86/boot/build32.lds.S
> index 56edaa727b..e3f5e55261 100644
> --- a/xen/arch/x86/boot/build32.lds
> +++ b/xen/arch/x86/boot/build32.lds.S
> <snip>
>          *(.text)
>          *(.text.*)
> -        *(.data)
> -        *(.data.*)
>          *(.rodata)
>          *(.rodata.*)
> +        *(.data)
> +        *(.data.*)

Reordering .data and .rodata really isn't necessary.

I'd just drop this part of the diff.  I have some different follow-up
for it anyway, which I've been holding off until after this first change
is sorted.

Everything here I'm happy to fix up on commit, if you're ok with me
doing so.

~Andrew

