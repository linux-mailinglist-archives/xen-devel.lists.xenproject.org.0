Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E57090F4D9
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 19:09:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743953.1150976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJyoR-0005RH-Rh; Wed, 19 Jun 2024 17:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743953.1150976; Wed, 19 Jun 2024 17:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJyoR-0005O7-Ny; Wed, 19 Jun 2024 17:09:35 +0000
Received: by outflank-mailman (input) for mailman id 743953;
 Wed, 19 Jun 2024 17:09:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vpHL=NV=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sJyoQ-0004ov-Ce
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 17:09:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b28c2bee-2e5e-11ef-b4bb-af5377834399;
 Wed, 19 Jun 2024 19:09:33 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-87-17-171-46.retail.telecomitalia.it [87.17.171.46])
 by support.bugseng.com (Postfix) with ESMTPSA id 8A0484EE073D;
 Wed, 19 Jun 2024 19:09:32 +0200 (CEST)
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
X-Inumbo-ID: b28c2bee-2e5e-11ef-b4bb-af5377834399
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/2] x86/APIC: address violation of MISRA C Rule 21.2
Date: Wed, 19 Jun 2024 19:09:10 +0200
Message-Id: <4a31cfc5e8d4e2c5e159ca4d67ac477feb000073.1718816397.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718816397.git.alessandro.zucchelli@bugseng.com>
References: <cover.1718816397.git.alessandro.zucchelli@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

The rule disallows the usage of an identifier reserved by the C standard.
All identfiers starting with '__' are reserved for any use, so the label
can be renamed in order to avoid the violation.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/apic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index 6567af685a..2a60e6fe26 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -925,7 +925,7 @@ void __init init_apic_mappings(void)
     unsigned long apic_phys;
 
     if ( x2apic_enabled )
-        goto __next;
+        goto next;
     /*
      * If no local APIC can be found then set up a fake all
      * zeroes page to simulate the local APIC and another
@@ -941,7 +941,7 @@ void __init init_apic_mappings(void)
     apic_printk(APIC_VERBOSE, "mapped APIC to %08Lx (%08lx)\n", APIC_BASE,
                 apic_phys);
 
-__next:
+next:
     /*
      * Fetch the APIC ID of the BSP in case we have a
      * default configuration (or the MP table is broken).
-- 
2.34.1


