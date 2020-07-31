Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91962234633
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:51:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1UVW-0001OA-D5; Fri, 31 Jul 2020 12:51:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YcXq=BK=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1k1UVU-0001HZ-IQ
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:51:28 +0000
X-Inumbo-ID: 861a5ecf-d32c-11ea-8e30-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 861a5ecf-d32c-11ea-8e30-bc764e2007e4;
 Fri, 31 Jul 2020 12:51:18 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id k13so16822339lfo.0
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2020 05:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=in3e/rhynkLwVD5V9PwoaNI3UJD8A73TVa8u/14UsAg=;
 b=dvGhnctdpY5kxFxb0suRBtGNcio8aozQM9kdwS+Lnwi6/6de1sgC6u7OXXgupL3KX2
 CzjQ8fZkjfpjEM8Ct/Rl4YPy3RXEMyiAxnq6w0+TAqibQWiMtXMmRYiVdbWlDCLDExp0
 oRSTR1udpBecZD7hP4CuP4fsW1WUZOXMyRpiX52GsPu8zk/CAJpl0Ozg9mQi94llxQ9A
 YDcTUgBuVLAXdjVPehaqgATExkYwQHpVbPFgQcFFGFYUxffiNQmOCqYF1R34fiJLe/+4
 bu77en9ko2W4Qny1ym2XxbQtdj/47CBtRgk9E5QWu0Vo7/i4SQO/zCHjVP+UYAjeOzTP
 F4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=in3e/rhynkLwVD5V9PwoaNI3UJD8A73TVa8u/14UsAg=;
 b=QmFLhNoBDjTQjqzzXUP/v74e5DP5cGalEsXx+iV7PGXHw3wYJ4okx07h2DfbpivTzv
 Znnufr1NR5eeAZ8yKL6WFug5Tbe3E84LzHinCQHj3s3p0lY/ZanhYc8D3Fg59Z0cw1fa
 ptDCakWG8cO1EMo5pa0Cq5Z/GqeTmDzetmfN86y7x2tPiDo86GmfcrL3xK0kpZ8aEFaR
 vyhXLsMP2l3RjadiLa0aZqgqVa/a6/0FqHzUPoanjrGeEvweqL1JpCQ+76k+G9DW9FtC
 +CCAv/2OMFtj47Y2i8pG+XF/a0YMVdB57j7hOpJE4z6SdFHoj/GUj3goMAMFrN6jk5/h
 gcpQ==
X-Gm-Message-State: AOAM530TTwuVQzhHyJb8GW5QsNCeeWWD7IEFpVsA44yOkK/5KK6MMrOB
 FU3GPS8yaQxWEQlX6+RR7QsBUeT/yIg=
X-Google-Smtp-Source: ABdhPJxYkcBz7mtQ/VNmuWNPBGMmzaqks8S8snreTQ/Yahk5mchXkjcy3WbaQqY4RS/Kt1wg3P3OVw==
X-Received: by 2002:a19:ae06:: with SMTP id f6mr1992770lfc.42.1596199876892;
 Fri, 31 Jul 2020 05:51:16 -0700 (PDT)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id s2sm1923362lfs.4.2020.07.31.05.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 05:51:16 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 3/6] drm/xen-front: Add YUYV to supported formats
Date: Fri, 31 Jul 2020 15:51:06 +0300
Message-Id: <20200731125109.18666-4-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731125109.18666-1-andr2000@gmail.com>
References: <20200731125109.18666-1-andr2000@gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, sstabellini@kernel.org,
 dan.carpenter@oracle.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add YUYV to supported formats, so the frontend can work with the
formats used by cameras and other HW.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
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


