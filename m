Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E19619E3CC8
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2024 15:32:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848589.1263435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIqPd-0005zO-Ku; Wed, 04 Dec 2024 14:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848589.1263435; Wed, 04 Dec 2024 14:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIqPd-0005xk-I6; Wed, 04 Dec 2024 14:31:33 +0000
Received: by outflank-mailman (input) for mailman id 848589;
 Wed, 04 Dec 2024 14:31:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=thoz=S5=intel.com=jani.nikula@srs-se1.protection.inumbo.net>)
 id 1tIqPb-0005xe-I6
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2024 14:31:31 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71a8107e-b24c-11ef-a0d4-8be0dac302b0;
 Wed, 04 Dec 2024 15:31:28 +0100 (CET)
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 06:31:26 -0800
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.205])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 06:31:21 -0800
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
X-Inumbo-ID: 71a8107e-b24c-11ef-a0d4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733322688; x=1764858688;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dTapqBXiBmZ3/iS1nkrTPcg40STqJyfdMGiif+W/trs=;
  b=mlsdN0yyPJDjcGIwIiZKOJeSSqwsaIzlJFDV3zdz3ygPsovIArloIIhU
   RaoNR8Fo9D88VaOjVAfs2QDhvvPcz6gXo2teF/Fiz1KCg5PXkLm9JJCIy
   MdRa33UpMrs2Gg98CUebEB6k+MlIb1J+zExz2JEo/SnZunCSw/cWO7kOx
   ddmtLtBC0eEKiGtqfQzhVeGuzQJgw3OxkW5jH0qr+CrmQ1tt6M1yzCNg9
   3VxWckicjuWElhof/tU4e4j8g5Iq8E9Q6F+CSosCdnjWm4AwapyKmMt7F
   PU6CpMvMeksgQbuUql0hG46/VHYQmCnZzRcFMZp59yHoWS4iylG8h4A2X
   w==;
X-CSE-ConnectionGUID: W5yT81heTSaStyJ4Y7MeJg==
X-CSE-MsgGUID: aXkMWb5JQdG7po/SfdRpNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44255526"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44255526"
X-CSE-ConnectionGUID: qP9l167GS5WX+6j0tx76Uw==
X-CSE-MsgGUID: 0lE6/Rr8R8asFhrmSkn/wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="93963339"
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Alex Deucher <alexander.deucher@amd.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 1/3] drm/xen: remove redundant initialization info print
Date: Wed,  4 Dec 2024 16:31:10 +0200
Message-Id: <900b3836c80a23923ede034ab10eb344be1e35bd.1733322525.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1733322525.git.jani.nikula@intel.com>
References: <cover.1733322525.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

drm_dev_register() already prints the same information on successful
init. Remove the redundant prints.

Acked-by: Alex Deucher <alexander.deucher@amd.com>
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


