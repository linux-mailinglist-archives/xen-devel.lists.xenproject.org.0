Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC909AEBD0
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 18:23:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825481.1239708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t40bu-0005SG-BG; Thu, 24 Oct 2024 16:22:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825481.1239708; Thu, 24 Oct 2024 16:22:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t40bu-0005Pv-7m; Thu, 24 Oct 2024 16:22:54 +0000
Received: by outflank-mailman (input) for mailman id 825481;
 Thu, 24 Oct 2024 16:22:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tIMX=RU=intel.com=jani.nikula@srs-se1.protection.inumbo.net>)
 id 1t40bs-0005Pp-GV
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 16:22:52 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3517bb4e-9224-11ef-99a3-01e77a169b0f;
 Thu, 24 Oct 2024 18:22:49 +0200 (CEST)
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 09:22:47 -0700
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 09:22:44 -0700
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
X-Inumbo-ID: 3517bb4e-9224-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729786970; x=1761322970;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uBlUnvzp1AbBOJrFVlJAunOvF7oh9ITKUSDVP8d4eOo=;
  b=JTuVMvWp3f7ELb3Jz4XuPDbmnUGhGpMGmqxBU+lVT89DMKkeyveHTYLB
   lAuXBZtwinXspYSNvf7RI+m+VFZ2nmRrlCx9iqxJDIQRqal9EsKnr/+yS
   7/f/MohVX5dm4vpcChovfRRlStMlSpkE6foM19Txnfi07WhClqatyuvbH
   LJo922z5aDTKCd5opQ0QIgn21Dd8WQu1qq+QACURRUwL4MsHbHYvbPnQp
   AxCoOUrECdzxkGDAqwo6nKgwB0ffQULByGpYtRVVm4QmK8GvfOpLY9nJU
   EDdhtUJal25yaWRyDku41oPbOVeEZCzW+592GqhHEYNlkfJVijyYK65GZ
   g==;
X-CSE-ConnectionGUID: DAMky7wBQ2+7OkdFFZRP2g==
X-CSE-MsgGUID: N7g7R6+FQpGdkGxV5lZzFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="33232058"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="33232058"
X-CSE-ConnectionGUID: s8OL97kCQLuUn7GPZIxirw==
X-CSE-MsgGUID: tIMidi+FRlWuj/N1Wqaq+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="84615714"
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 1/2] drm/xen: remove redundant initialization info print
Date: Thu, 24 Oct 2024 19:22:39 +0300
Message-Id: <20241024162240.2398664-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

drm_dev_register() already prints the same information on successful
init. Remove the redundant prints.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Note: I prefer to merge this together with the next patch via
drm-misc-next.

Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: xen-devel@lists.xenproject.org
---
 drivers/gpu/drm/xen/xen_drm_front.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index aab79c5e34c2..931d855bfbe8 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -525,11 +525,6 @@ static int xen_drm_drv_init(struct xen_drm_front_info *front_info)
 	if (ret)
 		goto fail_register;
 
-	DRM_INFO("Initialized %s %d.%d.%d %s on minor %d\n",
-		 xen_drm_driver.name, xen_drm_driver.major,
-		 xen_drm_driver.minor, xen_drm_driver.patchlevel,
-		 xen_drm_driver.date, drm_dev->primary->index);
-
 	return 0;
 
 fail_register:
-- 
2.39.5


