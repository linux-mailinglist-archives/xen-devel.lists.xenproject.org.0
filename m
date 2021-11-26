Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3005145EEC0
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:08:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232877.404096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxT-00023r-17; Fri, 26 Nov 2021 13:08:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232877.404096; Fri, 26 Nov 2021 13:08:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxS-0001lo-D5; Fri, 26 Nov 2021 13:08:06 +0000
Received: by outflank-mailman (input) for mailman id 232877;
 Fri, 26 Nov 2021 13:08:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqaup-0003W9-CM
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:05:23 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80e7cff7-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:05:19 +0100 (CET)
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
X-Inumbo-ID: 80e7cff7-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931919;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GwkeJYr8tdjhFymC30/jfquVKzBuwYOcbZ/CTHFhz7Q=;
  b=hzvaSuq8yNpGpNvy+6BACf5Q2JNwFfyBSbbOlEb64z1a2jt6B3AfQe9N
   H9ltfbgYAcu70gM+UK7/NCoAG/VE+jOgqd0K/THg6E7gH5jXS2d2iGqs/
   38d1FXHF4LXqN9QXGQYBeoDLE1ddgOrXSCKj4bP+PLqXOuaX284eceKQQ
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: G73dUSdqFY5hj4RbPyMaRn5jPx9fz3c3PnXHH5bNm30qmm6XUogzgr6bBtdUxFA1bPowJc4/ak
 HdXetXBDwH5EAocz1cEmgXKzU6Zv15beqzeoGZkV/7XYadKkr0dVvL4FAsytj9ythCv9SfRKr2
 VP0aCC5OZlHYVdB1JQohBLObN/HXILliU/hufyIWsEHqlXA3FvLCuBrUzCdlH2U4CWk9MRkFPA
 QoIDs7Oa2E++stT38C/UX8uBVBjfY+xftB59LY0vb9LvuJ9L9kgfBsLls46lsCVOfK2Lch9ArA
 5jfI/OOKk2kOdNV1HCtdTJ7t
X-SBRS: 5.1
X-MesageID: 58635005
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LRKa7q670gJK77AFL/h2dQxRtPXAchMFZxGqfqrLsTDasY5as4F+v
 mEcWmjXOazbN2ShKtF1aoqwoBkA6JWGmtA2Twpq/nxnHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdg2NAw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zw
 9pErYSVFEQVLvPvps5DSD9IOBl1BPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gTTaiFO
 pJBNFKDajz8fBhOOFQRJagagfXzll/AejhnhUma8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u10bTDwweNdef4SGY6X/qjejK9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc9FfGvUizVzO9rqKwDizWHMiXhV5Y+Vz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbs1oWtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9D3gbQ4xawZRGp8crVnl
 CNf8yR5xLpTZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggfxg5bJtbKGO3P
 BS7VeZtCHl7ZyDCgUhfOd/ZNijX5fK4SYSNug78MrKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWPnOKrNVNdA9SdhDWx/ne8qRqSwJKGSI+cElJNhMb6elJl1VNk/sHm+HW0
 Gu6X0MEmlPziWeecVeBa2x5aaOpVpF69CppMSspNFeu+n4ifYfws/tPK8ppJeEqpL550Pp5b
 /gZYMHcUP5BfSvKpmYGZp7noY08KBny3VCSPzCoaSQUdoJ7Q1Cb4cftewbirXFcDie+ucYkj
 aen0wfXHcgKSwh4VZ6EY/Oz1VKh+3ManbsqDUfPJ9BSfmTq8ZRrdHOt3qNmfZlUJEyalDWA1
 guQDRMJnsX3otc4oIvTmKSJj4a1CO8iTEBUKHbWsOStPi7A82v9nYIZCLSUfSrQXX/f8bm5Y
 bkH1On1NfAKkQoYs4d4FLo3n6sy68G2+u1fxwVgWn7Kc06qGvVrJXzfhZtDsahEx7l4vwqqW
 x3QpokGaOvRYM61QkQMIAcFb/iY0aBGkzbf2v05PUHm6XIl57GAS0hTY0GBhSE1wGGZ62/5L
 TPNYPIr1jE=
IronPort-HdrOrdr: A9a23:ZYdUMqFNKZSgoFG6pLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5r
 mTdZUgpHnJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YZT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58635005"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 40/65] x86/pmu: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:21 +0000
Message-ID: <20211126123446.32324-41-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu/vpmu_amd.c             | 16 ++++++++--------
 xen/arch/x86/cpu/vpmu_intel.c           | 16 ++++++++--------
 xen/arch/x86/oprofile/op_model_athlon.c | 16 ++++++++--------
 xen/arch/x86/oprofile/op_model_p4.c     | 14 +++++++-------
 xen/arch/x86/oprofile/op_model_ppro.c   | 26 ++++++++++++++------------
 5 files changed, 45 insertions(+), 43 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
index 38972089ab42..a5487143f77e 100644
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -186,7 +186,7 @@ static void amd_vpmu_unset_msr_bitmap(struct vcpu *v)
     msr_bitmap_off(vpmu);
 }
 
-static int amd_vpmu_do_interrupt(struct cpu_user_regs *regs)
+static int cf_check amd_vpmu_do_interrupt(struct cpu_user_regs *regs)
 {
     return 1;
 }
@@ -206,7 +206,7 @@ static inline void context_load(struct vcpu *v)
     }
 }
 
-static int amd_vpmu_load(struct vcpu *v, bool_t from_guest)
+static int cf_check amd_vpmu_load(struct vcpu *v, bool from_guest)
 {
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
     struct xen_pmu_amd_ctxt *ctxt;
@@ -280,7 +280,7 @@ static inline void context_save(struct vcpu *v)
         rdmsrl(counters[i], counter_regs[i]);
 }
 
-static int amd_vpmu_save(struct vcpu *v,  bool_t to_guest)
+static int cf_check amd_vpmu_save(struct vcpu *v,  bool to_guest)
 {
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
     unsigned int i;
@@ -348,8 +348,8 @@ static void context_update(unsigned int msr, u64 msr_content)
     }
 }
 
-static int amd_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content,
-                             uint64_t supported)
+static int cf_check amd_vpmu_do_wrmsr(
+    unsigned int msr, uint64_t msr_content, uint64_t supported)
 {
     struct vcpu *v = current;
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
@@ -407,7 +407,7 @@ static int amd_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content,
     return 0;
 }
 
-static int amd_vpmu_do_rdmsr(unsigned int msr, uint64_t *msr_content)
+static int cf_check amd_vpmu_do_rdmsr(unsigned int msr, uint64_t *msr_content)
 {
     struct vcpu *v = current;
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
@@ -425,7 +425,7 @@ static int amd_vpmu_do_rdmsr(unsigned int msr, uint64_t *msr_content)
     return 0;
 }
 
-static void amd_vpmu_destroy(struct vcpu *v)
+static void cf_check amd_vpmu_destroy(struct vcpu *v)
 {
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
 
@@ -443,7 +443,7 @@ static void amd_vpmu_destroy(struct vcpu *v)
 }
 
 /* VPMU part of the 'q' keyhandler */
-static void amd_vpmu_dump(const struct vcpu *v)
+static void cf_check amd_vpmu_dump(const struct vcpu *v)
 {
     const struct vpmu_struct *vpmu = vcpu_vpmu(v);
     const struct xen_pmu_amd_ctxt *ctxt = vpmu->context;
diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index f59cae543868..8b450ec8a8aa 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -288,7 +288,7 @@ static inline void __core2_vpmu_save(struct vcpu *v)
         rdmsrl(MSR_CORE_PERF_GLOBAL_STATUS, core2_vpmu_cxt->global_status);
 }
 
-static int core2_vpmu_save(struct vcpu *v, bool_t to_guest)
+static int cf_check core2_vpmu_save(struct vcpu *v, bool to_guest)
 {
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
 
@@ -407,7 +407,7 @@ static int core2_vpmu_verify(struct vcpu *v)
     return 0;
 }
 
-static int core2_vpmu_load(struct vcpu *v, bool_t from_guest)
+static int cf_check core2_vpmu_load(struct vcpu *v, bool from_guest)
 {
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
 
@@ -522,8 +522,8 @@ static int core2_vpmu_msr_common_check(u32 msr_index, int *type, int *index)
     return 1;
 }
 
-static int core2_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content,
-                               uint64_t supported)
+static int cf_check core2_vpmu_do_wrmsr(
+    unsigned int msr, uint64_t msr_content, uint64_t supported)
 {
     int i, tmp;
     int type = -1, index = -1;
@@ -693,7 +693,7 @@ static int core2_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content,
     return 0;
 }
 
-static int core2_vpmu_do_rdmsr(unsigned int msr, uint64_t *msr_content)
+static int cf_check core2_vpmu_do_rdmsr(unsigned int msr, uint64_t *msr_content)
 {
     int type = -1, index = -1;
     struct vcpu *v = current;
@@ -733,7 +733,7 @@ static int core2_vpmu_do_rdmsr(unsigned int msr, uint64_t *msr_content)
 }
 
 /* Dump vpmu info on console, called in the context of keyhandler 'q'. */
-static void core2_vpmu_dump(const struct vcpu *v)
+static void cf_check core2_vpmu_dump(const struct vcpu *v)
 {
     const struct vpmu_struct *vpmu = vcpu_vpmu(v);
     unsigned int i;
@@ -778,7 +778,7 @@ static void core2_vpmu_dump(const struct vcpu *v)
     }
 }
 
-static int core2_vpmu_do_interrupt(struct cpu_user_regs *regs)
+static int cf_check core2_vpmu_do_interrupt(struct cpu_user_regs *regs)
 {
     struct vcpu *v = current;
     u64 msr_content;
@@ -805,7 +805,7 @@ static int core2_vpmu_do_interrupt(struct cpu_user_regs *regs)
     return 1;
 }
 
-static void core2_vpmu_destroy(struct vcpu *v)
+static void cf_check core2_vpmu_destroy(struct vcpu *v)
 {
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
 
diff --git a/xen/arch/x86/oprofile/op_model_athlon.c b/xen/arch/x86/oprofile/op_model_athlon.c
index 2177f02946e2..7bc5853a6c23 100644
--- a/xen/arch/x86/oprofile/op_model_athlon.c
+++ b/xen/arch/x86/oprofile/op_model_athlon.c
@@ -164,7 +164,7 @@ static inline u64 op_amd_randomize_ibs_op(u64 val)
     return val;
 }
 
-static void athlon_fill_in_addresses(struct op_msrs * const msrs)
+static void cf_check athlon_fill_in_addresses(struct op_msrs * const msrs)
 {
 	msrs->counters[0].addr = MSR_K7_PERFCTR0;
 	msrs->counters[1].addr = MSR_K7_PERFCTR1;
@@ -177,7 +177,7 @@ static void athlon_fill_in_addresses(struct op_msrs * const msrs)
 	msrs->controls[3].addr = MSR_K7_EVNTSEL3;
 }
 
-static void fam15h_fill_in_addresses(struct op_msrs * const msrs)
+static void cf_check fam15h_fill_in_addresses(struct op_msrs * const msrs)
 {
 	msrs->counters[0].addr = MSR_AMD_FAM15H_PERFCTR0;
 	msrs->counters[1].addr = MSR_AMD_FAM15H_PERFCTR1;
@@ -194,7 +194,7 @@ static void fam15h_fill_in_addresses(struct op_msrs * const msrs)
 	msrs->controls[5].addr = MSR_AMD_FAM15H_EVNTSEL5;
 }
 
-static void athlon_setup_ctrs(struct op_msrs const * const msrs)
+static void cf_check athlon_setup_ctrs(struct op_msrs const * const msrs)
 {
 	uint64_t msr_content;
 	int i;
@@ -308,9 +308,9 @@ static inline int handle_ibs(int mode, struct cpu_user_regs const * const regs)
     return 1;
 }
 
-static int athlon_check_ctrs(unsigned int const cpu,
-			     struct op_msrs const * const msrs,
-			     struct cpu_user_regs const * const regs)
+static int cf_check athlon_check_ctrs(
+	unsigned int const cpu, struct op_msrs const * const msrs,
+	struct cpu_user_regs const * const regs)
 
 {
 	uint64_t msr_content;
@@ -386,7 +386,7 @@ static inline void start_ibs(void)
 	}
 }
  
-static void athlon_start(struct op_msrs const * const msrs)
+static void cf_check athlon_start(struct op_msrs const * const msrs)
 {
 	uint64_t msr_content;
 	int i;
@@ -415,7 +415,7 @@ static void stop_ibs(void)
 		wrmsrl(MSR_AMD64_IBSOPCTL, 0);
 }
 
-static void athlon_stop(struct op_msrs const * const msrs)
+static void cf_check athlon_stop(struct op_msrs const * const msrs)
 {
 	uint64_t msr_content;
 	int i;
diff --git a/xen/arch/x86/oprofile/op_model_p4.c b/xen/arch/x86/oprofile/op_model_p4.c
index b08ba53cbd39..d047258644db 100644
--- a/xen/arch/x86/oprofile/op_model_p4.c
+++ b/xen/arch/x86/oprofile/op_model_p4.c
@@ -390,7 +390,7 @@ static unsigned int get_stagger(void)
 static unsigned long reset_value[NUM_COUNTERS_NON_HT];
 
 
-static void p4_fill_in_addresses(struct op_msrs * const msrs)
+static void cf_check p4_fill_in_addresses(struct op_msrs * const msrs)
 {
 	unsigned int i;
 	unsigned int addr, stag;
@@ -530,7 +530,7 @@ static void pmc_setup_one_p4_counter(unsigned int ctr)
 }
 
 
-static void p4_setup_ctrs(struct op_msrs const * const msrs)
+static void cf_check p4_setup_ctrs(struct op_msrs const * const msrs)
 {
 	unsigned int i;
 	uint64_t msr_content;
@@ -609,9 +609,9 @@ static void p4_setup_ctrs(struct op_msrs const * const msrs)
 	}
 }
 
-static int p4_check_ctrs(unsigned int const cpu,
-                         struct op_msrs const * const msrs,
-                         struct cpu_user_regs const * const regs)
+static int cf_check p4_check_ctrs(
+	unsigned int const cpu, struct op_msrs const * const msrs,
+	struct cpu_user_regs const * const regs)
 {
 	unsigned long ctr, stag, real;
 	uint64_t msr_content;
@@ -665,7 +665,7 @@ static int p4_check_ctrs(unsigned int const cpu,
 }
 
 
-static void p4_start(struct op_msrs const * const msrs)
+static void cf_check p4_start(struct op_msrs const * const msrs)
 {
 	unsigned int stag;
 	uint64_t msr_content;
@@ -683,7 +683,7 @@ static void p4_start(struct op_msrs const * const msrs)
 }
 
 
-static void p4_stop(struct op_msrs const * const msrs)
+static void cf_check p4_stop(struct op_msrs const * const msrs)
 {
 	unsigned int stag;
 	uint64_t msr_content;
diff --git a/xen/arch/x86/oprofile/op_model_ppro.c b/xen/arch/x86/oprofile/op_model_ppro.c
index 72c504a10216..8d7e13ea8777 100644
--- a/xen/arch/x86/oprofile/op_model_ppro.c
+++ b/xen/arch/x86/oprofile/op_model_ppro.c
@@ -63,7 +63,7 @@ static int counter_width = 32;
 static unsigned long reset_value[OP_MAX_COUNTER];
 int ppro_has_global_ctrl = 0;
 
-static void ppro_fill_in_addresses(struct op_msrs * const msrs)
+static void cf_check ppro_fill_in_addresses(struct op_msrs * const msrs)
 {
 	int i;
 
@@ -74,7 +74,7 @@ static void ppro_fill_in_addresses(struct op_msrs * const msrs)
 }
 
 
-static void ppro_setup_ctrs(struct op_msrs const * const msrs)
+static void cf_check ppro_setup_ctrs(struct op_msrs const * const msrs)
 {
 	uint64_t msr_content;
 	int i;
@@ -128,9 +128,9 @@ static void ppro_setup_ctrs(struct op_msrs const * const msrs)
 	}
 }
 
-static int ppro_check_ctrs(unsigned int const cpu,
-                           struct op_msrs const * const msrs,
-                           struct cpu_user_regs const * const regs)
+static int cf_check ppro_check_ctrs(
+	unsigned int const cpu, struct op_msrs const * const msrs,
+	struct cpu_user_regs const * const regs)
 {
 	u64 val;
 	int i;
@@ -170,7 +170,7 @@ static int ppro_check_ctrs(unsigned int const cpu,
 }
 
 
-static void ppro_start(struct op_msrs const * const msrs)
+static void cf_check ppro_start(struct op_msrs const * const msrs)
 {
 	uint64_t msr_content;
 	int i;
@@ -190,7 +190,7 @@ static void ppro_start(struct op_msrs const * const msrs)
 }
 
 
-static void ppro_stop(struct op_msrs const * const msrs)
+static void cf_check ppro_stop(struct op_msrs const * const msrs)
 {
 	uint64_t msr_content;
 	int i;
@@ -206,7 +206,7 @@ static void ppro_stop(struct op_msrs const * const msrs)
         wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, 0x0ULL);
 }
 
-static int ppro_is_arch_pmu_msr(u64 msr_index, int *type, int *index)
+static int cf_check ppro_is_arch_pmu_msr(u64 msr_index, int *type, int *index)
 {
 	if ( (msr_index >= MSR_IA32_PERFCTR0) &&
             (msr_index < (MSR_IA32_PERFCTR0 + num_counters)) )
@@ -226,7 +226,7 @@ static int ppro_is_arch_pmu_msr(u64 msr_index, int *type, int *index)
         return 0;
 }
 
-static int ppro_allocate_msr(struct vcpu *v)
+static int cf_check ppro_allocate_msr(struct vcpu *v)
 {
 	struct vpmu_struct *vpmu = vcpu_vpmu(v);
 	struct arch_msr_pair *msr_content;
@@ -245,7 +245,7 @@ static int ppro_allocate_msr(struct vcpu *v)
 	return 0;
 }
 
-static void ppro_free_msr(struct vcpu *v)
+static void cf_check ppro_free_msr(struct vcpu *v)
 {
 	struct vpmu_struct *vpmu = vcpu_vpmu(v);
 
@@ -255,7 +255,8 @@ static void ppro_free_msr(struct vcpu *v)
 	vpmu_reset(vpmu, VPMU_PASSIVE_DOMAIN_ALLOCATED);
 }
 
-static void ppro_load_msr(struct vcpu *v, int type, int index, u64 *msr_content)
+static void cf_check ppro_load_msr(
+	struct vcpu *v, int type, int index, u64 *msr_content)
 {
 	struct arch_msr_pair *msrs = vcpu_vpmu(v)->context;
 	switch ( type )
@@ -269,7 +270,8 @@ static void ppro_load_msr(struct vcpu *v, int type, int index, u64 *msr_content)
 	}
 }
 
-static void ppro_save_msr(struct vcpu *v, int type, int index, u64 msr_content)
+static void cf_check ppro_save_msr(
+	struct vcpu *v, int type, int index, u64 msr_content)
 {
 	struct arch_msr_pair *msrs = vcpu_vpmu(v)->context;
 
-- 
2.11.0


