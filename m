Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 309FE66C0B1
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 15:03:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478633.741925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQ4r-0006r2-Am; Mon, 16 Jan 2023 14:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478633.741925; Mon, 16 Jan 2023 14:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQ4r-0006p2-7u; Mon, 16 Jan 2023 14:03:09 +0000
Received: by outflank-mailman (input) for mailman id 478633;
 Mon, 16 Jan 2023 14:03:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J8FY=5N=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1pHQ4p-0006ow-Gy
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 14:03:07 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e561b34-95a6-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 15:03:04 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 83E69CE1161;
 Mon, 16 Jan 2023 14:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1EB4C433F1;
 Mon, 16 Jan 2023 14:02:59 +0000 (UTC)
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
X-Inumbo-ID: 7e561b34-95a6-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673877780;
	bh=+faF3hepArrc352Tbtu73yFkegQ3khnMr0J0WFP+EaY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C2HdpjHb1Uf5MFTNrmx/9tF1YIVDaOvQ91gbIByaC5kmbdsUJGBCTwMhouKrc9I5c
	 X4d7bHvF5oe5GJlULmypIIrh0R7DEeiVtr5Q/NFUalFZi3KeOjyrROuBTkwQ9wPs+k
	 KYUrN5/D1k1iqmhc4P6CEEAJqw/dmFDo1v3RtIzNOH90Si1sjIzn717WwOuA8IiHq+
	 3hqs2BOTgoiI0EGcsaVK2NfS0sltXIUzyp24ueEHNyYPAgXu7gH3vN/6KgLdUtZqwa
	 QvGTd78aBPrj//HPAf/l/4UC42Y5AtExsmZ3eRK6Wg9CwqTUcVH2JYbqCXu6REXSqF
	 /qZNKzumScBNQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 6.1 21/53] xen/pvcalls: free active map buffer on pvcalls_front_free_map
Date: Mon, 16 Jan 2023 09:01:21 -0500
Message-Id: <20230116140154.114951-21-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230116140154.114951-1-sashal@kernel.org>
References: <20230116140154.114951-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>

[ Upstream commit f57034cedeb6e00256313a2a6ee67f974d709b0b ]

Data buffer for active map is allocated in alloc_active_ring and freed
in free_active_ring function, which is used only for the error
cleanup. pvcalls_front_release is calling pvcalls_front_free_map which
ends foreign access for this buffer, but doesn't free allocated pages.
Call free_active_ring to clean all allocated resources.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Link: https://lore.kernel.org/r/6a762ee32dd655cbb09a4aa0e2307e8919761311.1671531297.git.oleksii_moisieiev@epam.com
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/xen/pvcalls-front.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/pvcalls-front.c b/drivers/xen/pvcalls-front.c
index 1826e8e67125..9b569278788a 100644
--- a/drivers/xen/pvcalls-front.c
+++ b/drivers/xen/pvcalls-front.c
@@ -225,6 +225,8 @@ static irqreturn_t pvcalls_front_event_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static void free_active_ring(struct sock_mapping *map);
+
 static void pvcalls_front_free_map(struct pvcalls_bedata *bedata,
 				   struct sock_mapping *map)
 {
@@ -240,7 +242,7 @@ static void pvcalls_front_free_map(struct pvcalls_bedata *bedata,
 	for (i = 0; i < (1 << PVCALLS_RING_ORDER); i++)
 		gnttab_end_foreign_access(map->active.ring->ref[i], NULL);
 	gnttab_end_foreign_access(map->active.ref, NULL);
-	free_page((unsigned long)map->active.ring);
+	free_active_ring(map);
 
 	kfree(map);
 }
-- 
2.35.1


