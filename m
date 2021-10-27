Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4684843C574
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 10:46:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216745.376463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfeYz-0007HB-Np; Wed, 27 Oct 2021 08:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216745.376463; Wed, 27 Oct 2021 08:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfeYz-0007FO-Kc; Wed, 27 Oct 2021 08:45:37 +0000
Received: by outflank-mailman (input) for mailman id 216745;
 Wed, 27 Oct 2021 08:45:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5kU4=PP=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1mfeYx-0007FI-Fi
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 08:45:35 +0000
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f43c9c9-3702-11ec-8456-12813bfff9fa;
 Wed, 27 Oct 2021 08:45:34 +0000 (UTC)
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
X-Inumbo-ID: 3f43c9c9-3702-11ec-8456-12813bfff9fa
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1635324332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k/OESFTM/lB7AHIqBru+EjPila2/PBI8kXu3SGoA/xs=;
	b=1O7+Xe0fRLruaNrwt8+UW83HybEoVPrPKRTGETsTswE/iA/L5454bGK3qIYEbl9hRTW9Ox
	F6I1PFpxkR0r5V6M7fHwef+wMYi6DsnfmXmZSe7xe30jDCwgnEeB6tvmDMOtGZjllIDGBq
	DzLseKGvv+IFI8p5By1CxI7Qg8WeEYRroNnVVrcwdZmq3lebirT0UaOFhsT1MjdBF1UCTv
	MF6QfB6TiAypPRSmkDrsqCelULxefGlwNtwWntgXG5A68wuszcnZA4Ody+EIMRxHjwbKt0
	t8heATqPGiqC3zT3bPdCgfm5mL9yM5ksIuo5VbOMSXTbnsp6K4dA/aP/znRisw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1635324332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k/OESFTM/lB7AHIqBru+EjPila2/PBI8kXu3SGoA/xs=;
	b=xF3jfcyPV3qmiqlxQdURqI+hvdEKKydZtWMoHAKqSJp61D2nH7H+nNIm7zqY4TrS4q4QPP
	6UpaskOsn1qEC3Aw==
To: Jason Andryuk <jandryuk@gmail.com>, josef@oderland.se
Cc: boris.ostrovsky@oracle.com, helgaas@kernel.org, jandryuk@gmail.com,
 jgross@suse.com, linux-pci@vger.kernel.org, maz@kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH] PCI/MSI: Fix masking MSI/MSI-X on Xen PV
In-Reply-To: <20211025012503.33172-1-jandryuk@gmail.com>
References: <90277228-cf14-0cfa-c95e-d42e7d533353@oderland.se>
 <20211025012503.33172-1-jandryuk@gmail.com>
Date: Wed, 27 Oct 2021 10:45:31 +0200
Message-ID: <87fssmg8k4.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Oct 24 2021 at 21:25, Jason Andryuk wrote:
> diff --git a/drivers/pci/msi.c b/drivers/pci/msi.c
> index 4b4792940e86..478536bafc39 100644
> --- a/drivers/pci/msi.c
> +++ b/drivers/pci/msi.c
> @@ -148,6 +148,9 @@ static noinline void pci_msi_update_mask(struct msi_desc *desc, u32 clear, u32 s
>  	raw_spinlock_t *lock = &desc->dev->msi_lock;
>  	unsigned long flags;
>  
> +	if (pci_msi_ignore_mask)
> +		return;
> +
>  	raw_spin_lock_irqsave(lock, flags);
>  	desc->msi_mask &= ~clear;
>  	desc->msi_mask |= set;
> @@ -181,6 +184,9 @@ static void pci_msix_write_vector_ctrl(struct msi_desc *desc, u32 ctrl)
>  {
>  	void __iomem *desc_addr = pci_msix_desc_addr(desc);
>  
> +	if (pci_msi_ignore_mask)
> +		return;
> +
>  	writel(ctrl, desc_addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
>  }
>  
> @@ -200,7 +206,7 @@ static inline void pci_msix_unmask(struct msi_desc *desc)
>  
>  static void __pci_msi_mask_desc(struct msi_desc *desc, u32 mask)
>  {
> -	if (pci_msi_ignore_mask || desc->msi_attrib.is_virtual)
> +	if (desc->msi_attrib.is_virtual)
>  		return;
>  
>  	if (desc->msi_attrib.is_msix)
> @@ -211,7 +217,7 @@ static void __pci_msi_mask_desc(struct msi_desc *desc, u32 mask)
>  
>  static void __pci_msi_unmask_desc(struct msi_desc *desc, u32 mask)
>  {
> -	if (pci_msi_ignore_mask || desc->msi_attrib.is_virtual)
> +	if (desc->msi_attrib.is_virtual)
>  		return;
>  
>  	if (desc->msi_attrib.is_msix)

No, really. This is horrible and incomplete. The right thing to do is to
move the check back into the low level accessors and remove it from the
call sites simply because the low level accessors can be reached not
only from the mask/unmask functions. But the above also fails to respect
msi_attrib.maskbit... I'll send out a proper fix in a few.

Thanks,

        tglx

