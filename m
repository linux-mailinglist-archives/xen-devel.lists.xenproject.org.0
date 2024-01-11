Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1218C82B7DC
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 00:13:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666557.1037296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rO4F0-0007ES-TQ; Thu, 11 Jan 2024 23:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666557.1037296; Thu, 11 Jan 2024 23:13:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rO4F0-0007BM-PG; Thu, 11 Jan 2024 23:13:38 +0000
Received: by outflank-mailman (input) for mailman id 666557;
 Thu, 11 Jan 2024 23:13:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ikTk=IV=citrix.com=prvs=733603de5=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1rO4Ey-0006Rc-RP
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 23:13:36 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b1beb35-b0d7-11ee-98f0-6d05b1d4d9a1;
 Fri, 12 Jan 2024 00:13:35 +0100 (CET)
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
X-Inumbo-ID: 0b1beb35-b0d7-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1705014815;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4YIR4K6W+nWMY3NLj1Q8Kd8f62sIVMxc9+xWiH9rSVw=;
  b=iX6Ucla+cmVJDrUaQhWuyHeFjxJzNHcdUZdvxdsx6ojgSInH3NW6gxFR
   bLYFU4QYLMOapNuunwdnSY06+cY6SLXk7TD2Po8UBsOejs7NZ3ARhCJh3
   hxYLkQBX9sNe8tLl9c2vlhPCd4nlV8t0aOQ9JssTnexTjHcBgP+SsuOO7
   g=;
X-CSE-ConnectionGUID: WH81DfBRRa+ZAEKw+/EGxA==
X-CSE-MsgGUID: 9/3zPfAITzu2AejPcLWbGQ==
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 127924843
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:evxiBqtIX0jYoxj1NhwS7DHNfOfnVG1eMUV32f8akzHdYApBsoF/q
 tZmKWrTOq2IY2fzc40lOoTjoUhSv5PRxoAxHFFopHs3RntH+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq5Fv0gnRkPaoX5AaHziFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwFxBdNzyNrdiMyfGJY8RPmYdkAeb7FdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkAefAhPYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 D2XpTipXkpy2Nq3mH3e4Eqir87zjz6hcY8QLLacyfRFuQjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O+wh6ACM0ILbpQuSDS4ZCyJGa80h8sY9Az4yv
 nertd70AT1ksJWOVGmQsLyTqFuaJiw9PWIEIygeQmMt4cTl5oc6jRvNT9NqOK+zktDxXzr3x
 liiryUghrNVkc8C0Y26+0zKh3SnoZ2hZhI84wzMdn6m6g5/a5+oY8qj7l2zxe1ALYCQZlSKt
 z4Z3tSZ7/EJS5iG0i6VKNjhB5nwuazDameFxwcyTt9+r1xB5kJPY6hvwGEnCElDCPwNOg3AT
 WzM+kR8y496aS7CgbBMX26hNyg75fG/TYi8B6iKMocmX3RnSOOQEMhTia+sM4PFyhFEfVkXY
 8vzTCpVJS9y5V5b5DS3XfwB9rQg2zozw2jeLbiikEz7iOvENCHMEuZZWLdrUgzexPrZyDg5D
 v4Fb5fao/mheLGWjtbrHX47cglRcClT6WHeoM1LbO+TSjeK60l4Y8I9NYgJItQ/94wMz7egw
 51IchMAoLYJrSGdeFrih7EKQO+HYKuTWlpiZnx0bA/5gSJzCWtthY9GH6YKkXAc3LQL5ZZJo
 zMtIq1s3twnpuz7xgkg
IronPort-HdrOrdr: A9a23:EZXpyqlECEcGL79EtVoi7gD+KFzpDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE8Qr5OUtQ/+xoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCBHZK3BgTVQfexO/DD+ytHLudvj
X-Talos-CUID: =?us-ascii?q?9a23=3AWNc+W2v0M+/K07eztMcCGbuB6IsaUi2E4Hn6GXW?=
 =?us-ascii?q?xSlRAZZ6KChi917NNxp8=3D?=
X-Talos-MUID: 9a23:M2umaAlYbb9zenPzX9dgdnozc5x626qHKXwfjM8vtsu8PghPMRik2WE=
X-IronPort-AV: E=Sophos;i="6.04,187,1695700800"; 
   d="scan'208";a="127924843"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Reima Ishii
	<ishiir@g.ecc.u-tokyo.ac.jp>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, "Takahiro
 Shinagawa" <shina@ecc.u-tokyo.ac.jp>, George Dunlap
	<george.dunlap@citrix.com>
Subject: [PATCH v2 3/3] x86/vmx: Disallow the use of inactivity states
Date: Thu, 11 Jan 2024 23:13:23 +0000
Message-ID: <20240111231323.4043461-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240111231323.4043461-1-andrew.cooper3@citrix.com>
References: <20240111231323.4043461-1-andrew.cooper3@citrix.com>
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
   the 0 from construct_vmcs().  Retain the ability to query activity_state,
   but crash the domain on any attempt to set an inactivity state.

2) Nested virt, because of ACTIVITY_STATE in vmcs_gstate_field[].

   Explicitly hide the inactivity states in the guest's view of MSR_VMX_MISC,
   and remove ACTIVITY_STATE from vmcs_gstate_field[].

   In virtual_vmentry(), we should trigger a VMEntry failure for the use of
   any inactivity states, but there's no support for that in the code at all
   so leave a TODO for when we finally start working on nested-virt in
   earnest.

Reported-by: Reima Ishii <ishiir@g.ecc.u-tokyo.ac.jp>
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
CC: George Dunlap <george.dunlap@citrix.com>

v2:
 * Retain the ability to query ACTIVITY_STATE in the vmfork helpers, but veto
   attempts to set an inactivity state.

Note, entirely untested.
---
 xen/arch/x86/hvm/vmx/vmx.c              | 5 ++++-
 xen/arch/x86/hvm/vmx/vvmx.c             | 9 +++++++--
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 1 +
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index a85394232a23..fd580bd5625f 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1551,7 +1551,10 @@ static void cf_check vmx_set_nonreg_state(struct vcpu *v,
 {
     vmx_vmcs_enter(v);
 
-    __vmwrite(GUEST_ACTIVITY_STATE, nrs->vmx.activity_state);
+    if ( nrs->vmx.activity_state )
+        domain_crash(v->domain, "Attempt to set activity_state %#lx\n",
+                     nrs->vmx.activity_state);
+
     __vmwrite(GUEST_INTERRUPTIBILITY_INFO, nrs->vmx.interruptibility_info);
     __vmwrite(GUEST_PENDING_DBG_EXCEPTIONS, nrs->vmx.pending_dbg);
 
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index f14053e7637a..ece0aa243a73 100644
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
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index a9afdffae547..5ec474c79c32 100644
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


