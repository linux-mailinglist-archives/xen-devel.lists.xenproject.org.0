Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1BFA32FD9
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 20:36:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886730.1296351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiIWA-00086Z-QN; Wed, 12 Feb 2025 19:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886730.1296351; Wed, 12 Feb 2025 19:35:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiIWA-00083c-Mz; Wed, 12 Feb 2025 19:35:30 +0000
Received: by outflank-mailman (input) for mailman id 886730;
 Wed, 12 Feb 2025 19:35:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MJhV=VD=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1tiIW9-00083W-NE
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 19:35:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81667a15-e978-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 20:35:25 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A2D035C61E3;
 Wed, 12 Feb 2025 19:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A419C4CEDF;
 Wed, 12 Feb 2025 19:35:23 +0000 (UTC)
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
X-Inumbo-ID: 81667a15-e978-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739388923;
	bh=Ugf2g2Yhg5Aw7lvSOZInqiVQU41aKtxd+Iq+ubuXWEg=;
	h=From:To:Cc:Subject:Date:From;
	b=uI3m2wF4Xy0uTW4CBkbjuWo3J7yN1REN3JcZj1mpdYXFEtL7T88sdAvRnb1/MVrU0
	 HXdV7MmRBPS0YI+UXLj+AvaYht9/ohnRiXQU3tnh31cN9WYwW57S2uZmvTjg7rm4nw
	 oekL0p384QdGbuQvSSCQ4s6AWgb+kU89zVwLeZbeYvUmavrBOZlotZjvR2VO6YQqbK
	 jnZncsAC7MCaP/DmaCPaN/jfVVcmZLr2Ce+PLa8l2dk3LIQ9d3K2s21TZcme6sYMx0
	 L0TcvYDJaO9zmPCvT39dPi7GgTfEVyAn7Q5nPyLTrcmfn28Vm+FuSEJlJBot2Lv4D7
	 65O8+aKHg5kaw==
From: Bjorn Helgaas <helgaas@kernel.org>
To: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	linux-pci@vger.kernel.org
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jan Beulich <jbeulich@suse.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Deren Wu <Deren.Wu@mediatek.com>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Shayne Chen <Shayne.Chen@mediatek.com>,
	Sean Wang <Sean.Wang@mediatek.com>,
	Leon Yen <Leon.Yen@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	regressions@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH] PCI: Avoid FLR for Mediatek MT7922 WiFi
Date: Wed, 12 Feb 2025 13:35:16 -0600
Message-Id: <20250212193516.88741-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bjorn Helgaas <bhelgaas@google.com>

The Mediatek MT7922 WiFi device advertises FLR support, but it apparently
does not work, and all subsequent config reads return ~0:

  pci 0000:01:00.0: [14c3:0616] type 00 class 0x028000 PCIe Endpoint
  pciback 0000:01:00.0: not ready 65535ms after FLR; giving up

After an FLR, pci_dev_wait() waits for the device to become ready.  Prior
to d591f6804e7e ("PCI: Wait for device readiness with Configuration RRS"),
it polls PCI_COMMAND until it is something other that PCI_POSSIBLE_ERROR
(~0).  If it times out, pci_dev_wait() returns -ENOTTY and
__pci_reset_function_locked() tries the next available reset method.
Typically this is Secondary Bus Reset, which does work, so the MT7922 is
eventually usable.

After d591f6804e7e, if Configuration Request Retry Status Software
Visibility (RRS SV) is enabled, pci_dev_wait() polls PCI_VENDOR_ID until it
is something other than the special 0x0001 Vendor ID that indicates a
completion with RRS status.

When RRS SV is enabled, reads of PCI_VENDOR_ID should return either 0x0001,
i.e., the config read was completed with RRS, or a valid Vendor ID.  On the
MT7922, it seems that all config reads after FLR return ~0 indefinitely.
When pci_dev_wait() reads PCI_VENDOR_ID and gets 0xffff, it assumes that's
a valid Vendor ID and the device is now ready, so it returns with success.

After pci_dev_wait() returns success, we restore config space and continue.
Since the MT7922 is not actually ready after the FLR, the restore fails and
the device is unusable.

We considered changing pci_dev_wait() to continue polling if a
PCI_VENDOR_ID read returns either 0x0001 or 0xffff.  This "works" as it did
before d591f6804e7e, although we have to wait for the timeout and then fall
back to SBR.  But it doesn't work for SR-IOV VFs, which *always* return
0xffff as the Vendor ID.

Mark Mediatek MT7922 WiFi devices to avoid the use of FLR completely.  This
will cause fallback to another reset method, such as SBR.

Fixes: d591f6804e7e ("PCI: Wait for device readiness with Configuration RRS")
Link: https://github.com/QubesOS/qubes-issues/issues/9689#issuecomment-2582927149
Link: https://lore.kernel.org/r/Z4pHll_6GX7OUBzQ@mail-itl
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/quirks.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index b84ff7bade82..82b21e34c545 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -5522,7 +5522,7 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x443, quirk_intel_qat_vf_cap);
  * AMD Matisse USB 3.0 Host Controller 0x149c
  * Intel 82579LM Gigabit Ethernet Controller 0x1502
  * Intel 82579V Gigabit Ethernet Controller 0x1503
- *
+ * Mediatek MT7922 802.11ax PCI Express Wireless Network Adapter
  */
 static void quirk_no_flr(struct pci_dev *dev)
 {
@@ -5534,6 +5534,7 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_AMD, 0x149c, quirk_no_flr);
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_AMD, 0x7901, quirk_no_flr);
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x1502, quirk_no_flr);
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x1503, quirk_no_flr);
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_MEDIATEK, 0x0616, quirk_no_flr);
 
 /* FLR may cause the SolidRun SNET DPU (rev 0x1) to hang */
 static void quirk_no_flr_snet(struct pci_dev *dev)
-- 
2.34.1


