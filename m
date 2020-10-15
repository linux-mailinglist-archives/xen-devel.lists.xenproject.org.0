Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 480CB28E999
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 03:01:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7057.18475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSrdT-0004Ml-KO; Thu, 15 Oct 2020 01:00:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7057.18475; Thu, 15 Oct 2020 01:00:51 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSrdT-0004J9-GR; Thu, 15 Oct 2020 01:00:51 +0000
Received: by outflank-mailman (input) for mailman id 7057;
 Thu, 15 Oct 2020 01:00:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TsEj=DW=intel.com=dan.j.williams@srs-us1.protection.inumbo.net>)
 id 1kSrdR-0003ZY-Fu
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 01:00:49 +0000
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b64d8568-93cd-4626-a615-f38165d792c5;
 Thu, 15 Oct 2020 01:00:45 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2020 18:00:45 -0700
Received: from dwillia2-desk3.jf.intel.com (HELO
 dwillia2-desk3.amr.corp.intel.com) ([10.54.39.25])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2020 18:00:44 -0700
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=TsEj=DW=intel.com=dan.j.williams@srs-us1.protection.inumbo.net>)
	id 1kSrdR-0003ZY-Fu
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 01:00:49 +0000
X-Inumbo-ID: b64d8568-93cd-4626-a615-f38165d792c5
Received: from mga01.intel.com (unknown [192.55.52.88])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b64d8568-93cd-4626-a615-f38165d792c5;
	Thu, 15 Oct 2020 01:00:45 +0000 (UTC)
IronPort-SDR: Rari7y453Xph2I6nvivgDgSjF7Xnmm9pgy25ZHIn9Z5icVjSbcgm//I0wUlwfrk4KQeQaZnFZD
 KjBIkWhnQl4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9774"; a="183763644"
X-IronPort-AV: E=Sophos;i="5.77,376,1596524400"; 
   d="scan'208";a="183763644"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2020 18:00:45 -0700
IronPort-SDR: FfdsxjRqp3q4f4etEQRl1TI5VTynO18vfKev9t2iOTvW0tZxScWrNfuysGf8rx03gz/Y/v7tG4
 l/NGqn36Tp+w==
X-IronPort-AV: E=Sophos;i="5.77,376,1596524400"; 
   d="scan'208";a="521643942"
Received: from dwillia2-desk3.jf.intel.com (HELO dwillia2-desk3.amr.corp.intel.com) ([10.54.39.25])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2020 18:00:44 -0700
Subject: [PATCH 2/2] xen/unpopulated-alloc: Consolidate pgmap manipulation
From: Dan Williams <dan.j.williams@intel.com>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, vishal.l.verma@intel.com,
 dave.hansen@linux.intel.com, akpm@linux-foundation.org,
 linux-nvdimm@lists.01.org, linux-mm@kvack.org
Date: Wed, 14 Oct 2020 17:42:14 -0700
Message-ID: <160272253442.3136502.16683842453317773487.stgit@dwillia2-desk3.amr.corp.intel.com>
In-Reply-To: <160272252400.3136502.13635752844548960833.stgit@dwillia2-desk3.amr.corp.intel.com>
References: <160272252400.3136502.13635752844548960833.stgit@dwillia2-desk3.amr.corp.intel.com>
User-Agent: StGit/0.18-3-g996c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Cleanup fill_list() to keep all the pgmap manipulations in a single
location of the function. Update the exit unwind path accordingly.

Link: http://lore.kernel.org/r/6186fa28-d123-12db-6171-a75cb6e615a5@oracle.com

Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: <xen-devel@lists.xenproject.org>
Reported-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 drivers/xen/unpopulated-alloc.c |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/xen/unpopulated-alloc.c b/drivers/xen/unpopulated-alloc.c
index 8c512ea550bb..75ab5de99868 100644
--- a/drivers/xen/unpopulated-alloc.c
+++ b/drivers/xen/unpopulated-alloc.c
@@ -27,11 +27,6 @@ static int fill_list(unsigned int nr_pages)
 	if (!res)
 		return -ENOMEM;
 
-	pgmap = kzalloc(sizeof(*pgmap), GFP_KERNEL);
-	if (!pgmap)
-		goto err_pgmap;
-
-	pgmap->type = MEMORY_DEVICE_GENERIC;
 	res->name = "Xen scratch";
 	res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
 
@@ -43,6 +38,11 @@ static int fill_list(unsigned int nr_pages)
 		goto err_resource;
 	}
 
+	pgmap = kzalloc(sizeof(*pgmap), GFP_KERNEL);
+	if (!pgmap)
+		goto err_pgmap;
+
+	pgmap->type = MEMORY_DEVICE_GENERIC;
 	pgmap->range = (struct range) {
 		.start = res->start,
 		.end = res->end,
@@ -91,10 +91,10 @@ static int fill_list(unsigned int nr_pages)
 	return 0;
 
 err_memremap:
-	release_resource(res);
-err_resource:
 	kfree(pgmap);
 err_pgmap:
+	release_resource(res);
+err_resource:
 	kfree(res);
 	return ret;
 }


