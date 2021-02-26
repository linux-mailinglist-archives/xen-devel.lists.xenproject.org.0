Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8B1326A42
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 23:52:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90615.171607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFlyA-00089J-Tg; Fri, 26 Feb 2021 22:52:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90615.171607; Fri, 26 Feb 2021 22:52:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFlyA-00088u-Qg; Fri, 26 Feb 2021 22:52:22 +0000
Received: by outflank-mailman (input) for mailman id 90615;
 Fri, 26 Feb 2021 22:52:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ECYH=H4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lFly9-00088p-30
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 22:52:21 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39986784-6fb7-4293-82a7-e79b8de519ac;
 Fri, 26 Feb 2021 22:52:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6817264EDC;
 Fri, 26 Feb 2021 22:52:19 +0000 (UTC)
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
X-Inumbo-ID: 39986784-6fb7-4293-82a7-e79b8de519ac
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614379939;
	bh=TP3PUri1nqJIGJ0ib6Y6jLpS6FE2eGzTgEFt783zVVs=;
	h=From:To:Cc:Subject:Date:From;
	b=noPsku21c4JKET3kCAZnaA7iJuRsJOBLu0bH5RnMQogrUvOwX1IMNXsEizNPf46tg
	 /+EmwMkHJuuKfJL2fC1IoIcDn8+w4KUJSuo2TcUL7BoRGp6EQthXpAGVT4qD0qMJ/b
	 1bg6NKZ11mroe2IQ3q5AyKmQBKJhtDdKedb5lcj0I1rJxXxTOeBP1ttYeKv9l5lEEw
	 eE9VceFTG92ZZZ8VR6Lem2kW5EimMfnWVfJTnpA7dPoMuWqePNfQqWTzPzSCa5wqhM
	 N9DheWyElw+LBrAs/rTIPGI9jlwij34T1xlMph8YqjzYVWcWKsEJ+Bh1PlpcJwjcJx
	 5wRpxCubEso2Q==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	julien@xen.org
Subject: [PATCH v2] xen: introduce XENFEAT_direct_mapped and XENFEAT_not_direct_mapped
Date: Fri, 26 Feb 2021 14:52:17 -0800
Message-Id: <20210226225217.2137-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1

Introduce two feature flags to tell the domain whether it is
direct-mapped or not. It allows the guest kernel to make informed
decisions on things such as swiotlb-xen enablement.

The introduction of both flags (XENFEAT_direct_mapped and
XENFEAT_not_direct_mapped) allows the guest kernel to avoid any
guesswork if one of the two is present, or fallback to the current
checks if neither of them is present.

XENFEAT_direct_mapped is always set for not auto-translated guests.

For auto-translated guests, only Dom0 on ARM is direct-mapped. Also,
see is_domain_direct_mapped() which refers to auto-translated guests:
xen/include/asm-arm/domain.h:is_domain_direct_mapped
xen/include/asm-x86/domain.h:is_domain_direct_mapped

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: jbeulich@suse.com
CC: andrew.cooper3@citrix.com
CC: julien@xen.org
---
Changes in v2:
- code style improvements
- better comments
- better commit message
- not auto_translated domains are direct_mapped
---
 xen/common/kernel.c           |  4 ++++
 xen/include/public/features.h | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 7a345ae45e..431447326c 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -560,6 +560,10 @@ DO(xen_version)(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
                              (1U << XENFEAT_hvm_callback_vector) |
                              (has_pirq(d) ? (1U << XENFEAT_hvm_pirqs) : 0);
 #endif
+            if ( is_domain_direct_mapped(d) || !paging_mode_translate(d) )
+                fi.submap |= (1U << XENFEAT_direct_mapped);
+            else
+                fi.submap |= (1U << XENFEAT_not_direct_mapped);
             break;
         default:
             return -EINVAL;
diff --git a/xen/include/public/features.h b/xen/include/public/features.h
index 1613b2aab8..4aebfd359a 100644
--- a/xen/include/public/features.h
+++ b/xen/include/public/features.h
@@ -114,6 +114,18 @@
  */
 #define XENFEAT_linux_rsdp_unrestricted   15
 
+/*
+ * A direct-mapped (or 1:1 mapped) domain is a domain for which its
+ * local pages have gfn == mfn. If a domain is direct-mapped,
+ * XENFEAT_direct_mapped is set; otherwise XENFEAT_not_direct_mapped
+ * is set.
+ *
+ * Not auto_translated domains are always direct-mapped. Also see
+ * XENFEAT_auto_translated_physmap.
+ */
+#define XENFEAT_not_direct_mapped         16
+#define XENFEAT_direct_mapped             17
+
 #define XENFEAT_NR_SUBMAPS 1
 
 #endif /* __XEN_PUBLIC_FEATURES_H__ */
-- 
2.17.1


