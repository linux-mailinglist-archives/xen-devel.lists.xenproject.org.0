Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6EC72CB2A
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 18:13:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547358.854708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8kAW-0002JP-VW; Mon, 12 Jun 2023 16:13:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547358.854708; Mon, 12 Jun 2023 16:13:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8kAW-0002HM-Se; Mon, 12 Jun 2023 16:13:24 +0000
Received: by outflank-mailman (input) for mailman id 547358;
 Mon, 12 Jun 2023 16:13:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=abQ6=CA=citrix.com=prvs=520cb9a4c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q8kAV-00021a-O2
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 16:13:23 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cd50c72-093c-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 18:13:22 +0200 (CEST)
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
X-Inumbo-ID: 0cd50c72-093c-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686586402;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=juo+5nxjgfadIrJ0bP+JWsuC+QxOfTnJ4UTN/JsNx78=;
  b=T76T3SpWW2FMzv6hnjsrSw1o8cvy7adj20k4NHhUnpdOHCbGklHm4OC8
   ZMceQv7Ee1S0BGP/Y6YRzTf5ivtbkelne2F8+74/6R1LLB1sHHB1DqwEI
   yu5wyqBGzUUoY/SnBPEJDTNhgXVe3a1DCdl3dYTW9Zbi+Q1UPw8+Zf63v
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112508902
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:iZxsrqq5eyK7lLZ2EpQ1JEWuhRJeBmJiZRIvgKrLsJaIsI4StFCzt
 garIBnSM/mNa2X8ctglOdjk/R4DucLRx99iGwZs/3g0Fi8V85uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GtwUmAWP6gR5weAziNNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAD9dRRWMos+q/L22CdZW2eguKOb5GoxK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 jufpTmhUkBCbrRzzxKq9W6pm9Dt3h/GArIuJra2+cU0gwWqkzl75Bo+CgLg/KjRZlSFc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUSyiuA167V6AaxHXUfQ3hKb9lOnNAybSwn0
 BmOhdyBONB0mOTLEzTHrO7S9G7sf3FPdgfueBPoUyMKs/Lmr6Qeki7AQ5VcKvGZg9naCxf/l
 mXiQDcFu1kDsSIa//zlrQ6d02n398Whoh0dvVuOAD/8hu9tTMv8PtHztwCGhRpVBNzBJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JAVdoKiN2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPawS4m9BqyMP4ISPPCdkTNrGwk0PCatM53FyhBwwcnTx
 7/GGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvuqWPTlnyaPU6lTCfNE98taQLeBt3VGYvY+G05B
 f4DbZrVo/ieOcWiChTqHXk7dwBadCVqWcqn96S6tIere2JbJY3oMNeJqZtJRmCvt/09ejvgl
 p1lZnJl9Q==
IronPort-HdrOrdr: A9a23:7rNLOqlub87YOFMeUI53yRFk9NvpDfIH3DAbv31ZSRFFG/Fw9v
 re+cjzsCWf5Qr5N0tNpTntAsa9qArnhOdICOoqTNWftWvd2FdARbsKhbcKpQePJ8SUzJ8/6U
 4PSclD4erLfDxHZJbBizVQy+xQu+VvKprY49s2Ek0dKj2Ct5sQlzuR1DzraHFLeA==
X-Talos-CUID: 9a23:1QnkNmOigS1zOu5DV3lM8UExN9wZfXCe802PD0K8JnRPR+jA
X-Talos-MUID: 9a23:XMpfsAakS/nW++BTmDjwgSxdFoRU3v6eNHIGn5o95crcDHkl
X-IronPort-AV: E=Sophos;i="6.00,236,1681185600"; 
   d="scan'208";a="112508902"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/4] x86/spec-ctrl: Use a taint for CET without MSR_SPEC_CTRL
Date: Mon, 12 Jun 2023 17:13:03 +0100
Message-ID: <20230612161306.2739572-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230612161306.2739572-1-andrew.cooper3@citrix.com>
References: <20230612161306.2739572-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Reword the comment for 'S' to include an incompatbile set of features on the
same core.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v3:
 * New
---
 xen/arch/x86/spec_ctrl.c | 3 +++
 xen/common/kernel.c      | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index cd5ea6aa52d9..05b86edf73d3 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -1132,7 +1132,10 @@ void __init init_speculation_mitigations(void)
     if ( read_cr4() & X86_CR4_CET )
     {
         if ( !has_spec_ctrl )
+        {
             printk(XENLOG_WARNING "?!? CET active, but no MSR_SPEC_CTRL?\n");
+            add_taint(TAINT_CPU_OUT_OF_SPEC);
+        }
         else if ( opt_ibrs == -1 )
             opt_ibrs = ibrs = true;
 
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index fd975ae21ebc..719b08d6c76a 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -373,7 +373,7 @@ unsigned int tainted;
  *  'H' - HVM forced emulation prefix is permitted.
  *  'I' - Platform is insecure (usually due to an errata on the platform).
  *  'M' - Machine had a machine check experience.
- *  'S' - Out of spec CPU (One core has a feature incompatible with others).
+ *  'S' - Out of spec CPU (Incompatible features on one or more cores).
  *
  *      The string is overwritten by the next call to print_taint().
  */
-- 
2.30.2


