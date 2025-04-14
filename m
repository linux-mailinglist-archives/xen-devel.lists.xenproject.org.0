Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E9FA88217
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 15:30:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950215.1346598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4JtB-0008UL-CD; Mon, 14 Apr 2025 13:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950215.1346598; Mon, 14 Apr 2025 13:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4JtB-0008RZ-9Q; Mon, 14 Apr 2025 13:30:17 +0000
Received: by outflank-mailman (input) for mailman id 950215;
 Mon, 14 Apr 2025 13:30:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SLdQ=XA=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1u4Jt9-0008RR-Mz
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 13:30:15 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9828928e-1934-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 15:30:13 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B78EA614BD;
 Mon, 14 Apr 2025 13:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59F4C4CEE9;
 Mon, 14 Apr 2025 13:30:10 +0000 (UTC)
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
X-Inumbo-ID: 9828928e-1934-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744637412;
	bh=MM1HcIrsCsuD7/pRkw4M1fx7Lt6v9Lafl9o4yzNx0YI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fvj7LxQ38qE0XlL1bfG5zv3oXhfBN2WgnmuHK1zA16vIntFoOYiz5sJvhMxUhdjmK
	 8lUfMmhvMfc0wbqdTd7kW/GvTaADRU7dUo9pTzTgLFf4Na4kxxMUgVoJ2k7gl2fNyv
	 JheqPQ92waJAnf4lLGx+mfXpJBmjlk4h/oVZktnEDWMIosiQJzH2y8mep7SF3Gq3A0
	 SQ7K3CwdHYGiOcYlZ8jICd1kwplPV8k4F7IpjEi7nMjUhOrt7chDId4Sh0iHTgnmmM
	 +pqmDl5iMK6r5bx3Yjdt3E6O5MKmOUgMzlFO74sahrvZ+ISC8hZCuWNCFUX0+2v81W
	 h43iRY/k1z8Sg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 6.6 06/24] xen: Change xen-acpi-processor dom0 dependency
Date: Mon, 14 Apr 2025 09:29:39 -0400
Message-Id: <20250414132957.680250-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414132957.680250-1-sashal@kernel.org>
References: <20250414132957.680250-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.87
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
index d43153fec18ea..af5c214b22069 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -278,7 +278,7 @@ config XEN_PRIVCMD_IRQFD
 
 config XEN_ACPI_PROCESSOR
 	tristate "Xen ACPI processor"
-	depends on XEN && XEN_PV_DOM0 && X86 && ACPI_PROCESSOR && CPU_FREQ
+	depends on XEN && XEN_DOM0 && X86 && ACPI_PROCESSOR && CPU_FREQ
 	default m
 	help
 	  This ACPI processor uploads Power Management information to the Xen
-- 
2.39.5


