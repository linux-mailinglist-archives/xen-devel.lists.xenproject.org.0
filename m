Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA632842F7E
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 23:18:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673696.1048137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUwQs-0003OR-FD; Tue, 30 Jan 2024 22:18:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673696.1048137; Tue, 30 Jan 2024 22:18:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUwQs-0003Lh-CQ; Tue, 30 Jan 2024 22:18:18 +0000
Received: by outflank-mailman (input) for mailman id 673696;
 Tue, 30 Jan 2024 22:18:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Trk4=JI=citrix.com=prvs=75271d196=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1rUwQq-0003Lb-Uc
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 22:18:16 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74b0984a-bfbd-11ee-98f5-efadbce2ee36;
 Tue, 30 Jan 2024 23:18:13 +0100 (CET)
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
X-Inumbo-ID: 74b0984a-bfbd-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1706653093;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=b6JzBp0ijsWohe5bXoiNSSWryp89VhusQYLaQCrfiZM=;
  b=RONGl+RZ17p9SRdujxRUtFtkvGRPsYwZBdI2yfcEKzMqeYnK4YhlcL2f
   P+n6UIRxL59EgD8KEvVG82l8qDp5m3B97fVVLS2VR/4v2WhRfHjUsQHDt
   ELSJQCB+fDzkGrmsgncJ1gVbQeFKMYvZVQXuFZaZ6UV42YSOgS9rBhhrG
   s=;
X-CSE-ConnectionGUID: T8jdLx1VTmCye2qZV38ruw==
X-CSE-MsgGUID: /AjM7Ju+SJeLhzy1CVBo5w==
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 130227922
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:0/LZ/6rElsCd8ypcHu5EfJ6Y3x5eBmJ0ZRIvgKrLsJaIsI4StFCzt
 garIBnTaf+LZ2PzKotxO4TiphkCusDVmNZiSAZqpXw0RiIQpZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04G5wUmAWP6gR4AeHzCFNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAAxdbBynl7uI/LeQW+Q2n/Ydd5nxIZxK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSaxFIUPrSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw/
 zmepT6mU0tAXDCZ4X2s8FfzpPKMpgH2fIIABeSTyNRt3ULGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8UYwgyQzqvf4y6CG3MJCDVGbbQOr9QqTDYn0
 luImdLBBjF1trCRD3WH+d+8sjeaKSUTa2gYakcsTxYB4tTliJE+iFTIVNkLLUKupoSrQ3eqm
 WnM9XVvwepL5SIW60ml1WyXgT6ItsH3cgse9wiNR1CbtVNjeZHwMuRE9mPnAeZ8wJexFwbZ4
 iZdypnBsIgz4YexeDthqdjh/Y1FBN7faVUweXY1Q/EcG82FohZPh7x47jBkP1tOOc0ZYzLva
 0K7kVoOvMENYCPyNvErO9zZ5yEWIU/ITIqNaxwpRoAWPsgZmPGvokmCmnJ8L0iyyRNxwMnTy
 L+QcNq2DGZyNJmLOAGeHr9HuZdyn3BW+I8mbcyjp/hR+ebENSH9pHZsGAfmU93VG4vf/VmNr
 IcFa5Lao/idOcWnChTqHUcoBQhiBRAG6Vre8qS7qsbrztJaJVwc
IronPort-HdrOrdr: A9a23:afRh/a90nIPQwn/6MhZuk+DUI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+MjztCWE7gr5N0tBpTntAsW9qBDnhPtICOsqTNSftWDd0QPCRuxfBOPZslrd8kbFl9K1u5
 0OT0EHMqyTMWRH
X-Talos-CUID: 9a23:9eiTnmz9CcaljFKJL2BEBgUoSsIpVm2E8kvVCF61U39bdubFU0KPrfY=
X-Talos-MUID: 9a23:/3tFagvJV7+vaEX8y82nwxhgEZhK/ueVKk0pkYcX4uK6HystJGLI
X-IronPort-AV: E=Sophos;i="6.05,230,1701147600"; 
   d="scan'208";a="130227922"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: [PATCH] xen: Drop superfluous semi-colons
Date: Tue, 30 Jan 2024 22:18:08 +0000
Message-ID: <20240130221808.104878-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

All these cases happen to be benign, but drop them anyway.  This is one step
towards making -Wextra-semi work.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
---
 xen/common/sched/private.h   | 2 +-
 xen/drivers/acpi/apei/hest.c | 2 +-
 xen/include/xen/livepatch.h  | 2 +-
 xen/include/xen/serial.h     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index 79e3f56c5a08..26a196f4283b 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -518,7 +518,7 @@ static inline void sched_unit_unpause(const struct sched_unit *unit)
 }
 
 #define REGISTER_SCHEDULER(x) static const struct scheduler *x##_entry \
-  __used_section(".data.schedulers") = &x;
+  __used_section(".data.schedulers") = &x
 
 struct cpupool
 {
diff --git a/xen/drivers/acpi/apei/hest.c b/xen/drivers/acpi/apei/hest.c
index 4ec28c3c11ba..34b376bc2d74 100644
--- a/xen/drivers/acpi/apei/hest.c
+++ b/xen/drivers/acpi/apei/hest.c
@@ -86,7 +86,7 @@ static int hest_esrc_len(const struct acpi_hest_header *hest_hdr)
 	BUG_ON(len == -1);
 
 	return len;
-};
+}
 
 int apei_hest_parse(apei_hest_func_t func, void *data)
 {
diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
index df339a134e40..45df4bba4f45 100644
--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -182,7 +182,7 @@ static inline int livepatch_op(struct xen_sysctl_livepatch_op *op)
     return -ENOSYS;
 }
 
-static inline void check_for_livepatch_work(void) { };
+static inline void check_for_livepatch_work(void) {}
 static inline bool is_patch(const void *addr)
 {
     return 0;
diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
index 870ca2f6eb03..12ef24351d0f 100644
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -175,7 +175,7 @@ void ehci_dbgp_init(void);
 #ifdef CONFIG_XHCI
 void xhci_dbc_uart_init(void);
 #else
-static void inline xhci_dbc_uart_init(void) {};
+static void inline xhci_dbc_uart_init(void) {}
 #endif
 
 void arm_uart_init(void);
-- 
2.30.2


