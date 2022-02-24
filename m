Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4894C3625
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 20:49:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278591.475911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNK6w-0006Gu-1t; Thu, 24 Feb 2022 19:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278591.475911; Thu, 24 Feb 2022 19:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNK6v-0006B0-Ru; Thu, 24 Feb 2022 19:49:09 +0000
Received: by outflank-mailman (input) for mailman id 278591;
 Thu, 24 Feb 2022 19:49:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oTFz=TH=citrix.com=prvs=047b345d9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nNK6u-00068X-Ts
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 19:49:08 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2c10a42-95aa-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 20:49:07 +0100 (CET)
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
X-Inumbo-ID: d2c10a42-95aa-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645732147;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FrcIuQFMoLhLEcVl+cvl5AZm1H6qvYM6PJlmDQshz58=;
  b=Lq4D+U2zSZOjj2ZoIRWF3VCb9D8Y6sJMPR7ts0fl0RVpwqsMMZjc+O+c
   gYnRq2gRJF6LbeHht6v2EjXoEiootGZml/r8SqooXFHAH0edlSiotuVLK
   JI2FswwR1/0KiRWY3ag8m7AH0pq9J6YvJaPSjfBNLwR9MlQY2nRsTG7++
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 67202356
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:PSOo+KlP0R0BvMewPZaBDebo5gxjJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZDWjTPPnYYmqhfNAkO9ji9RwHuZ6And8wTwZsritnEiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DjWV/V4
 rsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYQiAbYo6LmKcnVBBICX9EFpZt3ICWCC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3k3ds1zzGS90hRojOWf7i7t5ExjYgwMtJGJ4yY
 uJHNmA3Nk+dPXWjPH9LCagxnuPx3UKhdjR8pgq5qo0mxi/6mVkZPL/Fb4OOJ43iqd9utkWVu
 GPAuXj4CxcyNdqDxD7D+XWp7sfLmiz8VZgOFLy+++QzqATNnSoYDxh+fV6yu/ywkEO9c9NZN
 U0P+yAqoLQy9UqkVd30VVuzp3vslhwBXZxWGu4z6gCIw4LV5RqUAi4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9D0UPeCsFRgst+MT4rcc4iRenZslnOL64iJvyAz6Y/
 tyRhHFg3fNJ15dNjvjluwCc696xmnTXZgUS1Fn0GWLm1ARwdJT7XaeTwnzkvN8Vee51UWK9l
 HQDnsGf6sUHApeMiDGBTY0xIV252xqWGGaC2AAyRvHN4xzooif+Jt4IvFmSMW80ap5sRNP/X
 KPEVeq9Drd3NWDiU6J4apnZ5y8Cnfm5ToSNuhw5g7NzjnlNmO2voXkGia24hTmFfK0QfUcXY
 8nznSGEVytyNEif5GDqL9rxKJdyrszE+UvdRIrg0zOs2qeEaXieRN8taQXSM75ltv/e+1qNq
 L6z0vdmLT0FDoUShQGNrOYuwa0idyBnVfgaVeQNHgJ8HuaWMD54UKKAqV/QU4dkg75Uho/1E
 oKVASdlJK7ErSSfc22iMyk7AJu2BMoXhS9rbEQEYAfzs1B+MNnH0UvqX8ZuFVXR3Lc4lqAco
 jhsU5joP8mjvRyco2VNNcSm9dc6HPlp7CrXVxeYjPEEV8YIb2T0FhXMJ2MDKAFm4vKLiPYD
IronPort-HdrOrdr: A9a23:iPOTlKOmfKPLi8BcTv+jsMiBIKoaSvp037BN7TESdfU1SL36qy
 nKpp8mPHDP6Qr5NEtOpTniAsW9qBHnmKKdiLN5VYtKNDOW3VdAR7sD0WKN+VPd84uVzJ846Y
 5QN4xFTP3qDUI/qcrm6CSxDt5I+rO6zJw=
X-IronPort-AV: E=Sophos;i="5.90,134,1643691600"; 
   d="scan'208";a="67202356"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Thiner Logoer
	<logoerthiner1@163.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
Subject: x86/vmx: Don't spuriously crash the domain when INIT is received
Date: Thu, 24 Feb 2022 19:48:53 +0000
Message-ID: <20220224194853.17774-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220224194853.17774-1-andrew.cooper3@citrix.com>
References: <20220224194853.17774-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

In VMX operation, the handling of INIT IPIs is changed.  EXIT_REASON_INIT has
nothing to do with the guest in question, simply signals that an INIT was
received.

Ignoring the INIT is probably the wrong thing to do, but is helpful for
debugging.  Crashing the domain which happens to be in context is definitely
wrong.  Print an error message and continue.

Discovered as collateral damage from when an AP triple faults on S3 resume on
Intel TigerLake platforms.

Link: https://github.com/QubesOS/qubes-issues/issues/7283
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Thiner Logoer <logoerthiner1@163.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index c075370f642a..883213ce8f6a 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3965,6 +3965,10 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
     case EXIT_REASON_MCE_DURING_VMENTRY:
         do_machine_check(regs);
         break;
+
+    case EXIT_REASON_INIT:
+        printk(XENLOG_ERR "Error: INIT received - ignoring\n");
+        return; /* Renter the guest without further processing */
     }
 
     /* Now enable interrupts so it's safe to take locks. */

