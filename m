Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 244087DE657
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 20:21:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626619.977025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyGm6-00058c-3k; Wed, 01 Nov 2023 19:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626619.977025; Wed, 01 Nov 2023 19:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyGm6-00055s-0V; Wed, 01 Nov 2023 19:21:10 +0000
Received: by outflank-mailman (input) for mailman id 626619;
 Wed, 01 Nov 2023 19:21:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uHih=GO=citrix.com=prvs=662d42e6f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qyGm4-000558-Pk
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 19:21:08 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc8cf3de-78eb-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 20:21:05 +0100 (CET)
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
X-Inumbo-ID: cc8cf3de-78eb-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698866465;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dAjtVuXr4bnN1ScuGLWOR+3Nub1lnq5/xnQrcyf0VXU=;
  b=B8J4zAhQjdhHtjHVyAMuMFwn5xTfC6gBscj10/gwkXn6sojNin7u8nLo
   yqSAnr1MzLx/5F7Lp/cg0pARDJ5SJ+5RxIYpGcWStev1rZnyEH2OVLGPX
   l4ZRDO+7zCTAkWSLgctNz7GDpXRhc/Ns/bh5I21eLgOc7s53FT7ik3zfD
   o=;
X-CSE-ConnectionGUID: PJy6mrjzSPeeXLTAFYLeTg==
X-CSE-MsgGUID: Q3wW79OkSSmHYeywlHBNNw==
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 127288895
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:cjzQnKnDAytAOavKIVUO9u/o5gxxJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeC26EPfnfYDagc9ElYd6zpEMB6JDSmtMyQAs/qi1mEyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+e6UKicfHkpGWeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K+aVA8w5ARkPqkS5AaGzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cQ6OW4IdBKRvNq7zYKfdsBCt+AuEMa+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dMlsQYj/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xxzH/
 DKWrzWkav0cHOXE1gXao1WvvdTKvRL2SZ0WNJee0OE/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JRCO076RulxezZ6A3fGy0YST1Qb5ovv4k0XVQC9
 HWEgtfoDjxHq6CORDSW8bL8hSy2ETgYKykFfyBsZQkY5Z/lqYI6jBPKR/5iFrK4ipv+HjSY6
 zOHsik4wakShMgj1qOn8FSBiDWpzrDVRws8/S3LXWao6AxoaYrjbIutgXDA7fdGJa6URVLHo
 T0YnMuP66YHBtePjESwrP4lRe/zoazfaXuF3A8pQMFJGymRF2CLRaJBvjRkJlVSCssJSRvVS
 WHinQ5t68oGVJe1VpObc75dGuxzk/mwRY29DqqEBjZdSsIvLlPZpkmCcWbVjzi3zhV2+U0qE
 c7DKZ7EMJoMNUhwINNarc821qUiwmgF3XnSQ5/gp/hM+eHFPCHMIVvp3UHnUwzY0E9niF+Om
 zqnH5HWoyizqcWnCsUtzaYdLEoRMV8wDo3spspce4are1Q3SDF/UKGPn+N4K+SJepi5cc+Ro
 BmAtrJwkQek2xUr1y3RApycVF8fdckm9i9qVcDdFV2px2Iice6S0UvrTLNuJeNP3LU6nZZJo
 wwtJ53o7gJnFm6WpFzwrPDV8ORfSfhcrVjeYXX+PWRuI8IIqs6g0oaMQzYDPRImVkKf3fbSa
 ZX6vu8HafLvnzhfMfs=
IronPort-HdrOrdr: A9a23:Da7T7qpVQNxya6sukAye3eQaV5odeYIsimQD101hICG9vPbo8P
 xG+85rrSMc6QxhIU3I/OrqBEDuex/hHPJOjrX5Xo3SPzUO2lHIEGgK1+KLqVDd8kvFh4xgPM
 xbHZSWZueAaWRSvILX5xS5DsZl4PTvytHPuQ6n9RdQpNhRGsRd0zs=
X-Talos-CUID: 9a23:fQHlF2671YPEkamuqNsszGwFRMU/cG/m9HrdE2uEIEhYbLCpRgrF
X-Talos-MUID: 9a23:3qGD/grZ5bFoSQhqmzUezwg5K/g3soOtM3sIsaQLqtaAFQZWHSjI2Q==
X-IronPort-AV: E=Sophos;i="6.03,269,1694750400"; 
   d="scan'208";a="127288895"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Reima ISHII
	<ishiir@g.ecc.u-tokyo.ac.jp>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, "Takahiro
 Shinagawa" <shina@ecc.u-tokyo.ac.jp>
Subject: [PATCH 2/2] x86/vmx: Disallow the use of inactivity states
Date: Wed, 1 Nov 2023 19:20:58 +0000
Message-ID: <20231101192058.3419310-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231101192058.3419310-1-andrew.cooper3@citrix.com>
References: <20231101192058.3419310-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Right now, vvmx will blindly copy L12's ACTIVITY_STATE into the L02 VMCS and
enter the vCPU.  Luckily for us, nested-virt is explicitly unsupported for
security bugs.

The inactivity states are HLT, SHUTDOWN and WAIT-FOR-SIPI, and as noted by the
SDM in Vol3 27.7 "Special Features of VM Entry":

  If VM entry ends with the logical processor in an inactive activity state,
  the VM entry generates any special bus cycle that is normally generated when
  that activity state is entered from the active state.

Also,

  Some activity states unconditionally block certain events.

I.e. A VMEntry with ACTIVITY=SHUTDOWN will initiate a platform reset, while a
VMEntry with ACTIVITY=WAIT-FOR-SIPI will really block everything other than
SIPIs.

Both of these activity states are for the TXT ACM to use, not for regular
hypervisors, and Xen doesn't support dropping the HLT intercept either.

There are two paths in Xen which operate on ACTIVITY_STATE.

1) The vmx_{get,set}_nonreg_state() helpers for VM-Fork.

   As regular VMs can't use any inactivity states, this is just duplicating
   the 0 from construct_vmcs().  Drop the field, leaving a comment as to why
   it is skipped.

2) Nested virt, because of ACTIVITY_STATE in vmcs_gstate_field[].

   Explicitly hide the inactivity states in the guest's view of MSR_VMX_MISC,
   and remove ACTIVITY_STATE from vmcs_gstate_field[].

   In virtual_vmentry(), we should trigger a VMEntry failure for the use of
   any inactivity states, but there's no support for that in the code at all
   so leave a TODO for when we finally start working on nested-virt in
   earnest.

Reported-by: Reima ISHII <ishiir@g.ecc.u-tokyo.ac.jp>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Tamas K Lengyel <tamas@tklengyel.com>
CC: Reima ISHII <ishiir@g.ecc.u-tokyo.ac.jp>
CC: Takahiro Shinagawa <shina@ecc.u-tokyo.ac.jp>

Note, entirely untested.
---
 xen/arch/x86/hvm/vmx/vmx.c              | 2 --
 xen/arch/x86/hvm/vmx/vvmx.c             | 9 +++++++--
 xen/arch/x86/include/asm/hvm/hvm.h      | 5 ++++-
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 1 +
 4 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index d26920d03bbc..a35fb23b0ece 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1543,7 +1543,6 @@ static void cf_check vmx_get_nonreg_state(struct vcpu *v,
 {
     vmx_vmcs_enter(v);
 
-    __vmread(GUEST_ACTIVITY_STATE, &nrs->vmx.activity_state);
     __vmread(GUEST_INTERRUPTIBILITY_INFO, &nrs->vmx.interruptibility_info);
     __vmread(GUEST_PENDING_DBG_EXCEPTIONS, &nrs->vmx.pending_dbg);
 
@@ -1558,7 +1557,6 @@ static void cf_check vmx_set_nonreg_state(struct vcpu *v,
 {
     vmx_vmcs_enter(v);
 
-    __vmwrite(GUEST_ACTIVITY_STATE, nrs->vmx.activity_state);
     __vmwrite(GUEST_INTERRUPTIBILITY_INFO, nrs->vmx.interruptibility_info);
     __vmwrite(GUEST_PENDING_DBG_EXCEPTIONS, nrs->vmx.pending_dbg);
 
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 16b0ef82b6c8..fd0ae3916656 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -899,7 +899,10 @@ static const u16 vmcs_gstate_field[] = {
     GUEST_LDTR_AR_BYTES,
     GUEST_TR_AR_BYTES,
     GUEST_INTERRUPTIBILITY_INFO,
+    /*
+     * ACTIVITY_STATE is handled specially.
     GUEST_ACTIVITY_STATE,
+     */
     GUEST_SYSENTER_CS,
     GUEST_PREEMPTION_TIMER,
     /* natural */
@@ -1200,6 +1203,8 @@ static void virtual_vmentry(struct cpu_user_regs *regs)
     nvcpu->nv_vmentry_pending = 0;
     nvcpu->nv_vmswitch_in_progress = 1;
 
+    /* TODO: Fail VMentry for GUEST_ACTIVITY_STATE != 0 */
+
     /*
      * EFER handling:
      * hvm_set_efer won't work if CR0.PG = 1, so we change the value
@@ -2316,8 +2321,8 @@ int nvmx_msr_read_intercept(unsigned int msr, u64 *msr_content)
         data = hvm_cr4_guest_valid_bits(d);
         break;
     case MSR_IA32_VMX_MISC:
-        /* Do not support CR3-target feature now */
-        data = host_data & ~VMX_MISC_CR3_TARGET;
+        /* Do not support CR3-targets or activity states. */
+        data = host_data & ~(VMX_MISC_CR3_TARGET | VMX_MISC_ACTIVITY_MASK);
         break;
     case MSR_IA32_VMX_EPT_VPID_CAP:
         data = nept_get_ept_vpid_cap();
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 6d53713fc3a9..caeb8ef4f596 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -78,7 +78,10 @@ enum hvm_intblk {
 struct hvm_vcpu_nonreg_state {
     union {
         struct {
-            uint64_t activity_state;
+            /*
+             * ACTIVITY_STATE is part of VT-x's Non-Register state, but we
+             * don't support the use of any inactivity states.
+             */
             uint64_t interruptibility_info;
             uint64_t pending_dbg;
             uint64_t interrupt_status;
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index d07fcb2bc929..8de9977eb354 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -277,6 +277,7 @@ extern u32 vmx_secondary_exec_control;
 #define VMX_VPID_INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 0x80000000000ULL
 extern u64 vmx_ept_vpid_cap;
 
+#define VMX_MISC_ACTIVITY_MASK                  0x000001c0
 #define VMX_MISC_PROC_TRACE                     0x00004000
 #define VMX_MISC_CR3_TARGET                     0x01ff0000
 #define VMX_MISC_VMWRITE_ALL                    0x20000000
-- 
2.30.2


