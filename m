Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE612835C1
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 14:24:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3003.8634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPPWy-0008D3-MP; Mon, 05 Oct 2020 12:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3003.8634; Mon, 05 Oct 2020 12:23:52 +0000
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
	id 1kPPWy-0008Ce-Iw; Mon, 05 Oct 2020 12:23:52 +0000
Received: by outflank-mailman (input) for mailman id 3003;
 Mon, 05 Oct 2020 12:23:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sJhL=DM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kPPWx-0008CZ-F9
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 12:23:51 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 163ce370-4378-4584-b0e3-3a2dffed9886;
 Mon, 05 Oct 2020 12:23:50 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sJhL=DM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kPPWx-0008CZ-F9
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 12:23:51 +0000
X-Inumbo-ID: 163ce370-4378-4584-b0e3-3a2dffed9886
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 163ce370-4378-4584-b0e3-3a2dffed9886;
	Mon, 05 Oct 2020 12:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601900630;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cHQjS2YzfY3hmqPMISaok0cpm0uhyxwRBIJfBGmxJsw=;
  b=BCfGzguTV3l5y/oSklJ12c+Ygs1iJ6L+HpEWABT4PIeXACOeawZwtMi3
   o3ZHaAI/w9L60i3bDFEpH7QruUo1LktQWciIQ/kdeB+fZh72VqKohSp5J
   3SroHXozak8eGhw9OO8qTdT+qBWNXuNUjS5GqaQ5pLcq6GjG9gVfv4tZ5
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: d2th30ZShL4DN5vYYRgtxC0Yv4Aax/X3IKRTgJq/QXY6dHdrsYq/yToTuvk/NA84G/66bBtsC8
 tl/287QdgUalR1aWls71VQGtfxHJ7mwFCXh0Scmtp8HZkPqKpEPA2BlV9tAKxDRK9acNNna6bN
 /xkjuScLwo4bQwwayH4nCo56OrCm4ZxU/yUIBGUkBfE6ncmr8cYsyN5vSSjmif78BAG4g75YGg
 wQ/Z9f5t97PPqffNn5VTglr9nsJC5eFtKjQEi6qZuLSM4BoQA9H6YQt+HPYhvg+gJ80dNWpjdA
 Un4=
X-SBRS: None
X-MesageID: 29301968
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,338,1596513600"; 
   d="scan'208";a="29301968"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/smpboot: Unconditionally call memguard_unguard_stack() in cpu_smpboot_free()
Date: Mon, 5 Oct 2020 13:23:25 +0100
Message-ID: <20201005122325.17395-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

For simplicity between various configuration, Xen always uses shadow stack
mappings (Read-only + Dirty) for the guard page, irrespective of whether
CET-SS is enabled.

memguard_guard_stack() writes shadow stack tokens with plain writes.  This is
necessary to configure the BSP shadow stack correctly, and cannot be
implemented with WRSS.

Therefore, unconditionally call memguard_unguard_stack() to return the
mappings to fully writeable, so a subsequent call to memguard_guard_stack()
will succeed.

Fixes: 91d26ed304f ("x86/shstk: Create shadow stacks")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

This can more easily be demonstrated with CPU hotplug than S3, and the absence
of bug reports goes to show how rarely hotplug is used.
---
 xen/arch/x86/smpboot.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 5708573c41..c193cc0fb8 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -971,16 +971,16 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
     if ( IS_ENABLED(CONFIG_PV32) )
         FREE_XENHEAP_PAGE(per_cpu(compat_gdt, cpu));
 
+    if ( stack_base[cpu] )
+        memguard_unguard_stack(stack_base[cpu]);
+
     if ( remove )
     {
         FREE_XENHEAP_PAGE(per_cpu(gdt, cpu));
         FREE_XENHEAP_PAGE(idt_tables[cpu]);
 
         if ( stack_base[cpu] )
-        {
-            memguard_unguard_stack(stack_base[cpu]);
             FREE_XENHEAP_PAGES(stack_base[cpu], STACK_ORDER);
-        }
     }
 }
 
-- 
2.11.0


