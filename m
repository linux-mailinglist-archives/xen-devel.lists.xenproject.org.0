Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6CA8B7EB4
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 19:35:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715154.1116691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1rMz-00072j-5l; Tue, 30 Apr 2024 17:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715154.1116691; Tue, 30 Apr 2024 17:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1rMz-0006vK-1G; Tue, 30 Apr 2024 17:34:21 +0000
Received: by outflank-mailman (input) for mailman id 715154;
 Tue, 30 Apr 2024 17:34:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DdMh=MD=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s1rMx-0006rz-58
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 17:34:19 +0000
Received: from wfhigh8-smtp.messagingengine.com
 (wfhigh8-smtp.messagingengine.com [64.147.123.159])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc1952e8-0717-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 19:34:16 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfhigh.west.internal (Postfix) with ESMTP id 2A6BA1800131;
 Tue, 30 Apr 2024 13:34:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 30 Apr 2024 13:34:11 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Apr 2024 13:34:09 -0400 (EDT)
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
X-Inumbo-ID: dc1952e8-0717-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1714498450; x=1714584850; bh=nuTget59Mx
	Wc4IfoutnOU8Z20vpZN60QWE54LVhF6ms=; b=t4Ug7DTH9FfnRfuc/DODFmSS+l
	mD3jFWNfTrDtk7In2zJy+/OPeCt3KXtdl2nJV4pPZ2pvRXZrzLRMaQ4HSJh2nmh0
	V5gEtjUJIw9ZR7MvqvJgq4O+gGn7AcMRtE/Z1CXm3dUdod15IuAk59wpsntnewXt
	WTuR8l8zcOqHlNITJrI2WGfCL9LTNvJrfdZIXIotk+26lkHQJ1fwnUhSgllKhIQY
	WzAMxX0WVQx6yRos3yZfcn29od3bqXl2hh+aIr8v7tigAEI/8wfIAaXcwpQukTOK
	aR9Z3QgUv9XdkNhO7eVOd5bKqcf9rjUNAM35ioRx88Gnk345JrHRpZ2aXUpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714498450; x=
	1714584850; bh=nuTget59MxWc4IfoutnOU8Z20vpZN60QWE54LVhF6ms=; b=M
	a5VxVonW0Qm9fs0XA8C4EYYeA8DQOTjBKfXaGV/IyykiUtCZvtyM/uTomp4mv1fn
	dRdED+lgGT4CKODfGELmTYvp7vP6OTKsISeGWLdzSTEZO7wY3tUS3wsdAojn4SO2
	rbFknN3N+VsLGoW4xZ+csJs64Hm21a33zH94MPXbzfU7vahcAVrRjSE1iBEzTPiT
	CZ9/tvnSkkAJsp6ZU7j2SwY3/xC2nzylX1sEZdGPGGhVU/Qxf8UAXZXdgMDG+7VT
	eLeS0QMaUQbrJLxdg7fhC7q6D8fG0sWT0AX1lAy8PhmERJ+colLa7cCICJUEvNhO
	OS6YCyB70T/AkM8N25Qkw==
X-ME-Sender: <xms:kisxZh0Fo4lMf2nSVZu4SyOZzK5kxzdH4kL7NUyeoyW_z_QEKVRf3w>
    <xme:kisxZoFXszW32A-TTvRXzlkKiPhNl1JIWJlD_SAXzAF3l93G0wzyAnVx7IboPNH1Q
    SaacV4Rs8Fu6Q>
X-ME-Received: <xmr:kisxZh6ARn4DD695f7h_6_8F0pjACmIStS_M2ww1QwIZYOwK-Awkhu7Qvy0CoZGokGlr3zIG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddufedgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgr
    rhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghkse
    hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhep
    gfeuudehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghr
    vghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:kisxZu3sqn_kCe8IxidhA89Idnv0ff0ssnKP-hyd_Tf7SHZfsV_R2w>
    <xmx:kisxZkGTYxkpPG3HIUpIsg4xKpQrvThJLiq8_IfLB-VEPeFSYyHTSA>
    <xmx:kisxZv-0hOQmKdJXx-FMJwXnhHoWnVA5ASLPzuKTBB7f7KGfdqEm0w>
    <xmx:kisxZhm8z_a6Ti25Z7Dr_DceznWeqzME7RGli6flyZ_b-qySe4Wh0Q>
    <xmx:kisxZpNap_XR-F0uWa0HzYv_wpAK3Kh1uxNyGxxn6LOlhSlJkfvFeHtC>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH v2 1/3] hw/xen/xen_pt: Save back data only for declared registers
Date: Tue, 30 Apr 2024 19:33:09 +0200
Message-ID: <3cc5a7d2e0338112fb87806c813627bdf5dbd2a5.1714498385.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.ea761e8c87cc41550b01d6fbc1cd1116af55e288.1714498385.git-series.marmarek@invisiblethingslab.com>
References: <cover.ea761e8c87cc41550b01d6fbc1cd1116af55e288.1714498385.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Call pci_default_write_config() in xen_pt_pci_write_config() only for
registers that have matching XenPTRegInfo structure, and do that only after
resolving any custom handlers. This is important for two reasons:
1. XenPTRegInfo has ro_mask which needs to be enforced - Xen-specific
   hooks do that on their own (especially xen_pt_*_reg_write()).
2. Not setting value early allows hooks to see the old value too.

If it would be only about the first point, setting PCIDevice.wmask would
probably be sufficient, but given the second point, restructure those
writes.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
v2:
 - rewrite commit message, previous one was very misleading
 - fix loop saving register values
 - fix int overflow when calculating write mask
---
 hw/xen/xen_pt.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 3635d1b..cea2e18 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -256,6 +256,7 @@ static void xen_pt_pci_write_config(PCIDevice *d, uint32_t addr,
     uint32_t find_addr = addr;
     XenPTRegInfo *reg = NULL;
     bool wp_flag = false;
+    uint32_t emul_mask = 0, write_val;
 
     if (xen_pt_pci_config_access_check(d, addr, len)) {
         return;
@@ -311,7 +312,6 @@ static void xen_pt_pci_write_config(PCIDevice *d, uint32_t addr,
     }
 
     memory_region_transaction_begin();
-    pci_default_write_config(d, addr, val, len);
 
     /* adjust the read and write value to appropriate CFC-CFF window */
     read_val <<= (addr & 3) << 3;
@@ -371,6 +371,9 @@ static void xen_pt_pci_write_config(PCIDevice *d, uint32_t addr,
                 return;
             }
 
+            emul_mask |= ((1L << (reg->size * 8)) - 1)
+                         << ((find_addr & 3) * 8);
+
             /* calculate next address to find */
             emul_len -= reg->size;
             if (emul_len > 0) {
@@ -397,6 +400,25 @@ static void xen_pt_pci_write_config(PCIDevice *d, uint32_t addr,
     /* need to shift back before passing them to xen_host_pci_set_block. */
     val >>= (addr & 3) << 3;
 
+    /* store emulated registers after calling their handlers */
+    write_val = val;
+    for (index = 0; index < len; index += emul_len) {
+        emul_len = 0;
+        while (emul_mask & 0xff) {
+            emul_len++;
+            emul_mask >>= 8;
+        }
+        if (emul_len) {
+            uint32_t mask = ((1L << (emul_len * 8)) - 1);
+            pci_default_write_config(d, addr + index, write_val & mask,
+                                     emul_len);
+        } else {
+            emul_mask >>= 8;
+            emul_len = 1;
+        }
+        write_val >>= emul_len * 8;
+    }
+
     memory_region_transaction_commit();
 
 out:
-- 
git-series 0.9.1

