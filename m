Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CF88C79E8
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 17:57:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723496.1128392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7dTI-0004UK-4F; Thu, 16 May 2024 15:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723496.1128392; Thu, 16 May 2024 15:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7dTI-0004SM-1V; Thu, 16 May 2024 15:56:44 +0000
Received: by outflank-mailman (input) for mailman id 723496;
 Thu, 16 May 2024 15:56:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h+4+=MT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s7dTG-0004Rs-NR
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 15:56:42 +0000
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2ba055e-139c-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 17:56:41 +0200 (CEST)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-43e0d564136so31906821cf.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 08:56:41 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43e11c215adsm64911511cf.59.2024.05.16.08.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 08:56:40 -0700 (PDT)
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
X-Inumbo-ID: e2ba055e-139c-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715875000; x=1716479800; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H1Ld4sZ2GVD2soCDd3RxE7hNwjqhiWJsJNoQFAT72gk=;
        b=BFcaVUX0FzIyKxM8BMlr0S5tur99uazBIX0BKZ2lSOu3hmM7gxv380LUp+/FY+NjTR
         SIVIEfyZfaamDuW8pOzImU0AFR9Q9EbkTV5+pr7O7FRjW1F5ZUx4701zJ9GcewwbDQJ1
         NJEHt5CzNJPBinALAHarckIRGG0R3E8SaB2mY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715875000; x=1716479800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1Ld4sZ2GVD2soCDd3RxE7hNwjqhiWJsJNoQFAT72gk=;
        b=jdiAX2lxqRij8KEj+VmaQf5F6H7QKCNmsKl3ccxRlvbDYUerSava3FE1i9DwUZT8Y5
         XG6ypU5KBu/7TEc7hFu90Z+sAzdtL4RGaE9YUUhceLhUUSV9avfpI+znoAXprKItHEkD
         Of3nuB+RrC4Qy+2IWbPXNPLLXVi/nHCUPu+mjlrgKTi52X+5oyZ2HXqKZiC3GNlvV7yW
         jXbN+lzRVK2ax3S+WeUCN4zPEtw6TT2M9xphcTzDxImLMKrPcqnfCGVB6//TegwqT3Iv
         SCB5j9FR47OLxyegtyQiFosKaJnYVUgPMx60+SmzZ4onAd7uZ+Xw7ogWxRsAXcAAoR/i
         6XPg==
X-Forwarded-Encrypted: i=1; AJvYcCVuO8gq6MifvukO1OlOxgMW6Ge6/B90MDrYL2aZubOwMiauWdai4D9mB4sq4V6/tGtBO+I0V1pvKf2+zCztLkQI01iYQTwofcCA07Si/Jg=
X-Gm-Message-State: AOJu0Yy/7DZ9QzT0GT/VNpv6lVGajmjAHEbn8Mk6GWkwFuUIKzQ7g1cw
	dqAiNGrJHk4CFpxDK7X+eGsQ2Bx+8dvUGqCxEaLMOltcCofvhsDw0/f30Xu/hdSEjgUdjSjdLwh
	o
X-Google-Smtp-Source: AGHT+IE0Ti/uMqcgvVLOs8lI3Xll6tbDbt2WCYfYD0DK3JphTjOAcahuRH/qNKV631hZPCtV2hZ4iQ==
X-Received: by 2002:a05:622a:5592:b0:436:7bdb:d952 with SMTP id d75a77b69052e-43dfdac1fe2mr227129111cf.19.1715875000481;
        Thu, 16 May 2024 08:56:40 -0700 (PDT)
Date: Thu, 16 May 2024 17:56:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.19] xen/x86: limit interrupt movement done by
 fixup_irqs()
Message-ID: <ZkYstvGkdffWMn2z@macbook>
References: <20240516132224.86005-1-roger.pau@citrix.com>
 <449c7562-18a5-4f5b-a7a6-36fbf0383517@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <449c7562-18a5-4f5b-a7a6-36fbf0383517@suse.com>

On Thu, May 16, 2024 at 05:00:54PM +0200, Jan Beulich wrote:
> On 16.05.2024 15:22, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/irq.c
> > +++ b/xen/arch/x86/irq.c
> > @@ -2527,7 +2527,7 @@ static int __init cf_check setup_dump_irqs(void)
> >  }
> >  __initcall(setup_dump_irqs);
> >  
> > -/* Reset irq affinities to match the given CPU mask. */
> > +/* Evacuate interrupts assigned to CPUs not present in the input CPU mask. */
> >  void fixup_irqs(const cpumask_t *mask, bool verbose)
> >  {
> 
> Evacuating is one purpose. Updating affinity, if need be, is another. I've
> been wondering more than once though whether it is actually correct /
> necessary for ->affinity to be updated by the function. As it stands you
> don't remove the respective code, though.

Yeah, I didn't want to get into updating ->affinity in this patch, so
decided to leave that as-is.

Note however that if we shuffle the interrupt around we should update
->affinity, so that the new destination is part of ->affinity?

Otherwise we could end up with the interrupt assigned to CPU(s) that
are not part of the ->affinity mask.  Maybe that's OK, TBH I'm not
sure I understand the purpose of the ->affinity mask, hence why I've
decided to leave it alone in this patch.

> 
> > @@ -2576,7 +2576,12 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
> >                  release_old_vec(desc);
> >          }
> >  
> > -        if ( !desc->action || cpumask_subset(desc->affinity, mask) )
> > +        /*
> > +         * Avoid shuffling the interrupt around if it's assigned to a CPU set
> > +         * that's all covered by the requested affinity mask.
> > +         */
> > +        cpumask_and(affinity, desc->arch.cpu_mask, &cpu_online_map);
> > +        if ( !desc->action || cpumask_subset(affinity, mask) )
> >          {
> >              spin_unlock(&desc->lock);
> >              continue;
> 
> First my understanding of how the two CPU sets are used: ->affinity is
> merely a representation of where the IRQ is permitted to be handled.
> ->arch.cpu_mask describes all CPUs where the assigned vector is valid
> (and would thus need cleaning up when a new vector is assigned). Neither
> of the two needs to be a strict subset of the other.

Oh, so it's allowed to have the interrupt target a CPU
(->arch.cpu_mask) that's not set in the affinity mask?

> 
> (It's not really clear whether ->arch.cpu_mask is [supposed to be] a
> subset of cpu_online_map.)

Not according to the description in arch_irq_desc:

        /*
         * Except for high priority interrupts @cpu_mask may have bits set for
         * offline CPUs.  Consumers need to be careful to mask this down to
         * online ones as necessary.  There is supposed to always be a non-
         * empty intersection with cpu_online_map.
         */

So ->arch.cpu_mask can (according to the comment) not strictly be a
subset of cpu_online_map.

Note this is only possible when using logical destination mode, so
removing that would turn the destination field into an unsigned int
that would point to a single CPU that must be present in
cpu_online_map.

> If that understanding of mine is correct, going from just ->arch.cpu_mask
> doesn't look quite right to me, as that may include CPUs not in ->affinity.
> As in: Things could be further limited, by also ANDing in ->affinity.

Hm, my expectation would be that ->arch.cpu_mask is a subset of
->affinity, but even if it's not, what we do care in fixup_cpus() is
what CPUs the interrupt targets, as we need to move the interrupt if
the target set is not in the input mask set.  I don't think ->affinity
should be taken into account for that decision, it should be done
based exclusively on which CPU(s) the interrupt target
(->arch.cpu_mask).

> At the same time your(?) and my variant suffer from cpumask_subset()
> possibly returning true despite the CPU the IRQ is presently being
> handled on being the one that we're in the process of bringing down.

No, I'm not sure I see how that can happen.  The CPU we are bringing
down will always be clear from the input CPU mask, and hence
cpumask_subset(->arch.cpu_mask, mask) will only return true if all the
set CPUs in ->arch.cpu_mask are also set in mask.  IOW: none of the
possible target destinations is a CPU to be removed.

> In
> that case we absolutely cannot skip the move. (I'd like to note that
> there are only two possible input values of "mask" for the function. The
> case I think you've been looking into is when it's &cpu_online_map.

Well, it's cpu_online_map which already has the CPU to be offlined
cleared.  See the call to cpumask_clear_cpu() ahead of calling
fixup_irqs().

> In
> which case cpumask_subset() is going to always return true with your
> change in place, if I'm not mistaken. That seems to make your change
> questionable. Yet with that I guess I'm overlooking something.)

I might we wrong, but I think you are missing that the to be offlined
CPU has been removed from cpu_online_map by the time it gets passed
to fixup_irqs().

> Plus there remains the question of whether updating ->affinity can indeed
> be skipped in more cases than it is right now (prior to you patch), or
> whether up front we may want to get rid of that updating (in line, I think,
> with earlier changes we did elsewhere) altogether.

I'm not sure about ->affinity TBH, that's why I've opted to leave it
alone for the time being.  It doesn't seem like a very helpful field
right now.

I would expect it to be mostly static, and populated with the set of
CPUs that are closer to (NUMA-wise) the device the interrupt belongs
to, but I'm not seeing any of this.  It seems to be set arbitrarily to
the CPU that binds the interrupt.

Thanks, Roger.

