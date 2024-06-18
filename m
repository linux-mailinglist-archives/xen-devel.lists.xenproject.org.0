Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E32DB90D609
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 16:50:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743155.1150056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJaAG-0008KT-57; Tue, 18 Jun 2024 14:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743155.1150056; Tue, 18 Jun 2024 14:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJaAG-0008Hw-24; Tue, 18 Jun 2024 14:50:28 +0000
Received: by outflank-mailman (input) for mailman id 743155;
 Tue, 18 Jun 2024 14:50:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TBP2=NU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sJaAE-0008Hq-VU
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 14:50:26 +0000
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [2607:f8b0:4864:20::834])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17dc6cc9-2d82-11ef-b4bb-af5377834399;
 Tue, 18 Jun 2024 16:50:24 +0200 (CEST)
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-44051a92f37so45034151cf.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 07:50:24 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-441f310c9f3sm55928931cf.94.2024.06.18.07.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 07:50:23 -0700 (PDT)
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
X-Inumbo-ID: 17dc6cc9-2d82-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718722223; x=1719327023; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sHm6Lq/dBzn2nekR8fHZVMB6KXyV9j+XN5zY9w7Xlfg=;
        b=VNqT4sGG9UY8uX3P/WMYuqgHoRd8eRkCc+HC/e24tQ61SGLqs5EDiWQDQS8iSOkRbk
         zTDQNXiieF+bJcyiHMScG3mcQfMCkt+m5TBx62v8kI8rjbxIBxzM2uYN3d4YkbFxYTx3
         +oYuk2a6cpbA/hdKeElvkJLm5W6zkSAFQVxD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718722223; x=1719327023;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sHm6Lq/dBzn2nekR8fHZVMB6KXyV9j+XN5zY9w7Xlfg=;
        b=H0pY8rniu1XPF8J3RHnI9AthtETjdQ96zn+AVCkJrP2bPNFBECGFWFJD3QjJzStyl4
         4nPeTMEdV0oDox0/ei+MzFjbtGXHsvMkf/PbVKCyTQJjLH5OmM0LRZMtm3nOTxHA4qlX
         iHL7PFjXaPMNxM89gjUaEfJJ6RhozxWfageriAgPYaH9u2po9oaqRk4MzKalSe3BXFRp
         0Iwo8wInj1GnouIqRdqOzABk5vtSffCcKTYVI8+ziVVddy9dsdGEoLkAjMDYQ6m2dIU8
         T0aL5SZBY0RemGU78Qwha0SXty4TFisMpouNANlsL9fRte9Ev6rg0+gUh3jEbpJT2EKM
         yhAg==
X-Forwarded-Encrypted: i=1; AJvYcCUD5qaiQDA+pbDHm65WN5FHScs0vpTOSRbGeXJmEwP9UbdqUoU7LUDPVD1YqPWK4UkGIu/Ccsoh2RCufCwTm/i7WFROsx5qdE8lzEtrtOw=
X-Gm-Message-State: AOJu0Yzd7RGKOs48n80mSYEoTOmdYXATBgd8P/z8eMQMDTysN5LpRG6b
	Gw+4LBs9q345GYpe+hx2XKLjBh0ynvgmdjKp/hEor4BpPMQrZREk+ZX0u/P/sUTp4yibhUcI0Sa
	s
X-Google-Smtp-Source: AGHT+IFzZ3DO7sBqc/aNKF7cs90d7dtPBY2NGr/Um6aP1QEh6UQq7+HshwlxMEwgs75pOYiBQjWG+g==
X-Received: by 2002:a05:622a:1a8b:b0:440:57ca:5b6b with SMTP id d75a77b69052e-4449bb37ca4mr51502951cf.18.1718722223417;
        Tue, 18 Jun 2024 07:50:23 -0700 (PDT)
Date: Tue, 18 Jun 2024 16:50:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 3/3] x86/irq: forward pending interrupts to new
 destination in fixup_irqs()
Message-ID: <ZnGerbiI7P9PHPmK@macbook>
References: <20240613165617.42538-1-roger.pau@citrix.com>
 <20240613165617.42538-4-roger.pau@citrix.com>
 <e3912334-4dbe-40e9-aed4-8b47e1570cc7@suse.com>
 <ZnFv7b4YNjeRXj6-@macbook>
 <2f388d0a-c9b5-409a-b622-5dfeb3093e82@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f388d0a-c9b5-409a-b622-5dfeb3093e82@suse.com>

On Tue, Jun 18, 2024 at 04:34:50PM +0200, Jan Beulich wrote:
> On 18.06.2024 13:30, Roger Pau Monné wrote:
> > On Mon, Jun 17, 2024 at 03:41:12PM +0200, Jan Beulich wrote:
> >> On 13.06.2024 18:56, Roger Pau Monne wrote:
> >>> fixup_irqs() is used to evacuate interrupts from to be offlined CPUs.  Given
> >>> the CPU is to become offline, the normal migration logic used by Xen where the
> >>> vector in the previous target(s) is left configured until the interrupt is
> >>> received on the new destination is not suitable.
> >>>
> >>> Instead attempt to do as much as possible in order to prevent loosing
> >>> interrupts.  If fixup_irqs() is called from the CPU to be offlined (as is
> >>> currently the case)
> >>
> >> Except (again) for smp_send_stop().
> > 
> > I guess I haven't worded this properly, the point I was trying to make
> > is that in the context of a CPU unplug fixup_irqs() is always called
> > from the CPU that's going offline.
> > 
> > What about:
> > 
> > "If fixup_irqs() is called from the CPU to be offlined (as is
> > currently the case for CPU hot unplug) ..."
> 
> Sounds good to me.
> 
> >>> @@ -2686,11 +2705,27 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
> >>>          if ( desc->handler->disable )
> >>>              desc->handler->disable(desc);
> >>>  
> >>> +        /*
> >>> +         * If the current CPU is going offline and is (one of) the target(s) of
> >>> +         * the interrupt, signal to check whether there are any pending vectors
> >>> +         * to be handled in the local APIC after the interrupt has been moved.
> >>> +         */
> >>> +        if ( !cpu_online(cpu) && cpumask_test_cpu(cpu, desc->arch.cpu_mask) )
> >>> +            check_irr = true;
> >>> +
> >>>          if ( desc->handler->set_affinity )
> >>>              desc->handler->set_affinity(desc, affinity);
> >>>          else if ( !(warned++) )
> >>>              set_affinity = false;
> >>>  
> >>> +        if ( check_irr && apic_irr_read(vector) )
> >>> +            /*
> >>> +             * Forward pending interrupt to the new destination, this CPU is
> >>> +             * going offline and otherwise the interrupt would be lost.
> >>> +             */
> >>> +            send_IPI_mask(cpumask_of(cpumask_any(desc->arch.cpu_mask)),
> >>> +                          desc->arch.vector);
> >>
> >> Hmm, IRR may become set right after the IRR read (unlike in the other cases,
> >> where new IRQs ought to be surfacing only at the new destination). Doesn't
> >> this want moving ...
> >>
> >>>          if ( desc->handler->enable )
> >>>              desc->handler->enable(desc);
> >>
> >> ... past the actual affinity change?
> > 
> > Hm, but the ->enable() hook is just unmasking the interrupt, the
> > actual affinity change is done in ->set_affinity(), and hence after
> > the call to ->set_affinity() no further interrupts should be delivered
> > to the CPU regardless of whether the source is masked?
> > 
> > Or is it possible for the device/interrupt controller to not switch to
> > use the new destination until the interrupt is unmasked, and hence
> > could have pending masked interrupts still using the old destination?
> > IIRC For MSI-X it's required that the device updates the destination
> > target once the entry is unmasked.
> 
> That's all not relevant here, I think. IRR gets set when an interrupt is
> signaled, no matter whether it's masked.

I'm kind of lost here, what does signaling mean in this context?

I would expect the interrupt vector to not get set in IRR if the MSI-X
entry is masked, as at that point the state of the address/data fields
might not be consistent (that's the whole point of masking it right?)

> It's its handling which the
> masking would prevent, i.e. the "moving" of the set bit from IRR to ISR.

My understanding was that the masking would prevent the message write to
the APIC from happening, and hence no vector should get set in IRR.

> Plus we run with IRQs off here anyway if I'm not mistaken, so no
> interrupt can be delivered to the local CPU. IOW whatever IRR bits it
> has set (including ones becoming set between the IRR read and the actual
> vector change), those would never be serviced. Hence the reading of the
> bit ought to occur after the vector change: It's only then that we know
> the IRR bit corresponding to the old vector can't become set anymore.

Right, and the vector change happens in ->set_affinity(), not
->enable().  See for example set_msi_affinity() and the
write_msi_msg(), that's where the vector gets changed.

> And even then we're assuming that no interrupt signals might still be
> "on their way" from the IO-APIC or a posted MSI message write by a
> device to the LAPIC (I have no idea how to properly fence that, or
> whether there are guarantees for this to never occur).

Yeah, those I expect would be completed in the window between the
write of the new vector/destination and the reading of IRR.

Thanks, Roger.

