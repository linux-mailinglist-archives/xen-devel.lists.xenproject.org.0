Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0816A309C7
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 12:19:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885415.1295224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thoIH-0002yY-Ok; Tue, 11 Feb 2025 11:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885415.1295224; Tue, 11 Feb 2025 11:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thoIH-0002vi-Lb; Tue, 11 Feb 2025 11:19:09 +0000
Received: by outflank-mailman (input) for mailman id 885415;
 Tue, 11 Feb 2025 11:19:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oLO3=VC=gmail.com=gragst.linux@srs-se1.protection.inumbo.net>)
 id 1thoIG-0002vc-CJ
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 11:19:08 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 018c02d7-e86a-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 12:19:06 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-30613802a6bso58768841fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 03:19:06 -0800 (PST)
Received: from epuakyiw0a98.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-308e315007csm9142271fa.28.2025.02.11.03.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 03:19:04 -0800 (PST)
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
X-Inumbo-ID: 018c02d7-e86a-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739272745; x=1739877545; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2L0IDCX8nR+v8OlztK03uuiRbKjnPx4XttWi94dRMMw=;
        b=cf5s+44SU9CMQdSUVCOYajxyumOdQZUGqTBeyrIQDQW3zGr6nylSrXBPxMM5pEmGKi
         qei+buqw5TRJ4rvlPW/njrJO0ji3jVEpelOmAK83/WQfdc8yBJfT2QtMbPYsYK5g5upJ
         XXvOhncX+UdSsXylZmQl7H2ymuwX9XGBoFcOtB+ApxlJnw8ld6EX5Yx1oMuNZpa6G2ri
         zBIByHop/VP9YCEtZotw6wEls3wkG55SNA8wCcM9wkdgJtgHgSwDzVrJ8hxOKSjEm8Ud
         a6iIPrjJzwa0oOQvrAv9uiWyYwGDuslv2FAd8UYhlJs8yi+6hp4u41MmfSwTKFqUpscK
         0V7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739272745; x=1739877545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2L0IDCX8nR+v8OlztK03uuiRbKjnPx4XttWi94dRMMw=;
        b=Th2g2pgiKst8TJtUifm+3ygxXPPvfN2LfRLShsGqvQZUI40V/Fch/tWNnVFims1S+O
         1xNVuPs5JqLE5tCID8SIeuVgyoLDPCWrwuDRkHx9bTzDjcNMRSGRXdzXI1u2fAun/Nk7
         9GNfVITdi0qAlNWXmRq+XygzHPYiczyUXzfIlzZjgKq1cbEHr3lYGW//3489nbqsFsqk
         Z1X0X9DyzjbBZY9NiSTOyWO5KLkOpJSirY+gAoA5Sbkwqee/AyaP6CQzwGCJ/ug4FK8D
         PuZ8yVh8sIQcc1ej+5dmM1k5ExxurG+OYOPl8OV61jcv56j7NlK96m2LiZeE+Cx95Mg5
         Dyow==
X-Gm-Message-State: AOJu0Yw1aiUZHsWtXfTJdeidNVAOt8G06ENOeHfKzTcfSXZaS86gKnPt
	j08XDQwSo/LArDwlTu2/7WYVtgf2Ni8UXBX4NI+WM/L3REdnCQ0VwE8ICf7u
X-Gm-Gg: ASbGncvhjqUnKV+EJ2ER4CQqKbxeWFesJ650GhF8Hzto0D5+1btAt2HudYqIuO5jUdL
	q/A9jckocjpNk0gi+VaMSJI3IqVhhxvk0vzYAS9jfsNp+ycNVSqDgYUlqbxacsLhope+7VIPnIa
	WR43uDNUrmn5gCayb4Ux8EC+JzaXrmG8Sm5ox2Mx0Y0F4G1NGeEZ8fzKcdUhSzfDLuFruwhkHrk
	UNLnXJWe1djn11J1R6wavscTSQ3Jbgt4J1LeaJWk3KEH5Sd2CBFGqAmw8OXd+jKFYSiKtdPR1vZ
	GBAgAymxe8MiI7kFJ97GdRxeNUsU+lqqvBTjiT19FkCQY3kyNEb+MkpUQDxFCk/nxYjbEuKKSA=
	=
X-Google-Smtp-Source: AGHT+IG6xnAvOpf66s/+cCso+CwujV5ZlFxYFUb6gFRRbMJKR91RqxuHRPx0DPtcnBa1LcZFUKAoEg==
X-Received: by 2002:a05:651c:894:b0:307:5879:e7e6 with SMTP id 38308e7fff4ca-307e5a815a4mr62534141fa.32.1739272744959;
        Tue, 11 Feb 2025 03:19:04 -0800 (PST)
From: Grygorii Strashko <gragst.linux@gmail.com>
X-Google-Original-From: Grygorii Strashko <grygorii_strashko@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [PATCH] device-tree: optimize dt_device_for_passthrough()
Date: Tue, 11 Feb 2025 13:18:53 +0200
Message-Id: <20250211111853.2199764-1-grygorii_strashko@epam.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dt_device_for_passthrough() is called many times during Xen
initialization and Dom0 creation. On every call it traverses struct
dt_device_node properties list and compares compares properties name with
"xen,passthrough" which is runtime overhead. This can be optimized by
marking dt_device_node as passthrough while unflattening DT.

This patch introduced new struct dt_device_node property "is_passthrough"
which is filled if "xen,passthrough" property is present while unflattening
DT and dt_device_for_passthrough() just return it's value.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/common/device-tree/device-tree.c | 7 +++++--
 xen/include/xen/device_tree.h        | 2 ++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
index d0528c582565..a329aaf576da 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -1682,8 +1682,7 @@ bool dt_device_is_available(const struct dt_device_node *device)
 
 bool dt_device_for_passthrough(const struct dt_device_node *device)
 {
-    return (dt_find_property(device, "xen,passthrough", NULL) != NULL);
-
+    return device->is_passthrough;
 }
 
 static int __dt_parse_phandle_with_args(const struct dt_device_node *np,
@@ -1913,6 +1912,7 @@ static unsigned long unflatten_dt_node(const void *fdt,
         np->used_by = 0;
         /* By default the device is not protected */
         np->is_protected = false;
+        np->is_passthrough = false;
         INIT_LIST_HEAD(&np->domain_list);
 
         if ( new_format )
@@ -2001,6 +2001,9 @@ static unsigned long unflatten_dt_node(const void *fdt,
              * stuff */
             if ( strcmp(pname, "ibm,phandle") == 0 )
                 np->phandle = be32_to_cpup((__be32 *)*p);
+
+            if ( strcmp(pname, "xen,passthrough") == 0 )
+                np->is_passthrough = true;
             pp->name = pname;
             pp->length = sz;
             pp->value = (void *)*p;
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 5ff763bb80bb..96001d5b7843 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -94,6 +94,8 @@ struct dt_device_node {
 
     /* IOMMU specific fields */
     bool is_protected;
+    /* Indicates DT device is for passthrough */
+    bool is_passthrough;
 
 #ifdef CONFIG_STATIC_EVTCHN
     /* HACK: Remove this if there is a need of space */
-- 
2.34.1


