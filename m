Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DA3508A6F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 16:13:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309286.525412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhB5L-00028y-5J; Wed, 20 Apr 2022 14:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309286.525412; Wed, 20 Apr 2022 14:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhB5K-00025u-UI; Wed, 20 Apr 2022 14:13:34 +0000
Received: by outflank-mailman (input) for mailman id 309286;
 Wed, 20 Apr 2022 14:13:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7E3+=U6=citrix.com=prvs=10247635a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nhB5I-0001HT-A0
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 14:13:32 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0df5faec-c0b4-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 16:13:30 +0200 (CEST)
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
X-Inumbo-ID: 0df5faec-c0b4-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650464010;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qmoska+aIxotu+Z9bq9lWSYhYAKM0rZmYd2eehh+pdw=;
  b=ZtaAE8PvL6sqmWb5OxPYlVy72qOwxQoSED31YAhOuMOU4a5MsRRn/OFd
   5X5liRGvz3sG9qNIBfYkBfx7D15qRFx2RNtxtCgDLIpF4X3I8hAA/FT7w
   jezmkrCs6eAYrQU3An6N1QRSI64hBObjzyPu/1V7KOL3CRtMKydm+oDy8
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 69517260
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0kYFbKJnwVqI8b+rFE+RoZUlxSXFcZb7ZxGr2PjKsXjdYENS0zJRn
 zBKXmrTbv2KZmD8fNlzbY618UsPscTUxtE1HQBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh3tQw2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Ox26YGiciESAvbFl+ECayhbFD9fIpQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ6eDP
 pVDN2IHgBLoOTBzYnQLV7YFn/qmmVnSajkAj12MjP9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zbKBwHMN2UyRKe72mhwOTImEvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJpKLEn+jqr8ZaP6gmcGVA1TTlfScMf4ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud1IWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNOtTABbvzt68owGOlor6p5
 iZspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD+JdwIum0hex05bq7onAMFh
 meK6Gu9A7cJYhOXgVJfOdrtW6zGM4C8fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ6nUgWmDKMLa0XOjz6iNJyklbOEedbWLZPB8hkhJ65TPL9q
 o8BbJrbl08CCIUToED/qOYuELzDFlBjbbieliCdXrXrztZOcI35N8Ls/A==
IronPort-HdrOrdr: A9a23:yVRE/65m3dlgKvVMtAPXwPLXdLJyesId70hD6qhwISY1TiX+rb
 HXoB17726MtN9/YgBCpTntAsa9qDbnhPpICOoqTNGftWvdyQmVxehZhOOIqVCNJ8S9zJ876U
 4JSdkENDSaNzhHZKjBjjVQa+xQpeW6zA==
X-IronPort-AV: E=Sophos;i="5.90,275,1643691600"; 
   d="scan'208";a="69517260"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v5 5/6] x86/debugger: Misc cleanup prior to splitting
Date: Wed, 20 Apr 2022 15:13:06 +0100
Message-ID: <20220420141307.24153-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220420141307.24153-1-andrew.cooper3@citrix.com>
References: <20220420141307.24153-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

 * Remove inappropriate semicolon from debugger_trap_immediate()
 * Try to explain what debugger_trap_fatal() is doing, and write it in a more
   legible way.
 * Drop unecessary includes.  This includes common/domain.c which doesn't use
   any debugger functionality, even prior to this cleaup.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v5:
 * New
---
 xen/arch/x86/include/asm/debugger.h | 17 +++++++++++------
 xen/common/domain.c                 |  1 -
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/include/asm/debugger.h b/xen/arch/x86/include/asm/debugger.h
index 9a3132356fd6..5bac2ee4c2a4 100644
--- a/xen/arch/x86/include/asm/debugger.h
+++ b/xen/arch/x86/include/asm/debugger.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * asm/debugger.h
  * 
@@ -22,23 +23,27 @@
 #ifndef __X86_DEBUGGER_H__
 #define __X86_DEBUGGER_H__
 
-#include <xen/sched.h>
-#include <asm/regs.h>
-#include <asm/processor.h>
-
 #ifdef CONFIG_CRASH_DEBUG
 
 #include <xen/gdbstub.h>
+#include <xen/stdbool.h>
+
+#include <asm/x86-defns.h>
 
+/* Returns true if GDB handled the trap, or it is surviveable. */
 static inline bool debugger_trap_fatal(
     unsigned int vector, struct cpu_user_regs *regs)
 {
     int rc = __trap_to_gdb(regs, vector);
-    return ((rc == 0) || (vector == TRAP_int3));
+
+    if ( rc == 0 )
+        return true;
+
+    return vector == X86_EXC_BP;
 }
 
 /* Int3 is a trivial way to gather cpu_user_regs context. */
-#define debugger_trap_immediate() __asm__ __volatile__ ( "int3" );
+#define debugger_trap_immediate() __asm__ __volatile__ ( "int3" )
 
 #else
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 351029f8b239..8d2c2a989708 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -33,7 +33,6 @@
 #include <xen/xenoprof.h>
 #include <xen/irq.h>
 #include <xen/argo.h>
-#include <asm/debugger.h>
 #include <asm/p2m.h>
 #include <asm/processor.h>
 #include <public/sched.h>
-- 
2.11.0


