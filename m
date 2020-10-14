Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 247F228E6A9
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 20:48:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6976.18252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSlo8-0002Qw-OK; Wed, 14 Oct 2020 18:47:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6976.18252; Wed, 14 Oct 2020 18:47:28 +0000
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
	id 1kSlo8-0002QZ-LA; Wed, 14 Oct 2020 18:47:28 +0000
Received: by outflank-mailman (input) for mailman id 6976;
 Wed, 14 Oct 2020 18:47:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aNf1=DV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kSlo7-0002QU-Eo
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 18:47:27 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b4b0977-021b-4c29-8908-6aa544b91eda;
 Wed, 14 Oct 2020 18:47:26 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aNf1=DV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kSlo7-0002QU-Eo
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 18:47:27 +0000
X-Inumbo-ID: 9b4b0977-021b-4c29-8908-6aa544b91eda
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 9b4b0977-021b-4c29-8908-6aa544b91eda;
	Wed, 14 Oct 2020 18:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602701246;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ozywa+G0/TlhuCvUoxhNXtJO/nG4bu9hmnl3Wc/T6ok=;
  b=QLRjF33OD7NK/lkNmAh5YYTO7DS0HKeuJDa45jx6wfyXbBLNrileG8Xp
   yTKbzaZqtLs7n3aC+h7SdjeARKm8vRNkQ+Ipfvw9zqs6Ijo7qTtdH7zsO
   H420Eq0YgzWLdT/fpeIxl/0IZ/TxBanhaJXvBhi7ExfOjxTlGtU2qN/Nj
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: svv+OPWgN8+e9erZVqILrhC1QXfsVBPkj5JDfFlIy7Pg7r8O2Bc01NSDiEtVsSZAs80BTLq+cJ
 twgfw1O0RKmlCQ3i/VgqIciDSFfm/lsSgqXT0dg0yqA5aKY9yp+ZEdG9x4N69NICQwUKSuiXtw
 2PB2do/pPnOzhf9w6PI5b0mT4HTOv8SYs0Y3jI2isyKOZznGiwOaMc+3+eo6MlLRcaf3MlY4YM
 bp9Qy2VcmuQqqX/l95YA/Bm5xa+F130f9k4rQGsasGCr+qdDk6TzBGLIQvt9+Y6+waC9zTRjZ2
 QHk=
X-SBRS: 2.5
X-MesageID: 29081389
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,375,1596513600"; 
   d="scan'208";a="29081389"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2] x86/smpboot: Don't unconditionally call memguard_guard_stack() in cpu_smpboot_alloc()
Date: Wed, 14 Oct 2020 19:47:08 +0100
Message-ID: <20201014184708.17758-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

cpu_smpboot_alloc() is designed to be idempotent with respect to partially
initialised state.  This occurs for S3 and CPU parking, where enough state to
handle NMIs/#MCs needs to remain valid for the entire lifetime of Xen, even
when we otherwise want to offline the CPU.

For simplicity between various configuration, Xen always uses shadow stack
mappings (Read-only + Dirty) for the guard page, irrespective of whether
CET-SS is enabled.

Unfortunately, the CET-SS changes in memguard_guard_stack() broke idempotency
by first writing out the supervisor shadow stack tokens with plain writes,
then changing the mapping to being read-only.

This ordering is strictly necessary to configure the BSP, which cannot have
the supervisor tokens be written with WRSS.

Instead of calling memguard_guard_stack() unconditionally, call it only when
actually allocating a new stack.  Xenheap allocates are guaranteed to be
writeable, and the net result is idempotency WRT configuring stack_base[].

Fixes: 91d26ed304f ("x86/shstk: Create shadow stacks")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

This can more easily be demonstrated with CPU hotplug than S3, and the absence
of bug reports goes to show how rarely hotplug is used.

v2:
 * Don't break S3/CPU parking in combination with CET-SS.  v1 would, for S3,
   turn the BSP shadow stack into regular mappings, and #DF as soon as the TLB
   shootdown completes.  For CPU Parking, it would invalidate the shadow stack
   of the parked CPUs, causing a #DF on the next NMI/#MC to hit the thread.
---
 xen/arch/x86/smpboot.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 5708573c41..67e727cebd 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -997,16 +997,18 @@ static int cpu_smpboot_alloc(unsigned int cpu)
         memflags = MEMF_node(node);
 
     if ( stack_base[cpu] == NULL )
+    {
         stack_base[cpu] = alloc_xenheap_pages(STACK_ORDER, memflags);
-    if ( stack_base[cpu] == NULL )
-        goto out;
+        if ( !stack_base[cpu] )
+            goto out;
+
+        memguard_guard_stack(stack_base[cpu]);
+    }
 
     info = get_cpu_info_from_stack((unsigned long)stack_base[cpu]);
     info->processor_id = cpu;
     info->per_cpu_offset = __per_cpu_offset[cpu];
 
-    memguard_guard_stack(stack_base[cpu]);
-
     gdt = per_cpu(gdt, cpu) ?: alloc_xenheap_pages(0, memflags);
     if ( gdt == NULL )
         goto out;
-- 
2.11.0


