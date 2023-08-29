Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4AC78C653
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 15:44:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592239.924910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaz0Z-0004l2-5h; Tue, 29 Aug 2023 13:43:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592239.924910; Tue, 29 Aug 2023 13:43:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaz0Z-0004iR-1l; Tue, 29 Aug 2023 13:43:51 +0000
Received: by outflank-mailman (input) for mailman id 592239;
 Tue, 29 Aug 2023 13:43:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wiqx=EO=citrix.com=prvs=598c0cf4a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qaz0W-0004TH-U5
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 13:43:48 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13c74970-4672-11ee-9b0d-b553b5be7939;
 Tue, 29 Aug 2023 15:43:47 +0200 (CEST)
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
X-Inumbo-ID: 13c74970-4672-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1693316627;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xe99RwbYBP3BHDDttjoRcDbqQqmftTeKL9chAAMix0I=;
  b=Q0I37cxDsnOkcbs2Vw2JNjVzVmMXbBa9SwNTscHEXgGFXLmFFePATuUL
   S9ZM2cm/G18Gxz5zw6C5vPkCi8QHKInh2E2A6l1m5bz5k3Yz2tMawIyYE
   5J3euFWbYJ3i1fsypi6DAsrMN0j0qHfZTJm8EHo2vY40x0EJbnNpqIURl
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 120997914
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:vJ9He6ChM7VPzhVW/wHjw5YqxClBgxIJ4kV8jS/XYbTApDIk1jBVn
 2ZLXm6PPPvcNjT8L9x2btux9B9XuJKAxtNrQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMscpvlDs15K6p4GNC7wRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw4tlVOCJn0
 tYiNHMWZR2Mh8Dm0YqcY7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4bSFJQKzx/Ez
 o7A1zv3BzdGCY2d8j/G+XG1nNXEuxzgBbtHQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFamlBMBX9tbE8Uh9RqAjKHT5m6xGWwsXjNHLts8u6ceRz0s0
 V/PnNrvCnpsqpWaTHuc8vGfqjbaBMQOBTZcP2leF1JDuoS95thp1XojU+qPDoatsf/MWhjX6
 QqW7zM1iroTr54a74KSqAWvby2XmrDFSQs85wPyV22j7x9kaIPNW7FE+WQ3/t4bct/HEwDpU
 Gws3pHHsbtQVc3leDmlGr1lIV2/2xqS3NQwa3ZLFoJpyTmi8mXLkWt4sGAnfxcB3irplFbUj
 K7vVeF5vs870JiCN/Ufj2eN5yMClPOIKDgdfqqIBueim7AoHON9wAlgZFSLw0fmm1U2nKc0N
 P+zKJj9VixGVvs+k2HqH4/xNIPHIQhkmQvuqW3TlUz7gdJymlbIIVv6DLd+Rr9gt/7VyOkk2
 91eK9GL231ivB7WO0HqHXooBQlSdxATXMmmw/G7g8bfemKK7kl9Ua6OqV7gEqQ595loehDgp
 SrjBhEFmQKi2xUq62yiMxheVV8mZr4nxVpTAMDmFQzAN6QLCWp30JoiSg==
IronPort-HdrOrdr: A9a23:vdSfDa0VzpvUSbQbZ8P51wqjBIgkLtp133Aq2lEZdPUCSL3+qy
 nIpoV56faUslYssR4b8uxoVJPrfZq+z/9ICOsqUotKBzOW3FdARbsKhbcKpQeMJ8SUzIBgPM
 lbH5SXp7fLfD5HZWqR2njbLz6AquP3lZyVuQ==
X-Talos-CUID: 9a23:2mP8N28HtP3T+RWWXpKVv1YrOPlmW1r39muTOES1BmZLGKytbnbFrQ==
X-Talos-MUID: 9a23:AAG+ngU7L5nvbfvq/GDigRc+CZZq2KHtA0MUi68NnfafaBUlbg==
X-IronPort-AV: E=Sophos;i="6.02,210,1688443200"; 
   d="scan'208";a="120997914"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jinoh Kang
	<jinoh.kang.kr@gmail.com>
Subject: [PATCH 1/3] x86: Reject bad %dr6/%dr7 values when loading guest state
Date: Tue, 29 Aug 2023 14:43:31 +0100
Message-ID: <20230829134333.3551243-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230829134333.3551243-1-andrew.cooper3@citrix.com>
References: <20230829134333.3551243-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Right now, bad PV state is silently dropped and zeroed, while bad HVM state is
passed directly to hardware and can trigger VMEntry/VMRUN failures.  e.g.

  (XEN) d12v0 vmentry failure (reason 0x80000021): Invalid guest state (0)
  ...
  (XEN) RFLAGS=0x00000002 (0x00000002)  DR7 = 0x4000000000000001

Furthermore, prior to c/s 30f43f4aa81e ("x86: Reorganise and rename debug
register fields in struct vcpu") in Xen 4.11 where v->arch.dr6 was reduced in
width, the toolstack can cause a host crash by loading a bad %dr6 value on
VT-x hardware.

Reject any %dr6/7 values with upper bits set.  For PV guests, also audit
%dr0..3 so they aren't silently zeroed later in the function.  Leave a comment
behind explaing how %dr4/5 handling changed, and why they're ignored now.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jinoh Kang <jinoh.kang.kr@gmail.com>
---
 xen/arch/x86/domain.c  | 19 +++++++++++++++++++
 xen/arch/x86/hvm/hvm.c |  8 ++++++++
 2 files changed, 27 insertions(+)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index fe86a7f8530f..0698e6d486fe 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1074,8 +1074,27 @@ int arch_set_info_guest(
 #endif
     flags = c(flags);
 
+    if ( !compat )
+    {
+        if ( c(debugreg[6]) != (uint32_t)c(debugreg[6]) ||
+             c(debugreg[7]) != (uint32_t)c(debugreg[7]) )
+            return -EINVAL;
+    }
+
     if ( is_pv_domain(d) )
     {
+        /*
+         * Prior to Xen 4.11, dr5 was used to hold the emulated-only
+         * subset of dr7, and dr4 was unused.
+         *
+         * In Xen 4.11 and later, dr4/5 are written as zero, ignored for
+         * backwards compatibility, and dr7 emulation is handled
+         * internally.
+         */
+        for ( i = 0; i < ARRAY_SIZE(v->arch.dr); i++ )
+            if ( !access_ok(c(debugreg[i]), sizeof(long)) )
+                return -EINVAL;
+
         if ( !compat )
         {
             if ( !is_canonical_address(c.nat->user_regs.rip) ||
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 3a99c0ff20be..3dc2019eca67 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1032,6 +1032,14 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
         return -EINVAL;
     }
 
+    if ( ctxt.dr6 != (uint32_t)ctxt.dr6 ||
+         ctxt.dr7 != (uint32_t)ctxt.dr7 )
+    {
+        printk(XENLOG_G_ERR "%pv: HVM restore: bad DR6 %#"PRIx64" or DR7 %#"PRIx64"\n",
+               v, ctxt.dr6, ctxt.dr7);
+        return -EINVAL;
+    }
+
     if ( ctxt.cr3 >> d->arch.cpuid->extd.maxphysaddr )
     {
         printk(XENLOG_G_ERR "HVM%d restore: bad CR3 %#" PRIx64 "\n",
-- 
2.30.2


