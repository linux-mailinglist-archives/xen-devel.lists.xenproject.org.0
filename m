Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21976A88237
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 15:31:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950245.1346639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4JuV-0003NS-9z; Mon, 14 Apr 2025 13:31:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950245.1346639; Mon, 14 Apr 2025 13:31:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4JuV-0003KG-6X; Mon, 14 Apr 2025 13:31:39 +0000
Received: by outflank-mailman (input) for mailman id 950245;
 Mon, 14 Apr 2025 13:31:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SLdQ=XA=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1u4JuT-0001jv-QQ
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 13:31:37 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9c3f3b7-1934-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 15:31:37 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 09DA143961;
 Mon, 14 Apr 2025 13:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D8FC4CEE2;
 Mon, 14 Apr 2025 13:31:34 +0000 (UTC)
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
X-Inumbo-ID: c9c3f3b7-1934-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744637495;
	bh=egGOFBMP/rOXw5Cxs3Jz8pNNyapuAC8uiWGLwRvlxuM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nyU8GyhTxBLNkDxjdbShnLzkoPzWJk77s+8Ki8zeiSGTnd2Q/OWLHrGoAx/Osrk5j
	 XpefLpsy4xZ4H47WZGoNdiewl/ZfZD/vloottH0eLm4CUGCD7jk/wySzVQ7MoPp6U7
	 qlNDAJFNIg+VqC67AIeJjt7qJDtJWg/Bqe44op2Oak4OzoVFPn+WIvHJowaD/w7EWy
	 FnfMN1mVI5j5C0roMBYa3W0uxlB1MEX8+RVqAXV69XFh+cpbvOnIJyX2qElOyxoqCA
	 C946ha060Yv8mKUFm/zfqUbHuDAeSwgbRgddztwR0t1LhvDhjiNSJupKu9PwGRsa7p
	 MJ9QP58Aqz7pw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 5.15 04/15] xen: Change xen-acpi-processor dom0 dependency
Date: Mon, 14 Apr 2025 09:31:14 -0400
Message-Id: <20250414133126.680846-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414133126.680846-1-sashal@kernel.org>
References: <20250414133126.680846-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.180
Content-Transfer-Encoding: 8bit

From: Jason Andryuk <jason.andryuk@amd.com>

[ Upstream commit 0f2946bb172632e122d4033e0b03f85230a29510 ]

xen-acpi-processor functions under a PVH dom0 with only a
xen_initial_domain() runtime check.  Change the Kconfig dependency from
PV dom0 to generic dom0 to reflect that.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
Tested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
Message-ID: <20250331172913.51240-1-jason.andryuk@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/xen/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index 1b2c3aca6887c..474b0173323a6 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -241,7 +241,7 @@ config XEN_PRIVCMD
 
 config XEN_ACPI_PROCESSOR
 	tristate "Xen ACPI processor"
-	depends on XEN && XEN_PV_DOM0 && X86 && ACPI_PROCESSOR && CPU_FREQ
+	depends on XEN && XEN_DOM0 && X86 && ACPI_PROCESSOR && CPU_FREQ
 	default m
 	help
 	  This ACPI processor uploads Power Management information to the Xen
-- 
2.39.5


