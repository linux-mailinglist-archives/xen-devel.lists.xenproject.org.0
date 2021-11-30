Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8562A4640DE
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 23:02:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235536.408581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msBBy-0005mi-En; Tue, 30 Nov 2021 22:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235536.408581; Tue, 30 Nov 2021 22:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msBBy-0005ku-Be; Tue, 30 Nov 2021 22:01:38 +0000
Received: by outflank-mailman (input) for mailman id 235536;
 Tue, 30 Nov 2021 22:01:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1hFC=QR=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1msBBw-0005ko-Kb
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 22:01:36 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13f8aa71-5229-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 23:01:34 +0100 (CET)
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
X-Inumbo-ID: 13f8aa71-5229-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638309694;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xJavKuZ2gqDnL/81JHfSY0GJ+QSSKkIKh/Cof+NDXsI=;
  b=frwyV+G3cjWwwANQcWo7QixeMDGlfe4xG6SN92NRdFWW0LI5sWapSUiU
   UXtJMKq/F7tIKIYGVlBfjNqWxlYH8+C4bHiUN8W46VGJfco5AwsgN2Pby
   /9GtZZihpvQmWmuiYqXT6CA8nn3HeFwCs+1O+9ReNeZGuFCx94EcwBqad
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: kZswpjAKp8ZNxKmvpuRLn8muEF4gBCHWyAeXEtEkmDuT/UdEWgHKJYgBdMlitBwByQhzEnmsxi
 Jx5ow19ewQf5gvoFa7NhpOLsVrrNUPgnclOzA5KOXMlnEGim1AQJK1lygU0xWlCrxZOUsTzyUB
 uJ4zxrJn1H5MC/YLFQu+tTO/WrXIrieSDKbzkd/sFBlR3bnNcLhDY+PavDhzCrFcJfR/p3dLtT
 aH4k96dI/c2iqWPMzVNk4SKXGIvII+CIg0tsSJF05PmX254+CcDECcQpVSv37iMUv9qLW0Ck6T
 xquniOyeIZflVYw6LiQZC5yt
X-SBRS: 5.1
X-MesageID: 59346727
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KbPGwqnyOa30uJh7TXJ4owzo5gxMIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNDWmOPfjcNDGmf493bo2+9x9QsZDdzdBqT1E+rCxgRCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg29Uw2YPR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 OVtmqaPQFwjAqzdgqdCYiFFKj57OLITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQKeFO
 5RGM2UHgBLofjhmGXoyFskElv6vnSntdRJ+s3e5uv9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zbKBwHMN2UyRKe72mhwOTImEvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJgM8IA1wjWwJbV8hzaWVk8Uwdebdk54ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud14WtQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT0uTA3Dt4ade51q2VtW
 lBfwKByC8hUUPmweNSlGrllIV1Qz6/t3MfgqVBuBYI90D+m5mSue4tdiBknehw5aJdbIW+0P
 BKO0e+02HO1FCDxBUOQS9jsY/nGMIC6TYi1PhwqRoQmjmdNmP+vo3g1OB/4M5HFm0kwi6AvU
 ap3gu73ZUv2/Z9PlWLsL89EiOdD7nlnmQv7GMCqpzz6gOH2TCPEFt843K6mM7lRAFWs+16Or
 b6y9qKiln1ibQEJSnWNrNNIcwlVdSNT6FKfg5U/S9Nv6zFOQAkJY8I9C5t9E2C8t6gKxOrO4
 F+nXUpUlAj2iXHdcF3YYXF/crL/G514qCtjbyArOF+p3VklYJqus/hDJ8dmI+F/+bwx1+NwQ
 tkEZ96EXqZFRAPY9mlPdpL6toFjKkim3FrcIyq/bTEjVJd8XAiVqMT8dw7i+XBWXCq6vMczu
 ZO60QbfTcZRTghuFp+OOvmu00mwrT4Wn+crBxnEJdxaeUPN9ol2KnOu0q9rcp9UcRian2mUz
 QebBxsctNLhmY5t/Ymbn72AoqeoD/B6QhhQEV7E4OvkLiLd5Gein9NNCb7aYTDHWWro06y+f
 uEJnerkOfgKkVsW4YpxF7FnkfA369f1/uIIyw1lGDPAbkixC6MmKX6DhJEduqpIz75fmA23R
 kPQpYUKZeTXYJvoQAwLOQ4oTuWfzvVFyDDd4MM8LFj++CIqrqGMVl9fPkXUhSFQRFev3FjJH
 Qv1VBYq1jGC
IronPort-HdrOrdr: A9a23:NI0h36t4AZ9Ct53yowfPx8nl7skDeNV00zEX/kB9WHVpm62j+/
 xG+c5x6faaslkssR0b9+xoWpPhfZqsz/9ICOAqVN/JMTUO01HYT72Kg7GSpgHIKmnT8fNcyL
 clU4UWMqyVMbGit7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.87,277,1631592000"; 
   d="scan'208";a="59346727"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 4/3] x86/vPMU: Drop supported parameter from the wrmsr path
Date: Tue, 30 Nov 2021 22:01:11 +0000
Message-ID: <20211130220111.23815-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <a0212d75-fc55-89c8-7ae2-c893c187ad82@suse.com>
References: <a0212d75-fc55-89c8-7ae2-c893c187ad82@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The supported parameter was added in 2d9b91f1aeaa ("VMX/vPMU: fix DebugCtl MSR
handling"), it laid the groundwork for XSA-269, and in the meantime
2a8a8e99feb9 ("x86/vtx: Fix the checking for unknown/invalid MSR_DEBUGCTL
bits") totally rewrote MSR_DEBUGCTL handling.

Strip out the parameter again.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu/vpmu.c        |  5 ++---
 xen/arch/x86/cpu/vpmu_amd.c    |  5 +----
 xen/arch/x86/cpu/vpmu_intel.c  |  5 +----
 xen/arch/x86/hvm/svm/svm.c     |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c     |  2 +-
 xen/arch/x86/pv/emul-priv-op.c |  2 +-
 xen/include/asm-x86/vpmu.h     | 13 +++++--------
 7 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index 7fd69a2a58e3..8ec4547bedf4 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -116,8 +116,7 @@ void vpmu_lvtpc_update(uint32_t val)
         apic_write(APIC_LVTPC, vpmu->hw_lapic_lvtpc);
 }
 
-int vpmu_do_msr(unsigned int msr, uint64_t *msr_content,
-                uint64_t supported, bool_t is_write)
+int vpmu_do_msr(unsigned int msr, uint64_t *msr_content, bool is_write)
 {
     struct vcpu *curr = current;
     struct vpmu_struct *vpmu;
@@ -137,7 +136,7 @@ int vpmu_do_msr(unsigned int msr, uint64_t *msr_content,
         goto nop;
 
     if ( is_write )
-        ret = alternative_call(vpmu_ops.do_wrmsr, msr, *msr_content, supported);
+        ret = alternative_call(vpmu_ops.do_wrmsr, msr, *msr_content);
     else
         ret = alternative_call(vpmu_ops.do_rdmsr, msr, msr_content);
 
diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
index b28c78b81109..903fe1887ef0 100644
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -348,16 +348,13 @@ static void context_update(unsigned int msr, u64 msr_content)
     }
 }
 
-static int amd_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content,
-                             uint64_t supported)
+static int amd_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content)
 {
     struct vcpu *v = current;
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
     unsigned int idx = 0;
     int type = get_pmu_reg_type(msr, &idx);
 
-    ASSERT(!supported);
-
     if ( (type == MSR_TYPE_CTRL ) &&
          ((msr_content & CTRL_RSVD_MASK) != ctrl_rsvd[idx]) )
         return -EINVAL;
diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 63e798b9edac..076882c615f4 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -522,8 +522,7 @@ static int core2_vpmu_msr_common_check(u32 msr_index, int *type, int *index)
     return 1;
 }
 
-static int core2_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content,
-                               uint64_t supported)
+static int core2_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content)
 {
     int i, tmp;
     int type = -1, index = -1;
@@ -535,8 +534,6 @@ static int core2_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content,
     if ( !core2_vpmu_msr_common_check(msr, &type, &index) )
         return -EINVAL;
 
-    ASSERT(!supported);
-
     if ( (type == MSR_TYPE_COUNTER) && (msr_content & fixed_counters_mask) )
         /* Writing unsupported bits to a fixed counter */
         return -EINVAL;
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index f0e10dec046e..fae39c4b4cbd 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2113,7 +2113,7 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
     case MSR_AMD_FAM15H_EVNTSEL3:
     case MSR_AMD_FAM15H_EVNTSEL4:
     case MSR_AMD_FAM15H_EVNTSEL5:
-        if ( vpmu_do_wrmsr(msr, msr_content, 0) )
+        if ( vpmu_do_wrmsr(msr, msr_content) )
             goto gpf;
         break;
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 37c31c08b984..a7a0d662342a 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3487,7 +3487,7 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
     case MSR_CORE_PERF_FIXED_CTR_CTRL...MSR_CORE_PERF_GLOBAL_OVF_CTRL:
     case MSR_IA32_PEBS_ENABLE:
     case MSR_IA32_DS_AREA:
-         if ( vpmu_do_wrmsr(msr, msr_content, 0) )
+         if ( vpmu_do_wrmsr(msr, msr_content) )
             goto gp_fault;
         break;
 
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 7f4279a0517b..8ba65178e98f 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -1163,7 +1163,7 @@ static int write_msr(unsigned int reg, uint64_t val,
                      !is_hardware_domain(currd) )
                     return X86EMUL_OKAY;
 
-                if ( vpmu_do_wrmsr(reg, val, 0) )
+                if ( vpmu_do_wrmsr(reg, val) )
                     break;
                 return X86EMUL_OKAY;
             }
diff --git a/xen/include/asm-x86/vpmu.h b/xen/include/asm-x86/vpmu.h
index ccf5a0cf90b9..80656891e5a3 100644
--- a/xen/include/asm-x86/vpmu.h
+++ b/xen/include/asm-x86/vpmu.h
@@ -40,8 +40,7 @@
 /* Arch specific operations shared by all vpmus */
 struct arch_vpmu_ops {
     int (*initialise)(struct vcpu *v);
-    int (*do_wrmsr)(unsigned int msr, uint64_t msr_content,
-                    uint64_t supported);
+    int (*do_wrmsr)(unsigned int msr, uint64_t msr_content);
     int (*do_rdmsr)(unsigned int msr, uint64_t *msr_content);
     int (*do_interrupt)(struct cpu_user_regs *regs);
     void (*arch_vpmu_destroy)(struct vcpu *v);
@@ -104,8 +103,7 @@ static inline bool_t vpmu_are_all_set(const struct vpmu_struct *vpmu,
 }
 
 void vpmu_lvtpc_update(uint32_t val);
-int vpmu_do_msr(unsigned int msr, uint64_t *msr_content,
-                uint64_t supported, bool_t is_write);
+int vpmu_do_msr(unsigned int msr, uint64_t *msr_content, bool is_write);
 void vpmu_do_interrupt(struct cpu_user_regs *regs);
 void vpmu_initialise(struct vcpu *v);
 void vpmu_destroy(struct vcpu *v);
@@ -113,14 +111,13 @@ void vpmu_save(struct vcpu *v);
 int vpmu_load(struct vcpu *v, bool_t from_guest);
 void vpmu_dump(struct vcpu *v);
 
-static inline int vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content,
-                                uint64_t supported)
+static inline int vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content)
 {
-    return vpmu_do_msr(msr, &msr_content, supported, 1);
+    return vpmu_do_msr(msr, &msr_content, 1);
 }
 static inline int vpmu_do_rdmsr(unsigned int msr, uint64_t *msr_content)
 {
-    return vpmu_do_msr(msr, msr_content, 0, 0);
+    return vpmu_do_msr(msr, msr_content, 0);
 }
 
 extern unsigned int vpmu_mode;
-- 
2.11.0


