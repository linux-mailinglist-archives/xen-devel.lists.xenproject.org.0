Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1640DC00253
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 11:12:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148836.1480691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBrMt-00040t-5h; Thu, 23 Oct 2025 09:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148836.1480691; Thu, 23 Oct 2025 09:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBrMs-0003za-Tu; Thu, 23 Oct 2025 09:12:22 +0000
Received: by outflank-mailman (input) for mailman id 1148836;
 Thu, 23 Oct 2025 09:12:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vapE=5A=bounce.vates.tech=bounce-md_30504962.68f9f173.v1-291a88186bbd414a9eb5fb1b639043c2@srs-se1.protection.inumbo.net>)
 id 1vBrMr-0003Xf-33
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 09:12:21 +0000
Received: from mail180-10.suw31.mandrillapp.com
 (mail180-10.suw31.mandrillapp.com [198.2.180.10])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 607b37cf-aff0-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 11:12:20 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-10.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4csgKH1Plkz5QlgsB
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 09:12:19 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 291a88186bbd414a9eb5fb1b639043c2; Thu, 23 Oct 2025 09:12:19 +0000
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
X-Inumbo-ID: 607b37cf-aff0-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761210739; x=1761480739;
	bh=dmYymRXdQlvyIjJOCaPFoHAY8shqwbUzyg9v7qIutBA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=mPV/TU44iBbaoJW9BLPOGhcaSkRH05kyrPRkqHQ/82/ErTSdxQuUyEIOgSP8HCNk+
	 kvaLv6TyHpBjHS+cydUhkM97oemt9CEZXiSd92vgN5ShuYgv/G/KGX7c+SVPcQE4YP
	 jMEG9wir9j0+HWbfjXGudhRnOe//ow3TTTULBdzMfjXYWC4vI1OJOzkXM/eJpw9xPJ
	 Kv3r1tNZXuWH09kwamV9lihaJOaSP2DfPUMB/Ay/MncSEK0nM2aM0z20OY5RK287KA
	 o8adwnerk1/GlHv5EN4XC15g74J1rnm3XFwkDVr5XypLuQ2u8P4gbuos/9J20ikUjj
	 4M5vpq+ISWfoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761210739; x=1761471239; i=teddy.astie@vates.tech;
	bh=dmYymRXdQlvyIjJOCaPFoHAY8shqwbUzyg9v7qIutBA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=qqtzB1pAwuJg6H7CmJzuWQmt7vGlU7MBHGZ7zYXpKgH+wr+CPSW2jJf6WGrjRgaSY
	 z4wZSYd4nC6ViBCqcB62n2S0+LVqnB+qdZwcH+CAUdMb/7ens2vTb7GUAbwrTrN7XB
	 JXQ8jaAlZUKbQjJ2dhK3Z5wfepMm+IcvUFrP43MEX8v9B4Ck84xe8uwdayb8o8o/6Z
	 meuo0a0Aqxo+c/C1pc+iuh78yAeJd7khtvZPeMi9UuKMUTT1mvonewkuNKf7kiTpI8
	 Jgwdobq0KSZJOCxZTUoyjrsiq4iqggpJkEZ4KOEATrwI+8MmLUCFGy/R4tpZOvzGC4
	 bIMZIvN1cTSNA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2=203/5]=20vtd:=20Collapse=20x86=20subdirectory?=
X-Mailer: git-send-email 2.51.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761210736930
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>
Message-Id: <3e9e5ea80bb534b69bd315099da6b5d049852823.1761209564.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1761209564.git.teddy.astie@vates.tech>
References: <cover.1761209564.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.291a88186bbd414a9eb5fb1b639043c2?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251023:md
Date: Thu, 23 Oct 2025 09:12:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

The x86 subdirectory was originally meant to split x86-specific logic from
general VT-d code. Today, Xen only supports VT-d on x86 and the code actually
implemented in this subdirectory isn't x86-specific (e.g ATS code is not x86
specific).

As ats.c is the only remaining file in this directory, and isn't x86 specific,
move it up to vtd directory and remove the now empty x86 subdirectory.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
v2:
 - reviewed commit description

 xen/drivers/passthrough/vtd/Makefile        |  3 +--
 xen/drivers/passthrough/vtd/{x86 => }/ats.c | 10 +++++-----
 xen/drivers/passthrough/vtd/x86/Makefile    |  1 -
 3 files changed, 6 insertions(+), 8 deletions(-)
 rename xen/drivers/passthrough/vtd/{x86 => }/ats.c (97%)
 delete mode 100644 xen/drivers/passthrough/vtd/x86/Makefile

diff --git a/xen/drivers/passthrough/vtd/Makefile b/xen/drivers/passthrough/vtd/Makefile
index fde7555fac..328a014016 100644
--- a/xen/drivers/passthrough/vtd/Makefile
+++ b/xen/drivers/passthrough/vtd/Makefile
@@ -1,5 +1,4 @@
-obj-$(CONFIG_X86) += x86/
-
+obj-y += ats.o
 obj-y += iommu.o
 obj-y += dmar.o
 obj-y += utils.o
diff --git a/xen/drivers/passthrough/vtd/x86/ats.c b/xen/drivers/passthrough/vtd/ats.c
similarity index 97%
rename from xen/drivers/passthrough/vtd/x86/ats.c
rename to xen/drivers/passthrough/vtd/ats.c
index fed3588e8e..3b7c4028a6 100644
--- a/xen/drivers/passthrough/vtd/x86/ats.c
+++ b/xen/drivers/passthrough/vtd/ats.c
@@ -23,11 +23,11 @@
 #include <xen/pci.h>
 #include <xen/pci_regs.h>
 #include <asm/msi.h>
-#include "../iommu.h"
-#include "../dmar.h"
-#include "../vtd.h"
-#include "../extern.h"
-#include "../../ats.h"
+#include "iommu.h"
+#include "dmar.h"
+#include "vtd.h"
+#include "extern.h"
+#include "../ats.h"
 
 static LIST_HEAD(ats_dev_drhd_units);
 
diff --git a/xen/drivers/passthrough/vtd/x86/Makefile b/xen/drivers/passthrough/vtd/x86/Makefile
deleted file mode 100644
index 82b3904a91..0000000000
--- a/xen/drivers/passthrough/vtd/x86/Makefile
+++ /dev/null
@@ -1 +0,0 @@
-obj-y += ats.o
\ No newline at end of file
-- 
2.51.1



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


