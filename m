Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D12B619785E
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 12:07:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIrE9-0006rZ-NI; Mon, 30 Mar 2020 10:01:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rOgy=5P=cmss.chinamobile.com=dingxiang@srs-us1.protection.inumbo.net>)
 id 1jIrE8-0006rU-0n
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 10:01:04 +0000
X-Inumbo-ID: 5715fc48-726d-11ea-9e09-bc764e2007e4
Received: from cmccmta3.chinamobile.com (unknown [221.176.66.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5715fc48-726d-11ea-9e09-bc764e2007e4;
 Mon, 30 Mar 2020 10:00:56 +0000 (UTC)
Received: from spf.mail.chinamobile.com (unknown[172.16.121.5]) by
 rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee95e81c332af1-0ea21;
 Mon, 30 Mar 2020 18:00:19 +0800 (CST)
X-RM-TRANSID: 2ee95e81c332af1-0ea21
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.105.0.243])
 by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee35e81c331142-d1ef4;
 Mon, 30 Mar 2020 18:00:19 +0800 (CST)
X-RM-TRANSID: 2ee35e81c331142-d1ef4
From: Ding Xiang <dingxiang@cmss.chinamobile.com>
To: oleksandr_andrushchenko@epam.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Date: Mon, 30 Mar 2020 17:59:07 +0800
Message-Id: <1585562347-30214-1-git-send-email-dingxiang@cmss.chinamobile.com>
X-Mailer: git-send-email 1.9.1
Subject: [Xen-devel] [PATCH] drm/xen: fix passing zero to 'PTR_ERR' warning
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Fix a static code checker warning:
    drivers/gpu/drm/xen/xen_drm_front.c:404 xen_drm_drv_dumb_create()
    warn: passing zero to 'PTR_ERR'

Signed-off-by: Ding Xiang <dingxiang@cmss.chinamobile.com>
---
 drivers/gpu/drm/xen/xen_drm_front.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index 4be49c1..3741420 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -401,7 +401,7 @@ static int xen_drm_drv_dumb_create(struct drm_file *filp,
 
 	obj = xen_drm_front_gem_create(dev, args->size);
 	if (IS_ERR_OR_NULL(obj)) {
-		ret = PTR_ERR(obj);
+		ret = PTR_ERR_OR_ZERO(obj);
 		goto fail;
 	}
 
-- 
1.9.1




