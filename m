Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FCD905710
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 17:37:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739460.1146497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHQ1h-0005jj-7A; Wed, 12 Jun 2024 15:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739460.1146497; Wed, 12 Jun 2024 15:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHQ1h-0005hP-3t; Wed, 12 Jun 2024 15:36:41 +0000
Received: by outflank-mailman (input) for mailman id 739460;
 Wed, 12 Jun 2024 15:36:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kV4F=NO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sHQ1f-0005hJ-DN
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 15:36:39 +0000
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [2607:f8b0:4864:20::72b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d6620cc-28d1-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 17:36:36 +0200 (CEST)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-795dc9e0d15so194436485a.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 08:36:36 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b075e37080sm39841916d6.46.2024.06.12.08.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 08:36:34 -0700 (PDT)
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
X-Inumbo-ID: 8d6620cc-28d1-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718206595; x=1718811395; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yqVruEeXc2MDMuSjgeHLOK+zggStZivpQZ292dmamSk=;
        b=GNA7MoEwTVuRkYvcD0WhzChx5+hn0JichZnb3t2xB8UQgItxrwA6CbeLrXE2JLsmK6
         FgDZF7z2tn8wKW3IOIfuL2YUrKOdkc24XWdovHxeLqyfo3hNIQNQnXr6UA3LoQrvAYCz
         z3f/L9XwCakWLZ4D5aMC5+ows3ja2/K5ByPfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718206595; x=1718811395;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yqVruEeXc2MDMuSjgeHLOK+zggStZivpQZ292dmamSk=;
        b=vs64AB4sM/w330ODAv0kiCVmARsor6+gabc5HOo0JheVwqttBrHCSnh3dbACX4wbw2
         WFVoB72JUiHlJR1vpEjnUYQEkVf63yV6o+qPqU2xaAAsZl36uxYsmadcPZfbRN14tDr4
         Tjl7acr9K9FuHR+ZHLzTp2HIbLbXxkiPz1NRFN0J2obHvvjEBL1EjaHNvoSxoN2hATWM
         NgVJ/WVjP2YZrZNf3oc7Zcro6PhInnRXiNxppE90AOCICI6MfvoQud0jyHFVqEd4NdnA
         DG9sxL3cshSrVtKVaxtrw/JIEcmbIIDC+eX3uBKxxq7iRK1mFJ7UEalVIJ9AVoetmptM
         naqw==
X-Forwarded-Encrypted: i=1; AJvYcCWGNNmzxat0RY3+G8DRST7hL2wtbFg7p8KkIBslxNUOX0PQCUQvEBXkQAwE3zMKrBU1QA3MFiS9d31ad0HGnBD++/WrO0GMAmsZ0Y6UtX8=
X-Gm-Message-State: AOJu0YwxuaFrBMoXmgOUU/+O2V4Ybh4XCNvDLjrdTsG6FPeGieU8go2e
	s65BkFdx/tzV26QIrwTV/W/8H3Mu8MTTIT61Gp6BS5n6G7i6CZlABqnB4iZ3nPLuLHdglIBSZS8
	I
X-Google-Smtp-Source: AGHT+IEqpJmbSzajuYOcJrD85VqbzOVEmctVt8Y0cNXpcqW27coPGKftpzE3w/jzUbf30J9iZFbLPg==
X-Received: by 2002:a05:6214:3c8a:b0:6b0:8041:8ae1 with SMTP id 6a1803df08f44-6b1a7419aecmr27509786d6.61.1718206595227;
        Wed, 12 Jun 2024 08:36:35 -0700 (PDT)
Date: Wed, 12 Jun 2024 17:36:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 6/7] x86/irq: handle moving interrupts in
 _assign_irq_vector()
Message-ID: <ZmnAgSBjjP6N-uJS@macbook>
References: <20240610142043.11924-1-roger.pau@citrix.com>
 <20240610142043.11924-7-roger.pau@citrix.com>
 <9de1a9c7-814c-4375-9182-90a2f04806b2@suse.com>
 <Zml6-ViFPTWI1cUc@macbook>
 <d5b1d273-913e-4d53-9fb6-9b01525da498@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d5b1d273-913e-4d53-9fb6-9b01525da498@suse.com>

On Wed, Jun 12, 2024 at 03:42:58PM +0200, Jan Beulich wrote:
> On 12.06.2024 12:39, Roger Pau Monné wrote:
> > On Tue, Jun 11, 2024 at 03:18:32PM +0200, Jan Beulich wrote:
> >> On 10.06.2024 16:20, Roger Pau Monne wrote:
> >>> Currently there's logic in fixup_irqs() that attempts to prevent
> >>> _assign_irq_vector() from failing, as fixup_irqs() is required to evacuate all
> >>> interrupts from the CPUs not present in the input mask.  The current logic in
> >>> fixup_irqs() is incomplete, as it doesn't deal with interrupts that have
> >>> move_cleanup_count > 0 and a non-empty ->arch.old_cpu_mask field.
> >>>
> >>> Instead of attempting to fixup the interrupt descriptor in fixup_irqs() so that
> >>> _assign_irq_vector() cannot fail, introduce logic in _assign_irq_vector()
> >>> to deal with interrupts that have either move_{in_progress,cleanup_count} set
> >>> and no remaining online CPUs in ->arch.cpu_mask.
> >>>
> >>> If _assign_irq_vector() is requested to move an interrupt in the state
> >>> described above, first attempt to see if ->arch.old_cpu_mask contains any valid
> >>> CPUs that could be used as fallback, and if that's the case do move the
> >>> interrupt back to the previous destination.  Note this is easier because the
> >>> vector hasn't been released yet, so there's no need to allocate and setup a new
> >>> vector on the destination.
> >>>
> >>> Due to the logic in fixup_irqs() that clears offline CPUs from
> >>> ->arch.old_cpu_mask (and releases the old vector if the mask becomes empty) it
> >>> shouldn't be possible to get into _assign_irq_vector() with
> >>> ->arch.move_{in_progress,cleanup_count} set but no online CPUs in
> >>> ->arch.old_cpu_mask.
> >>>
> >>> However if ->arch.move_{in_progress,cleanup_count} is set and the interrupt has
> >>> also changed affinity, it's possible the members of ->arch.old_cpu_mask are no
> >>> longer part of the affinity set,
> >>
> >> I'm having trouble relating this (->arch.old_cpu_mask related) to ...
> >>
> >>> move the interrupt to a different CPU part of
> >>> the provided mask
> >>
> >> ... this (->arch.cpu_mask related).
> > 
> > No, the "provided mask" here is the "mask" parameter, not
> > ->arch.cpu_mask.
> 
> Oh, so this describes the case of "hitting" the comment at the very bottom of
> the first hunk then? (I probably was misreading this because I was expecting
> it to describe a code change, rather than the case where original behavior
> needs retaining. IOW - all fine here then.)
> 
> >>> and keep the current ->arch.old_{cpu_mask,vector} for the
> >>> pending interrupt movement to be completed.
> >>
> >> Right, that's to clean up state from before the initial move. What isn't
> >> clear to me is what's to happen with the state of the intermediate
> >> placement. Description and code changes leave me with the impression that
> >> it's okay to simply abandon, without any cleanup, yet I can't quite figure
> >> why that would be an okay thing to do.
> > 
> > There isn't much we can do with the intermediate placement, as the CPU
> > is going offline.  However we can drain any pending interrupts from
> > IRR after the new destination has been set, since setting the
> > destination is done from the CPU that's the current target of the
> > interrupts.  So we can ensure the draining is done strictly after the
> > target has been switched, hence ensuring no further interrupts from
> > this source will be delivered to the current CPU.
> 
> Hmm, I'm afraid I still don't follow: I'm specifically in trouble with
> the ...
> 
> >>> --- a/xen/arch/x86/irq.c
> >>> +++ b/xen/arch/x86/irq.c
> >>> @@ -544,7 +544,53 @@ static int _assign_irq_vector(struct irq_desc *desc, const cpumask_t *mask)
> >>>      }
> >>>  
> >>>      if ( desc->arch.move_in_progress || desc->arch.move_cleanup_count )
> >>> -        return -EAGAIN;
> >>> +    {
> >>> +        /*
> >>> +         * If the current destination is online refuse to shuffle.  Retry after
> >>> +         * the in-progress movement has finished.
> >>> +         */
> >>> +        if ( cpumask_intersects(desc->arch.cpu_mask, &cpu_online_map) )
> >>> +            return -EAGAIN;
> >>> +
> >>> +        /*
> >>> +         * Due to the logic in fixup_irqs() that clears offlined CPUs from
> >>> +         * ->arch.old_cpu_mask it shouldn't be possible to get here with
> >>> +         * ->arch.move_{in_progress,cleanup_count} set and no online CPUs in
> >>> +         * ->arch.old_cpu_mask.
> >>> +         */
> >>> +        ASSERT(valid_irq_vector(desc->arch.old_vector));
> >>> +        ASSERT(cpumask_intersects(desc->arch.old_cpu_mask, &cpu_online_map));
> >>> +
> >>> +        if ( cpumask_intersects(desc->arch.old_cpu_mask, mask) )
> >>> +        {
> >>> +            /*
> >>> +             * Fallback to the old destination if moving is in progress and the
> >>> +             * current destination is to be offlined.  This is only possible if
> >>> +             * the CPUs in old_cpu_mask intersect with the affinity mask passed
> >>> +             * in the 'mask' parameter.
> >>> +             */
> >>> +            desc->arch.vector = desc->arch.old_vector;
> >>> +            cpumask_and(desc->arch.cpu_mask, desc->arch.old_cpu_mask, mask);
> 
> ... replacing of vector (and associated mask), without any further accounting.

It's quite likely I'm missing something here, but what further
accounting you would like to do?

The current target of the interrupt (->arch.cpu_mask previous to
cpumask_and()) is all going offline, so any attempt to set it in
->arch.old_cpu_mask would just result in a stale (offline) CPU getting
set in ->arch.old_cpu_mask, which previous patches attempted to
solve.

Maybe by "further accounting" you meant something else not related to
->arch.old_{cpu_mask,vector}?

> >>> @@ -600,7 +646,17 @@ next:
> >>>          current_vector = vector;
> >>>          current_offset = offset;
> >>>  
> >>> -        if ( valid_irq_vector(old_vector) )
> >>> +        if ( desc->arch.move_in_progress || desc->arch.move_cleanup_count )
> >>> +        {
> >>> +            ASSERT(!cpumask_intersects(desc->arch.cpu_mask, &cpu_online_map));
> >>> +            /*
> >>> +             * Special case when evacuating an interrupt from a CPU to be
> >>> +             * offlined and the interrupt was already in the process of being
> >>> +             * moved.  Leave ->arch.old_{vector,cpu_mask} as-is and just
> >>> +             * replace ->arch.{cpu_mask,vector} with the new destination.
> >>> +             */
> >>
> >> And where's the cleaning up of ->arch.old_* going to be taken care of then?
> > 
> > Such cleaning will be handled normally by the interrupt still having
> > ->arch.move_{in_progress,cleanup_count} set.  The CPUs in
> > ->arch.old_cpu_mask must not all be offline, otherwise the logic in
> > fixup_irqs() would have already released the old vector.
> 
> Maybe add "Cleanup will be done normally" to the comment?


Can do.

Thanks, Roger.

