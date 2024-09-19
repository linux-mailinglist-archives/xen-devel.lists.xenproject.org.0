Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CCD97CE6D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 22:20:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800910.1210913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srNd5-0007J9-93; Thu, 19 Sep 2024 20:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800910.1210913; Thu, 19 Sep 2024 20:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srNd5-0007Fw-6L; Thu, 19 Sep 2024 20:19:55 +0000
Received: by outflank-mailman (input) for mailman id 800910;
 Thu, 19 Sep 2024 20:19:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yYjm=QR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1srNd3-0007Fq-PV
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 20:19:53 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8649b56e-76c4-11ef-99a2-01e77a169b0f;
 Thu, 19 Sep 2024 22:19:51 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5365aa568ceso1656339e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2024 13:19:51 -0700 (PDT)
Received: from [10.13.28.37] ([212.236.35.100])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b3997sm758286666b.104.2024.09.19.13.19.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Sep 2024 13:19:49 -0700 (PDT)
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
X-Inumbo-ID: 8649b56e-76c4-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726777190; x=1727381990; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NQu2BNhnRXQD1hQCMBXTMlCN9nuWDTEr5+JB0AeIkVA=;
        b=MSd+6GouyLnI1GK0ziJHoizzrdFk3Le3qZ8lWlMrFCdmyvLetNj6eyvz5jdQxSwicC
         /UMZYpezMwS/3uh3xmrdyOWsabrSHiB6t+ukOiEgRi5nGaQORpk3IMh2z+SS5/ju/lcb
         wAQD1YOUpelIGXUZ1J+HPqfEtTPBidimNTwpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726777190; x=1727381990;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQu2BNhnRXQD1hQCMBXTMlCN9nuWDTEr5+JB0AeIkVA=;
        b=N78XW7x5JODL1WWfn+xR496eKJIcIYF/DEgeYf31gBtrI+ABQvLHPQaXKDZkKMJyo8
         F7QKt+GGDuMrvO+3Eo3tVn44cGYErDAhYUFZHOQytcZzz/wVl560hK9QESVdvqTdz2hu
         esGyfz2sYH0f7F3DwMhquMDjUjMmFkoqJJziR2ZYTinlzCmpWJ9gV99L3GsliwHT3Jpp
         SYXNmlN3gZC0XFdz0GiLcghjp/mEwdSaFmuYEsqVGhbPL+hOweHHCVQeDDQ8XRJvvhGA
         0hFJYnhWfMMpz5cyW3cSZOh9Bi9ee6lpOix4gql5qiDiacGrLoi4tOaT0x6wpk/TFKDL
         cJKw==
X-Forwarded-Encrypted: i=1; AJvYcCX+txC+ioqPwsPPcfWlgQS5CnSWpm7HStrHDzkMdiFnz6mR9LyDDWNTjaicJ+vep6SkOFm/J3WGmkM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSqOVVLytW4vdFfXtwOklg0l30CXcZ0S9LU/cBkBGZeAX6CIhX
	UM4aCziRPmhQdr/sqTxd1D/4wnkpWQ1QyQ8Rd2AATpUq7NlFmy+EszQ6ZHDvYkU=
X-Google-Smtp-Source: AGHT+IGF8c7ie1zxkVP7+6dtg/OGe0xIezrZVsoqv1a7wNgPUxWRf+1H+D+O41SBxxPqWLBWhbCSFg==
X-Received: by 2002:a05:6512:15a8:b0:536:54ff:51c8 with SMTP id 2adb3069b0e04-536ac2e822cmr323473e87.17.1726777190363;
        Thu, 19 Sep 2024 13:19:50 -0700 (PDT)
Message-ID: <7a6906a2-6860-4575-a88d-90be5ec43eee@citrix.com>
Date: Thu, 19 Sep 2024 22:19:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/shutdown: mask LVTERR ahead of offlining CPUs
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20240919142748.43821-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240919142748.43821-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/09/2024 4:27 pm, Roger Pau Monne wrote:
> Leaving active interrupt sources targeting APIC IDs that are offline can be
> problematic on AMD machines during shutdown.

What exactly qualifies as "offline" here?

We don't self-INIT, so I'm guessing we leave the APIC in some kind of
disabled state, especially given ...

>   This is due to AMD local APICs
> reporting Receive Accept Errors when a message is not handled by any APIC on
> the system.

... this.


>   Note Intel SDM states that Receive Accept Errors are only reported
> on P6 family and Pentium processors.
>
> If at shutdown an active interrupt source is left targeting an offline APIC ID,
> the following can be seen on AMD boxes:
>
> Hardware Dom0 shutdown: rebooting machine
> APIC error on CPU0: 00(08), Receive accept error
> APIC error on CPU0: 08(08), Receive accept error
> APIC error on CPU0: 08(08), Receive accept error
> APIC error on CPU0: 08(08), Receive accept error
> APIC error on CPU0: 08(08), Receive accept error
> APIC error on CPU0: 08(08), Receive accept error
> APIC error on CPU0: 08(08), Receive accept error
> APIC error on CPU0: 08(08), Receive accept error
> APIC error on CPU0: 08(08), Receive accept error
> APIC error on CPU0: 08(08), Receive accept error
> APIC error on CPU0: 08(08), Receive accept error
> APIC error on CPU0: 08(08), Receive accept error
> [...]
>
> Thus preventing the shutdown.  In the above case the interrupt source that was
> left targeting an offline APIC ID was the serial console one

While masking LVTERR might allow more progress, it's not a wise approach.

The real issue here is that the UART driver is still active as we're
trying to tear the system down.  If nothing else, it's rude to leave an
active interrupt source for the kexec kernel to deal with.

IMO, we should shut the UART down like other devices, and move it back
into polled mode.

> , so printing of
> the local APIC ESR lead to more unhandled messages on the APIC bus, leaving the
> host unable to make progress.

Minor note, but there's not been an APIC bus in decades.  Here, I'd
simply say "lead to more console IRQs, and more errors".

>
> Mask LVTERR ahead of bringing any CPU offline, thus avoiding receiving
> interrupts for any APIC reported errors.  Note that other local APIC errors
> will also be ignored.  At the point where the masking is done it's unlikely for
> any reported APIC errors to be meaningful anyway, the system is about to reboot
> or power off.
>
> The LVTERR masking could be limited to AMD, but there's no guarantee that in
> the future Intel parts also start reporting the error, thus hitting the same
> issue.  Unifying behavior across vendors when possible seems more desirable.
> The local APIC gets wholesale disabled as part of offlining the CPUs and
> bringing the system down in __stop_this_cpu().
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Note a similar issue possibly exists in the nmi_shootdown_cpus() path, however
> that being a crash path it is more complicated to uniformly mask the LVTERR
> strictly ahead of offlining CPUs.  That path is also more resilient AFAICT, as
> nmi_shootdown_cpus() disables interrupts at the start (so no LVTERR interrupt
> will be handled) and the CPUs are stopped using an NMI, which would bypass any
> LVTERR processing.
> ---
>  xen/arch/x86/smp.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
> index 04c6a0572319..399ec7491ac6 100644
> --- a/xen/arch/x86/smp.c
> +++ b/xen/arch/x86/smp.c
> @@ -348,6 +348,11 @@ static void cf_check stop_this_cpu(void *dummy)
>          halt();
>  }
>  
> +static void cf_check mask_lvterr(void *dummy)
> +{
> +    apic_write(APIC_LVTERR, ERROR_APIC_VECTOR | APIC_LVT_MASKED);
> +}
> +
>  /*
>   * Stop all CPUs and turn off local APICs and the IO-APIC, so other OSs see a 
>   * clean IRQ state.
> @@ -364,6 +369,18 @@ void smp_send_stop(void)
>          fixup_irqs(cpumask_of(cpu), 0);
>          local_irq_enable();
>  
> +        /*
> +         * Mask the local APIC error vector ahead of stopping CPUs.
> +         *
> +         * On AMD the local APIC will report Receive Accept Errors if the
> +         * destination APIC ID of an interrupt message is not online.  There's
> +         * no guarantee that fixup_irqs() will evacuate all interrupts -
> +         * possibly because the sole CPU remaining online doesn't have enough
> +         * vectors to accommodate all.
> +         */
> +        smp_call_function(mask_lvterr, NULL, true);
> +        mask_lvterr(NULL);
> +
>          smp_call_function(stop_this_cpu, NULL, 0);

Irrespective of the question over approach, stop_this_cpu() should end
up clearing LVTERR.  Why doesn't that suffice?

~Andrew

