Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 467BF82B7DD
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 00:13:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666556.1037286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rO4Ez-0006xX-Ly; Thu, 11 Jan 2024 23:13:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666556.1037286; Thu, 11 Jan 2024 23:13:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rO4Ez-0006vh-Gp; Thu, 11 Jan 2024 23:13:37 +0000
Received: by outflank-mailman (input) for mailman id 666556;
 Thu, 11 Jan 2024 23:13:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ikTk=IV=citrix.com=prvs=733603de5=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1rO4Ey-0006Rc-1v
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 23:13:36 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0aa9a961-b0d7-11ee-98f0-6d05b1d4d9a1;
 Fri, 12 Jan 2024 00:13:35 +0100 (CET)
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
X-Inumbo-ID: 0aa9a961-b0d7-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1705014815;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dpm9/S8+MidX9muncwSRV0Kdv7DqGRwPQQ3rsiXm2ss=;
  b=A2Hq6fhnxWtyZKxgi9k2Mnh38zkg9o/VLmgUH/TQLFNrrjTLdeEWhO3V
   QFVeP8IJCO+/MWbf4syOpAktBrmrCK6Ucn/O90OHaCXdP/FEk/y2otX6/
   +k+gg9eHf/WZqY2/pkSAWXhEe+6G1PeGXW4kUCQmlW/7SmkOJNB4Dwxu6
   Y=;
X-CSE-ConnectionGUID: uyTfX/LfTRC34w9FxF0y2A==
X-CSE-MsgGUID: KuJK4YPoTpmmr6ZKUJK6Ug==
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 129351772
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:hiCaa6M1vRya2FnvrR3ml8FynXyQoLVcMsEvi/4bfWQNrUoj3jIBx
 jQZUG2GM66KM2T9L9l+OY2/8EoBvJTcx4JhGwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CQ6jefQAOOkVIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/7rRC9H5qyo5GtB5wVmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vtmPW9+s
 tgWFAomNUyc1sym7uqqEMA506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEOHwwNHwsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4bbHpgMwRnCz
 o7A10fkIDJGBeSY9SKA92jytMzyvwClZY1HQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFamlBMBX9tbE8Uh9RqAjKHT5m6xGWwsXjNHLts8u6cLqScCj
 wHT2YmzXHo27ezTFir1GqqoQS2aJDkpI19FQSE4dyBev8ayjpEd1gOVZ4M2eEKqteEZCQ0c0
 hjT83Bi3uRL05JWv5hX62wrlN5Fm3QocuLWzl+ONo5dxlklDLNJnqTxgbQh0d5OLZyCUn6Kt
 2Uels6V4YgmVM7VyHXcGrVSRer4u55p1QEwZnY2QvEcG8mFoSb/Lei8HhkiTKuWDir0UWCwO
 xKC0e+gzJRSIGGrfcdKj3GZUqwXIVzbPY29DJj8N4MeCqWdgSfbpEmCk2bMhTGy+KXt+IljU
 aqmnTGEVC1KUfU+nWDsF4/wE9YDn0gD+I8afrijpzzP7FZUTCf9pWstWLdWUt0E0Q==
IronPort-HdrOrdr: A9a23:SOIL+6yNIcKRI8tNSK7GKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7Y0mPH7P+VAssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkHNDSaNzlHZKjBjzVQa+xQouW6zA==
X-Talos-CUID: 9a23:8o3Xem6ci53tkW0aJtss6V8oFPBiVnPh9lyLf1DpJ3ZHEKzPYArF
X-Talos-MUID: =?us-ascii?q?9a23=3AhCUvqwwVwFluFiha55BoNTkwbv+aqIezKmNRoK0?=
 =?us-ascii?q?Bh9GBMDYuCRSgrhfpf4Byfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.04,187,1695700800"; 
   d="scan'208";a="129351772"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>
Subject: [PATCH v2 1/3] x86/vmx: Collect all emtpy VMExit cases together
Date: Thu, 11 Jan 2024 23:13:21 +0000
Message-ID: <20240111231323.4043461-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240111231323.4043461-1-andrew.cooper3@citrix.com>
References: <20240111231323.4043461-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

... rather than having them spread out.  Explain consicely why each is empty.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: George Dunlap <george.dunlap@citrix.com>

v2:
 * New.
---
 xen/arch/x86/hvm/vmx/vmx.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 8ff675883c2b..829c27f1fa33 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4374,9 +4374,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
         }
         break;
     }
-    case EXIT_REASON_EXTERNAL_INTERRUPT:
-        /* Already handled above. */
-        break;
+
     case EXIT_REASON_TRIPLE_FAULT:
         hvm_triple_fault();
         break;
@@ -4539,9 +4537,6 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
         hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
         break;
 
-    case EXIT_REASON_TPR_BELOW_THRESHOLD:
-        break;
-
     case EXIT_REASON_APIC_ACCESS:
         if ( !vmx_handle_eoi_write() && !handle_mmio() )
             hvm_inject_hw_exception(X86_EXC_GP, 0);
@@ -4680,15 +4675,6 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
         vmx_handle_descriptor_access(exit_reason);
         break;
 
-    case EXIT_REASON_BUS_LOCK:
-        /*
-         * Nothing to do: just taking a vmexit should be enough of a pause to
-         * prevent a VM from crippling the host with bus locks.  Note
-         * EXIT_REASON_BUS_LOCK will always have bit 26 set in exit_reason, and
-         * hence the perf counter is already increased.
-         */
-        break;
-
     case EXIT_REASON_NOTIFY:
         __vmread(EXIT_QUALIFICATION, &exit_qualification);
 
@@ -4705,6 +4691,11 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
 
         break;
 
+    case EXIT_REASON_EXTERNAL_INTERRUPT:  /* Handled earlier */
+    case EXIT_REASON_TPR_BELOW_THRESHOLD: /* Handled later in vmx_intr_assist() */
+    case EXIT_REASON_BUS_LOCK:            /* Nothing to do (rate-limit only) */
+        break;
+
     case EXIT_REASON_VMX_PREEMPTION_TIMER_EXPIRED:
     case EXIT_REASON_INVPCID:
     /* fall through */
-- 
2.30.2


