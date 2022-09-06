Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AF85AEA03
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 15:42:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399877.641263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVYpz-0005gk-Lo; Tue, 06 Sep 2022 13:41:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399877.641263; Tue, 06 Sep 2022 13:41:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVYpz-0005e0-IW; Tue, 06 Sep 2022 13:41:59 +0000
Received: by outflank-mailman (input) for mailman id 399877;
 Tue, 06 Sep 2022 13:41:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lcW6=ZJ=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oVYpy-0005BE-KA
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 13:41:58 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ad33ea26-2de9-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 15:41:57 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 505E51A2D;
 Tue,  6 Sep 2022 06:42:03 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 114ED3F7B4;
 Tue,  6 Sep 2022 06:41:55 -0700 (PDT)
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
X-Inumbo-ID: ad33ea26-2de9-11ed-a016-b9edf5238543
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v4 3/7] xen/evtchn: restrict the maximum number of evtchn supported for domUs
Date: Tue,  6 Sep 2022 14:40:41 +0100
Message-Id: <a631af9b5499eb3fab76cae372d623021431347c.1662462034.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662462034.git.rahul.singh@arm.com>
References: <cover.1662462034.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Restrict the maximum number of evtchn supported for domUs to avoid
allocating a large amount of memory in Xen.

Set the default value of max_evtchn_port to 1023. The value of 1023
should be sufficient for domUs guests because on ARM we don't bind
physical interrupts to event channels. The only use of the evtchn port
is inter-domain communications. Another reason why we choose the value
of 1023 to follow the default behavior of libxl.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v4:
 - fix minor comments in commit msg
 - Added Michal Reviewed-by
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


