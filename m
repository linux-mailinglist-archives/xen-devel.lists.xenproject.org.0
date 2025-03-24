Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9060EA6E0E6
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 18:33:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925938.1328805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twlg4-0008Px-6b; Mon, 24 Mar 2025 17:33:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925938.1328805; Mon, 24 Mar 2025 17:33:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twlg4-0008My-3W; Mon, 24 Mar 2025 17:33:32 +0000
Received: by outflank-mailman (input) for mailman id 925938;
 Mon, 24 Mar 2025 17:33:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=22ml=WL=kernel.org=arnd@srs-se1.protection.inumbo.net>)
 id 1twlg2-0008Ms-2N
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 17:33:30 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18df5b82-08d6-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 18:33:28 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 93DA6A4A3EC;
 Mon, 24 Mar 2025 17:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 185CDC4CEEA;
 Mon, 24 Mar 2025 17:33:24 +0000 (UTC)
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
X-Inumbo-ID: 18df5b82-08d6-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742837607;
	bh=DUICbtNd4moyLWNgcOAKqia2Yzzt9DHdF5xhFC0LsPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fW3Iej4GOZny+kGNyDUKrnsytFeZlGXSkWOoFCLUWGBEBBYedcakA+1VkzaVMWvdj
	 tQXfPtQZR5+NuB/stBouAEosQl5CBnacmcw1hYSwrgOlI0VEzmNoDmEaY9Y3e7Sny9
	 joXGBP3EoaW2tTXSs6lce0wbutlfq5HbPeqe4tsXQqca3byZJlax0PxbKeFFhQttLB
	 efrpQHyZnQBSjQbkZkPFjXonjWApDxlpyaBQNDBdmkdPNlXJa0bExaCKGclhj1bS+P
	 xe2/Klv18WY/jHrxvQFzu41gAb39dYcU9AXqiQuoDx1wBBKOPcYocuDHe7Y2Rdx49n
	 pBoIH78vfgYtw==
From: Arnd Bergmann <arnd@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-next@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] xenbus: add module description
Date: Mon, 24 Mar 2025 18:32:30 +0100
Message-Id: <20250324173242.1501003-5-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250324173242.1501003-1-arnd@kernel.org>
References: <20250324173242.1501003-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Modules without a description now cause a warning:

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/xen/xenbus/xenbus_probe_frontend.o

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/xen/xenbus/xenbus_probe_frontend.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/xen/xenbus/xenbus_probe_frontend.c b/drivers/xen/xenbus/xenbus_probe_frontend.c
index fcb335bb7b18..8b75f8234baf 100644
--- a/drivers/xen/xenbus/xenbus_probe_frontend.c
+++ b/drivers/xen/xenbus/xenbus_probe_frontend.c
@@ -513,4 +513,5 @@ static int __init boot_wait_for_devices(void)
 late_initcall(boot_wait_for_devices);
 #endif
 
+MODULE_DESCRIPTION("Frontend for Xen bus probe");
 MODULE_LICENSE("GPL");
-- 
2.39.5


