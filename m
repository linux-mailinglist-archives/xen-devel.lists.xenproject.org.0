Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8679F2C937A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 01:00:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41530.74740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjt5U-0002St-OV; Tue, 01 Dec 2020 00:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41530.74740; Tue, 01 Dec 2020 00:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjt5U-0002Rl-Kf; Tue, 01 Dec 2020 00:00:08 +0000
Received: by outflank-mailman (input) for mailman id 41530;
 Tue, 01 Dec 2020 00:00:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WCSm=FF=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kjt5S-0002OY-TW
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 00:00:06 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 096d6e64-5b30-4155-aa85-4458a9364139;
 Tue, 01 Dec 2020 00:00:05 +0000 (UTC)
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
X-Inumbo-ID: 096d6e64-5b30-4155-aa85-4458a9364139
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606780805;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=vNn3KP4WjXfpM6kbKGzfo/xBCJOMYjHp8/tp6Or9F/g=;
  b=NhZO8mh9zIwJsBQpqe//G7KWsB9puQss7x9grCN//TMGotWEFyuka0ml
   fpCB0jZ1qf5mUvNo9n/3yoH1xwTYtjt2eEp4vxn75HjwlJrTIA9Cd4XxU
   fZhbBFKyXCRiZqRDT+iisUH3lTAixcjgEw3kKRHWmBsYopRjbRkRPVAWZ
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: MU1q1OVfNhGAOCZ8vgWjDcDNyKxtTuhjZRCeMCqhSdbGBsEb+15fHdFnJqr4FqaXxl2gdjig/5
 /o2v4nmXgA07JIYyR1sII3kO4VvHP5nW2xd8gnbV/r4gbvx96kgwDbvu8tARPZ3Gb6aGCN7KwE
 LVm0CHoUXxNimPHC+lpKMjLBENjDi1fx+2xwuDEZNBF1iuL4Cw8vuOFTccFqWyvkPCRezoXwsG
 kV8HhjGjTu51Lu/BvFmK66UeLPABPtHMcXZq/LY1TbSBACc31crIARIqZCIsCYSczNUQxZOYRI
 IgQ=
X-SBRS: None
X-MesageID: 32183726
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,382,1599537600"; 
   d="scan'208";a="32183726"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<wl@xen.org>, Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: [PATCH] x86/IRQ: bump max number of guests for a shared IRQ to 31
Date: Mon, 30 Nov 2020 23:59:37 +0000
Message-ID: <1606780777-30718-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

Current limit of 7 is too restrictive for modern systems where one GSI
could be shared by potentially many PCI INTx sources where each of them
corresponds to a device passed through to its own guest. Some systems do not
apply due dilligence in swizzling INTx links in case e.g. INTA is declared as
interrupt pin for the majority of PCI devices behind a single router,
resulting in overuse of a GSI.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---

If people think that would make sense - I can rework the array to a list of
domain pointers to avoid the limit.

---
 xen/arch/x86/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 8d1f9a9..194f660 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1028,7 +1028,7 @@ int __init setup_irq(unsigned int irq, unsigned int irqflags,
  * HANDLING OF GUEST-BOUND PHYSICAL IRQS
  */
 
-#define IRQ_MAX_GUESTS 7
+#define IRQ_MAX_GUESTS 31
 typedef struct {
     u8 nr_guests;
     u8 in_flight;
-- 
2.7.4


