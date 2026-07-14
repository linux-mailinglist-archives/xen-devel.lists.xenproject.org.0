Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k+jIAv+PVmoq9QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 21:37:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 747FA758587
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 21:37:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=l38MNjwH;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="Rydzk/W0";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=mailbox.org
Received: from list by lists.xenproject.org with outflank-mailman.1362534.1614365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjiwX-00071n-7r; Tue, 14 Jul 2026 19:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362534.1614365; Tue, 14 Jul 2026 19:37:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjiwX-0006yl-2y; Tue, 14 Jul 2026 19:37:25 +0000
Received: by outflank-mailman (input) for mailman id 1362534;
 Tue, 14 Jul 2026 19:37:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mhi@mailbox.org>) id 1wjiwW-0006yb-0I
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 19:37:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjiwV-001xxt-DV
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 21:37:23 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mhi@mailbox.org>)
 id 6a568fde-2eae-0a2a0a5409dd-0a2a450293a0-24
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 21:37:23 +0200
Received: from [80.241.56.152] (helo=mout-p-102.mailbox.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mhi@mailbox.org>)
 id 6a568ff2-6ca4-0a2a45020019-50f13898bac2-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 21:37:23 +0200
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4h08hf0vzjzKvvW;
 Tue, 14 Jul 2026 21:37:22 +0200 (CEST)
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
	t=1784057842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1ofGv+oKh8MyF1GowqA3GVjMzH+NCBy1xlrefUGXfXA=;
	b=l38MNjwHNIXQw+IdCfCjpNmNOE6iwLP1EIQSJydvHsSB32t8oXLtohOvMheWXJQTDgWrTM
	dhT/qSdJlimtS/fXtocrDdL09IimEYDwOekOe3FvJJK1myIDVjnxZdvuRjjUxsvIvIyxJJ
	P8S/jQiP71t1McDfgTRE3se2r0kto8idFFK76R/sgB9YyTGKUJq+ysv3kIh8X2t09RPXNo
	KNuPlIIeCtzq9b/aDO7kUD7hQQS1GsnovVnxmqmoqlYox8JcQt1DOQQ/riX+587IXyoZ9J
	5sKnA69mo9SOQBejaH769bs0/2hXu5owEqaYTBr+DLStH5nj8fThuPJiEJIAwg==
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784057839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1ofGv+oKh8MyF1GowqA3GVjMzH+NCBy1xlrefUGXfXA=;
	b=Rydzk/W0Z4j2MguB5wokh/xcqWxhRbvqP43zwVBnsTqYdoI4IQ/Ip5O40KK40ahZ9B5AG6
	VnQ+Pp2On89Y7tcKWSMns1mM1vp3gMYdKaxs75NfmSba7sBtLoryZJ9tnjB8XBC2aCeUxN
	oxA96PKMpHCdTBi5HFfxu0jts/RMIcb9l6oRdtEfJNr0+ScV9YEuJV7siqyIjyWpFRtmam
	Ltzo28IlG87hsEJLdUKLDqKk22uCwOGm0e1ZQOEdME5jpEYiNwyQSYcwTc6j8uh+KhInH1
	VZL+/3uE/Mw4bPdXTt7T0tkjAYK2yPwvmHgxDXmd9LbMyMSk94YGudnC0BBcag==
Date: Tue, 14 Jul 2026 21:37:07 +0200
Subject: [PATCH v2] PCI: Move pci_dev->is_busmaster into priv_flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-pci-dev-flags-v2-1-a1d7dc441cf3@mailbox.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0JmbU2nGEVX3sOwoGUGxiAlLTYYw
 t0FXLt8yfvvzxApCEW4ZTMEShLF9yuYQwaurfqGlNQrg9HmrC+IanCiakqKu6qJiq11fGK+6hx
 h3QyBWKa99yh/HN/2SW7cIpvRShx9+OyHCTfvXzuh0sqwY1MgYl64+6uSzvrp6EMD5bIsXw96r
 fO+AAAA
X-Change-ID: 20260711-pci-dev-flags-fbbcf4ff9031
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
 linux-edac@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
 Maurice Hieronymus <mhi@mailbox.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784057829; l=10454;
 i=mhi@mailbox.org; s=20260525; h=from:subject:message-id;
 bh=xBOoNzC2az2lrduUXWCw8GbXb6mhhjAQddgJX/fDBOw=;
 b=4+prDaflj4wBbkWdcxfavA+uc+hzT/kyE5OcCNRPkK14v+dxy7EJjAGfiN7o8em2XEEKFXpfw
 tO93TG255CCC5aYokkkMhcUDOQcJUGHv+ot3z2MNFGJx4ql5IABb7od
X-Developer-Key: i=mhi@mailbox.org; a=ed25519;
 pk=AHlEkGG3hpXZHntlEzF42Ip/LFyXWOgsNUvaHqAnV80=
X-MBO-RS-ID: f796c9162f0b3641499
X-MBO-RS-META: rbw1s4zsxsh9gxnsw3z5ahik7gopwsow
X-purgate-ID: tlsNG-720697/1784057843-F10A02AC-581AA5E8/0/0
X-purgate-type: clean
X-purgate-size: 10456
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:from_mime,mailbox.org:mid,mailbox.org:email,mailbox.org:dkim,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ecree.xilinx@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:bhelgaas@google.com,m:justin.tee@broadcom.com,m:paul.ely@broadcom.com,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:bp@alien8.de,m:tony.luck@intel.com,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-net-drivers@amd.com,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-edac@vger.kernel.org,m:lukas@wunner.de,m:mhi@mailbox.org,m:ecreexilinx@gmail.com,m:andrew@l
 unn.ch,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,broadcom.com,HansenPartnership.com,oracle.com,suse.com,epam.com,garyguo.net,protonmail.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,alien8.de,intel.com];
	FORGED_SENDER(0.00)[mhi@mailbox.org,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[39];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhi@mailbox.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 747FA758587

`is_busmaster` is one bit of a ~60-bit C bitfield in `struct pci_dev`.
Bits sharing a bitfield word must not be modified concurrently, but its
writers take no common lock: `pci_set_master()` can run without the
device lock (e.g. from runtime PM resume paths), `pci_disable_device()`
clears the bit, and other bits in the same word are written from
entirely different contexts, e.g. `broken_parity_status` from sysfs.
Concurrent read-modify-write cycles of the shared word can then lose
updates.

Move `is_busmaster` into the existing `priv_flags` bitmap, which is
modified with atomic bitops. The bit definition stays private to
drivers/pci; xen-pciback, lpfc and sfc access the flag through the new
exported accessors `pci_dev_is_busmaster()` and
`pci_dev_assign_busmaster()`.

This also unblocks the Rust device enabling API rework [1], where a
guard object calls `pci_disable_device()` from contexts that may run
concurrently with `pci_set_master()`.

Link: https://lore.kernel.org/rust-for-linux/DJOEYVBS17MJ.1YD3TNGQBWHNK@kernel.org/ [1]
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Suggested-by: Lukas Wunner <lukas@wunner.de>
Cc: rust-for-linux@vger.kernel.org
Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
---
`struct pci_dev` keeps ~60 flags in one C bitfield. Bits sharing a
word must not be modified concurrently, but several writers take no
common lock: `pci_set_master()` writes `is_busmaster` and can run
without the device lock (e.g. runtime PM resume paths),
`pci_disable_device()` clears it, and `broken_parity_status_store()`
writes the same word from sysfs at any time without any lock.

Move `is_busmaster` into the existing `priv_flags` bitmap, which is
modified with atomic bitops. The bit definition stays private to
drivers/pci; the drivers that use the flag (xen-pciback, lpfc, sfc)
access it through new exported accessor functions.

This is a prerequisite for the Rust device enabling API rework [1]:
the guard object planned there calls `pci_disable_device()` from
contexts that may run concurrently with `pci_set_master()`.
---
Changes in v2:
- Move the bit into the existing priv_flags bitmap instead of adding a
  new public flags bitmap (Lukas). The bit definition stays private to
  drivers/pci; outside users go through new exported accessors.
- Drop the broken_parity_status conversion (Lukas).
- Link to v1: https://lore.kernel.org/r/20260711-pci-dev-flags-v1-0-2fcf2811138c@mailbox.org
---
 drivers/net/ethernet/sfc/falcon/farch.c     |  2 +-
 drivers/net/ethernet/sfc/siena/farch.c      |  2 +-
 drivers/pci/pci-driver.c                    |  2 +-
 drivers/pci/pci.c                           | 33 ++++++++++++++++++++++++++---
 drivers/pci/pci.h                           |  1 +
 drivers/scsi/lpfc/lpfc_init.c               |  4 ++--
 drivers/xen/xen-pciback/conf_space_header.c |  4 ++--
 drivers/xen/xen-pciback/pciback_ops.c       |  4 ++--
 include/linux/pci.h                         |  3 ++-
 9 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/sfc/falcon/farch.c b/drivers/net/ethernet/sfc/falcon/farch.c
index 23d507a3820d..c73db6081190 100644
--- a/drivers/net/ethernet/sfc/falcon/farch.c
+++ b/drivers/net/ethernet/sfc/falcon/farch.c
@@ -724,7 +724,7 @@ int ef4_farch_fini_dmaq(struct ef4_nic *efx)
 	/* Do not attempt to write to the NIC during EEH recovery */
 	if (efx->state != STATE_RECOVERY) {
 		/* Only perform flush if DMA is enabled */
-		if (efx->pci_dev->is_busmaster) {
+		if (pci_dev_is_busmaster(efx->pci_dev)) {
 			efx->type->prepare_flush(efx);
 			rc = ef4_farch_do_flush(efx);
 			efx->type->finish_flush(efx);
diff --git a/drivers/net/ethernet/sfc/siena/farch.c b/drivers/net/ethernet/sfc/siena/farch.c
index 7613d7988894..815487b1b227 100644
--- a/drivers/net/ethernet/sfc/siena/farch.c
+++ b/drivers/net/ethernet/sfc/siena/farch.c
@@ -723,7 +723,7 @@ int efx_farch_fini_dmaq(struct efx_nic *efx)
 	/* Do not attempt to write to the NIC during EEH recovery */
 	if (efx->state != STATE_RECOVERY) {
 		/* Only perform flush if DMA is enabled */
-		if (efx->pci_dev->is_busmaster) {
+		if (pci_dev_is_busmaster(efx->pci_dev)) {
 			efx->type->prepare_flush(efx);
 			rc = efx_farch_do_flush(efx);
 			efx->type->finish_flush(efx);
diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index f36778e62ac1..f3b2255258df 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -649,7 +649,7 @@ static int pci_pm_reenable_device(struct pci_dev *pci_dev)
 	 * if the device was busmaster before the suspend, make it busmaster
 	 * again
 	 */
-	if (pci_dev->is_busmaster)
+	if (pci_dev_is_busmaster(pci_dev))
 		pci_set_master(pci_dev);
 
 	return retval;
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 77b17b13ee61..80c962811737 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -2045,7 +2045,7 @@ static void pci_enable_bridge(struct pci_dev *dev)
 		pci_enable_bridge(bridge);
 
 	if (pci_is_enabled(dev)) {
-		if (!dev->is_busmaster)
+		if (!pci_dev_is_busmaster(dev))
 			pci_set_master(dev);
 		return;
 	}
@@ -2205,7 +2205,7 @@ void pci_disable_device(struct pci_dev *dev)
 
 	do_pci_disable_device(dev);
 
-	dev->is_busmaster = 0;
+	pci_dev_assign_busmaster(dev, false);
 }
 EXPORT_SYMBOL(pci_disable_device);
 
@@ -4106,6 +4106,33 @@ void pci_unmap_iospace(struct resource *res)
 }
 EXPORT_SYMBOL(pci_unmap_iospace);
 
+/**
+ * pci_dev_is_busmaster - Query the bus mastering bookkeeping flag
+ * @pdev: the PCI device to query
+ *
+ * Returns: the current value of the bookkeeping flag; the PCI_COMMAND
+ * register is not consulted.
+ */
+bool pci_dev_is_busmaster(const struct pci_dev *pdev)
+{
+	return test_bit(PCI_DEV_BUSMASTER, &pdev->priv_flags);
+}
+EXPORT_SYMBOL(pci_dev_is_busmaster);
+
+/**
+ * pci_dev_assign_busmaster - Set the bus mastering bookkeeping flag
+ * @pdev: the PCI device
+ * @busmaster: new flag value
+ *
+ * Only updates the bookkeeping flag; the PCI_COMMAND register is left
+ * untouched.
+ */
+void pci_dev_assign_busmaster(struct pci_dev *pdev, bool busmaster)
+{
+	assign_bit(PCI_DEV_BUSMASTER, &pdev->priv_flags, busmaster);
+}
+EXPORT_SYMBOL(pci_dev_assign_busmaster);
+
 static void __pci_set_master(struct pci_dev *dev, bool enable)
 {
 	u16 old_cmd, cmd;
@@ -4120,7 +4147,7 @@ static void __pci_set_master(struct pci_dev *dev, bool enable)
 			enable ? "enabling" : "disabling");
 		pci_write_config_word(dev, PCI_COMMAND, cmd);
 	}
-	dev->is_busmaster = enable;
+	pci_dev_assign_busmaster(dev, enable);
 }
 
 /**
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 4469e1a77f3c..faa4a676e62c 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -773,6 +773,7 @@ static inline int pci_dev_set_disconnected(struct pci_dev *dev, void *unused)
 #define PCI_LINK_CHANGING 5
 #define PCI_LINK_LBMS_SEEN	6
 #define PCI_DEV_ALLOW_BINDING 7
+#define PCI_DEV_BUSMASTER 8
 
 static inline void pci_dev_assign_added(struct pci_dev *dev)
 {
diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
index 82af59c913e9..657453e6d7d2 100644
--- a/drivers/scsi/lpfc/lpfc_init.c
+++ b/drivers/scsi/lpfc/lpfc_init.c
@@ -14398,7 +14398,7 @@ lpfc_io_slot_reset_s3(struct pci_dev *pdev)
 
 	pci_restore_state(pdev);
 
-	if (pdev->is_busmaster)
+	if (pci_dev_is_busmaster(pdev))
 		pci_set_master(pdev);
 
 	spin_lock_irq(&phba->hbalock);
@@ -15251,7 +15251,7 @@ lpfc_io_slot_reset_s4(struct pci_dev *pdev)
 	 */
 	pci_save_state(pdev);
 
-	if (pdev->is_busmaster)
+	if (pci_dev_is_busmaster(pdev))
 		pci_set_master(pdev);
 
 	spin_lock_irq(&phba->hbalock);
diff --git a/drivers/xen/xen-pciback/conf_space_header.c b/drivers/xen/xen-pciback/conf_space_header.c
index 8b50cbcbdfe1..ecc9adba369c 100644
--- a/drivers/xen/xen-pciback/conf_space_header.c
+++ b/drivers/xen/xen-pciback/conf_space_header.c
@@ -81,10 +81,10 @@ static int command_write(struct pci_dev *dev, int offset, u16 value, void *data)
 			dev_data->enable_intx = 0;
 	}
 
-	if (!dev->is_busmaster && is_master_cmd(value)) {
+	if (!pci_dev_is_busmaster(dev) && is_master_cmd(value)) {
 		dev_dbg(&dev->dev, "set bus master\n");
 		pci_set_master(dev);
-	} else if (dev->is_busmaster && !is_master_cmd(value)) {
+	} else if (pci_dev_is_busmaster(dev) && !is_master_cmd(value)) {
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
index 64b308b6e61c..0542221ad996 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -461,7 +461,6 @@ struct pci_dev {
 	unsigned int	pref_64_window:1;	/* Pref mem window is 64-bit */
 	unsigned int	multifunction:1;	/* Multi-function device */
 
-	unsigned int	is_busmaster:1;		/* Is busmaster */
 	unsigned int	no_msi:1;		/* May not use MSI */
 	unsigned int	block_cfg_access:1;	/* Config space access blocked */
 	unsigned int	broken_parity_status:1;	/* Generates false positive parity */
@@ -1446,6 +1445,8 @@ void pci_disable_device(struct pci_dev *dev);
 extern unsigned int pcibios_max_latency;
 void pci_set_master(struct pci_dev *dev);
 void pci_clear_master(struct pci_dev *dev);
+bool pci_dev_is_busmaster(const struct pci_dev *pdev);
+void pci_dev_assign_busmaster(struct pci_dev *pdev, bool busmaster);
 
 int pci_set_pcie_reset_state(struct pci_dev *dev, enum pcie_reset_state state);
 int pci_set_cacheline_size(struct pci_dev *dev);

---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260711-pci-dev-flags-fbbcf4ff9031

Best regards,
-- 
Maurice Hieronymus <mhi@mailbox.org>


