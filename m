Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B237A50776
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 18:57:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902614.1310652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpszl-0005lN-Uf; Wed, 05 Mar 2025 17:57:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902614.1310652; Wed, 05 Mar 2025 17:57:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpszl-0005ia-R6; Wed, 05 Mar 2025 17:57:25 +0000
Received: by outflank-mailman (input) for mailman id 902614;
 Wed, 05 Mar 2025 17:57:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mCKF=VY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tpszk-0005hC-B8
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 17:57:24 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49a8d8d2-f9eb-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 18:57:22 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5e0b70fb1daso12493412a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 09:57:22 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-abf4a3a19b2sm850988066b.44.2025.03.05.09.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 09:57:21 -0800 (PST)
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
X-Inumbo-ID: 49a8d8d2-f9eb-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741197441; x=1741802241; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KkojD1+slrrEEwC02sDP2l0YAwsKigKngP2peukC2Jc=;
        b=vCTSIiK/ymfvSHXcohW5EAjzy7hTNQGR3YsBmqJGfKil+dkEp2cFd61s8b5IhQAB2n
         ijHwYwSKcAU7p84V2kJTZemdVWnWGP9IfmRKIjilzI/v/e+aRPc35FjXh5mBVD7Z5iPp
         no19diiOM2MgshXqwM2lLIIfgD/jetxiSiE3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741197441; x=1741802241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkojD1+slrrEEwC02sDP2l0YAwsKigKngP2peukC2Jc=;
        b=NMjuE66yCcmwvBkXdmSXB/M8hOQD0DiFKf0UtQdID4CQZu9GPXuACozYUlwV67hbej
         EMuJuhrZOe3bweJSlvPlPUFc80ZxfxrENPzWU0gSTtRu9NkgW8/YVvpHc/YYDTuKTRiR
         GbaoCptNdbAjjAj73IYHyHwuLIOnQZgjSFaJQBVWByPkTGI/+DUWDbW/WPYO36YuV+dR
         HYF8OxiMAoMG3nHPjqj5REI0rySniDog/35NJAsMli6W1l0PIne8HmL60dhdP0bduDr2
         kkvhQGoBtg0MunAFB1+qcKViQ01ibTZPHklS2SgSYSUdsHtdM8hjeery+dPjgYUw7VoE
         MnWg==
X-Forwarded-Encrypted: i=1; AJvYcCWafyQAQJL+RwuCCtomRB2rFitrFRc+0EqKKpJDA+E/xwUNruTAjM6bKnwfaRPA1TL3iNksrlPFurE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXb/OuNQrCxZgfk8H6w1T3hjpxjIahyY5YIs9DN41iBBULC5kh
	BR/jQJuRZ9qDSMbVCY5iSuVdV1Pri/MCM89blD2gGcYsPypWS7FEfX5+Yug+0K8=
X-Gm-Gg: ASbGncunsAMx19Oh0k3WuBOK755GrjyiOD9h0UjCAuAGy7NyJatTJSG+ZXI1JaV7nZ4
	LsGNG4n5ldFtzJVZcMnRY4JhR+tTtuyvIXK1UxuCA86A1V67k6mcYCkQCVIutlTRrpHFfAlx4cN
	SEXXwCZRFi6JPL3q6dkXg71rNmFDByjwBHRJ/kN9ZmFNyb2Yqm5QcKT94ZluNILhaP66XRT4a0E
	QjQr6lQFpu4voW+Q5gVmcXZjGf3o2xx/PRtPMkuTEaOdwGGwhsgDDp8nKIg6s/zdtaEDqr2sifx
	8paFsRdFhxAdWXCgmlefu8kMS6olFrP+tSvdYez+600J6N7UTF9v+Kk=
X-Google-Smtp-Source: AGHT+IF9jiCju3rqNPopHNbEGYO4mDD+GrqYP6Hh7xi+HjSLc74YrwdqBxDTMZqdCFI1NLKBQ4w9Eg==
X-Received: by 2002:a17:907:2dac:b0:abf:70fb:7f05 with SMTP id a640c23a62f3a-ac20dafc173mr420553166b.50.1741197441529;
        Wed, 05 Mar 2025 09:57:21 -0800 (PST)
Date: Wed, 5 Mar 2025 18:57:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/msi: prevent MSI entry re-writes of the same data
Message-ID: <Z8iQfwqmUm0PnAxI@macbook.local>
References: <20250228113237.6116-1-roger.pau@citrix.com>
 <c06573d3-36a1-4146-ac3f-5dbd4d82d22e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c06573d3-36a1-4146-ac3f-5dbd4d82d22e@suse.com>

On Wed, Mar 05, 2025 at 11:30:51AM +0100, Jan Beulich wrote:
> On 28.02.2025 12:32, Roger Pau Monne wrote:
> > @@ -191,8 +193,6 @@ void msi_compose_msg(unsigned vector, const cpumask_t *cpu_mask, struct msi_msg
> >  
> >  static int write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
> >  {
> > -    entry->msg = *msg;
> > -
> >      if ( iommu_intremap != iommu_intremap_off )
> >      {
> >          int rc;
> > @@ -203,6 +203,20 @@ static int write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
> >              return rc;
> >      }
> >  
> > +    /*
> > +     * Avoid updating the MSI entry if the address and data fields haven't
> > +     * changed.  When using interrupt remapping changing the MSI affinity
> > +     * shouldn't change the interrupt remapping table index, and hence the MSI
> > +     * address and data fields should remain the same.
> > +     */
> > +    if ( entry->msg.address == msg->address && entry->msg.data == msg->data )
> > +    {
> > +        entry->msg.dest32 = msg->dest32;
> > +        return 0;
> > +    }
> > +
> > +    entry->msg = *msg;
> 
> It is perhaps pure luck that iommu_update_ire_from_msi() doesn't use entry's
> "msg" field, and hence that this re-arrangement is okay. It's unclear to me
> whether going forward this might not bite us.

I've updated the comment in msi_desc to make it clear what the `msg`
field contains.  If iommu_update_ire_from_msi() has a need to fetch
the previous non-translated data and address fields it could always
add an extra field to msi_desc.

> > @@ -1407,7 +1415,9 @@ int pci_restore_msi_state(struct pci_dev *pdev)
> >          }
> >          type = entry->msi_attrib.type;
> >  
> > -        msg = entry->msg;
> > +        msg.dest32 = entry->msg.dest32;
> > +        msi_compose_msg(desc->arch.vector, NULL, &msg);
> > +        entry->msg = (typeof(entry->msg)){};
> >          write_msi_msg(entry, &msg);
> 
> Hmm, this isn't exactly a "restore" then anymore. That said, re-constructing
> the message may even be more correct. Then, however, the question is whether
> passing NULL as msi_compose_msg()'s middle argument is really appropriate. A
> little bit of commentary may be desirable here in any event, also as to need
> to clear entry->msg.

I can add a comment.  Note that as part of the patch a comment is
already added to both the msi_compose_msg() prototype and definition
regarding what passing a NULL cpu_mask implies.

> 
> There's (at least) one place where behavior changes with the change of what
> we store in struct msi_desc's msg field (previously untranslated, now
> translated): dump_msi() wants to use the untranslated form. I fear it can't
> even re-construct some of the data it means to log (without reading from
> the IRTE).

Oh, I've missed dump_msi().  Let me see what I can do there.

Another possibility is for iommu_update_ire_from_msi() to report
whether the IRTE index has changed, and so the MSI fields have been
updated and need propagating to the hardware.

> > --- a/xen/drivers/passthrough/vtd/iommu.c
> > +++ b/xen/drivers/passthrough/vtd/iommu.c
> > @@ -1182,7 +1182,7 @@ static void cf_check dma_msi_end(struct irq_desc *desc, u8 vector)
> >  static void cf_check dma_msi_set_affinity(
> >      struct irq_desc *desc, const cpumask_t *mask)
> >  {
> > -    struct msi_msg msg;
> > +    struct msi_msg msg = {};
> >      unsigned int dest;
> >      unsigned long flags;
> >      struct vtd_iommu *iommu = desc->action->dev_id;
> 
> Why not a similar transformation as you do in set_msi_affinity(), eliminating
> the local "dest"?

It was more intrusive, but I can certainly do it.

> A change like the one here is likely needed in __hpet_setup_msi_irq(), to
> prevent accidental "uninitialized struct field" warnings.

Hm, won't the struct be fully initialized in that case, by getting
passed a cpu_mask?  I don't mind doing so however.

> hpet_msi_set_affinity() might then also want to use msi_compose_msg(), albeit
> that may also be regarded as an independent change.

Possibly, note that HPET code doesn't use write_msi_msg(), and hence
is only partially affected by the msi_compose_msg() change, but not
the write_msi_msg() one, as it continues to store the untranslated MSI
address and data fields in hpet_event_channel struct.

Thanks, Roger.

