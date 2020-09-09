Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB93C262CC0
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 12:00:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFwtH-0008Su-7K; Wed, 09 Sep 2020 09:59:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wApk=CS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kFwtE-0008SC-UJ
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 09:59:44 +0000
X-Inumbo-ID: 511b9044-14ea-4679-95f9-078476ed94bd
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 511b9044-14ea-4679-95f9-078476ed94bd;
 Wed, 09 Sep 2020 09:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599645579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1PbLj0WTQtCpCIy8e73E6RN9TS0bcCD9OLyImnkdXGA=;
 b=MBEJt7Ka2edXD0mlM5NKPzyMjuYTxbBsl7BgwcHtS7YRqL2qMC/mqZII
 /zRAIxUVzucoNuZEOSxxAHgVTQg5BUcj+G81A9fw3ON+wk6EETOSnmopD
 IbjeDyoRoVP5rLZJvaQJgnGCaSnZ7/7M9qiYvpxynIVr0XftouuXdgFzH k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: rJfRYUrXr9To57PGQMata2dqgBUpOMRCfgQaokncr5XhphXaBatV3Kk3Ezwx7vp+dkvf8GI87w
 7piYKmt/OXOrIznziCKhVbQVv3PVc+r5i089fWgzsiYzuQyUcoXlNuDDJeWj5pTpjemSlnvrPx
 azy6lx+S+UfTF4d0oinafiAmLgcIu3De/hGkl4+gmMXro3mImVjxrKmn6Rprf3f4tPWEvDUQqS
 uTOocXc5KIR+1FSYnQw47AI+ZAZQ+ICnB5wXL+9Wyp7xp6XG7l8dnAAOFG5GiMJUqeCC1B5RP+
 h/k=
X-SBRS: 2.7
X-MesageID: 26254229
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,409,1592884800"; d="scan'208";a="26254229"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
 <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 1/5] x86/asm: Rename FS/GS base helpers
Date: Wed, 9 Sep 2020 10:59:16 +0100
Message-ID: <20200909095920.25495-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200909095920.25495-1-andrew.cooper3@citrix.com>
References: <20200909095920.25495-1-andrew.cooper3@citrix.com>
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

They are currently named after the FSGSBASE instructions, but are not thin
wrappers around said instructions, and therefore do not accurately reflect the
logic they perform, especially when it comes to functioning safely in non
FSGSBASE context.

Rename them to {read,write}_{fs,gs}_base() to avoid confusion.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
---
 xen/arch/x86/domain.c          | 10 +++++-----
 xen/arch/x86/hvm/vmx/vmx.c     |  8 ++++----
 xen/arch/x86/pv/domain.c       |  2 +-
 xen/arch/x86/pv/emul-priv-op.c | 14 +++++++-------
 xen/arch/x86/x86_64/mm.c       |  8 ++++----
 xen/arch/x86/x86_64/traps.c    |  6 +++---
 xen/include/asm-x86/msr.h      | 12 ++++++------
 7 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index e8e91cf080..2271bee36a 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1581,9 +1581,9 @@ static void load_segments(struct vcpu *n)
 
     if ( !fs_gs_done && !compat )
     {
-        wrfsbase(n->arch.pv.fs_base);
-        wrgsshadow(n->arch.pv.gs_base_kernel);
-        wrgsbase(n->arch.pv.gs_base_user);
+        write_fs_base(n->arch.pv.fs_base);
+        write_gs_shadow(n->arch.pv.gs_base_kernel);
+        write_gs_base(n->arch.pv.gs_base_user);
 
         /* If in kernel mode then switch the GS bases around. */
         if ( (n->arch.flags & TF_kernel_mode) )
@@ -1710,9 +1710,9 @@ static void save_segments(struct vcpu *v)
 
     if ( !is_pv_32bit_vcpu(v) )
     {
-        unsigned long gs_base = rdgsbase();
+        unsigned long gs_base = read_gs_base();
 
-        v->arch.pv.fs_base = rdfsbase();
+        v->arch.pv.fs_base = read_fs_base();
         if ( v->arch.flags & TF_kernel_mode )
             v->arch.pv.gs_base_kernel = gs_base;
         else
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index c4b40bf3cb..d26e102970 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -512,12 +512,12 @@ static void vmx_save_guest_msrs(struct vcpu *v)
      * We cannot cache SHADOW_GS_BASE while the VCPU runs, as it can
      * be updated at any time via SWAPGS, which we cannot trap.
      */
-    v->arch.hvm.vmx.shadow_gs = rdgsshadow();
+    v->arch.hvm.vmx.shadow_gs = read_gs_shadow();
 }
 
 static void vmx_restore_guest_msrs(struct vcpu *v)
 {
-    wrgsshadow(v->arch.hvm.vmx.shadow_gs);
+    write_gs_shadow(v->arch.hvm.vmx.shadow_gs);
     wrmsrl(MSR_STAR,           v->arch.hvm.vmx.star);
     wrmsrl(MSR_LSTAR,          v->arch.hvm.vmx.lstar);
     wrmsrl(MSR_SYSCALL_MASK,   v->arch.hvm.vmx.sfmask);
@@ -2958,7 +2958,7 @@ static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
         break;
 
     case MSR_SHADOW_GS_BASE:
-        *msr_content = rdgsshadow();
+        *msr_content = read_gs_shadow();
         break;
 
     case MSR_STAR:
@@ -3190,7 +3190,7 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
         else if ( msr == MSR_GS_BASE )
             __vmwrite(GUEST_GS_BASE, msr_content);
         else
-            wrgsshadow(msr_content);
+            write_gs_shadow(msr_content);
 
         break;
 
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 44e4ea2582..663e76c773 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -452,7 +452,7 @@ void toggle_guest_mode(struct vcpu *v)
      * Update the cached value of the GS base about to become inactive, as a
      * subsequent context switch won't bother re-reading it.
      */
-    gs_base = rdgsbase();
+    gs_base = read_gs_base();
     if ( v->arch.flags & TF_kernel_mode )
         v->arch.pv.gs_base_kernel = gs_base;
     else
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index a192160f84..9dd1d59423 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -511,10 +511,10 @@ static int read_segment(enum x86_segment seg,
             reg->base = 0;
             break;
         case x86_seg_fs:
-            reg->base = rdfsbase();
+            reg->base = read_fs_base();
             break;
         case x86_seg_gs:
-            reg->base = rdgsbase();
+            reg->base = read_gs_base();
             break;
         }
 
@@ -871,13 +871,13 @@ static int read_msr(unsigned int reg, uint64_t *val,
     case MSR_FS_BASE:
         if ( is_pv_32bit_domain(currd) )
             break;
-        *val = rdfsbase();
+        *val = read_fs_base();
         return X86EMUL_OKAY;
 
     case MSR_GS_BASE:
         if ( is_pv_32bit_domain(currd) )
             break;
-        *val = rdgsbase();
+        *val = read_gs_base();
         return X86EMUL_OKAY;
 
     case MSR_SHADOW_GS_BASE:
@@ -993,19 +993,19 @@ static int write_msr(unsigned int reg, uint64_t val,
     case MSR_FS_BASE:
         if ( is_pv_32bit_domain(currd) || !is_canonical_address(val) )
             break;
-        wrfsbase(val);
+        write_fs_base(val);
         return X86EMUL_OKAY;
 
     case MSR_GS_BASE:
         if ( is_pv_32bit_domain(currd) || !is_canonical_address(val) )
             break;
-        wrgsbase(val);
+        write_gs_base(val);
         return X86EMUL_OKAY;
 
     case MSR_SHADOW_GS_BASE:
         if ( is_pv_32bit_domain(currd) || !is_canonical_address(val) )
             break;
-        wrgsshadow(val);
+        write_gs_shadow(val);
         curr->arch.pv.gs_base_user = val;
         return X86EMUL_OKAY;
 
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index b69cf2dc4f..0d11a9f500 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1030,7 +1030,7 @@ long do_set_segment_base(unsigned int which, unsigned long base)
     {
     case SEGBASE_FS:
         if ( is_canonical_address(base) )
-            wrfsbase(base);
+            write_fs_base(base);
         else
             ret = -EINVAL;
         break;
@@ -1038,7 +1038,7 @@ long do_set_segment_base(unsigned int which, unsigned long base)
     case SEGBASE_GS_USER:
         if ( is_canonical_address(base) )
         {
-            wrgsshadow(base);
+            write_gs_shadow(base);
             v->arch.pv.gs_base_user = base;
         }
         else
@@ -1047,7 +1047,7 @@ long do_set_segment_base(unsigned int which, unsigned long base)
 
     case SEGBASE_GS_KERNEL:
         if ( is_canonical_address(base) )
-            wrgsbase(base);
+            write_gs_base(base);
         else
             ret = -EINVAL;
         break;
@@ -1096,7 +1096,7 @@ long do_set_segment_base(unsigned int which, unsigned long base)
                        : [flat] "r" (FLAT_USER_DS32) );
 
         /* Update the cache of the inactive base, as read from the GDT/LDT. */
-        v->arch.pv.gs_base_user = rdgsbase();
+        v->arch.pv.gs_base_user = read_gs_base();
 
         asm volatile ( safe_swapgs );
         break;
diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
index 93af0c5e87..4f262122b7 100644
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -47,9 +47,9 @@ static void read_registers(struct cpu_user_regs *regs, unsigned long crs[8])
     regs->es = read_sreg(es);
     regs->fs = read_sreg(fs);
     regs->gs = read_sreg(gs);
-    crs[5] = rdfsbase();
-    crs[6] = rdgsbase();
-    crs[7] = rdgsshadow();
+    crs[5] = read_fs_base();
+    crs[6] = read_gs_base();
+    crs[7] = read_gs_shadow();
 }
 
 static void _show_registers(
diff --git a/xen/include/asm-x86/msr.h b/xen/include/asm-x86/msr.h
index 5c44c79600..5e141ac5a5 100644
--- a/xen/include/asm-x86/msr.h
+++ b/xen/include/asm-x86/msr.h
@@ -156,7 +156,7 @@ static inline unsigned long __rdgsbase(void)
     return base;
 }
 
-static inline unsigned long rdfsbase(void)
+static inline unsigned long read_fs_base(void)
 {
     unsigned long base;
 
@@ -168,7 +168,7 @@ static inline unsigned long rdfsbase(void)
     return base;
 }
 
-static inline unsigned long rdgsbase(void)
+static inline unsigned long read_gs_base(void)
 {
     unsigned long base;
 
@@ -180,7 +180,7 @@ static inline unsigned long rdgsbase(void)
     return base;
 }
 
-static inline unsigned long rdgsshadow(void)
+static inline unsigned long read_gs_shadow(void)
 {
     unsigned long base;
 
@@ -196,7 +196,7 @@ static inline unsigned long rdgsshadow(void)
     return base;
 }
 
-static inline void wrfsbase(unsigned long base)
+static inline void write_fs_base(unsigned long base)
 {
     if ( read_cr4() & X86_CR4_FSGSBASE )
 #ifdef HAVE_AS_FSGSBASE
@@ -208,7 +208,7 @@ static inline void wrfsbase(unsigned long base)
         wrmsrl(MSR_FS_BASE, base);
 }
 
-static inline void wrgsbase(unsigned long base)
+static inline void write_gs_base(unsigned long base)
 {
     if ( read_cr4() & X86_CR4_FSGSBASE )
 #ifdef HAVE_AS_FSGSBASE
@@ -220,7 +220,7 @@ static inline void wrgsbase(unsigned long base)
         wrmsrl(MSR_GS_BASE, base);
 }
 
-static inline void wrgsshadow(unsigned long base)
+static inline void write_gs_shadow(unsigned long base)
 {
     if ( read_cr4() & X86_CR4_FSGSBASE )
     {
-- 
2.11.0


