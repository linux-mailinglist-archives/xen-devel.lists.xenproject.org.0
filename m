Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F395438CFD
	for <lists+xen-devel@lfdr.de>; Mon, 25 Oct 2021 03:26:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215613.374918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1meojw-00020E-5n; Mon, 25 Oct 2021 01:25:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215613.374918; Mon, 25 Oct 2021 01:25:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1meojw-0001xv-1C; Mon, 25 Oct 2021 01:25:28 +0000
Received: by outflank-mailman (input) for mailman id 215613;
 Mon, 25 Oct 2021 01:25:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9eqc=PN=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1meoju-0001xp-Mp
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 01:25:26 +0000
Received: from mail-lf1-x12e.google.com (unknown [2a00:1450:4864:20::12e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 52efbf3f-c06e-4b09-ae9c-7675dd2b7631;
 Mon, 25 Oct 2021 01:25:25 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id u21so9874049lff.8
 for <xen-devel@lists.xenproject.org>; Sun, 24 Oct 2021 18:25:25 -0700 (PDT)
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
X-Inumbo-ID: 52efbf3f-c06e-4b09-ae9c-7675dd2b7631
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p5T2EfZYyfkG5Z23knzLOru2yfkRV1ugrXppMS5fiXY=;
        b=Ib86kGbYxPnQQ465yraknbQ9FzDUdsN6TPf0FYNMjVQ4o9TlU/LiuoeQ96nw8tSGpK
         ZyFyHdjITivDnXfzYT5Cd8pgiPWYGA1SgIkRy3wPrlyb7ghApKTQWeIRu/OIarztdebG
         TUoMFWg6oRTaIJJpxvia64iVZGUiMn3SOQ9tFEAYJtAyV32MkvH71LW+hV/W3/iO+Z47
         aMJQ/B0nRzVkHubd7seq8mX1eiEz4EXDTSUZgoel7CnqvApk0Tu1ykRTtGntcrDH//0g
         jUbl63Fb4BlO6geV1yKO6vmpxEdrfTW14vkQrBEOyhtkr3yqtZ3loBGUeaYjZ768VsYW
         QSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p5T2EfZYyfkG5Z23knzLOru2yfkRV1ugrXppMS5fiXY=;
        b=Mb9uKjBxR/zB0UYB9rHRONd7WliqJWMMS68YnFt3FUY8PTnfi//LT/lRfKCMXZCwO6
         QiQCab3kDnb/jm3+22QhO/mZchFAXO9xaZ9Kf7Kko0XXGhcroqLbYy6Qh8QOCr2anP40
         EpdABzBgvFPEitQuDsJQi7M3CMBiVoVhHDdoDNjJcFGT5oQp6iq18+/QK+0M6r35DTig
         slL5pyPqxtetgkFFxZZKAuJc6U3RYt0UFFCECbPHv9jHhyP3l0EgVVIREDHKQtlrmSqG
         VsSswD7J2mODvSoEaU6iErbbpej1rnwmb/7mwdn5nOJx2UBboUkBJRlvrXLjArUxU6Tc
         sg6A==
X-Gm-Message-State: AOAM532/WeH3/ysxBApbiuKPwXsd7p8Bktt3dYXDYqJKPg8M0jV48ZvL
	ac5ouG6qJwL4nKPBg41Tq/At3fCK7+jOV4sCMEA=
X-Google-Smtp-Source: ABdhPJy6M/gmp5NOw/fxpoOY/JQYXFqfbnkhNuBYl7lMg+mAJmReG67HNIqVK4RLFOxAbBbxWLTE+SmFI33ykmdhpKo=
X-Received: by 2002:a05:6512:b21:: with SMTP id w33mr13882544lfu.447.1635125124623;
 Sun, 24 Oct 2021 18:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211019202906.GA2397931@bhelgaas> <5f050b30-fa1c-8387-0d6b-a667851b34b0@oderland.se>
 <877de7dfl2.wl-maz@kernel.org> <CAKf6xpt=ZYGyJXMwM7ccOWkx71R0O-QeLjkBF-LtdDcbSnzHsA@mail.gmail.com>
 <3434cb2d-4060-7969-d4c4-089c68190527@oderland.se> <90277228-cf14-0cfa-c95e-d42e7d533353@oderland.se>
In-Reply-To: <90277228-cf14-0cfa-c95e-d42e7d533353@oderland.se>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sun, 24 Oct 2021 21:25:12 -0400
Message-ID: <CAKf6xpvZ8fxuBY4BZ51UZzF92zDUcvfav9_pOT7F3w-Bc8YkwA@mail.gmail.com>
Subject: Re: [PATCH v2] PCI/MSI: Re-add checks for skip masking MSI-X on Xen PV
To: Josef Johansson <josef@oderland.se>
Cc: Marc Zyngier <maz@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org, 
	xen-devel <xen-devel@lists.xenproject.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 24, 2021 at 2:55 PM Josef Johansson <josef@oderland.se> wrote:

> I ended up with this patch, I also masked pci_set_mask and
> pci_set_unmask, even though patching __pci_restore_msi_state and
> __pci_restore_msi_state solved this problem, I found that it did not
> properly make the system be able to survive flip_done timeout related
> problems during suspend/resume. Would this be something you had in mind
> Marc? I will make one more try with just patching
> __pci_restore_msi_state and __pci_restore_msix_state just to make sure.
> diff --git a/drivers/pci/msi.c b/drivers/pci/msi.c index
> 4b4792940e86..0b2225066778 100644 --- a/drivers/pci/msi.c +++
> b/drivers/pci/msi.c @@ -420,7 +420,8 @@ static void
> __pci_restore_msi_state(struct pci_dev *dev) arch_restore_msi_irqs(dev);
> pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &control); -
> pci_msi_update_mask(entry, 0, 0); + if (!(pci_msi_ignore_mask ||
> entry->msi_attrib.is_virtual)) + pci_msi_update_mask(entry, 0, 0);
> control &= ~PCI_MSI_FLAGS_QSIZE; control |= (entry->msi_attrib.multiple

This patch was mangled.

> This makes sense the patch would be like so, I'm testing this out now
> hoping it will
>
> perform as good. Now the check is performed in four places

Close.  I'll reply with my compiled, but untested patch of what I was thinking.

> That leaves me with a though, will this set masked, and should be checked as well?
>
> void __pci_write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
> {
>         struct pci_dev *dev = msi_desc_to_pci_dev(entry);
>
>         if (dev->current_state != PCI_D0 || pci_dev_is_disconnected(dev)) {
>                 /* Don't touch the hardware now */
>         } else if (entry->msi_attrib.is_msix) {
>                 void __iomem *base = pci_msix_desc_addr(entry);
>                 u32 ctrl = entry->msix_ctrl;
>                 bool unmasked = !(ctrl & PCI_MSIX_ENTRY_CTRL_MASKBIT);
>
>                 if (entry->msi_attrib.is_virtual)
>                         goto skip;
>
>                 /*
>                  * The specification mandates that the entry is masked
>                  * when the message is modified:
>                  *
>                  * "If software changes the Address or Data value of an
>                  * entry while the entry is unmasked, the result is
>                  * undefined."
>                  */
>                 if (unmasked)
> >>>                     pci_msix_write_vector_ctrl(entry, ctrl | PCI_MSIX_ENTRY_CTRL_MASKBIT);

My patch adds a check in pci_msix_write_vector_ctrl(), but the comment
above means PV Xen's behavior may be incorrect if Linux is calling
this function and modifying the message.

Regards,
Jason

