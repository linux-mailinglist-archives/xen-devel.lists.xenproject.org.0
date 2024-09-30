Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F77989F57
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 12:29:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807177.1218457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svDeI-0007rw-G9; Mon, 30 Sep 2024 10:29:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807177.1218457; Mon, 30 Sep 2024 10:29:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svDeI-0007om-Ct; Mon, 30 Sep 2024 10:29:02 +0000
Received: by outflank-mailman (input) for mailman id 807177;
 Mon, 30 Sep 2024 10:29:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J1RI=Q4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1svDeG-0007Va-RY
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 10:29:00 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce56d76c-7f16-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 12:29:00 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c40aea5c40so7610003a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 03:28:59 -0700 (PDT)
Received: from localhost ([213.195.117.215]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88245fa97sm4336493a12.43.2024.09.30.03.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 03:28:58 -0700 (PDT)
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
X-Inumbo-ID: ce56d76c-7f16-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727692138; x=1728296938; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c7w0RhKBAmLGt5Q8j1v3GtRtu3ApeY2RliT9YAxTkbM=;
        b=gLEotAMEvXhF+FHtQDvEe2Iv9yH5z5Z2pvoTWnrw6FOzIQjG7jCCFp0RL6gc86qjrc
         l63Dn/Whi7LpTEKv0eTWyLhqaLuRlzwKP8E2u1gHCUSEnjT9irXnOiNVHcONj3UPAMtt
         lXj0ASAEVvGROwLCRHkSsFiRRrO8u0/B/SQao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727692138; x=1728296938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7w0RhKBAmLGt5Q8j1v3GtRtu3ApeY2RliT9YAxTkbM=;
        b=XyBAkG7A4gTPwhIGGbB87pQSlQPxlt12H4gpHuQsO9oIxEodJOHKadxR0oF/y47IAh
         RwB6/FPqiYqclUd64nDyGuh5to30HlG7g4e09o6+J9grVc/2V1VPxKHWAtUlI9aYzy0S
         ZrlKeVZ3Ca3D/b5RvTi8gEQ6dQUGJLws++3bvn2O7c51CT7yZ2aeCzeI6Bn1bKmoFJIy
         eYzvH4uSkrItUYpTzsoaQFR11Nee/N//cY7V647/f7KOMh9Bvd76CuQn02CY74jsEzRO
         H/Py+DN9ESxQd+o6Ieh2w4/5WtF9a7Pv358OLWMbwl+XdiR4EZZu0SUw2bsAjjYry8jK
         q7ww==
X-Gm-Message-State: AOJu0YxmgJMcxUJUy88He6icSbBFKEWlAR/0pSqk+Ygh6KqWSq3ud30n
	d5SS4nfSrSwXjVKkckcpq0mp5UhdEpWPG6T0H6VYVJ6ui0Ep2kobXXDom9GIHpgLiclTPcXzFiZ
	d
X-Google-Smtp-Source: AGHT+IGw1HVqLNottYMT6Aa3DJp5+PMxUQwL8zlVHlUT40Mn+ZZUevsFJhX5577YUoygjLp4rfPNmA==
X-Received: by 2002:a05:6402:50d3:b0:5c8:a01c:e9b2 with SMTP id 4fb4d7f45d1cf-5c8a01cea2cmr766203a12.17.1727692138513;
        Mon, 30 Sep 2024 03:28:58 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] iommu/amd-vi: make IOMMU list ro after init
Date: Mon, 30 Sep 2024 12:28:49 +0200
Message-ID: <20240930102849.18309-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The only functions to modify the list, amd_iommu_detect_one_acpi() and
amd_iommu_init_cleanup(), are already init.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/amd/iommu_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index 6c0dc2d5cb69..302362502033 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -32,7 +32,7 @@ unsigned int __read_mostly amd_iommu_acpi_info;
 unsigned int __read_mostly ivrs_bdf_entries;
 u8 __read_mostly ivhd_type;
 static struct radix_tree_root ivrs_maps;
-LIST_HEAD_READ_MOSTLY(amd_iommu_head);
+LIST_HEAD_RO_AFTER_INIT(amd_iommu_head);
 bool iommuv2_enabled;
 
 bool __ro_after_init amd_iommu_perdev_intremap = true;
-- 
2.46.0


