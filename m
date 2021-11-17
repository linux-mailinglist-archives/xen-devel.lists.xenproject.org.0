Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB0F454B5D
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 17:49:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226949.392364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnO7P-0001xv-Sz; Wed, 17 Nov 2021 16:49:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226949.392364; Wed, 17 Nov 2021 16:49:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnO7P-0001w9-Pu; Wed, 17 Nov 2021 16:49:07 +0000
Received: by outflank-mailman (input) for mailman id 226949;
 Wed, 17 Nov 2021 16:49:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J8BY=QE=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mnO7O-0001w3-B0
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 16:49:06 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44ee7341-47c6-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 17:49:04 +0100 (CET)
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
X-Inumbo-ID: 44ee7341-47c6-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637167744;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=efPOHOrE6a5DVeX9XVytyKn2D82Ml2FQhhFZBoPDHW4=;
  b=hltcJY2gtmUX73rIPMQeQwbBqHujtYh482+o4CNr7BbwseEWAKZpb8mZ
   o6Ihy4aRkYkef1ZWI/hJL+VeHVrm5WS7CK8AmPf31d3iGMXsQf4JHwdEp
   hH0DObAucKLXtoKc7VMbf2mFGxDEx0AKjeyl4rqcTbBlUeyVs8sS5NbtU
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: So6Z9e17AeByBW2r0VcftRu9ZuEinvVs39SmTGx/KBPn/ucqoKHM9deON5wkmuseVoVqZGzywm
 /Yt4Y7AdXsU18wUQrRtRNqoC0EjlUr3g6fFk+SB2d2pp/byvMVmR8l8P36wd6YMrjFxbuvxlR3
 A2aO9dYaRkYXKdKzLcEFe9pfpNgKfwUzzR+5D6x+rySy86bHzmVVpWYm+Igo/tCCNyVXhoklD1
 c1d78+18Yn340Qv8R2Jh7LvcLgB1hCHAEaxNzRLrz2M73spv2kMPoYf45borO8/dDDPYh1FjeY
 AtlXn2e/xNNQi12iJj7NPYwe
X-SBRS: 5.1
X-MesageID: 58049181
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:XCx6f6OQsOi2iBbvrR1okMFynXyQoLVcMsEvi/4bfWQNrUp3hGZRz
 GBLWGrTbPuPNmvyctx0Ydvn8EJVuJfRztQ3Ggto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Es8w7VRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoz6un9BJ6
 NFyj7u5FwEZE4Lmns05EDANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgWdo2pEXTa+2i
 8wxThRWVT3fRDNzGk4JAp89vcmxulynbGgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m66j
 G/b+2XyAjkBKceSjzGC9xqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlaPmR4cY/pULNcd4V+L+of7yQCwIistG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnF447SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCslNOZJhKTysDA3CMqsyq7DFjFtW
 1BexaCjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9sPuGEheBg1aJdZEdMMX
 KM1kVkKjHO0FCH0BZKbnqrrU5h6pUQePYqNug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm3BvrUuOFMuT50n2jtKjiIu9FO5t3K2mNbtisstpYWz9r
 r5iCid940kFDbClPHCIqdV7wJJjBSFTOK0aYvd/LoarSjeK0kl4YxMI6b9+KYFjgYpPkeLEo
 iO0VkNCkQKtjnzbMwSaLHtkbeq3D5p4qHs6Ow0qPEqphCd/Mdr+sv9HestlZ6Qj+cxi0eVwE
 6sPdfKfD6kdUT/A4TkcM8Xw9dQwaBSxiAuSFCO5ezxjLYV4TgnE94a8LAvi/SUDFAStss46r
 +Hy3w/XW8NbFQ9jENzXeLSkyFbo5SoRn+d7Xk3pJNhPeRqzrNg2enKp1vJuepMCMxTOwDeex
 j26OxZAqLmfuZIx/fnImbuA89WjHdxhExcIBGLc97u3a3XXpzLx3Y9aXe+UVjnBT2eoqr66b
 OBYwvygYv0KmFFG79h1H7pxlP9s4tLuo/lRzxh+HWWNZFOuU+syLn6D1MhJl6tM2r4G5lfmB
 hPRooFXaeeTJcfoMF8NPw50PO2M2MYdliTW8flocl7x4zV6/ebfXEhfV/VWZPex8Feh3FsZ/
 Noc
IronPort-HdrOrdr: A9a23:GRfi/ak9f9iQ2pcgvnJ6rYt/0pHpDfNwiWdD5ihNYBxZY6Wkfp
 +V/cjzhCWbtN9OYh4dcIi7Sda9qXO1z+8T3WBjB8bdYOCGghroEGgG1+vfKlLbalbDH4JmpM
 Jdmu1FeaHN5DtB/IbHCWuDYqwdKbC8mcjC74qzvhQdLz2CKZsQkjuRYTzrdHGeMTM2fabRY6
 Dsn/avyQDQHUg/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZcbxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESvtu/oXvUlZ1SxhkFznAid0idtrD
 AKmWZ4Ay1H0QKUQohym2q05+Cv6kd015ao8y7ovZKqm72IeNt9MbsauWqcGSGpt3bJe7pHof
 92NiuixulqJAKFkyLn69fSURZ20kKyvHo5iOYWy2dSSI0EddZq3MAiFW5uYd099RjBmc0a+S
 hVfbbhzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdnaUk7zk93YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXK1X6E6MMPW7LtvfMkfoIzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnLx5FP+gClehT3Yd0s8LAX23FUgMyIeFPbC1zLdLl1qbrTnxw2OLyuZ9
 +jfI9fCbvmJWvqcLw5qTHDZw==
X-IronPort-AV: E=Sophos;i="5.87,241,1631592000"; 
   d="scan'208";a="58049181"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] xen/smp: Support NULL IPI function pointers
Date: Wed, 17 Nov 2021 16:48:52 +0000
Message-ID: <20211117164852.16394-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There are several cases where the act of interrupting a remote processor has
the required side effect.  Explicitly allow NULL function pointers so the
calling code doesn't have to provide a stub implementation.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

The wait parameter is a little weird.  It serves double duty and will confirm
that the IPI has been taken.  All it does is let you control whether you also
wait for the handler to complete first.  As such, it is effectively useless
with a stub function.

I don't particularly like folding into the .wait() path like that, but I
dislike it less than an if()/else if() and adding a 3rd cpumask_clear_cpu()
into the confusion which is this logic.
---
 xen/arch/x86/mm/hap/hap.c | 11 +----------
 xen/arch/x86/mm/p2m-ept.c | 11 ++---------
 xen/common/smp.c          |  4 ++++
 3 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 73575deb0d8a..5b269ef8b3bb 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -696,15 +696,6 @@ static void hap_update_cr3(struct vcpu *v, int do_locking, bool noflush)
     hvm_update_guest_cr3(v, noflush);
 }
 
-/*
- * Dummy function to use with on_selected_cpus in order to trigger a vmexit on
- * selected pCPUs. When the VM resumes execution it will get a new ASID/VPID
- * and thus a clean TLB.
- */
-static void dummy_flush(void *data)
-{
-}
-
 static bool flush_tlb(bool (*flush_vcpu)(void *ctxt, struct vcpu *v),
                       void *ctxt)
 {
@@ -737,7 +728,7 @@ static bool flush_tlb(bool (*flush_vcpu)(void *ctxt, struct vcpu *v),
      * not currently running will already be flushed when scheduled because of
      * the ASID tickle done in the loop above.
      */
-    on_selected_cpus(mask, dummy_flush, NULL, 0);
+    on_selected_cpus(mask, NULL, NULL, 0);
 
     return true;
 }
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index b2d57a3ee89a..1459f66c006b 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -1236,14 +1236,6 @@ static void ept_memory_type_changed(struct p2m_domain *p2m)
         ept_sync_domain(p2m);
 }
 
-static void __ept_sync_domain(void *info)
-{
-    /*
-     * The invalidation will be done before VMENTER (see
-     * vmx_vmenter_helper()).
-     */
-}
-
 static void ept_sync_domain_prepare(struct p2m_domain *p2m)
 {
     struct domain *d = p2m->domain;
@@ -1269,7 +1261,8 @@ static void ept_sync_domain_prepare(struct p2m_domain *p2m)
 
 static void ept_sync_domain_mask(struct p2m_domain *p2m, const cpumask_t *mask)
 {
-    on_selected_cpus(mask, __ept_sync_domain, p2m, 1);
+    /* Invalidation will be done in vmx_vmenter_helper(). */
+    on_selected_cpus(mask, NULL, NULL, 1);
 }
 
 void ept_sync_domain(struct p2m_domain *p2m)
diff --git a/xen/common/smp.c b/xen/common/smp.c
index 79f4ebd14502..854ebb91a803 100644
--- a/xen/common/smp.c
+++ b/xen/common/smp.c
@@ -87,10 +87,14 @@ void smp_call_function_interrupt(void)
 
     irq_enter();
 
+    if ( unlikely(!func) )
+        goto no_func;
+
     if ( call_data.wait )
     {
         (*func)(info);
         smp_mb();
+    no_func:
         cpumask_clear_cpu(cpu, &call_data.selected);
     }
     else
-- 
2.11.0


