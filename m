Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CBE28C774
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 05:04:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6081.15969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSAbK-0000FI-LN; Tue, 13 Oct 2020 03:03:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6081.15969; Tue, 13 Oct 2020 03:03:46 +0000
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
	id 1kSAbK-0000Et-HO; Tue, 13 Oct 2020 03:03:46 +0000
Received: by outflank-mailman (input) for mailman id 6081;
 Tue, 13 Oct 2020 03:03:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pNIz=DU=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kSAbI-0000Em-Os
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 03:03:44 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27ce39d8-7ebc-4fb4-9f47-b6e6e309afee;
 Tue, 13 Oct 2020 03:03:43 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pNIz=DU=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
	id 1kSAbI-0000Em-Os
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 03:03:44 +0000
X-Inumbo-ID: 27ce39d8-7ebc-4fb4-9f47-b6e6e309afee
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 27ce39d8-7ebc-4fb4-9f47-b6e6e309afee;
	Tue, 13 Oct 2020 03:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602558223;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=O/mYe4btk6iL4cQRCK515PsmgpCt8gACdxAma4JiMfQ=;
  b=BNojE2AH4vzfOz3qzMG5JDItz8d3gOzr3b+l6WYFCTNJA2embfv5UsIl
   Kcl5C/5ECM1NIswuDVOmxnTd0fGvrT8HhNb6XlfWpzuDhD+qCCsHW5wyd
   tjowjWGE9O/OuIeBB/lWoQH4WAJsgEcBZwq3iy4pVZypaJ3JHJYJMKtgc
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: cgHnYjnvSKBhweVppumowKMMFABWv8H6ulgkTl4OSbohxpERRkFlnWEiWOhuf7dbgstbxrHCmN
 NMgCi26sn50Qefhv8OWuv0T6uesJ35HqXvU01xZOYqmkcPmo7OuQNYAqUAU94ZPeB2Y07Q2+HT
 LbF2QFQSJDxwOwoysZONUvZ9BACzxnul2/AFVABttr2AJVAdc1sU54Frfk2J/7G7vYVay3sNvS
 +hhbyc+CUM1wFbIN7Ezjhx+4pk6lakyQCeow0VfUZzCQ2lEDFtO921XeecN4lnKlzJiVcYigNi
 gOE=
X-SBRS: 2.5
X-MesageID: 28851031
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,369,1596513600"; 
   d="scan'208";a="28851031"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<wl@xen.org>, <jun.nakajima@intel.com>, <kevin.tian@intel.com>, "Igor
 Druzhinin" <igor.druzhinin@citrix.com>
Subject: [PATCH 1/2] x86/intel: insert Ice Lake X (server) model numbers
Date: Tue, 13 Oct 2020 04:02:48 +0100
Message-ID: <1602558169-23140-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

LBR, C-state MSRs and if_pschange_mc erratum applicability should correspond
to Ice Lake desktop according to External Design Specification vol.2.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
 xen/arch/x86/acpi/cpu_idle.c | 1 +
 xen/arch/x86/hvm/vmx/vmx.c   | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 27e0b52..7ad726a 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -183,6 +183,7 @@ static void do_get_hw_residencies(void *arg)
     /* Ice Lake */
     case 0x7D:
     case 0x7E:
+    case 0x6A:
     /* Kaby Lake */
     case 0x8E:
     case 0x9E:
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 86b8916..bce8b99 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2429,6 +2429,7 @@ static bool __init has_if_pschange_mc(void)
     case 0x55: /* Skylake-X / Cascade Lake */
     case 0x7d: /* Ice Lake */
     case 0x7e: /* Ice Lake */
+    case 0x6a: /* Ice Lake-X */
     case 0x8e: /* Kaby / Coffee / Whiskey Lake M */
     case 0x9e: /* Kaby / Coffee / Whiskey Lake D */
     case 0xa5: /* Comet Lake H/S */
@@ -2775,7 +2776,7 @@ static const struct lbr_info *last_branch_msr_get(void)
         /* Goldmont Plus */
         case 0x7a:
         /* Ice Lake */
-        case 0x7d: case 0x7e:
+        case 0x7d: case 0x7e: case 0x6a:
         /* Tremont */
         case 0x86:
         /* Kaby Lake */
-- 
2.7.4


