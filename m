Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF2979F2D3
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 22:28:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601582.937630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgWTI-0005C5-0s; Wed, 13 Sep 2023 20:28:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601582.937630; Wed, 13 Sep 2023 20:28:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgWTH-00058j-Tq; Wed, 13 Sep 2023 20:28:23 +0000
Received: by outflank-mailman (input) for mailman id 601582;
 Wed, 13 Sep 2023 20:28:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z4av=E5=citrix.com=prvs=613b8bbe6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qgWTF-0004dA-Vi
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 20:28:22 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 126b00d6-5274-11ee-8787-cb3800f73035;
 Wed, 13 Sep 2023 22:28:20 +0200 (CEST)
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
X-Inumbo-ID: 126b00d6-5274-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694636900;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7dZ3kUnhKwuOh+sk9OEhdNHhMXUmtOUWD4tuDVNnFdc=;
  b=SdbD0hC5bbVQO4rz2172/WJNCXEnQTC8BuK5LVhW4td1bVjyBGkn0aqD
   yZpMiLAyAng1ssaC7/keOuTyygcBRaGZUy3+uxTlY0KyYAwLQa5MHSN1z
   8W0MLntL3QzKZ1BqZ/sxy3pJPRrcRK+PhmKXFIW8cyVMbjY5MAlVaHfG4
   A=;
X-CSE-ConnectionGUID: OTY/1Nd8T/+vvQCCeXLd1A==
X-CSE-MsgGUID: 8f5KVhqHTNyPCN9Cu/9H9g==
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 121213279
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:Q5MTA6rNRozPK3QSr6fL2jHl49VeBmIOZRIvgKrLsJaIsI4StFCzt
 garIBnUOKvcZTTye9lyPomy8EMAvJLRyYcwHQA6rCtnQilBoJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GlwUmAWP6gR5wePziJNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABcxX1faoe7m/PX4VPdVre8uHO3nZapK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 jucpj6gWUtFZbRzzxLV/C+PuO/WvR/dSbo5MuyT67k7oAyckzl75Bo+CgLg/KjRZlSFc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUSyiuA167V6AaxHXUfQ3hKb9lOnNAybSwn0
 BmOhdyBONB0mOTLEzTHrO7S9G7sf3FPdgfueBPoUyMi3+ik+ac/3i6IDch9KYWeg+3RFWjZl
 mXiQDcFu50fissC1qOe9F/Bgi6xqpWhcjPZ9jk7TUr+sFonOdfNi5iArAGCsK0edNrxokyp5
 iBspiSI0AwZ4XhhfgSpSf5FIrym7u3t3Nb00Q82RMlJG9hAFheekWFsDNNWfhcB3iUsI2WBj
 KrvVeR5vcU7AZdSRfUrC79d8uxzpUQaKfzrV+rPcv1FaYVreQmM8UlGPBDBgz62yBBwz/xha
 P93lPpA6l5AVcxaIMeeHb9BgdfHOAhgrY8seXwL50v+iufPDJJkYbwELEGPfogEAFCs+W3oH
 yJkH5LSkX13CbSuChQ7BKZPdTjm21BnX8GpwyGWH8bfSjdb9JYJV6OOme54K9w990mX/8+Rl
 kyAtoZj4AKXrRX6xc+iMBiPtJuHsU5DkE8G
IronPort-HdrOrdr: A9a23:1aMZqq5UXd20tBoalAPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HWoB17726TtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QC5SWY+eQMbEVt6nHCXGDYrQd/OU=
X-Talos-CUID: 9a23:yjT9uG4a60us0e99y9ss03IlXZkDfi3hizTOPXaTImtZbLHMYArF
X-Talos-MUID: =?us-ascii?q?9a23=3AozwCrgx3S4h1z2qMDPUg5nWmINyaqPSgVWMzkYw?=
 =?us-ascii?q?mh++VDQdWahyAy2WXE4Byfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.02,144,1688443200"; 
   d="scan'208";a="121213279"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/8] x86/spec-ctrl: Fix confusion between SPEC_CTRL_EXIT_TO_XEN{,_IST}
Date: Wed, 13 Sep 2023 21:27:51 +0100
Message-ID: <20230913202758.508225-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230913202758.508225-1-andrew.cooper3@citrix.com>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

c/s 3fffaf9c13e9 ("x86/entry: Avoid using alternatives in NMI/#MC paths")
dropped the only user, leaving behind the (incorrect) implication that Xen had
split exit paths.

Delete the unused SPEC_CTRL_EXIT_TO_XEN and rename SPEC_CTRL_EXIT_TO_XEN_IST
to SPEC_CTRL_EXIT_TO_XEN for consistency.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 8 +-------
 xen/arch/x86/x86_64/entry.S              | 2 +-
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index f48f9e75e8dc..14ec40e8d32f 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -67,7 +67,6 @@
  *  - SPEC_CTRL_ENTRY_FROM_PV
  *  - SPEC_CTRL_ENTRY_FROM_INTR
  *  - SPEC_CTRL_ENTRY_FROM_INTR_IST
- *  - SPEC_CTRL_EXIT_TO_XEN_IST
  *  - SPEC_CTRL_EXIT_TO_XEN
  *  - SPEC_CTRL_EXIT_TO_PV
  *
@@ -256,11 +255,6 @@
     ALTERNATIVE "", __stringify(DO_SPEC_CTRL_ENTRY maybexen=1),         \
         X86_FEATURE_SC_MSR_PV
 
-/* Use when exiting to Xen context. */
-#define SPEC_CTRL_EXIT_TO_XEN                                           \
-    ALTERNATIVE "",                                                     \
-        DO_SPEC_CTRL_EXIT_TO_XEN, X86_FEATURE_SC_MSR_PV
-
 /* Use when exiting to PV guest context. */
 #define SPEC_CTRL_EXIT_TO_PV                                            \
     ALTERNATIVE "",                                                     \
@@ -328,7 +322,7 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
 .endm
 
 /* Use when exiting to Xen in IST context. */
-.macro SPEC_CTRL_EXIT_TO_XEN_IST
+.macro SPEC_CTRL_EXIT_TO_XEN
 /*
  * Requires %rbx=stack_end
  * Clobbers %rax, %rcx, %rdx
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 81dd2c74b876..a1c860f56949 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -673,7 +673,7 @@ UNLIKELY_START(ne, exit_cr3)
 UNLIKELY_END(exit_cr3)
 
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
-        SPEC_CTRL_EXIT_TO_XEN_IST /* Req: %rbx=end, Clob: acd */
+        SPEC_CTRL_EXIT_TO_XEN     /* Req: %rbx=end, Clob: acd */
 
         RESTORE_ALL adj=8
         iretq

base-commit: 6aa25c32180ab59081c73bae4c568367d9133a1f
-- 
2.30.2


