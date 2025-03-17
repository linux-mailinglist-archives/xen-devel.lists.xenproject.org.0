Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B799A64356
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 08:20:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916187.1321322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu4kz-0000zR-CX; Mon, 17 Mar 2025 07:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916187.1321322; Mon, 17 Mar 2025 07:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu4kz-0000xL-9u; Mon, 17 Mar 2025 07:19:29 +0000
Received: by outflank-mailman (input) for mailman id 916187;
 Mon, 17 Mar 2025 07:19:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EnY3=WE=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1tu4ky-0000xF-HO
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 07:19:28 +0000
Received: from fforwardh-b4-smtp.messagingengine.com
 (fforwardh-b4-smtp.messagingengine.com [202.12.124.199])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27cce7e0-0300-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 08:19:26 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfforwardh.stl.internal (Postfix) with ESMTP id 6698E174029F;
 Mon, 17 Mar 2025 03:19:24 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
 by phl-compute-06.internal (MEProxy); Mon, 17 Mar 2025 03:19:24 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Mar 2025 03:19:23 -0400 (EDT)
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
X-Inumbo-ID: 27cce7e0-0300-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1742195964; x=1742282364; bh=sPu8+6eEudw5U5gDAhN6T1GTyZngizfhufi
	p1TCOUzs=; b=a2ci3NCdNda5KQ9iqNol4v8JSB82yzvXdbM6bYe1R9AOZnzX/za
	rhWXp5T0JDx19eww78N8/GqWWddK3jD5ZMQVW7EoWeXoiq2DLLRymvxft9pghsA3
	eMomQZyK8Sm9KSkPBkNzAdAwZwneN5B7eN3zifkh+f2YRKOKV/GCr1GTa0jCIL/h
	i2ugKoXjgBg71H8hEcWfmzHlHd3RYk3FDo7whaZGszJtcEqzfMHVvHy+g+dD26Ff
	ygt4f8bvlm1BxkIC4c70Nr2ulVpuiAdoTQy/xUhanA86bxyi76hplkNZASUlZcF5
	YKZrWc/bANHBmNT19yQpQTWLMYh9JmBNtpQ==
X-ME-Sender: <xms:-8zXZyW6yt1YmjLCsLWlFWiME6XBvRAqfYN48lP0v4wS4o7IL1-V_g>
    <xme:-8zXZ-mboIrjrFukEFmGU5IxJ1V-ByuDikprwKU4yMKkfmDMol5Kk0xSZbsPLAxtb
    BHY4nAGJAnKtXfKRbs>
X-ME-Received: <xmr:-8zXZ2YQohJJ6Cf2h3GaqYBVOPnkuTK0jndMjPkUVa_XodFFkvmkjxKboT1POuReBjR9oL6xGMfsYP23bHWh6Or-76lQFT-uvwUTh4ZY2rFaYQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeekledtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttden
    ucfhrhhomhepufgvrhhgihihucfmihgsrhhikhcuoefuvghrghhihigpmfhisghrihhkse
    gvphgrmhdrtghomheqnecuggftrfgrthhtvghrnhepffffvdeifeeijefhheefuedvvedt
    heffjeeiveehgfettedvgedujefgudejgedvnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepshgrkhhisgesuggrrhhkshhtrghrrdhsihhtvgdp
    nhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnh
    dquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohep
    shgvrhhgihihpghkihgsrhhikhesvghprghmrdgtohhmpdhrtghpthhtohepjhgsvghulh
    hitghhsehsuhhsvgdrtghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfees
    tghithhrihigrdgtohhmpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrd
    gtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:-8zXZ5ULqGBkjZlmgWbbYMSWEUEIdTzRuxfeZOyNqlyczIZEu4oWzg>
    <xmx:-8zXZ8mQlEHLvghzYWCpLITAFj9FAF1csJIzJfq_sM7sOOrdjpeg0g>
    <xmx:-8zXZ-fXiK7uCkMZMUO2ibIsOiJdbizB4XJjjBS9cTEoNJWJojV91A>
    <xmx:-8zXZ-EIzw_2y5BUrN7HetKRsI9qd8ySPufB6sLVgiv_GA7Py0Y9nA>
    <xmx:-8zXZ6m6PRNrKIWRUcsQydINTp8ZbjbZu2PAnvTAxdBcyXlBOpGI-A>
    <xmx:_MzXZ7u4wiOIgtiZm_DLoUcezyxBYLg6u0J_aLSmr6WXdVuUqyMU03aWU8sb>
Feedback-ID: i5dfb0d4a:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1] x86: make Viridian support optional
Date: Mon, 17 Mar 2025 09:19:19 +0200
Message-Id: <20250317071919.3766976-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add config option HVM_VIRIDIAN that covers viridian code within HVM.
Calls to viridian functions guarded by is_viridian_domain() and related macros.
Having this option may be beneficial by reducing code footprint for systems
that are not using Hyper-V.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/Kconfig                  |  5 +++++
 xen/arch/x86/hvm/Makefile             |  2 +-
 xen/arch/x86/hvm/hvm.c                | 27 ++++++++++++++++++---------
 xen/arch/x86/hvm/vlapic.c             | 11 +++++++----
 xen/arch/x86/include/asm/hvm/domain.h |  4 ++--
 xen/arch/x86/include/asm/hvm/hvm.h    |  3 ++-
 xen/arch/x86/include/asm/hvm/vcpu.h   |  3 ++-
 7 files changed, 37 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 6e41bc0fb4..34f9b79d98 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -348,6 +348,11 @@ config HYPERV_GUEST
 
 endif
 
+config HVM_VIRIDIAN
+	bool "Viridian enlightenments support" if EXPERT
+	depends on HVM
+	default y
+
 config MEM_PAGING
 	bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
 	depends on HVM
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 4c1fa5c6c2..6cc2e74fc4 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -1,6 +1,6 @@
 obj-$(CONFIG_AMD_SVM) += svm/
 obj-$(CONFIG_INTEL_VMX) += vmx/
-obj-y += viridian/
+obj-$(CONFIG_HVM_VIRIDIAN) += viridian/
 
 obj-y += asid.o
 obj-y += dm.o
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 2f31180b6f..4f51d0f66c 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -695,9 +695,12 @@ int hvm_domain_initialise(struct domain *d,
     if ( hvm_tsc_scaling_supported )
         d->arch.hvm.tsc_scaling_ratio = hvm_default_tsc_scaling_ratio;
 
-    rc = viridian_domain_init(d);
-    if ( rc )
-        goto fail2;
+    if ( is_viridian_domain(d) )
+    {
+        rc = viridian_domain_init(d);
+        if ( rc )
+            goto fail2;
+    }
 
     rc = alternative_call(hvm_funcs.domain_initialise, d);
     if ( rc != 0 )
@@ -733,7 +736,8 @@ void hvm_domain_relinquish_resources(struct domain *d)
     if ( hvm_funcs.nhvm_domain_relinquish_resources )
         alternative_vcall(hvm_funcs.nhvm_domain_relinquish_resources, d);
 
-    viridian_domain_deinit(d);
+    if ( is_viridian_domain(d) )
+        viridian_domain_deinit(d);
 
     ioreq_server_destroy_all(d);
 
@@ -1637,9 +1641,12 @@ int hvm_vcpu_initialise(struct vcpu *v)
          && (rc = nestedhvm_vcpu_initialise(v)) < 0 ) /* teardown: nestedhvm_vcpu_destroy */
         goto fail5;
 
-    rc = viridian_vcpu_init(v);
-    if ( rc )
-        goto fail6;
+    if ( is_viridian_domain(v->domain) )
+    {
+        rc = viridian_vcpu_init(v);
+        if ( rc )
+            goto fail6;
+    }
 
     rc = ioreq_server_add_vcpu_all(d, v);
     if ( rc != 0 )
@@ -1669,13 +1676,15 @@ int hvm_vcpu_initialise(struct vcpu *v)
  fail2:
     hvm_vcpu_cacheattr_destroy(v);
  fail1:
-    viridian_vcpu_deinit(v);
+    if ( is_viridian_domain(v->domain) )
+        viridian_vcpu_deinit(v);
     return rc;
 }
 
 void hvm_vcpu_destroy(struct vcpu *v)
 {
-    viridian_vcpu_deinit(v);
+    if ( is_viridian_domain(v->domain) )
+        viridian_vcpu_deinit(v);
 
     ioreq_server_remove_vcpu_all(v->domain, v);
 
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 065b2aab5b..b8236dade0 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -426,7 +426,8 @@ void vlapic_EOI_set(struct vlapic *vlapic)
      * priority vector and then recurse to handle the lower priority
      * vector.
      */
-    bool missed_eoi = viridian_apic_assist_completed(v);
+    bool missed_eoi = has_viridian_apic_assist(v->domain) ?
+                          viridian_apic_assist_completed(v) : false;
     int vector;
 
  again:
@@ -442,7 +443,7 @@ void vlapic_EOI_set(struct vlapic *vlapic)
      * NOTE: It is harmless to call viridian_apic_assist_clear() on a
      *       recursion, even though it is not necessary.
      */
-    if ( !missed_eoi )
+    if ( has_viridian_apic_assist(v->domain) && !missed_eoi )
         viridian_apic_assist_clear(v);
 
     vlapic_clear_vector(vector, &vlapic->regs->data[APIC_ISR]);
@@ -1360,7 +1361,8 @@ int vlapic_has_pending_irq(struct vcpu *v)
      * If so, we need to emulate the EOI here before comparing ISR
      * with IRR.
      */
-    if ( viridian_apic_assist_completed(v) )
+    if ( has_viridian_apic_assist(v->domain) &&
+         viridian_apic_assist_completed(v) )
         vlapic_EOI_set(vlapic);
 
     isr = vlapic_find_highest_isr(vlapic);
@@ -1373,7 +1375,8 @@ int vlapic_has_pending_irq(struct vcpu *v)
     if ( isr >= 0 &&
          (irr & 0xf0) <= (isr & 0xf0) )
     {
-        viridian_apic_assist_clear(v);
+        if ( has_viridian_apic_assist(v->domain) )
+            viridian_apic_assist_clear(v);
         return -1;
     }
 
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
index 333501d5f2..bc52504cdd 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -110,9 +110,9 @@ struct hvm_domain {
 
     /* hypervisor intercepted msix table */
     struct list_head       msixtbl_list;
-
+#ifdef CONFIG_HVM_VIRIDIAN
     struct viridian_domain *viridian;
-
+#endif
     /*
      * TSC value that VCPUs use to calculate their tsc_offset value.
      * Used during initialization and save/restore.
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 963e820113..1bbeece117 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -507,7 +507,8 @@ hvm_get_cpl(struct vcpu *v)
     (has_hvm_params(d) ? (d)->arch.hvm.params[HVM_PARAM_VIRIDIAN] : 0)
 
 #define is_viridian_domain(d) \
-    (is_hvm_domain(d) && (viridian_feature_mask(d) & HVMPV_base_freq))
+    (is_hvm_domain(d) && IS_ENABLED(CONFIG_HVM_VIRIDIAN) && \
+                         (viridian_feature_mask(d) & HVMPV_base_freq))
 
 #define is_viridian_vcpu(v) \
     is_viridian_domain((v)->domain)
diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h b/xen/arch/x86/include/asm/hvm/vcpu.h
index 196fed6d5d..bac35ec47a 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -171,8 +171,9 @@ struct hvm_vcpu {
 
     /* Pending hw/sw interrupt (.vector = -1 means nothing pending). */
     struct x86_event     inject_event;
-
+#ifdef CONFIG_HVM_VIRIDIAN
     struct viridian_vcpu *viridian;
+#endif
 };
 
 #endif /* __ASM_X86_HVM_VCPU_H__ */
-- 
2.25.1


