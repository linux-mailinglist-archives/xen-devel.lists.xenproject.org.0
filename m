Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDB5A236B6
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 22:32:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879784.1289989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdc8L-0003eo-25; Thu, 30 Jan 2025 21:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879784.1289989; Thu, 30 Jan 2025 21:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdc8K-0003cy-VN; Thu, 30 Jan 2025 21:31:32 +0000
Received: by outflank-mailman (input) for mailman id 879784;
 Thu, 30 Jan 2025 21:31:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bMfo=UW=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1tdc8J-0003cs-Tp
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 21:31:31 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9027741d-df51-11ef-99a4-01e77a169b0f;
 Thu, 30 Jan 2025 22:31:28 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D34A75C5907;
 Thu, 30 Jan 2025 21:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56FE9C4CED2;
 Thu, 30 Jan 2025 21:31:26 +0000 (UTC)
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
X-Inumbo-ID: 9027741d-df51-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738272686;
	bh=/VPTNf6kv2G1qLnaa7PZxmpgicixURiI5N/N0YxT8Qg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ReNjQK5ofR+danry2PSj58WLHyoCBOBn6MTWxBLdCn0E52DaEZ0FGNcMJ8WpiowW0
	 TvBvTxD6gZVI7uQC8RNoJCVAfaxTf0YX3DyV79eupdJezctz/M+1RS++/TEhckq+AF
	 jLRoItDft8LUGYLznwD45iVKeTK5uTZtaeTH4zyyBD3mR3pvDt3UZaMAn01TRKTJyp
	 nrkZk5/jvTY2TVGJjAvaoawQ3i5QHQfQ4hYpjuFQFIh75akmjxeDR7sWeHgvCXFXDo
	 n/coqTkDmcxYb981tPQBajlC06YbcVHA1Qz9Dcj/YMgVld90zDpMzVVdJcCkfZA5cl
	 T5PmI1XdPzpxA==
Date: Thu, 30 Jan 2025 15:31:23 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)
Message-ID: <20250130213123.GA633869@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cfe0af0e-132b-4390-a3b0-dde0e6326e19@suse.com>

On Thu, Jan 30, 2025 at 10:30:33AM +0100, Jan Beulich wrote:
> On 30.01.2025 05:55, Marek Marczykowski-Górecki wrote:
> > I've added logging of all config read/write to this device. Full log at
> > [1].
> ...

I suspect there's something wrong with the Root Port RRS SV
configuration.

Can you add the two patches below?

I don't *think* either should make a difference.  The first enables
RRS SV earlier and maybe in a cleaner place; the second should avoid
some pointless capability searches that clutter the logs.

What does d0v1/d0v2/d0v3 mean?

Can you add 00:02.2, the Root Port leading to bus 01, so we can see
the RRS SV configuration?  Maybe also lspci -vv for both 00:02.2 and
01:00.0?

Maybe include timestamps and try an FLR without Xen (which I assume
works correctly) so we can see how long the device typically takes to
become ready?

Notes below on the snippet that you commented on, Jan.  I think it
makes sense until the read after FLR returns 0xffffffff.

> > (XEN) d0v1 conf read cf8 0x80010034 bytes 1 offset 0 data 0x80

PCI_CAPABILITY_LIST, first cap at 0x80

> > (XEN) d0v1 conf read cf8 0x80010080 bytes 2 offset 0 data 0xe010

PCI_CAP_ID_EXP (0x10) at 0x80, next cap at 0xe0

> > (XEN) d0v1 conf read cf8 0x800100e0 bytes 2 offset 0 data 0xf805

PCI_CAP_ID_MSI (0x05) at 0xe0, next cap at 0xf8

> > (XEN) d0v1 conf read cf8 0x800100f8 bytes 2 offset 0 data 0x1

PCI_CAP_ID_PM (0x01) at 0xf8, end of cap list

These caps match the offsets from the lspci output in the full log:

  1:00.0 Network controller: MEDIATEK Corp. MT7922 802.11ax PCI Express Wireless Network Adapter
	  Subsystem: MEDIATEK Corp. Device e616
	  Flags: fast devsel, IRQ 255
	  Memory at 8010900000 (64-bit, prefetchable) [disabled] [size=1M]
	  Memory at 90b00000 (64-bit, non-prefetchable) [disabled] [size=32K]
	  Capabilities: [80] Express Endpoint, IntMsgNum 0
	  Capabilities: [e0] MSI: Enable- Count=1/32 Maskable+ 64bit+
	  Capabilities: [f8] Power Management version 3

> > (XEN) d0v1 conf write cf8 0x80010004 bytes 2 offset 0 data 0x400

Set PCI_COMMAND_INTX_DISABLE, disable BARs, Bus Master.  Looks like
the end of pci_dev_save_and_disable().

> > (XEN) d0v1 conf read cf8 0x80010088 bytes 2 offset 2 data 0x9

PCIe Cap at 0x80, PCI_EXP_DEVCTL is 0x08, PCI_EXP_DEVSTA is 0x0a.

0x80010088 would be PCI_EXP_DEVCTL (a 2-byte register), maybe offset 2
gets us to PCI_EXP_DEVSTA?  Not sure.

  0x0001 PCI_EXP_DEVSTA_CED /* Correctable Error Detected */
  0x0008 PCI_EXP_DEVSTA_URD /* Unsupported Request Detected */

Not impossible that these would be set.  Lots of URs happen during
enumeration and we're not very good about cleaning these up.
Correctable errors are common for some devices.  lspci -vv would
decode the PCIe cap registers, including this.

> > (XEN) d0v1 conf read cf8 0x80010088 bytes 2 offset 0 data 0x2910

PCI_EXP_DEVCTL:
  0x2000 PCI_EXP_DEVCTL_READRQ_512B
  0x0800 PCI_EXP_DEVCTL_NOSNOOP_EN
  0x0100 PCI_EXP_DEVCTL_EXT_TAG
  0x0010 PCI_EXP_DEVCTL_RELAX_EN

> > (XEN) d0v1 conf write cf8 0x80010088 bytes 2 offset 0 data 0xa910

PCI_EXP_DEVCTL:
  set 0x8000 PCI_EXP_DEVCTL_BCR_FLR

This looks like the actual FLR being initiated.

> This is the express capability's Link Control 2 Register afaict.

Unless I'm missing something this is actually Device Control.  So far
I think this all looks OK.  The next part:

> > (XEN) d0v2 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff

looks like a problem.  The normal successful read gets 0x061614c3.
After the FLR, if RRS SV is enabled, we should get either 0x0001ffff
or 0x061614c3.

Here we would exit the loop in pci_dev_wait() because we didn't see
0x0001 and we expect that the device is ready and we got a valid
Vendor ID.

So we proceed to restoring config space via pci_restore_state(), where
we restore some PCIe registers and the header (first 64 bytes).  My
*guess* is the device isn't ready (or at least not responding) since
all the reads return ~0.

> > [1] https://gist.github.com/marmarek/b4391c71801145e52590e877c559c5e0



commit c2fd12204dcb ("PCI: Enable Configuration RRS SV early")
Author: Bjorn Helgaas <bhelgaas@google.com>
Date:   Thu Jan 30 15:16:40 2025 -0600

    PCI: Enable Configuration RRS SV early

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index b6536ed599c3..0b013b196d00 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1373,8 +1373,6 @@ static int pci_scan_bridge_extend(struct pci_bus *bus, struct pci_dev *dev,
 	pci_write_config_word(dev, PCI_BRIDGE_CONTROL,
 			      bctl & ~PCI_BRIDGE_CTL_MASTER_ABORT);
 
-	pci_enable_rrs_sv(dev);
-
 	if ((secondary || subordinate) && !pcibios_assign_all_busses() &&
 	    !is_cardbus && !broken) {
 		unsigned int cmax, buses;
@@ -1615,6 +1613,11 @@ void set_pcie_port_type(struct pci_dev *pdev)
 	pdev->pcie_cap = pos;
 	pci_read_config_word(pdev, pos + PCI_EXP_FLAGS, &reg16);
 	pdev->pcie_flags_reg = reg16;
+
+	type = pci_pcie_type(pdev);
+	if (type == PCI_EXP_TYPE_ROOT_PORT)
+		pci_enable_rrs_sv(pdev);
+
 	pci_read_config_dword(pdev, pos + PCI_EXP_DEVCAP, &pdev->devcap);
 	pdev->pcie_mpss = FIELD_GET(PCI_EXP_DEVCAP_PAYLOAD, pdev->devcap);
 
@@ -1631,7 +1634,6 @@ void set_pcie_port_type(struct pci_dev *pdev)
 	 * correctly so detect impossible configurations here and correct
 	 * the port type accordingly.
 	 */
-	type = pci_pcie_type(pdev);
 	if (type == PCI_EXP_TYPE_DOWNSTREAM) {
 		/*
 		 * If pdev claims to be downstream port but the parent



commit 4ea25d50c7c1 ("PCI: Avoid needless capability searches")
Author: Bjorn Helgaas <bhelgaas@google.com>
Date:   Thu Jan 30 14:33:00 2025 -0600

    PCI: Avoid needless capability searches
    
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 869d204a70a3..02d592b81bc6 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1742,19 +1742,17 @@ static void pci_restore_pcie_state(struct pci_dev *dev)
 
 static int pci_save_pcix_state(struct pci_dev *dev)
 {
-	int pos;
 	struct pci_cap_saved_state *save_state;
+	u8 pos;
+
+	save_state = pci_find_saved_cap(dev, PCI_CAP_ID_PCIX);
+	if (!save_state)
+		return -ENOMEM;
 
 	pos = pci_find_capability(dev, PCI_CAP_ID_PCIX);
 	if (!pos)
 		return 0;
 
-	save_state = pci_find_saved_cap(dev, PCI_CAP_ID_PCIX);
-	if (!save_state) {
-		pci_err(dev, "buffer not found in %s\n", __func__);
-		return -ENOMEM;
-	}
-
 	pci_read_config_word(dev, pos + PCI_X_CMD,
 			     (u16 *)save_state->cap.data);
 
@@ -1763,14 +1761,19 @@ static int pci_save_pcix_state(struct pci_dev *dev)
 
 static void pci_restore_pcix_state(struct pci_dev *dev)
 {
-	int i = 0, pos;
 	struct pci_cap_saved_state *save_state;
+	u8 pos;
+	int i = 0;
 	u16 *cap;
 
 	save_state = pci_find_saved_cap(dev, PCI_CAP_ID_PCIX);
-	pos = pci_find_capability(dev, PCI_CAP_ID_PCIX);
-	if (!save_state || !pos)
+	if (!save_state)
 		return;
+
+	pos = pci_find_capability(dev, PCI_CAP_ID_PCIX);
+	if (!pos)
+		return;
+
 	cap = (u16 *)&save_state->cap.data[0];
 
 	pci_write_config_word(dev, pos + PCI_X_CMD, cap[i++]);
diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index e0bc90597dca..007e4a082e6f 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -35,16 +35,14 @@ void pci_save_ltr_state(struct pci_dev *dev)
 	if (!pci_is_pcie(dev))
 		return;
 
+	save_state = pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_LTR);
+	if (!save_state)
+		return;
+
 	ltr = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_LTR);
 	if (!ltr)
 		return;
 
-	save_state = pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_LTR);
-	if (!save_state) {
-		pci_err(dev, "no suspend buffer for LTR; ASPM issues possible after resume\n");
-		return;
-	}
-
 	/* Some broken devices only support dword access to LTR */
 	cap = &save_state->cap.data[0];
 	pci_read_config_dword(dev, ltr + PCI_LTR_MAX_SNOOP_LAT, cap);
@@ -57,8 +55,11 @@ void pci_restore_ltr_state(struct pci_dev *dev)
 	u32 *cap;
 
 	save_state = pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_LTR);
+	if (!save_state)
+		return;
+
 	ltr = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_LTR);
-	if (!save_state || !ltr)
+	if (!ltr)
 		return;
 
 	/* Some broken devices only support dword access to LTR */
diff --git a/drivers/pci/vc.c b/drivers/pci/vc.c
index a4ff7f5f66dd..c39f3be518d4 100644
--- a/drivers/pci/vc.c
+++ b/drivers/pci/vc.c
@@ -355,20 +355,17 @@ int pci_save_vc_state(struct pci_dev *dev)
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(vc_caps); i++) {
-		int pos, ret;
 		struct pci_cap_saved_state *save_state;
+		int pos, ret;
+
+		save_state = pci_find_saved_ext_cap(dev, vc_caps[i].id);
+		if (!save_state)
+			return -ENOMEM;
 
 		pos = pci_find_ext_capability(dev, vc_caps[i].id);
 		if (!pos)
 			continue;
 
-		save_state = pci_find_saved_ext_cap(dev, vc_caps[i].id);
-		if (!save_state) {
-			pci_err(dev, "%s buffer not found in %s\n",
-				vc_caps[i].name, __func__);
-			return -ENOMEM;
-		}
-
 		ret = pci_vc_do_save_buffer(dev, pos, save_state, true);
 		if (ret) {
 			pci_err(dev, "%s save unsuccessful %s\n",
@@ -392,12 +389,15 @@ void pci_restore_vc_state(struct pci_dev *dev)
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(vc_caps); i++) {
-		int pos;
 		struct pci_cap_saved_state *save_state;
+		int pos;
+
+		save_state = pci_find_saved_ext_cap(dev, vc_caps[i].id);
+		if (!save_state)
+			continue;
 
 		pos = pci_find_ext_capability(dev, vc_caps[i].id);
-		save_state = pci_find_saved_ext_cap(dev, vc_caps[i].id);
-		if (!save_state || !pos)
+		if (!pos)
 			continue;
 
 		pci_vc_do_save_buffer(dev, pos, save_state, false);

