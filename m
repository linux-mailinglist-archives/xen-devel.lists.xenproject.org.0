Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF287AF660
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 00:39:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608551.947109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlGha-0005x0-JC; Tue, 26 Sep 2023 22:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608551.947109; Tue, 26 Sep 2023 22:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlGha-0005uS-GK; Tue, 26 Sep 2023 22:38:46 +0000
Received: by outflank-mailman (input) for mailman id 608551;
 Tue, 26 Sep 2023 22:38:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IkXO=FK=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qlGhZ-0005uH-58
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 22:38:45 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71e05ee3-5cbd-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 00:38:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 07A998285AAD;
 Tue, 26 Sep 2023 17:38:32 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 4b0SZ9vwVaO2; Tue, 26 Sep 2023 17:38:31 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 6C3FB8285690;
 Tue, 26 Sep 2023 17:38:31 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id iZDDmjElaz6e; Tue, 26 Sep 2023 17:38:31 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id E650282854B0;
 Tue, 26 Sep 2023 17:38:30 -0500 (CDT)
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
X-Inumbo-ID: 71e05ee3-5cbd-11ee-9b0d-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 6C3FB8285690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1695767911; bh=34z+XO3iFnnbea1oH9CHpJPde99KYi0yOabtl66Tq90=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=syvMnWBUdMYXOT8hXBKcjoRoBsaHqzI0c9ym6YWtwUprP38/x5EvjuSfqMMDKu4yp
	 FHPeSIRS3nCOTy4QXoWJIotFIQbqEeUrXUs44KmFDArrMbmeQRD+pMWhc8Oq8Ljrq5
	 nl7tR4R/Ov2NRQYgNy1rAt8MPKfcyEtaxdzVLS24=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 1/2] automation: Change build script to use arch defconfig
Date: Tue, 26 Sep 2023 17:37:38 -0500
Message-Id: <5baa15904c5bb5f8d668c67519ad08293c32982d.1695767747.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1695767747.git.sanastasio@raptorengineering.com>
References: <cover.1695767747.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Change automation build script to call the make defconfig target before
setting CONFIG_DEBUG and extra options. This fixes issues on Power where
the build fails without using the ppc64_defconfig.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
v3: Drop unnecessary sed.

v2: No changes.

 automation/scripts/build | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index b4edcf010e..b3c71fb6fb 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -22,7 +22,10 @@ if [[ "${RANDCONFIG}" == "y" ]]; then
     # RANDCONFIG implies HYPERVISOR_ONLY
     HYPERVISOR_ONLY="y"
 else
-    echo "CONFIG_DEBUG=${debug}" > xen/.config
+    # Start off with arch's defconfig
+    make -C xen defconfig
+
+    echo "CONFIG_DEBUG=${debug}" >> xen/.config

     if [[ -n "${EXTRA_XEN_CONFIG}" ]]; then
         echo "${EXTRA_XEN_CONFIG}" >> xen/.config
--
2.30.2


