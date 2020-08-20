Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8220224C16C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 17:09:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8mC7-0003nR-UW; Thu, 20 Aug 2020 15:09:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00F7=B6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k8mC6-0003lg-1l
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 15:09:34 +0000
X-Inumbo-ID: 7f8d7d2f-2fda-4dec-8a3c-ab1294a9fe79
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f8d7d2f-2fda-4dec-8a3c-ab1294a9fe79;
 Thu, 20 Aug 2020 15:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597936167;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CEi0dM/7BZiEN912X8rVzEnoKxkc3ToKQEfV0GTNGho=;
 b=aMBlpmRv85G02PL4RXDyai5dYX7NguRFnLQhErA86immVbCBCAsv5kfQ
 46g19ERApFEyHi0qxvb6nixTB7X6eIGyMFtuTJoaDZ7FoWGs/LME/60SJ
 DV/5hoZP7jLAz+/i93D9lc78TJkTNXhugt9cxFI0yEe7B3TIUo0lBw7aU 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 7UgPcAb17xC0Lh0mDPXV7r92EowuEbFQLsTV3gXXjj1ZeNXBlXWn43BEA6BgFssCksfw+6bQuL
 AfC4J6lenGn4osDgd71aRv6aQSxXTM4DnqrxJ95RUARWYN7ZQlsIBCX5N+SxecofVJ6pX4WS6/
 m/xZWJAmH1ptFGwnvTJ+nzzH+s2tQNI0aE8cO+MO8l1A5WK7EW3TpmPKwuC45gAKSkn1yXlqbW
 2kRASZMu5CYnfyPqbwooWymsAs7JXleklDcVSpwifoeXs+aW5leyn51zIdIR2CnuntoI4UaCZU
 H0w=
X-SBRS: 2.7
X-MesageID: 25887029
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,333,1592884800"; d="scan'208";a="25887029"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/8] x86/svm: silently drop writes to SYSCFG and related
 MSRs
Date: Thu, 20 Aug 2020 17:08:29 +0200
Message-ID: <20200820150835.27440-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200820150835.27440-1-roger.pau@citrix.com>
References: <20200820150835.27440-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The SYSCFG, TOP_MEM1 and TOP_MEM2 MSRs are currently exposed to guests
and writes are silently discarded. Make this explicit in the SVM code
now, and just return default constant values when attempting to read
any of the MSRs, while continuing to silently drop writes.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes sincxe v1:
 - Return MtrrFixDramEn in MSR_K8_SYSCFG.
---
 xen/arch/x86/hvm/svm/svm.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index ca3bbfcbb3..2d0823e7e1 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1917,6 +1917,21 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
             goto gpf;
         break;
 
+    case MSR_K8_TOP_MEM1:
+    case MSR_K8_TOP_MEM2:
+        *msr_content = 0;
+        break;
+
+    case MSR_K8_SYSCFG:
+        /*
+         * Return MtrrFixDramEn: albeit the current emulated MTRR
+         * implementation doesn't support the Extended Type-Field Format having
+         * such bit set is common on AMD hardware and is harmless as long as
+         * MtrrFixDramModEn isn't set.
+         */
+        *msr_content = K8_MTRRFIXRANGE_DRAM_ENABLE;
+        break;
+
     case MSR_K8_VM_CR:
         *msr_content = 0;
         break;
@@ -2094,6 +2109,12 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
             goto gpf;
         break;
 
+    case MSR_K8_TOP_MEM1:
+    case MSR_K8_TOP_MEM2:
+    case MSR_K8_SYSCFG:
+        /* Drop writes. */
+        break;
+
     case MSR_K8_VM_CR:
         /* ignore write. handle all bits as read-only. */
         break;
-- 
2.28.0


