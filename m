Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MG8eEG/WmGl+NQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 22:47:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3665A16B0C3
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 22:47:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237615.1539911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYLB-0001QG-5b; Fri, 20 Feb 2026 21:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237615.1539911; Fri, 20 Feb 2026 21:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYLA-0001Kr-UA; Fri, 20 Feb 2026 21:47:12 +0000
Received: by outflank-mailman (input) for mailman id 1237615;
 Fri, 20 Feb 2026 21:47:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2tad=AY=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vtYL8-0008Ew-Ad
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 21:47:10 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b51fcf85-0ea5-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 22:47:09 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-43621bf67ceso1666755f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 13:47:09 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a8df83bcsm28940205e9.13.2026.02.20.13.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 13:47:08 -0800 (PST)
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
X-Inumbo-ID: b51fcf85-0ea5-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1771624029; x=1772228829; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Xl/PbKeU3vXsi8lYY06npq9oqfFySBcdivOG4iOWhA=;
        b=ERg4En1oCz/WkmNntbMDWY53yX/uv0MGVYNMAerFvSS+8BcWmHARyQUhbltvyzqwFS
         GKOz8YVL0WVmrS0mZ0ur5q1w0v0sr2GTsnzGGahDi2RSMxrsEOMOesiMrY6RCmdYdQ9M
         jlIjcB6htKAkBARDKeyNtfLOzwmIrpaWKdHEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771624029; x=1772228829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Xl/PbKeU3vXsi8lYY06npq9oqfFySBcdivOG4iOWhA=;
        b=WSBRjF52E3JNx/6uSn41adDMopE7d0i6Jr37g0NS9dc9DNFXKo8Fb56mrYTWh7g3Ke
         pzuIP9hvtRZdy57crogE6dvflkS3SmC32twFULVHnuyVhlLkocFgcEEla/VizUQ+qZ2s
         D4q3slif2lFyHzdwQ/kR4msxtH7h1WqLTfzeYLMkc6sHAK8X19TKH+Or84R0G9leZVDB
         +fdLuxBS4GzjwSs0A3HdARP4yqia3fAu+t7UbgYbeHj9uLE2ZQG/NZctQl8nwsMdLQmp
         WbQSCdAnhaDZowTIiq7OF5xHb02bfn0Z9SBAaziEugofBA+L7MCAhwFLIzKxGo+3liR2
         PkHQ==
X-Gm-Message-State: AOJu0YwO6u1UYVBJiemEIWI1K5kpZ8LBr5hUKJDanPRWeRhNlWN+seI6
	viI1cl+pNa/gWTkoHyWmp8ogxSKTSgAvKTTOT2aSIjPYWAT3+jzZaDaSShF7+8VgmqfmQkUr+Pn
	9v14Q
X-Gm-Gg: AZuq6aJ2tdCVyO5Krq1cPDgNooaBrvJh4O4aIcEKyUGmv8chcRpvLD3KBpahXHckWdW
	yqhJN3aY6yLN17uPVtPFW5VVOIgrMprp//xLF8IcdYTrhYd1dKDWFdJbw1+rrpw5rhiRYVwxTPM
	cb7boab4+irKj2ppl6VT3Z6N2PGMjcjBESFvxQonRX66uiRpsJ8DoYcbsvZozqwCt4Z3emQ3apU
	Sby8P00/7fztZB9hHnwraX0M8Rs2YKiNZzS/nK0kjMgKOXoxDc1e4WkMMTr7jHQ022IC6iqOB8Y
	swU/JOULuXTBzejQyhjflI35WA8VxmlLlBUdSAGBuwILVhY4DrtQaZcfY3WQ9bKnbswpl8z+BJn
	l4lV0wfXZa9HFirfoGB+Ekl9MD4eMND5Y0b4emXefkfFu1NCYYZ+McLaoIjvKmraaDEMt8vGSQT
	S1LdAmN+wXXS/aQHqjidv+7QixNlfrAdoH+7twSyebk4Az9L9npaCJheYIVT9U4a1bpe283G8=
X-Received: by 2002:a05:600c:4e4a:b0:483:129e:b573 with SMTP id 5b1f17b1804b1-483a962d1d1mr17672845e9.18.1771624028447;
        Fri, 20 Feb 2026 13:47:08 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 08/12] arm/pci-designware: Fix MISRA violations
Date: Fri, 20 Feb 2026 21:46:49 +0000
Message-Id: <20260220214653.3497384-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3665A16B0C3
X-Rspamd-Action: no action

 * Move includes inside the header guards (D4.10)
 * Use NULL in preference to 0 (R11.9)

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/arm/pci/pci-designware.c | 2 +-
 xen/arch/arm/pci/pci-designware.h | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/pci/pci-designware.c b/xen/arch/arm/pci/pci-designware.c
index 0bd67524ac8b..6b85213f637b 100644
--- a/xen/arch/arm/pci/pci-designware.c
+++ b/xen/arch/arm/pci/pci-designware.c
@@ -285,7 +285,7 @@ void __iomem *dw_pcie_child_map_bus(struct pci_host_bridge *bridge,
                                     bridge->child_cfg->phys_addr, busdev,
                                     bridge->child_cfg->size);
     if ( ret )
-        return 0;
+        return NULL;
 
     return bridge->child_cfg->win + where;
 }
diff --git a/xen/arch/arm/pci/pci-designware.h b/xen/arch/arm/pci/pci-designware.h
index b9deb3b138ae..bd93dab6f2f1 100644
--- a/xen/arch/arm/pci/pci-designware.h
+++ b/xen/arch/arm/pci/pci-designware.h
@@ -6,12 +6,11 @@
  * Based on xen/arch/arm/pci/pci-host-generic.c
  */
 
-#include <xen/pci.h>
-#include <xen/init.h>
-
 #ifndef __PCI_DESIGNWARE_H__
 #define __PCI_DESIGNWARE_H__
 
+#include <xen/pci.h>
+#include <xen/init.h>
 
 #define PCIE_ATU_VIEWPORT               0x900
 #define PCIE_ATU_REGION_OUTBOUND        0
-- 
2.39.5


