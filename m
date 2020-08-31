Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC99257CBD
	for <lists+xen-devel@lfdr.de>; Mon, 31 Aug 2020 17:32:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kClms-0006Ht-LI; Mon, 31 Aug 2020 15:32:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NCiD=CJ=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1kClmr-0006HJ-1y
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 15:32:01 +0000
X-Inumbo-ID: 33e7f5c7-107d-4168-957c-5459b7e37fb6
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33e7f5c7-107d-4168-957c-5459b7e37fb6;
 Mon, 31 Aug 2020 15:32:00 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 104B3214D8;
 Mon, 31 Aug 2020 15:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598887919;
 bh=+FACLGKqlSwMrilGYEKodDj+1GCcMCrZAibjV4DcC8U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=enZaZ4xuSfz6wg2z4qRun3Er3Js/N3kAJMDnLaROizndy+GaFn5r7RZ0n9/LEwD7w
 bcyHqaRjN0D5APLzVXDJ9CDbzViJFOMYFdPD0Wv5BpuovLR+eKeF8jSZ73xMJgb25e
 H6J4fzJecXudHB9UMWwxBk7WcAFvUIiUaZ0VEwUc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Simon Leiner <simon@leiner.me>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>, Sasha Levin <sashal@kernel.org>,
 xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 4.9 6/6] xen/xenbus: Fix granting of vmalloc'd memory
Date: Mon, 31 Aug 2020 11:31:49 -0400
Message-Id: <20200831153150.1024799-6-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200831153150.1024799-1-sashal@kernel.org>
References: <20200831153150.1024799-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Simon Leiner <simon@leiner.me>

[ Upstream commit d742db70033c745e410523e00522ee0cfe2aa416 ]

On some architectures (like ARM), virt_to_gfn cannot be used for
vmalloc'd memory because of its reliance on virt_to_phys. This patch
introduces a check for vmalloc'd addresses and obtains the PFN using
vmalloc_to_pfn in that case.

Signed-off-by: Simon Leiner <simon@leiner.me>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Link: https://lore.kernel.org/r/20200825093153.35500-1-simon@leiner.me
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/xen/xenbus/xenbus_client.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
index df27cefb2fa35..266f446ba331c 100644
--- a/drivers/xen/xenbus/xenbus_client.c
+++ b/drivers/xen/xenbus/xenbus_client.c
@@ -384,8 +384,14 @@ int xenbus_grant_ring(struct xenbus_device *dev, void *vaddr,
 	int i, j;
 
 	for (i = 0; i < nr_pages; i++) {
-		err = gnttab_grant_foreign_access(dev->otherend_id,
-						  virt_to_gfn(vaddr), 0);
+		unsigned long gfn;
+
+		if (is_vmalloc_addr(vaddr))
+			gfn = pfn_to_gfn(vmalloc_to_pfn(vaddr));
+		else
+			gfn = virt_to_gfn(vaddr);
+
+		err = gnttab_grant_foreign_access(dev->otherend_id, gfn, 0);
 		if (err < 0) {
 			xenbus_dev_fatal(dev, err,
 					 "granting access to ring page");
-- 
2.25.1


