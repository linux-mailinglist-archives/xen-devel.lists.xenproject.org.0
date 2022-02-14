Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 213524B5119
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:06:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271715.466392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3e-0000qt-OZ; Mon, 14 Feb 2022 13:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271715.466392; Mon, 14 Feb 2022 13:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3e-0000bE-4O; Mon, 14 Feb 2022 13:06:22 +0000
Received: by outflank-mailman (input) for mailman id 271715;
 Mon, 14 Feb 2022 13:06:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb2W-0008IH-WA
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:05:13 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc264d17-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:05:09 +0100 (CET)
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
X-Inumbo-ID: bc264d17-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843909;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=W97kFRgj/MifUbIaqTE03bRGTNYxneRqJuik8bYXmus=;
  b=Thd1PFc2MnRcHBfQMxNvSPomzPfvLUJHOZ4F39NrscNwPRdQUdWFMtlt
   wWxZrUHtTawOJjhQ8u3QGynC43rjZDcCkJA0rUFrcahN7z8f2a879h22t
   SP+dlt/2rSlgNw0gvqEExKPGpjjY/hmDQs1KVBVk+NRAkAMg5BiOnpGUj
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 0kQ1sX3mZvJKZSOECf8Dl6WPt+Bb5qhEtGkfZ7gae1V/6iBUBIwWfi0MvudW4E8bzxH581D6BD
 9EOwQ4DBb5fuK+/kGBnRdybZ4xg/daZ4sni1Mq1kcXVdW3XNu2xC5EYA0AQqnRTMyWEhlbWl/y
 3baz1A/+EfN7+tFWEc/2stWrSppaTdZWIigq4PSG64UZ7hcyc+RcAjXPZFnVyQxg9RJZomyBjk
 tUcIj0AmlZRu/f0GrE0I0KlIIOWIKuo343IWJtlH0hTrWQxBU06Pg6J9wrwXvqtj+Gtw4b6GrK
 iFfIr+LQmWJbCm3N2D0ZJZR7
X-SBRS: 5.1
X-MesageID: 66374839
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:r8h/KKJH11eaxoWtFE+Rz5IlxSXFcZb7ZxGr2PjKsXjdYENS1zwEx
 mIdXjzVP63cY2CnLtl2aYzj9E9UuJLdztZmQQZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug6x7Zg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2rlfkoz
 uhhjaC3QDssEJ/KlegzVklhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Glu3Z8STa2PD
 yYfQWFTXUvFcloRBgpUMLYywfXrgEnPLBQN/Tp5ooJoujOOnWSdyoPFINfTP9CHW8hRtkKZv
 X7duXT0BAkAM96SwibD9Wij7tIjhguiBthUTufhsKc33hvDnQT/FSH6S3OZq9DgjHOSY+5YI
 nAR1BgooKQc8RySG4yVswKDnFaIuRsVWtx1GuI86R2Qxqe83zt1FlToXRYaNoV46ZZeqSgCk
 wbQwoi3XWAHXKi9FCrFnop4uw9eLsT8wYUqQSYfBTUI7ND4yG3YpkKeF40zeEJZYzCcJN0R/
 9xohHVk71nwpZRSv0lewbwgq2jyzqUltiZvum3qspuNt2uVnrKNaY2y8kT85v1dNoufRVTpl
 CFax5TBvLBTUMnUz3blrAAx8FaBvajtDdEhqQQ3Q8lJG8qFpxZPgry8EBkhfRw0Y67oiBfiY
 VPJuBM52XOgFCDCUEODWKroU55C5fG5TbzND6mIBvITMskZXFLWp0lGOB/Pt10BZWBxyMnTz
 7/AKp3yZZvbYIw6pAeLqxA1j+N6mHBmnTmLLX05pjz+uYejiLeuYe9tGDOzgioRtctoeS3Zr
 IRSMdWk0RJaXLGsayXb69dLf1sLMWI6Fdb9rMkOLryPJQ9vGWcADf7NwOx+J9w5zvoNzuqYr
 GugXkJ4yUbkgSGVIwu9dX0+OqjkWoxyrCxnMHV0b0qowXUqfa2m8LwbK8ksZbAi+eE6lax0Q
 vAJdt+uGPNKTjibqT0RYYOk9N5pdQixhBLINC2gOWBtc5llTg3P29nlYgqwq3VeUnvp7ZMz+
 uTy2BnaTJwPQxVZIPzXMP//nUmsuXU9mf5pWxeaKNdkZ0ixopNhLDb8j6FrLphUewnD3DaTy
 y2fHQwc+bvWu4Yw/dTE2fKEooOuH7csF0ZWBTCGv7O/NC2c9Wu/245QFu2PeGmFBm/z/ayjY
 8RTzu39b6JbzAob7dIkHuY517866vvuu6Ren1ZtE3j8Zli2Dq9tfyud1s5Vu6wRnrJUtGNag
 K5UFgW27VlRBP7YLQ==
IronPort-HdrOrdr: A9a23:IlRx5KuOjcTHE5hSfMXq4eTl7skDdNV00zEX/kB9WHVpmszxra
 6TdZUgpGbJYVkqOE3I9ertBEDEewK4yXcX2/h2AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YGT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="66374839"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 46/70] x86/guest: CFI hardening
Date: Mon, 14 Feb 2022 12:51:03 +0000
Message-ID: <20220214125127.17985-47-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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


