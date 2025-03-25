Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADF3A6EC5D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 10:21:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926164.1329027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx0Sl-0003cG-Ui; Tue, 25 Mar 2025 09:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926164.1329027; Tue, 25 Mar 2025 09:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx0Sl-0003ah-Ra; Tue, 25 Mar 2025 09:20:47 +0000
Received: by outflank-mailman (input) for mailman id 926164;
 Tue, 25 Mar 2025 09:20:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Gn6=WM=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1tx0Sk-0003ab-GN
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 09:20:46 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e185323-095a-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 10:20:45 +0100 (CET)
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
X-Inumbo-ID: 6e185323-095a-11f0-9ea3-5ba50f476ded
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1742894444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6QvtzpcrlTMKTUsjszgMNWd7fXMOiNd5xLGAalHbQxs=;
	b=QOMdMxBg1H6zgb4zHcPB1haB9iffsGBim2vaQ+wyuLnndP3GSVmNhSBK1BDHNzMC0bw+KH
	bu5oPJgsY+8KP7kuf2E1GEoXz7F177RB1NwKP9oNcMrvbgtNXu8ec86guIvUjV9Pwxfn8T
	MsvOpI/FScQCmlAc6V4eAMrDcMIat+JT875w2Qwv0Di/KbD70St7t6p1Tmas025hQwmYMk
	KP/rx2VRvJulCVkBFlKX+K9ZC577BUecmANqid1qZl8HzahbLxSxiXQXZlS0+Rt0WD7p0D
	mdiyvkFo+Nsqn3UWBaX+PgrlrQKIklwQE1hRo60h9BkEADvDHTV/93Gz+5z3Vg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1742894444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6QvtzpcrlTMKTUsjszgMNWd7fXMOiNd5xLGAalHbQxs=;
	b=SOSpKoaX7xhFOLAifQ1TBb5ORu4whJgBUD7Q62S3Xx2HgifaxTW+BNkbmo2amiYsibbnEW
	lxyc9UwshXqbQWAQ==
To: Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>, Daniel Gomez
 <da.gomez@kernel.org>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Bjorn Helgaas
 <helgaas@kernel.org>,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>
Subject: Re: [PATCH v3 3/3] PCI/MSI: Convert pci_msi_ignore_mask to per MSI
 domain flag
In-Reply-To: <87y0wtzg0z.ffs@tglx>
References: <20250320210741.GA1099701@bhelgaas>
 <846c80f8-b80f-49fd-8a50-3fe8a473b8ec@suse.com>
 <qn7fzggcj6qe6r6gdbwcz23pzdz2jx64aldccmsuheabhmjgrt@tawf5nfwuvw7>
 <Z-GbuiIYEdqVRsHj@macbook.local>
 <kp372led6jcryd4ubpyglc4h7b3erramgzsjl2slahxdk7w575@jganskuwkfvb>
 <Z-Gv6TG9dwKI-fvz@macbook.local> <87y0wtzg0z.ffs@tglx>
Date: Tue, 25 Mar 2025 10:20:43 +0100
Message-ID: <87v7rxzct0.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25 2025 at 09:11, Thomas Gleixner wrote:

> On Mon, Mar 24 2025 at 20:18, Roger Pau Monn=C3=A9 wrote:
>> On Mon, Mar 24, 2025 at 07:58:14PM +0100, Daniel Gomez wrote:
>>> The issue is that info appears to be uninitialized. So, this worked for=
 me:
>>
>> Indeed, irq_domain->host_data is NULL, there's no msi_domain_info.  As
>> this is x86, I was expecting x86 ot always use
>> x86_init_dev_msi_info(), but that doesn't seem to be the case.  I
>> would like to better understand this.
>
> Indeed. On x86 this should not happen at all. On architectures, which do
> not use (hierarchical) interrupt domains, it will return NULL.
>
> So I really want to understand why this happens on x86 before such a
> "fix" is deployed.

So after staring at it some more it's clear. Without XEN, the domain
returned is the MSI parent domain, which is the vector domain in that
setup. That does not have a domain info set. But on legacy architectures
there is not even a domain.

It's really wonderful that we have a gazillion ways to manage the
backends of PCI/MSI....

So none of the suggested pointer checks will cover it correctly. Though
there is already a function which allows to query MSI domain flags
independent of the underlying insanity. Sorry for not catching it in
review.

Untested patch below.

Thanks,

        tglx
---
 drivers/pci/msi/msi.c |   18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -285,8 +285,6 @@ static void pci_msi_set_enable(struct pc
 static int msi_setup_msi_desc(struct pci_dev *dev, int nvec,
 			      struct irq_affinity_desc *masks)
 {
-	const struct irq_domain *d =3D dev_get_msi_domain(&dev->dev);
-	const struct msi_domain_info *info =3D d->host_data;
 	struct msi_desc desc;
 	u16 control;
=20
@@ -297,7 +295,7 @@ static int msi_setup_msi_desc(struct pci
 	/* Lies, damned lies, and MSIs */
 	if (dev->dev_flags & PCI_DEV_FLAGS_HAS_MSI_MASKING)
 		control |=3D PCI_MSI_FLAGS_MASKBIT;
-	if (info->flags & MSI_FLAG_NO_MASK)
+	if (pci_msi_domain_supports(dev, MSI_FLAG_NO_MASK, DENY_LEGACY))
 		control &=3D ~PCI_MSI_FLAGS_MASKBIT;
=20
 	desc.nvec_used			=3D nvec;
@@ -605,20 +603,18 @@ static void __iomem *msix_map_region(str
  */
 void msix_prepare_msi_desc(struct pci_dev *dev, struct msi_desc *desc)
 {
-	const struct irq_domain *d =3D dev_get_msi_domain(&dev->dev);
-	const struct msi_domain_info *info =3D d->host_data;
-
 	desc->nvec_used				=3D 1;
 	desc->pci.msi_attrib.is_msix		=3D 1;
 	desc->pci.msi_attrib.is_64		=3D 1;
 	desc->pci.msi_attrib.default_irq	=3D dev->irq;
 	desc->pci.mask_base			=3D dev->msix_base;
-	desc->pci.msi_attrib.can_mask		=3D !(info->flags & MSI_FLAG_NO_MASK) &&
-						  !desc->pci.msi_attrib.is_virtual;
=20
-	if (desc->pci.msi_attrib.can_mask) {
+
+	if (!pci_msi_domain_supports(dev, MSI_FLAG_NO_MASK, DENY_LEGACY) &&
+	    !desc->pci.msi_attrib.is_virtual) {
 		void __iomem *addr =3D pci_msix_desc_addr(desc);
=20
+		desc->pci.msi_attrib.can_mask =3D true;
 		desc->pci.msix_ctrl =3D readl(addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
 	}
 }
@@ -715,8 +711,6 @@ static int msix_setup_interrupts(struct
 static int msix_capability_init(struct pci_dev *dev, struct msix_entry *en=
tries,
 				int nvec, struct irq_affinity *affd)
 {
-	const struct irq_domain *d =3D dev_get_msi_domain(&dev->dev);
-	const struct msi_domain_info *info =3D d->host_data;
 	int ret, tsize;
 	u16 control;
=20
@@ -747,7 +741,7 @@ static int msix_capability_init(struct p
 	/* Disable INTX */
 	pci_intx_for_msi(dev, 0);
=20
-	if (!(info->flags & MSI_FLAG_NO_MASK)) {
+	if (!pci_msi_domain_supports(dev, MSI_FLAG_NO_MASK, DENY_LEGACY)) {
 		/*
 		 * Ensure that all table entries are masked to prevent
 		 * stale entries from firing in a crash kernel.

