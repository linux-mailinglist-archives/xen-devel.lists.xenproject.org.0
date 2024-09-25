Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AFD9866F1
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 21:33:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804542.1215560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stXlW-0007wD-Mw; Wed, 25 Sep 2024 19:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804542.1215560; Wed, 25 Sep 2024 19:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stXlW-0007ui-Jz; Wed, 25 Sep 2024 19:33:34 +0000
Received: by outflank-mailman (input) for mailman id 804542;
 Wed, 25 Sep 2024 19:33:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lFoA=QX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1stXlV-0007ua-RU
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 19:33:33 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bf0366e-7b75-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 21:33:31 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-535dc4ec181so227223e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 12:33:31 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f34976sm246132966b.45.2024.09.25.12.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 12:33:30 -0700 (PDT)
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
X-Inumbo-ID: 0bf0366e-7b75-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727292811; x=1727897611; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ButltGDhpk1invFfGCVx2mN3htFN3wHi7kLqWboH4mw=;
        b=rRPGCNhFzL+rshEXl2lmpeEsbr3l9pbc1sN4k4FNDOGYZ0cYu1aN4d+XLlhIrxircj
         5Ml/v0ECiRIW8WktZ7sdZ/LjXkg0jFgfdP7GKA19DWb9suaGt/uzD1g3OLUMr3H06Rc1
         KY5a7CcyLyq5XGJs7FfspcqjhtxwDhWle50f4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727292811; x=1727897611;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ButltGDhpk1invFfGCVx2mN3htFN3wHi7kLqWboH4mw=;
        b=gzxctwl89Ij18wNawZ0gxbT1EaJHmp2sYQ2ft/taEi+v83XK6JhBv4clDuwtynNVMc
         LNnun8YLwAUDL9o0AHLrGR/QgpvTh13sIWpoRC5MxGKOcdctiIRkIUb8UesYIW2QoAS9
         FfXEZ+IKGvK4WbU6Z5BYxaQ4QGpbqQWUOOJlvaPKqQoo+pxgSNw7hkY59BWu9WZ5MCY3
         4S0BnfZwFMNDBTRQm8K5i6e6uMByw+uEGivjX+96Jlei+HQCMM+PrynyV4J/XRi+0nN6
         IcVeDBLChv8MnuPA1kKYYXlpUhaOUNrBQ7fff76pj4aV6ijOLsxkVxLxzmQJD8E1sY2J
         7M+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHbLUIrgcmSouPO8nfj6RPw3aQTqOuD6EXurS7t5SGznbyoHc9AuMNYhQ7ZE+gDyHDSEwAzDZJKDs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyoRJNDpPteRMD7JNbm4mmrQBBITt7P1wjHl1Wi6hqf2jcfx/pS
	XDXpqZDpDxAN//zrK29GcwBZQx15YHXNP+eliKxH7LKV+i2uMFJpS8HHqaG5oNrZnuTth9PC0DP
	jJxW3mg==
X-Google-Smtp-Source: AGHT+IFUJ1gAlvjojSEP5spQyPWUfwQFpWdyn1qVSUZoWRnS8wz30NVTnEBlEzxyrlZwEGoURPXk/A==
X-Received: by 2002:a05:6512:1313:b0:52f:154:661b with SMTP id 2adb3069b0e04-5387048af30mr2165909e87.11.1727292810653;
        Wed, 25 Sep 2024 12:33:30 -0700 (PDT)
Message-ID: <88189db4-c89c-430d-b96f-46259993fb5e@citrix.com>
Date: Wed, 25 Sep 2024 20:33:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] x86/boot: Refactor BIOS/PVH start
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240925060101.259244-1-frediano.ziglio@cloud.com>
 <20240925060101.259244-3-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 xsFNBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABzSlBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPsLBegQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86M7BTQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAcLB
 XwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
In-Reply-To: <20240925060101.259244-3-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/09/2024 7:00 am, Frediano Ziglio wrote:
> The 2 code paths were sharing quite some common code, reuse it instead
> of having duplications.
> Use %dl register to store boot type before running common code.
> Using a 8 bit register reduces code size.

These final two lines are stale and can be dropped.

> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> index 267207e5a2..2d2f56ad22 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -409,13 +411,27 @@ cs32_switch:
>  ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_ENTRY, .long sym_offs(__pvh_start))
>  
>  __pvh_start:
> -        cld
> +        mov     (%ebx), %eax /* mov $XEN_HVM_START_MAGIC_VALUE, %eax */
> +        /*
> +         * Fall through into BIOS code.
> +         * We will use %eax to distinguish we came from PHV entry point.

PVH.

It occurs to me that we could actually have:

        mov     $XEN_HVM_START_MAGIC_VALUE, %eax

Given the cross-check against 0(%ebx) later, that's marginally more robust.

> @@ -449,62 +458,40 @@ __pvh_start:
>          mov     %ecx, %es
>          mov     %ecx, %ss
>  
> -        /* Skip bootloader setup and bios setup, go straight to trampoline */
> -        movb    $1, sym_esi(pvh_boot)
> -        movb    $1, sym_esi(skip_realmode)
> +        /* Load null selector to unused segment registers. */
> +        xor     %ecx, %ecx
> +        mov     %ecx, %fs
> +        mov     %ecx, %gs

Honestly, the more I look at this, the more bizarre it is.

We should just set up %fs/gs like we do %ds/es, which in this case is
simply to drop the comment and the xor.

>  
> -        /* Set trampoline_phys to use mfn 1 to avoid having a mapping at VA 0 */
> -        movw    $0x1000, sym_esi(trampoline_phys)
> -        mov     (%ebx), %eax /* mov $XEN_HVM_START_MAGIC_VALUE, %eax */
> -        jmp     trampoline_setup
> -
> -#endif /* CONFIG_PVH_GUEST */
> -
> -.Linitialise_bss:
>          /* Initialise the BSS.  Preserve %eax (BOOTLOADER_MAGIC). */
>          mov     %eax, %ebp
> -
>          lea     sym_esi(__bss_start), %edi
>          lea     sym_esi(__bss_end), %ecx
>          sub     %edi, %ecx
>          xor     %eax, %eax
>          shr     $2, %ecx
>          rep stosl
> -
>          mov     %ebp, %eax

Are these two dropped lines intentional?

I did ask on the previous version; it's weird to introduce the code with
them present, then delete them in the subsequent patch.

> -        ret
> -
> -__start:
> -        cld
> -        cli
> -
> -        /*
> -         * Multiboot (both 1 and 2) specify the stack pointer as undefined
> -         * when entering in BIOS circumstances.  This is unhelpful for
> -         * relocatable images, where one call (i.e. push) is required to
> -         * calculate the image's load address.
> -         *
> -         * This early in boot, there is one area of memory we know about with
> -         * reasonable confidence that it isn't overlapped by Xen, and that's
> -         * the Multiboot info structure in %ebx.  Use it as a temporary stack.
> -         */
>  
> -        /* Preserve the field we're about to clobber. */
> -        mov     (%ebx), %edx
> -        lea     4(%ebx), %esp
> +#ifdef CONFIG_PVH_GUEST
> +        cmp     $XEN_HVM_START_MAGIC_VALUE, %eax
> +        jne     1f
>  
> -        /* Calculate the load base address. */
> -        call    1f
> -1:      pop     %esi
> -        sub     $sym_offs(1b), %esi
> +        mov     %ebx, sym_esi(pvh_start_info_pa)
>  
> -        /* Restore the clobbered field. */
> -        mov     %edx, (%ebx)
> +        /* Force xen console.  Will revert to user choice in init code. */
> +        movb    $-1, sym_esi(opt_console_xen)
>  
> -        /* Set up stack. */
> -        lea     STACK_SIZE - CPUINFO_sizeof + sym_esi(cpu0_stack), %esp
> +        /* Skip bootloader setup and bios setup, go straight to trampoline */
> +        movb    $1, sym_esi(pvh_boot)
> +        movb    $1, sym_esi(skip_realmode)
>  
> -        call    .Linitialise_bss
> +        /* Set trampoline_phys to use mfn 1 to avoid having a mapping at VA 0 */
> +        movl    $PAGE_SIZE, sym_esi(trampoline_phys)
> +        mov     (%ebx), %eax /* mov $XEN_HVM_START_MAGIC_VALUE, %eax */

This isn't needed any more.  It was previously reloading %eax after REP
STOSL, but that's sorted elsehow now.


Overall, this bit of the diff is still hard to read, but it's the best
we're going to get I think.  The end result is good.

I'm happy to adjust all of these on commit.

~Andrew

