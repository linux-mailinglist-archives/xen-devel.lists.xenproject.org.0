Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D17F28B4CE3
	for <lists+xen-devel@lfdr.de>; Sun, 28 Apr 2024 18:53:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713706.1114617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s17lp-0006nl-NC; Sun, 28 Apr 2024 16:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713706.1114617; Sun, 28 Apr 2024 16:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s17lp-0006g6-FM; Sun, 28 Apr 2024 16:52:57 +0000
Received: by outflank-mailman (input) for mailman id 713706;
 Sun, 28 Apr 2024 16:52:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a4SJ=MB=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1s17lm-0006DB-GN
 for xen-devel@lists.xenproject.org; Sun, 28 Apr 2024 16:52:54 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c186c588-057f-11ef-909a-e314d9c70b13;
 Sun, 28 Apr 2024 18:52:53 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-34ce52fb920so551562f8f.3
 for <xen-devel@lists.xenproject.org>; Sun, 28 Apr 2024 09:52:54 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a056000188c00b00347eb354b30sm27850921wri.84.2024.04.28.09.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Apr 2024 09:52:52 -0700 (PDT)
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
X-Inumbo-ID: c186c588-057f-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714323173; x=1714927973; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C94PBg2Ugq5+o7rPz1hPA2wsUOkB+FxnEHaAoO6c8iQ=;
        b=HwBnLqZTKkJb9dS3dRPq8VsSWoUXAU3ShtPKfaVOr1nZ6uzn+h4by2f+xv3GdAYjue
         O7bq91IbkBMFL4FQ0lkWwVA+89g52+sTG+gZQqYOpwKxgPPrjjbTfD4gZiw/4htI4Fi4
         EJ+XWRPCbU/p1w4oIS1T2Z1RuelYbpQ6U6XX3zp28RifC4f0N2nsVFYbF5vUknnroJAK
         ZCmdvlmM5vUn2chcqmKkp9Slbg7tQSbHUMR/CSMr4txJYZoRHEC1VuutwdQ+arlHOAar
         ls428UM6/Tgueo0P8PEorJUXGi7dN2aDJPaPt+zgap8nA797LMX2LbVhZwP5PGO7Jrt0
         4HnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714323173; x=1714927973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C94PBg2Ugq5+o7rPz1hPA2wsUOkB+FxnEHaAoO6c8iQ=;
        b=aicaupT6ywjlmBpdZl8Bg2uV8mG69qcYCdGY/W3buJBbr6xIurRITgZaK2SC+ju0l/
         z9Ajq+Drb0jLH61PKJJwoiA7A7CwyYckCV201uwGia/ViH0qBDtT3P+WAUbNNmgn6rhi
         KnbWzybeYJ6Hppw9I0/2lqfvOChRxDYhL28FtDTwX6Qzac0vBl05B1uHQQfrgF+I5b/B
         gmpydTsR9veaS/M7tg16ENTfwCCWa056ESu6jgM4uwyPVt5JrecuYFMs14S68NVvxICr
         AhpvRhhWpR7GceEww0Q5kkP7Kj4yfpQMwl2dgWZfkbgc9V1bZgCB361vr5TChuMM7MIF
         ZPbQ==
X-Gm-Message-State: AOJu0YyYjux0TBAw4PEUuAX6B/vnnH7LVRBaQ+nnvdRozlagpD3Amh7y
	FyiIGprP89te9rtQ355pAv+qKNZwW8f4CI/BHETXfMCMJbFZeIkZ5U/X1rKf
X-Google-Smtp-Source: AGHT+IEAAnK63VjnM7MqGDPEzwDD4kfdpqcuHqgEOQAvsV+JWzA/yMvhRCk+lSZGP5am51FRJDfJ5g==
X-Received: by 2002:adf:e741:0:b0:34d:1692:4463 with SMTP id c1-20020adfe741000000b0034d16924463mr363777wrn.19.1714323173264;
        Sun, 28 Apr 2024 09:52:53 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 5/7] tools/libxl: Activate the max_altp2m feature
Date: Sun, 28 Apr 2024 16:52:40 +0000
Message-Id: <934ec36f587318b9992dfbce2046ea1d97115f24.1714322424.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714322424.git.w1benny@gmail.com>
References: <cover.1714322424.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

This commit activates the previously introduced max_altp2m parameter,
establishing the connection between libxl and Xen.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
Changed since v1:
  * This is a new commit in the series

 tools/libs/light/libxl_create.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 801f704a02..6ccc1fa158 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -653,6 +653,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             .ssidref = info->ssidref,
             .max_vcpus = b_info->max_vcpus,
             .max_evtchn_port = b_info->event_channels,
+            .max_altp2m = b_info->max_altp2m,
             .max_grant_frames = b_info->max_grant_frames,
             .max_maptrack_frames = b_info->max_maptrack_frames,
             .grant_opts = XEN_DOMCTL_GRANT_version(b_info->max_grant_version),
--
2.34.1


