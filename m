Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E6822AAF9
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 10:46:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyWrQ-00060e-Sv; Thu, 23 Jul 2020 08:45:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0L1b=BC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jyWrP-00060P-Kz
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 08:45:51 +0000
X-Inumbo-ID: e7f7ddb4-ccc0-11ea-a26b-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7f7ddb4-ccc0-11ea-a26b-12813bfff9fa;
 Thu, 23 Jul 2020 08:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595493949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aDtTphrzz9VOwTJvjWtl31/5xlDEnj/EJHimWB6gA4o=;
 b=cYG1g6MNbDcE+RkR9QpcLmYcP656KCgk6rKsTHEwJllY/GeMMe/hPbBY
 uFaqKj/RyU3+q+35QZ9jgWQ9Kvku5d8IGOPA3VaEV791IxfNDZmXObc3X
 X4zaZmkl/nMNt+DReP8Bty0TPXM4HJrxiAszvZqIH6RfkHQU8uMYjlD/J A=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: FWgaZAI6RoWQ6RqerM/hehVavtzAH7kBf/6J3Itw9DAyS7asko2A0WA2QUDT8/3hNJsqelSZhx
 aGmvB+UAcjhoS8QAFOir6owrVHYiklIGssIJbF2bknAmpy3xPWKLguU8S9RRbMH3bf0+cva/3N
 uWbogJ0Gm1FH42uL71Ft0fG/1RAiD2Rw7MHlwe8wv+Cn7R/dGiTSxubqWMgwlXk5nExHTGmjb4
 pCwIbJGW/hdprKdJesLAO/DCcfjT/aOM9VhVGAf07YUdfu+XW0GCx/J8nODk0DNNXrGa4pMW2b
 11g=
X-SBRS: 2.7
X-MesageID: 23212752
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,386,1589256000"; d="scan'208";a="23212752"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] xen/balloon: fix accounting in alloc_xenballooned_pages
 error path
Date: Thu, 23 Jul 2020 10:45:21 +0200
Message-ID: <20200723084523.42109-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200723084523.42109-1-roger.pau@citrix.com>
References: <20200723084523.42109-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org,
 xen-devel@lists.xenproject.org, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

target_unpopulated is incremented with nr_pages at the start of the
function, but the call to free_xenballooned_pages will only subtract
pgno number of pages, and thus the rest need to be subtracted before
returning or else accounting will be skewed.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Cc: stable@vger.kernel.org
---
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
 drivers/xen/balloon.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 77c57568e5d7..3cb10ed32557 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -630,6 +630,12 @@ int alloc_xenballooned_pages(int nr_pages, struct page **pages)
  out_undo:
 	mutex_unlock(&balloon_mutex);
 	free_xenballooned_pages(pgno, pages);
+	/*
+	 * NB: free_xenballooned_pages will only subtract pgno pages, but since
+	 * target_unpopulated is incremented with nr_pages at the start we need
+	 * to remove the remaining ones also, or accounting will be screwed.
+	 */
+	balloon_stats.target_unpopulated -= nr_pages - pgno;
 	return ret;
 }
 EXPORT_SYMBOL(alloc_xenballooned_pages);
-- 
2.27.0


