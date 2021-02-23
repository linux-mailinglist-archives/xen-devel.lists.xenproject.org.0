Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC48C322EF4
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 17:41:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88965.167386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEakD-0001wx-UF; Tue, 23 Feb 2021 16:41:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88965.167386; Tue, 23 Feb 2021 16:41:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEakD-0001wW-R7; Tue, 23 Feb 2021 16:41:05 +0000
Received: by outflank-mailman (input) for mailman id 88965;
 Tue, 23 Feb 2021 16:41:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lEakC-0001wK-CE
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 16:41:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c44e8d80-86a2-4c9a-b623-4b257548d2f4;
 Tue, 23 Feb 2021 16:41:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 99159ADE3;
 Tue, 23 Feb 2021 16:41:02 +0000 (UTC)
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
X-Inumbo-ID: c44e8d80-86a2-4c9a-b623-4b257548d2f4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614098462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NMSoGkZ7tOncwXKdvkLdYenM0RdMgXI+RBMm6qRER6I=;
	b=W+kyOdBWY8kJxh7KzhKbLljqa3O1QsVa3t762qMv69AocuhZs6IOnP+e5VvrqhegOb3kys
	VVNcbsfPvfG5Z2GQE+DCm6fhmjqpWJCh5TtlbyofVTO2mZ8HFPZwElIWc83iMXSttb2ES/
	yGh9982qAKeM23RgcYvnFxykbPBs5Vs=
To: "oleksandr_andrushchenko@epam.com" <oleksandr_andrushchenko@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] drm/xen: adjust Kconfig
Message-ID: <54ae54f9-1ba9-900b-a56f-f48e2c9a82b0@suse.com>
Date: Tue, 23 Feb 2021 17:41:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

By having selected DRM_XEN, I was assuming I would build the frontend
driver. As it turns out this is a dummy option, and I have really not
been building this (because I had DRM disabled). Make it a promptless
one, moving the "depends on" to the other, real option, and "select"ing
the dummy one.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/drivers/gpu/drm/xen/Kconfig
+++ b/drivers/gpu/drm/xen/Kconfig
@@ -1,15 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_XEN
-	bool "DRM Support for Xen guest OS"
-	depends on XEN
-	help
-	  Choose this option if you want to enable DRM support
-	  for Xen.
+	bool
 
 config DRM_XEN_FRONTEND
 	tristate "Para-virtualized frontend driver for Xen guest OS"
-	depends on DRM_XEN
-	depends on DRM
+	depends on XEN && DRM
+	select DRM_XEN
 	select DRM_KMS_HELPER
 	select VIDEOMODE_HELPERS
 	select XEN_XENBUS_FRONTEND

