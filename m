Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5B7628931
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 20:21:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443546.698140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouf0j-00032t-SJ; Mon, 14 Nov 2022 19:20:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443546.698140; Mon, 14 Nov 2022 19:20:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouf0j-0002zs-P4; Mon, 14 Nov 2022 19:20:49 +0000
Received: by outflank-mailman (input) for mailman id 443546;
 Mon, 14 Nov 2022 19:20:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VGCG=3O=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ouf0h-0002zm-Fn
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 19:20:47 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f26e228-6451-11ed-8fd2-01056ac49cbb;
 Mon, 14 Nov 2022 20:20:45 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 4306932009F4;
 Mon, 14 Nov 2022 14:20:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 14 Nov 2022 14:20:42 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 14:20:40 -0500 (EST)
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
X-Inumbo-ID: 6f26e228-6451-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1668453641; x=1668540041; bh=GH/JWXPsdg09JGNt1E/t/7yRp8zml7s1JpL
	dNsT07i0=; b=l4ek2n98KvwRy1A3BfKCbpoIuRMQ0ZayIbq81LVAUPwAr0MegJW
	TFH2EcLlPSnEMPlP2HRVPD7w+h6P0vBlcAM/z9FzsXYtd9majPOdJVNgxKnCWlDh
	iu+Zrl5/UVL85jX3sczJ34YxLFzVAZmt4+r7/zQiQC9zktk9+o8NJomoAbLWzGRy
	O6VcqIrrOTJXKD1R0wweQw/S4nTQBcHh0ejQ3kZbtDG+Wh0QVVYyZPB2x2PobGut
	s58+3nDJ3ikrMxmAyvZ5SdvhI7X/gfE8af4ikVm9qahUq0qbS5YtVUIghTwtmu5S
	lmwU4Jnd0eG5igv5DNVcj7EuWRyIBpvOPLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1668453641; x=1668540041; bh=GH/JWXPsdg09J
	GNt1E/t/7yRp8zml7s1JpLdNsT07i0=; b=aNJtZykfI6WDSLw5FBqPaNH98ubt1
	rixjr8H23RxZCqUmrGIqsBbs7MazMfVCno2aJBtHpKbTK8QWh9qtQdogTyZ2s1yw
	Gqo+mh7IC9gf1vzPysozfO5J6n5AB+zGgPekKxcJtZl264l9kSfozpo1NpNm7BbB
	c6yL9bqHtp47UViJ8Z+n1VeHijQx6pyjCnJMafWd4/Emx/LOZoOUHF2kbEbVC++e
	mSOqcBXTF0QQEImPD+CYKa9tNXaz8VGrlTgWxFqCjPU1Qjpix0DTEMiBc9KquA8B
	zhMrgVSD+AK9kOzjkW3MbZQwjrbNmIhnLv2sf5NjTDCFpQfHGV5iGL9yA==
X-ME-Sender: <xms:CZVyYwZ6zYu3Ht7dBCNg9wqW2mPU8TDlf4R1tRd77SHftWEuSowGcg>
    <xme:CZVyY7Z0nBuk5ZNUpC75H_Ne4Tc0RO9aspYO7ihZCGkyrr5rpQsKcKRd7iVeaeALz
    GaOedPZE1b8WA>
X-ME-Received: <xmr:CZVyY6-NobWIjbCiOn-S0VX34xKK2I0DWQi1HzflvquXOM0jn9RnvEBQ7-B-MY_1cqS9tb3OT5SFCMjAW6W7xrakfyjEWH4g5vdMJF4y6S1DWfdbU00>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgdeliecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleekhfdu
    leetleelleetteevfeefteffkeetteejheelgfegkeelgeehhfdthedvnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:CZVyY6r5Sx_xhFJ8jWwXl59tvAhMZ67BPWuY2Ce7rOyUJHY9YP4Vxw>
    <xmx:CZVyY7rNo2anSImkl6e8qHuxF-q63oVbVCx4bRWmU-Tt7ehoCfSOPg>
    <xmx:CZVyY4RQ8lIjrIhrgxAiwo8-tqDdDDBkapr0aXLJNZssDRq2_eI3gA>
    <xmx:CZVyY6XC-rWdTgtThSco2mExldV2Sk75OqN5-X4vjADy4Er7n8MJaA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH 1/2] hw/xen/xen_pt: Call default handler only if no custom one is set
Date: Mon, 14 Nov 2022 20:20:10 +0100
Message-Id: <20221114192011.1539233-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Call pci_default_write_config() in xen_pt_pci_write_config() only for
registers that do not have custom handler, and do that only after
resolving them. This is important for two reasons:
1. XenPTRegInfo has ro_mask which needs to be enforced - Xen-specific
   hooks do that on their own (especially xen_pt_*_reg_write()).
2. Not setting value early allows the hooks to see the old value too.

If it would be only about the first point, setting PCIDevice.wmask would
probably be sufficient, but given the second point, restructure those
writes.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 hw/xen/xen_pt.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 0ec7e52183..269bd26109 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -255,6 +255,7 @@ static void xen_pt_pci_write_config(PCIDevice *d, uint32_t addr,
     uint32_t find_addr = addr;
     XenPTRegInfo *reg = NULL;
     bool wp_flag = false;
+    uint32_t emul_mask = 0, write_val;
 
     if (xen_pt_pci_config_access_check(d, addr, len)) {
         return;
@@ -310,7 +311,6 @@ static void xen_pt_pci_write_config(PCIDevice *d, uint32_t addr,
     }
 
     memory_region_transaction_begin();
-    pci_default_write_config(d, addr, val, len);
 
     /* adjust the read and write value to appropriate CFC-CFF window */
     read_val <<= (addr & 3) << 3;
@@ -370,6 +370,8 @@ static void xen_pt_pci_write_config(PCIDevice *d, uint32_t addr,
                 return;
             }
 
+            emul_mask |= ( (1 << (reg->size * 8) ) - 1 ) << ((find_addr & 3) * 8);
+
             /* calculate next address to find */
             emul_len -= reg->size;
             if (emul_len > 0) {
@@ -396,6 +398,24 @@ static void xen_pt_pci_write_config(PCIDevice *d, uint32_t addr,
     /* need to shift back before passing them to xen_host_pci_set_block. */
     val >>= (addr & 3) << 3;
 
+    /* store emulated registers that didn't have specific hooks */
+    write_val = val;
+    for (index = 0; emul_mask; index += emul_len) {
+        emul_len = 0;
+        while (emul_mask & 0xff) {
+            emul_len++;
+            emul_mask >>= 8;
+        }
+        if (emul_len) {
+            uint32_t mask = ((1 << (emul_len * 8)) - 1);
+            pci_default_write_config(d, addr, write_val & mask, emul_len);
+            write_val >>= emul_len * 8;
+        } else {
+            emul_mask >>= 8;
+            write_val >>= 8;
+        }
+    }
+
     memory_region_transaction_commit();
 
 out:
-- 
2.37.3


