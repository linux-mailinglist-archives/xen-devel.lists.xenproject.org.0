Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1899B39A8
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 19:52:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826960.1241432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5UqM-0005Dm-Rk; Mon, 28 Oct 2024 18:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826960.1241432; Mon, 28 Oct 2024 18:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5UqM-0005Ae-Oz; Mon, 28 Oct 2024 18:51:58 +0000
Received: by outflank-mailman (input) for mailman id 826960;
 Mon, 28 Oct 2024 18:51:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CA+9=RY=intel.com=jani.nikula@srs-se1.protection.inumbo.net>)
 id 1t5UqL-0005A6-0V
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 18:51:57 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1c97a7b-955d-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 19:51:53 +0100 (CET)
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 11:51:51 -0700
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.21])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 11:51:47 -0700
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
X-Inumbo-ID: b1c97a7b-955d-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730141514; x=1761677514;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uBlUnvzp1AbBOJrFVlJAunOvF7oh9ITKUSDVP8d4eOo=;
  b=PY+i3tR8yoerrFVnLSV2QFrQkjlhJkXhX79423+9Iz9lCYsmCME1x28L
   +rspCOay2T7S2WyPSw0i7wwE9kE8cwz0Vh06ytt/DiJ7FiWV1zu4ISbea
   FcGTU5vuZMhDEJT2kHIn/JuVqGYsrEzvR1sq/eejXWg49B70S0ZVyoKev
   xImrq+paGEc8RXV4z0UGbYvnQAoH4N/7/DWQOcf4re56cGEW775uNSQU1
   ZDUx0vuiujktnmIl97ewl6/bz/eP8S4ux7MZfKeZ1UwV9yk8EoJ/SXgeZ
   DW/zgnaB8gylhN7PkKelES01uIHHP9z9g3dSlQIffefQ85AthuheWV8mP
   g==;
X-CSE-ConnectionGUID: Ld0yFoHqRJi48JENzvZWoQ==
X-CSE-MsgGUID: 7DcgARqSS/K/bemCo+PMRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="29210277"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="29210277"
X-CSE-ConnectionGUID: Pw7BRuqqTJ6hPkUw+Im0hw==
X-CSE-MsgGUID: ESEBidY/Seqiyd2S7ijMYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="86497284"
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 1/3] drm/xen: remove redundant initialization info print
Date: Mon, 28 Oct 2024 20:51:39 +0200
Message-Id: <20241028185141.3756176-1-jani.nikula@intel.com>
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


