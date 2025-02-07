Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AA7A2C5AF
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 15:38:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883729.1293644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgPU4-0003hy-RV; Fri, 07 Feb 2025 14:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883729.1293644; Fri, 07 Feb 2025 14:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgPU4-0003ft-MP; Fri, 07 Feb 2025 14:37:32 +0000
Received: by outflank-mailman (input) for mailman id 883729;
 Fri, 07 Feb 2025 14:37:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kaaw=U6=casper.srs.infradead.org=BATV+d214d3087cba0d0cd96e+7838+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1tgPU2-0003fk-Mv
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 14:37:31 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c3d8b48-e561-11ef-b3ef-695165c68f79;
 Fri, 07 Feb 2025 15:37:26 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tgPTw-00000007yYM-2RIX; Fri, 07 Feb 2025 14:37:24 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tgPTw-0000000080p-1DMh; Fri, 07 Feb 2025 14:37:24 +0000
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
X-Inumbo-ID: 0c3d8b48-e561-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=0iLbiXf0JAInaIYlB0oBe9NqYMClY9KNDWGNrILCnR4=; b=f/FhYyVX1yiyt6eD5J0U0KCy9a
	2LD5NrvXhQWV1JOoysvnvV8f2wYjXSoMrt2v+12QdyTMf+0/ZK9h5BdOAP2UnVv8KX0sl/OO0V21c
	AF67Us2MuwKMNHY9TPuPsuAuzGweux7pjcUvgxkYwy3xiuu4m6jLxsxs5NxG7Yb5Z8dfCF48kJZfS
	Byu0sSzJ3pn7327mk/QE8BD7S41aiqswNlXgcxr8ZgoYiznkNMy47BkAxVj09n2Mse2nSdqyUzkqS
	jJROFyLk4yk+QsA6pzscZbI7gQc+1SCflLvbahat4/zMLrErCEdTk7rAUhheQZrKElkpqsSEsSkMP
	lkMF4WJQ==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	kvm@vger.kernel.org,
	Sean Christopherson <seanjc@google.com>
Subject: [PATCH 1/2] i386/xen: Move KVM_XEN_HVM_CONFIG ioctl to kvm_xen_init_vcpu()
Date: Fri,  7 Feb 2025 14:37:23 +0000
Message-ID: <20250207143724.30792-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

At the time kvm_xen_init() is called, hyperv_enabled() doesn't yet work, so
the correct MSR index to use for the hypercall page isn't known.

Rather than setting it to the default and then shifting it later for the
Hyper-V case with a confusing second call to kvm_init_xen(), just do it
once in kvm_xen_init_vcpu().

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 target/i386/kvm/kvm.c     | 16 +++++---------
 target/i386/kvm/xen-emu.c | 44 ++++++++++++++++++++-------------------
 target/i386/kvm/xen-emu.h |  4 ++--
 3 files changed, 30 insertions(+), 34 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 6c749d4ee8..b4deec6255 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2129,6 +2129,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
     if (cs->kvm_state->xen_version) {
 #ifdef CONFIG_XEN_EMU
         struct kvm_cpuid_entry2 *xen_max_leaf;
+        uint32_t hypercall_msr =
+            hyperv_enabled(cpu) ? XEN_HYPERCALL_MSR_HYPERV : XEN_HYPERCALL_MSR;
 
         memcpy(signature, "XenVMMXenVMM", 12);
 
@@ -2150,13 +2152,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
         c->function = kvm_base + XEN_CPUID_HVM_MSR;
         /* Number of hypercall-transfer pages */
         c->eax = 1;
-        /* Hypercall MSR base address */
-        if (hyperv_enabled(cpu)) {
-            c->ebx = XEN_HYPERCALL_MSR_HYPERV;
-            kvm_xen_init(cs->kvm_state, c->ebx);
-        } else {
-            c->ebx = XEN_HYPERCALL_MSR;
-        }
+        c->ebx = hypercall_msr;
         c->ecx = 0;
         c->edx = 0;
 
@@ -2194,7 +2190,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
             }
         }
 
-        r = kvm_xen_init_vcpu(cs);
+        r = kvm_xen_init_vcpu(cs, hypercall_msr);
         if (r) {
             return r;
         }
@@ -3245,9 +3241,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
             error_report("kvm: Xen support only available in PC machine");
             return -ENOTSUP;
         }
-        /* hyperv_enabled() doesn't work yet. */
-        uint32_t msr = XEN_HYPERCALL_MSR;
-        ret = kvm_xen_init(s, msr);
+        ret = kvm_xen_init(s);
         if (ret < 0) {
             return ret;
         }
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index e81a245881..1144a6efcd 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -108,15 +108,11 @@ static inline int kvm_copy_to_gva(CPUState *cs, uint64_t gva, void *buf,
     return kvm_gva_rw(cs, gva, buf, sz, true);
 }
 
-int kvm_xen_init(KVMState *s, uint32_t hypercall_msr)
+int kvm_xen_init(KVMState *s)
 {
     const int required_caps = KVM_XEN_HVM_CONFIG_HYPERCALL_MSR |
         KVM_XEN_HVM_CONFIG_INTERCEPT_HCALL | KVM_XEN_HVM_CONFIG_SHARED_INFO;
-    struct kvm_xen_hvm_config cfg = {
-        .msr = hypercall_msr,
-        .flags = KVM_XEN_HVM_CONFIG_INTERCEPT_HCALL,
-    };
-    int xen_caps, ret;
+    int xen_caps;
 
     xen_caps = kvm_check_extension(s, KVM_CAP_XEN_HVM);
     if (required_caps & ~xen_caps) {
@@ -130,20 +126,6 @@ int kvm_xen_init(KVMState *s, uint32_t hypercall_msr)
             .u.xen_version = s->xen_version,
         };
         (void)kvm_vm_ioctl(s, KVM_XEN_HVM_SET_ATTR, &ha);
-
-        cfg.flags |= KVM_XEN_HVM_CONFIG_EVTCHN_SEND;
-    }
-
-    ret = kvm_vm_ioctl(s, KVM_XEN_HVM_CONFIG, &cfg);
-    if (ret < 0) {
-        error_report("kvm: Failed to enable Xen HVM support: %s",
-                     strerror(-ret));
-        return ret;
-    }
-
-    /* If called a second time, don't repeat the rest of the setup. */
-    if (s->xen_caps) {
-        return 0;
     }
 
     /*
@@ -185,10 +167,14 @@ int kvm_xen_init(KVMState *s, uint32_t hypercall_msr)
     return 0;
 }
 
-int kvm_xen_init_vcpu(CPUState *cs)
+int kvm_xen_init_vcpu(CPUState *cs, uint32_t hypercall_msr)
 {
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
+    struct kvm_xen_hvm_config cfg = {
+        .msr = hypercall_msr,
+        .flags = KVM_XEN_HVM_CONFIG_INTERCEPT_HCALL,
+    };
     int err;
 
     /*
@@ -210,6 +196,22 @@ int kvm_xen_init_vcpu(CPUState *cs)
                          strerror(-err));
             return err;
         }
+
+        cfg.flags |= KVM_XEN_HVM_CONFIG_EVTCHN_SEND;
+    }
+
+    /*
+     * This is a per-KVM setting, but hyperv_enabled() can't be used
+     * when kvm_xen_init() is called from kvm_arch_init(), so do it
+     * when the BSP is initialized.
+     */
+    if (cs->cpu_index == 0) {
+        err = kvm_vm_ioctl(cs->kvm_state, KVM_XEN_HVM_CONFIG, &cfg);
+        if (err) {
+            error_report("kvm: Failed to enable Xen HVM support: %s",
+                         strerror(-err));
+            return err;
+        }
     }
 
     env->xen_vcpu_info_gpa = INVALID_GPA;
diff --git a/target/i386/kvm/xen-emu.h b/target/i386/kvm/xen-emu.h
index fe85e0b195..7a7c72eee5 100644
--- a/target/i386/kvm/xen-emu.h
+++ b/target/i386/kvm/xen-emu.h
@@ -23,8 +23,8 @@
 
 #define XEN_VERSION(maj, min) ((maj) << 16 | (min))
 
-int kvm_xen_init(KVMState *s, uint32_t hypercall_msr);
-int kvm_xen_init_vcpu(CPUState *cs);
+int kvm_xen_init(KVMState *s);
+int kvm_xen_init_vcpu(CPUState *cs, uint32_t hypercall_msr);
 int kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit);
 int kvm_put_xen_state(CPUState *cs);
 int kvm_get_xen_state(CPUState *cs);
-- 
2.48.1


