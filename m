Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 159F036067B
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 12:05:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111012.212176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWyrW-0004O0-3c; Thu, 15 Apr 2021 10:04:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111012.212176; Thu, 15 Apr 2021 10:04:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWyrV-0004Ne-WC; Thu, 15 Apr 2021 10:04:38 +0000
Received: by outflank-mailman (input) for mailman id 111012;
 Thu, 15 Apr 2021 10:04:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C/wI=JM=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1lWyrU-0004NU-N2
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 10:04:36 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 564343f5-6711-48bd-bd92-18067bf0bcc3;
 Thu, 15 Apr 2021 10:04:35 +0000 (UTC)
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
X-Inumbo-ID: 564343f5-6711-48bd-bd92-18067bf0bcc3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618481075;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=36FTba6wXpKsrGSytruNVcKh7iyTzyBZ7hcdmzqIxUw=;
  b=djDs4sktKJoLmtJ1hTp5BXN7BQdMZ40V+7kPCkKlH0CvngmM3LaQ59gL
   1ZcLDuq8H2njJ0Hlzq0MVfdeptKY9llJ17Q/oZ9aJo9MuSb4VNQsb5QT2
   KjptvlftmhUEJDrqJZqgtq9dTME7v97cgGq8pZmJKnNM7NlWKS4swRnoR
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 50X7pzc+yaPzBHTOPz+2vLHLRv+wIDS7xksK3+oZDNUsQ0r2P38fvtcQjMgl4udd8iazdOBx1O
 RvQYMzb7HPatbBT/G3osYqywFovXhJHe2nMLFRhW1YzJ5mjhp6VXnXWwSfSIZ3uoCQ9nGAr3xm
 fKznlRMO28a3Cvl+n7lJu6ijw76p7TQm1P9SvvIRXI6mtwCf6aNbvaBQmdzOXWLcFbR0vQUptQ
 D4CEkg4lAnWDkszuZVlcCIjrJRJhq5Omp3ZGf8pTJkimmy8evDbbduAoo1E3jmtLRU22pwhwn9
 zVg=
X-SBRS: 4.0
X-MesageID: 41658484
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:mibTiK7301shrSv0ngPXwC7XdLJzesId70hD6mlaY3VuHPCwvc
 aogfgdyFvImC8cMUtQ4OyoFaGcTRrnlaJdzpIWOd6ZMDXOmGztF4166Jun/juIIVyaysd49Y
 NNN5dzE8fxC18St7ed3CCdH8w7yNeKtICE7N2urEtFdg1hZ6F+4woRMG/yeScaeCB8CZU0D5
 aa7MZczgDQHUg/VcinGmIDG9HKutyjruOAXTc9GxUl5AOS5AnI1JfGFXGjsSs2Yndqybcm/X
 OtqX2a2pme
X-IronPort-AV: E=Sophos;i="5.82,223,1613451600"; 
   d="scan'208";a="41658484"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <jun.nakajima@intel.com>, <kevin.tian@intel.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <roger.pau@citrix.com>, <wl@xen.org>, "Igor
 Druzhinin" <igor.druzhinin@citrix.com>
Subject: [PATCH v5 2/2] x86/intel: insert Ice Lake-SP and Ice Lake-D model numbers
Date: Thu, 15 Apr 2021 11:04:22 +0100
Message-ID: <1618481062-16094-2-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618481062-16094-1-git-send-email-igor.druzhinin@citrix.com>
References: <1618481062-16094-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

LBR, C-state MSRs should correspond to Ice Lake desktop according to
SDM rev. 74 for both models.

Ice Lake-SP is known to expose IF_PSCHANGE_MC_NO in IA32_ARCH_CAPABILITIES MSR
(as advisory tells and Whitley SDP confirms) which means the erratum is fixed
in hardware for that model and therefore it shouldn't be present in
has_if_pschange_mc list. Provisionally assume the same to be the case
for Ice Lake-D.

Reviewed-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
No changes in v5.

Changes in v4:
- now based on SDM update
- new LBR (0x1e0)does not seem to be exposed in the docs

Changes in v3:
- Add Ice Lake-D model numbers
- Drop has_if_pschange_mc hunk following Tiger Lake related discussion
---
 xen/arch/x86/acpi/cpu_idle.c | 2 ++
 xen/arch/x86/hvm/vmx/vmx.c   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index c092086..d788c8b 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -181,6 +181,8 @@ static void do_get_hw_residencies(void *arg)
     case 0x55:
     case 0x5E:
     /* Ice Lake */
+    case 0x6A:
+    case 0x6C:
     case 0x7D:
     case 0x7E:
     /* Tiger Lake */
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 30c6a57..91cba19 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2990,7 +2990,7 @@ static const struct lbr_info *last_branch_msr_get(void)
         /* Goldmont Plus */
         case 0x7a:
         /* Ice Lake */
-        case 0x7d: case 0x7e:
+        case 0x6a: case 0x6c: case 0x7d: case 0x7e:
         /* Tiger Lake */
         case 0x8c: case 0x8d:
         /* Tremont */
-- 
2.7.4


