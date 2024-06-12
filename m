Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DDE90508E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 12:40:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739160.1146116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHLOa-0003cb-0c; Wed, 12 Jun 2024 10:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739160.1146116; Wed, 12 Jun 2024 10:39:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHLOZ-0003aI-U9; Wed, 12 Jun 2024 10:39:59 +0000
Received: by outflank-mailman (input) for mailman id 739160;
 Wed, 12 Jun 2024 10:39:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kV4F=NO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sHLOY-0003Zt-K1
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 10:39:58 +0000
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [2607:f8b0:4864:20::f32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c539ee3-28a8-11ef-90a3-e314d9c70b13;
 Wed, 12 Jun 2024 12:39:57 +0200 (CEST)
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-6b06bb80d7dso20461946d6.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 03:39:57 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b04f6c4022sm66718626d6.51.2024.06.12.03.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 03:39:55 -0700 (PDT)
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
X-Inumbo-ID: 1c539ee3-28a8-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718188796; x=1718793596; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B5F2JmgWRYZgyg+QL6wdx6HfKJIQYTTDoVrNtSqqYF4=;
        b=RRG06pC6L1KcdgB65zqLXzWbGGyVe/slEjUX1qzdVfACYssrGaLv7LR1NTykeAVldW
         MMg++7++AyT4GnZcUPKt1oOke/2IeruJ+iBr7BwdHCLk3PbQiBJlnQszEd0S0F97YDUV
         EQQzZDMBNprQT6J89B/ZgxNnpCwz9P9/JI1io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718188796; x=1718793596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5F2JmgWRYZgyg+QL6wdx6HfKJIQYTTDoVrNtSqqYF4=;
        b=spJGGmJFqfKaPw4baEHF5NDWJUk7qZckcubdVJ5DwoT1W+ROqmK8p4TArnc9Kx0ecB
         vo8X01J3D7zjzQrqrWdCZv/pXXmyuIwI/T0o/5c7enEHif/TrCYSrau8Y7whCggeqLe4
         nC9ZLkv+1LEUso9v0r50U/ti6loBd0h8j1DekP22JyjDbtxdJHzVUKLnMZ2FfzYTo6a3
         gKs+3ieyoHQcvKKQr7RUVWCKY7A9wXMbPXKEpmg5yr3cCN4muI5JFs1P6etIs+B+3doY
         lJXp/YW831tDAnx9ABFpUTj4P9NoH5Vi6q+RbGd1WMsA3E7gtxaLCtr3+LiWbuzqgb79
         jeBw==
X-Forwarded-Encrypted: i=1; AJvYcCW7AtnrLbvGN4Gk+myQkcJeoYvozaFIC6qFsrRnN/zZup5nH0VNcjUO6nCi1m3+0Ypk/I4gyLiIaV8IAVq/H+uYXpeTR/wkmG/Rqa4LlHk=
X-Gm-Message-State: AOJu0YzAJgsyAvHD6Tl5SzncN5V+jre39hpA+jNWhK5tr/0STYBP/B9x
	Ddu5Eya3EwlDFwLn4Xr6+vW+z71xgmHv0blGnczmcvPImRJIFHn5ubEzQeV61Rg=
X-Google-Smtp-Source: AGHT+IFOopaJiRtWtC/ylf1krPYyrUL7CViCOhuAI5ARVBxdZ7QRGSNqBFXiJRnXS3G00mnle0TQQQ==
X-Received: by 2002:a05:6214:3c85:b0:6af:c64c:d1ae with SMTP id 6a1803df08f44-6b191a659d7mr10785996d6.15.1718188795951;
        Wed, 12 Jun 2024 03:39:55 -0700 (PDT)
Date: Wed, 12 Jun 2024 12:39:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 6/7] x86/irq: handle moving interrupts in
 _assign_irq_vector()
Message-ID: <Zml6-ViFPTWI1cUc@macbook>
References: <20240610142043.11924-1-roger.pau@citrix.com>
 <20240610142043.11924-7-roger.pau@citrix.com>
 <9de1a9c7-814c-4375-9182-90a2f04806b2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9de1a9c7-814c-4375-9182-90a2f04806b2@suse.com>

On Tue, Jun 11, 2024 at 03:18:32PM +0200, Jan Beulich wrote:
> On 10.06.2024 16:20, Roger Pau Monne wrote:
> > Currently there's logic in fixup_irqs() that attempts to prevent
> > _assign_irq_vector() from failing, as fixup_irqs() is required to evacuate all
> > interrupts from the CPUs not present in the input mask.  The current logic in
> > fixup_irqs() is incomplete, as it doesn't deal with interrupts that have
> > move_cleanup_count > 0 and a non-empty ->arch.old_cpu_mask field.
> > 
> > Instead of attempting to fixup the interrupt descriptor in fixup_irqs() so that
> > _assign_irq_vector() cannot fail, introduce logic in _assign_irq_vector()
> > to deal with interrupts that have either move_{in_progress,cleanup_count} set
> > and no remaining online CPUs in ->arch.cpu_mask.
> > 
> > If _assign_irq_vector() is requested to move an interrupt in the state
> > described above, first attempt to see if ->arch.old_cpu_mask contains any valid
> > CPUs that could be used as fallback, and if that's the case do move the
> > interrupt back to the previous destination.  Note this is easier because the
> > vector hasn't been released yet, so there's no need to allocate and setup a new
> > vector on the destination.
> > 
> > Due to the logic in fixup_irqs() that clears offline CPUs from
> > ->arch.old_cpu_mask (and releases the old vector if the mask becomes empty) it
> > shouldn't be possible to get into _assign_irq_vector() with
> > ->arch.move_{in_progress,cleanup_count} set but no online CPUs in
> > ->arch.old_cpu_mask.
> > 
> > However if ->arch.move_{in_progress,cleanup_count} is set and the interrupt has
> > also changed affinity, it's possible the members of ->arch.old_cpu_mask are no
> > longer part of the affinity set,
> 
> I'm having trouble relating this (->arch.old_cpu_mask related) to ...
> 
> > move the interrupt to a different CPU part of
> > the provided mask
> 
> ... this (->arch.cpu_mask related).

No, the "provided mask" here is the "mask" parameter, not
->arch.cpu_mask.

> 
> > and keep the current ->arch.old_{cpu_mask,vector} for the
> > pending interrupt movement to be completed.
> 
> Right, that's to clean up state from before the initial move. What isn't
> clear to me is what's to happen with the state of the intermediate
> placement. Description and code changes leave me with the impression that
> it's okay to simply abandon, without any cleanup, yet I can't quite figure
> why that would be an okay thing to do.

There isn't much we can do with the intermediate placement, as the CPU
is going offline.  However we can drain any pending interrupts from
IRR after the new destination has been set, since setting the
destination is done from the CPU that's the current target of the
interrupts.  So we can ensure the draining is done strictly after the
target has been switched, hence ensuring no further interrupts from
this source will be delivered to the current CPU.

> > --- a/xen/arch/x86/irq.c
> > +++ b/xen/arch/x86/irq.c
> > @@ -544,7 +544,53 @@ static int _assign_irq_vector(struct irq_desc *desc, const cpumask_t *mask)
> >      }
> >  
> >      if ( desc->arch.move_in_progress || desc->arch.move_cleanup_count )
> > -        return -EAGAIN;
> > +    {
> > +        /*
> > +         * If the current destination is online refuse to shuffle.  Retry after
> > +         * the in-progress movement has finished.
> > +         */
> > +        if ( cpumask_intersects(desc->arch.cpu_mask, &cpu_online_map) )
> > +            return -EAGAIN;
> > +
> > +        /*
> > +         * Due to the logic in fixup_irqs() that clears offlined CPUs from
> > +         * ->arch.old_cpu_mask it shouldn't be possible to get here with
> > +         * ->arch.move_{in_progress,cleanup_count} set and no online CPUs in
> > +         * ->arch.old_cpu_mask.
> > +         */
> > +        ASSERT(valid_irq_vector(desc->arch.old_vector));
> > +        ASSERT(cpumask_intersects(desc->arch.old_cpu_mask, &cpu_online_map));
> > +
> > +        if ( cpumask_intersects(desc->arch.old_cpu_mask, mask) )
> > +        {
> > +            /*
> > +             * Fallback to the old destination if moving is in progress and the
> > +             * current destination is to be offlined.  This is only possible if
> > +             * the CPUs in old_cpu_mask intersect with the affinity mask passed
> > +             * in the 'mask' parameter.
> > +             */
> > +            desc->arch.vector = desc->arch.old_vector;
> > +            cpumask_and(desc->arch.cpu_mask, desc->arch.old_cpu_mask, mask);
> > +
> > +            /* Undo any possibly done cleanup. */
> > +            for_each_cpu(cpu, desc->arch.cpu_mask)
> > +                per_cpu(vector_irq, cpu)[desc->arch.vector] = irq;
> > +
> > +            /* Cancel the pending move. */
> > +            desc->arch.old_vector = IRQ_VECTOR_UNASSIGNED;
> > +            cpumask_clear(desc->arch.old_cpu_mask);
> > +            desc->arch.move_in_progress = 0;
> > +            desc->arch.move_cleanup_count = 0;
> > +
> > +            return 0;
> > +        }
> 
> In how far is this guaranteed to respect the (new) affinity that was set,
> presumably having led to the movement in the first place?

The 'mask' parameter should account for the new affinity, hence the
cpumask_intersects() check guarantees we are moving to a CPU still in
the affinity mask.

> > @@ -600,7 +646,17 @@ next:
> >          current_vector = vector;
> >          current_offset = offset;
> >  
> > -        if ( valid_irq_vector(old_vector) )
> > +        if ( desc->arch.move_in_progress || desc->arch.move_cleanup_count )
> > +        {
> > +            ASSERT(!cpumask_intersects(desc->arch.cpu_mask, &cpu_online_map));
> > +            /*
> > +             * Special case when evacuating an interrupt from a CPU to be
> > +             * offlined and the interrupt was already in the process of being
> > +             * moved.  Leave ->arch.old_{vector,cpu_mask} as-is and just
> > +             * replace ->arch.{cpu_mask,vector} with the new destination.
> > +             */
> 
> And where's the cleaning up of ->arch.old_* going to be taken care of then?

Such cleaning will be handled normally by the interrupt still having
->arch.move_{in_progress,cleanup_count} set.  The CPUs in
->arch.old_cpu_mask must not all be offline, otherwise the logic in
fixup_irqs() would have already released the old vector.

Thanks, Roger.

