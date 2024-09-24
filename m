Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6519846B5
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 15:26:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802871.1213269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st5Xm-000768-EP; Tue, 24 Sep 2024 13:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802871.1213269; Tue, 24 Sep 2024 13:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st5Xm-00073O-Ah; Tue, 24 Sep 2024 13:25:30 +0000
Received: by outflank-mailman (input) for mailman id 802871;
 Tue, 24 Sep 2024 13:25:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4pT6=QW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1st5Xl-00073I-28
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 13:25:29 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76164d97-7a78-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 15:25:26 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a8d56155f51so667341966b.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 06:25:26 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9393134950sm83365766b.212.2024.09.24.06.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 06:25:25 -0700 (PDT)
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
X-Inumbo-ID: 76164d97-7a78-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727184326; x=1727789126; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M2QV5ll5M2g/0tMGS4csjAUbrVrLk3moBG2wF34wPMY=;
        b=r3hTVPeTCF4n3dGdkH2DfTf8muN7scgx6HrrQU2HogB3u19HezZdkVgaXVEEPqdSav
         E6FNMwHpdQjTbpYgodQqKd3LRpD9XdZUNLWYGbK1WRTaNLLu5qy4yN8BTJrz2mDNuhDJ
         qZK5ptpQH++0eS06z9boi0qtHEYk9Opi5apU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727184326; x=1727789126;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2QV5ll5M2g/0tMGS4csjAUbrVrLk3moBG2wF34wPMY=;
        b=eHMb3M4Z4yFd22Cq0608EvfUJUJIvHJjUf273H/W9DW7OAVaoPvBF5yAmdUlrFyAUV
         86xcf7uc1OPB6oTkTnhWFTcEtiMA+l7u58lbiR9xQyW5DdDUEIwIAnAhLkJ0CNL2ZCVK
         wF5Pyaq5oDUv/eKqrrLfwWXw575lPtedpySt57ijx8v+h4hjh9DPQ0YasONCuRqXGEvl
         m00/1CroZKbT/UpngX+5mKEMqjIj6EfoEEWLvR0wqwAlEJ3Khqu/eQVecy12Rqnweq0r
         zcaa3OoOXPJ5wqT1ZGGgvz4P7vWxapZFYDZw4imTjbYSVDsSniQfwTR1dH55A38rUxEe
         FHVg==
X-Forwarded-Encrypted: i=1; AJvYcCV9WsVKdruYPxl8WKj8FzIWY3/MK6po9GL3t/X05ZMyQ28WgRpWhNavC5xwXvLvP9qPTV4lilUi+Gk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6Z+VRghNBUrC3ChVgDV5N7UvFEnFe7Gb/a6oZ62bwZXpMd3LM
	trfoXDP+LNLRTid7rv+n1xdOsP49xnSAezWCQKZ+z0hyJnvv3faNS35JfqpYTb/rlKov9BPNM5j
	55ww=
X-Google-Smtp-Source: AGHT+IHqOc+T1GpCr9Gs4olzQWCdbFxJXyhnSH68eFZp+0fUbLOAVi0yXhzuuE43g5kYB/yavA0kqg==
X-Received: by 2002:a17:907:f759:b0:a8a:83e9:43e2 with SMTP id a640c23a62f3a-a90d4fcb6bcmr1387464066b.12.1727184326252;
        Tue, 24 Sep 2024 06:25:26 -0700 (PDT)
Message-ID: <91bf7854-83e8-42cc-a28b-21aaa472bb1f@citrix.com>
Date: Tue, 24 Sep 2024 14:25:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] x86/boot: Refactor BIOS/PVH start
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240924102811.86884-1-frediano.ziglio@cloud.com>
 <20240924102811.86884-3-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240924102811.86884-3-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/09/2024 11:28 am, Frediano Ziglio wrote:
> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> index fa21024042..80bba6ff21 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
>  ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_ENTRY, .long sym_offs(__pvh_start))
>  
>  __pvh_start:
> -        cld
> +        mov     $BOOT_TYPE_PVH, %dl
> +        jmp     .Lcommon_bios_pvh
> +#endif /* CONFIG_PVH_GUEST */
> +
> +__start:
> +        mov     $BOOT_TYPE_BIOS, %dl

Even if we're generally using %dl, these must be full %edx writes.

%edx commonly contains FMS on entry, and we don't want part of FMS left
in the upper half of the register.

> +
> +.Lcommon_bios_pvh:
>          cli
> +        cld
>  
>          /*
> -         * We need one call (i.e. push) to determine the load address.  See
> -         * __start for a discussion on how to do this safely using the PVH
> -         * info structure.
> +         * Multiboot (both 1 and 2) and PVH specify the stack pointer as
> +         * undefined.  This is unhelpful for relocatable images, where one
> +         * call (i.e. push) is required to calculate the image's load address.
> +         *
> +         * Durig BIOS boot, there is one area of memory we know about with
> +         * reasonable confidence that it isn't overlapped by Xen, and that's
> +         * the Multiboot info structure in %ebx.  Use it as a temporary stack.
> +         *
> +         * During PVH boot use info structure in %ebx.
>           */
>  
>          /* Preserve the field we're about to clobber. */
> -        mov     (%ebx), %edx
> +        mov     (%ebx), %ecx

Both here, and ...

>          lea     4(%ebx), %esp
>  
>          /* Calculate the load base address. */
> @@ -449,62 +459,40 @@ __pvh_start:
>          mov     %ecx, %es
>          mov     %ecx, %ss
>  
> -        /* Skip bootloader setup and bios setup, go straight to trampoline */
> -        movb    $1, sym_esi(pvh_boot)
> -        movb    $1, sym_esi(skip_realmode)
> -
> -        /* Set trampoline_phys to use mfn 1 to avoid having a mapping at VA 0 */
> -        movw    $0x1000, sym_esi(trampoline_phys)
> -        mov     (%ebx), %eax /* mov $XEN_HVM_START_MAGIC_VALUE, %eax */
> -        jmp     trampoline_setup
> -
> -#endif /* CONFIG_PVH_GUEST */
> +        /* Load null selector to unused segment registers. */
> +        xor     %ecx, %ecx
> +        mov     %ecx, %fs
> +        mov     %ecx, %gs
>  
> -.Linitialise_bss:
>  	/* Initialise the BSS. */
> -        mov     %eax, %edx
> -
> +        mov     %eax, %ebp

... here, we've got changes caused by now using %edx for a long-lived
purpose (and a change in linebreaks.)

For this, %ebp should be used straight away in patch 1.  I've not
committed it yet, so can fix that up.


I have to admit that I think this patch would be easier if the "use %ebx
for BOOT_TYPE_*" change was split out of "better merge the BIOS/PVH
paths".  That would at least get the incidental %edx changes out of the way.

Also, inserting

#ifdef CONFIG_PVH_GUEST
        cmp     $BOOT_TYPE_PVH, %dl
        jne     1f
1:
#endif /* CONFIG_PVH_GUEST */

in the same patch will probably make the subsequent diff far more legible.

Thoughts?

I might give this a quick go, and see how it ends up looking...

~Andrew

