Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BCA28B834
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 15:50:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5949.15501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRyCq-00019u-D2; Mon, 12 Oct 2020 13:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5949.15501; Mon, 12 Oct 2020 13:49:40 +0000
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
	id 1kRyCq-00019U-8S; Mon, 12 Oct 2020 13:49:40 +0000
Received: by outflank-mailman (input) for mailman id 5949;
 Mon, 12 Oct 2020 13:49:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wBf0=DT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kRyCp-00019P-7Q
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 13:49:39 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bafb4230-266c-4689-bde9-539d991aac2f;
 Mon, 12 Oct 2020 13:49:38 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=wBf0=DT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kRyCp-00019P-7Q
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 13:49:39 +0000
X-Inumbo-ID: bafb4230-266c-4689-bde9-539d991aac2f
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id bafb4230-266c-4689-bde9-539d991aac2f;
	Mon, 12 Oct 2020 13:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602510578;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eUVqbV5KovsAwf7HOfovlf9L/YrWZ2fcZGUE1UEun/4=;
  b=Mex5Wt+jVepM34qWO/j2RTQVhl0fxxmPjZyZQ/3xYkexIv/us7bf0ejd
   +2APILytVpvLahs8nHDUh3j8a+0u6HMOjqNJY+2XCTtBRarXVseJT947v
   pk/j9ePDKJjVwodQjjpMp9jo7qW8dn1cJLyZCb1nG32LTYnSBVoqKQZKY
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: fjjJ6Om0vv5+2l6+3zSDFJGlMzZgJniFcUzGJoxd9EjggT9IINx5POjs3WfXJzaqrEXaj5pifj
 XT5K+zW9KelE/TsFk3b+S0QJluGFeQn80O+9fdaPkRZPRvSveN1uZ4uThaLqqCYplKmAZha4XO
 qrzBThE8GtZnKIKhwiVu2lLBZz5ISciFp/40ALOX1ncVU6IgxPk3ofWFL+EYTZtXE2iT5xmQAY
 xkbNJtigtwfxEqykUXtQ63XfG8z35GC4m5B9k85qShCe9CH4GGzC9ivgmLhf3Hlp3lZyWL1jXj
 y0A=
X-SBRS: 2.5
X-MesageID: 29129914
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,366,1596513600"; 
   d="scan'208";a="29129914"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>
Subject: [PATCH] x86/traps: 'Fix' safety of read_registers() in #DF path
Date: Mon, 12 Oct 2020 14:49:08 +0100
Message-ID: <20201012134908.27497-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

All interrupts and exceptions pass a struct cpu_user_regs up into C.  This
contains the legacy vm86 fields from 32bit days, which are beyond the
hardware-pushed frame.

Accessing these fields is generally illegal, as they are logically out of
bounds for anything other than an interrupt/exception hitting ring1/3 code.

Unfortunately, the #DF handler uses these fields as part of preparing the
state dump, and being IST, accesses the adjacent stack frame.

This has been broken forever, but c/s 6001660473 "x86/shstk: Rework the stack
layout to support shadow stacks" repositioned the #DF stack to be adjacent to
the guard page, which turns this OoB write into a fatal pagefault:

  (XEN) *** DOUBLE FAULT ***
  (XEN) ----[ Xen-4.15-unstable  x86_64  debug=y   Tainted:  C   ]----
  (XEN) ----[ Xen-4.15-unstable  x86_64  debug=y   Tainted:  C   ]----
  (XEN) CPU:    4
  (XEN) RIP:    e008:[<ffff82d04031fd4f>] traps.c#read_registers+0x29/0xc1
  (XEN) RFLAGS: 0000000000050086   CONTEXT: hypervisor (d1v0)
  ...
  (XEN) Xen call trace:
  (XEN)    [<ffff82d04031fd4f>] R traps.c#read_registers+0x29/0xc1
  (XEN)    [<ffff82d0403207b3>] F do_double_fault+0x3d/0x7e
  (XEN)    [<ffff82d04039acd7>] F double_fault+0x107/0x110
  (XEN)
  (XEN) Pagetable walk from ffff830236f6d008:
  (XEN)  L4[0x106] = 80000000bfa9b063 ffffffffffffffff
  (XEN)  L3[0x008] = 0000000236ffd063 ffffffffffffffff
  (XEN)  L2[0x1b7] = 0000000236ffc063 ffffffffffffffff
  (XEN)  L1[0x16d] = 8000000236f6d161 ffffffffffffffff
  (XEN)
  (XEN) ****************************************
  (XEN) Panic on CPU 4:
  (XEN) FATAL PAGE FAULT
  (XEN) [error_code=0003]
  (XEN) Faulting linear address: ffff830236f6d008
  (XEN) ****************************************
  (XEN)

and rendering the main #DF analysis broken.

The proper fix is to delete cpu_user_regs.es and later, so no
interrupt/exception path can access OoB, but this needs disentangling from the
PV ABI first.

Not-really-fixes: 6001660473 ("x86/shstk: Rework the stack layout to support shadow stacks")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
---
 xen/arch/x86/cpu/common.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index da74172776..a684519a20 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -770,7 +770,13 @@ void load_system_tables(void)
 	tss->ist[IST_MCE - 1] = stack_top + (1 + IST_MCE) * PAGE_SIZE;
 	tss->ist[IST_NMI - 1] = stack_top + (1 + IST_NMI) * PAGE_SIZE;
 	tss->ist[IST_DB  - 1] = stack_top + (1 + IST_DB)  * PAGE_SIZE;
-	tss->ist[IST_DF  - 1] = stack_top + (1 + IST_DF)  * PAGE_SIZE;
+	/*
+	 * Gross bodge.  The #DF handler uses the vm86 fields of cpu_user_regs
+	 * beyond the hardware frame.  Adjust the stack entrypoint so this
+	 * doesn't manifest as an OoB write which hits the guard page.
+	 */
+	tss->ist[IST_DF  - 1] = stack_top + (1 + IST_DF)  * PAGE_SIZE -
+		(sizeof(struct cpu_user_regs) - offsetof(struct cpu_user_regs, es));
 	tss->bitmap = IOBMP_INVALID_OFFSET;
 
 	/* All other stack pointers poisioned. */
-- 
2.11.0


