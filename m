Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6346B434D03
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 16:03:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213953.372334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdCC0-0008I7-WE; Wed, 20 Oct 2021 14:03:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213953.372334; Wed, 20 Oct 2021 14:03:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdCC0-0008GF-Sr; Wed, 20 Oct 2021 14:03:44 +0000
Received: by outflank-mailman (input) for mailman id 213953;
 Wed, 20 Oct 2021 14:03:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vRSV=PI=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1mdCBz-0008G6-V2
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 14:03:44 +0000
Received: from mail-lj1-x22b.google.com (unknown [2a00:1450:4864:20::22b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2bd54665-9053-487b-8e79-0cd243680b66;
 Wed, 20 Oct 2021 14:03:43 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id o26so12819600ljj.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Oct 2021 07:03:42 -0700 (PDT)
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
X-Inumbo-ID: 2bd54665-9053-487b-8e79-0cd243680b66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IzvAZhEEZNk2D8i0OBzMI0Erc+lPwUrgG7lPeht66ww=;
        b=nvLuWP9blWTMC8O2co8iofObAEe/Uw3KBpWpSwPeW7PbYKykN6NS6DuGNfsQc1hdJF
         qQMNkNsAuUNo91gabiB4ZhC26GWHeZ0wCE+7VFIW8OCR0m15WgHXlOHxOJqrfJiXqJKa
         T9FZantVOYEZtefD1zrOsGBJVKtmHct3Q4N+CdjKySCxeNpd3Ls3n+q5652UUhcmy0bD
         wo0wLMWT1CQFypDwftXOnGDVOdLlR1JC2cVXpRK4vJeQVjptqWo3sTP8bCAywNbIW3IT
         Htryo8+ctSwrg+H+cieRm76WeL19lDyBahaooYSZAoh/4tYABflbw/CrQf/HKH0INQ2F
         NjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IzvAZhEEZNk2D8i0OBzMI0Erc+lPwUrgG7lPeht66ww=;
        b=3U1RXwu1r826EZviqCI0Kk+9Czr0jZymg4rysR7fm32ezPCc5azMOyyBczGiVhW9X9
         UY26RLZOfz2/6mHGdXuSkbjXiZTWqeV3a+eQD8tN6Y8Q2kreZr116woT0ItOdb4daI1+
         z/5yKdO/r+ypCOyubn5PSjE2Uk+SSohNeKFIIE58ytaRbyylCPjT7L8XmSRfRsZRDETL
         YK2p9Io2nvocuhWnDxvxQaGjx6PcR09SgvhFABFNfv0ax/FOXnDu81+HpcuNXfw2P8BK
         MAb1Olyv1QMA7GjCTjik+IpeijUHYiKpcYY5a5ISFA2AZuW0LqxQYOyeS3vwlxAbJEUN
         dmPA==
X-Gm-Message-State: AOAM533agaI0bcE+5hWps5rJnBcDvx9PE+pqrS4W4RAgjWpf8g/iKKe5
	wwBNhQtqMuvle7CajoWfl0rFPkcpYY0HYiOYI3s=
X-Google-Smtp-Source: ABdhPJyITdeKpXSmOLSbF+vxTekkL41/oKy0b7me+iwSGmPYFq4hvtYX532gltEEcHiHcxou9amIxVDBcPrxPcnCO7Y=
X-Received: by 2002:a05:651c:283:: with SMTP id b3mr13982322ljo.459.1634738620768;
 Wed, 20 Oct 2021 07:03:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211019202906.GA2397931@bhelgaas> <5f050b30-fa1c-8387-0d6b-a667851b34b0@oderland.se>
 <877de7dfl2.wl-maz@kernel.org>
In-Reply-To: <877de7dfl2.wl-maz@kernel.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 20 Oct 2021 10:03:29 -0400
Message-ID: <CAKf6xpt=ZYGyJXMwM7ccOWkx71R0O-QeLjkBF-LtdDcbSnzHsA@mail.gmail.com>
Subject: Re: [PATCH v2] PCI/MSI: Re-add checks for skip masking MSI-X on Xen PV
To: Marc Zyngier <maz@kernel.org>
Cc: Josef Johansson <josef@oderland.se>, Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org, 
	xen-devel <xen-devel@lists.xenproject.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="UTF-8"

Hi, Marc,

Adding Juergen and Boris since this involves Xen.

On Wed, Oct 20, 2021 at 8:51 AM Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 19 Oct 2021 22:48:19 +0100,
> Josef Johansson <josef@oderland.se> wrote:
> >
> > From: Josef Johansson <josef@oderland.se>
> >
> >
> > PCI/MSI: Re-add checks for skip masking MSI-X on Xen PV
> >
> > commit fcacdfbef5a1 ("PCI/MSI: Provide a new set of mask and unmask
> > functions") introduce functions pci_msi_update_mask() and
> > pci_msix_write_vector_ctrl() that is missing checks for
> > pci_msi_ignore_mask that exists in commit 446a98b19fd6 ("PCI/MSI: Use
> > new mask/unmask functions"). Add them back since it is
> > causing severe lockups in amdgpu drivers under Xen during boot.
> >
> > As explained in commit 1a519dc7a73c ("PCI/MSI: Skip masking MSI-X
> > on Xen PV"), when running as Xen PV guest, masking MSI-X is a
> > responsibility of the hypervisor.
> >
> > Fixes: fcacdfbef5a1 ("PCI/MSI: Provide a new set of mask and unmask
> > functions")
> > Suggested-by: Jason Andryuk <jandryuk@gmail.com>
> > Signed-off-by: Josef Johansson <josef@oderland.se>
> >
>
> [...]
>
> >
> > diff --git a/drivers/pci/msi.c b/drivers/pci/msi.c
> > index 0099a00af361..355b791e382f 100644
> > --- a/drivers/pci/msi.c
> > +++ b/drivers/pci/msi.c
> > @@ -148,6 +148,9 @@ static noinline void pci_msi_update_mask(struct msi_desc *desc, u32 clear, u32 s
> >       raw_spinlock_t *lock = &desc->dev->msi_lock;
> >       unsigned long flags;
> >
> > +     if (pci_msi_ignore_mask || desc->msi_attrib.is_virtual)
> > +             return;
> > +
>
> I'd rather be consistent, and keep the check outside of
> pci_msi_update_mask(), just like we do in __pci_msi_mask_desc().
> Something like this instead:
>
> diff --git a/drivers/pci/msi.c b/drivers/pci/msi.c
> index 0099a00af361..6c69eab304ce 100644
> --- a/drivers/pci/msi.c
> +++ b/drivers/pci/msi.c
> @@ -420,7 +420,8 @@ static void __pci_restore_msi_state(struct pci_dev *dev)
>         arch_restore_msi_irqs(dev);
>
>         pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &control);
> -       pci_msi_update_mask(entry, 0, 0);
> +       if (!(pci_msi_ignore_mask || desc->msi_attrib.is_virtual))
> +               pci_msi_update_mask(entry, 0, 0);
>         control &= ~PCI_MSI_FLAGS_QSIZE;
>         control |= (entry->msi_attrib.multiple << 4) | PCI_MSI_FLAGS_ENABLE;
>         pci_write_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, control);
>
> But the commit message talks about MSI-X, and the above is MSI
> only. Is Xen messing with the former, the latter, or both?

My understanding is pci_msi_ignore_mask covers both MSI and MSI-X for Xen.

> >       raw_spin_lock_irqsave(lock, flags);
> >       desc->msi_mask &= ~clear;
> >       desc->msi_mask |= set;
> > @@ -181,6 +184,9 @@ static void pci_msix_write_vector_ctrl(struct msi_desc *desc, u32 ctrl)
> >  {
> >       void __iomem *desc_addr = pci_msix_desc_addr(desc);
> >
> > +     if (pci_msi_ignore_mask || desc->msi_attrib.is_virtual)
> > +             return;
> > +
> >       writel(ctrl, desc_addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
> >  }
>
> I have similar reservations for this one.

The problem here is some of the changes in commit 446a98b19fd6
("PCI/MSI: Use new mask/unmask functions") bypass the checks in
__pci_msi_mask_desc/__pci_msi_unmask_desc.  I've wondered if it would
be cleaner to push all the `if (pci_msi_ignore_mask)` checks down to
the place of the writes.  That keeps dropping the write local to the
write and leaves the higher level code consistent between the regular
and Xen PV cases.  I don't know where checking
desc->msi_attrib.is_virtual is appropriate.

Regards,
Jason

