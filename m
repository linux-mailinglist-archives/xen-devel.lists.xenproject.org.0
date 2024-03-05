Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04837872759
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 20:14:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688893.1073631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhaEQ-00053x-FL; Tue, 05 Mar 2024 19:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688893.1073631; Tue, 05 Mar 2024 19:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhaEQ-00051n-Bd; Tue, 05 Mar 2024 19:13:42 +0000
Received: by outflank-mailman (input) for mailman id 688893;
 Tue, 05 Mar 2024 19:13:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OsR7=KL=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rhaEN-00051b-Uu
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 19:13:40 +0000
Received: from wfhigh5-smtp.messagingengine.com
 (wfhigh5-smtp.messagingengine.com [64.147.123.156])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75b348d1-db24-11ee-afda-a90da7624cb6;
 Tue, 05 Mar 2024 20:13:37 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfhigh.west.internal (Postfix) with ESMTP id 9573F18000D5;
 Tue,  5 Mar 2024 14:13:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 05 Mar 2024 14:13:32 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Mar 2024 14:13:29 -0500 (EST)
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
X-Inumbo-ID: 75b348d1-db24-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1709666011; x=1709752411; bh=VSUlkpuYOEcRplvlXrjlVafcExCQb+jf
	CPZC81dIcIs=; b=EVK+O2lxJWxJMjL8Oz2Ln1tBkVKuV/WmtIkwnGMYtjdQR57j
	6RJ3sUPaktu1KQ/hDsH9MuntTEwWscWxOpyXdZAVeR1HDGm2Vlg7Hd7lph9Bunjg
	rUGQlXZN5DauNZchbhTVNcVPEMuusvo7zB3+w/4+42WmfPwse7zXdmkC65kBoO0y
	Yxh8fdzLB+w60FMcxA+qsaE+ShPFWsFvc06lN3mXV6hnKezs+W2nXrp6QfiOj563
	ExhpFgwLMfjuabTXq1fSXwKsy4M94aMYqBnrnoKvnVgQJ3QLUVsVt6ChzGwBnze3
	t0FGKN9t/kKdW1veUNNBJiyIQJcd6VTiBxxzXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1709666011; x=1709752411; bh=VSUlkpuYOEcRp
	lvlXrjlVafcExCQb+jfCPZC81dIcIs=; b=qkaTI3+FUieGvdWlljrO44qas8wzF
	irqTvhOq699K6VfLAbSR/soYcSPh1/aJOOwr8zhS6VFx9GqpV7psSo1WYfMuvqLk
	0gry0PSzPdRUHlWsAc8JHcZTPx3JDLe0iOJ9xDSrn+I80hgV8sRedfNZGxNs9ROY
	a66VjjnjxaYn/1H0aT72UOVsmRgN5U3/70EYi516VZg8Ax4C8F0yVO6H4QNzRrU8
	EZMsnWumZa1D72vAAoIl3h0Xith7VTGL1jYIqJ9C/XEzaPecFRqX4+ZPfTUNAgjT
	MX2rXHJtuPSOF8s0yWdRwcqHC/hfCv3QSYmwaKjqAByXdC1HwJMtgU0sA==
X-ME-Sender: <xms:2m7nZWE1lza5p4rOPJy3hgNffTitUBYBk9yK4303__vLkAY2fcodAw>
    <xme:2m7nZXX8uLPnDITswcN8q8nxvjbhA9-xj6QaY8AqgUTxNpWGHNhgAI_gi1C0HD2NL
    XovxQkVWaWsug>
X-ME-Received: <xmr:2m7nZQL00OE653sb9kpyBCZPtFycLXDKbZCGWsZE8NGM98d-TyNhBpPucqxdfxaSjWvQzBVXK-2zOHPgS9iyfv6OnMdVjOk1Hkci3ws0Uz0c1rf5Q6E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrheelgdduudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelkefh
    udelteelleelteetveeffeetffekteetjeehlefggeekleeghefhtdehvdenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:2m7nZQEd7dNhshAAvFLNNCvQ-8It477Pz5wWmFrVNwlOxAFMK5U6EQ>
    <xmx:2m7nZcUDNBuOd5a7NfbfwM1hdk0U_lsKny4TQxo2RFulxHpYLrmlmg>
    <xmx:2m7nZTM1CyHc4nF0cUbAjzYBmYLIpPmKJ4f8cnGJTxbhauDFM5s5kA>
    <xmx:227nZeK0MEbDpp6aBs-zT9bA32nfgte8re4UnPZWUlCinDdkHuFWFesaclE>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: qemu-devel@nongnu.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH v2 1/2] hw/xen: detect when running inside stubdomain
Date: Tue,  5 Mar 2024 20:12:29 +0100
Message-ID: <20240305191312.321127-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce global xen_is_stubdomain variable when qemu is running inside
a stubdomain instead of dom0. This will be relevant for subsequent
patches, as few things like accessing PCI config space need to be done
differently.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v2:
- use sigend int for domid to match xenstore_read_int() types, domid is
  in a signed range anyway
- fix code style
---
 hw/xen/xen-legacy-backend.c | 16 ++++++++++++++++
 include/hw/xen/xen.h        |  1 +
 system/globals.c            |  1 +
 3 files changed, 18 insertions(+)

diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 124dd5f3d6..6bd4e6eb2f 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -603,6 +603,20 @@ static void xen_set_dynamic_sysbus(void)
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_XENSYSDEV);
 }
 
+static bool xen_check_stubdomain(void)
+{
+    char *dm_path = g_strdup_printf("/local/domain/%d/image", xen_domid);
+    int32_t dm_domid;
+    bool is_stubdom = false;
+
+    if (!xenstore_read_int(dm_path, "device-model-domid", &dm_domid)) {
+        is_stubdom = dm_domid != 0;
+    }
+
+    g_free(dm_path);
+    return is_stubdom;
+}
+
 void xen_be_init(void)
 {
     xenstore = qemu_xen_xs_open();
@@ -616,6 +630,8 @@ void xen_be_init(void)
         exit(1);
     }
 
+    xen_is_stubdomain = xen_check_stubdomain();
+
     xen_sysdev = qdev_new(TYPE_XENSYSDEV);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(xen_sysdev), &error_fatal);
     xen_sysbus = qbus_new(TYPE_XENSYSBUS, xen_sysdev, "xen-sysbus");
diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index 37ecc91fc3..ecb89ecfc1 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -36,6 +36,7 @@ enum xen_mode {
 extern uint32_t xen_domid;
 extern enum xen_mode xen_mode;
 extern bool xen_domid_restrict;
+extern bool xen_is_stubdomain;
 
 int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
 int xen_set_pci_link_route(uint8_t link, uint8_t irq);
diff --git a/system/globals.c b/system/globals.c
index b6d4e72530..ac27d88bd4 100644
--- a/system/globals.c
+++ b/system/globals.c
@@ -62,6 +62,7 @@ bool qemu_uuid_set;
 uint32_t xen_domid;
 enum xen_mode xen_mode = XEN_DISABLED;
 bool xen_domid_restrict;
+bool xen_is_stubdomain;
 struct evtchn_backend_ops *xen_evtchn_ops;
 struct gnttab_backend_ops *xen_gnttab_ops;
 struct foreignmem_backend_ops *xen_foreignmem_ops;
-- 
2.43.0


