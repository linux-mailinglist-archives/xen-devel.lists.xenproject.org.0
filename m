Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA6E281DBA
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 23:38:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2350.6966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOSjv-0006ZX-Vx; Fri, 02 Oct 2020 21:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2350.6966; Fri, 02 Oct 2020 21:37:19 +0000
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
	id 1kOSjv-0006Z8-Sp; Fri, 02 Oct 2020 21:37:19 +0000
Received: by outflank-mailman (input) for mailman id 2350;
 Fri, 02 Oct 2020 21:37:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kOSjt-0006Z0-EF
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 21:37:17 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7a44ed0-1738-491c-9f8e-d7a7dc6e6b11;
 Fri, 02 Oct 2020 21:37:16 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kOSjt-0006Z0-EF
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 21:37:17 +0000
X-Inumbo-ID: e7a44ed0-1738-491c-9f8e-d7a7dc6e6b11
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e7a44ed0-1738-491c-9f8e-d7a7dc6e6b11;
	Fri, 02 Oct 2020 21:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601674635;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9XdDMMC3s8tS4ojhpvzgEXNjfjbFKoUyqBzWSCEDShc=;
  b=Tf0pz0yMjRWUO8AR2Z8oLJ1xclkWr3yWQyTGYLhyi7J37Tdu8G1YK8lY
   3H2qNSQ3xcvHIlyvvyc7vZC/FBwmcFVQ0Fiq9dy2Xkv5Onj6WMa7YIU2m
   kbX/7+kiJCIfR/mvH92AArqbQeDQxZmW//OTYScA5d3vTl7qjfbTpGZjb
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: LOKjwRwi/M3m+tachbBjD7pQS5M4HSs1Ov60tAq/bg3etPxr0DT4FvaCy/bxtmMPysh4pxltGS
 dVmmbnCUIbjNUAEbVYumSPTs7u2FhtZjVy486VgtyuYLJjjbYHykqcZFpBbSR7a3cd9ZOF/36l
 uZiGr1TS1p804Snkq0VlAOleswvY/oXZ2V4DZYeArv1va0GXe8YQt3MEDCTTtYK/ob/fFIm4wd
 vrXNGNp6WaiDG2GKuJIk5tlZ0ZiNneJL/qZOAK/hJkTdMOLTRwZDQpzRz/mlc22yAkIEhy6AC2
 taw=
X-SBRS: None
X-MesageID: 28463514
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,329,1596513600"; 
   d="scan'208";a="28463514"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
Subject: [PATCH] x86/S3: Restore CR4 earlier during resume
Date: Fri, 2 Oct 2020 22:36:50 +0100
Message-ID: <20201002213650.2197-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

c/s 4304ff420e5 "x86/S3: Drop {save,restore}_rest_processor_state()
completely" moved CR4 restoration up into C, to account for the fact that MCE
was explicitly handled later.

However, time_resume() ends up making an EFI Runtime Service call, and EFI
explodes without OSFXSR, presumably when trying to spill %xmm registers onto
the stack.

Given this codepath, and the potential for other issues of a similar kind (TLB
flushing vs INVPCID, HVM logic vs VMXE, etc), restore CR4 in asm before
entering C.

Ignore the previous MCE special case, because its not actually necessary.  The
handler is already suitably configured from before suspend.

Fixes: 4304ff420e5 ("x86/S3: Drop {save,restore}_rest_processor_state() completely")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

This is one definite bug fix.  It doesn't appear to be the only S3 bug
however.
---
 xen/arch/x86/acpi/power.c       | 3 ---
 xen/arch/x86/acpi/wakeup_prot.S | 5 +++++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index 4fb1e7a148..7f162a4df9 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -276,9 +276,6 @@ static int enter_state(u32 state)
 
     mcheck_init(&boot_cpu_data, false);
 
-    /* Restore CR4 from cached value, now MCE is set up. */
-    write_cr4(read_cr4());
-
     printk(XENLOG_INFO "Finishing wakeup from ACPI S%d state.\n", state);
 
     if ( (state == ACPI_STATE_S3) && error )
diff --git a/xen/arch/x86/acpi/wakeup_prot.S b/xen/arch/x86/acpi/wakeup_prot.S
index c6b3fcc93d..1ee5551fb5 100644
--- a/xen/arch/x86/acpi/wakeup_prot.S
+++ b/xen/arch/x86/acpi/wakeup_prot.S
@@ -110,6 +110,11 @@ ENTRY(s3_resume)
 
         call    load_system_tables
 
+        /* Restore CR4 from the cpuinfo block. */
+        GET_STACK_END(bx)
+        mov     STACK_CPUINFO_FIELD(cr4)(%rbx), %rax
+        mov     %rax, %cr4
+
 .Lsuspend_err:
         pop     %r15
         pop     %r14
-- 
2.11.0


