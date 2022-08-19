Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1BD599965
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 12:04:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390207.627512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOyrd-0001eJ-8j; Fri, 19 Aug 2022 10:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390207.627512; Fri, 19 Aug 2022 10:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOyrd-0001ba-4i; Fri, 19 Aug 2022 10:04:29 +0000
Received: by outflank-mailman (input) for mailman id 390207;
 Fri, 19 Aug 2022 10:04:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sWlb=YX=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oOyrc-0008OP-6g
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 10:04:28 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 4f3744ff-1fa6-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 12:04:27 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 945771042;
 Fri, 19 Aug 2022 03:04:28 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F67C3F70D;
 Fri, 19 Aug 2022 03:04:25 -0700 (PDT)
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
X-Inumbo-ID: 4f3744ff-1fa6-11ed-bd2e-47488cf2e6aa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 3/7] xen/evtchn: restrict the maximum number of evtchn supported for domUs
Date: Fri, 19 Aug 2022 11:02:40 +0100
Message-Id: <1a8c49dcc237187cbb9fccaafe1e6533fe68381c.1660902588.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660902588.git.rahul.singh@arm.com>
References: <cover.1660902588.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Static event channel support will be added for dom0less domains.
Restrict the maximum number of evtchn supported for domUs to avoid
allocating a large amount of memory in Xen.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Changes in v2:
 - new patch in the version
---
---
 xen/arch/arm/domain_build.c | 2 +-
 xen/include/xen/sched.h     | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 3fd1186b53..6d447367be 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3277,7 +3277,7 @@ void __init create_domUs(void)
         struct xen_domctl_createdomain d_cfg = {
             .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
             .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
-            .max_evtchn_port = -1,
+            .max_evtchn_port = MAX_EVTCHNS_PORT,
             .max_grant_frames = -1,
             .max_maptrack_frames = -1,
             .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index e2b3b6daa3..e5cc4f3e3e 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -76,6 +76,9 @@ extern domid_t hardware_domid;
 /* Maximum number of event channels for any ABI. */
 #define MAX_NR_EVTCHNS MAX(EVTCHN_2L_NR_CHANNELS, EVTCHN_FIFO_NR_CHANNELS)
 
+/* Maximum number of event channels supported for domUs. */
+#define MAX_EVTCHNS_PORT 4096
+
 #define EVTCHNS_PER_BUCKET (PAGE_SIZE / next_power_of_2(sizeof(struct evtchn)))
 #define EVTCHNS_PER_GROUP  (BUCKETS_PER_GROUP * EVTCHNS_PER_BUCKET)
 #define NR_EVTCHN_GROUPS   DIV_ROUND_UP(MAX_NR_EVTCHNS, EVTCHNS_PER_GROUP)
-- 
2.25.1


