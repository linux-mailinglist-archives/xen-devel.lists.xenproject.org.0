Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE385A30DDB
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 15:13:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885590.1295394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thr0P-0003fG-AB; Tue, 11 Feb 2025 14:12:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885590.1295394; Tue, 11 Feb 2025 14:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thr0P-0003cx-7O; Tue, 11 Feb 2025 14:12:53 +0000
Received: by outflank-mailman (input) for mailman id 885590;
 Tue, 11 Feb 2025 14:12:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jP5V=VC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1thr0O-0003cr-FY
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 14:12:52 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 474ef06d-e882-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 15:12:51 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ab7c07e8b9bso377198366b.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 06:12:51 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab79fea9e06sm750568066b.60.2025.02.11.06.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 06:12:50 -0800 (PST)
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
X-Inumbo-ID: 474ef06d-e882-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739283171; x=1739887971; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GUPJNtsDweTz/6hP6s9qntf+qWOyZVtgiIjTSqAiugU=;
        b=FY2zfUYYrib9k5Omwiy8XzLjIWg5XRQkvENtGaA9/1ABGUfXbSRkuZcNmpFRXWMTV5
         dxffqzaSwfti1irPNCySfCVuswPrhoe7Sjd20v42ToOd4ocQrO7I1ReeFazUWJTMd+Rr
         FYc6F9TdpWO0Or0vYk3t03neHIGodcKTGttSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739283171; x=1739887971;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GUPJNtsDweTz/6hP6s9qntf+qWOyZVtgiIjTSqAiugU=;
        b=ve7vfkvrNQrxybCX5ag4nQQzaFfJymHDaGxw8rteM4B91/8bEo137OaGUQzxFL6O+N
         3uVfl3oD6VF5DZvFTNvKx3njVaqftsaYqMqN06/54P8qXwYoQ2rcXl0g11auGM+1AlVU
         tver+TFMZt2TPNACIHv/2m115QXTzy4mNYpqlDSyIUHwtqdhLLFMI6Y06sFCYQmxTR+9
         NLEk+O1iIb8QvohC7MOGdo/KRfIOBubhTmgdNtdtrYDexLOhkFMKgNw5vilV4xPT88HO
         O2tIPVlOgPyOxR9nGG/PH5+IznsCG/L0LxXPJbv/AfOP6+O9Mp+3dNhNrfRjD4ylh6ok
         Mgrw==
X-Forwarded-Encrypted: i=1; AJvYcCX1DaAw4rC3SVMq1GfKvJdrL0+UD8HERQ/CtMPGx4J1AIe2YZM7fkPICB6g5dbDIWPKx58E/tR5diw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0PHG+FpjyiXEkWui+Un4t9/YCHdiRP2wgXnjKOJUmm+DA5h81
	sYda4A+gvBnNJwKaP/wxfSOvxCL6uIGvEGgmUIFV6zjAxw0MPMvUrGFUZ8etSbE=
X-Gm-Gg: ASbGncvigt4TrKqXJ0YwDbN9Mj+ZrEi/qpELKbVPgJ1AdTEavvADOXkSGSylxqTvkL8
	ruFbB6w5pIJ8wmL3QMxS2pi9I5ee//GpJ+JA7iLgK53ADQ/atq2JIi3596+FVukj1xz3+80deyC
	k2Wkkq+Xvgvu0lXIGy+2Jl8r7pSxgHATLYom399sp+sKIH5TjqTU0sRrnfIW+PWYpB4LX3ij2mD
	gLc7B0pTHtcRQaGkmyCtMOWJlMJccgAxA8qwlYL95LF0xIB5kiqfqVIuI3kf9bQIcrPqHMnRJ1c
	e6+Q3ZqHp0R2ngOykCcA8ta/Qg==
X-Google-Smtp-Source: AGHT+IFAOLTgLpRFtblgVzgiUAozegscTfJI1YrCNNLCWZ17gTJ92J1L8RNTylrcpSx9U9sUQ19Lgg==
X-Received: by 2002:a17:907:c91e:b0:ab7:94ee:eebb with SMTP id a640c23a62f3a-ab794eeefabmr1139028966b.14.1739283170564;
        Tue, 11 Feb 2025 06:12:50 -0800 (PST)
Date: Tue, 11 Feb 2025 15:12:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.20 v3 1/5] x86/shutdown: offline APs with
 interrupts disabled on all CPUs
Message-ID: <Z6ta4baJLZIZAnpB@macbook.local>
References: <20250211110209.86974-1-roger.pau@citrix.com>
 <20250211110209.86974-2-roger.pau@citrix.com>
 <a0ea8bdb-4168-4b0b-895b-ba0fcf1caf79@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a0ea8bdb-4168-4b0b-895b-ba0fcf1caf79@suse.com>

On Tue, Feb 11, 2025 at 12:23:56PM +0100, Jan Beulich wrote:
> On 11.02.2025 12:02, Roger Pau Monne wrote:
> > The current shutdown logic in smp_send_stop() will disable the APs while
> > having interrupts enabled on the BSP or possibly other APs. On AMD systems
> > this can lead to local APIC errors:
> > 
> > APIC error on CPU0: 00(08), Receive accept error
> > 
> > Such error message can be printed in a loop, thus blocking the system from
> > rebooting.  I assume this loop is created by the error being triggered by
> > the console interrupt, which is further stirred by the ESR handler
> > printing to the console.
> > 
> > Intel SDM states:
> > 
> > "Receive Accept Error.
> > 
> > Set when the local APIC detects that the message it received was not
> > accepted by any APIC on the APIC bus, including itself. Used only on P6
> > family and Pentium processors."
> > 
> > So the error shouldn't trigger on any Intel CPU supported by Xen.
> > 
> > However AMD doesn't make such claims, and indeed the error is broadcast to
> > all local APICs when an interrupt targets a CPU that's already offline.
> > 
> > To prevent the error from stalling the shutdown process perform the
> > disabling of APs and the BSP local APIC with interrupts disabled on all
> > CPUs in the system, so that by the time interrupts are unmasked on the BSP
> > the local APIC is already disabled.  This can still lead to a spurious:
> > 
> > APIC error on CPU0: 00(00)
> > 
> > As a result of an LVT Error getting injected while interrupts are masked on
> > the CPU, and the vector only handled after the local APIC is already
> > disabled.  ESR reports 0 because as part of disable_local_APIC() the ESR
> > register is cleared.
> > 
> > Note the NMI crash path doesn't have such issue, because disabling of APs
> > and the caller local APIC is already done in the same contiguous region
> > with interrupts disabled.  There's a possible window on the NMI crash path
> > (nmi_shootdown_cpus()) where some APs might be disabled (and thus
> > interrupts targeting them raising "Receive accept error") before others APs
> > have interrupts disabled.  However the shutdown NMI will be handled,
> > regardless of whether the AP is processing a local APIC error, and hence
> > such interrupts will not cause the shutdown process to get stuck.
> > 
> > Remove the call to fixup_irqs() in smp_send_stop(): it doesn't achieve the
> > intended goal of moving all interrupts to the BSP anyway.  The logic in
> > fixup_irqs() will move interrupts whose affinity doesn't overlap with the
> > passed mask, but the movement of interrupts is done to any CPU set in
> > cpu_online_map.  As in the shutdown path fixup_irqs() is called before APs
> > are cleared from cpu_online_map this leads to interrupts being shuffled
> > around, but not assigned to the BSP exclusively.
> 
> Which would have been possible to address by changing to something like
> 
>         if ( !cpumask_intersects(mask, desc->affinity) )
>         {
>             break_affinity = true;
>             cpumask_copy(affinity, mask);
>         }
>         else
>             cpumask_and(affinity, mask, desc->affinity);
> 
> there, I guess.

Possibly, but note _assign_irq_vector() could also refuse to move the
interrupts if there's a pending movement and the current target CPU is
still set as online in cpu_online_map.  Overall I think going down
that route is way more complex.

> 
> > The Fixes tag is more of a guess than a certainty; it's possible the
> > previous sleep window in fixup_irqs() allowed any in-flight interrupt to be
> > delivered before APs went offline.  However fixup_irqs() was still
> > incorrectly used, as it didn't (and still doesn't) move all interrupts to
> > target the provided cpu mask.
> 
> Plus there's the vector shortage aspect, if everything was moved to the
> BSP. I don't think that's possible to get past without doing what you
> do.

Indeed, and the interrupt movement was IMO way more complex than what
I'm proposing (even with the followup patches that attempt to  silence
device interrupts).

> > Fixes: e2bb28d62158 ('x86/irq: forward pending interrupts to new destination in fixup_irqs()')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks, Roger.

