Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A531246B93
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 17:58:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7hX6-0006xt-Mh; Mon, 17 Aug 2020 15:58:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGoP=B3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k7hX4-0006wT-Sb
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 15:58:46 +0000
X-Inumbo-ID: 9303d3ee-70fd-4615-8eae-771c6f86528c
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9303d3ee-70fd-4615-8eae-771c6f86528c;
 Mon, 17 Aug 2020 15:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597679923;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aGp+WY6YIORDQ/8VeSo1f4tZia0Y1O1MSRPMQUQz7pM=;
 b=P4Nu8w0AuAbagZlxI2+MN8ybHkj+d28BfbldFBwSIPufwTrUXpWH2/OS
 hkFtcLwRbVsU/Hdqqij70UNjWcQOZVU2svF6Gl1gE5Dngww3ORqIl71po
 evgDESzbZIjcxGduB5/sgJIkN2G1LFDEDXsu8ZZhGjjOdzX+VIy5RQIvU A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ePUlzo4XrjdvuMpehjn7LJ8mYPnPJabjsDQ4GG5U0MwpzcdbuNzyGZLCIrNOzSVCqMB0RakiB1
 j4XdcvZczFOFS8sqFZDv22icGLfrPJD013yacLuz9nJD+8aw6pn2CpGs7l8iY9ZN8Pd7zlcKLh
 NFBKbjfRtsObRTkDvqSW5KoF/fi5K9GszzF6KqroZvXk0f5Pa323x01cOlHgH9cs4aH6rGLf3X
 piSMZQ/UiUYIjqed/g14OIphcAZpQLiNJgwaYi70j2aqbizu76w87wctefMEmZA6qSz+E5VyXZ
 Sk0=
X-SBRS: 2.7
X-MesageID: 24707109
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,324,1592884800"; d="scan'208";a="24707109"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/8] x86/svm: silently drop writes to SYSCFG and related MSRs
Date: Mon, 17 Aug 2020 17:57:51 +0200
Message-ID: <20200817155757.3372-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817155757.3372-1-roger.pau@citrix.com>
References: <20200817155757.3372-1-roger.pau@citrix.com>
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
now, and just return 0 when attempting to read any of the MSRs, while
continuing to silently drop writes.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/svm/svm.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index ca3bbfcbb3..671cdcb724 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1917,6 +1917,13 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
             goto gpf;
         break;
 
+    case MSR_K8_TOP_MEM1:
+    case MSR_K8_TOP_MEM2:
+    case MSR_K8_SYSCFG:
+        /* Return all 0s. */
+        *msr_content = 0;
+        break;
+
     case MSR_K8_VM_CR:
         *msr_content = 0;
         break;
@@ -2094,6 +2101,12 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
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


