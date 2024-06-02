Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A17628D77B7
	for <lists+xen-devel@lfdr.de>; Sun,  2 Jun 2024 22:05:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734562.1140726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDrRb-0001TQ-0V; Sun, 02 Jun 2024 20:04:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734562.1140726; Sun, 02 Jun 2024 20:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDrRa-0001MG-Io; Sun, 02 Jun 2024 20:04:42 +0000
Received: by outflank-mailman (input) for mailman id 734562;
 Sun, 02 Jun 2024 20:04:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nKxc=NE=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sDrRY-00084Y-Ty
 for xen-devel@lists.xenproject.org; Sun, 02 Jun 2024 20:04:40 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57aa46a1-211b-11ef-b4bb-af5377834399;
 Sun, 02 Jun 2024 22:04:39 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-421338c4c3bso15296275e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 02 Jun 2024 13:04:39 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd064bb21sm6879280f8f.102.2024.06.02.13.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 13:04:37 -0700 (PDT)
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
X-Inumbo-ID: 57aa46a1-211b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717358678; x=1717963478; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyVxB8SzIq3ix8NG+232jLUPvfNmU9Jk5I/4qPsfmIc=;
        b=LaGqPt/FCXizFXiToBbVw60xjCEWY5BxEOq2nas5cf7TyTy5jaML1HIyqZATCq1/rd
         HD7qVDO7i/n2ZU7tODZMZiLiN6rcHenUaksp1gbqqgfEP91stAx/ncsiH4msms14ysus
         oTKjvoHOasLELpNNo2uUAzkWrT0NXXvlhiWsipH8NuFFvTj13vkVVz7Z9GJp4ZlGaITb
         YaqcSU065fwYu1236yFNoGybGqyYWCBmeassQe0Ze6eGMiLetXH0tLk8psib/oT21KVr
         bzluTrW6J9XA0e8HC0PfWvKX1uKtRm0G5e4QNDRyt7QB6Eu0Cz0xwGz3wH73Si0PfaR2
         MZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717358678; x=1717963478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nyVxB8SzIq3ix8NG+232jLUPvfNmU9Jk5I/4qPsfmIc=;
        b=nADz7E28FOKzGoj+uov5OqRCxIwiGrciGDMj7MPCL24wz5ruCwTNeyH3UlpKS1ldmj
         +hTWLauOnNI2eMQUeCeYlAWph5zLrv8Wn2jDNQB4vpmuNeNyvHrdv2EtV+43g0l3ptxq
         vOr5O2y8F1Y1mT81jMVdhPF56Nr7B8wiGP2aoZbJOpAVzj5KHz3rZiuARBnzsLlBiqdg
         FP9Us1mD++AARQ6p2N6xt+uJijsnwSDfWQhPcg4Y4u/36MwfIEfXs2xtWib2oENVLt97
         MAGsSCBd/1dzBfY7UO/AIt6quSkvmJ+IFaPfHJAuvTXEwWvR1r6n6w+l8mY5EPX1SLix
         xL3A==
X-Gm-Message-State: AOJu0YzhJrNIAi0eBcJ7xydpfkZ6TqNeLy6MV8V5alQTdHI+80nw77Rz
	anqa8FCBIz+fety0JyGigoNXoYD7fClTAUOB2XbS7fu0/isaR+j24OsLng==
X-Google-Smtp-Source: AGHT+IGVr5Ym4zdRhYa0+9XmV8eM6V0ASINffhd7dARFKkDZCPZn6fIveD60a1vitG9ViPB4KVzJ2w==
X-Received: by 2002:adf:f3c6:0:b0:354:f2a7:97d6 with SMTP id ffacd0b85a97d-35e0f285b04mr5191591f8f.30.1717358678069;
        Sun, 02 Jun 2024 13:04:38 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.19? v5 08/10] tools/libxl: Activate the altp2m_count feature
Date: Sun,  2 Jun 2024 20:04:21 +0000
Message-Id: <9f0f897ea677aa80da2465f1a713d409950d33dd.1717356829.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717356829.git.w1benny@gmail.com>
References: <cover.1717356829.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

This commit activates the previously introduced altp2m_count parameter,
establishing the connection between libxl and Xen.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 tools/libs/light/libxl_create.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 11d2f282f5..5ad552c4ec 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -656,6 +656,10 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             .max_grant_frames = b_info->max_grant_frames,
             .max_maptrack_frames = b_info->max_maptrack_frames,
             .grant_opts = XEN_DOMCTL_GRANT_version(b_info->max_grant_version),
+            .altp2m = {
+                .opts = 0, /* .opts will be set below */
+                .nr = b_info->altp2m_count,
+            },
             .vmtrace_size = ROUNDUP(b_info->vmtrace_buf_kb << 10, XC_PAGE_SHIFT),
             .cpupool_id = info->poolid,
         };
--
2.34.1


