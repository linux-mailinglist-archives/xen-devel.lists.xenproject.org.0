Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FBF55B9CF
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 15:16:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356607.584900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5obJ-0006wk-FM; Mon, 27 Jun 2022 13:16:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356607.584900; Mon, 27 Jun 2022 13:16:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5obJ-0006t2-64; Mon, 27 Jun 2022 13:16:25 +0000
Received: by outflank-mailman (input) for mailman id 356607;
 Mon, 27 Jun 2022 13:16:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXPS=XC=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o5obI-0005HM-3q
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 13:16:24 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 54c4fbbd-f61b-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 15:16:19 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 000331758;
 Mon, 27 Jun 2022 06:16:22 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.42.186])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08E843F5A1;
 Mon, 27 Jun 2022 06:16:19 -0700 (PDT)
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
X-Inumbo-ID: 54c4fbbd-f61b-11ec-b725-ed86ccbb4733
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 5/7] include/public: Use uint32_t instead of unsigned (int)
Date: Mon, 27 Jun 2022 15:15:41 +0200
Message-Id: <20220627131543.410971-6-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627131543.410971-1-michal.orzel@arm.com>
References: <20220627131543.410971-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Public interfaces shall make use of types that indicate size and
signedness. Take the opportunity to also modify places where explicit
unsigned int is used.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/include/public/physdev.h |  4 ++--
 xen/include/public/sysctl.h  | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/include/public/physdev.h b/xen/include/public/physdev.h
index d271766ad0..f8d1905e30 100644
--- a/xen/include/public/physdev.h
+++ b/xen/include/public/physdev.h
@@ -211,8 +211,8 @@ struct physdev_manage_pci_ext {
     /* IN */
     uint8_t bus;
     uint8_t devfn;
-    unsigned is_extfn;
-    unsigned is_virtfn;
+    uint32_t is_extfn;
+    uint32_t is_virtfn;
     struct {
         uint8_t bus;
         uint8_t devfn;
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index b0a4af8789..60c8711483 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -624,7 +624,7 @@ struct xen_sysctl_arinc653_schedule {
         /* If a domain has multiple VCPUs, vcpu_id specifies which one
          * this schedule entry applies to. It should be set to 0 if
          * there is only one VCPU for the domain. */
-        unsigned int vcpu_id;
+        uint32_t vcpu_id;
         /* runtime specifies the amount of time that should be allocated
          * to this VCPU per major frame. It is specified in nanoseconds */
         uint64_aligned_t runtime;
@@ -644,18 +644,18 @@ struct xen_sysctl_credit_schedule {
     /* Length of timeslice in milliseconds */
 #define XEN_SYSCTL_CSCHED_TSLICE_MAX 1000
 #define XEN_SYSCTL_CSCHED_TSLICE_MIN 1
-    unsigned tslice_ms;
-    unsigned ratelimit_us;
+    uint32_t tslice_ms;
+    uint32_t ratelimit_us;
     /*
      * How long we consider a vCPU to be cache-hot on the
      * CPU where it has run (max 100ms, in microseconds)
     */
 #define XEN_SYSCTL_CSCHED_MGR_DLY_MAX_US (100 * 1000)
-    unsigned vcpu_migr_delay_us;
+    uint32_t vcpu_migr_delay_us;
 };
 
 struct xen_sysctl_credit2_schedule {
-    unsigned ratelimit_us;
+    uint32_t ratelimit_us;
 };
 
 /* XEN_SYSCTL_scheduler_op */
-- 
2.25.1


