Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B68AD904E6E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 10:48:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738984.1145869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHJdr-0002Ms-Ae; Wed, 12 Jun 2024 08:47:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738984.1145869; Wed, 12 Jun 2024 08:47:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHJdr-0002L2-7o; Wed, 12 Jun 2024 08:47:39 +0000
Received: by outflank-mailman (input) for mailman id 738984;
 Wed, 12 Jun 2024 08:47:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kV4F=NO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sHJdq-0002Kw-27
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 08:47:38 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ae8da24-2898-11ef-90a3-e314d9c70b13;
 Wed, 12 Jun 2024 10:47:36 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-42278f3aea4so9101785e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 01:47:36 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f215d4602sm8542927f8f.74.2024.06.12.01.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 01:47:35 -0700 (PDT)
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
X-Inumbo-ID: 6ae8da24-2898-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718182056; x=1718786856; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+CRRYU5mEu5rN9aNcGMiLxUPkcX1eGaLdhfh49hCeDs=;
        b=wK9xyQQj+VUq6vPrGQBM5EbPYXK6f7j+HClN6lAUrOtokkNJOf99xXwncnOv4Q4A7e
         DN7A6EM/ecFJFZk0QD4S6bmaY5e/NddkmrYX2FuQs1rWoH2DqZI7W5UX8tnSAzgJA3jI
         9d20fjXtkuC1sAYK3uJADTTEtGro7Nx/wn59c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718182056; x=1718786856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+CRRYU5mEu5rN9aNcGMiLxUPkcX1eGaLdhfh49hCeDs=;
        b=fsFs/n3Ps5xXRBFXC4wx6Q0i7bI0CGkmcmZshyQi1Pt9Dd1ZRzn11dqxWiaVOKEEXV
         XAT3OoVpd82NGIE6s4BkQ/1GQ20vszbE2WkQBe5LWNLmq2s/gXkz0AeSamz1aJhR7Exs
         jGIiB3jRGNdVMNjh+b7o2t66OsQd3OXIn7AqcZjRNV+LwWDWlmyw9Me1LqMShUAgpvQO
         ftNajf5spK3KABMqRfyzEQzkK7cmNhEaA2JVe0PnCzK/DmcU1OiA1QXSMYUBVtQ2zGJe
         1CDVwiR1LoWh6huF/1rcqp8HQUnnQF11x44LHsWV/Olgx7BpZ8oDMlD91hL090ioYQEu
         K3ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVE+fszywJvYlKBI+1/fOar/YW1U+GI5BGQKJ3u2lMbfU+w/noaAy5FLDHTZ3GwkozA0XH/wMdtK5waLU1vctB4/jTO770Nk28sWDu3Keo=
X-Gm-Message-State: AOJu0Yw5JfsGGAPswJf5QK249U37nZzbFezF3V/Twt615CnpXROr9lze
	7cCTvNumHvqMHwNFieFdjLzQZ2xIxldzJLbegBUbRxoP0MIvgevNTZiAfOFfOrg=
X-Google-Smtp-Source: AGHT+IFWr14ByUDbOpQZsZFALbhGBqITtnXzd2qYwsknTGBU5g4Gp9iV+8EnDFeQpNb7yVGcYqeMow==
X-Received: by 2002:adf:e98d:0:b0:35f:2197:dbff with SMTP id ffacd0b85a97d-35fe8915491mr724885f8f.24.1718182056098;
        Wed, 12 Jun 2024 01:47:36 -0700 (PDT)
Date: Wed, 12 Jun 2024 10:47:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 5/7] x86/irq: deal with old_cpu_mask for interrupts in
 movement in fixup_irqs()
Message-ID: <Zmlgp9C2ryFtT65B@macbook>
References: <20240610142043.11924-1-roger.pau@citrix.com>
 <20240610142043.11924-6-roger.pau@citrix.com>
 <66fc06cc-f1f6-4f12-83d4-a3b9788bffba@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <66fc06cc-f1f6-4f12-83d4-a3b9788bffba@suse.com>

On Tue, Jun 11, 2024 at 02:45:09PM +0200, Jan Beulich wrote:
> On 10.06.2024 16:20, Roger Pau Monne wrote:
> > Given the current logic it's possible for ->arch.old_cpu_mask to get out of
> > sync: if a CPU set in old_cpu_mask is offlined and then onlined
> > again without old_cpu_mask having been updated the data in the mask will no
> > longer be accurate, as when brought back online the CPU will no longer have
> > old_vector configured to handle the old interrupt source.
> > 
> > If there's an interrupt movement in progress, and the to be offlined CPU (which
> > is the call context) is in the old_cpu_mask clear it and update the mask, so it
> > doesn't contain stale data.
> 
> This imo is too __cpu_disable()-centric. In the code you cover the
> smp_send_stop() case afaict, where it's all _other_ CPUs which are being
> offlined. As we're not meaning to bring CPUs online again in that case,
> dealing with the situation likely isn't needed. Yet the description should
> imo at least make clear that the case was considered.

What about adding the following paragraph:

Note that when the system is going down fixup_irqs() will be called by
smp_send_stop() from CPU 0 with a mask with only CPU 0 on it,
effectively asking to move all interrupts to the current caller (CPU
0) which is the only CPU online.  In that case we don't care to
migrate interrupts that are in the process of being moved, as it's
likely we won't be able to move all interrupts to CPU 0 due to vector
shortage anyway.

> 
> > @@ -2589,6 +2589,28 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
> >                                 affinity);
> >          }
> >  
> > +        if ( desc->arch.move_in_progress &&
> > +             !cpumask_test_cpu(cpu, &cpu_online_map) &&
> 
> This part of the condition is, afaict, what covers (excludes) the
> smp_send_stop() case. Might be nice to have a brief comment here, thus
> also clarifying ...

Would you be fine with:

        if ( desc->arch.move_in_progress &&
             /*
	      * Only attempt to migrate if the current CPU is going
	      * offline, otherwise the whole system is going down and
	      * leaving stale interrupts is fine.
	      */
             !cpumask_test_cpu(cpu, &cpu_online_map) &&
             cpumask_test_cpu(cpu, desc->arch.old_cpu_mask) )


> > +             cpumask_test_cpu(cpu, desc->arch.old_cpu_mask) )
> > +        {
> > +            /*
> > +             * This CPU is going offline, remove it from ->arch.old_cpu_mask
> > +             * and possibly release the old vector if the old mask becomes
> > +             * empty.
> > +             *
> > +             * Note cleaning ->arch.old_cpu_mask is required if the CPU is
> > +             * brought offline and then online again, as when re-onlined the
> > +             * per-cpu vector table will no longer have ->arch.old_vector
> > +             * setup, and hence ->arch.old_cpu_mask would be stale.
> > +             */
> > +            cpumask_clear_cpu(cpu, desc->arch.old_cpu_mask);
> > +            if ( cpumask_empty(desc->arch.old_cpu_mask) )
> > +            {
> > +                desc->arch.move_in_progress = 0;
> > +                release_old_vec(desc);
> > +            }
> 
> ... that none of this is really wanted or necessary in that other case.
> Assuming my understanding above is correct, the code change itself is
> once again

It is.  For the smp_send_stop() case we don't care much about leaving
stale data around, as the system is going down.  It's also likely
impossible to move all interrupts to CPU0 due to vector shortage, so
some interrupts will be left assigned to different CPUs.

> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> yet here I'm uncertain whether to offer on-commit editing, as it's not
> really clear to me whether there's a dependencies on patch 4.

No, in principle it should be fine to skip patch 4, but I would like
to do another round of testing before confirming.

Thanks, Roger.

