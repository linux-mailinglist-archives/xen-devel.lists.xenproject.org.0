Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7918B16E9C
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 11:28:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065152.1430520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPaB-0000wb-Ii; Thu, 31 Jul 2025 09:28:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065152.1430520; Thu, 31 Jul 2025 09:28:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPaB-0000nx-D8; Thu, 31 Jul 2025 09:28:15 +0000
Received: by outflank-mailman (input) for mailman id 1065152;
 Thu, 31 Jul 2025 09:28:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X87O=2M=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uhPa9-0000Xx-Gj
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 09:28:13 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adb4b713-6df0-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 11:28:12 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-456127b9958so885205e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 02:28:12 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458953cfcc1sm60905485e9.17.2025.07.31.02.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 02:28:11 -0700 (PDT)
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
X-Inumbo-ID: adb4b713-6df0-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753954092; x=1754558892; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPrV+rmqSI9Pn16lUWVeeXFpruWORSVEh0IsEq9O8/U=;
        b=IvMeCcY46XUGGa3JWUY3L9lqJVFMzCEa1IGpXOn4B+uRRf9iovjxl0OnPBNlu9h56e
         T7nyO/8VDgU72nKAIkw8ya82WXTs0uzE7P99cEZYd+Q87f5b4pD9g3hqHz8sOaFGQqtg
         XBRvc0srQGAAAEV9MnQkJu+vvIy+0+/wrYCaKP38xXhwor/SSoNflCCFCml4dw+08oXE
         XmpueMPy2M89qb/0XvzekZF0NxI5sNZwNzd9pl9t4JubIe52hEPTfXWvcUkyz1gWrnvS
         /VdXXQPg+lzxHHaeUFAlu9QRlI8hJcf6g5xxWbXYkw4R+lu+K5VKZy0YnDLjuG+8uA4Y
         T/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753954092; x=1754558892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KPrV+rmqSI9Pn16lUWVeeXFpruWORSVEh0IsEq9O8/U=;
        b=cIBvSwx1ao9hGvBrIl+IonwVj/xhuEseUt7qwLYRYZlqrFbRSfdwS104UcSGS4/Ehp
         5iifVlc8NBnWvXGeJ8Y1PyBlOUqXgPHMD/o5q36uvySe8Pu6dx+D44fjvzMTkDIL5R43
         f2eWeasF1cr8+lONv+BCi0jBGCgd7eXj7mIJPJWjZb3TTDNvSY2NYKHIW0wa3+iz9x3v
         wrDui2ENA+SqMzlE6UULlRlMO+ezswLBX7oHf8oTf/Mxccnfkwba69GD7lKSgcdVH7Bd
         zcHTRqxoL6MOqRDR5plhlCk4MakPxSacQbuo0emn4SK29uhtZgcoqpxQdAJ/p536cbSS
         /Gyg==
X-Gm-Message-State: AOJu0Yy9iQa6B5tbWUXoFBftYiHmWMPPf2LjiMLEg1vQ3k7HEjdycRYo
	56g2yiW4rCNEQcjVC1OThw8WgaRyWjUFOosDoTRkqUWqP6yx2VYJ4l0huVuHb3xb
X-Gm-Gg: ASbGncuLvtxFaM9ppOGZSIV8khH1JM/Q6cGGU9EBBWXk0SSupCnXEp1JI5jOz8CATLs
	+0ldUqOBMDaTgzHxDGb0ig7vzMw/LP3oDXGOngpDl3C0LAGJ0EV5MklvDCgmZzbKsEZ2t6PV2XW
	xeGKhowOvWwnGyc4r2wvAT6jEm1rD9xjkLpiGSdNr5TKuwqzx5Mvh66vMaZl/6aPpWFKNUmrqxS
	sRHl/vlYPoqI8B+M7rbLAWnmR0ULugQ7aiDFkAhkOPxmKk+PU5Yn+BiGrru3jGTv0Qgwov0pVQE
	SDVIDYoo+XTSsxrbUxS/W8JPbtYR8pAoGPbQ/P90gLYlH+KFgnBih9JAD1UIC0rr8XGwJmXEL4g
	3183Mm0BaeZPVjBUnBlIjYNiaENnccktK9oignfdKzN/3WzfUYRsabtzXdOQfyd9Z/J43BOlVQG
	OjCT7J3PfKfDb9xPKuJb9EMQ==
X-Google-Smtp-Source: AGHT+IE92TItSzbpJtRrZEE5XTGgQz8CClAbi63Z8iaaR+liLnsHNYGp2qhWNnPjKUw7fGuCCkEp1Q==
X-Received: by 2002:a05:600c:1f94:b0:450:d5ed:3c20 with SMTP id 5b1f17b1804b1-4589956fdb6mr20914575e9.6.1753954091679;
        Thu, 31 Jul 2025 02:28:11 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v12 4/6] tools/libxl: Activate the altp2m_count feature
Date: Thu, 31 Jul 2025 09:27:59 +0000
Message-Id: <d5c57d64a6b47ce8074e79f713e0b88147bcd676.1753953832.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1753953832.git.w1benny@gmail.com>
References: <cover.1753953832.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

This commit activates the previously introduced altp2m_count parameter,
establishing the connection between libxl and Xen.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
Acked-by: Anthony PERARD <anthony.perard@vates.tech>
---
 tools/libs/light/libxl_create.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 4042ae1a89..36772637e0 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -596,6 +596,10 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
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


