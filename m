Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5DE8A82D2
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 14:09:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707423.1105338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx45V-00075d-Sm; Wed, 17 Apr 2024 12:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707423.1105338; Wed, 17 Apr 2024 12:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx45V-00073l-PH; Wed, 17 Apr 2024 12:08:29 +0000
Received: by outflank-mailman (input) for mailman id 707423;
 Wed, 17 Apr 2024 12:08:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bxKY=LW=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1rx45U-0006LA-2G
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 12:08:28 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 329d029f-fcb3-11ee-b909-491648fe20b8;
 Wed, 17 Apr 2024 14:08:27 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-518a56cdbcfso6672686e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 05:08:27 -0700 (PDT)
Received: from EPUAKYIW03DD.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22]) by smtp.gmail.com with ESMTPSA id
 zh17-20020a170906881100b00a5271ae4458sm3484247ejb.16.2024.04.17.05.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 05:08:25 -0700 (PDT)
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
X-Inumbo-ID: 329d029f-fcb3-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713355706; x=1713960506; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhcUEGUnQ0+qUA8Ht423+5o2tI3ICzHo4MGQ4M8SpyU=;
        b=R5O+k4AWllVGWVLEcJuYKJ8JVkYTQkrBkONnJPf9u8f0bv5xS68cw+ySoKSh1PsuIB
         b+isLJaxegGY/3qyiIM5ZpciWrJLYfbo1qh2/LfTMyp8f/RolavDuStS2rOY1jwsvfuO
         z5GsZEYhIMsn8tuThM5MFqacrgN/+OLWplnHGrUvKdnDOHhjfHqeJk+XSjS6VfrG/JcT
         R/EgWpjFcpKfWrAc+dvux/Tdw3csXDlo6OuuLmjkqPqmZML1/cM1jMqAV1bBJ9hjL3w3
         zwwyE6HXTjkhU3XyuH0UM97Psr6qlY02PXqt9NmY8m79AcKf1mUpFc2cwvBydWYsQ2ja
         ZHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713355706; x=1713960506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhcUEGUnQ0+qUA8Ht423+5o2tI3ICzHo4MGQ4M8SpyU=;
        b=pH2wVGCkNuNDqwzWt4Mt7cu5E0KQLXlWLg6kq8LHB1HDZtUUR1GD638bh1PBS8NFJ3
         Hte8ZFMl9DpZnVKnqDXJiVoduvd9X/plZ6TE+uTOzMVpnevBhztwFCAT949CMoDhV6uN
         xMAcg9jGyAdcuP8qCAUUAgKT9N5Z2nXaLaGkMEFbDIRaVMOTQ73a89LwyfN5Kp0rvCmX
         5oYtJmQBZm+bvOnrK5X1HnFzdnxHze+fjKYHOyLDymuudCBM9JBeDDIj13oiq3GsKsPS
         ugOZegSEC2R4Mmg0MttLtav1bfV80djubmPt6s3crkfNzrWDM3h0g99mqVV7IIiW2jUr
         a8bw==
X-Gm-Message-State: AOJu0Yxulgn6FZ0Ds7bSyVXS+pYP2EVuZGvsBApoDXFYIMzFDrFjQo2B
	0LBoPY/wDbK20VpIabYkTqtgElmm2RgrlQqTjzsQvE62/sqI+CLDsZGZFQ==
X-Google-Smtp-Source: AGHT+IErUgnoB3TP98BGjhzgLTymQPYJAM89pZ4O0UIXVUEau8sFyvPVdtsIMQeZ2JAWqdMaU4c3XA==
X-Received: by 2002:a05:6512:3887:b0:518:eb78:3165 with SMTP id n7-20020a056512388700b00518eb783165mr6733605lft.30.1713355706074;
        Wed, 17 Apr 2024 05:08:26 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [ImageBuilder 3/5] uboot-script-gen: Add ability to specify grant table params
Date: Wed, 17 Apr 2024 15:07:39 +0300
Message-Id: <20240417120741.2453431-4-olekstysh@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240417120741.2453431-1-olekstysh@gmail.com>
References: <20240417120741.2453431-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Use DOMU_GRANT_VER to set "max_grant_version" dt property.
Use DOMU_GRANT_FRAMES to set "max_grant_frames" dt property.
Use DOMU_MAPTRACK_FRAMES to set "max_maptrack_frames" dt property.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 README.md                | 10 ++++++++++
 scripts/uboot-script-gen | 13 +++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/README.md b/README.md
index 97db7aa..b2459fd 100644
--- a/README.md
+++ b/README.md
@@ -222,6 +222,16 @@ Where:
   kernels might break. If set to 2, "no-xenstore" is specified, see Xen
   documentation about dom0less "no-xenstore" option.
 
+- DOMU_GRANT_VER[number] is optional but specifies the maximum version
+  of grant table shared structure (the maximum security supported version
+  by Xen on Arm64 is 1)
+
+- DOMU_GRANT_FRAMES[number] is optional but specifies the maximum number
+  of grant table frames (the default value used by Xen on Arm64 is 64)
+
+- DOMU_MAPTRACK_FRAMES[number] is optional but specifies the maximum number
+  of grant maptrack frames (the default value used by Xen on Arm64 is 1024)
+
 - DOMU_CPUPOOL[number] specifies the id of the cpupool (created using
   CPUPOOL[number] option, where number == id) that will be assigned to domU.
 
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 98a64d6..adec6f9 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -353,6 +353,19 @@ function xen_device_tree_editing()
             dt_set "/chosen/domU$i" "xen,enhanced" "str" "no-xenstore"
         fi
 
+        if test -n "${DOMU_GRANT_VER[i]}"
+        then
+            dt_set "/chosen/domU$i" "max_grant_version" "int" "${DOMU_GRANT_VER[i]}"
+        fi
+        if test -n "${DOMU_GRANT_FRAMES[i]}"
+        then
+            dt_set "/chosen/domU$i" "max_grant_frames" "int" "${DOMU_GRANT_FRAMES[i]}"
+        fi
+        if test -n "${DOMU_MAPTRACK_FRAMES[i]}"
+        then
+            dt_set "/chosen/domU$i" "max_maptrack_frames" "int" "${DOMU_MAPTRACK_FRAMES[i]}"
+        fi
+
         if test -n "${DOMU_SHARED_MEM[i]}"
         then
             add_device_tree_static_shared_mem "/chosen/domU${i}" "${DOMU_SHARED_MEM[i]}"
-- 
2.34.1


