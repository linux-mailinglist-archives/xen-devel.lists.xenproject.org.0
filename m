Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 610077117BB
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 21:55:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539850.841128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2H30-0007EJ-19; Thu, 25 May 2023 19:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539850.841128; Thu, 25 May 2023 19:54:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2H2z-0007Bk-Uh; Thu, 25 May 2023 19:54:53 +0000
Received: by outflank-mailman (input) for mailman id 539850;
 Thu, 25 May 2023 19:54:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGWh=BO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q2H2y-0007AE-Ji
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 19:54:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01c3e60b-fb36-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 21:54:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0EEE964AB3;
 Thu, 25 May 2023 19:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C2EAC433EF;
 Thu, 25 May 2023 19:54:47 +0000 (UTC)
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
X-Inumbo-ID: 01c3e60b-fb36-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685044488;
	bh=UgP9LzRUTFhEjKfF5nFmQDnDkejaezEN+QxiQDzy4Z0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nVhk+q107mVgBLc1lN0K4yu9OO9MfUZI4g8nk2hv5CcDek91UuRCnc7Go3ox6LZxJ
	 gClMPIyRy0h2vjg/l1uNDMfeI2A12Bh4ShLxqHR5uXSb3fFTqmiSJsMB0Cmk54/MsO
	 NxChg56Rb3ZTyPGS0U4JofK/I/P+unx6YCfQfXQ0BvAc2/jXZCoUN+ssiYA3GInNNh
	 AhH8lOZznE7wd5JWe8zuxRCjknS+Vk86kNMSKp2pzYm+Xb93/vHdQ3LYhw/YF3kxK2
	 nzs6026mT1S6EoBjWKbOWAlqcbeGz44NDM4qf0kmaksL8FJhDGDbUJXPek+8m1+wiM
	 z3tynzKDAuJsQ==
Date: Thu, 25 May 2023 12:54:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    xenia.ragiadakou@amd.com, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [RFC] Xen crashes on ASSERT on suspend/resume, suggested fix
In-Reply-To: <6790d5ae-9742-f5f3-bd8c-62602ee9cb1d@suse.com>
Message-ID: <alpine.DEB.2.22.394.2305251248000.44000@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2305181638390.128889@ubuntu-linux-20-04-desktop> <ZGzFnE2w/YqYT35c@Air-de-Roger> <ZGzSnu8m/IqjmyHx@Air-de-Roger> <alpine.DEB.2.22.394.2305241646520.44000@ubuntu-linux-20-04-desktop>
 <6790d5ae-9742-f5f3-bd8c-62602ee9cb1d@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 25 May 2023, Jan Beulich wrote:
> On 25.05.2023 01:51, Stefano Stabellini wrote:
> > xen/irq: fix races between send_cleanup_vector and _clear_irq_vector
> 
> This title is, I'm afraid, already misleading. No such race can occur
> afaict, as both callers of _clear_irq_vector() acquire the IRQ
> descriptor lock first, and irq_complete_move() (the sole caller of
> send_cleanup_vector()) is only ever invoked as or by an ->ack()
> hook, which in turn is only invoked with, again, the descriptor lock
> held.

Yes I see that you are right about the locking, and thank you for taking
the time to look into it.

One last question: could it be that a second interrupt arrives while
->ack() is being handled?  do_IRQ() is running with interrupts disabled?


> > It is possible that send_cleanup_vector and _clear_irq_vector are
> > running at the same time on different CPUs. In that case we have a race
> > as both _clear_irq_vector and irq_move_cleanup_interrupt are trying to
> > clear old_vector.
> > 
> > This patch fixes 3 races:
> > 
> > 1) As irq_move_cleanup_interrupt is running on multiple CPUs at the
> > same time, and also _clear_irq_vector is running, it is possible that
> > only some per_cpu(vector_irq, cpu)[old_vector] are valid but not all.
> > So, turn the ASSERT in _clear_irq_vector into an if.
> 
> Note again the locking which is in effect.
> 
> > 2) It is possible that _clear_irq_vector is running at the same time as
> > release_old_vec, called from irq_move_cleanup_interrupt. At the moment,
> > it is possible for _clear_irq_vector to read a valid old_cpu_mask but an
> > invalid old_vector (because it is being set to invalid by
> > release_old_vec). To avoid this problem in release_old_vec move clearing
> > old_cpu_mask before setting old_vector to invalid. This way, we know that
> > in _clear_irq_vector if old_vector is invalid also old_cpu_mask is zero
> > and we don't enter the loop.
> 
> All invocations of release_old_vec() are similarly inside suitably
> locked regions.
> 
> > 3) It is possible that release_old_vec is running twice at the same time
> > for the same old_vector. Change the code in release_old_vec to make it
> > OK to call it twice. Remove both ASSERTs. With those gone, it should be
> > possible now to call release_old_vec twice in a row for the same
> > old_vector.
> 
> Same here.
> 
> Any such issues would surface more frequently and without any suspend /
> resume involved. What is still missing is that connection, and only then
> it'll (or really: may) become clear what needs adjusting. If you've seen
> the issue exactly once, then I'm afraid there's not much we can do unless
> someone can come up with a plausible explanation of something being
> broken on any of the involved code paths. More information will need to
> be gathered out of the next occurrence of this, whenever that's going to
> be. One of the things we will want to know, as mentioned before, is the
> value that per_cpu(vector_irq, cpu)[old_vector] has when the assertion
> triggers. Iirc Roger did suggest another piece of data you'd want to log.

Understood, thanks for the explanation.


> > --- a/xen/arch/x86/irq.c
> > +++ b/xen/arch/x86/irq.c
> > @@ -112,16 +112,11 @@ static void release_old_vec(struct irq_desc *desc)
> >  {
> >      unsigned int vector = desc->arch.old_vector;
> >  
> > -    desc->arch.old_vector = IRQ_VECTOR_UNASSIGNED;
> >      cpumask_clear(desc->arch.old_cpu_mask);
> > +    desc->arch.old_vector = IRQ_VECTOR_UNASSIGNED;
> >  
> > -    if ( !valid_irq_vector(vector) )
> > -        ASSERT_UNREACHABLE();
> > -    else if ( desc->arch.used_vectors )
> > -    {
> > -        ASSERT(test_bit(vector, desc->arch.used_vectors));
> > +    if ( desc->arch.used_vectors )
> >          clear_bit(vector, desc->arch.used_vectors);
> > -    }
> >  }
> >  
> >  static void _trace_irq_mask(uint32_t event, int irq, int vector,
> > @@ -230,9 +225,11 @@ static void _clear_irq_vector(struct irq_desc *desc)
> >  
> >          for_each_cpu(cpu, tmp_mask)
> >          {
> > -            ASSERT(per_cpu(vector_irq, cpu)[old_vector] == irq);
> > -            TRACE_3D(TRC_HW_IRQ_MOVE_FINISH, irq, old_vector, cpu);
> > -            per_cpu(vector_irq, cpu)[old_vector] = ~irq;
> > +            if ( per_cpu(vector_irq, cpu)[old_vector] == irq )
> > +            {
> > +                TRACE_3D(TRC_HW_IRQ_MOVE_FINISH, irq, old_vector, cpu);
> > +                per_cpu(vector_irq, cpu)[old_vector] = ~irq;
> > +            }
> >          }
> 
> As said before - replacing ASSERT() by a respective if() cannot really
> be done without discussing the "else" in the description. Except of
> course in trivial/obvious cases, but I think we agree here we don't
> have such a case.

