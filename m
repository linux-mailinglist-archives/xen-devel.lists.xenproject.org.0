Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03924298E7C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 14:51:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12338.32154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX2u0-0007lF-Bk; Mon, 26 Oct 2020 13:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12338.32154; Mon, 26 Oct 2020 13:51:12 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX2u0-0007kq-7z; Mon, 26 Oct 2020 13:51:12 +0000
Received: by outflank-mailman (input) for mailman id 12338;
 Mon, 26 Oct 2020 13:51:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dsar=EB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kX2tx-0007kk-UA
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 13:51:10 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e895d521-8cdd-46f6-ad31-ddcdb911d708;
 Mon, 26 Oct 2020 13:51:08 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Dsar=EB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kX2tx-0007kk-UA
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 13:51:10 +0000
X-Inumbo-ID: e895d521-8cdd-46f6-ad31-ddcdb911d708
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e895d521-8cdd-46f6-ad31-ddcdb911d708;
	Mon, 26 Oct 2020 13:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603720268;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Kige2qC+WVChCsv8oUthNVYbRyRDIDCpAo5fVpsVfGU=;
  b=RqTtGMZA1Fxq00PUkHlt7TRoM21mOB7pbO8X65dZdAbdgo1c2E23TCMW
   XOu4/DTxp8PDzNYn9aEQp869wNvxQIsbMgU406mJUIq4bfGQgWgRtxQqq
   kDi4XdFQtALITKByDfEpkBgEvDenChi6FZEm8zXgY0FnhNqEC9a/sfgKt
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: qNdgpFi9PYMhsprorFVrqIiX9PvX/m7CbJkn/iv/QpiWqC0vNd+NguKcQHoZKTCVqg+ch4F2bA
 bCkh1U6PjZYKnUN4KgHYMsDncR6UIThnDcWTCuNI6Ll8PTqCRI5/pQBS0ODaQD+uSmv4EtsHNa
 LFGnP5H37dnS51EVCO0kA4xy27CeRNfd1Txe5c1HUcHKhUK+HMg9sbioGMkWVwk+YUgEEkvGPf
 39sSELdfS+ANib7WUZaTcn5ku2jv0Lm5u8bKoNMyqRVMnKBe64PmPBNqcd8ta+w1uLRel/6bla
 6Bk=
X-SBRS: None
X-MesageID: 30026597
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,419,1596513600"; 
   d="scan'208";a="30026597"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/svm: Merge hsa and host_vmcb to reduce memory overhead
Date: Mon, 26 Oct 2020 13:50:43 +0000
Message-ID: <20201026135043.15560-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The format of the Host State Area is, and has always been, a VMCB.  It is
explicitly safe to put the host VMSAVE data in.

This removes 4k of memory allocation per pCPU.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hvm/svm/svm.c | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index cfea5b5523..9ec9ad0646 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -72,11 +72,10 @@ static void svm_update_guest_efer(struct vcpu *);
 static struct hvm_function_table svm_function_table;
 
 /*
- * Physical addresses of the Host State Area (for hardware) and vmcb (for Xen)
- * which contains Xen's fs/gs/tr/ldtr and GSBASE/STAR/SYSENTER state when in
- * guest vcpu context.
+ * Host State Area.  This area is used by the processor in non-root mode, and
+ * contains Xen's fs/gs/tr/ldtr and GSBASE/STAR/SYSENTER state required to
+ * leave guest vcpu context.
  */
-static DEFINE_PER_CPU_READ_MOSTLY(paddr_t, hsa);
 static DEFINE_PER_CPU_READ_MOSTLY(paddr_t, host_vmcb);
 #ifdef CONFIG_PV
 static DEFINE_PER_CPU(struct vmcb_struct *, host_vmcb_va);
@@ -1436,15 +1435,8 @@ static bool svm_event_pending(const struct vcpu *v)
 
 static void svm_cpu_dead(unsigned int cpu)
 {
-    paddr_t *this_hsa = &per_cpu(hsa, cpu);
     paddr_t *this_vmcb = &per_cpu(host_vmcb, cpu);
 
-    if ( *this_hsa )
-    {
-        free_domheap_page(maddr_to_page(*this_hsa));
-        *this_hsa = 0;
-    }
-
 #ifdef CONFIG_PV
     if ( per_cpu(host_vmcb_va, cpu) )
     {
@@ -1462,7 +1454,6 @@ static void svm_cpu_dead(unsigned int cpu)
 
 static int svm_cpu_up_prepare(unsigned int cpu)
 {
-    paddr_t *this_hsa = &per_cpu(hsa, cpu);
     paddr_t *this_vmcb = &per_cpu(host_vmcb, cpu);
     nodeid_t node = cpu_to_node(cpu);
     unsigned int memflags = 0;
@@ -1471,16 +1462,6 @@ static int svm_cpu_up_prepare(unsigned int cpu)
     if ( node != NUMA_NO_NODE )
         memflags = MEMF_node(node);
 
-    if ( !*this_hsa )
-    {
-        pg = alloc_domheap_page(NULL, memflags);
-        if ( !pg )
-            goto err;
-
-        clear_domain_page(page_to_mfn(pg));
-        *this_hsa = page_to_maddr(pg);
-    }
-
     if ( !*this_vmcb )
     {
         pg = alloc_domheap_page(NULL, memflags);
@@ -1597,7 +1578,7 @@ static int _svm_cpu_up(bool bsp)
     write_efer(read_efer() | EFER_SVME);
 
     /* Initialize the HSA for this core. */
-    wrmsrl(MSR_K8_VM_HSAVE_PA, per_cpu(hsa, cpu));
+    wrmsrl(MSR_K8_VM_HSAVE_PA, per_cpu(host_vmcb, cpu));
 
     /* check for erratum 383 */
     svm_init_erratum_383(c);
-- 
2.11.0


