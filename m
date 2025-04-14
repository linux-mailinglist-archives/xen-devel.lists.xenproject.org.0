Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1B0A88226
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 15:31:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950227.1346617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Jtu-0001Pj-RK; Mon, 14 Apr 2025 13:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950227.1346617; Mon, 14 Apr 2025 13:31:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Jtu-0001N9-Ni; Mon, 14 Apr 2025 13:31:02 +0000
Received: by outflank-mailman (input) for mailman id 950227;
 Mon, 14 Apr 2025 13:31:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SLdQ=XA=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1u4Jtt-0008RR-D7
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 13:31:01 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3745fe5-1934-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 15:30:59 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 94D7E43A34;
 Mon, 14 Apr 2025 13:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42287C4CEE2;
 Mon, 14 Apr 2025 13:30:57 +0000 (UTC)
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
X-Inumbo-ID: b3745fe5-1934-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744637458;
	bh=v7Iw0f8SmGD/dvTFvJTtjO3m7ciPzRNBNSs1CGo4oYE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZvSMlhijMlmxL6OvRLiCsZCIUY2r9D/sAJZv9YyDriIofRMV8fyZ7bZrUfrMQq1pZ
	 13gG89uk9W6q3x/nJISM7nmcnau/trV0nnchspMh/P68CpRQnzfXOxtIjFL3kWyCLS
	 Wu+boTkb01wDhd9mt9ZeTeEvvMwidQF0wJORS+o+gvL5tPCpTBDJDiBZgK6eU3IBRq
	 DhDhgKIgL1Uh5LsMsBltrnNjlx0PT2NlsbcfjXKcSMn3oPdRFYZWuT9OZGwAf3YGoy
	 L56vq9vpqcyVvR7YwJhbmL3qMMbCT04Ns3D54oH4t57Ro5IGLCA1INXXD3xP2D/Mpa
	 uMKhS/83HLsgA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 6.1 04/17] xen: Change xen-acpi-processor dom0 dependency
Date: Mon, 14 Apr 2025 09:30:35 -0400
Message-Id: <20250414133048.680608-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414133048.680608-1-sashal@kernel.org>
References: <20250414133048.680608-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.134
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
index d5d7c402b6511..ab135c3e43410 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -271,7 +271,7 @@ config XEN_PRIVCMD
 
 config XEN_ACPI_PROCESSOR
 	tristate "Xen ACPI processor"
-	depends on XEN && XEN_PV_DOM0 && X86 && ACPI_PROCESSOR && CPU_FREQ
+	depends on XEN && XEN_DOM0 && X86 && ACPI_PROCESSOR && CPU_FREQ
 	default m
 	help
 	  This ACPI processor uploads Power Management information to the Xen
-- 
2.39.5


