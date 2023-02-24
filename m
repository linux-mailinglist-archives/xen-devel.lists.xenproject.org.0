Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8946A2276
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 20:43:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501518.773303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVdxn-0000yU-RW; Fri, 24 Feb 2023 19:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501518.773303; Fri, 24 Feb 2023 19:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVdxn-0000w9-OX; Fri, 24 Feb 2023 19:42:39 +0000
Received: by outflank-mailman (input) for mailman id 501518;
 Fri, 24 Feb 2023 19:42:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V4+4=6U=citrix.com=prvs=412e064f8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVdxl-0000w3-Js
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 19:42:37 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62836878-b47b-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 20:42:36 +0100 (CET)
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
X-Inumbo-ID: 62836878-b47b-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677267755;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BdqtGc6g8VRVqBrNCmDNZDXs+3JRlo/VmvHWh/tPNKY=;
  b=dfM05GvF8kfUZ0rodyXKOradUs9pq9mQu54OjEi/n2WS/0ELIXWzwtBs
   h6AWkPUD6hKiqvTZoJrScolA+HgK80p7ZXAYwBxrMxmq+zTj232cB48yB
   xlkPHFjoOASsGKvufOMGB+LcGGxAG8L1mZckPCufESCeeg6ALGYFkLH73
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 98462222
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:XIUcv6LYH95LMke8FE+R/JUlxSXFcZb7ZxGr2PjKsXjdYENS1zJTz
 TQbWmiAPq6DZzTzeI12aY3j905V6JKAyINhTAFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5AZiPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5wDUtAy
 a1FAwkrYx2Rtunt0PGAZLNz05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TbFZkLxBzC/
 Aoq+Uy+PSAiO4Wu9ADb82uHjOvFpSbZZqc7QejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasnDQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBebTY3z
 E2Am9TlAiNmmLKQQHOZsLyTqFuP1TM9dDFYI3VeFE1cvoel+dto5v7Scjp9OKm5pNPJSGzb+
 haHoToPjO4DzvUljbruqDgrnAmQjpTOSwc04CDeUWSk8h51aeaZWmC41bTIxa0eddjEFzFtq
 FBBwpHDt75WUflhgQTXGI0w8KeVC+Fp2dE2qXpmBNEf+juk4BZPlqgAsWgldC+F3ivpEAIFg
 XM/WysLufe/31PwN8ebhr5d7Ox7pZUM7fy/CpjpgiNmO/CdjjOv8iB0flK31GvwikUqmqxXE
 c7FLpn2Uy1EWP05kWXeqwIhPVgDnH1W+I8ubcqjk0TPPUS2ORZ5tovpwHPRN7tkvctoUS3e8
 spFNtvi9vmseLSWX8UjyqZKdQpiBSFiVfjLRzl/KrbrzvxORDtwVJc8ANoJJ+RYokiivruXo
 irgAhcFkTISRxTvcG23V5yqU5u3Nb4XkJ7xFXVE0YqAs5T7XbuS0Q==
IronPort-HdrOrdr: A9a23:+yKcaalYKA/4GM2nTC8xK7sUcTbpDfIR3DAbv31ZSRFFG/GwvM
 ql9c5rsiMc7wx8ZJhAo7+90cy7Kk80mqQa3WB8B9aftWvdyQiVxfBZjbcKqgeIc0eSygc379
 YDT0ERMqyVMXFKyer8/QmkA5IB7bC8gcaVbD7lvhJQcT0=
X-IronPort-AV: E=Sophos;i="5.97,325,1669093200"; 
   d="scan'208";a="98462222"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xenia Ragiadakou
	<burzalodowa@gmail.com>
Subject: [PATCH v3 02/14 - ALT] x86/svm: Remove the asm/hvm/svm/asid.h header
Date: Fri, 24 Feb 2023 19:42:30 +0000
Message-ID: <20230224194230.2758210-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230224185010.3692754-3-burzalodowa@gmail.com>
References: <20230224185010.3692754-3-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Fold svm_asid_g_invlpg() into its single caller, deleting the #if 0 which has
been present for the entire 16 years this helper has existed: c/s 322a078ab140
"[HVM][SVM] Reintroduce ASIDs."

Move the two remaining prototypes into the private svm.h, forward declaring
cpuinfo_x86 in preference to including asm/processor.h

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/x86/hvm/svm/asid.c             |  3 +-
 xen/arch/x86/hvm/svm/svm.c              |  4 +-
 xen/arch/x86/hvm/svm/svm.h              |  4 ++
 xen/arch/x86/include/asm/hvm/svm/asid.h | 49 -------------------------
 4 files changed, 8 insertions(+), 52 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/hvm/svm/asid.h

diff --git a/xen/arch/x86/hvm/svm/asid.c b/xen/arch/x86/hvm/svm/asid.c
index ab06dd3f3ae2..150d8dfc8178 100644
--- a/xen/arch/x86/hvm/svm/asid.c
+++ b/xen/arch/x86/hvm/svm/asid.c
@@ -17,9 +17,10 @@
 
 #include <asm/amd.h>
 #include <asm/hvm/nestedhvm.h>
-#include <asm/hvm/svm/asid.h>
 #include <asm/hvm/svm/svm.h>
 
+#include "svm.h"
+
 void svm_asid_init(const struct cpuinfo_x86 *c)
 {
     int nasids = 0;
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 6d394e4fe3bc..46ae0b6602e2 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -37,7 +37,6 @@
 #include <asm/hvm/monitor.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/support.h>
-#include <asm/hvm/svm/asid.h>
 #include <asm/hvm/svm/emulate.h>
 #include <asm/hvm/svm/nestedsvm.h>
 #include <asm/hvm/svm/svm.h>
@@ -2421,7 +2420,8 @@ static bool cf_check is_invlpg(
 
 static void cf_check svm_invlpg(struct vcpu *v, unsigned long linear)
 {
-    svm_asid_g_invlpg(v, linear);
+    /* Safe fallback. Take a new ASID. */
+    hvm_asid_flush_vcpu(v);
 }
 
 static bool cf_check svm_get_pending_event(
diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
index f700f26f9082..b8178f62161b 100644
--- a/xen/arch/x86/hvm/svm/svm.h
+++ b/xen/arch/x86/hvm/svm/svm.h
@@ -12,6 +12,10 @@
 #include <xen/types.h>
 
 struct cpu_user_regs;
+struct cpuinfo_x86;
+
+void svm_asid_init(const struct cpuinfo_x86 *c);
+void svm_asid_handle_vmrun(void);
 
 unsigned long *svm_msrbit(unsigned long *msr_bitmap, uint32_t msr);
 void __update_guest_eip(struct cpu_user_regs *regs, unsigned int inst_len);
diff --git a/xen/arch/x86/include/asm/hvm/svm/asid.h b/xen/arch/x86/include/asm/hvm/svm/asid.h
deleted file mode 100644
index 0e5ec3ab788a..000000000000
--- a/xen/arch/x86/include/asm/hvm/svm/asid.h
+++ /dev/null
@@ -1,49 +0,0 @@
-/*
- * asid.h: handling ASIDs in SVM.
- * Copyright (c) 2007, Advanced Micro Devices, Inc.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef __ASM_X86_HVM_SVM_ASID_H__
-#define __ASM_X86_HVM_SVM_ASID_H__
-
-#include <xen/types.h>
-#include <asm/hvm/asid.h>
-#include <asm/processor.h>
-
-void svm_asid_init(const struct cpuinfo_x86 *c);
-void svm_asid_handle_vmrun(void);
-
-static inline void svm_asid_g_invlpg(struct vcpu *v, unsigned long g_linear)
-{
-#if 0
-    /* Optimization? */
-    svm_invlpga(g_linear, v->arch.hvm.svm.vmcb->guest_asid);
-#endif
-
-    /* Safe fallback. Take a new ASID. */
-    hvm_asid_flush_vcpu(v);
-}
-
-#endif /* __ASM_X86_HVM_SVM_ASID_H__ */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * indent-tabs-mode: nil
- * End:
- */
-- 
2.30.2


