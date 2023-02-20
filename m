Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AF469C93F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 12:05:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498009.768781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU3yZ-00042R-HJ; Mon, 20 Feb 2023 11:04:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498009.768781; Mon, 20 Feb 2023 11:04:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU3yZ-0003zJ-Dy; Mon, 20 Feb 2023 11:04:55 +0000
Received: by outflank-mailman (input) for mailman id 498009;
 Mon, 20 Feb 2023 11:04:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CT8u=6Q=citrix.com=prvs=408b4b2b9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pU3yX-0003z8-KZ
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 11:04:53 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 649649bb-b10e-11ed-933d-83870f6b2ba8;
 Mon, 20 Feb 2023 12:04:51 +0100 (CET)
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
X-Inumbo-ID: 649649bb-b10e-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676891091;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CsFq8b5LCrQLYxvppMCMp85XRubt/i7qyf+titO7ukI=;
  b=E5h4JVWAjqM74n7vtk8UOtf4eKb/DyconX+yJo7NUZFbsIZ1Hrb4RFNA
   jA3fOmho6e1jYC6Q2xbEbQdaBw6PUHjh0h+XN1rOIvp5Lpiox3fkymGdz
   vfbQNt2k3cwXCxG65RhsO+UqKK0GV4ZDDaReA+Flxo4Pfx+vUQIMWyuN2
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97643589
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:64mog69H/U+67uo2Fko3DrUDqX6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 DMaCm+DP66JY2f9fdtzOom1/U1QuseGzdVrSAc5+CE8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmP6oT5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklux
 OI/BHchUSrdxMWN6ZCdZssruM08eZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0EwRjE/
 T+WrgwVBDlBL8TGwxvUzkuHudbUnA2kYrtJBv6Ro6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0efBdDuk74wGl0bfP7kCSAW1sZiFFQMwrsokxXzNC/
 lyOmcngCXpwsbmWYXWH/7yQoHW5Pi19EIMZTXZaF01fuYCl+dxtyEuVFb6PDZJZkPXVKC/X7
 3emkxJgxJIopOwt+4f8w1nY1mfESofyciY54QDeX2SA5wx/ZZK4a4HA1WU3/cqsP67CEADf4
 SFsd9y2qblXUMrTzHDlrPAlRunB2hqTDNHLbbeD9bEF/i/lxXOsdJs4DNpWdBYwaZZsldMEj
 SbuVeJtCH17ZiTCgUxfOdjZ5yEWIU/ITI2NaxwsRoASCqWdjSfelM2UWWae3nr2jG8nmrwlN
 JGQfK6EVChFV/Q8lWTtGrhFitfHIxzSIkuJGPjGI+mPi+LCNBZ5t59YWLdxUgzJxPzd+1iEm
 zquH8CL1w9eQIXDjtr/qOYuwaQxBSFjX/je8pUHHtNv1yI6QAnN/deNm+J+E2Gk9owJ/tr1E
 oaVABEBmAev2iGWcG1nqBlLMdvSYHq2llpjVQREALpi8yF7CWpzxM/zr6cKQIQ=
IronPort-HdrOrdr: A9a23:wtnDIKPPUD6ZdMBcTs2jsMiBIKoaSvp037Eqv3oedfUzSL3+qy
 nOpoV+6faaslYssR0b9exoW5PwJE80l6QFgrX5VI3KNGKN1VdARLsSi7cKqAeAJ8SRzIFgPN
 9bAspDNOE=
X-IronPort-AV: E=Sophos;i="5.97,312,1669093200"; 
   d="scan'208";a="97643589"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] x86/asm: ELF metadata for simple cases
Date: Mon, 20 Feb 2023 11:04:39 +0000
Message-ID: <20230220110439.1518972-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is generally good practice, and necessary for livepatch binary diffing to
work.

With this, livepatching of the SVM entry path works.  The only complication is
with svm_stgi_label which is only used by oprofile to guestimate (not
completely correctly) when an NMI hit guest context.

Livepatching of VMX is still an open question, because the logic doesn't form
anything remotely resembling functions.  Both code fragments jump into each
other so need to be updated in tandem.  Also, both code fragment entries need
trampolines in the case that patching actually occurs.  For now, just treat it
as a single function.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/clear_page.S    | 3 +++
 xen/arch/x86/copy_page.S     | 3 +++
 xen/arch/x86/hvm/svm/entry.S | 3 +++
 xen/arch/x86/hvm/vmx/entry.S | 3 +++
 4 files changed, 12 insertions(+)

diff --git a/xen/arch/x86/clear_page.S b/xen/arch/x86/clear_page.S
index d9d524c79ecd..5b5622cc526f 100644
--- a/xen/arch/x86/clear_page.S
+++ b/xen/arch/x86/clear_page.S
@@ -16,3 +16,6 @@ ENTRY(clear_page_sse2)
 
         sfence
         ret
+
+        .type clear_page_sse2, @function
+        .size clear_page_sse2, . - clear_page_sse2
diff --git a/xen/arch/x86/copy_page.S b/xen/arch/x86/copy_page.S
index 2da81126c5fa..ddb6e0ebbb6e 100644
--- a/xen/arch/x86/copy_page.S
+++ b/xen/arch/x86/copy_page.S
@@ -41,3 +41,6 @@ ENTRY(copy_page_sse2)
 
         sfence
         ret
+
+        .type copy_page_sse2, @function
+        .size copy_page_sse2, . - copy_page_sse2
diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index 981cd82e7c0b..9e3dab768027 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -142,3 +142,6 @@ GLOBAL(svm_stgi_label)
         sti
         call do_softirq
         jmp  .Lsvm_do_resume
+
+        .type svm_asm_do_resume, @function
+        .size svm_asm_do_resume, . - svm_asm_do_resume
diff --git a/xen/arch/x86/hvm/vmx/entry.S b/xen/arch/x86/hvm/vmx/entry.S
index 5f5de45a1309..e3f60d5a82f7 100644
--- a/xen/arch/x86/hvm/vmx/entry.S
+++ b/xen/arch/x86/hvm/vmx/entry.S
@@ -150,3 +150,6 @@ ENTRY(vmx_asm_do_vmentry)
         sti
         call do_softirq
         jmp  .Lvmx_do_vmentry
+
+        .type vmx_asm_vmexit_handler, @function
+        .size vmx_asm_vmexit_handler, . - vmx_asm_vmexit_handler
-- 
2.30.2


