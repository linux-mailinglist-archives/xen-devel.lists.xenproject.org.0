Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C02E82B7DB
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 00:13:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666555.1037276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rO4Ey-0006hu-Do; Thu, 11 Jan 2024 23:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666555.1037276; Thu, 11 Jan 2024 23:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rO4Ey-0006gQ-9d; Thu, 11 Jan 2024 23:13:36 +0000
Received: by outflank-mailman (input) for mailman id 666555;
 Thu, 11 Jan 2024 23:13:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ikTk=IV=citrix.com=prvs=733603de5=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1rO4Ew-0006Rc-Il
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 23:13:34 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a6e6415-b0d7-11ee-98f0-6d05b1d4d9a1;
 Fri, 12 Jan 2024 00:13:33 +0100 (CET)
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
X-Inumbo-ID: 0a6e6415-b0d7-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1705014813;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EE/lRXdi+k5KtqGjtnl0bs1lLF3+iT3WJr+up5HKJ9c=;
  b=PGleRqkREkuV3Km0cdFtSPSv6MFH0zVnn/XTltfyZ0CHu8iGAZtzJs9C
   Bq8eZ5fo4C//VBcK7+C3ZkpOcukBiqWDcnoAUq4ScH6WSMUj9ijusfppF
   vhK/W9IrNzdCfaZoO7lYJNbZlpMwLrLaGTy14uHtnrBZMqwyIPSvL6V4R
   U=;
X-CSE-ConnectionGUID: tTQc7+osRG6vwTF5UyETeQ==
X-CSE-MsgGUID: uYXzKoj4SrOJO7q+DE+srg==
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 129228546
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:d2lgNaJPpNP3A1ypFE+R6pUlxSXFcZb7ZxGr2PjKsXjdYENS1zEOx
 mBNXjrTaffYa2L3fohxPIS/p08OuJXRnYVjG1FlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrfwP9TlK6q4m9A5wVnPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5rPVhFq
 r8fMwoiMA6cu8zr/aOWduRV05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGspM0yojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXQFJ8PzhvE+
 Aoq+UzkMyEIF9udlQGf1VCL2faMsQ64Q5gdQejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasvwUcWttKO+J85QqGjLeR/wGaF29CRzUHasROnO0cSCEu1
 1SJt8j0HjEpu7qQIVqC8p+EoDX0PjIaRUcAeClCSwIG6tvipYgbjxTTQ9IlG6mw5vX2FC/xx
 XaWrSE4r7QVkcMPka68+Djvnzupr4PhUg0x6wPYT2+hqAh+YeaNfIyp71Hz4P1LapvcUl6Cr
 X9CksPY7vhmMH2WvHXTGqNXRujvvqvUdmKE6bJyI3U/3yiRwnX8PodL2h4gOlhVHJs5aBLVb
 XaG7Gu9+6Rv0GuWgb5fOt3pV517lfa8SLzYuubogs2ii6WdlTNrHwk0PCZ8J0i3zCARfVgXY
 P93i/qEA3cAErhAxzGrXeob2rJD7nlhnT+KFMqrkE38gOb2iJuppVAtaQbmUwzExPnc/FW9H
 yh3a6NmNCmzoMWhO3KKoOb/3HgBLGQhBICeliCkXrfrH+aSI0l4U6W56ep4K+RYc1F9yr+gE
 oeVBhUJlzISRBTvdW23V5yUQOq0Dc4u9CNhZ3xE0JTB8yFLXLtDJZw3L/MfFYTLPsQ6pRKoZ
 5Hpo/m9P8k=
IronPort-HdrOrdr: A9a23:OMyhr6/A0yZvTIlqH9tuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re5cjztCWE7gr5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtBD4bbLbGSS4/yU3ODBKadD/OW6
X-Talos-CUID: 9a23:L/dvqmB+QOA/KFn6EzVbzUVLWcc+SFKD0mjsDRKFGEtVRYTAHA==
X-Talos-MUID: 9a23:dKHJEAThDo7nd/VzRXTxtQFwF8Bqv5+0L2IqzoxFl+THLjZ/bmI=
X-IronPort-AV: E=Sophos;i="6.04,187,1695700800"; 
   d="scan'208";a="129228546"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Reima ISHII
	<ishiir@g.ecc.u-tokyo.ac.jp>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, "Takahiro
 Shinagawa" <shina@ecc.u-tokyo.ac.jp>, George Dunlap
	<george.dunlap@citrix.com>
Subject: [PATCH v2 2/3] x86/vmx: Fix IRQ handling for EXIT_REASON_INIT
Date: Thu, 11 Jan 2024 23:13:22 +0000
Message-ID: <20240111231323.4043461-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240111231323.4043461-1-andrew.cooper3@citrix.com>
References: <20240111231323.4043461-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

When receiving an INIT, a prior bugfix tried to ignore the INIT and continue
onwards.

Unfortunately it's not safe to return at that point in vmx_vmexit_handler().
Just out of context in the first hunk is a local_irqs_enabled() which is
depended-upon by the return-to-guest path, causing the following checklock
failure in debug builds:

  (XEN) Error: INIT received - ignoring
  (XEN) CHECKLOCK FAILURE: prev irqsafe: 0, curr irqsafe 1
  (XEN) Xen BUG at common/spinlock.c:132
  (XEN) ----[ Xen-4.19-unstable  x86_64  debug=y  Tainted:     H  ]----
  ...
  (XEN) Xen call trace:
  (XEN)    [<ffff82d040238e10>] R check_lock+0xcd/0xe1
  (XEN)    [<ffff82d040238fe3>] F _spin_lock+0x1b/0x60
  (XEN)    [<ffff82d0402ed6a8>] F pt_update_irq+0x32/0x3bb
  (XEN)    [<ffff82d0402b9632>] F vmx_intr_assist+0x3b/0x51d
  (XEN)    [<ffff82d040206447>] F vmx_asm_vmexit_handler+0xf7/0x210

Luckily, this is benign in release builds.  Accidentally having IRQs disabled
when trying to take an IRQs-on lock isn't a deadlock-vulnerable pattern.

Drop the problematic early return.  In hindsight, it's wrong to skip other
normal VMExit steps.

Fixes: b1f11273d5a7 ("x86/vmx: Don't spuriously crash the domain when INIT is received")
Reported-by: Reima ISHII <ishiir@g.ecc.u-tokyo.ac.jp>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Tamas K Lengyel <tamas@tklengyel.com>
CC: Reima Ishii <ishiir@g.ecc.u-tokyo.ac.jp>
CC: Takahiro Shinagawa <shina@ecc.u-tokyo.ac.jp>
CC: George Dunlap <george.dunlap@citrix.com>

With this patch in place, the INIT is ignored and the guest continues:

  (XEN) HVM1 restore: CPU 0
  (d1) --- Xen Test Framework ---
  (d1) Environment: HVM 64bit (Long mode 4 levels)
  (XEN) Error: INIT received - ignoring
  (d1) Test result: SUCCESS

v2:
 * Leave the printk() early, and skip in the main block.
---
 xen/arch/x86/hvm/vmx/vmx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 829c27f1fa33..a85394232a23 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4090,7 +4090,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
 
     case EXIT_REASON_INIT:
         printk(XENLOG_ERR "Error: INIT received - ignoring\n");
-        return; /* Renter the guest without further processing */
+        break;
     }
 
     /* Now enable interrupts so it's safe to take locks. */
@@ -4692,6 +4692,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
         break;
 
     case EXIT_REASON_EXTERNAL_INTERRUPT:  /* Handled earlier */
+    case EXIT_REASON_INIT:                /* Handled earlier */
     case EXIT_REASON_TPR_BELOW_THRESHOLD: /* Handled later in vmx_intr_assist() */
     case EXIT_REASON_BUS_LOCK:            /* Nothing to do (rate-limit only) */
         break;
-- 
2.30.2


