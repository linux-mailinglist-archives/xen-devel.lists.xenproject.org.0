Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF56A49542
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 10:37:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898562.1307090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnwnW-0005fH-4A; Fri, 28 Feb 2025 09:36:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898562.1307090; Fri, 28 Feb 2025 09:36:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnwnW-0005de-1M; Fri, 28 Feb 2025 09:36:46 +0000
Received: by outflank-mailman (input) for mailman id 898562;
 Fri, 28 Feb 2025 09:36:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zu1c=VT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tnwnV-0005dY-05
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 09:36:45 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8487ba0e-f5b7-11ef-9aaf-95dc52dad729;
 Fri, 28 Feb 2025 10:36:43 +0100 (CET)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2234e5347e2so38401645ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2025 01:36:43 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fea696dcc3sm3249404a91.36.2025.02.28.01.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 01:36:41 -0800 (PST)
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
X-Inumbo-ID: 8487ba0e-f5b7-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740735402; x=1741340202; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2tto0hymuBwkpeXoN8FhAsARO/8LB9rx8DcGygictkI=;
        b=X+lcqDubPW+xgdOT/01mlT2bPK/UUa86Hl1NHehjBrNRxzKYYz1dbxHPCjMSrmK/lR
         8Lvzz45Ps1HdAtomUQm6dAizfUPG1Yn7QORoWoaBJMxH25VoHmbHtSrWWBNe72and5VF
         VwUqVw+aZO3YjeollA6cQxljqyAyqWcbSeqMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740735402; x=1741340202;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2tto0hymuBwkpeXoN8FhAsARO/8LB9rx8DcGygictkI=;
        b=fTelQhO1aoiBJh41ayPqglMXBQZdwPd+d8zhM/Qvm1pQS1CBzcurn91dEnzOTCegxm
         LlD1u7/QS3Cb/uMnv1YCvAJZiGdO9JSumzCNY3Hz/uXzw5jPlTl8IYhW2Asz+NdWW1+V
         mQ2YIzRZOgqOtNEKgyWo5XBV5Al6on7ijDe+Xub4rUnEnTWYUjCe7ekXFt1H0RVcJj7t
         VWkO6XXkUDO9Me6jODPvBdBzHFpAU46IUIIw4JS3Jd8kCTCuvoEy4EUyIjVUSAr+/e3O
         qDP9b42nkAk9+vCA4XA4lUr6abhHQhZNNxOr9SaKkTWwPoxTD7mQyiCzEdk50M9I2SRO
         3Pyg==
X-Gm-Message-State: AOJu0YwJMB0Es3cQ4xlFGrwa+iu8vcls3jmkxtf4Q/+Bl5nCaTLWC3de
	ST+cfPJaOFBnO2lhoTzSY1iBX0+tBS+jm4SDXc2xsA7gmsLasLLCbTH1h8nHY90=
X-Gm-Gg: ASbGncvM9mWQf/3+ubdqLAhieVQgFNtaZBX+klcn0aAqBGjMLno1L2BEmiFM18NUtYy
	OrX7u/4PgLlPwtZ+KqJxfV9W9sLIRj9pIiRHGeZNC/bSsqv9ePRw5potQvDM/cFLndtupXOJIRt
	tB+CvqkEHxpZOKNEFHB7Z51EgysIF1bKuVtj59VFzHL5DcLNOdgpdAgoOlFueOjq8NqoCd+DtIK
	fXYlaz9fe4PelCRBsaHujUegYxLMlfqY8Lw48RtTqJZAn2nv5RImooycUebSrEomZt5t3fSROX4
	/iLuAEywkUyF1pNwLtVEx/dmE6ntfG2hx1U8
X-Google-Smtp-Source: AGHT+IE+72QsGWzprlmQSbT41Fs7LcnhWs0owDeX0yfrZhLOewr37SQiC+HW7MELr65u8G6oH1v0Ug==
X-Received: by 2002:a17:902:f610:b0:223:58ff:bfdb with SMTP id d9443c01a7336-22368fbead0mr47689325ad.29.1740735401525;
        Fri, 28 Feb 2025 01:36:41 -0800 (PST)
Date: Fri, 28 Feb 2025 10:36:36 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: Re: [RFC PATCH] xen/amd-iommu: Add interrupt remapping quirk for
 ath11k
Message-ID: <Z8GDpJ8G8qMz4uYD@macbook.local>
References: <20250226211125.43625-1-jason.andryuk@amd.com>
 <Z8A9LYjgr92IignP@macbook.local>
 <9be05453-ab39-4b70-9675-b9df47e870b2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9be05453-ab39-4b70-9675-b9df47e870b2@amd.com>

On Thu, Feb 27, 2025 at 01:28:11PM -0500, Jason Andryuk wrote:
> On 2025-02-27 05:23, Roger Pau Monné wrote:
> > On Wed, Feb 26, 2025 at 04:11:25PM -0500, Jason Andryuk wrote:
> > > When the
> > > ath11k driver passes the guest address and data to the hardware, it
> > > generates faults when there is no IRTE for the guest data (~0x25).
> > 
> > What does ~0x25 mean in this context?
> 
> It was supposed to be an example of the observed MSI data in the range
> 0x25-0x28.  Maybe I should just state non-zero.

I don't think the data range matters much, I would just drop it.

> > > To work around this, we can, for per-device IRTs, program the hardware
> > > to use the guest data & associated IRTE.  The address doesn't matter
> > > since the IRTE handles that, and the Xen address & vector can be used as
> > > expected.
> > 
> > All this work on AMD because when interrupt remapping is enabled all
> > MSIs are handled by the remapping table, while on Intel there's still
> > a bit in the MSI address field to signal whether the MSI is using a
> > remapping entry, or is using the "compatibility" format (iow: no
> > remapping).
> 
> So, on Intel, if the guest hands the device the MSI address, it can decided
> to bypass remapping?
> 
> Thanks for providing insight into the Intel inner workings.  That's why I am
> asking.

Yes, sorry, I'm afraid I don't have any good solution for Intel, at
least not anything similar to what you propose to do on AMD-Vi.  I
guess we could take a partial solution for AMD-Vi only, but it's
sub-optimal from Xen perspective to have a piece of hardware working
fine on AMD and not on Intel.

> > > 
> > > For vPCI, the guest MSI data is available at the time of initial MSI
> > > setup, but that is not the case for HVM.  With HVM, the initial MSI
> > > setup is done when PHYSDEVOP_map_pirq is called, but the guest vector is
> > > only available later when XEN_DOMCTL_bind_pt_irq is called.  In that
> > > case, we need to tear down and create a new IRTE.  This later location
> > > can also handle vPCI.
> > > 
> > > Add pirq_guest_bind_gvec to plumb down the gvec without modifying all
> > > call sites.  Use msi_desc->gvec to pass through the desired value.
> > 
> > So basically the solution is to use the guest selected MSI vector as
> > the interrupt remapping table index, as then the guest can use the MSI
> > data and address fields without requiring Xen translation.
> > 
> > What about the guest using the same vector across multiple vCPUs?  So
> > MSI entries having the same vector field, but different target
> > destination CPUs?  That won't work correctly as all those MSIs will
> > attempt to use the same IRTE?

I think you will also need to add some extra checks to ensure that
when this quirk is active the guest will always set APIC ID 0 as the
interrupt destination for all MSI entries for the affected device, so
that there cannot be vector overlap between CPUs.  Otherwise the quirk
won't work as expected.

> > Note that when interrupt remapping support was introduced on AMD-Vi it
> > was indeed the vector that was used as index into the interrupt
> > remapping table, this was changed in:
> > 
> > 2ca9fbd739b8 AMD IOMMU: allocate IRTE entries instead of using a static mapping
> > 
> > > Only tested with AMD-Vi.  Requires per-device IRT.  With AMD-Vi, the
> > > number of MSIs is passed in, but a minimum of a page is allocated for
> > > the table.  The vector is 8 bits giving indices 0-255.  Even with 128bit
> > > IRTEs, 16 bytes, 1 page 4096 / 16 = 256 entries, so we don't have to
> > > worry about overflow.  N MSIs can only have the last one at 255, so the
> > > guest can't expect to have N vectors starting above 255 - N.
> > 
> > While this seems like a possible quirk for AMD, what about Intel?
> > 
> > And what about PV?  I think PV mostly works because the migration of
> > interrupts across CPUs doesn't cause the IRT index to change, but we
> > should somehow add checks to this regard if this is now a requirement
> > for such kind of quirky devices.
> 
> I didn't try, but PV dom0 worked with the device with multiple MSI.

Oh, so there's something about HVM/PVH that makes multiple MSI not
work.  I think we should figure out what it is before accepting a
solution.

> > > e.g. Replace amd_iommu_perdev_intremap with something generic.
> > > 
> > > The ath11k device supports and tries to enable 32 MSIs.  Linux in PVH
> > > dom0 and HVM domU fails enabling 32 and falls back to just 1, so that is
> > > all that has been tested.
> > 
> > DYK why it fails to enable 32?
> 
> Not exactly - someone else had the card.  msi_capability_init() failed. If
> it ends up in arch_setup_msi_irqs(), only 1 MSI is supported.  But precisely
> where the mutiple nvecs was denied was not tracked down.

Does it also fail on native?  I'm mostly asking because it would be
good to get to the bottom of this, so that we don't come up with a
partial solution that will break if multi-msi is used later in Linux.

> > > +                         uint8_t gvec)
> > >   {
> > >       struct irq_desc         *desc;
> > >       irq_guest_action_t *action, *newaction = NULL;
> > > @@ -1674,7 +1675,12 @@ int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
> > >                                             &cpu_online_map) )
> > >                   affinity = desc->affinity;
> > >               if ( affinity )
> > > +            {
> > > +                if ( gvec && desc->msi_desc )
> > > +                    desc->msi_desc->gvec = gvec;
> > 
> > Hm, this feels a bit out of place.  Shouldn't the field better be set
> > by pt_irq_create_bind() when irq_type == PT_IRQ_TYPE_MSI and the
> > quirk is enabled for the device?
> 
> I can look again, but I put it here for simplicity. pt_irq_create_bind() has
> the gvec, but not the irq_desc.  Passing gvec into pirq_guest_bind() was the
> easiest way to get the gvec into the msi_desc.
> 
> The gvec is in pirq_dpci, so maybe that can just be looked up lower down
> closer to programming the hardware.

TBH it's not a blocker, but I thought it would be more in-place to
deal with all MSI related stuff in pt_irq_create_bind(), so that you
could also set the filed there.

> > > +            new_remap_index = msi_desc->gvec;
> > > +        }
> > > +
> > > +        if ( new_remap_index && new_remap_index != msi_desc->remap_index &&
> > > +             msi_desc->remap_index != -1 )
> > > +        {
> > > +            /* Clear any existing entries */
> > > +            update_intremap_entry_from_msi_msg(iommu, bdf, nr,
> > > +                                               &msi_desc->remap_index,
> > > +                                               NULL, NULL);
> > 
> > Why do you need to clear any entries?  This will cause a window where
> > MSI entries targeting this IRTEs to generate faults because the
> > entries are not setup.
> > 
> > Just re-use them, update_intremap_entry_from_msi_msg() will update the
> > IRTE atomically so that there's no window where the entries would be
> > invalid, and thus to faults will be generated.
> 
> I see your point about the window.  I was trying to keep it clean as
> different indices get populated.  Initially, IRT[0..n-1] is populated.

Hm, I see.  For this specific use-case you are changing the IRT index
when the guest updates the MSI vector.  Tearing down of the old
entries would better be done _after_ the MSI entry has been updated,
so that at all times the pointed IRTE is valid.

> Later, when the gvec is available, we want IRT[gvec..gvec+n-1] populated.  I
> guess the new gvec ones could be added, and then 0...gvec-1 removed.  Or
> don't bother?

Indeed, that would be a better approach, as then the IRTE would always
be valid.

In fact you could possibly leave the old IRTE entries as-is, they
would be unhooked from any MSI entry, and if re-used they would be
setup correctly.  For this specific quirk where vector == IRT index
there's never the need to search for a free IRTE, as the guest set
vector will dictate which IRTE to use.

I guess it would be nice to attempt to keep the inuse IRTE bitmap in
sync if possible.

> I considered leaving IRTE[0] and adding IRTE[gvec].  I think that could
> work, but would be more hacky.
> 
> I was trying to keep the irte accounting bitmap correct, but it doesn't
> really matter for per-device IRT.

Yes, that's my thinking too.  If you can move the call to teardown the
old IRTE after the new one has been setup and the MSI entry has been
updated that would be the best approach IMO.

> > > diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
> > > index 95034c0d6b..96109d6ebe 100644
> > > --- a/xen/include/xen/irq.h
> > > +++ b/xen/include/xen/irq.h
> > > @@ -192,6 +192,8 @@ extern void pirq_guest_eoi(struct pirq *pirq);
> > >   extern void desc_guest_eoi(struct irq_desc *desc, struct pirq *pirq);
> > >   extern int pirq_guest_unmask(struct domain *d);
> > >   extern int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share);
> > > +extern int pirq_guest_bind_gvec(struct vcpu *v, struct pirq *pirq,
> > > +                                int will_share, uint8_t gvec);
> > 
> > Hm, it seems like a layering violation to put a x86 specific function
> > in a common header.
> 
> Oh, yes, this could be internal to x86.
> 
> > Did you consider hiding the need to use the guest vector as the IRT
> > index in struct arch_pirq?
> 
> With sufficient pointer following, the gvec can probably be found. Passing
> gvec to pirq_guest_bind_gvec() was just the easiest way to bridge the gap.

No strong opinion, just wondering whether it was considered and if it
could be easier to implement.

> > >   extern void pirq_guest_unbind(struct domain *d, struct pirq *pirq);
> > >   extern void pirq_set_affinity(struct domain *d, int pirq,
> > >                                 const cpumask_t *mask);
> > > diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> > > index 4f12bcf089..14afd78f75 100644
> > > --- a/xen/include/xen/pci.h
> > > +++ b/xen/include/xen/pci.h
> > > @@ -127,6 +127,8 @@ struct pci_dev {
> > >       /* Device with errata, ignore the BARs. */
> > >       bool ignore_bars;
> > > +    bool gvec_as_irte_idx;
> > 
> > A small comment might be helpful here:
> > 
> > /* Quirk: force the use of the MSI vector as the IRT index. */
> 
> Sounds good.
> 
> > Overall I'm a little at unease for allowing domains to control the IRT
> > index address space.  I haven't looked closely enough to see if a
> > guest could cause some kind of clashes or the triggering of internal
> > Xen state checks by for example forcing multiple MSI entries to use
> > the same vector.
> 
> I was thinking that with per-device intremap, and the fact that it is only a
> single MSI capability for the device, the change is fairly contained.  It's
> just changing the indices.  Xen is still controlling the contents of the
> IRTEs, so that seems okay to me.

Indeed.  I cannot find any obvious issue.

Thanks, Roger.

