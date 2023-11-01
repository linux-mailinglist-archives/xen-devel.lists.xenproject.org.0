Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 273AB7DE658
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 20:21:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626622.977045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyGmD-0005eR-MF; Wed, 01 Nov 2023 19:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626622.977045; Wed, 01 Nov 2023 19:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyGmD-0005bh-J3; Wed, 01 Nov 2023 19:21:17 +0000
Received: by outflank-mailman (input) for mailman id 626622;
 Wed, 01 Nov 2023 19:21:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uHih=GO=citrix.com=prvs=662d42e6f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qyGmB-0005LP-Om
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 19:21:15 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2f092c5-78eb-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 20:21:14 +0100 (CET)
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
X-Inumbo-ID: d2f092c5-78eb-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698866474;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y4mUXFwEkYVV4PPcEwyjahUDfbyqiOJzsv7ADOUi+tI=;
  b=HZI4gRZyooFiHBoucUJueaOB74xKS6T8uht5HP1ekxdh3/wF+W7MBD6R
   Sw1f5KOSa3kZFLfNfIocr9OyIBZQ43nRtIDyLrgg4mWlpUPnuc2HyWSmm
   qyPm1cNxPUhtB1NRjdplTSVXHSfHDlhFrmkdAK2rKflbZCxST4HdF0S/S
   s=;
X-CSE-ConnectionGUID: Gul5WXPuT/mnsoAh0qSvvQ==
X-CSE-MsgGUID: Ocga0upYTMWL6C4tl9Gy+A==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 130083863
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:zh75Aa9pgIP2QHgt6eYoDrUDcH6TJUtcMsCJ2f8bNWPcYEJGY0x3m
 2sWDGnXO/bbN2Lyfd5+PY6/8B8HuZDUmt9kSQU+rCA8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks01BjOkGlA5AdnPKgS5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklh6
 PhFFwA1cyzEguStx5u7EvBXmNoaeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUWGPEUn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwOxh7I/
 TKYpAwVBDk9P9OWkSedw06JucuRtn/nXNM9Bf6Ro6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0WsFQEuwgwA7Lx6HfpRvcGm8HXzkHYddgttdebR4A2
 0KNntjpLSdyq7DTQnWYnp+LqRuiNC5TKnUNDQcGUA1D5dDgqYMyixvnT9B/HarzhdrwcRnzz
 i6Lqm4ihrwVpc8Ny6i/u1vAhlqEupHMRxUd+gbTU2Sq/w59IoWiYuSA8lja6/9oIY2SCETEo
 H8His/Y5etID4nlqcCWaLxTRvfzva/DaWCNxwE3d3U8y9iz01G+ed1v0AljGABsNN0DUD+xe
 XTNpzoEsfe/I0CWgb9Lj5OZUpp7nfi5TYy/Bpg4ffIUPMItKlXvEDVGIB7IhT6wyiDAhIlmY
 c/DGftAG0r2HkiOINCebOAH2Ltj/TgkxGXcXvgXJDz8iuLBPRZ5pVofWWZij9zVD4ve+205C
 /4Fa6O3J+x3CYUSmBX//48JNkwtJnMmH53woME/Xrfdc1o2Rjp/VaGBmONJl2lZc0N9z7mgw
 51AchYFkwSXaYPvcm1mlUyPmJuwBM0i/BrXzAQnPEqy2mhLXLtDGJw3LsNtFZF+rbwL8BKBZ
 6VdEyl2KqgVG2uvFvV0RcWVkbGOgzzx1VzRZHf5MWRjF3OiLiSQkuLZksLU3HFmJkKKWQEW+
 tVMCiuzrUI/ejlf
IronPort-HdrOrdr: A9a23:pLFJka5eB7qgJqGoMgPXwP7XdLJyesId70hD6qm+c20zTiX+rb
 HXoB17726MtN91YhodcL+7VJVoLUmyyXcX2/hzAV7BZmjbUQKTRekJgLcKpQeQeREWndQy6U
 4PSdkbNPTASXR8kMbm8E2ZPr8bsb+6GdiT5ds2Fk0dKD1XVw==
X-Talos-CUID: =?us-ascii?q?9a23=3A8eUugGhnWThP9kjRsK0n3O1QxDJuXWDZkUjgG1K?=
 =?us-ascii?q?ETmNvU7q8SQeJw716qp87?=
X-Talos-MUID: 9a23:0jps1AbS76HDFeBTkDTjjWl/LPZUxpuKVmtRjZFXlNjHHHkl
X-IronPort-AV: E=Sophos;i="6.03,269,1694750400"; 
   d="scan'208";a="130083863"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Reima ISHII
	<ishiir@g.ecc.u-tokyo.ac.jp>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, "Takahiro
 Shinagawa" <shina@ecc.u-tokyo.ac.jp>
Subject: [PATCH 1/2] x86/vmx: Fix IRQ handling for EXIT_REASON_INIT
Date: Wed, 1 Nov 2023 19:20:57 +0000
Message-ID: <20231101192058.3419310-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231101192058.3419310-1-andrew.cooper3@citrix.com>
References: <20231101192058.3419310-1-andrew.cooper3@citrix.com>
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

Move the INIT handling into the main switch statement.  In hindsight, it's
wrong to skip other normal VMExit steps.

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
CC: Reima ISHII <ishiir@g.ecc.u-tokyo.ac.jp>
CC: Takahiro Shinagawa <shina@ecc.u-tokyo.ac.jp>

With this patch in place, the INIT is ignored and the guest continues:

  (XEN) HVM1 restore: CPU 0
  (d1) --- Xen Test Framework ---
  (d1) Environment: HVM 64bit (Long mode 4 levels)
  (XEN) Error: INIT received - ignoring
  (d1) Test result: SUCCESS
---
 xen/arch/x86/hvm/vmx/vmx.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 1edc7f1e919f..d26920d03bbc 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4097,10 +4097,6 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
     case EXIT_REASON_MCE_DURING_VMENTRY:
         do_machine_check(regs);
         break;
-
-    case EXIT_REASON_INIT:
-        printk(XENLOG_ERR "Error: INIT received - ignoring\n");
-        return; /* Renter the guest without further processing */
     }
 
     /* Now enable interrupts so it's safe to take locks. */
@@ -4390,6 +4386,12 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
     case EXIT_REASON_TRIPLE_FAULT:
         hvm_triple_fault();
         break;
+
+    case EXIT_REASON_INIT:
+        /* TODO: Turn into graceful shutdown. */
+        printk(XENLOG_ERR "Error: INIT received - ignoring\n");
+        break;
+
     case EXIT_REASON_PENDING_VIRT_INTR:
         /* Disable the interrupt window. */
         v->arch.hvm.vmx.exec_control &= ~CPU_BASED_VIRTUAL_INTR_PENDING;
-- 
2.30.2


