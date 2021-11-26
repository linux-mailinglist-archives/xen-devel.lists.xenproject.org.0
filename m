Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB58445EE83
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:05:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232755.403680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqauS-0005Rs-DQ; Fri, 26 Nov 2021 13:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232755.403680; Fri, 26 Nov 2021 13:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqauR-0005EM-VC; Fri, 26 Nov 2021 13:04:59 +0000
Received: by outflank-mailman (input) for mailman id 232755;
 Fri, 26 Nov 2021 13:04:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqauQ-0002zD-BW
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:04:58 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73a512a7-4eb9-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 14:04:57 +0100 (CET)
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
X-Inumbo-ID: 73a512a7-4eb9-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931897;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kxMBCLxYJcgL5gD+raiROxZG9c0M3vO+3cMFtFlzQtM=;
  b=U4QDuJ8CsthjleWF4gs0sYogp9IWHGUAqNa71fIAL8I3OZb0qIKw2qeU
   KMXHx2jcyT2o31wIumbIxQavCN5pcjcg2JAqtclJp3SkGMmquL4yMzcI3
   +Dh0kRrMACom30MGX0GisZ5EvNSw3IU/lbkEnQza/Sxhb1rVzMwNYutdb
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: TDmvKVtgsxQpQCb6YRl/gPx5kb4NDDZGF2hDYlO2IQ5Stx9TmORE+dBNqRDQhyR6bAU4hcxcR4
 ARuU9IXn1ocZhop4HrdU0p+YOgPYHd3ex21BecHQSvSQoN3EpVDDtYQtdhi7b/KQDVdlh1ykHy
 Z5owYzt09pLFXYg3ZAf9rwm0GVkcQgNI/+URoyFrbSIcHqiSXYeVY8eYZN3ZFQV5Ob1cYinhwL
 PMqvmBnbm4Magh7d7B3MJ/3Cv/8Z8mXhV88ttV9tQJ/HpItw7dQpExT585ylrZrVjwMtSad2zj
 /GwGg0MR+bkt6xD+FAi7OKYu
X-SBRS: 5.1
X-MesageID: 59063944
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ejN0KahhiOQTLuwy1gD0VXAEX161rRcKZh0ujC45NGQN5FlHY01je
 htvW22Eb6uJa2akKtl/b9nk9RhT7JaHmNJhQAtvqilnFiob9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cy34Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1tsZa6VQgXYZfps+EjTxAENz1UGpR/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNauPP
 5RCOGYzBPjGS0FXCHUyCYwRpeGHjWvvXRtKtWyyq6VitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRIDsXKdiewjqt6W+3i6nEmiaTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4M+kw4h2C9PXuxi2cOHQNEhpdQvsfjZpjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnFdE1ZcizX3iMRq10+UEI4/eEKgpoStQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtQezARVodt/xory9U
 J4swJP2AAcmV8zlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRkybZZaJGC4P
 BGP4mu9AaO/2lPxNsebhKrrVqwXIVXIT4y5Bpg4kPISCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGLq9NOdg5TciBgbX00wuQOHtO+zsNdMDlJI5fsLXkJIuSJRoxZybXF+
 G+TQEhdxAatjHHLM1zSOHtidKnuTdB0qndiZX4gOlOh2n4CZ4ez7fhAK8trLOd/rOEzn+RpS
 /QletmbBqgdQDrw5DlAP4L2q5ZvdUr3iFvWbTalejU2Y7VpWxfNpo3/ZgLq+SRXVni3uMIyr
 qeOzATeRZZfFQ1uANyPMKCkzk+rvGhbk+V3BhOaLt5WcUTq0Y5rNy2u0aNnf5BScU3On2LI2
 RyXDBEUofj2j7U0qNSZ17qZq4qJEvdlGhYIFWfs8rvrZzLR+XCuwNEcXb/QLyzdTm795I6re
 f5Rk6PnKPQCkVtH79h8HrJswf5s7tfjveYHnAFtHXGNZFW3ELJwZHKB2JAX5KFKw7ZYvyqwW
 16OpYYGaenYZpu9HQ5DPhchY8SCyeoQy2vb4vkCKUnn4DN6oeicWkJIMhjQ0CFQIdOZ6m/+L
 TvNbCLO1zGCtw==
IronPort-HdrOrdr: A9a23:HiDd16zUmy4CE7xUWPaPKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7Y0mPH7P+VAssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkHNDSaNzlHZKjBjzVQa+xQouW6zA==
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="59063944"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 42/65] x86/guest: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:23 +0000
Message-ID: <20211126123446.32324-43-andrew.cooper3@citrix.com>
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
 xen/arch/x86/guest/hyperv/hyperv.c | 10 +++++-----
 xen/arch/x86/guest/xen/xen.c       | 11 ++++++-----
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/guest/hyperv/hyperv.c b/xen/arch/x86/guest/hyperv/hyperv.c
index 84221b751453..b101ba3080b4 100644
--- a/xen/arch/x86/guest/hyperv/hyperv.c
+++ b/xen/arch/x86/guest/hyperv/hyperv.c
@@ -175,7 +175,7 @@ static int setup_vp_assist(void)
     return 0;
 }
 
-static void __init setup(void)
+static void __init cf_check setup(void)
 {
     ASM_CONSTANT(HV_HCALL_PAGE, __fix_x_to_virt(FIX_X_HYPERV_HCALL));
 
@@ -188,7 +188,7 @@ static void __init setup(void)
         panic("VP assist page setup failed\n");
 }
 
-static int ap_setup(void)
+static int cf_check ap_setup(void)
 {
     int rc;
 
@@ -199,7 +199,7 @@ static int ap_setup(void)
     return setup_vp_assist();
 }
 
-static void __init e820_fixup(struct e820map *e820)
+static void __init cf_check e820_fixup(struct e820map *e820)
 {
     uint64_t s = HV_HCALL_MFN << PAGE_SHIFT;
 
@@ -207,8 +207,8 @@ static void __init e820_fixup(struct e820map *e820)
         panic("Unable to reserve Hyper-V hypercall range\n");
 }
 
-static int flush_tlb(const cpumask_t *mask, const void *va,
-                     unsigned int flags)
+static int cf_check flush_tlb(
+    const cpumask_t *mask, const void *va, unsigned int flags)
 {
     if ( !(ms_hyperv.hints & HV_X64_REMOTE_TLB_FLUSH_RECOMMENDED) )
         return -EOPNOTSUPP;
diff --git a/xen/arch/x86/guest/xen/xen.c b/xen/arch/x86/guest/xen/xen.c
index 17807cdea688..9c2defaa6621 100644
--- a/xen/arch/x86/guest/xen/xen.c
+++ b/xen/arch/x86/guest/xen/xen.c
@@ -237,7 +237,7 @@ static int init_evtchn(void)
     return rc;
 }
 
-static void __init setup(void)
+static void __init cf_check setup(void)
 {
     init_memmap();
 
@@ -265,7 +265,7 @@ static void __init setup(void)
     BUG_ON(init_evtchn());
 }
 
-static int ap_setup(void)
+static int cf_check ap_setup(void)
 {
     set_vcpu_id();
 
@@ -295,7 +295,7 @@ static void cf_check ap_resume(void *unused)
     BUG_ON(init_evtchn());
 }
 
-static void resume(void)
+static void cf_check resume(void)
 {
     /* Reset shared info page. */
     map_shared_info();
@@ -318,13 +318,14 @@ static void resume(void)
         pv_console_init();
 }
 
-static void __init e820_fixup(struct e820map *e820)
+static void __init cf_check e820_fixup(struct e820map *e820)
 {
     if ( pv_shim )
         pv_shim_fixup_e820(e820);
 }
 
-static int flush_tlb(const cpumask_t *mask, const void *va, unsigned int flags)
+static int cf_check flush_tlb(
+    const cpumask_t *mask, const void *va, unsigned int flags)
 {
     return xen_hypercall_hvm_op(HVMOP_flush_tlbs, NULL);
 }
-- 
2.11.0


