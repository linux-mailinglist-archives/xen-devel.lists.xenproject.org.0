Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8/YMEfyMUmpBQwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jul 2026 20:35:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ABE742810
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jul 2026 20:35:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="ksoqK/zj";
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Y9yDTbzU;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1360381.1613366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wicXP-0002cR-DT; Sat, 11 Jul 2026 18:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1360381.1613366; Sat, 11 Jul 2026 18:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wicXP-0002Yu-8f; Sat, 11 Jul 2026 18:34:55 +0000
Received: by outflank-mailman (input) for mailman id 1360381;
 Sat, 11 Jul 2026 15:21:43 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mhi@mailbox.org>) id 1wiZWR-0001Hc-Hv
 for xen-devel@lists.xenproject.org; Sat, 11 Jul 2026 15:21:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiZWQ-0094fa-V6
 for xen-devel@lists.xenproject.org; Sat, 11 Jul 2026 17:21:42 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mhi@mailbox.org>)
 id 6a525f4c-5cb7-0a2a0a5109dd-0a2a4504d3c0-10
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2026 17:21:42 +0200
Received: from [80.241.56.172] (helo=mout-p-202.mailbox.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <mhi@mailbox.org>)
 id 6a525f86-b1e5-0a2a45040019-50f138acc4a2-3
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2026 17:21:42 +0200
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gyC9208hBzMlFY;
 Sat, 11 Jul 2026 17:21:42 +0200 (CEST)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783783302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5zGD2166erzzmBrOUSjlgc7V6NcBK4nb2itQnBTjxms=;
	b=ksoqK/zj+BidOqeAJJ7EKT02ziVUZdAZpUvhJMwQtSmRWjSq9Enio2FtjUZVXyDQeKcPS9
	tz3EEt5kqcm2UE7WJdYDM3b+KpBAVSFgo0g3D5mBCTAgfgfn5uP25Y5c2Om8YP0zHfM12z
	cTtb5RUpNqORLbagExvL5rRh5ClAY9dGm+PNTYbSKo32vko5Z12zm2a9Smho1qpekhzHJP
	uzV29wf7UQtMAkvXzHuC0UQ1Fhw09TFGSpBly6QMQVskI/ENe8Tf4ouU54ZEFFTBXOU5Wb
	dU/uMxvi3O5dII+fFRTJDMNJ6tw022Ppk5aZ0NZNabs/Rxu2ksDW/Y48+ev3Ew==
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783783300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5zGD2166erzzmBrOUSjlgc7V6NcBK4nb2itQnBTjxms=;
	b=Y9yDTbzUH5iQ+rWrMO26z0OIS3g+EqRjCkPCiekugHNCtM7hSviYHk68Cm/Xegt23h7q78
	WyQla1TBoqMmPXMPzpLAKJF1spAjJXMQ7ucmmcjPMC+tglQFyfu8TAEBTLKANlbEyyZNse
	xVN5Xf0BaS7yqkcpaFBbqTghqEybETOdS+VFYqsaZNrGvG06kQVhEK0pyytE3pStJkBp3r
	yYH8zCv/wVf3PmL5YByhmUTOpaKMZGZYEBodK+ddHvtw+rHGcLgXRyfBX/cMV4ZB3CE9Nl
	oVA1frLCK+jSksHMfitUChWECby6KcNDEFsVc/6uJaCeoPpBH16kWBQ82HjtTA==
Date: Sat, 11 Jul 2026 17:21:07 +0200
Subject: [PATCH 2/2] PCI: Replace pci_dev->broken_parity_status with
 accessors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-pci-dev-flags-v1-2-2fcf2811138c@mailbox.org>
References: <20260711-pci-dev-flags-v1-0-2fcf2811138c@mailbox.org>
In-Reply-To: <20260711-pci-dev-flags-v1-0-2fcf2811138c@mailbox.org>
To: Edward Cree <ecree.xilinx@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Justin Tee <justin.tee@broadcom.com>, 
 Paul Ely <paul.ely@broadcom.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
Cc: Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
 netdev@vger.kernel.org, linux-net-drivers@amd.com, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org, 
 linux-edac@vger.kernel.org, Maurice Hieronymus <mhi@mailbox.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783783272; l=3918;
 i=mhi@mailbox.org; s=20260525; h=from:subject:message-id;
 bh=dA+p/e0yU5GmI2+843t83Ws3vAPk7ZHcyx+dI89Sz1U=;
 b=2KUtaRPN52gN+DrVoSi0Gx1KvBexgp3rJLmXihe43P4Nxd7ql/LG0mNOPKmJYGQTEluKIkZ/a
 e0xF1urLLB7BZdfXCqB9rBoVHA+cFHOIyMacXK65ieb1QbtT7PbaILy
X-Developer-Key: i=mhi@mailbox.org; a=ed25519;
 pk=AHlEkGG3hpXZHntlEzF42Ip/LFyXWOgsNUvaHqAnV80=
X-MBO-RS-ID: c995304cfe7236ecf3e
X-MBO-RS-META: kw8gscg45gpin8zawfowe9q3as1dmn7e
X-purgate-ID: tlsNG-ebf023/1783783302-7E251FE7-D1A7398A/0/0
X-purgate-type: clean
X-purgate-size: 3920
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ecree.xilinx@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:bhelgaas@google.com,m:justin.tee@broadcom.com,m:paul.ely@broadcom.com,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:bp@alien8.de,m:tony.luck@intel.com,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-net-drivers@amd.com,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-edac@vger.kernel.org,m:mhi@mailbox.org,m:ecreexilinx@gmail.com,m:andrew@lunn.ch,s:lists@lfd
 r.de];
	FORWARDED(0.00)[mailman];
	FREEMAIL_TO(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,broadcom.com,HansenPartnership.com,oracle.com,suse.com,epam.com,garyguo.net,protonmail.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,alien8.de,intel.com];
	FORGED_SENDER(0.00)[mhi@mailbox.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[mhi@mailbox.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel,netdev];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1ABE742810

`broken_parity_status` shares a C bitfield word in `struct pci_dev`
with many other bits. `broken_parity_status_store()` writes it from
sysfs at any time without taking any lock, so userspace can make it
race with every other writer of the same word, e.g. `pci_set_master()`
from a runtime PM resume path, and updates of neighboring bits can be
lost.

Move the bit into the `flags` bitmap modified with atomic bitops,
using the accessor pattern introduced by the previous commit.

Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
---
 drivers/edac/edac_pci_sysfs.c | 4 ++--
 drivers/pci/pci-sysfs.c       | 4 ++--
 include/linux/pci.h           | 5 ++++-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/edac/edac_pci_sysfs.c b/drivers/edac/edac_pci_sysfs.c
index 9f437f648e4e..fadc61235f1f 100644
--- a/drivers/edac/edac_pci_sysfs.c
+++ b/drivers/edac/edac_pci_sysfs.c
@@ -554,7 +554,7 @@ static void edac_pci_dev_parity_test(struct pci_dev *dev)
 	/* check the status reg for errors on boards NOT marked as broken
 	 * if broken, we cannot trust any of the status bits
 	 */
-	if (status && !dev->broken_parity_status) {
+	if (status && !pci_dev_broken_parity_status(dev)) {
 		if (status & (PCI_STATUS_SIG_SYSTEM_ERROR)) {
 			edac_printk(KERN_CRIT, EDAC_PCI,
 				"Signaled System Error on %s\n",
@@ -593,7 +593,7 @@ static void edac_pci_dev_parity_test(struct pci_dev *dev)
 		/* check the secondary status reg for errors,
 		 * on NOT broken boards
 		 */
-		if (status && !dev->broken_parity_status) {
+		if (status && !pci_dev_broken_parity_status(dev)) {
 			if (status & (PCI_STATUS_SIG_SYSTEM_ERROR)) {
 				edac_printk(KERN_CRIT, EDAC_PCI, "Bridge "
 					"Signaled System Error on %s\n",
diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 5ec0b245a69b..5e094d1e23e3 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -80,7 +80,7 @@ static ssize_t broken_parity_status_show(struct device *dev,
 					 char *buf)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
-	return sysfs_emit(buf, "%u\n", pdev->broken_parity_status);
+	return sysfs_emit(buf, "%u\n", pci_dev_broken_parity_status(pdev));
 }
 
 static ssize_t broken_parity_status_store(struct device *dev,
@@ -93,7 +93,7 @@ static ssize_t broken_parity_status_store(struct device *dev,
 	if (kstrtoul(buf, 0, &val) < 0)
 		return -EINVAL;
 
-	pdev->broken_parity_status = !!val;
+	pci_dev_assign_broken_parity_status(pdev, val);
 
 	return count;
 }
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 9964646bdd46..fdcd9b1b7371 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -347,10 +347,13 @@ struct rcec_ea;
  *		bookkeeping state, maintained by pci_set_master(),
  *		pci_clear_master() and pci_disable_device(); modifying it
  *		does not itself change the hardware state.
+ * @PCI_DEV_FLAG_BROKEN_PARITY_STATUS: Device generates false positive
+ *		parity errors; set via sysfs.
  * @PCI_DEV_FLAG_COUNT: Number of defined struct_pci_dev_flags.
  */
 enum struct_pci_dev_flags {
 	PCI_DEV_FLAG_BUSMASTER = 0,
+	PCI_DEV_FLAG_BROKEN_PARITY_STATUS = 1,
 
 	PCI_DEV_FLAG_COUNT
 };
@@ -482,7 +485,6 @@ struct pci_dev {
 
 	unsigned int	no_msi:1;		/* May not use MSI */
 	unsigned int	block_cfg_access:1;	/* Config space access blocked */
-	unsigned int	broken_parity_status:1;	/* Generates false positive parity */
 	unsigned int	irq_reroute_variant:2;	/* Needs IRQ rerouting variant */
 	unsigned int	msi_enabled:1;
 	unsigned int	msix_enabled:1;
@@ -626,6 +628,7 @@ static inline void pci_dev_assign_##accessor_name(struct pci_dev *pdev, bool val
 }
 
 __create_pci_dev_flag_accessors(busmaster, PCI_DEV_FLAG_BUSMASTER);
+__create_pci_dev_flag_accessors(broken_parity_status, PCI_DEV_FLAG_BROKEN_PARITY_STATUS);
 
 #undef __create_pci_dev_flag_accessors
 

-- 
2.51.2


