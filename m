Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 965B65A92D4
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 11:14:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396374.636507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTgHL-0006b1-Cl; Thu, 01 Sep 2022 09:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396374.636507; Thu, 01 Sep 2022 09:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTgHL-0006YQ-9h; Thu, 01 Sep 2022 09:14:27 +0000
Received: by outflank-mailman (input) for mailman id 396374;
 Thu, 01 Sep 2022 09:14:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GjJJ=ZE=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oTgHJ-000527-UK
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 09:14:25 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 789bd957-29d6-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 11:14:24 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8EE1D6E;
 Thu,  1 Sep 2022 02:14:30 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C9DF3F766;
 Thu,  1 Sep 2022 02:14:23 -0700 (PDT)
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
X-Inumbo-ID: 789bd957-29d6-11ed-82f2-63bd783d45fa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 3/7] xen/evtchn: restrict the maximum number of evtchn supported for domUs
Date: Thu,  1 Sep 2022 10:13:02 +0100
Message-Id: <4ae16201df27aee274a3d740128812b118c252b3.1662023183.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662023183.git.rahul.singh@arm.com>
References: <cover.1662023183.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Restrict the maximum number of evtchn supported for domUs to avoid
allocating a large amount of memory in Xen.

Set the default value of max_evtchn_port to 1023. The value of 1023
should be sufficient for domUs guests because on ARM we don't bind
physical interrupts to event channels. The only use of the evtchn port
is inter-domain communications.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Changes in v3:
 - added in commit msg why we set the max_evtchn_port value to 1023.
 - added the comment in code also why we set the max_evtchn_port to 1023
 - remove the define and set the value to 1023 in code directly.
Changes in v2:
 - new patch in the version
---
 xen/arch/arm/domain_build.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 3fd1186b53..fde133cd94 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3277,7 +3277,13 @@ void __init create_domUs(void)
         struct xen_domctl_createdomain d_cfg = {
             .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
             .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
-            .max_evtchn_port = -1,
+            /*
+             * The default of 1023 should be sufficient for domUs guests
+             * because on ARM we don't bind physical interrupts to event
+             * channels. The only use of the evtchn port is inter-domain
+             * communications.
+             */
+            .max_evtchn_port = 1023,
             .max_grant_frames = -1,
             .max_maptrack_frames = -1,
             .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
-- 
2.25.1


