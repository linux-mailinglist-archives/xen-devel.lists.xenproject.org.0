Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7FB7CA91C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 15:14:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617541.960207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsNQ6-0004pN-MJ; Mon, 16 Oct 2023 13:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617541.960207; Mon, 16 Oct 2023 13:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsNQ6-0004nG-Jb; Mon, 16 Oct 2023 13:14:06 +0000
Received: by outflank-mailman (input) for mailman id 617541;
 Mon, 16 Oct 2023 13:14:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u61L=F6=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qsNQ5-0004nA-U3
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 13:14:05 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfcee444-6c25-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 15:14:04 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 96AE65C039B;
 Mon, 16 Oct 2023 09:14:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 16 Oct 2023 09:14:01 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Oct 2023 09:14:00 -0400 (EDT)
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
X-Inumbo-ID: dfcee444-6c25-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1697462041; x=1697548441; bh=4l799Etjsd61etoKzKWXHhkW7
	EpAA6Zrh8WZJFoVuBk=; b=Q4ad2P67UxYuPBTo+McVbi1NM1+QQZpwwIceSxqRR
	HtB2bTO7YjQQYTJiHVC7pQZNxbG9WS/HBiXpyU2E7+eyS4+y+aCjMJ97Uz+0zQHP
	LasIi4tteOstoIvBDNqWcLNaZ5zk8DeoKcW9vgESSbLmwJJBGutYv+zACr9vmqvy
	urYPWe0OhjdByauDyJUjgqONAziO3rLhNd9bZWaj4AEBmTesN0XITspPxU2tLW33
	DV4e4IG1NPb8bu5oRpUHz6zaxl+ZdbvgljoysS4gj/yDQs9NfUHWsnmJM/lCByDr
	E2gSWMP3ldSoCB9QRBicaJad1KL5mECSA9RW1/6uGCoig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1697462041; x=1697548441; bh=4
	l799Etjsd61etoKzKWXHhkW7EpAA6Zrh8WZJFoVuBk=; b=ZkdZbrGOYWZUq6T5u
	GHuv6ICTTiXmHuNqH7nRx9uW0XPkeKVN6JQfDRTjV5MANp+xMF0kycL5hEekwCTE
	PUU43Pm/f9Y8e+i57OKNcyRWfLxyQSWpoGhYGswME3y3D5bWwPHDmuUbPlyKlTNz
	PehThgfGxNiqxVaS6dMDsUQFvm1f3Gexf91UWb/ZReXz42T2gJ5DpeEzqpkSNdbs
	zvjuPgMaUANMVo6SU68AAxYukshJ9va2zsDaGscCr+FlwVMRFczgFswtF+kgHWj/
	4aNABTRgcMKh5RwQxxCY5N19m5dHMCllZVi7KvWdKj24ax4ZCz5lxFxRHm8rZphT
	KgYvA==
X-ME-Sender: <xms:GTctZWUph7h101jrh0d6Sxaalqdq-khmv3LRE8Fgo_Dw7ojheh2GKA>
    <xme:GTctZSl6zwcr_ie-1aUrSFrySBCOjWhes9v1xIMu-AEiKZr9xH3kDgUjcrV8nl86w
    7RkcxIqqromPQ>
X-ME-Received: <xmr:GTctZaYxRN5yumTPtXS1uQAbdWE_McLxcJ6-oa7uq-Dufr7cR2coAEkdhONCIAklTvRp6HaSiAM-bMXCCdco_-XauKoFCAAnyPEvvHLVuBF_v7CsmTbG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrjedtgdehlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleekhfdu
    leetleelleetteevfeefteffkeetteejheelgfegkeelgeehhfdthedvnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:GTctZdWzj-USmwUTla5PIabsefevstfN5G_s04B1vNJhEvqA3wx7hw>
    <xmx:GTctZQm0YJQMLz7gnA9PlBDzvRnylWx3k5YSUEn2W9ZlBHk0Fn5Y1w>
    <xmx:GTctZSdaH1aDfSXYZLLhyfpeLPqGvqN_Jye3iudEAVHKf-3f_CTdVw>
    <xmx:GTctZRDQtvfG3o-kScK35qM6y6-lxwHwJn1uaxZE38nyf8Ctc0h_sA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	xen-devel@lists.xenproject.org (moderated list:XEN HYPERVISOR INTERFACE)
Subject: [PATCH v4] xen-pciback: Consider INTx disabled when MSI/MSI-X is enabled
Date: Mon, 16 Oct 2023 15:13:25 +0200
Message-ID: <20231016131348.1734721-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Linux enables MSI-X before disabling INTx, but keeps MSI-X masked until
the table is filled. Then it disables INTx just before clearing MASKALL
bit. Currently this approach is rejected by xen-pciback.
According to the PCIe spec, device cannot use INTx when MSI/MSI-X is
enabled (in other words: enabling MSI/MSI-X implicitly disables INTx).

Change the logic to consider INTx disabled if MSI/MSI-X is enabled. This
applies to three places:
 - checking currently enabled interrupts type,
 - transition to MSI/MSI-X - where INTx would be implicitly disabled,
 - clearing INTx disable bit - which can be allowed even if MSI/MSI-X is
   enabled, as device should consider INTx disabled anyway in that case

Fixes: 5e29500eba2a ("xen-pciback: Allow setting PCI_MSIX_FLAGS_MASKALL too")
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Juergen Gross <jgross@suse.com>
---
Changes in v4:
 - update comment (retain A-b)
Changes in v3:
 - allow clearing INTx regardless of MSI/MSI-X state, to be consistent
   with enabling MSI/MSI-X
Changes in v2:
 - restructure the patch to consider not only MASKALL bit, but enabling
   MSI/MSI-X generally, without explicitly disabling INTx first
---
 drivers/xen/xen-pciback/conf_space.c          | 19 +++++++++++------
 .../xen/xen-pciback/conf_space_capability.c   |  8 ++++++-
 drivers/xen/xen-pciback/conf_space_header.c   | 21 +++----------------
 3 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/drivers/xen/xen-pciback/conf_space.c b/drivers/xen/xen-pciback/conf_space.c
index 059de92aea7d..d47eee6c5143 100644
--- a/drivers/xen/xen-pciback/conf_space.c
+++ b/drivers/xen/xen-pciback/conf_space.c
@@ -288,12 +288,6 @@ int xen_pcibk_get_interrupt_type(struct pci_dev *dev)
 	u16 val;
 	int ret = 0;
 
-	err = pci_read_config_word(dev, PCI_COMMAND, &val);
-	if (err)
-		return err;
-	if (!(val & PCI_COMMAND_INTX_DISABLE))
-		ret |= INTERRUPT_TYPE_INTX;
-
 	/*
 	 * Do not trust dev->msi(x)_enabled here, as enabling could be done
 	 * bypassing the pci_*msi* functions, by the qemu.
@@ -316,6 +310,19 @@ int xen_pcibk_get_interrupt_type(struct pci_dev *dev)
 		if (val & PCI_MSIX_FLAGS_ENABLE)
 			ret |= INTERRUPT_TYPE_MSIX;
 	}
+
+	/*
+	 * PCIe spec says device cannot use INTx if MSI/MSI-X is enabled,
+	 * so check for INTx only when both are disabled.
+	 */
+	if (!ret) {
+		err = pci_read_config_word(dev, PCI_COMMAND, &val);
+		if (err)
+			return err;
+		if (!(val & PCI_COMMAND_INTX_DISABLE))
+			ret |= INTERRUPT_TYPE_INTX;
+	}
+
 	return ret ?: INTERRUPT_TYPE_NONE;
 }
 
diff --git a/drivers/xen/xen-pciback/conf_space_capability.c b/drivers/xen/xen-pciback/conf_space_capability.c
index 097316a74126..1948a9700c8f 100644
--- a/drivers/xen/xen-pciback/conf_space_capability.c
+++ b/drivers/xen/xen-pciback/conf_space_capability.c
@@ -236,10 +236,16 @@ static int msi_msix_flags_write(struct pci_dev *dev, int offset, u16 new_value,
 		return PCIBIOS_SET_FAILED;
 
 	if (new_value & field_config->enable_bit) {
-		/* don't allow enabling together with other interrupt types */
+		/*
+		 * Don't allow enabling together with other interrupt type, but do
+		 * allow enabling MSI(-X) while INTx is still active to please Linuxes
+		 * MSI(-X) startup sequence. It is safe to do, as according to PCI
+		 * spec, device with enabled MSI(-X) shouldn't use INTx.
+		 */
 		int int_type = xen_pcibk_get_interrupt_type(dev);
 
 		if (int_type == INTERRUPT_TYPE_NONE ||
+		    int_type == INTERRUPT_TYPE_INTX ||
 		    int_type == field_config->int_type)
 			goto write;
 		return PCIBIOS_SET_FAILED;
diff --git a/drivers/xen/xen-pciback/conf_space_header.c b/drivers/xen/xen-pciback/conf_space_header.c
index 981435103af1..fc0332645966 100644
--- a/drivers/xen/xen-pciback/conf_space_header.c
+++ b/drivers/xen/xen-pciback/conf_space_header.c
@@ -104,24 +104,9 @@ static int command_write(struct pci_dev *dev, int offset, u16 value, void *data)
 		pci_clear_mwi(dev);
 	}
 
-	if (dev_data && dev_data->allow_interrupt_control) {
-		if ((cmd->val ^ value) & PCI_COMMAND_INTX_DISABLE) {
-			if (value & PCI_COMMAND_INTX_DISABLE) {
-				pci_intx(dev, 0);
-			} else {
-				/* Do not allow enabling INTx together with MSI or MSI-X. */
-				switch (xen_pcibk_get_interrupt_type(dev)) {
-				case INTERRUPT_TYPE_NONE:
-					pci_intx(dev, 1);
-					break;
-				case INTERRUPT_TYPE_INTX:
-					break;
-				default:
-					return PCIBIOS_SET_FAILED;
-				}
-			}
-		}
-	}
+	if (dev_data && dev_data->allow_interrupt_control &&
+	    ((cmd->val ^ value) & PCI_COMMAND_INTX_DISABLE))
+		pci_intx(dev, !(value & PCI_COMMAND_INTX_DISABLE));
 
 	cmd->val = value;
 
-- 
2.41.0


