Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0521D9D91B7
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 07:26:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843106.1258973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFp1A-0005vP-Hc; Tue, 26 Nov 2024 06:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843106.1258973; Tue, 26 Nov 2024 06:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFp1A-0005st-E9; Tue, 26 Nov 2024 06:25:48 +0000
Received: by outflank-mailman (input) for mailman id 843106;
 Mon, 25 Nov 2024 19:49:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KbVG=SU=gmail.com=zichenxie0106@srs-se1.protection.inumbo.net>)
 id 1tFf54-0003g2-RT
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 19:49:10 +0000
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [2607:f8b0:4864:20::841])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54d0354b-ab66-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 20:49:07 +0100 (CET)
Received: by mail-qt1-x841.google.com with SMTP id
 d75a77b69052e-466929d6013so12842811cf.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 11:49:07 -0800 (PST)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu.
 [130.126.255.54]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4653c3dc08dsm49025411cf.3.2024.11.25.11.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2024 11:49:05 -0800 (PST)
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
X-Inumbo-ID: 54d0354b-ab66-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjo4NDEiLCJoZWxvIjoibWFpbC1xdDEteDg0MS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjU0ZDAzNTRiLWFiNjYtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTY0MTQ3Ljc2NDA5MSwic2VuZGVyIjoiemljaGVueGllMDEwNkBnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732564146; x=1733168946; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YnQPQy9QUMSA3qSC9VfWBW7KVkhU2YHo+3Vjavlz26Y=;
        b=S/KDu0+/dlvFDGa91q7UQuoeFxwguWIw5ZOLZ3Wai9LX5aa54vWMmhOSe+Sjb0LjP9
         cIuaiEh5IhvM9kkoAKqI89XPwiIr7bSX57duuWBflFGZUDurhKCsDHnZUi9Ql76FsFxg
         uew2u0syPuHlLV+srDThtV9eHFpneZjFRn51QF4hhiXmAY0kHWRdheZ+8vNCFBf87tsV
         xaf7sR+Sdo4yJCCEWUVWd5xT+a6/p5gAN0T7QHJGSxUcBc9bJCGOqb4s/8Pf7XN5CBP5
         y7RsxAlBGJlh8HJWXrdsZf+4ipPV6Jp/WR7obaa/DIGNCenzskG5eoWbVon0Kafh0rcx
         pGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564146; x=1733168946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YnQPQy9QUMSA3qSC9VfWBW7KVkhU2YHo+3Vjavlz26Y=;
        b=iuWLlBLCOQosS/H223nWDA2AgSjt2S0hwz219g5VblEpsq1pp5hqhNVy/tez/j3aON
         XGoD6NJwaqz2o6oUqm0FOYBPFKKHEO19Nyo3AcQ4kJLuMip/LrYxANp8rKU0q4fi5VZi
         d8ZG2J7hgmeYfSiDPPPNG3KK05MqnzvbW4uN4b9R2/HBmYYaFV7z69Zfrjg8kcZxKA2u
         WpVT/ug5v2I/mUGinDxhP9vZ/iOfuVlEbxwkpjGYYZiMXtkdwcRfbZnzFqRRxp4hQ9nP
         agIi9t8grbxmyk2ZK20sIESf8+ci5k7gsL9IsFeMWtOwt2oE830ESSTaxBPet9/4WP8m
         CTug==
X-Forwarded-Encrypted: i=1; AJvYcCV7aSwxfq/MNWYjXet6m5qAIEHFWXiZ0swttFhtI5lOn2V6zBNhO5qYJJ817sxvPWKIO4bQqIG2Kck=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzrUBLMBHRSZe3XDETKIPm0iOrbBu3Tf00u1kGIJvcEWxdqFF7t
	xdX4YP5zECNeleiO7wHVYJ0gwkWXFq+MjePidzCU2itOBFba4ARY
X-Gm-Gg: ASbGncs3ocxVCf6Ub/Sz7zoH6pdyIhe5CRZS/UYPjC1d/gvB44VSNsxcM0lVhDjWK7F
	fDp6doywFveVGcklB6vEdyjPuOjrkGRb/5XpN3UQeWNAOdbBN4JNElpoiLcSpgkZD3d88c2icon
	g54dFpSIfgNNatZvcU/nGcTQhTNArt/rZbyZcdbm2ixF1OMG1uocGmVwFBWtlIJp3YwjH+z+TCl
	e93U/LPE/nB9B+HkFT71x3gudg5J+TBWYj1B+s0oHR+ag57RxiKLHnh7iq5Bu3a3CXfLjRYDGws
	Qwuo4cwCJCtc4O/YciSvhgpudYoDhSq6E+ua
X-Google-Smtp-Source: AGHT+IGASnVlZTy8uOIIeLvm0VVgeI8MN7apGYPIXsgonX7l5aN8h7HkmTpP2xqHs+QhD2knS7irSw==
X-Received: by 2002:a05:622a:391:b0:461:17e6:2651 with SMTP id d75a77b69052e-4653d525977mr210750511cf.8.1732564146425;
        Mon, 25 Nov 2024 11:49:06 -0800 (PST)
From: Gax-c <zichenxie0106@gmail.com>
To: oleksandr_andrushchenko@epam.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: dri-devel@lists.freedesktop.org,
	xen-devel@lists.xenproject.org,
	Zichen Xie <zichenxie0106@gmail.com>
Subject: [PATCH] drm/xen-front: cast calculation to __u64 in xen_drm_drv_dumb_create()
Date: Mon, 25 Nov 2024 13:48:51 -0600
Message-Id: <20241125194850.14274-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zichen Xie <zichenxie0106@gmail.com>

Like commit b0b0d811eac6 ("drm/mediatek: Fix coverity issue with
unintentional integer overflow"), directly multiply args->pitch and
args->height may lead to integer overflow. Add a cast to avoid it.

Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
---
 drivers/gpu/drm/xen/xen_drm_front.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index aab79c5e34c2..639aad26f6c9 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -415,7 +415,7 @@ static int xen_drm_drv_dumb_create(struct drm_file *filp,
 	 * For details also see drm_gem_handle_create
 	 */
 	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-	args->size = args->pitch * args->height;
+	args->size = (__u64)args->pitch * args->height;
 
 	obj = xen_drm_front_gem_create(dev, args->size);
 	if (IS_ERR(obj)) {
-- 
2.34.1


