Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3374B27B128
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 17:48:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMvNm-0001ys-Qk; Mon, 28 Sep 2020 15:48:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPfX=DF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kMvNl-0001wm-6P
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 15:48:05 +0000
X-Inumbo-ID: 26f0223e-43a7-40ce-b5d0-675d3aa6c23e
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26f0223e-43a7-40ce-b5d0-675d3aa6c23e;
 Mon, 28 Sep 2020 15:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1601308080;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j3Jzh5Q+Y8hzmXxTTFsjvfK2qP8vuEFbLWk6OxQ2nes=;
 b=aDwnhoQTBAoC4BwJpQ+9Vy5YsJMrwTU3ORAzgWfaaLtgyaoYUZMc9eEM
 jMoQTnMofihB8Fi0e8Sst5zknnbpuE+lhQbPxiCANybT2Y5gHsCcplP6c
 kGlDcru+TldxiCaI3KQrwoPqgiRu4V+WsbYcTMHEE/HtuXPdKFF5TEZFF E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: YfwCe91EHJV6c663qkgqu4a8J48Of6RHMJ3ubde2PvE9IjAgMTe5o6t7VTR4JLeAth+5/OtDVD
 uk4l87i8r7GUPDrbltkrL4RcUcOqUsmZYh4qZbZs/CFJKXAQ8/QRoOckH8koymPcTcGwq01txk
 yVMlD/1MBO/bVWpiy6LDDdALEcBW8TW0NrHO2bGKGY2N4izwT7qPo5j6/zS3AWXveFFntdofqy
 ed3nsZWBp8nvMqQ6IfYWKEfgaddFMJy6Wu+MVHzB6gvAzZbsYeiLhc7okSOwztDN2sii9GEBGy
 nOA=
X-SBRS: None
X-MesageID: 27776674
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,313,1596513600"; d="scan'208";a="27776674"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
 <george.dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: [PATCH] xen/x86: Fix memory leak in vcpu_create() error path
Date: Mon, 28 Sep 2020 16:47:41 +0100
Message-ID: <20200928154741.2366-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Various paths in vcpu_create() end up calling paging_update_paging_modes(),
which eventually allocate a monitor pagetable if one doesn't exist.

However, an error in vcpu_create() results in the vcpu being cleaned up
locally, and not put onto the domain's vcpu list.  Therefore, the monitor
table is not freed by {hap,shadow}_teardown()'s loop.  This is caught by
assertions later that we've successfully freed the entire hap/shadow memory
pool.

The per-vcpu loops in domain teardown logic is conceptually wrong, but exist
due to insufficient existing structure in the existing logic.

Break paging_vcpu_teardown() out of paging_teardown(), with mirrored breakouts
in the hap/shadow code, and use it from arch_vcpu_create()'s error path.  This
fixes the memory leak.

The new {hap,shadow}_vcpu_teardown() must be idempotent, and are written to be
as tolerable as possible, with the minimum number of safety checks possible.
In particular, drop the mfn_valid() check - if junk is in these fields, then
Xen is going to explode anyway.

Reported-by: Michał Leszczyński <michal.leszczynski@cert.pl>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: George Dunlap <george.dunlap@eu.citrix.com>
CC: Tim Deegan <tim@xen.org>
CC: Michał Leszczyński <michal.leszczynski@cert.pl>

This is a minimal patch which ought to be safe to backport.  The whole cleanup
infrastructure is a mess.
---
 xen/arch/x86/domain.c           |  1 +
 xen/arch/x86/mm/hap/hap.c       | 39 ++++++++++++++++++-------------
 xen/arch/x86/mm/paging.c        |  8 +++++++
 xen/arch/x86/mm/shadow/common.c | 52 ++++++++++++++++++++++++-----------------
 xen/include/asm-x86/hap.h       |  1 +
 xen/include/asm-x86/paging.h    |  3 ++-
 xen/include/asm-x86/shadow.h    |  3 ++-
 7 files changed, 67 insertions(+), 40 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index e8e91cf080..b8f5b1f5b4 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -603,6 +603,7 @@ int arch_vcpu_create(struct vcpu *v)
     return rc;
 
  fail:
+    paging_vcpu_teardown(v);
     vcpu_destroy_fpu(v);
     xfree(v->arch.msrs);
     v->arch.msrs = NULL;
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 4eedd1a995..737821a166 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -563,30 +563,37 @@ void hap_final_teardown(struct domain *d)
     paging_unlock(d);
 }
 
+void hap_vcpu_teardown(struct vcpu *v)
+{
+    struct domain *d = v->domain;
+    mfn_t mfn;
+
+    paging_lock(d);
+
+    if ( !paging_mode_hap(d) || !v->arch.paging.mode )
+        goto out;
+
+    mfn = pagetable_get_mfn(v->arch.hvm.monitor_table);
+    if ( mfn_x(mfn) )
+        hap_destroy_monitor_table(v, mfn);
+    v->arch.hvm.monitor_table = pagetable_null();
+
+ out:
+    paging_unlock(d);
+}
+
 void hap_teardown(struct domain *d, bool *preempted)
 {
     struct vcpu *v;
-    mfn_t mfn;
 
     ASSERT(d->is_dying);
     ASSERT(d != current->domain);
 
-    paging_lock(d); /* Keep various asserts happy */
+    /* TODO - Remove when the teardown path is better structured. */
+    for_each_vcpu ( d, v )
+        hap_vcpu_teardown(v);
 
-    if ( paging_mode_enabled(d) )
-    {
-        /* release the monitor table held by each vcpu */
-        for_each_vcpu ( d, v )
-        {
-            if ( paging_get_hostmode(v) && paging_mode_external(d) )
-            {
-                mfn = pagetable_get_mfn(v->arch.hvm.monitor_table);
-                if ( mfn_valid(mfn) && (mfn_x(mfn) != 0) )
-                    hap_destroy_monitor_table(v, mfn);
-                v->arch.hvm.monitor_table = pagetable_null();
-            }
-        }
-    }
+    paging_lock(d); /* Keep various asserts happy */
 
     if ( d->arch.paging.hap.total_pages != 0 )
     {
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index 695372783d..d5e967fcd5 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -794,6 +794,14 @@ long paging_domctl_continuation(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 }
 #endif /* CONFIG_PV_SHIM_EXCLUSIVE */
 
+void paging_vcpu_teardown(struct vcpu *v)
+{
+    if ( hap_enabled(v->domain) )
+        hap_vcpu_teardown(v);
+    else
+        shadow_vcpu_teardown(v);
+}
+
 /* Call when destroying a domain */
 int paging_teardown(struct domain *d)
 {
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index 7c7204fd34..ea51068530 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -2775,6 +2775,32 @@ int shadow_enable(struct domain *d, u32 mode)
     return rv;
 }
 
+void shadow_vcpu_teardown(struct vcpu *v)
+{
+    struct domain *d = v->domain;
+
+    paging_lock(d);
+
+    if ( !paging_mode_shadow(d) || !v->arch.paging.mode )
+        goto out;
+
+    v->arch.paging.mode->shadow.detach_old_tables(v);
+#ifdef CONFIG_HVM
+    if ( shadow_mode_external(d) )
+    {
+        mfn_t mfn = pagetable_get_mfn(v->arch.hvm.monitor_table);
+
+        if ( mfn_x(mfn) )
+            v->arch.paging.mode->shadow.destroy_monitor_table(v, mfn);
+
+        v->arch.hvm.monitor_table = pagetable_null();
+    }
+#endif
+
+ out:
+    paging_unlock(d);
+}
+
 void shadow_teardown(struct domain *d, bool *preempted)
 /* Destroy the shadow pagetables of this domain and free its shadow memory.
  * Should only be called for dying domains. */
@@ -2785,29 +2811,11 @@ void shadow_teardown(struct domain *d, bool *preempted)
     ASSERT(d->is_dying);
     ASSERT(d != current->domain);
 
-    paging_lock(d);
-
-    if ( shadow_mode_enabled(d) )
-    {
-        /* Release the shadow and monitor tables held by each vcpu */
-        for_each_vcpu(d, v)
-        {
-            if ( v->arch.paging.mode )
-            {
-                v->arch.paging.mode->shadow.detach_old_tables(v);
-#ifdef CONFIG_HVM
-                if ( shadow_mode_external(d) )
-                {
-                    mfn_t mfn = pagetable_get_mfn(v->arch.hvm.monitor_table);
+    /* TODO - Remove when the teardown path is better structured. */
+    for_each_vcpu ( d, v )
+        shadow_vcpu_teardown(v);
 
-                    if ( mfn_valid(mfn) && (mfn_x(mfn) != 0) )
-                        v->arch.paging.mode->shadow.destroy_monitor_table(v, mfn);
-                    v->arch.hvm.monitor_table = pagetable_null();
-                }
-#endif /* CONFIG_HVM */
-            }
-        }
-    }
+    paging_lock(d);
 
 #if (SHADOW_OPTIMIZATIONS & (SHOPT_VIRTUAL_TLB|SHOPT_OUT_OF_SYNC))
     /* Free the virtual-TLB array attached to each vcpu */
diff --git a/xen/include/asm-x86/hap.h b/xen/include/asm-x86/hap.h
index d489df3812..90dece29de 100644
--- a/xen/include/asm-x86/hap.h
+++ b/xen/include/asm-x86/hap.h
@@ -36,6 +36,7 @@ int   hap_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
 int   hap_enable(struct domain *d, u32 mode);
 void  hap_final_teardown(struct domain *d);
+void  hap_vcpu_teardown(struct vcpu *v);
 void  hap_teardown(struct domain *d, bool *preempted);
 void  hap_vcpu_init(struct vcpu *v);
 int   hap_track_dirty_vram(struct domain *d,
diff --git a/xen/include/asm-x86/paging.h b/xen/include/asm-x86/paging.h
index b803efa7b5..6b8ed80c64 100644
--- a/xen/include/asm-x86/paging.h
+++ b/xen/include/asm-x86/paging.h
@@ -234,7 +234,8 @@ int paging_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
 /* Helper hypercall for dealing with continuations. */
 long paging_domctl_continuation(XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
 
-/* Call when destroying a domain */
+/* Call when destroying a vcpu/domain */
+void paging_vcpu_teardown(struct vcpu *v);
 int paging_teardown(struct domain *d);
 
 /* Call once all of the references to the domain have gone away */
diff --git a/xen/include/asm-x86/shadow.h b/xen/include/asm-x86/shadow.h
index 76e47f257f..29a86ed78e 100644
--- a/xen/include/asm-x86/shadow.h
+++ b/xen/include/asm-x86/shadow.h
@@ -74,7 +74,8 @@ int shadow_domctl(struct domain *d,
                   struct xen_domctl_shadow_op *sc,
                   XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
 
-/* Call when destroying a domain */
+/* Call when destroying a vcpu/domain */
+void shadow_vcpu_teardown(struct vcpu *v);
 void shadow_teardown(struct domain *d, bool *preempted);
 
 /* Call once all of the references to the domain have gone away */
-- 
2.11.0


