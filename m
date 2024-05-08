Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3902A8C00F1
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 17:28:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718849.1121384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4jCK-00034H-Ap; Wed, 08 May 2024 15:27:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718849.1121384; Wed, 08 May 2024 15:27:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4jCK-00031y-8C; Wed, 08 May 2024 15:27:12 +0000
Received: by outflank-mailman (input) for mailman id 718849;
 Wed, 08 May 2024 15:27:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dFtT=ML=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1s4jCI-00031s-Kz
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 15:27:11 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6da09837-0d4f-11ef-909c-e314d9c70b13;
 Wed, 08 May 2024 17:27:08 +0200 (CEST)
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 08:27:05 -0700
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa008.fm.intel.com with ESMTP; 08 May 2024 08:27:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id E52E2109; Wed, 08 May 2024 18:27:02 +0300 (EEST)
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
X-Inumbo-ID: 6da09837-0d4f-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715182028; x=1746718028;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ItL86uGAqwtSHzvV7e4Z98MypI8As0zBjnzHJ4JD/+Y=;
  b=dihqrNeW4yJ4lGlK2+krNY901BGI1vF0WXQlAZxODAolSr5cP0kBDCXb
   a1FwrPkefBOrno+qcV2A5zwEDApP8wLO6cigGuB3vhQJKhyo2dFXe5FgY
   UHZ9JvIMU9SqmYneEBmo6F9UQTqQqnr3dF4w6oZPr3gq9TpgKezk2NDZ9
   u02I6Lwy5xNK7SLhoT6DDZEFUMLROtrEZo9CLVR1wnCu4nL8cOEedGY8P
   lG7F0ppmWuIEpZKaT1e3dHjSRH27lGWu1ue7Qj2fzM3Pe8dQtrfI8mBvH
   MGPoeHrYLEn5F7K6YXZpWkjLM6GXYD74CDhgLUWPJVc5g6femLFKtqTUj
   w==;
X-CSE-ConnectionGUID: SnFDFH67Qf2o/Y5+AnNbOw==
X-CSE-MsgGUID: VRNSCFwcQJq/GtO50mrVww==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11429089"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="11429089"
X-CSE-ConnectionGUID: MYnSKQ2/RdCXHfHJiF7k9w==
X-CSE-MsgGUID: U96b3+4LRi2AqLykBsphWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="28851881"
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH v1 1/1] xen/xenbus: Use *-y instead of *-objs in Makefile
Date: Wed,  8 May 2024 18:26:47 +0300
Message-ID: <20240508152658.1445809-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

Note, the original approach is weirdest from the existing.
Only a few drivers use this (-objs-y) one most likely by mistake.

 drivers/xen/xenbus/Makefile | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/xen/xenbus/Makefile b/drivers/xen/xenbus/Makefile
index 0c7532110815..b0d69602214e 100644
--- a/drivers/xen/xenbus/Makefile
+++ b/drivers/xen/xenbus/Makefile
@@ -1,15 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-y	+= xenbus.o
+
+xenbus-y := xenbus_client.o
+xenbus-y += xenbus_comms.o
+xenbus-y += xenbus_xs.o
+xenbus-y += xenbus_probe.o
+
+xenbus-$(CONFIG_XEN_BACKEND) += xenbus_probe_backend.o
+
 obj-y	+= xenbus_dev_frontend.o
-
-xenbus-objs =
-xenbus-objs += xenbus_client.o
-xenbus-objs += xenbus_comms.o
-xenbus-objs += xenbus_xs.o
-xenbus-objs += xenbus_probe.o
-
-xenbus-be-objs-$(CONFIG_XEN_BACKEND) += xenbus_probe_backend.o
-xenbus-objs += $(xenbus-be-objs-y)
-
 obj-$(CONFIG_XEN_BACKEND) += xenbus_dev_backend.o
 obj-$(CONFIG_XEN_XENBUS_FRONTEND) += xenbus_probe_frontend.o
-- 
2.43.0.rc1.1336.g36b5255a03ac


