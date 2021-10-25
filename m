Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E020F439BFD
	for <lists+xen-devel@lfdr.de>; Mon, 25 Oct 2021 18:47:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215970.375411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf37C-0007jZ-BH; Mon, 25 Oct 2021 16:46:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215970.375411; Mon, 25 Oct 2021 16:46:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf37C-0007gs-7q; Mon, 25 Oct 2021 16:46:26 +0000
Received: by outflank-mailman (input) for mailman id 215970;
 Mon, 25 Oct 2021 16:46:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M4PP=PN=oderland.se=josef@srs-us1.protection.inumbo.net>)
 id 1mf37A-0007gl-Bq
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 16:46:24 +0000
Received: from office.oderland.com (unknown [91.201.60.5])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 158e2060-35b3-11ec-8417-12813bfff9fa;
 Mon, 25 Oct 2021 16:46:22 +0000 (UTC)
Received: from [193.180.18.161] (port=40536 helo=[10.137.0.14])
 by office.oderland.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <josef@oderland.se>)
 id 1mf376-005OVn-VK; Mon, 25 Oct 2021 18:46:20 +0200
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
X-Inumbo-ID: 158e2060-35b3-11ec-8417-12813bfff9fa
Message-ID: <b76373a7-1e1d-3aae-66ba-09221c752c11@oderland.se>
Date: Mon, 25 Oct 2021 18:46:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:93.0) Gecko/20100101
 Thunderbird/93.0
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Juergen Gross <jgross@suse.com>,
 linux-pci@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <90277228-cf14-0cfa-c95e-d42e7d533353@oderland.se>
 <20211025012503.33172-1-jandryuk@gmail.com>
 <CAKf6xptSbuj3VGxzed1uPx59cA_BRJY5FDHczX744rvnTHB8Lg@mail.gmail.com>
From: Josef Johansson <josef@oderland.se>
Subject: Re: [PATCH] PCI/MSI: Fix masking MSI/MSI-X on Xen PV
In-Reply-To: <CAKf6xptSbuj3VGxzed1uPx59cA_BRJY5FDHczX744rvnTHB8Lg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - office.oderland.com
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oderland.se
X-Get-Message-Sender-Via: office.oderland.com: authenticated_id: josjoh@oderland.se
X-Authenticated-Sender: office.oderland.com: josjoh@oderland.se

On 10/25/21 14:27, Jason Andryuk wrote:
> On Sun, Oct 24, 2021 at 9:26 PM Jason Andryuk <jandryuk@gmail.com> wrote:
>> commit fcacdfbef5a1 ("PCI/MSI: Provide a new set of mask and unmask
>> functions") introduce functions pci_msi_update_mask() and
>> pci_msix_write_vector_ctrl() that is missing checks for
>> pci_msi_ignore_mask that exists in commit 446a98b19fd6 ("PCI/MSI: Use
>> new mask/unmask functions").  The checks are in place at the high level
>> __pci_msi_mask_desc()/__pci_msi_unmask_desc(), but some functions call
>> directly to the helpers.
>>
>> Push the pci_msi_ignore_mask check down to the functions that make
>> the actual writes.  This keeps the logic local to the writes that need
>> to be bypassed.
>>
>> With Xen PV, the hypervisor is responsible for masking and unmasking the
>> interrupts, which pci_msi_ignore_mask is used to indicate.
>>
>> This change avoids lockups in amdgpu drivers under Xen during boot.
>>
>> Fixes: commit 446a98b19fd6 ("PCI/MSI: Use new mask/unmask functions")
>> Reported-by: Josef Johansson <josef@oderland.se>
>> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
>> ---
> I should have written that this is untested.  If this is the desired
> approach, Josef should test that it solves his boot hangs.
>
> Regards,
> Jason

I've tested this today, both the above patch, but also my own below
where I'm patching inside __pci_write_msi_msg,
which is the outcome of the patch above.

I found that both solves the boot hang, but both have severe effects
on suspends/resume later on. The below patch without patching
__pci_write_msi_msg seems to be ideal, solves boot problems but not
causing too much others. There seems to me that there's undocumented
dragons here. Doing more test later today.

diff --git a/drivers/pci/msi.c b/drivers/pci/msi.c
index 4b4792940e86..e97eea1bc93a 100644
--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -148,6 +148,9 @@ static noinline void pci_msi_update_mask(struct msi_desc *desc, u32 clear, u32 s
 	raw_spinlock_t *lock = &desc->dev->msi_lock;
 	unsigned long flags;
 
+	if (pci_msi_ignore_mask || desc->msi_attrib.is_virtual)
+		return;
+
 	raw_spin_lock_irqsave(lock, flags);
 	desc->msi_mask &= ~clear;
 	desc->msi_mask |= set;
@@ -186,6 +189,9 @@ static void pci_msix_write_vector_ctrl(struct msi_desc *desc, u32 ctrl)
 
 static inline void pci_msix_mask(struct msi_desc *desc)
 {
+	if (pci_msi_ignore_mask || desc->msi_attrib.is_virtual)
+		return;
+
 	desc->msix_ctrl |= PCI_MSIX_ENTRY_CTRL_MASKBIT;
 	pci_msix_write_vector_ctrl(desc, desc->msix_ctrl);
 	/* Flush write to device */
@@ -194,15 +200,15 @@ static inline void pci_msix_mask(struct msi_desc *desc)
 
 static inline void pci_msix_unmask(struct msi_desc *desc)
 {
+	if (pci_msi_ignore_mask || desc->msi_attrib.is_virtual)
+		return;
+
 	desc->msix_ctrl &= ~PCI_MSIX_ENTRY_CTRL_MASKBIT;
 	pci_msix_write_vector_ctrl(desc, desc->msix_ctrl);
 }
 
 static void __pci_msi_mask_desc(struct msi_desc *desc, u32 mask)
 {
-	if (pci_msi_ignore_mask || desc->msi_attrib.is_virtual)
-		return;
-
 	if (desc->msi_attrib.is_msix)
 		pci_msix_mask(desc);
 	else if (desc->msi_attrib.maskbit)
@@ -211,9 +217,6 @@ static void __pci_msi_mask_desc(struct msi_desc *desc, u32 mask)
 
 static void __pci_msi_unmask_desc(struct msi_desc *desc, u32 mask)
 {
-	if (pci_msi_ignore_mask || desc->msi_attrib.is_virtual)
-		return;
-
 	if (desc->msi_attrib.is_msix)
 		pci_msix_unmask(desc);
 	else if (desc->msi_attrib.maskbit)
@@ -307,7 +310,7 @@ void __pci_write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
 		 * entry while the entry is unmasked, the result is
 		 * undefined."
 		 */
-		if (unmasked)
+		if (unmasked && !pci_msi_ignore_mask)
 			pci_msix_write_vector_ctrl(entry, ctrl | PCI_MSIX_ENTRY_CTRL_MASKBIT);
 
 		writel(msg->address_lo, base + PCI_MSIX_ENTRY_LOWER_ADDR);
@@ -450,8 +453,9 @@ static void __pci_restore_msix_state(struct pci_dev *dev)
 				PCI_MSIX_FLAGS_ENABLE | PCI_MSIX_FLAGS_MASKALL);
 
 	arch_restore_msi_irqs(dev);
-	for_each_pci_msi_entry(entry, dev)
-		pci_msix_write_vector_ctrl(entry, entry->msix_ctrl);
+	if (!(pci_msi_ignore_mask || entry->msi_attrib.is_virtual))
+		for_each_pci_msi_entry(entry, dev)
+			pci_msix_write_vector_ctrl(entry, entry->msix_ctrl);
 
 	pci_msix_clear_and_set_ctrl(dev, PCI_MSIX_FLAGS_MASKALL, 0);
 }


