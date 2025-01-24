Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E48B8A1B513
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 13:01:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876706.1287096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbINM-0000Gu-VB; Fri, 24 Jan 2025 12:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876706.1287096; Fri, 24 Jan 2025 12:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbINM-0000Cp-Ql; Fri, 24 Jan 2025 12:01:28 +0000
Received: by outflank-mailman (input) for mailman id 876706;
 Fri, 24 Jan 2025 12:01:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AkuS=UQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tbINL-0007bK-Gs
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2025 12:01:27 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efed0514-da4a-11ef-99a4-01e77a169b0f;
 Fri, 24 Jan 2025 13:01:26 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aafc9d75f8bso378375766b.2
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2025 04:01:26 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e12770sm119049166b.28.2025.01.24.04.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 04:01:24 -0800 (PST)
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
X-Inumbo-ID: efed0514-da4a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737720085; x=1738324885; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZG7JEH3gSju1VydKP45xEoqkmeQzG5Nz2nBw/4zt1JY=;
        b=I2sEsWPX0nNYcf4zGoeeZQpf69Qrh7UQEYyzuIJdTDkoVcXkdXoXV9kO7MoSbjb5a7
         3vS63Hu/1rxCVrBsNAhJEX+6lJAR+X+FMfA1lrZF6vOiPW7slaSMnor8xsLMCZ4v3PBG
         WdBSGOxThvpluHYGBdqS0k100Df6IxbL/9Dkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737720085; x=1738324885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZG7JEH3gSju1VydKP45xEoqkmeQzG5Nz2nBw/4zt1JY=;
        b=GYK27V9ueMwQpMjKMG9YechbmYav7t5zlVPe7dzNuNk193GjyyfAndzMDei4v0/u7g
         XFIdbzxsJoxVpq/Kkx+HJZivNxn4CJUAfEeBSwoL335t/V+gmvof7Z+w8y0xge87MRrd
         0evMAWyZmQ0Wkwbm3grP3y31GBlSfRxJApMlJ1O9RUnZ71yjhjJcIYv3Jz2VFB2cCzx+
         K19ddlia0Y6xroOJw12eqz6UBogKRXsW5aAO2/aVJPYYZOYTi9OzBtSzOvePsKMxFTjQ
         dfneW4HxW1exv6glkR/y1eo2te3HaXVqigJuhDD1OA0AhiDxkLXIeCML/GnTVnK2Qezp
         9ezg==
X-Gm-Message-State: AOJu0YyCl+lYyKYf+bDhzSsFh6vj3ECadkMyOnaSr1XpS+yKBb+ZjEEQ
	xd5hC8naNXKHDcA0C9Xd+tUI8/2U6QWhpI1DJpKF88wDb/T1DS/+isWO1Cz/qVw9iJHl1frB1VU
	C
X-Gm-Gg: ASbGnctehdgaCPpvBKCYoVXM7ylH6SbrP7ZVhNtOtDB6FS2YbYQU+nh115YeWQCZGrF
	cIjkJs+eeOEWb8r3G8SYGb/m3ZSNSvcXEdza116sAJ/BD1Ou3ZkJAhv4Dd8oVlXAVWYfctrt69/
	v+/k5tI8QDjbuMdowu8qZiwdniUUdaMBA42aGS5Y9WLFEU3ikuc8dm6Pi4hCByb5bdGjqSs3RWN
	pM9r+Yva9ZqY1ql2L4pvbnlz+GGO6HfmSHWaRzPhX0SxxmJuP3Eo63YbIyBTSjL4FWsvJZyir4z
	5m4WnwtqGbSfACA=
X-Google-Smtp-Source: AGHT+IGwobbZw6n/IuGjK/JSvPcW4EXd/vH/ht5HiCBUBeIfVlLQYJB4jj+811xsVLL8IgmHXb0e+g==
X-Received: by 2002:a17:907:9408:b0:aa6:a87e:f2e1 with SMTP id a640c23a62f3a-ab38b4b96d0mr2693767166b.56.1737720085229;
        Fri, 24 Jan 2025 04:01:25 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 4/5] iommu/vtd: cleanup MAP_SINGLE_DEVICE and related code
Date: Fri, 24 Jan 2025 13:01:10 +0100
Message-ID: <20250124120112.56678-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250124120112.56678-1-roger.pau@citrix.com>
References: <20250124120112.56678-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Teddy Astie <teddy.astie@vates.tech>

This flag was only used in case cx16 is not available, as those code paths no
longer exist, this flag now does basically nothing.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/vtd/iommu.c | 12 +++---------
 xen/drivers/passthrough/vtd/vtd.h   |  5 ++---
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index b0963bfcf74e..9d7a9977a6a6 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1695,15 +1695,9 @@ static int domain_context_mapping(struct domain *domain, u8 devfn,
         break;
     }
 
-    if ( domain != pdev->domain && pdev->domain != dom_io )
-    {
-        if ( pdev->domain->is_dying )
-            mode |= MAP_OWNER_DYING;
-        else if ( drhd &&
-                  !any_pdev_behind_iommu(pdev->domain, pdev, drhd->iommu) &&
-                  !pdev->phantom_stride )
-            mode |= MAP_SINGLE_DEVICE;
-    }
+    if ( domain != pdev->domain && pdev->domain != dom_io &&
+         pdev->domain->is_dying )
+        mode |= MAP_OWNER_DYING;
 
     switch ( pdev->type )
     {
diff --git a/xen/drivers/passthrough/vtd/vtd.h b/xen/drivers/passthrough/vtd/vtd.h
index 8aeff8c1f287..b95124517bd3 100644
--- a/xen/drivers/passthrough/vtd/vtd.h
+++ b/xen/drivers/passthrough/vtd/vtd.h
@@ -28,9 +28,8 @@
  */
 #define MAP_WITH_RMRR         (1u << 0)
 #define MAP_OWNER_DYING       (1u << 1)
-#define MAP_SINGLE_DEVICE     (1u << 2)
-#define MAP_ERROR_RECOVERY    (1u << 3)
-#define UNMAP_ME_PHANTOM_FUNC (1u << 4)
+#define MAP_ERROR_RECOVERY    (1u << 2)
+#define UNMAP_ME_PHANTOM_FUNC (1u << 3)
 
 /* Allow for both IOAPIC and IOSAPIC. */
 #define IO_xAPIC_route_entry IO_APIC_route_entry
-- 
2.46.0


