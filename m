Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C261290E58E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 10:33:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743535.1150451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJqkJ-0001q2-TI; Wed, 19 Jun 2024 08:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743535.1150451; Wed, 19 Jun 2024 08:32:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJqkJ-0001nK-QJ; Wed, 19 Jun 2024 08:32:47 +0000
Received: by outflank-mailman (input) for mailman id 743535;
 Wed, 19 Jun 2024 08:32:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ri0R=NV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sJqkI-0001my-MU
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 08:32:46 +0000
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [2607:f8b0:4864:20::929])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f4f118a-2e16-11ef-b4bb-af5377834399;
 Wed, 19 Jun 2024 10:32:43 +0200 (CEST)
Received: by mail-ua1-x929.google.com with SMTP id
 a1e0cc1a2514c-80b841b1b80so1609165241.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2024 01:32:43 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798abe47f2csm589470185a.116.2024.06.19.01.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 01:32:42 -0700 (PDT)
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
X-Inumbo-ID: 7f4f118a-2e16-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718785963; x=1719390763; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e6g/72tlSXRmAUn+a7LaDTmwLDTSr/tE+RieH9sAXL4=;
        b=fzrAxYeke537d3BIRJuoW5mWaTmPdxRHNaP7RbTkTvP7qekh8TRgz3RqizUkVqCvc2
         SGFpRWQdUAuiEP0DiixHtD52zWVt+1Uyy3A4fNOu5gT9EKvUJeaG9aXTdd23ncoFFcPB
         2qGDMlQRG1qe0xwP0XQ8DaFUSlDpqvxZa9nI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718785963; x=1719390763;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e6g/72tlSXRmAUn+a7LaDTmwLDTSr/tE+RieH9sAXL4=;
        b=F5NEv+69J+xr7NWxFB8HG7jJxc/HE9Cd/swZ0rEo+ekdjUb6dNqiJP07K+HAooXVRc
         jFIUsXHg9FWEJrvXU9NAeFe9A166rOH+Ld5guMt/VtkD1nP3xk7mgg8lPGFo4YlQHH0W
         rAu1CJeSrWtCSpIR3sMB6NnOdaUPcPHoFpjLmQB+xO7cJLViRD2sQv/kQ4JJB6+o3Yx5
         QyA6UfsaGLTy+npfDeVTZNeXSmLwgj4FfsnBJJQZHGBPWKinkq12Gh2daSCgcC6cmnyN
         UB0LGf4brG/zHpUUa9uEMbkdDWkh6HzCal5fOTimfzhNCTJ7Z54sIUZwcg/4TisKcjej
         M69A==
X-Forwarded-Encrypted: i=1; AJvYcCWozpbfq6YsV/ngP55KyvLN/AB5ivvm3VPHk5IuvKksVSRrM53k9sGFmI7jdrCFk3wyuPkU0BePVLMtV6aovHS7en7vIxYAKkCFHcGE6lo=
X-Gm-Message-State: AOJu0YwFfDwDE1kI4z2ftPf9Lln3uuSXEXKazuRu7qZYwWzmiuuqiLX1
	9KtcCkxnQjxAda5tuivOQrqvKYdLw/EyoVpDiNQ+dtu1asTkEshAVc54AClT2Q2ymJJfqhZOrSE
	r
X-Google-Smtp-Source: AGHT+IH78Qasgtu/d4If44RwNmd72vZQom8OpZpM7CIl1mGl2R9xTG+nrciAu7MGojEZdElHYwZEYg==
X-Received: by 2002:a67:ff07:0:b0:48c:368c:3673 with SMTP id ada2fe7eead31-48f13097569mr2063437137.28.1718785962613;
        Wed, 19 Jun 2024 01:32:42 -0700 (PDT)
Date: Wed, 19 Jun 2024 10:32:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 3/3] x86/irq: forward pending interrupts to new
 destination in fixup_irqs()
Message-ID: <ZnKXqDxlG2d2MohM@macbook>
References: <20240613165617.42538-1-roger.pau@citrix.com>
 <20240613165617.42538-4-roger.pau@citrix.com>
 <e3912334-4dbe-40e9-aed4-8b47e1570cc7@suse.com>
 <ZnFv7b4YNjeRXj6-@macbook>
 <2f388d0a-c9b5-409a-b622-5dfeb3093e82@suse.com>
 <ZnGerbiI7P9PHPmK@macbook>
 <ba89126f-715d-498e-81e1-2ed105ac2d1c@suse.com>
 <ZnKDTEX_eGz2sS4K@macbook>
 <541885b6-fd09-4531-8ae9-8e57e504c1b3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <541885b6-fd09-4531-8ae9-8e57e504c1b3@suse.com>

On Wed, Jun 19, 2024 at 09:24:41AM +0200, Jan Beulich wrote:
> On 19.06.2024 09:05, Roger Pau Monné wrote:
> > On Tue, Jun 18, 2024 at 06:30:22PM +0200, Jan Beulich wrote:
> >> On 18.06.2024 16:50, Roger Pau Monné wrote:
> >>> On Tue, Jun 18, 2024 at 04:34:50PM +0200, Jan Beulich wrote:
> >>>> On 18.06.2024 13:30, Roger Pau Monné wrote:
> >>>>> On Mon, Jun 17, 2024 at 03:41:12PM +0200, Jan Beulich wrote:
> >>>>>> On 13.06.2024 18:56, Roger Pau Monne wrote:
> >>>>>>> @@ -2686,11 +2705,27 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
> >>>>>>>          if ( desc->handler->disable )
> >>>>>>>              desc->handler->disable(desc);
> >>>>>>>  
> >>>>>>> +        /*
> >>>>>>> +         * If the current CPU is going offline and is (one of) the target(s) of
> >>>>>>> +         * the interrupt, signal to check whether there are any pending vectors
> >>>>>>> +         * to be handled in the local APIC after the interrupt has been moved.
> >>>>>>> +         */
> >>>>>>> +        if ( !cpu_online(cpu) && cpumask_test_cpu(cpu, desc->arch.cpu_mask) )
> >>>>>>> +            check_irr = true;
> >>>>>>> +
> >>>>>>>          if ( desc->handler->set_affinity )
> >>>>>>>              desc->handler->set_affinity(desc, affinity);
> >>>>>>>          else if ( !(warned++) )
> >>>>>>>              set_affinity = false;
> >>>>>>>  
> >>>>>>> +        if ( check_irr && apic_irr_read(vector) )
> >>>>>>> +            /*
> >>>>>>> +             * Forward pending interrupt to the new destination, this CPU is
> >>>>>>> +             * going offline and otherwise the interrupt would be lost.
> >>>>>>> +             */
> >>>>>>> +            send_IPI_mask(cpumask_of(cpumask_any(desc->arch.cpu_mask)),
> >>>>>>> +                          desc->arch.vector);
> >>>>>>
> >>>>>> Hmm, IRR may become set right after the IRR read (unlike in the other cases,
> >>>>>> where new IRQs ought to be surfacing only at the new destination). Doesn't
> >>>>>> this want moving ...
> >>>>>>
> >>>>>>>          if ( desc->handler->enable )
> >>>>>>>              desc->handler->enable(desc);
> >>>>>>
> >>>>>> ... past the actual affinity change?
> >>>>>
> >>>>> Hm, but the ->enable() hook is just unmasking the interrupt, the
> >>>>> actual affinity change is done in ->set_affinity(), and hence after
> >>>>> the call to ->set_affinity() no further interrupts should be delivered
> >>>>> to the CPU regardless of whether the source is masked?
> >>>>>
> >>>>> Or is it possible for the device/interrupt controller to not switch to
> >>>>> use the new destination until the interrupt is unmasked, and hence
> >>>>> could have pending masked interrupts still using the old destination?
> >>>>> IIRC For MSI-X it's required that the device updates the destination
> >>>>> target once the entry is unmasked.
> >>>>
> >>>> That's all not relevant here, I think. IRR gets set when an interrupt is
> >>>> signaled, no matter whether it's masked.
> >>>
> >>> I'm kind of lost here, what does signaling mean in this context?
> >>>
> >>> I would expect the interrupt vector to not get set in IRR if the MSI-X
> >>> entry is masked, as at that point the state of the address/data fields
> >>> might not be consistent (that's the whole point of masking it right?)
> >>>
> >>>> It's its handling which the
> >>>> masking would prevent, i.e. the "moving" of the set bit from IRR to ISR.
> >>>
> >>> My understanding was that the masking would prevent the message write to
> >>> the APIC from happening, and hence no vector should get set in IRR.
> >>
> >> Hmm, yes, looks like I was confused. The masking is at the source side
> >> (IO-APIC RTE, MSI-X entry, or - if supported - in the MSI capability).
> >> So the sole case to worry about is MSI without mask-bit support then.
> > 
> > Yeah, and for MSI without masking bit support we don't care doing the
> > IRR check before or after the ->enable() hook, as that's a no-op in
> > that case.  The write to the MSI address/data fields has already been
> > done, and hence the issue would be exclusively with draining any
> > in-flight writes to the APIC doorbell (what you mention below).
> 
> Except that both here ...
> 
> >>>> Plus we run with IRQs off here anyway if I'm not mistaken, so no
> >>>> interrupt can be delivered to the local CPU. IOW whatever IRR bits it
> >>>> has set (including ones becoming set between the IRR read and the actual
> >>>> vector change), those would never be serviced. Hence the reading of the
> >>>> bit ought to occur after the vector change: It's only then that we know
> >>>> the IRR bit corresponding to the old vector can't become set anymore.
> >>>
> >>> Right, and the vector change happens in ->set_affinity(), not
> >>> ->enable().  See for example set_msi_affinity() and the
> >>> write_msi_msg(), that's where the vector gets changed.
> >>>
> >>>> And even then we're assuming that no interrupt signals might still be
> >>>> "on their way" from the IO-APIC or a posted MSI message write by a
> >>>> device to the LAPIC (I have no idea how to properly fence that, or
> >>>> whether there are guarantees for this to never occur).
> >>>
> >>> Yeah, those I expect would be completed in the window between the
> >>> write of the new vector/destination and the reading of IRR.
> >>
> >> Except we have no idea on the latencies.
> > 
> > There isn't much else we can do? Even the current case where we add
> > the 1ms window at the end of the shuffling could still suffer from
> > this issue because we don't know the latencies.  IOW: I don't think
> > this is any worse than the current approach.
> 
> ... and here, the later we read IRR, the better the chances we don't miss
> anything. Even the no-op ->enable() isn't a no-op execution-wise. In fact
> it (quite pointlessly[1]) is an indirect call to irq_enable_none(). I'm
> actually inclined to suggest that we try to even further delay the IRR
> read, certainly past the cpumask_copy(), maybe even past the spin_unlock()
> (latching CPU and vector into local variables, along with the latching of
> ->affinity that's already there).

Moving past cpumask_copy() would be OK.  Moving past the spin_unlock()
I'm not so sure.  Isn't it possible that once the desc is unlocked the
interrupt starts another movement, and hence by the time the forwarded
vector is injected the irq desc has already moved to yet a different
CPU?

I don't think this is realistic given the window between the
spin_unlock() and the injection of the vector, but could be
possible.

If you are fine with moving past the cpumask_copy() but before the
spin_unlock() I can post an updated version with that.

Thanks, Roger.

