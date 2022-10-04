Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FF75F472B
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 18:09:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415702.660357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofkTU-0007GD-9Q; Tue, 04 Oct 2022 16:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415702.660357; Tue, 04 Oct 2022 16:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofkTU-0007E6-6N; Tue, 04 Oct 2022 16:08:52 +0000
Received: by outflank-mailman (input) for mailman id 415702;
 Tue, 04 Oct 2022 16:08:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YyPd=2F=citrix.com=prvs=269269faf=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ofkTS-00067g-8I
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 16:08:50 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3de8937-43fe-11ed-964a-05401a9f4f97;
 Tue, 04 Oct 2022 18:08:48 +0200 (CEST)
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
X-Inumbo-ID: d3de8937-43fe-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664899728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JBROCaFJ+EpzPToOVVp3gIBCu4A3D791xZNcgjLwDS4=;
  b=IrPP8bLbJxnpqgEDOPzqh+ZTdrezlccb9QB3182MoC55RRmn0miofHNl
   iIsReyvSE2lY8kBgSmmRv8RfYjkP3/wClAzrMQcBYixVizVbUc0mNhScx
   KKtK4oVPqxE7Ehu5X1K6IucS8KwNHh5+Tyquw/mwSKECVfDiiS36Zo8+i
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 81081088
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1Li0NqmOm0B0AHdQVZ2OwLLo5gxWJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKUGiAOqmDNjSke9wkOdy1p0oFup7Wn9dhSwU4pCkxHyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6UqicUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9XuDgNyo4GlC5wRmOagQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfCzBK1
 PAaGS03RQnSpvOc+pWja+NLr5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKkSbC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TaHJ0Fxx7I9
 goq+UzSRTQQLdCE8QO842qBid3rwAT4RogNQejQGvlC3wTImz175ActfXu2p+OozHG3Xd13I
 lYRvCEpqMAa8UWxS9DnUh6QoXiavwUdUd5dD+077g6WzqPepQ2eAwAsQjNEafQnstE3Xj0g0
 lKVn9LvCidrubfTQnWYnp+EoDX3NSULIGsqYS4fURBD89TluJs0jB/EUpBkCqHdpv/fFCz0w
 juKhDMjnLhVhskOv42k+XjXjjTqoYLGJjPZ/S2OADjjtFkgItf4Ocr4sjA38MqsMq6TH12gs
 Ho1hvK19bEvHLu3szSsSsIkSeTBC+m+DBXQhltmHp8E/jur+mK+cY043AySNHuFIe5fJ2a3P
 Ra7VRd5ocYKYSD0NfMfj5eZUZxC8ET2KTjyuhk4hPJqa4M5SgKI9ToGiaW4jzG0yxhEfU3S1
 P6mnSeQ4ZQyU/0PINmeHb11PVoXKscWmgvuqWjTlUjP7FZnTCf9pU05GFWPdPsly6iPvR/Y9
 d1SX+PTlUsDALekOXmHr9BMRbzvEZTcLc+eliCqXrTbfloO9J8JUpc9Po/Ni6Q6xv8Ix48kD
 1m2W1NCyUqXuEAr3T6iMyk7AI4DqL4l8hrXywRwYgvzs5XiCK7zhJoim2wfJOJ2rLM5naMrJ
 xTHEu3Zaslypv3802x1RfHAQEZKL3xHWSrm0/KZXQUC
IronPort-HdrOrdr: A9a23:vZ/Yj6Hy/eQKcB+2pLqE0seALOsnbusQ8zAXP0AYc31om6uj5r
 iTdZUgpGbJYVkqKRIdcLy7V5VoBEmskaKdgrNhW4tKPjOW2ldARbsKheCJrlHd8m/Fh4lgPM
 9bAtND4bbLbWSS4/yV3ODBKadE/OW6
X-IronPort-AV: E=Sophos;i="5.95,158,1661832000"; 
   d="scan'208";a="81081088"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Henry Wang
	<Henry.Wang@arm.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Demi Marie Obenour
	<demi@invisiblethingslab.com>
Subject: [PATCH 2/2] x86: Activate Data Operand Invariant Timing Mode by default
Date: Tue, 4 Oct 2022 17:08:10 +0100
Message-ID: <20221004160810.25364-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221004160810.25364-1-andrew.cooper3@citrix.com>
References: <20221004160810.25364-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Intel IceLake and later CPUs have microarchitectural behaviours which cause
data-dependent timing behaviour.  This is not an issue for 99% of software,
but it is a problem for cryptography routines.  On these CPUs, a new
architectural feature, DOITM, was retrofitted in microcode.

For now, Xen can't enumerate DOITM to guest kernels; getting this working is
still in progress.  The consequence is that guest kernels will incorrectly
conclude that they are safe.

To maintain the safety of current software, activate DOITM unilaterally.  This
will be relaxed in the future when we can enumerate the feature properly to
guests.

As an emergency stopgap, this behaviour can be disabled by specifying
`cpuid=no-doitm` on Xen's command line, but is not guaranteed ABI moving
forward.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Henry Wang <Henry.Wang@arm.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/x86/cpu/common.c            | 29 +++++++++++++++++++++++++++++
 xen/arch/x86/cpuid.c                 |  5 +++++
 xen/arch/x86/include/asm/processor.h |  2 ++
 xen/tools/gen-cpuid.py               |  2 ++
 4 files changed, 38 insertions(+)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 0412dbc915e5..8c46a4db430a 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -209,6 +209,34 @@ void ctxt_switch_levelling(const struct vcpu *next)
 		alternative_vcall(ctxt_switch_masking, next);
 }
 
+bool __ro_after_init opt_doitm = true;
+
+static void doitm_init(void)
+{
+    uint64_t val;
+
+    if ( !opt_doitm || !cpu_has_arch_caps )
+        return;
+
+    rdmsrl(MSR_ARCH_CAPABILITIES, val);
+    if ( !(val & ARCH_CAPS_DOITM) )
+        return;
+
+    /*
+     * We are currently unable to enumerate MSR_ARCH_CAPS to guest.  As a
+     * consequence, guest kernels will believe they're safe even when they are
+     * not.
+     *
+     * Until we can enumerate DOITM properly for guests, set it unilaterally.
+     * This prevents otherwise-correct crypto from becoming vulnerable to
+     * timing sidechannels.
+     */
+
+    rdmsrl(MSR_UARCH_MISC_CTRL, val);
+    val |= UARCH_CTRL_DOITM;
+    wrmsrl(MSR_UARCH_MISC_CTRL, val);
+}
+
 bool_t opt_cpu_info;
 boolean_param("cpuinfo", opt_cpu_info);
 
@@ -532,6 +560,7 @@ void identify_cpu(struct cpuinfo_x86 *c)
 	/* Now the feature flags better reflect actual CPU features! */
 
 	xstate_init(c);
+	doitm_init();
 
 #ifdef NOISY_CAPS
 	printk(KERN_DEBUG "CPU: After all inits, caps:");
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 112ee63a9449..09c1ee18fd95 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -106,7 +106,12 @@ static void __init cf_check _parse_xen_cpuid(
     const char *name, unsigned int feat, bool val)
 {
     if ( unlikely(feat == ~0u) )
+    {
+        if ( strcmp(name, "doitm") == 0 )
+            opt_doitm = val;
+
         return;
+    }
 
     if ( !val )
         setup_clear_cpu_cap(feat);
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 8e2816fae9b9..2978416e6c5b 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -637,6 +637,8 @@ enum ap_boot_method {
 };
 extern enum ap_boot_method ap_boot_method;
 
+extern bool opt_doitm;
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* __ASM_X86_PROCESSOR_H */
diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index f3045b3bfd36..78a3a5c1941f 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -303,6 +303,8 @@ def crunch_numbers(state):
     # specially
     #
     pseduo_names = (
+        # Data Operand Invariant Timing Mode.  Lives in MSR_ARCH_CAPS
+        "doitm",
     )
 
     for n in pseduo_names:
-- 
2.11.0


