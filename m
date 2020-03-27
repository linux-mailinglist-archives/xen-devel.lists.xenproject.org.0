Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0928A195706
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 13:23:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHny1-0005Rs-MS; Fri, 27 Mar 2020 12:20:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o0RR=5M=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jHny0-0005Iq-6u
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 12:20:04 +0000
X-Inumbo-ID: 48dc32d6-7025-11ea-8967-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 48dc32d6-7025-11ea-8967-12813bfff9fa;
 Fri, 27 Mar 2020 12:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585311603;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yFS9UGxGTZO64feDnj0aaDQPrD7ZMrJXqkXAE2Rzilw=;
 b=EtjeEdgYKQ/oDsgxf5hPGSERCe93vF7/IZHwJfXxHZg0/Vc6JEq6fMre
 fcPyogf4hr6F9FgLBCZnNF54asWukgwepu8+9198z3J1sPTENT4KhIgaH
 3AtCbnG2NDbLbBlqferpCL2jhfHKgTHDH/aBsTMHw55nmxmNbGY6WE1OH 4=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: C2oXA+ixiBm2lUjnfsj9VyecyHykfNca9Af2DGrJu0YqD0wzB7cUT8/FcXfnI2Ns2rb+6kikSz
 Bw4euOf3tac/JHOW0kQZWSJ71Hr6e3rm3PYWreiSNHmRu2lfTELOFvdb9hfgvSJLHupJpe1wEV
 pw+3tzZ3E377TwowbP5iWY/ZbdOy5dzFTunsg7NyQ+2KxWcfxVLvtvOw0qlxWj2Wa5QBP5DVoj
 LIBmK8eXhWR7TsMC2V/o9eoY7S48vXfJEHHfNN27SrtjLlpYySUk5qF+cfisd53t7XXOtAI20h
 l1s=
X-SBRS: 2.7
X-MesageID: 15078114
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,312,1580792400"; d="scan'208";a="15078114"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 27 Mar 2020 12:19:55 +0000
Message-ID: <20200327121955.19695-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH] x86/ucode: Drop the sanity check for interrupts
 being disabled
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Of the substantial number of things which can go wrong during microcode load,
this is not one.  Loading occurs entirely within the boundary of a single
WRMSR instruction.  Its certainly not a BUG()-worthy condition.

Xen has legitimate reasons to not want interrupts enabled at this point, but
that is to do with organising the system rendezvous.  As these are private low
level helpers invoked only from the microcode core logic, forgo the check
entirely.

While dropping system.h, clean up the processor.h include which was an
oversight in the previous header cleanup.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

An ASSERT() would be one option, but I'd prefer to remove the include.
---
 xen/arch/x86/cpu/microcode/amd.c   | 4 ----
 xen/arch/x86/cpu/microcode/intel.c | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 01854be92c..9fe1a3c941 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -20,8 +20,6 @@
 
 #include <asm/hvm/svm/svm.h>
 #include <asm/msr.h>
-#include <asm/processor.h>
-#include <asm/system.h>
 
 #include "private.h"
 
@@ -237,8 +235,6 @@ static int apply_microcode(const struct microcode_patch *patch)
 
     hdr = patch->mpb;
 
-    BUG_ON(local_irq_is_enabled());
-
     hw_err = wrmsr_safe(MSR_AMD_PATCHLOADER, (unsigned long)hdr);
 
     /* get patch id after patching */
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index bd33f5bc9b..b8b28060f5 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -25,8 +25,6 @@
 #include <xen/init.h>
 
 #include <asm/msr.h>
-#include <asm/processor.h>
-#include <asm/system.h>
 
 #include "private.h"
 
@@ -304,8 +302,6 @@ static int apply_microcode(const struct microcode_patch *patch)
     if ( !match_cpu(patch) )
         return -EINVAL;
 
-    BUG_ON(local_irq_is_enabled());
-
     /* write microcode via MSR 0x79 */
     wrmsrl(MSR_IA32_UCODE_WRITE, (unsigned long)patch->data);
 
-- 
2.11.0


