Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CDA90E401
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 09:06:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743447.1150358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJpOF-0008Gy-NU; Wed, 19 Jun 2024 07:05:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743447.1150358; Wed, 19 Jun 2024 07:05:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJpOF-0008FE-J5; Wed, 19 Jun 2024 07:05:55 +0000
Received: by outflank-mailman (input) for mailman id 743447;
 Wed, 19 Jun 2024 07:05:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ri0R=NV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sJpOD-0008EY-Uf
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 07:05:53 +0000
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [2607:f8b0:4864:20::a2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d4772aa-2e0a-11ef-90a3-e314d9c70b13;
 Wed, 19 Jun 2024 09:05:52 +0200 (CEST)
Received: by mail-vk1-xa2d.google.com with SMTP id
 71dfb90a1353d-4ecf00ea4fbso1665836e0c.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2024 00:05:52 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-441eede79basm63233131cf.0.2024.06.19.00.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 00:05:50 -0700 (PDT)
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
X-Inumbo-ID: 5d4772aa-2e0a-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718780751; x=1719385551; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=csUiPWVeVAZ6dD/SGvM5eZ7HmV22urkoGCaDVvk3BVg=;
        b=Dg6m2ZTvz3W8Mcd7lHVgG0h6kocT4OAo/nFxiTM739vInGkWHMKJAaVuUqpeywah6u
         bW0WZktOEEB8jJY1x8AOSLpZ6sEC3IiVip1h6OkS79d3VzY3eOUjuqoYsscy1h6CxgIw
         i7uaObHFB+CY0oiNuWv52ULkya5p4sM9HImrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718780751; x=1719385551;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=csUiPWVeVAZ6dD/SGvM5eZ7HmV22urkoGCaDVvk3BVg=;
        b=ZPxWO+qqjDVU9QjSJvWzwTT0pE/7sbNBco82+w4f0wAEPJIuprYG8WGI9dyDGzyp2i
         Scky8zrXbfAQ1VKUBwqSrFoQmrXO657viSe0P2KL2H1v6udGfYyrifcoV5uFXTqymNKd
         hVvomL/s7GBo8fXHvlnVvKCYkjWrwmY19D20ntm0nwnd9McvmEEgMiag0+eR/wBJ/O33
         6raPRgYIccsMvT8s25XqvlLzMkGls9u1dooJcVVTH4HTIjTe2NMUrjUbuUgW5bITjLyp
         hMASlUFSSOv4jHBcS4lp54jZ4vyjo3ellmK0BiXBBsRegqDkXOSQScIYvQoKMKYfObz1
         VZ3A==
X-Forwarded-Encrypted: i=1; AJvYcCX+rtMYadvRHRzXEf8d1BkLNz8o/ajZJqd+51E06zxc2S/pxRwmChdGTTdLRKZPX3aBgNhrt0pvvLcq+JR/uxVsNKC0MvxGBwdrUBBOzzM=
X-Gm-Message-State: AOJu0Yzrp77EDKetfnGP6xiUhYDkQ0ZDygPSgEzxgQY8WU3sYSgSzKED
	P50jnxFMZ5F1jyCGAlXAkg0TFtU6daFJFdhf/iAhVcwOFNS2ujAppIncnwFFiQg=
X-Google-Smtp-Source: AGHT+IFTlVdmtgH+8ATyFC4+KicezDBhKia3tVo65rhh+4KHxa07vvHQdUA+A9OEupcxUq0xaXr97w==
X-Received: by 2002:a05:6122:8d0:b0:4ed:145:3489 with SMTP id 71dfb90a1353d-4ef277db851mr2222709e0c.13.1718780751460;
        Wed, 19 Jun 2024 00:05:51 -0700 (PDT)
Date: Wed, 19 Jun 2024 09:05:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 3/3] x86/irq: forward pending interrupts to new
 destination in fixup_irqs()
Message-ID: <ZnKDTEX_eGz2sS4K@macbook>
References: <20240613165617.42538-1-roger.pau@citrix.com>
 <20240613165617.42538-4-roger.pau@citrix.com>
 <e3912334-4dbe-40e9-aed4-8b47e1570cc7@suse.com>
 <ZnFv7b4YNjeRXj6-@macbook>
 <2f388d0a-c9b5-409a-b622-5dfeb3093e82@suse.com>
 <ZnGerbiI7P9PHPmK@macbook>
 <ba89126f-715d-498e-81e1-2ed105ac2d1c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba89126f-715d-498e-81e1-2ed105ac2d1c@suse.com>

On Tue, Jun 18, 2024 at 06:30:22PM +0200, Jan Beulich wrote:
> On 18.06.2024 16:50, Roger Pau Monné wrote:
> > On Tue, Jun 18, 2024 at 04:34:50PM +0200, Jan Beulich wrote:
> >> On 18.06.2024 13:30, Roger Pau Monné wrote:
> >>> On Mon, Jun 17, 2024 at 03:41:12PM +0200, Jan Beulich wrote:
> >>>> On 13.06.2024 18:56, Roger Pau Monne wrote:
> >>>>> @@ -2686,11 +2705,27 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
> >>>>>          if ( desc->handler->disable )
> >>>>>              desc->handler->disable(desc);
> >>>>>  
> >>>>> +        /*
> >>>>> +         * If the current CPU is going offline and is (one of) the target(s) of
> >>>>> +         * the interrupt, signal to check whether there are any pending vectors
> >>>>> +         * to be handled in the local APIC after the interrupt has been moved.
> >>>>> +         */
> >>>>> +        if ( !cpu_online(cpu) && cpumask_test_cpu(cpu, desc->arch.cpu_mask) )
> >>>>> +            check_irr = true;
> >>>>> +
> >>>>>          if ( desc->handler->set_affinity )
> >>>>>              desc->handler->set_affinity(desc, affinity);
> >>>>>          else if ( !(warned++) )
> >>>>>              set_affinity = false;
> >>>>>  
> >>>>> +        if ( check_irr && apic_irr_read(vector) )
> >>>>> +            /*
> >>>>> +             * Forward pending interrupt to the new destination, this CPU is
> >>>>> +             * going offline and otherwise the interrupt would be lost.
> >>>>> +             */
> >>>>> +            send_IPI_mask(cpumask_of(cpumask_any(desc->arch.cpu_mask)),
> >>>>> +                          desc->arch.vector);
> >>>>
> >>>> Hmm, IRR may become set right after the IRR read (unlike in the other cases,
> >>>> where new IRQs ought to be surfacing only at the new destination). Doesn't
> >>>> this want moving ...
> >>>>
> >>>>>          if ( desc->handler->enable )
> >>>>>              desc->handler->enable(desc);
> >>>>
> >>>> ... past the actual affinity change?
> >>>
> >>> Hm, but the ->enable() hook is just unmasking the interrupt, the
> >>> actual affinity change is done in ->set_affinity(), and hence after
> >>> the call to ->set_affinity() no further interrupts should be delivered
> >>> to the CPU regardless of whether the source is masked?
> >>>
> >>> Or is it possible for the device/interrupt controller to not switch to
> >>> use the new destination until the interrupt is unmasked, and hence
> >>> could have pending masked interrupts still using the old destination?
> >>> IIRC For MSI-X it's required that the device updates the destination
> >>> target once the entry is unmasked.
> >>
> >> That's all not relevant here, I think. IRR gets set when an interrupt is
> >> signaled, no matter whether it's masked.
> > 
> > I'm kind of lost here, what does signaling mean in this context?
> > 
> > I would expect the interrupt vector to not get set in IRR if the MSI-X
> > entry is masked, as at that point the state of the address/data fields
> > might not be consistent (that's the whole point of masking it right?)
> > 
> >> It's its handling which the
> >> masking would prevent, i.e. the "moving" of the set bit from IRR to ISR.
> > 
> > My understanding was that the masking would prevent the message write to
> > the APIC from happening, and hence no vector should get set in IRR.
> 
> Hmm, yes, looks like I was confused. The masking is at the source side
> (IO-APIC RTE, MSI-X entry, or - if supported - in the MSI capability).
> So the sole case to worry about is MSI without mask-bit support then.

Yeah, and for MSI without masking bit support we don't care doing the
IRR check before or after the ->enable() hook, as that's a no-op in
that case.  The write to the MSI address/data fields has already been
done, and hence the issue would be exclusively with draining any
in-flight writes to the APIC doorbell (what you mention below).

> >> Plus we run with IRQs off here anyway if I'm not mistaken, so no
> >> interrupt can be delivered to the local CPU. IOW whatever IRR bits it
> >> has set (including ones becoming set between the IRR read and the actual
> >> vector change), those would never be serviced. Hence the reading of the
> >> bit ought to occur after the vector change: It's only then that we know
> >> the IRR bit corresponding to the old vector can't become set anymore.
> > 
> > Right, and the vector change happens in ->set_affinity(), not
> > ->enable().  See for example set_msi_affinity() and the
> > write_msi_msg(), that's where the vector gets changed.
> > 
> >> And even then we're assuming that no interrupt signals might still be
> >> "on their way" from the IO-APIC or a posted MSI message write by a
> >> device to the LAPIC (I have no idea how to properly fence that, or
> >> whether there are guarantees for this to never occur).
> > 
> > Yeah, those I expect would be completed in the window between the
> > write of the new vector/destination and the reading of IRR.
> 
> Except we have no idea on the latencies.

There isn't much else we can do? Even the current case where we add
the 1ms window at the end of the shuffling could still suffer from
this issue because we don't know the latencies.  IOW: I don't think
this is any worse than the current approach.

Thanks, Roger.

