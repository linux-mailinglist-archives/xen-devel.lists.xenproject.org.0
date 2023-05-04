Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AD16F7338
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 21:39:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530043.825316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puenk-0007bL-DT; Thu, 04 May 2023 19:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530043.825316; Thu, 04 May 2023 19:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puenk-0007Sm-6t; Thu, 04 May 2023 19:39:40 +0000
Received: by outflank-mailman (input) for mailman id 530043;
 Thu, 04 May 2023 19:39:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jZxo=AZ=citrix.com=prvs=48139b1ea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puenj-00069W-3g
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 19:39:39 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 672ce9c0-eab3-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 21:39:37 +0200 (CEST)
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
X-Inumbo-ID: 672ce9c0-eab3-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683229177;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9R0YIYGzst7iA1qXqPxFQ9NZvJDOOPfxgM5CuGK9bi0=;
  b=bikuqNEzzDFQ2Sf6I2FAkoVPskOLa973sYNn8vEWFMOGFl5lyQrQ30u5
   /EvVrVGWRbweLgs+i7XQUjnYfXHVTIXd4p4/DevXudG10pLMYhfYpkXPR
   PAg1dK2hch0j0mGjogzNY5HlVx/oy0M8kYNXuVd2LpG1AOtgp2vPOf6vB
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 107797747
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:+Wvn1ajqcahEGyv37WPFhN36X161ERAKZh0ujC45NGQN5FlHY01je
 htvWz2HafyDMGTye4twad+0o0gB75PXm4dqHQptpCo8Qigb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWj0N8klgZmP6sT4QeCzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRbAwstaBynpt7umoPjceNSlNsvL/vSadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 j2ZrjumXk5y2Nq3zBiv6U2mh+v1hWD3XcFPRIGqyO86nwjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O88Q5RyJy6HUyx2EHWVCRTlEAPQ5sOcmSDps0
 UWG9+4FHhQ27ufTEyjEsO7J83XrY3N9wXI+iTEsDiA+w9/vhKAP1kj+Fu1pLryqgt7HIGSlq
 9yVlxTSl4n/nOZSifXgpQmd023zznTaZlVrv1uKBwpJ+is8Pdf4PNLwtDA3+N4adO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGFb5J+i8GBkkeC9U3j8sIFcFm
 nP7twJL/4N0N3C3d6JxaI/ZI510nfO6T4q5D6GMNYUmjn1NSeN61Hs2OR74M57FySDAbp3Ty
 b/EKJ3xXB72+IxszSasRvd17ILHMhsWnDuJLbiilkTP7FZrTCLNIVvzGAfUP79RAWLtiFm9z
 uuzwOPQlk4BDbekOXGImWPRRHhTRUUG6VnNg5Q/Xoa+zsBOQgnN19e5LWsdRrFY
IronPort-HdrOrdr: A9a23:DDCJwqG4+wEztRPFpLqELMeALOsnbusQ8zAXPiBKJCC9E/bo8v
 xG+c5w6faaslkssR0b9+xoW5PwI080l6QU3WB5B97LMDUO0FHCEGgI1/qA/9SPIUzDHu4279
 YbT0B9YueAcGSTW6zBkXWF+9VL+qj5zEix792uq0uE1WtRGtldBwESMHf9LmRGADNoKLAeD5
 Sm6s9Ot1ObCA8qhpTSPAhiYwDbzee77a7bXQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AnvwvZWqHZzaKT4gwBTMBk1PmUYMOSV3bwFPxHxf?=
 =?us-ascii?q?iOD5SQoOHVlOTypoxxg=3D=3D?=
X-Talos-MUID: 9a23:yZW1TQnAhHGdUB5UFoWydnpnFu1z3K6vDHoV0pkD+JTUCT5OKmeC2WE=
X-IronPort-AV: E=Sophos;i="5.99,250,1677560400"; 
   d="scan'208";a="107797747"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 4/6] x86/cpu-policy: Split cpuid-consts.h out of cpu-policy.h
Date: Thu, 4 May 2023 20:39:22 +0100
Message-ID: <20230504193924.3305496-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230504193924.3305496-1-andrew.cooper3@citrix.com>
References: <20230504193924.3305496-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

In order to disentangle X86_NR_FEAT from FEATURESET_NR_ENTRIES, we need to
adjust asm/cpufeatures.h's inclusion of cpuid-autogen.h, and including all of
cpu-policy.h ends with cyclic dependences and a mess.

Split the FEATURESET_* constants out into a new header.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

I don't particularly like this, but I can't find a better alternative.
---
 xen/include/xen/lib/x86/cpu-policy.h   | 19 +-------------
 xen/include/xen/lib/x86/cpuid-consts.h | 34 ++++++++++++++++++++++++++
 2 files changed, 35 insertions(+), 18 deletions(-)
 create mode 100644 xen/include/xen/lib/x86/cpuid-consts.h

diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index bfa425060464..e9bda14a7595 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -2,24 +2,7 @@
 #ifndef XEN_LIB_X86_POLICIES_H
 #define XEN_LIB_X86_POLICIES_H
 
-#include <xen/lib/x86/cpuid-autogen.h>
-
-#define FEATURESET_1d     0 /* 0x00000001.edx      */
-#define FEATURESET_1c     1 /* 0x00000001.ecx      */
-#define FEATURESET_e1d    2 /* 0x80000001.edx      */
-#define FEATURESET_e1c    3 /* 0x80000001.ecx      */
-#define FEATURESET_Da1    4 /* 0x0000000d:1.eax    */
-#define FEATURESET_7b0    5 /* 0x00000007:0.ebx    */
-#define FEATURESET_7c0    6 /* 0x00000007:0.ecx    */
-#define FEATURESET_e7d    7 /* 0x80000007.edx      */
-#define FEATURESET_e8b    8 /* 0x80000008.ebx      */
-#define FEATURESET_7d0    9 /* 0x00000007:0.edx    */
-#define FEATURESET_7a1   10 /* 0x00000007:1.eax    */
-#define FEATURESET_e21a  11 /* 0x80000021.eax      */
-#define FEATURESET_7b1   12 /* 0x00000007:1.ebx    */
-#define FEATURESET_7d2   13 /* 0x00000007:2.edx    */
-#define FEATURESET_7c1   14 /* 0x00000007:1.ecx    */
-#define FEATURESET_7d1   15 /* 0x00000007:1.edx    */
+#include <xen/lib/x86/cpuid-consts.h>
 
 struct cpuid_leaf
 {
diff --git a/xen/include/xen/lib/x86/cpuid-consts.h b/xen/include/xen/lib/x86/cpuid-consts.h
new file mode 100644
index 000000000000..6ca8c39a3df4
--- /dev/null
+++ b/xen/include/xen/lib/x86/cpuid-consts.h
@@ -0,0 +1,34 @@
+/* Common data structures and functions consumed by hypervisor and toolstack */
+#ifndef XEN_LIB_X86_CONSTS_H
+#define XEN_LIB_X86_CONSTS_H
+
+#include <xen/lib/x86/cpuid-autogen.h>
+
+#define FEATURESET_1d     0 /* 0x00000001.edx      */
+#define FEATURESET_1c     1 /* 0x00000001.ecx      */
+#define FEATURESET_e1d    2 /* 0x80000001.edx      */
+#define FEATURESET_e1c    3 /* 0x80000001.ecx      */
+#define FEATURESET_Da1    4 /* 0x0000000d:1.eax    */
+#define FEATURESET_7b0    5 /* 0x00000007:0.ebx    */
+#define FEATURESET_7c0    6 /* 0x00000007:0.ecx    */
+#define FEATURESET_e7d    7 /* 0x80000007.edx      */
+#define FEATURESET_e8b    8 /* 0x80000008.ebx      */
+#define FEATURESET_7d0    9 /* 0x00000007:0.edx    */
+#define FEATURESET_7a1   10 /* 0x00000007:1.eax    */
+#define FEATURESET_e21a  11 /* 0x80000021.eax      */
+#define FEATURESET_7b1   12 /* 0x00000007:1.ebx    */
+#define FEATURESET_7d2   13 /* 0x00000007:2.edx    */
+#define FEATURESET_7c1   14 /* 0x00000007:1.ecx    */
+#define FEATURESET_7d1   15 /* 0x00000007:1.edx    */
+
+#endif /* !XEN_LIB_X86_CONSTS_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.30.2


