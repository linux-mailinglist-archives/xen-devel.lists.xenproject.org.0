Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52777906B04
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 13:32:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739831.1146770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHig0-0007PT-QE; Thu, 13 Jun 2024 11:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739831.1146770; Thu, 13 Jun 2024 11:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHig0-0007NK-Nd; Thu, 13 Jun 2024 11:31:32 +0000
Received: by outflank-mailman (input) for mailman id 739831;
 Thu, 13 Jun 2024 11:31:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9y96=NP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sHifz-0007ND-7S
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 11:31:31 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a1faebf-2978-11ef-90a3-e314d9c70b13;
 Thu, 13 Jun 2024 13:31:30 +0200 (CEST)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-7960454db4fso51457385a.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 04:31:29 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798abc0ced8sm43985785a.77.2024.06.13.04.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 04:31:27 -0700 (PDT)
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
X-Inumbo-ID: 7a1faebf-2978-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718278289; x=1718883089; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dUd/HmDYST0f7kMjkMimmE34MAmFTG7peoxWvdrWoY8=;
        b=I7izLf6WvV3dtg+W3GZCvEJ/CMP7QKjlwla7Jzrt1Kpe/bwMzXUJHVy6fQrpaFBP9N
         PAzOddWNoHgwO2+3lEC9EW1mZvwy5VIykXtWtRT3Qfjjdkk/A+/IUQW3qFmOzKPeOduK
         355loBZJh0U/3CEEak+hMdXbd8wL3i/r+JWIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718278289; x=1718883089;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dUd/HmDYST0f7kMjkMimmE34MAmFTG7peoxWvdrWoY8=;
        b=HJ2of+OWaBNzEi6rSJcSkwGsOuDBrPbUFsqZqTKeDDq9Xvn5fmecwAyHnnw5MhRbYa
         0+AyDAl7FT1imgNvtPQsOF/bleqCC11qUfMERDc2BVxbdiywWGXraH3WiMgpi0KyQs0l
         XUQMUeT+F4C6qXdYleD36jHBKRAPasWdtaEnM3kSkhwflmbgUEB7LhB+0m7mxIF0E+Lg
         SJ0N57T0SRj1vVQNav/fz8s8acDHriaenP0FxUEt55leQfjdfgO4CU7CnL5KLN3wwlf7
         B5ylTCrxWlW0wDlMOK+Q/d5LGsMTF/Fd4MZZzmbUsBqGNWapRkyJusPUW9HKECy9cLey
         Z8lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMED4Uj4WK0lgmn4cTQ4pTW6efUYq0j1mlPc9IEdeoostvh/QSFN9tPVJrelHImKMcVPR1lnhmdTpndVyBuZl1GqWAwt4k7r+6bmP6lgE=
X-Gm-Message-State: AOJu0Yxl8oWqhTWO2/JaTYn4CpT8ymaDrBRX/ex6Ew08A7hYDHGjZBwZ
	Qt6ipvDfkQwUa4kxWUYXRRjfYj6EuXigQpI8oVt47MthMRXFDCEL/s10gqO0aoM=
X-Google-Smtp-Source: AGHT+IH68Iml0VUix8Rg0+ERbBShEoK1Kz8Tth9iMAI1nQ6S2ln5PdASpeG9OUq2C2dh2pA9LG09Pw==
X-Received: by 2002:a05:620a:19a6:b0:795:5930:d0e6 with SMTP id af79cd13be357-797f600af87mr514635585a.17.1718278288306;
        Thu, 13 Jun 2024 04:31:28 -0700 (PDT)
Date: Thu, 13 Jun 2024 13:31:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 6/7] x86/irq: handle moving interrupts in
 _assign_irq_vector()
Message-ID: <ZmrYjv2ljhf-1Ag_@macbook>
References: <20240610142043.11924-1-roger.pau@citrix.com>
 <20240610142043.11924-7-roger.pau@citrix.com>
 <9de1a9c7-814c-4375-9182-90a2f04806b2@suse.com>
 <Zml6-ViFPTWI1cUc@macbook>
 <d5b1d273-913e-4d53-9fb6-9b01525da498@suse.com>
 <ZmnAgSBjjP6N-uJS@macbook>
 <d45ef203-aa29-4aa6-8b40-0449334a2bf0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d45ef203-aa29-4aa6-8b40-0449334a2bf0@suse.com>

On Thu, Jun 13, 2024 at 10:38:35AM +0200, Jan Beulich wrote:
> On 12.06.2024 17:36, Roger Pau Monné wrote:
> > On Wed, Jun 12, 2024 at 03:42:58PM +0200, Jan Beulich wrote:
> >> On 12.06.2024 12:39, Roger Pau Monné wrote:
> >>> On Tue, Jun 11, 2024 at 03:18:32PM +0200, Jan Beulich wrote:
> >>>> On 10.06.2024 16:20, Roger Pau Monne wrote:
> >>>>> Currently there's logic in fixup_irqs() that attempts to prevent
> >>>>> _assign_irq_vector() from failing, as fixup_irqs() is required to evacuate all
> >>>>> interrupts from the CPUs not present in the input mask.  The current logic in
> >>>>> fixup_irqs() is incomplete, as it doesn't deal with interrupts that have
> >>>>> move_cleanup_count > 0 and a non-empty ->arch.old_cpu_mask field.
> >>>>>
> >>>>> Instead of attempting to fixup the interrupt descriptor in fixup_irqs() so that
> >>>>> _assign_irq_vector() cannot fail, introduce logic in _assign_irq_vector()
> >>>>> to deal with interrupts that have either move_{in_progress,cleanup_count} set
> >>>>> and no remaining online CPUs in ->arch.cpu_mask.
> >>>>>
> >>>>> If _assign_irq_vector() is requested to move an interrupt in the state
> >>>>> described above, first attempt to see if ->arch.old_cpu_mask contains any valid
> >>>>> CPUs that could be used as fallback, and if that's the case do move the
> >>>>> interrupt back to the previous destination.  Note this is easier because the
> >>>>> vector hasn't been released yet, so there's no need to allocate and setup a new
> >>>>> vector on the destination.
> >>>>>
> >>>>> Due to the logic in fixup_irqs() that clears offline CPUs from
> >>>>> ->arch.old_cpu_mask (and releases the old vector if the mask becomes empty) it
> >>>>> shouldn't be possible to get into _assign_irq_vector() with
> >>>>> ->arch.move_{in_progress,cleanup_count} set but no online CPUs in
> >>>>> ->arch.old_cpu_mask.
> >>>>>
> >>>>> However if ->arch.move_{in_progress,cleanup_count} is set and the interrupt has
> >>>>> also changed affinity, it's possible the members of ->arch.old_cpu_mask are no
> >>>>> longer part of the affinity set,
> >>>>
> >>>> I'm having trouble relating this (->arch.old_cpu_mask related) to ...
> >>>>
> >>>>> move the interrupt to a different CPU part of
> >>>>> the provided mask
> >>>>
> >>>> ... this (->arch.cpu_mask related).
> >>>
> >>> No, the "provided mask" here is the "mask" parameter, not
> >>> ->arch.cpu_mask.
> >>
> >> Oh, so this describes the case of "hitting" the comment at the very bottom of
> >> the first hunk then? (I probably was misreading this because I was expecting
> >> it to describe a code change, rather than the case where original behavior
> >> needs retaining. IOW - all fine here then.)
> >>
> >>>>> and keep the current ->arch.old_{cpu_mask,vector} for the
> >>>>> pending interrupt movement to be completed.
> >>>>
> >>>> Right, that's to clean up state from before the initial move. What isn't
> >>>> clear to me is what's to happen with the state of the intermediate
> >>>> placement. Description and code changes leave me with the impression that
> >>>> it's okay to simply abandon, without any cleanup, yet I can't quite figure
> >>>> why that would be an okay thing to do.
> >>>
> >>> There isn't much we can do with the intermediate placement, as the CPU
> >>> is going offline.  However we can drain any pending interrupts from
> >>> IRR after the new destination has been set, since setting the
> >>> destination is done from the CPU that's the current target of the
> >>> interrupts.  So we can ensure the draining is done strictly after the
> >>> target has been switched, hence ensuring no further interrupts from
> >>> this source will be delivered to the current CPU.
> >>
> >> Hmm, I'm afraid I still don't follow: I'm specifically in trouble with
> >> the ...
> >>
> >>>>> --- a/xen/arch/x86/irq.c
> >>>>> +++ b/xen/arch/x86/irq.c
> >>>>> @@ -544,7 +544,53 @@ static int _assign_irq_vector(struct irq_desc *desc, const cpumask_t *mask)
> >>>>>      }
> >>>>>  
> >>>>>      if ( desc->arch.move_in_progress || desc->arch.move_cleanup_count )
> >>>>> -        return -EAGAIN;
> >>>>> +    {
> >>>>> +        /*
> >>>>> +         * If the current destination is online refuse to shuffle.  Retry after
> >>>>> +         * the in-progress movement has finished.
> >>>>> +         */
> >>>>> +        if ( cpumask_intersects(desc->arch.cpu_mask, &cpu_online_map) )
> >>>>> +            return -EAGAIN;
> >>>>> +
> >>>>> +        /*
> >>>>> +         * Due to the logic in fixup_irqs() that clears offlined CPUs from
> >>>>> +         * ->arch.old_cpu_mask it shouldn't be possible to get here with
> >>>>> +         * ->arch.move_{in_progress,cleanup_count} set and no online CPUs in
> >>>>> +         * ->arch.old_cpu_mask.
> >>>>> +         */
> >>>>> +        ASSERT(valid_irq_vector(desc->arch.old_vector));
> >>>>> +        ASSERT(cpumask_intersects(desc->arch.old_cpu_mask, &cpu_online_map));
> >>>>> +
> >>>>> +        if ( cpumask_intersects(desc->arch.old_cpu_mask, mask) )
> >>>>> +        {
> >>>>> +            /*
> >>>>> +             * Fallback to the old destination if moving is in progress and the
> >>>>> +             * current destination is to be offlined.  This is only possible if
> >>>>> +             * the CPUs in old_cpu_mask intersect with the affinity mask passed
> >>>>> +             * in the 'mask' parameter.
> >>>>> +             */
> >>>>> +            desc->arch.vector = desc->arch.old_vector;
> >>>>> +            cpumask_and(desc->arch.cpu_mask, desc->arch.old_cpu_mask, mask);
> >>
> >> ... replacing of vector (and associated mask), without any further accounting.
> > 
> > It's quite likely I'm missing something here, but what further
> > accounting you would like to do?
> > 
> > The current target of the interrupt (->arch.cpu_mask previous to
> > cpumask_and()) is all going offline, so any attempt to set it in
> > ->arch.old_cpu_mask would just result in a stale (offline) CPU getting
> > set in ->arch.old_cpu_mask, which previous patches attempted to
> > solve.
> > 
> > Maybe by "further accounting" you meant something else not related to
> > ->arch.old_{cpu_mask,vector}?
> 
> Indeed. What I'm thinking of is what normally release_old_vec() would
> do (of which only desc->arch.used_vectors updating would appear to be
> relevant, seeing the CPU's going offline). The other one I was thinking
> of, updating vector_irq[], likely is also unnecessary, again because
> that's per-CPU data of a CPU going down.

I think updating vector_irq[] should be explicitly avoided, as doing
so would prevent us from correctly draining any pending interrupts
because the vector -> irq mapping would be broken when the interrupt
enable window at the bottom of fixup_irqs() is reached.

For used_vectors: we might clean it, I'm a bit worried however that at
some point we insert a check in do_IRQ() path that ensures the
vector_irq[] is inline with desc->arch.used_vectors, which would fail
for interrupts drained at the bottom of fixup_irqs().  Let me attempt
to clean the currently used vector from ->arch.used_vectors.

Thanks, Roger.

