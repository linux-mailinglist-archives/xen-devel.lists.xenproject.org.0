Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G7FKKfyMUmpCQwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jul 2026 20:35:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3359D742811
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jul 2026 20:35:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=vNC6Nr8Q;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="adq2ry/u";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1360379.1613361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wicXP-0002Yr-4f; Sat, 11 Jul 2026 18:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1360379.1613361; Sat, 11 Jul 2026 18:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wicXP-0002Su-1k; Sat, 11 Jul 2026 18:34:55 +0000
Received: by outflank-mailman (input) for mailman id 1360379;
 Sat, 11 Jul 2026 15:21:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mhi@mailbox.org>) id 1wiZWJ-0001H6-Cs
 for xen-devel@lists.xenproject.org; Sat, 11 Jul 2026 15:21:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiZWI-0094fa-IL
 for xen-devel@lists.xenproject.org; Sat, 11 Jul 2026 17:21:34 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mhi@mailbox.org>)
 id 6a525f33-5cb7-0a2a0a5109dd-0a2a4505dcdc-32
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2026 17:21:34 +0200
Received: from [80.241.56.171] (helo=mout-p-201.mailbox.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <mhi@mailbox.org>)
 id 6a525f7e-4f1d-0a2a45050019-50f138ab8648-3
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2026 17:21:34 +0200
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gyC8s58czzMlFw;
 Sat, 11 Jul 2026 17:21:33 +0200 (CEST)
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
	t=1783783293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+/l7Xlwgc32SRo4MSsc6Qw/JiVZgPEEXCYL8AXhdB7g=;
	b=vNC6Nr8Qu+GAEZlEV//+bczXk5JjcPJWznDQiXnBFy48QVgQnoKKU6G0BwyiTsYd/cPzSl
	N2fsc9kmUUDjl/F7JMWNChYNPd4h5ors5BL8n/kDs55QGNLeWi60GgMVxZ/6+DxBfn1KHH
	Nx+FJq10I7wAfD/bMZtaoOh3BRX4DQLdw04vhMvksj+2ZAsK08ACiXzlu0H0FXVrPufl9o
	MeAuDi6b2W2KdZsjNaeYhaIsJ/jq+thJaE5aUXQXpl1JhtAI1MeKVnSYZH390u27CdSlot
	J+on4CbeW+nJOgukoXg8+k8/kAJu1gluMBR7muSIAkpAmsPpyiuEpaeqTs0cgw==
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783783291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+/l7Xlwgc32SRo4MSsc6Qw/JiVZgPEEXCYL8AXhdB7g=;
	b=adq2ry/uVyggAKv2tF+LozCCQKi72ZDJ5hkkep0oXTPNmMLzUhP2jR2qG1EoapxFVvxXAo
	Pn4WlzKfzjyGrEzeCbit25hbfaoOumavShFYHsb7YpfugGHtxo6IaohAuw5EuEPvoI/fWk
	+El95ldUl99KQu8xxoOMq2VGA/oNSgfncQ5f8/1LGzdO+oGTr9Eh/jgBukgFifgxOmK63v
	nzXEOCH2MmsrNekjdoef+T9BwPg1lQe4fyVzSCHLwIjQaKvhTYNvEYMZhK01GxfKVKiy3E
	9R1HoWfC+Mj3jMe7irk53eANjShhgTjnn/VRyReCnFnEQdYUhYEKkBDp9oLZUg==
Date: Sat, 11 Jul 2026 17:21:06 +0200
Subject: [PATCH 1/2] PCI: Replace pci_dev->is_busmaster with accessors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-pci-dev-flags-v1-1-2fcf2811138c@mailbox.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783783272; l=8697;
 i=mhi@mailbox.org; s=20260525; h=from:subject:message-id;
 bh=UvTBMgm38RY8zEXs2NATRQuun95jyORW9mMSNxmV5FA=;
 b=pQSZj8wz+D4fY0P5+pOyu6Es4y8tnTZt88mjrg56g8MYWNwlgOVIFy3c+5QCEWgww49IBV8hS
 52acPwOKzvHB3t4voqsaavWiw/3UmrRwsmlYpGKuMcaEd6RHjAKdJJ5
X-Developer-Key: i=mhi@mailbox.org; a=ed25519;
 pk=AHlEkGG3hpXZHntlEzF42Ip/LFyXWOgsNUvaHqAnV80=
X-MBO-RS-META: er15gbymiuy8xweyxi8sy8tna1xynnrb
X-MBO-RS-ID: 4dfa2ffa0a7b52f860d
X-purgate-ID: tlsNG-c201ff/1783783294-DB34312E-A865C18A/0/0
X-purgate-type: clean
X-purgate-size: 8699
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
X-Rspamd-Queue-Id: 3359D742811

`is_busmaster` is one bit of a ~60-bit C bitfield in `struct pci_dev`.
Bits sharing a bitfield word must not be modified concurrently, but its
writers take no common lock: `pci_set_master()` can run without the
device lock (e.g. from runtime PM resume paths), `pci_disable_device()`
clears the bit, and other bits in the same word are written from
entirely different contexts, e.g. `broken_parity_status` from sysfs.
Concurrent read-modify-write cycles of the shared word can then lose
updates.

Move `is_busmaster` into a new `flags` bitmap modified with atomic
bitops and accessed through generated accessor functions, following the
example of commit a7cc262a1135 ("driver core: Replace dev->offline +
->offline_disabled with accessors"). More bitfield flags can follow the
same pattern later.

This also unblocks the Rust device enabling API rework [1], where a
guard object calls `pci_disable_device()` from contexts that may run
concurrently with `pci_set_master()`.

Link: https://lore.kernel.org/rust-for-linux/DJOEYVBS17MJ.1YD3TNGQBWHNK@kernel.org/ [1]
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org
Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
---
 drivers/net/ethernet/sfc/falcon/farch.c     |  2 +-
 drivers/net/ethernet/sfc/siena/farch.c      |  2 +-
 drivers/pci/pci-driver.c                    |  2 +-
 drivers/pci/pci.c                           |  6 ++---
 drivers/scsi/lpfc/lpfc_init.c               |  4 ++--
 drivers/xen/xen-pciback/conf_space_header.c |  4 ++--
 drivers/xen/xen-pciback/pciback_ops.c       |  4 ++--
 include/linux/pci.h                         | 37 ++++++++++++++++++++++++++++-
 8 files changed, 48 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/sfc/falcon/farch.c b/drivers/net/ethernet/sfc/falcon/farch.c
index 23d507a3820d..42594bd7e818 100644
--- a/drivers/net/ethernet/sfc/falcon/farch.c
+++ b/drivers/net/ethernet/sfc/falcon/farch.c
@@ -724,7 +724,7 @@ int ef4_farch_fini_dmaq(struct ef4_nic *efx)
 	/* Do not attempt to write to the NIC during EEH recovery */
 	if (efx->state != STATE_RECOVERY) {
 		/* Only perform flush if DMA is enabled */
-		if (efx->pci_dev->is_busmaster) {
+		if (pci_dev_busmaster(efx->pci_dev)) {
 			efx->type->prepare_flush(efx);
 			rc = ef4_farch_do_flush(efx);
 			efx->type->finish_flush(efx);
diff --git a/drivers/net/ethernet/sfc/siena/farch.c b/drivers/net/ethernet/sfc/siena/farch.c
index 7613d7988894..f673af4c77b6 100644
--- a/drivers/net/ethernet/sfc/siena/farch.c
+++ b/drivers/net/ethernet/sfc/siena/farch.c
@@ -723,7 +723,7 @@ int efx_farch_fini_dmaq(struct efx_nic *efx)
 	/* Do not attempt to write to the NIC during EEH recovery */
 	if (efx->state != STATE_RECOVERY) {
 		/* Only perform flush if DMA is enabled */
-		if (efx->pci_dev->is_busmaster) {
+		if (pci_dev_busmaster(efx->pci_dev)) {
 			efx->type->prepare_flush(efx);
 			rc = efx_farch_do_flush(efx);
 			efx->type->finish_flush(efx);
diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index f36778e62ac1..412afa12a285 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -649,7 +649,7 @@ static int pci_pm_reenable_device(struct pci_dev *pci_dev)
 	 * if the device was busmaster before the suspend, make it busmaster
 	 * again
 	 */
-	if (pci_dev->is_busmaster)
+	if (pci_dev_busmaster(pci_dev))
 		pci_set_master(pci_dev);
 
 	return retval;
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 77b17b13ee61..c4fd6fe6098d 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -2045,7 +2045,7 @@ static void pci_enable_bridge(struct pci_dev *dev)
 		pci_enable_bridge(bridge);
 
 	if (pci_is_enabled(dev)) {
-		if (!dev->is_busmaster)
+		if (!pci_dev_busmaster(dev))
 			pci_set_master(dev);
 		return;
 	}
@@ -2205,7 +2205,7 @@ void pci_disable_device(struct pci_dev *dev)
 
 	do_pci_disable_device(dev);
 
-	dev->is_busmaster = 0;
+	pci_dev_assign_busmaster(dev, false);
 }
 EXPORT_SYMBOL(pci_disable_device);
 
@@ -4120,7 +4120,7 @@ static void __pci_set_master(struct pci_dev *dev, bool enable)
 			enable ? "enabling" : "disabling");
 		pci_write_config_word(dev, PCI_COMMAND, cmd);
 	}
-	dev->is_busmaster = enable;
+	pci_dev_assign_busmaster(dev, enable);
 }
 
 /**
diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
index 82af59c913e9..08dc06e7dfc2 100644
--- a/drivers/scsi/lpfc/lpfc_init.c
+++ b/drivers/scsi/lpfc/lpfc_init.c
@@ -14398,7 +14398,7 @@ lpfc_io_slot_reset_s3(struct pci_dev *pdev)
 
 	pci_restore_state(pdev);
 
-	if (pdev->is_busmaster)
+	if (pci_dev_busmaster(pdev))
 		pci_set_master(pdev);
 
 	spin_lock_irq(&phba->hbalock);
@@ -15251,7 +15251,7 @@ lpfc_io_slot_reset_s4(struct pci_dev *pdev)
 	 */
 	pci_save_state(pdev);
 
-	if (pdev->is_busmaster)
+	if (pci_dev_busmaster(pdev))
 		pci_set_master(pdev);
 
 	spin_lock_irq(&phba->hbalock);
diff --git a/drivers/xen/xen-pciback/conf_space_header.c b/drivers/xen/xen-pciback/conf_space_header.c
index 8b50cbcbdfe1..59a89f915916 100644
--- a/drivers/xen/xen-pciback/conf_space_header.c
+++ b/drivers/xen/xen-pciback/conf_space_header.c
@@ -81,10 +81,10 @@ static int command_write(struct pci_dev *dev, int offset, u16 value, void *data)
 			dev_data->enable_intx = 0;
 	}
 
-	if (!dev->is_busmaster && is_master_cmd(value)) {
+	if (!pci_dev_busmaster(dev) && is_master_cmd(value)) {
 		dev_dbg(&dev->dev, "set bus master\n");
 		pci_set_master(dev);
-	} else if (dev->is_busmaster && !is_master_cmd(value)) {
+	} else if (pci_dev_busmaster(dev) && !is_master_cmd(value)) {
 		dev_dbg(&dev->dev, "clear bus master\n");
 		pci_clear_master(dev);
 	}
diff --git a/drivers/xen/xen-pciback/pciback_ops.c b/drivers/xen/xen-pciback/pciback_ops.c
index bfc186bf05bc..01f4705421c9 100644
--- a/drivers/xen/xen-pciback/pciback_ops.c
+++ b/drivers/xen/xen-pciback/pciback_ops.c
@@ -125,14 +125,14 @@ void xen_pcibk_reset_device(struct pci_dev *dev)
 		if (pci_is_enabled(dev))
 			pci_disable_device(dev);
 
-		dev->is_busmaster = 0;
+		pci_dev_assign_busmaster(dev, false);
 	} else {
 		pci_read_config_word(dev, PCI_COMMAND, &cmd);
 		if (cmd & (PCI_COMMAND_INVALIDATE)) {
 			cmd &= ~(PCI_COMMAND_INVALIDATE);
 			pci_write_config_word(dev, PCI_COMMAND, cmd);
 
-			dev->is_busmaster = 0;
+			pci_dev_assign_busmaster(dev, false);
 		}
 	}
 }
diff --git a/include/linux/pci.h b/include/linux/pci.h
index ebb5b9d76360..9964646bdd46 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -336,6 +336,25 @@ struct pci_sriov;
 struct pci_p2pdma;
 struct rcec_ea;
 
+/**
+ * enum struct_pci_dev_flags - Flags in struct pci_dev
+ *
+ * Each flag has a set of accessor functions created via
+ * __create_pci_dev_flag_accessors() and must only be accessed through
+ * them.
+ *
+ * @PCI_DEV_FLAG_BUSMASTER: Bus mastering is enabled on the device. Pure
+ *		bookkeeping state, maintained by pci_set_master(),
+ *		pci_clear_master() and pci_disable_device(); modifying it
+ *		does not itself change the hardware state.
+ * @PCI_DEV_FLAG_COUNT: Number of defined struct_pci_dev_flags.
+ */
+enum struct_pci_dev_flags {
+	PCI_DEV_FLAG_BUSMASTER = 0,
+
+	PCI_DEV_FLAG_COUNT
+};
+
 /* struct pci_dev - describes a PCI device
  *
  * @supported_speeds:	PCIe Supported Link Speeds Vector (+ reserved 0 at
@@ -461,7 +480,6 @@ struct pci_dev {
 	unsigned int	pref_64_window:1;	/* Pref mem window is 64-bit */
 	unsigned int	multifunction:1;	/* Multi-function device */
 
-	unsigned int	is_busmaster:1;		/* Is busmaster */
 	unsigned int	no_msi:1;		/* May not use MSI */
 	unsigned int	block_cfg_access:1;	/* Config space access blocked */
 	unsigned int	broken_parity_status:1;	/* Generates false positive parity */
@@ -592,8 +610,25 @@ struct pci_dev {
 	u8		tph_mode;	/* TPH mode */
 	u8		tph_req_type;	/* TPH requester type */
 #endif
+
+	/* PCI_DEV_FLAG_XXX flags. Use atomic bitfield operations to modify. */
+	DECLARE_BITMAP(flags, PCI_DEV_FLAG_COUNT);
 };
 
+#define __create_pci_dev_flag_accessors(accessor_name, flag_name) \
+static inline bool pci_dev_##accessor_name(const struct pci_dev *pdev) \
+{ \
+	return test_bit(flag_name, pdev->flags); \
+} \
+static inline void pci_dev_assign_##accessor_name(struct pci_dev *pdev, bool value) \
+{ \
+	assign_bit(flag_name, pdev->flags, value); \
+}
+
+__create_pci_dev_flag_accessors(busmaster, PCI_DEV_FLAG_BUSMASTER);
+
+#undef __create_pci_dev_flag_accessors
+
 static inline struct pci_dev *pci_physfn(struct pci_dev *dev)
 {
 #ifdef CONFIG_PCI_IOV

-- 
2.51.2


