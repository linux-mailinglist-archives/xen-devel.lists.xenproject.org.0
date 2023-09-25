Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 193607AE1D4
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 00:42:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608152.946490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkuHw-0007HE-9f; Mon, 25 Sep 2023 22:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608152.946490; Mon, 25 Sep 2023 22:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkuHw-0007Co-3O; Mon, 25 Sep 2023 22:42:48 +0000
Received: by outflank-mailman (input) for mailman id 608152;
 Mon, 25 Sep 2023 22:42:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jxCo=FJ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qkuHu-0006pn-4w
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 22:42:46 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d718eeb5-5bf4-11ee-9b0d-b553b5be7939;
 Tue, 26 Sep 2023 00:42:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 0876F8286740;
 Mon, 25 Sep 2023 17:42:43 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ASdzD7Om2Tcp; Mon, 25 Sep 2023 17:42:42 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 1C18F8285AE4;
 Mon, 25 Sep 2023 17:42:42 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ZN_x8D8fyun4; Mon, 25 Sep 2023 17:42:42 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id B1488828558A;
 Mon, 25 Sep 2023 17:42:41 -0500 (CDT)
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
X-Inumbo-ID: d718eeb5-5bf4-11ee-9b0d-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 1C18F8285AE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1695681762; bh=/X3lk3Zg+rUp6Qi1mK6ROL4w3hG4Tvl8DPK6/nEq4A8=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=LiAjfJHSkGmdRU9i0Rr8iRMqpdF2rBIcoVEnWAfxTzXcHtT+E+ymFi48urRROSW/8
	 CTamfSymSr0FiOBnxmsFNKSp93LC+aBZV5e1r/JnCKhlIIJ5Jk9J4sK9jZE0/VU8pD
	 VkrZyYbcVtMlFL1uiDpBgm0BABPHdRQwJO3haU04=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 2/3] automation: Change build script to use arch defconfig
Date: Mon, 25 Sep 2023 17:42:29 -0500
Message-Id: <beb83dd70b15ee6bd896fb26532f5debf955cd48.1695681330.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1695681330.git.sanastasio@raptorengineering.com>
References: <cover.1695681330.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Change automation build script to call the make defconfig target before
setting CONFIG_DEBUG and extra options. This fixes issues on Power where
the build fails without using the ppc64_defconfig.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Reported-by: Jan Beulich <jbeulich@suse.com>
---
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


