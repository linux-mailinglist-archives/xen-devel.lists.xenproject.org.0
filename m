Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C78B63399F1
	for <lists+xen-devel@lfdr.de>; Sat, 13 Mar 2021 00:17:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97373.184971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKr1J-0005T2-E2; Fri, 12 Mar 2021 23:16:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97373.184971; Fri, 12 Mar 2021 23:16:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKr1J-0005Sd-Aj; Fri, 12 Mar 2021 23:16:37 +0000
Received: by outflank-mailman (input) for mailman id 97373;
 Fri, 12 Mar 2021 23:16:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oc3E=IK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lKr1H-0005SY-J8
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 23:16:35 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f70687f7-4f32-4561-ae7e-c52a91103163;
 Fri, 12 Mar 2021 23:16:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9901A64F86;
 Fri, 12 Mar 2021 23:16:33 +0000 (UTC)
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
X-Inumbo-ID: f70687f7-4f32-4561-ae7e-c52a91103163
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615590993;
	bh=2Ud3Qj5FwQDV8Jl/uhEGUftQWNZdzTuPESSr+hKjGYI=;
	h=From:To:Cc:Subject:Date:From;
	b=QwD0MpvCpMLvE+5s33MuW+bGLiuMc0/hr3ZsQn1uqtcjsUQ6oYpdKfWN1qPxCm7bv
	 BuPhXuN3ifD7A95nBw0F4FhePBQk36nD0Ia4Ea5dqfX4nPFtCJoJnxaEErJ06U2+M6
	 kZzoCfK9Xg2M8Gaz6QBQub+yb6Qs5N7F82KQy8BPmXRbRk3v3ZNxprM1W5/skNRT7p
	 WCIf0axZ4x7GbVYDLTijjvWbhsYgTNhoDZIgwcoTRZ8qQq6ITc/uIDusYyYCK9RELk
	 dIdXqkUncwyE07E8GioAhh+dmion+BXF8u2Fjkaf3m/O+IYMfOsN1z7QKMucGe27ME
	 03DW5/3TwB0nA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	julien@xen.org,
	Bertrand.Marquis@arm.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v3] xen: introduce XENFEAT_direct_mapped and XENFEAT_not_direct_mapped
Date: Fri, 12 Mar 2021 15:16:32 -0800
Message-Id: <20210312231632.5666-1-sstabellini@kernel.org>
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
Changes in v3:
- swap 2 conditions of ||
- improve in-code comment to cover existing assumptions

Changes in v2:
- code style improvements
- better comments
- better commit message
- not auto_translated domains are direct_mapped
---
 xen/common/kernel.c           |  4 ++++
 xen/include/public/features.h | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 7a345ae45e..d77756a81e 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -560,6 +560,10 @@ DO(xen_version)(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
                              (1U << XENFEAT_hvm_callback_vector) |
                              (has_pirq(d) ? (1U << XENFEAT_hvm_pirqs) : 0);
 #endif
+            if ( !paging_mode_translate(d) || is_domain_direct_mapped(d) )
+                fi.submap |= (1U << XENFEAT_direct_mapped);
+            else
+                fi.submap |= (1U << XENFEAT_not_direct_mapped);
             break;
         default:
             return -EINVAL;
diff --git a/xen/include/public/features.h b/xen/include/public/features.h
index 1613b2aab8..9ee2f760ef 100644
--- a/xen/include/public/features.h
+++ b/xen/include/public/features.h
@@ -114,6 +114,20 @@
  */
 #define XENFEAT_linux_rsdp_unrestricted   15
 
+/*
+ * A direct-mapped (or 1:1 mapped) domain is a domain for which its
+ * local pages have gfn == mfn. If a domain is direct-mapped,
+ * XENFEAT_direct_mapped is set; otherwise XENFEAT_not_direct_mapped
+ * is set.
+ *
+ * If neither flag is set (e.g. older Xen releases) the assumptions are:
+ * - not auto_translated domains (x86 only) are always direct-mapped
+ * - on x86, auto_translated domains are not direct-mapped
+ * - on ARM, Dom0 is direct-mapped, DomUs are not
+ */
+#define XENFEAT_not_direct_mapped         16
+#define XENFEAT_direct_mapped             17
+
 #define XENFEAT_NR_SUBMAPS 1
 
 #endif /* __XEN_PUBLIC_FEATURES_H__ */
-- 
2.17.1


