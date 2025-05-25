Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E28AC3523
	for <lists+xen-devel@lfdr.de>; Sun, 25 May 2025 16:20:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997155.1378153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJCD6-0006TR-KT; Sun, 25 May 2025 14:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997155.1378153; Sun, 25 May 2025 14:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJCD6-0006Qj-Gc; Sun, 25 May 2025 14:20:20 +0000
Received: by outflank-mailman (input) for mailman id 997155;
 Sun, 25 May 2025 14:20:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3gIk=YJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uJCD5-0005ip-7H
 for xen-devel@lists.xenproject.org; Sun, 25 May 2025 14:20:19 +0000
Received: from fhigh-b6-smtp.messagingengine.com
 (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5dd335ca-3973-11f0-a2fb-13f23c93f187;
 Sun, 25 May 2025 16:20:11 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 2CB1325400E4;
 Sun, 25 May 2025 10:20:10 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Sun, 25 May 2025 10:20:10 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 25 May 2025 10:20:07 -0400 (EDT)
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
X-Inumbo-ID: 5dd335ca-3973-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1748182810; x=1748269210; bh=mWRLy4XWSq
	kSuh6T5T7Y3St8a2sE7Qw37t+DvXZ+raM=; b=Da3ocC0z9Oj3C3eZsJM8FFZPuo
	kE6bc1tOLyO/0duJYj1Id7jy5QyMJd9Z5gEL9iDx9aAfHt2a1Z77Pb5bIuXMgf1x
	hX49WmOgmIxVLiat9nAdwCjAZnnyWrk9C6KiV+qk6z9+Lq+9ejiB5OK3KCVvqCMD
	wG6SScj5crRiFKkz/HOx6SELcFxkLc6AKNSWO6YPyBRQTJwtj6bUuvyWjBmC8hH0
	ZvST6VCHWOanhCqBdGwdCRvDvm9TcJPT9bBXlmZUrPYV6kPOh8w1w1fb4+ulEV4P
	f5G5UujJr2ELQ0E7PWWebuMXEdvMIjqCC9jX1P0HBkclvagvJDr4heIeWFUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1748182810; x=
	1748269210; bh=mWRLy4XWSqkSuh6T5T7Y3St8a2sE7Qw37t+DvXZ+raM=; b=m
	r1wNI8FH5Td8UIM+Lxd6D01f9iNgGooYb1lpw4FZ9rrQdiM7aqB8W0LqogNfPaaD
	n3ylZGqgHAICqKjIRr1fr+V4OPi6c8A4eUMH9hdm7zchfyWd8NyWdQZTnr5MaY3H
	V+zuqhW3da+qZnzaqqf/KTg55kX5qLQqjjbCZ29cLcO3pRQcZ1Z7ysWcSrwoP16c
	+L5JOFEDQRKaVbNC0KeLgsE5aZ3AI16UBkKPanBbGz+N4ue2g79khPgLy2j6lxfW
	1IRvtAexWAyUilqw2x8Gm1HLQAuUfU0+Rr1rCfn2CaVwcsPSh1pQJWSyeZ4Pz6F1
	cpTvSMkwBdCEoXBQRwzfg==
X-ME-Sender: <xms:GSczaI0qRFRTdbbdUkTNCpyaNbz5IaI71TQmaBgqmzcM6fYZSSJXFw>
    <xme:GSczaDHoMufvhGJhYeNXcdR8j7xxVgROjMT-i69sI9FpSGJJWqb9EDPuaMgYh8XC7
    1-xiK-TUwm6iQ>
X-ME-Received: <xmr:GSczaA471a__RXernTs_eAikObn8Hf9dm_OvZ4qUy0Ixja8nAlm9ksoNBBaomBRy_dO4n8t5bmTgkg0b3bXgbvgsdggyAt-vtdDQgrX-PCnQCnn-hYAp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddugeekfeculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffo
    jghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofi
    hskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhn
    ghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeuudehgfdvfeehhedujeehfe
    duveeugefhkefhheelgeevudetueeiudfggfffnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvth
    hhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphho
    uhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtg
    htrdhorhhgpdhrtghpthhtohepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhn
    ghhslhgrsgdrtghomhdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhmpd
    hrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgt
    phhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopegrnh
    hthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepmhhitghh
    rghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghnrd
    horhhgpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:GSczaB0lpEowz-mwFzIFl8sEHzyV-qS5tTefS3E5-QDgzFObHPJYyQ>
    <xmx:GSczaLGfO9p6gLmoVtlArah-bQcDo_TsFYtIu21OnZwJ2yXIgTkG3g>
    <xmx:GSczaK-g7rJsWGVq2fwPEPAYqBaxRoVHNFTQwGKzDncUBEogOoQnWg>
    <xmx:GSczaAk26emD_A0FOn5kaUZjL1MDIeRawcFOmW1MyU37ozwiB-vTZQ>
    <xmx:GiczaNRUYKCWvYsWuAXLNtbcBlmfFPDfaytjMKloYqHubAL47TAKnFca>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 1/5] console: add relocation hook
Date: Sun, 25 May 2025 16:15:42 +0200
Message-ID: <4f1889dc03ec4aa2cc0cd2bd14523a2c6f670bdb.1748182535.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.defc562b917978814c8359bbd04f1dadba33fb77.1748182535.git-series.marmarek@invisiblethingslab.com>
References: <cover.defc562b917978814c8359bbd04f1dadba33fb77.1748182535.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The XHCI console uses DMA, so it's sensitive for relocating its
structures, even if their virtual addresses remain the same. Add a new
console initialization hooks called before+after Xen relocation.
Relocation happens conditionally, but call the hooks unconditionally, as
that simplifies logic in the driver (and if needed, the driver can
easily detect if relocation happened anyway). Thanks to that, a driver
may use it to finalize init steps that need physical address but can be
delayed - this way, it doesn't need un-doing on relocation.
The most important part is the post-relocation hook, but add also
pre-relocation one to simplify clean handling of in-flight data.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
I considered more limited scope - calling them just around move_xen()
(or even from within that function), but that complicates
iommu_add_extra_reserved_device_memory() call - see the next patch.
As for the post-relocation hook, I have considered a parameter with info
whether the relocation actually happened, but driver can figure it out
on its own anyway.
---
 xen/arch/x86/setup.c       |  8 ++++++++
 xen/drivers/char/console.c | 10 ++++++++++
 xen/drivers/char/serial.c  | 18 ++++++++++++++++++
 xen/include/xen/console.h  |  2 ++
 xen/include/xen/serial.h   |  6 ++++++
 5 files changed, 44 insertions(+)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 25189541244d..3ef819a252e4 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1481,6 +1481,8 @@ void asmlinkage __init noreturn __start_xen(void)
         highmem_start &= ~((1UL << L3_PAGETABLE_SHIFT) - 1);
 #endif
 
+    console_init_pre_relocate();
+
     /*
      * Iterate backwards over all superpage-aligned RAM regions.
      *
@@ -1606,6 +1608,12 @@ void asmlinkage __init noreturn __start_xen(void)
     if ( !xen_phys_start )
         panic("Not enough memory to relocate Xen\n");
 
+    /*
+     * Notify console drivers about relocation, before reusing old Xen's
+     * memory.
+     */
+    console_init_post_relocate();
+
     /* FIXME: Putting a hole in .bss would shatter the large page mapping. */
     if ( using_2M_mapping() )
         efi_boot_mem_unused(NULL, NULL);
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index c15987f5bbe2..12898b684b5e 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1120,6 +1120,16 @@ void __init console_init_ring(void)
     printk("Allocated console ring of %u KiB.\n", opt_conring_size >> 10);
 }
 
+void __init console_init_pre_relocate(void)
+{
+    serial_init_pre_relocate();
+}
+
+void __init console_init_post_relocate(void)
+{
+    serial_init_post_relocate();
+}
+
 void __init console_init_irq(void)
 {
     serial_init_irq();
diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
index 591a00900869..95f7410afa9c 100644
--- a/xen/drivers/char/serial.c
+++ b/xen/drivers/char/serial.c
@@ -447,6 +447,24 @@ void __init serial_init_preirq(void)
             com[i].driver->init_preirq(&com[i]);
 }
 
+void __init serial_init_pre_relocate(void)
+{
+    unsigned int i;
+
+    for ( i = 0; i < ARRAY_SIZE(com); i++ )
+        if ( com[i].driver && com[i].driver->init_pre_relocate )
+            com[i].driver->init_pre_relocate(&com[i]);
+}
+
+void __init serial_init_post_relocate(void)
+{
+    unsigned int i;
+
+    for ( i = 0; i < ARRAY_SIZE(com); i++ )
+        if ( com[i].driver && com[i].driver->init_post_relocate )
+            com[i].driver->init_post_relocate(&com[i]);
+}
+
 void __init serial_init_irq(void)
 {
     unsigned int i;
diff --git a/xen/include/xen/console.h b/xen/include/xen/console.h
index 83cbc9fbdafc..d563777ad9e2 100644
--- a/xen/include/xen/console.h
+++ b/xen/include/xen/console.h
@@ -18,6 +18,8 @@ void console_init_preirq(void);
 void console_init_ring(void);
 void console_init_irq(void);
 void console_init_postirq(void);
+void console_init_pre_relocate(void);
+void console_init_post_relocate(void);
 void console_endboot(void);
 int console_has(const char *device);
 
diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
index 63a82b032dde..1ee3df2624fb 100644
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -64,6 +64,9 @@ struct uart_driver {
     void (*init_preirq)(struct serial_port *port);
     void (*init_irq)(struct serial_port *port);
     void (*init_postirq)(struct serial_port *port);
+    /* Hooks around optional Xen relocation. */
+    void (*init_pre_relocate)(struct serial_port *port);
+    void (*init_post_relocate)(struct serial_port *port);
     /* Hook to clean up after Xen bootstrap (before domain 0 runs). */
     void (*endboot)(struct serial_port *port);
     /* Driver suspend/resume. */
@@ -103,6 +106,9 @@ struct uart_driver {
 void serial_init_preirq(void);
 void serial_init_irq(void);
 void serial_init_postirq(void);
+/* Notify drivers about Xen relocation (relevant for those using DMA). */
+void serial_init_pre_relocate(void);
+void serial_init_post_relocate(void);
 
 /* Clean-up hook before domain 0 runs. */
 void serial_endboot(void);
-- 
git-series 0.9.1

