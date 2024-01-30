Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20517842EA1
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 22:28:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673690.1048127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUvdT-0001hE-PC; Tue, 30 Jan 2024 21:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673690.1048127; Tue, 30 Jan 2024 21:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUvdT-0001ei-MZ; Tue, 30 Jan 2024 21:27:15 +0000
Received: by outflank-mailman (input) for mailman id 673690;
 Tue, 30 Jan 2024 21:27:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Trk4=JI=citrix.com=prvs=75271d196=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1rUvdS-0001ea-2p
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 21:27:14 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52f8477b-bfb6-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 22:27:11 +0100 (CET)
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
X-Inumbo-ID: 52f8477b-bfb6-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1706650031;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8y0bRSy0+N/o2vbhG8udrGq58MblxfpHPx6TknWZBpE=;
  b=dJHfP8GlZA6/DnU+qfXceJZ1gN+AsDliVziE9gOWzyWHwUT7tST1EyDg
   NYIv+qcEH5x/p5LhlLoMhbLILqXpzYl3zjWX4KOKGZy6nlj0zaYmIhFOH
   fBJK41nt9pQsnZkgDrfJyxJc6GSkHsTGPynMpuq4q9dgkOkFtxbugXGTI
   Q=;
X-CSE-ConnectionGUID: KQ4cbhfqRrSN6M/d6A1Y/Q==
X-CSE-MsgGUID: apOJKLZQTQSLxtle0/aegA==
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 130226928
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:dg8OEatce/cKYMngfwnTtSUcYefnVC1eMUV32f8akzHdYApBsoF/q
 tZmKWrVaauJZTajfth+bYu/pEkPsJ7cytE3HFE4r31mHy4b+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq5Vv0gnRkPaoX5AaFzyFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwCwlRZRqDifuM2omdFMwripoKdfisBdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkAefAhPYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 TqcpTqoWEFy2Nq3wCKi0FGItNbzpBjfSJ4WGeX///NlqQjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O/Ez7QiW4rbX5wufCXkJSnhKb9lOnO0cSCEu1
 1SJt8j0HjEpu7qQIVqG7audpz62PSkTLEcBaDUCQA9D5MPsyKksijrfQ9AlF7S65vX3BDXxz
 jaivCU4wbIJgqY2O76TpA6dxWj2/96QE19zuV2/sn+ZAh1RR7f5bIao50Hh981mcqPeQgeo5
 UlDop3LhAwRNq1hhBBhUc1UQ+n3ua/UYWKA6WODCaXN4NhExpJCQWyzyGsnTKuRGpxYEQIFm
 WeK0e+r2LddPWGxcYh8aJ+rBsIhwMDITIu9CK6INoIVPMQpKmdrGR2CgmbJgQjQfLUEy/lja
 f93j+7yZZrlNUiX5GXvHLpMuVPa7is/2XnSVfjG8vhT6pLHPCT9Ye5cYDOzghURsPvsTPP9r
 4wOaKNnCnx3DIXDX8Ug2dVOcQhVfCJnXMCeRg4+XrfrHzeK0VoJU5f5qY7NsaQ890iJvo8kJ
 k2AZ3I=
IronPort-HdrOrdr: A9a23:3zu1oazKIrJCmTgXm5Q8KrPwIL1zdoMgy1knxilNoRw8SKKlfq
 eV7ZAmPH7P+VAssR4b+exoVJPtfZq+z+8R3WByB8bAYOCOggLBR+sO0WKL+UyGJ8SUzI9gPM
 lbHJSWcOeAb2RHsQ==
X-Talos-CUID: 9a23:myqF2G4MyPKkP7wWutss13dIEcolfGTn1kz2fWr/BThAEYzScArF
X-Talos-MUID: =?us-ascii?q?9a23=3Aob/xeAzwSNpeV0KCbHqk2wovw/qaqK22L2Iutac?=
 =?us-ascii?q?/h/C/ETxsPzrFyz26TaZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.05,230,1701147600"; 
   d="scan'208";a="130226928"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, George Dunlap <George.Dunlap@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>
Subject: [PATCH] xen/sched: Fix UB shift in compat_set_timer_op()
Date: Tue, 30 Jan 2024 21:27:05 +0000
Message-ID: <20240130212706.74303-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Tamas reported this UBSAN failure from fuzzing:

  (XEN) ================================================================================
  (XEN) UBSAN: Undefined behaviour in common/sched/compat.c:48:37
  (XEN) left shift of negative value -2147425536
  (XEN) ----[ Xen-4.19-unstable  x86_64  debug=y ubsan=y  Not tainted ]----
  ...
  (XEN) Xen call trace:
  (XEN)    [<ffff82d040307c1c>] R ubsan.c#ubsan_epilogue+0xa/0xd9
  (XEN)    [<ffff82d040308afb>] F __ubsan_handle_shift_out_of_bounds+0x11a/0x1c5
  (XEN)    [<ffff82d040307758>] F compat_set_timer_op+0x41/0x43
  (XEN)    [<ffff82d04040e4cc>] F hvm_do_multicall_call+0x77f/0xa75
  (XEN)    [<ffff82d040519462>] F arch_do_multicall_call+0xec/0xf1
  (XEN)    [<ffff82d040261567>] F do_multicall+0x1dc/0xde3
  (XEN)    [<ffff82d04040d2b3>] F hvm_hypercall+0xa00/0x149a
  (XEN)    [<ffff82d0403cd072>] F vmx_vmexit_handler+0x1596/0x279c
  (XEN)    [<ffff82d0403d909b>] F vmx_asm_vmexit_handler+0xdb/0x200

Left-shifting any negative value is strictly undefined behaviour in C, and
the two parameters here come straight from the guest.

The fuzzer happened to choose lo 0xf, hi 0x8000e300.

Switch everything to be unsigned values, making the shift well defined.

As GCC documents:

  As an extension to the C language, GCC does not use the latitude given in
  C99 and C11 only to treat certain aspects of signed '<<' as undefined.
  However, -fsanitize=shift (and -fsanitize=undefined) will diagnose such
  cases.

this was deemed not to need an XSA.

Fixes: 2942f45e09fb ("Enable compatibility mode operation for HYPERVISOR_sched_op and HYPERVISOR_set_timer_op.")
Reported-by: Tamas K Lengyel <tamas@tklengyel.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
---
 xen/common/sched/compat.c    | 4 ++--
 xen/include/hypercall-defs.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/common/sched/compat.c b/xen/common/sched/compat.c
index d718e450d40b..dd97593630ee 100644
--- a/xen/common/sched/compat.c
+++ b/xen/common/sched/compat.c
@@ -43,9 +43,9 @@ static int compat_poll(struct compat_sched_poll *compat)
 
 #include "core.c"
 
-int compat_set_timer_op(uint32_t lo, int32_t hi)
+int compat_set_timer_op(uint32_t lo, uint32_t hi)
 {
-    return do_set_timer_op(((s64)hi << 32) | lo);
+    return do_set_timer_op(((uint64_t)hi << 32) | lo);
 }
 
 #endif /* __COMMON_SCHED_COMPAT_C__ */
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 6d361ddfce1b..47c093acc84d 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -134,7 +134,7 @@ xenoprof_op(int op, void *arg)
 
 #ifdef CONFIG_COMPAT
 prefix: compat
-set_timer_op(uint32_t lo, int32_t hi)
+set_timer_op(uint32_t lo, uint32_t hi)
 multicall(multicall_entry_compat_t *call_list, uint32_t nr_calls)
 memory_op(unsigned int cmd, void *arg)
 #ifdef CONFIG_IOREQ_SERVER

base-commit: cc6ba68edf6dcd18c3865e7d7c0f1ed822796426
prerequisite-patch-id: de9234b4d0488be5b3be5e2ec23e85789086debc
-- 
2.30.2


