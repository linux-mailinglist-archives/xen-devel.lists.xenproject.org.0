Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D187996A052
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 16:23:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789272.1198849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slURE-0000zs-NA; Tue, 03 Sep 2024 14:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789272.1198849; Tue, 03 Sep 2024 14:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slURE-0000xv-KP; Tue, 03 Sep 2024 14:23:20 +0000
Received: by outflank-mailman (input) for mailman id 789272;
 Tue, 03 Sep 2024 14:23:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7TnF=QB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slURC-0000xi-VW
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 14:23:18 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 104638c5-6a00-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 16:23:17 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8692bbec79so608878966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 07:23:18 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989022481sm685723066b.86.2024.09.03.07.23.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 07:23:15 -0700 (PDT)
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
X-Inumbo-ID: 104638c5-6a00-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725373397; x=1725978197; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DM9mBm/Eiir1NGduHPuNllBixDanvkK9a/uYhO9Q0cE=;
        b=E0r7sFjelfzCZuh/QrBPzFeelbbnA2cdNkuTOHZSTFkVk+gKw7bacMMIgnUpKvYd0C
         THahsAKI2ArgCMSqzPQFDuyul3dEDuxqmLEc+Scrv6prlLQKztW1XEn+LtJ0DdctlrfO
         GMooJmqjEasGyJ+PnWAsPsNWtlc7n9ZwZXSGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725373397; x=1725978197;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DM9mBm/Eiir1NGduHPuNllBixDanvkK9a/uYhO9Q0cE=;
        b=IGgXbzt+T32MScMY9IBKwtCH3dmWOkXBUQqL25PlGJxlYKFrDCUw4WB5rl7+LH0X/y
         N7VWJdo0DdAKFK8ItPyeKb11aWcvDn6diY7p6pMv9HlwlUaO/p+z8xoWs2M0JEubukRh
         ci6TKwSmkJkOVnS6ygZwJIgFOFyo75vkbeGyt04ZPKsG8I1SmL0VnPgX5FNbgkbDE0CH
         QAgHiQzkvIx5OrYXsLxRpM1n1MqV+bEB+K/ObBsfqLymN/OsVDJrHbS3X/vYe2+5fYe8
         CgCnCLkc+ZQwqp5/e1GW9fRRWZyvHKLMi1oZXn0DqrHo95SA5Eq6O9CIB1XDpOquSSCe
         1c2g==
X-Gm-Message-State: AOJu0YzFvj3MjypPlMfj9ItbG7dAgGMbVEiqruY+kaqDb2pJSeTbfm2v
	c5ixY2lRo1yOceRep11KVE3TEQQTw5mf6CoXKSP8bVZ6tA1WRoCeIFpf9CxN08WKVUzEF4PV3VF
	8
X-Google-Smtp-Source: AGHT+IEhEpZwrUij44IIlKbnR4eITqYvPoJr9VR73FF6UiYFpmfci5VgLm9SK0fBScLMRXLt3/d8xw==
X-Received: by 2002:a17:907:f154:b0:a80:f80a:d0b0 with SMTP id a640c23a62f3a-a89a34e4cbamr1018096166b.10.1725373396217;
        Tue, 03 Sep 2024 07:23:16 -0700 (PDT)
Message-ID: <f22e08ce-e51f-418d-b833-59778eb21865@citrix.com>
Date: Tue, 3 Sep 2024 15:23:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISCV/shutdown: Implement machine_{halt,restart}()
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <3d32a952c7cc77fd759e211c3b60427485a75582.1725295716.git.oleksii.kurochko@gmail.com>
 <20240903141937.3552353-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240903141937.3552353-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/09/2024 3:19 pm, Andrew Cooper wrote:
> SBI has an API for shutdown so wire it up.  However, the spec does allow the
> call not to be implemented, so we have to cope with the call return returning.

Sorry, this is supposed to read "... cope with sbi_shutdown() returning."

~Andrew

>
> There is a reboot-capable SBI extention, but in the short term route route
> machine_restart() into machine_halt().
>
> Then, use use machine_halt() rather than an infinite loop at the end of
> start_xen().  This avoids the Qemu smoke test needing to wait for the full
> timeout in order to succeed.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> As per commit e44f33ccddc2 ("ppc/shutdown: Implement
> machine_{halt,restart}()")
>
> Simply replacing BUG() with a printk() is just swapping one problem for
> another.
> ---
>  xen/arch/riscv/Makefile          |  1 +
>  xen/arch/riscv/include/asm/sbi.h |  3 +++
>  xen/arch/riscv/sbi.c             |  5 +++++
>  xen/arch/riscv/setup.c           |  6 ++----
>  xen/arch/riscv/shutdown.c        | 25 +++++++++++++++++++++++++
>  xen/arch/riscv/stubs.c           | 12 ------------
>  6 files changed, 36 insertions(+), 16 deletions(-)
>  create mode 100644 xen/arch/riscv/shutdown.c
>
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index 81b77b13d652..d192be7b552a 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -4,6 +4,7 @@ obj-y += mm.o
>  obj-$(CONFIG_RISCV_64) += riscv64/
>  obj-y += sbi.o
>  obj-y += setup.o
> +obj-y += shutdown.o
>  obj-y += stubs.o
>  obj-y += traps.o
>  obj-y += vm_event.o
> diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
> index 0e6820a4eda3..4d72a2295e72 100644
> --- a/xen/arch/riscv/include/asm/sbi.h
> +++ b/xen/arch/riscv/include/asm/sbi.h
> @@ -13,6 +13,7 @@
>  #define __ASM_RISCV_SBI_H__
>  
>  #define SBI_EXT_0_1_CONSOLE_PUTCHAR		0x1
> +#define SBI_EXT_0_1_SHUTDOWN			0x8
>  
>  struct sbiret {
>      long error;
> @@ -31,4 +32,6 @@ struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
>   */
>  void sbi_console_putchar(int ch);
>  
> +void sbi_shutdown(void);
> +
>  #endif /* __ASM_RISCV_SBI_H__ */
> diff --git a/xen/arch/riscv/sbi.c b/xen/arch/riscv/sbi.c
> index 0ae166c8610e..c7984344bc6b 100644
> --- a/xen/arch/riscv/sbi.c
> +++ b/xen/arch/riscv/sbi.c
> @@ -42,3 +42,8 @@ void sbi_console_putchar(int ch)
>  {
>      sbi_ecall(SBI_EXT_0_1_CONSOLE_PUTCHAR, 0, ch, 0, 0, 0, 0, 0);
>  }
> +
> +void sbi_shutdown(void)
> +{
> +    sbi_ecall(SBI_EXT_0_1_SHUTDOWN, 0, 0, 0, 0, 0, 0, 0);
> +}
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index a6a29a150869..bf9078f36aff 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -4,6 +4,7 @@
>  #include <xen/compile.h>
>  #include <xen/init.h>
>  #include <xen/mm.h>
> +#include <xen/shutdown.h>
>  
>  #include <public/version.h>
>  
> @@ -28,8 +29,5 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>  
>      printk("All set up\n");
>  
> -    for ( ;; )
> -        asm volatile ("wfi");
> -
> -    unreachable();
> +    machine_halt();
>  }
> diff --git a/xen/arch/riscv/shutdown.c b/xen/arch/riscv/shutdown.c
> new file mode 100644
> index 000000000000..270bb26b68a6
> --- /dev/null
> +++ b/xen/arch/riscv/shutdown.c
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#include <xen/shutdown.h>
> +
> +#include <asm/sbi.h>
> +
> +void machine_halt(void)
> +{
> +    sbi_shutdown();
> +
> +    for ( ;; )
> +        asm volatile ("wfi");
> +
> +    unreachable();
> +}
> +
> +void machine_restart(unsigned int delay_millisecs)
> +{
> +    /*
> +     * TODO: mdelay(delay_millisecs)
> +     * TODO: Probe for #SRST support, where sbi_system_reset() has a
> +     *       shutdown/reboot parameter.
> +     */
> +
> +    machine_halt();
> +}
> diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
> index 3285d1889940..2aa245f272b5 100644
> --- a/xen/arch/riscv/stubs.c
> +++ b/xen/arch/riscv/stubs.c
> @@ -49,18 +49,6 @@ void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
>      BUG_ON("unimplemented");
>  }
>  
> -/* shutdown.c */
> -
> -void machine_restart(unsigned int delay_millisecs)
> -{
> -    BUG_ON("unimplemented");
> -}
> -
> -void machine_halt(void)
> -{
> -    BUG_ON("unimplemented");
> -}
> -
>  /* domctl.c */
>  
>  long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>
> base-commit: 1e6bb29b03680a9d0e12f14c4d406a0d67317ea7


