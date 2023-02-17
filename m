Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A52EC69B4D3
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 22:36:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497316.768284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT8Oe-0006vp-DI; Fri, 17 Feb 2023 21:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497316.768284; Fri, 17 Feb 2023 21:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT8Oe-0006rZ-9Q; Fri, 17 Feb 2023 21:36:00 +0000
Received: by outflank-mailman (input) for mailman id 497316;
 Fri, 17 Feb 2023 21:35:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uk7L=6N=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pT8Od-0005eU-5l
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 21:35:59 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1062e39a-af0b-11ed-933d-83870f6b2ba8;
 Fri, 17 Feb 2023 22:35:58 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 4C775320025E;
 Fri, 17 Feb 2023 16:35:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 17 Feb 2023 16:35:56 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Feb 2023 16:35:54 -0500 (EST)
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
X-Inumbo-ID: 1062e39a-af0b-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1676669755; x=1676756155; bh=cPvNK4bRedLwQjVJg5m10GmXqhwI307WgJ3
	tNvm6++Q=; b=A/Zl1nTSSt/7E1c/+8eNIh2CNPS+3KLcHJ+PjBKQTyf43ODkiRY
	f45PLWkE7sscQG+I6Opblp5v1Z7gtoEciM9wXxGuMsUv6Nv3MopPwfeYA14ZeJjx
	CMyQuesyBMrrAZhw2GdiobvQNL00BUOAE/NAeX/kmz7ESMTbykK+dL46WKIvbbFG
	6EKaLUOEdpfLunsa25TuFJAoODWgLcMF/N24JuYiHhyzVydxqNqkTJE36udUZoFN
	xfHO5dX/+lq99ZRPz5kfY//DiN4pV8JlAr4RBsfRoVvmieCf+1gBkg43w/8XIjLW
	NxwqfQKiISzQafv/qXMjCwwrtj+pkDyGXRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1676669755; x=1676756155; bh=cPvNK4bRedLwQ
	jVJg5m10GmXqhwI307WgJ3tNvm6++Q=; b=thGHifTuQfzp913urqV1jXIrG3gYB
	qSyuXjGCsrxn39EsWgIxtqhpZqmf8JH7as1AFdMzO99mMfzGmb1mEEuENPfBDp+B
	8UXhNMCcMywYK5sNr/DBkR3CC6nVLlW2MICS0tQhdFRnOPegamIbUqpRhVfAZnZG
	ZYZNx6ukWisuvQVoNpfjjOuiXZ0jb7G8lFMdoUVe0qB/ZD/7bq6q+wyx2GnWzIrZ
	bGvueZnHaAIw75Ot4nO/eAbLvjg4ONIltw2QC6MsB4fLB8Jvg8wmV+TFkHb4Fmi+
	Gxl855ediJdcieGG45O0P8Pqng79VCNtrGMQnAFWo6Ke2sEUVUAlEdNBA==
X-ME-Sender: <xms:O_PvY69jLr1n_XD5CcHRbXeCrdwWUgUi2h613GpQXUJwMu54H7CONQ>
    <xme:O_PvY6vHmSm8q20NTZFiC3P1VbHfBUCWarrdh0MKwXRXvVEyuy2IFbLQGxQRpiKll
    hCS4s4kUgnC78w>
X-ME-Received: <xmr:O_PvYwD-4TKRfUTdpX_VGfQKRIdgM6S7ObfLVhNu57V5Zr-A3tkzRwvN6l-ECobBOGWKZhHMdoI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeiledgudegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvtdettefgheduueeiudevleev
    udeifefguefgvdffudeugfdugfetueetveetheenucffohhmrghinhephhihphgvrhhtrh
    grnhhsphhorhhtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:O_PvYyeSUCH6D1_AZNg551DXKVQrXo5PkvL-y_tW0RscfFl36VOYAg>
    <xmx:O_PvY_MI1VwJGoqhm4qON3wvQa_KpYW8vHX6zX0Yjq7RI4qrLoJ2tA>
    <xmx:O_PvY8m9qWeN3nigReDzgq50ForexOzcr6cgWlYOIGUqkTXeEyQ3yw>
    <xmx:O_PvY60aS1GUDF_Uu9eVc7JsgA9wXJg79bmcN56btadXtV7st6ejHg>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 4/4] Rip out HyperTransport
Date: Fri, 17 Feb 2023 16:35:27 -0500
Message-Id: <9c5befd1718b546be410e33999e77be91f5cfc59.1676668923.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1676668922.git.demi@invisiblethingslab.com>
References: <cover.1676668922.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is not used and the website is gone.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/include/xen/pci_regs.h | 37 -------------------------------------
 1 file changed, 37 deletions(-)

diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
index a90aff1712bafc6ed87296858803d16c253e7b53..2b37fe2a464345877faa99a9dce695998910b6bf 100644
--- a/xen/include/xen/pci_regs.h
+++ b/xen/include/xen/pci_regs.h
@@ -12,11 +12,6 @@
  *	PCI Local Bus Specification
  *	PCI to PCI Bridge Specification
  *	PCI System Design Guide
- *
- * 	For hypertransport information, please consult the following manuals
- * 	from http://www.hypertransport.org
- *
- *	The Hypertransport I/O Link Specification
  */
 
 #ifndef LINUX_PCI_REGS_H
@@ -529,38 +524,6 @@
 #define  PCI_VNDR_HEADER_REV(x)	(((x) >> 16) & 0xf)
 #define  PCI_VNDR_HEADER_LEN(x)	(((x) >> 20) & 0xfff)
 
-/*
- * Hypertransport sub capability types
- *
- * Unfortunately there are both 3 bit and 5 bit capability types defined
- * in the HT spec, catering for that is a little messy. You probably don't
- * want to use these directly, just use pci_find_ht_capability() and it
- * will do the right thing for you.
- */
-#define HT_3BIT_CAP_MASK	0xE0
-#define HT_CAPTYPE_SLAVE	0x00	/* Slave/Primary link configuration */
-#define HT_CAPTYPE_HOST		0x20	/* Host/Secondary link configuration */
-
-#define HT_5BIT_CAP_MASK	0xF8
-#define HT_CAPTYPE_IRQ		0x80	/* IRQ Configuration */
-#define HT_CAPTYPE_REMAPPING_40	0xA0	/* 40 bit address remapping */
-#define HT_CAPTYPE_REMAPPING_64 0xA2	/* 64 bit address remapping */
-#define HT_CAPTYPE_UNITID_CLUMP	0x90	/* Unit ID clumping */
-#define HT_CAPTYPE_EXTCONF	0x98	/* Extended Configuration Space Access */
-#define HT_CAPTYPE_MSI_MAPPING	0xA8	/* MSI Mapping Capability */
-#define  HT_MSI_FLAGS		0x02		/* Offset to flags */
-#define  HT_MSI_FLAGS_ENABLE	0x1		/* Mapping enable */
-#define  HT_MSI_FLAGS_FIXED	0x2		/* Fixed mapping only */
-#define  HT_MSI_FIXED_ADDR	0x00000000FEE00000ULL	/* Fixed addr */
-#define  HT_MSI_ADDR_LO		0x04		/* Offset to low addr bits */
-#define  HT_MSI_ADDR_LO_MASK	0xFFF00000	/* Low address bit mask */
-#define  HT_MSI_ADDR_HI		0x08		/* Offset to high addr bits */
-#define HT_CAPTYPE_DIRECT_ROUTE	0xB0	/* Direct routing configuration */
-#define HT_CAPTYPE_VCSET	0xB8	/* Virtual Channel configuration */
-#define HT_CAPTYPE_ERROR_RETRY	0xC0	/* Retry on error configuration */
-#define HT_CAPTYPE_GEN3		0xD0	/* Generation 3 hypertransport configuration */
-#define HT_CAPTYPE_PM		0xE0	/* Hypertransport powermanagement configuration */
-
 /* Access Control Service */
 #define PCI_ACS_CAP		0x04	/* ACS Capability Register */
 #define  PCI_ACS_SV		0x01	/* Source Validation */
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

