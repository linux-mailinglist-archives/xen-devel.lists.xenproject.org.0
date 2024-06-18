Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C66F390C91B
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 13:23:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743013.1149910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJWvI-0007He-3G; Tue, 18 Jun 2024 11:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743013.1149910; Tue, 18 Jun 2024 11:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJWvI-0007Ez-01; Tue, 18 Jun 2024 11:22:48 +0000
Received: by outflank-mailman (input) for mailman id 743013;
 Tue, 18 Jun 2024 11:22:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TBP2=NU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sJWvH-0007Et-0n
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 11:22:47 +0000
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [2607:f8b0:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15d3659b-2d65-11ef-90a3-e314d9c70b13;
 Tue, 18 Jun 2024 13:22:46 +0200 (CEST)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3d21f7cc6c0so2655126b6e.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 04:22:46 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798b73fb4dcsm508664285a.100.2024.06.18.04.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 04:22:44 -0700 (PDT)
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
X-Inumbo-ID: 15d3659b-2d65-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718709765; x=1719314565; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uMdWOYDCF4L/JS5yOW7ALJCaoP82n/+gWVij8fGbdXo=;
        b=mrLcSs3lUoAhbxBBIlCRcJJAY/X9OKqEDxEmmV+IRdVwyKCAnGDPgPzw9E9HYtRUx+
         TixHSR695GjBFhDiAO6cUnZPtEkJ3AvwYouOQM9pOmQBKh/8UKa8L64rHaJtd4Rzr7fo
         OzugpNRSg4uyNIKzVmTVEAY/7KyZrNaAJnFIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718709765; x=1719314565;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uMdWOYDCF4L/JS5yOW7ALJCaoP82n/+gWVij8fGbdXo=;
        b=pH4o2yG4kjDthfqEq3+9w5oRU+DGbJKFT/wc16CUF+KEn2TdT0W+jWSGQxzetH/q/j
         64S9KbgnK5CbmeWBBL2K+rkSHQVVuZrErUXdAH8G65Y3SfPvdMvAeM+NfimREV67z3Ee
         QOuNqc6gPxMSpQg5P9VTDYaGBqEyZX0tiCvTPk/CwtU0n/zKMmf/uvYar4wpt39E24Pw
         Dx0epHOjdsUmPGwBapbDlqQ6NBkm9EqyC7rAIbj7E498WEZW89cWJcX96US6w3+SzKNY
         hih5SemYftFU7BCElNwNI4NGtXdbZIvvfKPL6NCGTLRQsyLPvHf5KxPNas6aHKMqvSuo
         64Xg==
X-Forwarded-Encrypted: i=1; AJvYcCURV6Twd6RnD071jiz84OqwVOuYUAfv80ejKKfp4nmHArGovHmRI6AeXJ776dYY2LQHzINa30tzB0A1FLOKcDmplyNlsBMKvPfOu2PxLQ8=
X-Gm-Message-State: AOJu0Yy9cxMDXgghWdcxZAjkMSL092FsbcLXnsjucy+wCeujrsiq+qYw
	+y8hvMnw4ermeytgWQ6CvKXHdlSmsiDoKu9zjqqZxNIfqoRxjQ7Rv2HFGvQ4Q6I=
X-Google-Smtp-Source: AGHT+IF6X8Iri1KEMEYghMRXGEQYzcU7kYUwTy0wk0hNb4VrEnztHGaVY5yJviz4YKaixjkW9uwZbg==
X-Received: by 2002:a05:6808:3028:b0:3d2:236d:6b57 with SMTP id 5614622812f47-3d24e928004mr12029217b6e.27.1718709764568;
        Tue, 18 Jun 2024 04:22:44 -0700 (PDT)
Date: Tue, 18 Jun 2024 13:22:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3 for-4.19 2/3] x86/irq: handle moving interrupts in
 _assign_irq_vector()
Message-ID: <ZnFuAoP-FNiNfcKd@macbook>
References: <20240613165617.42538-1-roger.pau@citrix.com>
 <20240613165617.42538-3-roger.pau@citrix.com>
 <f263d178-3a06-4c65-a6c0-a77f85c559b6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f263d178-3a06-4c65-a6c0-a77f85c559b6@suse.com>

On Mon, Jun 17, 2024 at 03:31:13PM +0200, Jan Beulich wrote:
> On 13.06.2024 18:56, Roger Pau Monne wrote:
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
> > longer part of the affinity set, move the interrupt to a different CPU part of
> > the provided mask and keep the current ->arch.old_{cpu_mask,vector} for the
> > pending interrupt movement to be completed.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> > --- a/xen/arch/x86/irq.c
> > +++ b/xen/arch/x86/irq.c
> > @@ -544,7 +544,58 @@ static int _assign_irq_vector(struct irq_desc *desc, const cpumask_t *mask)
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
> 
> I'm a little puzzled that you use desc->arch.old_vector here, but ...

old_vector can't be used here, as old_vector == desc->arch.vector at
this point.

The name of the variable is IMO a bit misleading, as it's value only
becomes the old_vector once a new vector is assigned.  It would be
more appropriate to name it current_vector IMO.

> > +            cpumask_and(desc->arch.cpu_mask, desc->arch.old_cpu_mask, mask);
> > +
> > +            /* Undo any possibly done cleanup. */
> > +            for_each_cpu(cpu, desc->arch.cpu_mask)
> > +                per_cpu(vector_irq, cpu)[desc->arch.vector] = irq;
> > +
> > +            /* Cancel the pending move and release the current vector. */
> > +            desc->arch.old_vector = IRQ_VECTOR_UNASSIGNED;
> > +            cpumask_clear(desc->arch.old_cpu_mask);
> > +            desc->arch.move_in_progress = 0;
> > +            desc->arch.move_cleanup_count = 0;
> > +            if ( desc->arch.used_vectors )
> > +            {
> > +                ASSERT(test_bit(old_vector, desc->arch.used_vectors));
> > +                clear_bit(old_vector, desc->arch.used_vectors);
> 
> ... old_vector here. Since we have the latter, uniformly using it might
> be more consistent.

Keep in mind that old_vector a cache of the value of desc->arch.vector
at the start of the function.

> I realize though that irq_to_vector() has cases where
> it wouldn't return desc->arch.old_vector; I think, however, that in those
> case we can't make it here. Still I'm not going to insist on making the
> adjustment. Happy to make it though while committing, should you agree.
> 
> Also I'm not happy to see another instance of this pattern appear. In
> x86-specific code this is inefficient, as {set,clear}_bit resolve to the
> same insn as test_and_{set,clear}_bit(). Therefore imo more efficient
> would be
> 
>                 if (!test_and_clear_bit(old_vector, desc->arch.used_vectors))
>                     ASSERT_UNREACHABLE();
> 
> (and then the two if()s folded).
> 
> I've been meaning to propose a patch to the other similar sites ...

Oh, indeed.  IIRC I've copied this pattern from somewhere else without
noticing.  I'm happy for you to fold the test_and_clear_bit() call
into the parent if condition.

Thanks, Roger.

