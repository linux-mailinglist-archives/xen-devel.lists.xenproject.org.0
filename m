Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E4D90514E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 13:24:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739220.1146201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHM4O-0000ku-Oe; Wed, 12 Jun 2024 11:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739220.1146201; Wed, 12 Jun 2024 11:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHM4O-0000jE-Ls; Wed, 12 Jun 2024 11:23:12 +0000
Received: by outflank-mailman (input) for mailman id 739220;
 Wed, 12 Jun 2024 11:23:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kV4F=NO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sHM4N-0000j8-AL
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 11:23:11 +0000
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [2607:f8b0:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24facf0c-28ae-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 13:23:08 +0200 (CEST)
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-3d227b1f4f0so1161179b6e.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 04:23:09 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44085391d1esm29071241cf.16.2024.06.12.04.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 04:23:07 -0700 (PDT)
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
X-Inumbo-ID: 24facf0c-28ae-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718191388; x=1718796188; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vcgFRsodj/wMV+ko0JmTgp51Mi6AMfxvIQHoqlh4BT8=;
        b=Z5XmlrmL/6+6r1LUv5MScrh04IqoM+0Jkb4E/Jpp+mh3mlUI6CLkGe240SqYMAhDwU
         iAplxfDOey1p+gCFlbtZr8/Gs5Hc3vGDa9jWLKkbUTMNpIhmJBnJo4Lr1y/RYFkoYlPR
         8AiFbpRGVtzh0N5D7DCTW+j3ZANEqzeQB/H6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718191388; x=1718796188;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vcgFRsodj/wMV+ko0JmTgp51Mi6AMfxvIQHoqlh4BT8=;
        b=Buugfp0QHNzKiNH1mdX3cu78OD//Gc8zW7RwbL8967P2lQ57TU6K/qCfr+tPiFmvNA
         5N0akxkiQoLOlPZ3oxaT35tqQ43/LZKRWXkcgBeu5ara2ntGrnY6E/BZeaXuVqFuvlBB
         htDlQC1l7mi0deJe8sOSl7OwTVmwbcsl5LLjqT/a6IZkCKUk+iHRjAxMDy1/8CHGhSH+
         q4nkPn7nB3G2o0j+VhFti5UDM4jFJoY++7e3anY4+z775IBG3mkPWfw+Tz+wmbQnGMK2
         1lZyMUivQOvGic8WY37vokifQ/5w24Iik+3kKBv7GSr/4X/j71Fn0KQkAxjtRM/QAKSy
         jAOg==
X-Forwarded-Encrypted: i=1; AJvYcCVBQwnnwnYIgAYroeNAM+CaF++kZkW6WMgonq7YbkKcYsOhHBloYGbyhkGiGgImi27oEKHWZQeV32n3ge/tVQgB4DjfvPGtKMYUq9kf/V0=
X-Gm-Message-State: AOJu0Yzn6Q3qFJstmJfg9wrEg3A4OfM1RQ/iAwzyutZl+e6hcE07w5kp
	OEuX/KZepLu95Shqlj2k3hLEyJTLtQejX0YXVzs3pmTu8JTeypyMzKV5wIR7MPb9lEcXG0M4dTg
	6
X-Google-Smtp-Source: AGHT+IHBKYr6ZlOs/EJeu0I8X6WloWCRXmj47u36gLyGpEevia2d56RvKCeY/DfNifLIVCUDQUlkiA==
X-Received: by 2002:a05:6808:2f0a:b0:3d2:1e7e:60a0 with SMTP id 5614622812f47-3d23dfd92c8mr1721865b6e.11.1718191387507;
        Wed, 12 Jun 2024 04:23:07 -0700 (PDT)
Date: Wed, 12 Jun 2024 13:23:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 7/7] x86/irq: forward pending interrupts to new
 destination in fixup_irqs()
Message-ID: <ZmmFGc7TSoKsCH95@macbook>
References: <20240610142043.11924-1-roger.pau@citrix.com>
 <20240610142043.11924-8-roger.pau@citrix.com>
 <7e090e00-2061-4ef1-a0a4-b45ac86c5ee6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e090e00-2061-4ef1-a0a4-b45ac86c5ee6@suse.com>

On Tue, Jun 11, 2024 at 03:50:42PM +0200, Jan Beulich wrote:
> On 10.06.2024 16:20, Roger Pau Monne wrote:
> > fixup_irqs() is used to evacuate interrupts from to be offlined CPUs.  Given
> > the CPU is to become offline, the normal migration logic used by Xen where the
> > vector in the previous target(s) is left configured until the interrupt is
> > received on the new destination is not suitable.
> > 
> > Instead attempt to do as much as possible in order to prevent loosing
> > interrupts.  If fixup_irqs() is called from the CPU to be offlined (as is
> > currently the case) attempt to forward pending vectors when interrupts that
> > target the current CPU are migrated to a different destination.
> > 
> > Additionally, for interrupts that have already been moved from the current CPU
> > prior to the call to fixup_irqs() but that haven't been delivered to the new
> > destination (iow: interrupts with move_in_progress set and the current CPU set
> > in ->arch.old_cpu_mask) also check whether the previous vector is pending and
> > forward it to the new destination.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v1:
> >  - Rename to apic_irr_read().
> > ---
> >  xen/arch/x86/include/asm/apic.h |  5 +++++
> >  xen/arch/x86/irq.c              | 37 ++++++++++++++++++++++++++++++++-
> >  2 files changed, 41 insertions(+), 1 deletion(-)
> > 
> > diff --git a/xen/arch/x86/include/asm/apic.h b/xen/arch/x86/include/asm/apic.h
> > index d1cb001fb4ab..7bd66dc6e151 100644
> > --- a/xen/arch/x86/include/asm/apic.h
> > +++ b/xen/arch/x86/include/asm/apic.h
> > @@ -132,6 +132,11 @@ static inline bool apic_isr_read(uint8_t vector)
> >              (vector & 0x1f)) & 1;
> >  }
> >  
> > +static inline bool apic_irr_read(unsigned int vector)
> > +{
> > +    return apic_read(APIC_IRR + (vector / 32 * 0x10)) & (1U << (vector % 32));
> > +}
> > +
> >  static inline u32 get_apic_id(void)
> >  {
> >      u32 id = apic_read(APIC_ID);
> > diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> > index 54eabd23995c..ed262fb55f4a 100644
> > --- a/xen/arch/x86/irq.c
> > +++ b/xen/arch/x86/irq.c
> > @@ -2601,7 +2601,7 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
> >  
> >      for ( irq = 0; irq < nr_irqs; irq++ )
> >      {
> > -        bool break_affinity = false, set_affinity = true;
> > +        bool break_affinity = false, set_affinity = true, check_irr = false;
> >          unsigned int vector, cpu = smp_processor_id();
> >          cpumask_t *affinity = this_cpu(scratch_cpumask);
> >  
> > @@ -2649,6 +2649,25 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
> >               !cpumask_test_cpu(cpu, &cpu_online_map) &&
> >               cpumask_test_cpu(cpu, desc->arch.old_cpu_mask) )
> >          {
> > +            /*
> > +             * This to be offlined CPU was the target of an interrupt that's
> > +             * been moved, and the new destination target hasn't yet
> > +             * acknowledged any interrupt from it.
> > +             *
> > +             * We know the interrupt is configured to target the new CPU at
> > +             * this point, so we can check IRR for any pending vectors and
> > +             * forward them to the new destination.
> > +             *
> > +             * Note the difference between move_in_progress or
> > +             * move_cleanup_count being set.  For the later we know the new
> > +             * destination has already acked at least one interrupt from this
> > +             * source, and hence there's no need to forward any stale
> > +             * interrupts.
> > +             */
> 
> I'm a little confused by this last paragraph: It talks about a difference,
> yet ...
> 
> > +            if ( apic_irr_read(desc->arch.old_vector) )
> > +                send_IPI_mask(cpumask_of(cpumask_any(desc->arch.cpu_mask)),
> > +                              desc->arch.vector);
> 
> ... in the code being commented there's no difference visible. Hmm, I guess
> this is related to the enclosing if(). Maybe this could be worded a little
> differently, e.g. starting with "Note that for the other case -
> move_cleanup_count being non-zero - we know ..."?

Hm, I see.  Yes, the difference is that for interrupts that have
move_cleanup_count set we don't forward pending interrupts in IRR on
this CPU.  I put this here because I think it's more naturally
arranged with the rest of the comment.  I can pull the whole comment
ahead if the if() if that's better.

> > @@ -2689,11 +2708,27 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
> >          if ( desc->handler->disable )
> >              desc->handler->disable(desc);
> >  
> > +        /*
> > +         * If the current CPU is going offline and is (one of) the target(s) of
> > +         * the interrupt signal to check whether there are any pending vectors
> > +         * to be handled in the local APIC after the interrupt has been moved.
> > +         */
> 
> After reading this a number of times, I think there wants to be a comma between
> "interrupt" and "signal". Or am I getting wrong what is being meant?

Indeed.

> > +        if ( !cpu_online(cpu) && cpumask_test_cpu(cpu, desc->arch.cpu_mask) )
> > +            check_irr = true;
> > +
> >          if ( desc->handler->set_affinity )
> >              desc->handler->set_affinity(desc, affinity);
> >          else if ( !(warned++) )
> >              set_affinity = false;
> >  
> > +        if ( check_irr && apic_irr_read(vector) )
> > +            /*
> > +             * Forward pending interrupt to the new destination, this CPU is
> > +             * going offline and otherwise the interrupt would be lost.
> > +             */
> > +            send_IPI_mask(cpumask_of(cpumask_any(desc->arch.cpu_mask)),
> > +                          desc->arch.vector);
> > +
> >          if ( desc->handler->enable )
> >              desc->handler->enable(desc);
> >  
> 
> Down from here, after the loop, there's a 1ms window where latched but not
> yet delivered interrupts can be received. How's that playing together with
> the changes you're making? Aren't we then liable to get two interrupts, one
> at the old and one at the new source, in unknown order?

I was mistakenly thinking that clear_local_APIC() would block
interrupt delivery, but that's not the case, so yes, interrupts should
still be delivered in the window below.

Let me test without this last patch.

Thanks, Roger.

