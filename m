Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 676B19FE2F4
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2024 07:32:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863498.1274879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tS9It-0003S3-Lg; Mon, 30 Dec 2024 06:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863498.1274879; Mon, 30 Dec 2024 06:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tS9It-0003Pg-Fn; Mon, 30 Dec 2024 06:31:03 +0000
Received: by outflank-mailman (input) for mailman id 863498;
 Mon, 30 Dec 2024 06:31:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/YRM=TX=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1tS9Is-0003PY-Ak
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2024 06:31:02 +0000
Received: from fforwardh-b1-smtp.messagingengine.com
 (fforwardh-b1-smtp.messagingengine.com [202.12.124.196])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a13c5401-c677-11ef-99a4-01e77a169b0f;
 Mon, 30 Dec 2024 07:30:59 +0100 (CET)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfforwardh.stl.internal (Postfix) with ESMTP id 34C6D1740216;
 Mon, 30 Dec 2024 01:30:57 -0500 (EST)
Received: from phl-frontend-01 ([10.202.2.160])
 by phl-compute-03.internal (MEProxy); Mon, 30 Dec 2024 01:30:57 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Dec 2024 01:30:55 -0500 (EST)
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
X-Inumbo-ID: a13c5401-c677-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1735540257; x=1735626657; bh=47jPvvLrAreNHOM7qNJpTbX/D3BrAJfjIZq
	o8xSBXtM=; b=OPtTCuxm5oHeN1+Tu4tCmEn4yWG9YooqkUqK5J2nfvceb4vA8Jm
	up5xP1rYU9w2e3tcGbfRFBSpspa6kt5lPWFP1UJmeMYy14gDeGbU0M/bJ/l4zpC/
	0e/4XYc2xkwFi3vKgs30UDDZoE11QYFhJaosdDWDenHzFSX/0k1tqn01dsheFbfc
	vUauj3T+IM3lEjlREaNImlg9331XsZDUYLpGigaKaayFYAwnmJW/Gskp46+a9Mj5
	NQ37WlGt8dDHUldXqs4129aLzM/GXHI5XgDS5OlQYsWDAbLwgBNjsT3NMWAZvrjs
	dg9Oth9P3UbQN2l9Wgmo86kDu15qka5eUHA==
X-ME-Sender: <xms:Hz5yZz9ip7Bhon94iQQFC9NPxlRuVnWCn7B4D691Xkng5mGIWk4sqg>
    <xme:Hz5yZ_uKkxVWn9ICnsqdTqUgW7uRiYo5ZZv77DTNXZizOZiGwdwZwL83ZRPVBMi7G
    sUTixsyATSA-Tl1Z_E>
X-ME-Received: <xmr:Hz5yZxAHdH8OGY9LuRx0s5NZCUsZwfQoQFlphEiZDh7lPxFwiV82KFA6fd2h1qjREqBR0uZOtETCRrg4TYVP9zyMmWZ6HfAOwxerL00C44uFZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddvhedgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfh
    rhhomhepufgvrhhgihihucfmihgsrhhikhcuoefuvghrghhihigpmfhisghrihhksegvph
    grmhdrtghomheqnecuggftrfgrthhtvghrnhepffffvdeifeeijefhheefuedvvedtheff
    jeeiveehgfettedvgedujefgudejgedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepshgrkhhisgesuggrrhhkshhtrghrrdhsihhtvgdpnhgs
    pghrtghpthhtohepudehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqd
    guvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehs
    thgvfhgrnhhordhsthgrsggvlhhlihhnihesrghmugdrtghomhdprhgtphhtthhopehssh
    htrggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjuhhlihgvnhes
    gigvnhdrohhrghdprhgtphhtthhopegsvghrthhrrghnugdrmhgrrhhquhhishesrghrmh
    drtghomhdprhgtphhtthhopehmihgthhgrlhdrohhriigvlhesrghmugdrtghomhdprhgt
    phhtthhopehvohhlohguhihmhihrpggsrggstghhuhhksegvphgrmhdrtghomhdprhgtph
    htthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthht
    oheprghnthhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthh
X-ME-Proxy: <xmx:Hz5yZ_fNYipevDDWy6w00bhgL5chi3AGcZwdXvZA6G_AXJfO-9AtEQ>
    <xmx:Hz5yZ4NgFR9l-HKJIWvyEx9UAMBgSHiGPG-XFfzpnPlW4mE0ulY_Fg>
    <xmx:Hz5yZxlmeoTepujBnbznUDUkxnK3Sz13FjlQVi_FBs0HW9Obng0ZKA>
    <xmx:Hz5yZyuAgZ_Zun7JloBdAIsHqyzBHztYElTWhZUqfo4ravuqE07Csw>
    <xmx:IT5yZ6v9SeU8JIsicLb50PJVNPfhrhUoSyDVvtaEaHQatL2doaRt4EHvmxMH>
Feedback-ID: if569265f:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v1] xen: mem_access: conditionally compile vm_event.c & monitor.c
Date: Mon, 30 Dec 2024 08:30:51 +0200
Message-Id: <20241230063051.3332332-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Extend coverage of CONFIG_MEM_ACCESS option and make the build of VM events
and monitoring support optional.
This is to reduce code size on Arm when this option isn't enabled.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/arm/Makefile      |  4 ++--
 xen/arch/arm/vsmc.c        |  3 ++-
 xen/common/Makefile        |  4 ++--
 xen/include/xen/monitor.h  |  9 +++++++++
 xen/include/xen/vm_event.h | 14 +++++++++++---
 5 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 43ab5e8f25..8903eb0bf2 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -39,7 +39,7 @@ obj-$(CONFIG_LIVEPATCH) += livepatch.o
 obj-$(CONFIG_LLC_COLORING) += llc-coloring.o
 obj-$(CONFIG_MEM_ACCESS) += mem_access.o
 obj-y += mm.o
-obj-y += monitor.o
+obj-$(CONFIG_MEM_ACCESS) += monitor.o
 obj-y += p2m.o
 obj-y += platform.o
 obj-y += platform_hypercall.o
@@ -65,7 +65,7 @@ obj-$(CONFIG_VGICV2) += vgic-v2.o
 obj-$(CONFIG_GICV3) += vgic-v3.o
 obj-$(CONFIG_HAS_ITS) += vgic-v3-its.o
 endif
-obj-y += vm_event.o
+obj-$(CONFIG_MEM_ACCESS) += vm_event.o
 obj-y += vtimer.o
 obj-$(CONFIG_SBSA_VUART_CONSOLE) += vpl011.o
 obj-y += vsmc.o
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index 62d8117a12..1c13326bdf 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -330,7 +330,8 @@ void do_trap_smc(struct cpu_user_regs *regs, const union hsr hsr)
     }
 
     /* If monitor is enabled, let it handle the call. */
-    if ( current->domain->arch.monitor.privileged_call_enabled )
+    if ( IS_ENABLED(CONFIG_MEM_ACCESS) &&
+         current->domain->arch.monitor.privileged_call_enabled )
         rc = monitor_smc();
 
     if ( rc == 1 )
diff --git a/xen/common/Makefile b/xen/common/Makefile
index cba3b32733..e3c6a857ab 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -54,7 +54,7 @@ obj-y += timer.o
 obj-$(CONFIG_TRACEBUFFER) += trace.o
 obj-y += version.o
 obj-y += virtual_region.o
-obj-y += vm_event.o
+obj-$(CONFIG_MEM_ACCESS) += vm_event.o
 obj-$(CONFIG_HAS_VMAP) += vmap.o
 obj-y += vsprintf.o
 obj-y += wait.o
@@ -68,7 +68,7 @@ obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
 obj-y += domctl.o
-obj-y += monitor.o
+obj-$(CONFIG_MEM_ACCESS) += monitor.o
 obj-y += sysctl.o
 endif
 
diff --git a/xen/include/xen/monitor.h b/xen/include/xen/monitor.h
index 713d54f7c1..f1359abb94 100644
--- a/xen/include/xen/monitor.h
+++ b/xen/include/xen/monitor.h
@@ -27,8 +27,17 @@
 struct domain;
 struct xen_domctl_monitor_op;
 
+#ifdef CONFIG_MEM_ACCESS
 int monitor_domctl(struct domain *d, struct xen_domctl_monitor_op *mop);
 void monitor_guest_request(void);
+#else
+static inline int monitor_domctl(struct domain *d,
+                                 struct xen_domctl_monitor_op *mop)
+{
+    return -EINVAL;
+}
+static inline void monitor_guest_request(void) {}
+#endif
 
 int monitor_traps(struct vcpu *v, bool sync, vm_event_request_t *req);
 
diff --git a/xen/include/xen/vm_event.h b/xen/include/xen/vm_event.h
index 9a86358b42..72e720e378 100644
--- a/xen/include/xen/vm_event.h
+++ b/xen/include/xen/vm_event.h
@@ -50,9 +50,6 @@ struct vm_event_domain
     unsigned int last_vcpu_wake_up;
 };
 
-/* Clean up on domain destruction */
-void vm_event_cleanup(struct domain *d);
-
 /* Returns whether a ring has been set up */
 bool vm_event_check_ring(struct vm_event_domain *ved);
 
@@ -88,7 +85,18 @@ void vm_event_cancel_slot(struct domain *d, struct vm_event_domain *ved);
 void vm_event_put_request(struct domain *d, struct vm_event_domain *ved,
                           vm_event_request_t *req);
 
+#ifdef CONFIG_MEM_ACCESS
+/* Clean up on domain destruction */
+void vm_event_cleanup(struct domain *d);
 int vm_event_domctl(struct domain *d, struct xen_domctl_vm_event_op *vec);
+#else
+static inline void vm_event_cleanup(struct domain *d) {}
+static inline int vm_event_domctl(struct domain *d,
+                                  struct xen_domctl_vm_event_op *vec)
+{
+    return -EINVAL;
+}
+#endif
 
 void vm_event_vcpu_pause(struct vcpu *v);
 void vm_event_vcpu_unpause(struct vcpu *v);
-- 
2.25.1


