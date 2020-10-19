Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1884B29213C
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 04:49:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8584.22975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kULDI-0006Bn-SL; Mon, 19 Oct 2020 02:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8584.22975; Mon, 19 Oct 2020 02:47:56 +0000
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
	id 1kULDI-0006BU-Ou; Mon, 19 Oct 2020 02:47:56 +0000
Received: by outflank-mailman (input) for mailman id 8584;
 Mon, 19 Oct 2020 02:47:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Kus=D2=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kULDG-0006BP-VP
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 02:47:55 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 342d17e0-d348-4515-a558-5ca559d8c559;
 Mon, 19 Oct 2020 02:47:53 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+Kus=D2=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
	id 1kULDG-0006BP-VP
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 02:47:55 +0000
X-Inumbo-ID: 342d17e0-d348-4515-a558-5ca559d8c559
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 342d17e0-d348-4515-a558-5ca559d8c559;
	Mon, 19 Oct 2020 02:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603075673;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=i6jWet7wGgHzs5thnQOYofjpCBTMSaeHPfauKXNT09s=;
  b=baqeWE94OwOoOmKRQuvqS3oGAQGoYGarab+b5ggXU8eqb2puWjlul3IS
   9lSoQRj5sfikesRrFXWtK9fbZPTFHExfvFVRFCJJd3TEW3suLjEo2fmMf
   FrU7oLBuj0A2eUbfSZH0Lr+gxzGhmX28wzDqdIz2oLW4NRElK6Lgwxq5N
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: jjvKeHmaVy0rgK1y3N3S3TQfJQgpolCCv4TBYw67leV04XWuMDR+Ljo/1E/WWqnNbDu0A2JgAP
 RuNyU0cLfIds2APDgLqzYHGZLbbNoPdDT7oEhckxokFkNx8Gkxogjw3Ex8ta0hv0DAMGAXReFb
 I19++EihawBznTUgnYjmC3bca2OuKLxTDsW/+2hNi+Z2Ce4rfiO0fOsrv2R0s5qrEeTjilVyxt
 /Bv/05tvwXJlLAgszdsOO/SR5wcfQcGS6kmrZYAN75K0VSq12wp+BsI4Fh/LeFF1RRNzMNhqWN
 QII=
X-SBRS: 2.5
X-MesageID: 29240102
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,393,1596513600"; 
   d="scan'208";a="29240102"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<wl@xen.org>, <jun.nakajima@intel.com>, <kevin.tian@intel.com>, "Igor
 Druzhinin" <igor.druzhinin@citrix.com>
Subject: [PATCH v2] x86/intel: insert Ice Lake X (server) model numbers
Date: Mon, 19 Oct 2020 03:47:26 +0100
Message-ID: <1603075646-24995-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

LBR, C-state MSRs and if_pschange_mc erratum applicability should correspond
to Ice Lake desktop according to External Design Specification vol.2.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
Changes in v2:
- keep partial sorting

Andrew, since you have access to these documents, please review as you have time.
---
 xen/arch/x86/acpi/cpu_idle.c | 1 +
 xen/arch/x86/hvm/vmx/vmx.c   | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 27e0b52..eca423c 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -181,6 +181,7 @@ static void do_get_hw_residencies(void *arg)
     case 0x55:
     case 0x5E:
     /* Ice Lake */
+    case 0x6A:
     case 0x7D:
     case 0x7E:
     /* Kaby Lake */
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 86b8916..8382917 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2427,6 +2427,7 @@ static bool __init has_if_pschange_mc(void)
     case 0x4e: /* Skylake M */
     case 0x5e: /* Skylake D */
     case 0x55: /* Skylake-X / Cascade Lake */
+    case 0x6a: /* Ice Lake-X */
     case 0x7d: /* Ice Lake */
     case 0x7e: /* Ice Lake */
     case 0x8e: /* Kaby / Coffee / Whiskey Lake M */
@@ -2775,7 +2776,7 @@ static const struct lbr_info *last_branch_msr_get(void)
         /* Goldmont Plus */
         case 0x7a:
         /* Ice Lake */
-        case 0x7d: case 0x7e:
+        case 0x6a: case 0x7d: case 0x7e:
         /* Tremont */
         case 0x86:
         /* Kaby Lake */
-- 
2.7.4


