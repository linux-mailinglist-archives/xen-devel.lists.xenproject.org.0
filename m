Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA2B86B46F
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 17:15:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686737.1069142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfMaU-0002Ng-Od; Wed, 28 Feb 2024 16:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686737.1069142; Wed, 28 Feb 2024 16:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfMaU-0002LA-LQ; Wed, 28 Feb 2024 16:15:18 +0000
Received: by outflank-mailman (input) for mailman id 686737;
 Wed, 28 Feb 2024 16:15:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIhW=KF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rfMaT-0002Kk-2S
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 16:15:17 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e12c59a-d654-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 17:15:15 +0100 (CET)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-787b4d1393aso361789685a.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 08:15:15 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 nf9-20020a0562143b8900b0068fe4669e71sm5360241qvb.91.2024.02.28.08.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 08:15:12 -0800 (PST)
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
X-Inumbo-ID: 8e12c59a-d654-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709136914; x=1709741714; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f7WVomFudO0WGDDK8vul+YJ5ZvWnuYzorq7iIax68lQ=;
        b=cMpMkwUqtFlTk+wAP5pEnJfM7qUnHMAAmmaBYZnd3zTipl9AjB47bn/oegseya4e+w
         mY1Aj1RgR0vyaxqphyNlZp62W11TSdmsIKTS2bg9wz37+Ivdh8TJHbRAEOAMeuLdwgSE
         +6tfu+/yVOPunBkoGgNBfDfD6ApgPwv6p5Tio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709136914; x=1709741714;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f7WVomFudO0WGDDK8vul+YJ5ZvWnuYzorq7iIax68lQ=;
        b=a5XaZ/Peyym0tvJGN+kz1LNGfYEqDIhId4PR8jk94XsfcGXt9+EMyGzsKJnOQCrVn6
         7AsiqBgdDasxr2wtsHmlJoPYHzqY2TMrFjJpX4GRWxJdhrohmYXd4KscAFyritbyN2t9
         lYVB4znHSB0P0MfML1PF6pTHsZKKFuqc1cAm0zuaQ2LDusCE8PiPRQOIXKb7HNs1//g7
         bvoOwDA+Ct91WVGam1ThPsldswTa6HLIGZ4q0+sWjeJhDRT0Ml8+vDZZs6AKJS/vZjmb
         Q9KiReGvuzNExyoZrruR8ctLxgh8pIb9DqcDunPfb0jBVzYGMr3H5BhqVchCxgy/gp3p
         7eNw==
X-Forwarded-Encrypted: i=1; AJvYcCUtg2X30Rqlt60Bw2PA2SUprxzKfwT+SYSaggDAF3vOlIP5YoGBmnA5joeZoXoauDku5AvEIgUaCnUm/Q2wH1EXgnnIQ2Fj6gA9Yr13GuA=
X-Gm-Message-State: AOJu0YyTiT6TmeVOObhGbgZsAACHB/XLaODH56ClyM1W3dnO5DyH/xXD
	rxqiRQz3eGOUJBqmjJnyXXdLfkl0tfpcwQZx8FyH+HV5Bp2QZbB1vS59KTSzbhw=
X-Google-Smtp-Source: AGHT+IEE4SRhJkZWjecOzMgxJq0h0zvWsNwoibDK6OyuXeXYiHEDXSCSXagx/FectCLqgzVFl8RXaA==
X-Received: by 2002:ad4:5c4b:0:b0:68f:7891:ef2e with SMTP id a11-20020ad45c4b000000b0068f7891ef2emr6463089qva.53.1709136913854;
        Wed, 28 Feb 2024 08:15:13 -0800 (PST)
Message-ID: <e687d4a1-efd8-4d7f-9c5d-8796bb99014a@citrix.com>
Date: Wed, 28 Feb 2024 16:15:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] x86: prefer shadow stack for producing call traces
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <33da6f8b-af22-48c8-acce-3aa55c0e0414@suse.com>
 <fdacbb8b-5a58-4d6b-89b2-ea98b4fed895@suse.com>
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
In-Reply-To: <fdacbb8b-5a58-4d6b-89b2-ea98b4fed895@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/02/2024 1:53 pm, Jan Beulich wrote:
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -539,6 +544,50 @@ static void show_trace(const struct cpu_
>           !is_active_kernel_text(tos) )
>          printk("   [<%p>] R %pS\n", _p(regs->rip), _p(regs->rip));
>  
> +    if ( IS_ENABLED(CONFIG_XEN_SHSTK) && rdssp() != SSP_NO_SHSTK )
> +    {
> +        const unsigned long *ptr = _p(regs->entry_ssp);
> +        unsigned int n;
> +
> +        for ( n = 0; (unsigned long)ptr & (PAGE_SIZE - sizeof(*ptr)); ++n )
> +        {
> +            unsigned long val = *ptr;
> +
> +            if ( is_active_kernel_text(val) || in_stub(val) )
> +            {
> +                /* Normal return address entry.  */
> +                printk("   [<%p>] C %pS\n", _p(val), _p(val));
> +                ++ptr;
> +            }
> +            else if ( !((val ^ *ptr) >> (PAGE_SHIFT + STACK_ORDER)) )
> +            {
> +                if ( val & (sizeof(val) - 1) )
> +                {
> +                    /* Most likely a supervisor token. */
> +                    break;
> +                }

Tokens are their own linear address, with metadata in the bottom two
bits.  I think it would be better to check that explicitly, rather than
assuming anything nonzero in the upper bits is a token.

> +
> +                /*
> +                 * Ought to be a hypervisor interruption frame.  But don't
> +                 * (re)log the current frame's %rip.
> +                 */
> +                if ( n || ptr[1] != regs->rip )
> +                    printk("   [<%p>] E %pS\n", _p(ptr[1]), _p(ptr[1]));
> +                ptr = _p(val);
> +            }
> +            else
> +            {
> +                /* Ought to be a PV guest hypercall/interruption frame.  */
> +                printk("   %04lx:[<%p>] E\n", ptr[2], _p(ptr[1]));
> +                ptr = 0;

On a CPL3 -> CPL0 transition, the guest's SSP is written back into
MSR_PL3_SSP.  The supervisor token on MSR_PL0_SSP is marked busy (either
automatically, or by SETSSBY), but nothing pertaining to CPL3 is pushed
onto the supervisor shadow stack.

This is why we can move off an IST stack onto the primary stack when
interrupting CPL3 with only a CLEARSSBSY/SETSSBSY pair, and no memmove()
loop of WRSS's.

In other words, I'm pretty sure this is a dead codeapth.  (Or worse, if
it happens not to  be dead, then the comment is misleading.)

A CPL1 -> CPL0 transition does push an shstk interrupt frame, and not
wanting to memmove() the shstk by 3 slots on a context switch is part of
why I just disallowed PV32 guests when CET was active.

~Andrew

