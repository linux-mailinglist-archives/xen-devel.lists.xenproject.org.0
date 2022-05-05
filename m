Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C3B51B496
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 02:17:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321178.542132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmPB5-0000II-9z; Thu, 05 May 2022 00:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321178.542132; Thu, 05 May 2022 00:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmPB4-00008o-Pu; Thu, 05 May 2022 00:17:06 +0000
Received: by outflank-mailman (input) for mailman id 321178;
 Thu, 05 May 2022 00:17:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YLaE=VN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nmPB2-0007pt-Eu
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 00:17:04 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afaa955e-cc08-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 02:17:03 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C526B61D54;
 Thu,  5 May 2022 00:17:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE3A7C385AF;
 Thu,  5 May 2022 00:17:00 +0000 (UTC)
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
X-Inumbo-ID: afaa955e-cc08-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651709821;
	bh=22bdOt6XvBV3vZtPeEaCTfB0bw/G2RA4hDJ9uoEjSFw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m4sfZKihHvArayriNCGoTIgtef6y1iMvURwOYyCteNAhVfmP39wW9p+FgVExSZF0/
	 ojrrvZPEKv34/HnQQDAUxl30cLS5gT1U120D4lXjW73osEmVkisYjQGzRRSnvBPP0+
	 15PRbfYz2gFizytWchwxCW2fCJ/x+l+iwxLV4Czu7/I1T4mYM5GpIWvQ6t3sCDN6X0
	 9RkffTyiBR5eb1p9NgcTXVR4IJg5Ca5ATeLyM9xjJ359luLgecy+qPfM76eSfqiQKk
	 DoaNyGFCO8bZOhIxN59eywz8smmRV+ClqxxmbQBCMZvd5irh/H6RWXBBH5r3Mm9EY4
	 FXMOhRpr/5mMA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jgross@suse.com,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v6 7/7] docs: document dom0less + PV drivers
Date: Wed,  4 May 2022 17:16:56 -0700
Message-Id: <20220505001656.395419-7-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Document how to use the feature and how the implementation works.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
 docs/features/dom0less.pandoc | 43 ++++++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/docs/features/dom0less.pandoc b/docs/features/dom0less.pandoc
index c9edb529e1..725afa0558 100644
--- a/docs/features/dom0less.pandoc
+++ b/docs/features/dom0less.pandoc
@@ -90,6 +90,46 @@ Otherwise, they may be unusable in Xen (for instance if they are compressed).
 
 See docs/misc/arm/device-tree/booting.txt for more information.
 
+PV Drivers
+----------
+
+It is possible to use PV drivers with dom0less guests with some
+restrictions:
+
+- dom0less domUs that want to use PV drivers support should have the
+  "xen,enhanced" property set under their device tree nodes (see
+  docs/misc/arm/device-tree/booting.txt)
+- a dom0 must be present (or another domain with enough privileges to
+  run the toolstack)
+- after dom0 is booted, the utility "init-dom0less" must be run
+- do not run "init-dom0less" while creating other guests with xl
+
+After the execution of init-dom0less, it is possible to use "xl" to
+hotplug PV drivers to dom0less guests. E.g. xl network-attach domU.
+
+The implementation works as follows:
+- Xen allocates the xenstore event channel for each dom0less domU that
+  has the "xen,enhanced" property, and sets HVM_PARAM_STORE_EVTCHN
+- Xen does *not* allocate the xenstore page and sets HVM_PARAM_STORE_PFN
+  to ~0ULL (invalid)
+- Dom0less domU kernels check that HVM_PARAM_STORE_PFN is set to invalid
+    - Old kernels will continue without xenstore support (Note: some old
+      buggy kernels might crash because they don't check the validity of
+      HVM_PARAM_STORE_PFN before using it! Disable "xen,enhanced" in
+      those cases)
+    - New kernels will wait for a notification on the xenstore event
+      channel (HVM_PARAM_STORE_EVTCHN) before continuing with the
+      initialization
+- Once dom0 is booted, init-dom0less is executed:
+    - it allocates the xenstore shared page and sets HVM_PARAM_STORE_PFN
+    - it calls xs_introduce_domain
+- Xenstored notices the new domain, initializes interfaces as usual, and
+  sends an event channel notification to the domain using the xenstore
+  event channel (HVM_PARAM_STORE_EVTCHN)
+- The Linux domU kernel receives the event channel notification, checks
+  HVM_PARAM_STORE_PFN again and continue with the initialization
+
+
 Limitations
 -----------
 
@@ -107,9 +147,6 @@ limitations:
   information, the GIC version exposed to the domains started by Xen at
   boot is the same as the native GIC version.
 
-- No PV drivers. There is no support for PV devices at the moment. All
-  devices need to be statically assigned to guests.
-
 - Pinning vCPUs of domains started by Xen at boot can be
   done from the control domain, using `xl vcpu-pin` as usual. It is not
   currently possible to configure vCPU pinning without a control domain.
-- 
2.25.1


