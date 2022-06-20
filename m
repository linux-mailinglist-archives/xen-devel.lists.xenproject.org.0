Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE225510E4
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 09:03:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352424.579234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3BRU-0003DC-Cj; Mon, 20 Jun 2022 07:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352424.579234; Mon, 20 Jun 2022 07:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3BRU-00038q-73; Mon, 20 Jun 2022 07:03:24 +0000
Received: by outflank-mailman (input) for mailman id 352424;
 Mon, 20 Jun 2022 07:03:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k7+S=W3=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o3BRS-0001Yr-Mz
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 07:03:22 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 12005090-f067-11ec-bd2d-47488cf2e6aa;
 Mon, 20 Jun 2022 09:03:21 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B8311042;
 Mon, 20 Jun 2022 00:03:21 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.35.125])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB2EC3F5A1;
 Mon, 20 Jun 2022 00:03:18 -0700 (PDT)
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
X-Inumbo-ID: 12005090-f067-11ec-bd2d-47488cf2e6aa
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 5/9] include/public: Use explicitly specified types
Date: Mon, 20 Jun 2022 09:02:41 +0200
Message-Id: <20220620070245.77979-6-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620070245.77979-1-michal.orzel@arm.com>
References: <20220620070245.77979-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to MISRA C 2012 Rule 8.1, types shall be explicitly
specified. Fix all the findings reported by cppcheck with misra addon
by substituting implicit type 'unsigned' to explicit 'unsigned int'.

Bump sysctl interface version.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/include/public/physdev.h |  4 ++--
 xen/include/public/sysctl.h  | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/include/public/physdev.h b/xen/include/public/physdev.h
index d271766ad0..a2ca0ee564 100644
--- a/xen/include/public/physdev.h
+++ b/xen/include/public/physdev.h
@@ -211,8 +211,8 @@ struct physdev_manage_pci_ext {
     /* IN */
     uint8_t bus;
     uint8_t devfn;
-    unsigned is_extfn;
-    unsigned is_virtfn;
+    unsigned int is_extfn;
+    unsigned int is_virtfn;
     struct {
         uint8_t bus;
         uint8_t devfn;
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index b0a4af8789..a2a762fe46 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -35,7 +35,7 @@
 #include "domctl.h"
 #include "physdev.h"
 
-#define XEN_SYSCTL_INTERFACE_VERSION 0x00000014
+#define XEN_SYSCTL_INTERFACE_VERSION 0x00000015
 
 /*
  * Read console content from Xen buffer ring.
@@ -644,18 +644,18 @@ struct xen_sysctl_credit_schedule {
     /* Length of timeslice in milliseconds */
 #define XEN_SYSCTL_CSCHED_TSLICE_MAX 1000
 #define XEN_SYSCTL_CSCHED_TSLICE_MIN 1
-    unsigned tslice_ms;
-    unsigned ratelimit_us;
+    unsigned int tslice_ms;
+    unsigned int ratelimit_us;
     /*
      * How long we consider a vCPU to be cache-hot on the
      * CPU where it has run (max 100ms, in microseconds)
     */
 #define XEN_SYSCTL_CSCHED_MGR_DLY_MAX_US (100 * 1000)
-    unsigned vcpu_migr_delay_us;
+    unsigned int vcpu_migr_delay_us;
 };
 
 struct xen_sysctl_credit2_schedule {
-    unsigned ratelimit_us;
+    unsigned int ratelimit_us;
 };
 
 /* XEN_SYSCTL_scheduler_op */
-- 
2.25.1


