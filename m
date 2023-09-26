Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED04E7AF35F
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 20:55:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608494.946993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlDDA-0008Qo-Hw; Tue, 26 Sep 2023 18:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608494.946993; Tue, 26 Sep 2023 18:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlDDA-0008Op-Ew; Tue, 26 Sep 2023 18:55:08 +0000
Received: by outflank-mailman (input) for mailman id 608494;
 Tue, 26 Sep 2023 18:55:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IkXO=FK=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qlDD9-0008Od-Lf
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 18:55:07 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34d36939-5c9e-11ee-878a-cb3800f73035;
 Tue, 26 Sep 2023 20:55:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 572B98285A03;
 Tue, 26 Sep 2023 13:55:05 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 0Vdzoy3fyqT9; Tue, 26 Sep 2023 13:55:04 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4F7B382856E3;
 Tue, 26 Sep 2023 13:55:04 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id XGAs3b0EJ_7K; Tue, 26 Sep 2023 13:55:04 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id AC3A5828587F;
 Tue, 26 Sep 2023 13:55:03 -0500 (CDT)
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
X-Inumbo-ID: 34d36939-5c9e-11ee-878a-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 4F7B382856E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1695754504; bh=D5SRtpO3rGrT6QwItgwTk0eDHOrAHeVxgzl8M/+A/YY=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=cHSKB4ZFFRCz7xvKWd1n379a3wYWZF/HxmiO7364mcadS6cQVCwoP7yCQzxmlzSuP
	 PVs6OAkPTd4G6M2Lzmlcm8e2IQO/nWHHjlJnq2vlyE5gJo3kAJXlTybvUTtGnEWXxS
	 sHbUrhOdf2b/gstRRPtG8iY/9rH3ixNdfA0RtObM=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 1/2] automation: Change build script to use arch defconfig
Date: Tue, 26 Sep 2023 13:54:55 -0500
Message-Id: <a949070e4730f55ac214e22a3dea92a5cc6ec7fa.1695754185.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1695754185.git.sanastasio@raptorengineering.com>
References: <cover.1695754185.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Change automation build script to call the make defconfig target before
setting CONFIG_DEBUG and extra options. This fixes issues on Power where
the build fails without using the ppc64_defconfig.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
v2: No changes.

 automation/scripts/build | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index b4edcf010e..19dd9e8270 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -22,7 +22,12 @@ if [[ "${RANDCONFIG}" == "y" ]]; then
     # RANDCONFIG implies HYPERVISOR_ONLY
     HYPERVISOR_ONLY="y"
 else
-    echo "CONFIG_DEBUG=${debug}" > xen/.config
+    # Start off with arch's defconfig
+    make -C xen defconfig
+
+    # Drop existing CONFIG_DEBUG and replace with value of ${debug}
+    sed -i 's/^CONFIG_DEBUG=[yn]//g' xen/.config
+    echo "CONFIG_DEBUG=${debug}" >> xen/.config

     if [[ -n "${EXTRA_XEN_CONFIG}" ]]; then
         echo "${EXTRA_XEN_CONFIG}" >> xen/.config
--
2.30.2


