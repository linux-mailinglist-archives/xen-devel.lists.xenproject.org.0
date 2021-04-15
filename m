Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9865B360A65
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 15:22:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111139.212496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX1wR-0008NB-FW; Thu, 15 Apr 2021 13:21:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111139.212496; Thu, 15 Apr 2021 13:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX1wR-0008Mm-CL; Thu, 15 Apr 2021 13:21:55 +0000
Received: by outflank-mailman (input) for mailman id 111139;
 Thu, 15 Apr 2021 13:21:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6tgI=JM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lX1wQ-0008Mh-3f
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 13:21:54 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7604fffd-f6af-4dc4-b945-03da505ac276;
 Thu, 15 Apr 2021 13:21:52 +0000 (UTC)
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
X-Inumbo-ID: 7604fffd-f6af-4dc4-b945-03da505ac276
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618492912;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EuZjVgTs1RGf6RYFevxNPocg2+RLqaQH1XJCdtIEg2g=;
  b=f5TSZ3g6ycmfzCwa38MLtN2OgBDjGciuK5THOyGurzCSyVZchUZyh46f
   HAwE0AQeJKD4rC2rnRJDgsT+I9VfOZk4CCo57L2uYTl5SVqHF6nA3ft9d
   8YlWyOFJHa5BW/lIXlkn9Z/4370Dmwe0xNIaMd4XU3PueO4YEzevVq2uM
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: lFHVpWXrjbG/Ta+PKY9FQM3aMVMHJtNs06F9MRVYoR1Uk6bEU/25RG8xtzJEIRRVOA68r7sY5+
 vbYlrTecfVmJgyUwjtTiFIkvt6b8fFuBrkfFx/i4hvW+H7eFtmk5cvM0iafHZxwMhZ2zlRawlv
 e952uTQwhz3JQUBmVyHbKx8pkok8fRc64s7e+JkgCoEIPDgzSPMVEcE4qXizzRsU04vtmUORmM
 91L8iGf8rEeLoKBrLNI7UQSeuRtjXm45O1TfqZy1b/O1iNxZNA/AvHWJWXJ9LGHzyNI6SE9OHF
 oDg=
X-SBRS: 4.0
X-MesageID: 41507035
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:vYs7XqNWl1n2zsBcT9z255DYdL4zR+YMi2QD/0p6RQVJNumRkM
 6zlPoWvCWE+Qo5cltIo6H4BICrR3TA+ZlppawYOrm/VAfr0VHYXL1Kx43k3jHmBmnC5vdQvJ
 0QBJRWJf/RKRxBjcj86BSlCNpI+rS62Y2hmOu29QYRcShGbaVp7wBaBhbeKE15QwFaGYE0fa
 D32uNpvDylEE5nCfiTJn5AZOTbos2OqZSOW295OzcG8w+ItDWy9frBPiPw5Hgjehdu5Ztnzm
 TfiQz+4cyYwoeG4zvRzXXa4ZgTuPaJ8Ko+OOW2hsIYKirhh2+TDewLN8zhzVVFxN2H01oknM
 LBpB0tJa1ImgzsV1uoqhjg0RSI6kdX11beyESViXamgcv1SCNSMbs6uatlcwDU40dlgddk0K
 gj5RPji7NrC3r77ULAzumNfxVy0mW1pHZnrfcXiXRTXYZ2Us4zkaUvuGtQCdM6EDjn7Z1PKo
 lTJfCZxO1RdmqddG2cllYH+rLMYl0DWjO9BmkLoIi8ziVflnER9Tpq+OUv2lM7sK8bZ7YBze
 LeKahsnKxJVaYtHNBALdZEfvKSTkDra1b2HEyzBXiPLtBMB1v976HPxPEa38eXQdgp4fIJ6d
 /8eWIdilcXP2PJM/Dm5uwCzjn9BFqFeXDM8IV+17NDmpCUfsunDQSzDG8Wt4+FmdtaIuCzYY
 f7BLtGR/v4aWf+E4dA2APzH4RIIX4FScsPp5I1QFSLrsXXKpD7t+DSffrJTYCdZAoMSyf4GX
 sMXD/6OcVG4ASqQxbD8WzsZ08=
X-IronPort-AV: E=Sophos;i="5.82,225,1613451600"; 
   d="scan'208";a="41507035"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/pv: Rename hypercall_table_t to pv_hypercall_table_t
Date: Thu, 15 Apr 2021 14:21:38 +0100
Message-ID: <20210415132138.29007-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The type is no longer appropriate for anything other than PV, and therefore
should not retain its generic name.

Fixes: 527922008bc ("x86: slim down hypercall handling when !PV32")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/pv/hypercall.c     | 2 +-
 xen/arch/x86/pv/shim.c          | 2 +-
 xen/include/asm-x86/hypercall.h | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/pv/hypercall.c b/xen/arch/x86/pv/hypercall.c
index 5d02eebc8d..e30c59b628 100644
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -40,7 +40,7 @@
 
 #define do_arch_1             paging_domctl_continuation
 
-const hypercall_table_t pv_hypercall_table[] = {
+const pv_hypercall_table_t pv_hypercall_table[] = {
     COMPAT_CALL(set_trap_table),
     HYPERCALL(mmu_update),
     COMPAT_CALL(set_gdt),
diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index 92cb1adeed..62201ae182 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -204,7 +204,7 @@ void __init pv_shim_setup_dom(struct domain *d, l4_pgentry_t *l4start,
                               unsigned long console_va, unsigned long vphysmap,
                               start_info_t *si)
 {
-    hypercall_table_t *rw_pv_hypercall_table;
+    pv_hypercall_table_t *rw_pv_hypercall_table;
     uint64_t param = 0;
     long rc;
 
diff --git a/xen/include/asm-x86/hypercall.h b/xen/include/asm-x86/hypercall.h
index 39e7ab7022..0ae3b8b043 100644
--- a/xen/include/asm-x86/hypercall.h
+++ b/xen/include/asm-x86/hypercall.h
@@ -20,7 +20,7 @@ typedef struct {
 #ifdef CONFIG_PV32
     hypercall_fn_t *compat;
 #endif
-} hypercall_table_t;
+} pv_hypercall_table_t;
 
 typedef struct {
     uint8_t native;
@@ -32,7 +32,7 @@ typedef struct {
 extern const hypercall_args_t hypercall_args_table[NR_hypercalls];
 
 #ifdef CONFIG_PV
-extern const hypercall_table_t pv_hypercall_table[];
+extern const pv_hypercall_table_t pv_hypercall_table[];
 void pv_hypercall(struct cpu_user_regs *regs);
 #endif
 
-- 
2.11.0


