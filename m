Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E532433F6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 08:22:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k66cI-00027K-UI; Thu, 13 Aug 2020 06:21:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7cFh=BX=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1k66cH-00025f-5Z
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 06:21:33 +0000
X-Inumbo-ID: 3877cb2f-ec08-4066-bb57-2f82414a8bb1
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3877cb2f-ec08-4066-bb57-2f82414a8bb1;
 Thu, 13 Aug 2020 06:21:20 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id t6so4887021ljk.9
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2020 23:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mV6j1YOlt73/vZbx39+AFv7LWnETp8Vud91G3AB3D38=;
 b=X1HwcSp96q0CP6XQhQs1GPo4nvPWoE+L2nDF9ZIDpZERw+rLiB/bEU8Te/A/TZJwkY
 mzhpjqBC43Z7FmQs5BkoYUSqU00bNuiM9TP22ps5RBUCgoV4ZKi60dhMorf9RPuguvA6
 4fJcM/d1wkeekHTE4FSDqDmLHrjLrQIS3JmTLdjKyngRnCxATKCAbkC3rOV0A8YSslEe
 TwMAWkKQvK3XwuP5Np6ZFuqdw+2z2u6WSfh88ZM2rvbGA9OIbIlxxnOWSJYEK8z1AU4o
 xnKrJYGQ/x7V3n1WM+bFyErLhocUGoQ8HA9vmdK2oTnr1U1XZiQuXYUXxCIbxRnGYR7N
 tvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mV6j1YOlt73/vZbx39+AFv7LWnETp8Vud91G3AB3D38=;
 b=j2axyh9ypdAcFawTB0yzZICWl5YGZhuytNTNoq6j/QB4b9xnlYqg+kyKo/jyxxxlmm
 eS04uKP7g/vPXIU7sVCeB2M1z7276xlvRZN/m0xRz5Nq+9orEZ51EL26d1tTiPzKXquM
 U0WA4hO3iYQIpNEvld3QKsMxWeFcEMkkjWT7QlNEEH+2hW63wYyfFi+JVmriLNUXuPyc
 ZXsz32i52+BXFNT+2z3ffwoNfYsM7YJxqUDYcPvXI6TqPNl473yveqCviyrJYUalYWoL
 vCjfUVGU6n7PA0+4IL/bfA6oTML5I7EB/Z8bXWe77OwesT++Ok0fx0Ble1WJJTuvcIlU
 aSQA==
X-Gm-Message-State: AOAM532qAzeZyIRossfhDyLURlfXnarln1DCRXm2aki1lHSE2iA+pNG+
 BqnKBLcHCetQFw4vnEKey7WsRgX9HZA=
X-Google-Smtp-Source: ABdhPJyccRfWxWmuepWebwNoe1LCZJoc+bCL+PgtqKkfshXws5t6wobDOmvACsoPZG83M+Ft4/SImQ==
X-Received: by 2002:a2e:3c03:: with SMTP id j3mr1259425lja.397.1597299679335; 
 Wed, 12 Aug 2020 23:21:19 -0700 (PDT)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id f14sm964060lfd.2.2020.08.12.23.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 23:21:18 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 airlied@linux.ie, daniel@ffwll.ch
Cc: sstabellini@kernel.org, dan.carpenter@oracle.com,
 intel-gfx@lists.freedesktop.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v2 3/5] drm/xen-front: Add YUYV to supported formats
Date: Thu, 13 Aug 2020 09:21:11 +0300
Message-Id: <20200813062113.11030-4-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813062113.11030-1-andr2000@gmail.com>
References: <20200813062113.11030-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add YUYV to supported formats, so the frontend can work with the
formats used by cameras and other HW.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Acked-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/xen/xen_drm_front_conn.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xen/xen_drm_front_conn.c b/drivers/gpu/drm/xen/xen_drm_front_conn.c
index 459702fa990e..44f1f70c0aed 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_conn.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_conn.c
@@ -33,6 +33,7 @@ static const u32 plane_formats[] = {
 	DRM_FORMAT_ARGB4444,
 	DRM_FORMAT_XRGB1555,
 	DRM_FORMAT_ARGB1555,
+	DRM_FORMAT_YUYV,
 };
 
 const u32 *xen_drm_front_conn_get_formats(int *format_count)
-- 
2.17.1


