Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1491898F173
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 16:31:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809513.1221887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swMrJ-00008F-1z; Thu, 03 Oct 2024 14:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809513.1221887; Thu, 03 Oct 2024 14:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swMrI-00005f-UN; Thu, 03 Oct 2024 14:31:12 +0000
Received: by outflank-mailman (input) for mailman id 809513;
 Thu, 03 Oct 2024 14:31:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wyt=Q7=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1swMrH-0008IT-Kh
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 14:31:11 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2226ecd8-8194-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 16:31:10 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-53993564cb1so1186811e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 07:31:10 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539a8296ba3sm191801e87.133.2024.10.03.07.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 07:31:07 -0700 (PDT)
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
X-Inumbo-ID: 2226ecd8-8194-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727965869; x=1728570669; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5QkDAThvHzn8nk+HGJi0H/5a08f7RDTFwzrMcXuWa4E=;
        b=hqZ2Y5WtNcSUKmWSMjYQGi7qgPnQ3oD3AXa6ssY6M0yTMUxl+FR1BOJNMPzGtpcjup
         QbFLIZo0twFdwVUGT1blzdqjIhfDDlxLA6QmsdP3W+VoYUDsNGhtmwAU7nPAzzzdnDi+
         2UWvmz/6Uc2eIjf378jSzC4MgQi68jBfRDY0ObxuiO8nywH9tDFP/QlxVqaO+TZDk66G
         Q9g7mKZvk214TbJUBNTRIl3dmf8lN65PIteAIJufgO60XEEvnI3zuznEzJ5n3V97V9ZK
         bkMDStBEeq+4s74X0i78o4Lq89T+WyvCBE1lWfKd/t/aI3kkizXhbkdr4HP3Nc1CYs3P
         8SKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727965869; x=1728570669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5QkDAThvHzn8nk+HGJi0H/5a08f7RDTFwzrMcXuWa4E=;
        b=ALaidEvUMDQ6xK6lZLIn3T/aHb57Xm3boIIV/+6aPRC4fXDqPpIp4wznHigX5Toqr5
         10SxsLqkYRC7Sp8TNwo75qCFKzGhKzGXfy5YLOwr+tnl1oDuR7YgyOtty9whPNR3z3Ly
         ymTQO0kuZlK57PWttpJLrStFAI9Frlkk7InXVFZISggkTcNX5YKB5yUAI/oOj88JJET1
         tXP33EAYR6OcKbEA6NZhzvGO8kCqaVR0gWiPHxVZq1bnB1vEK1UkStTBPx6op/HLE8FK
         uGZY7Hde+lZVnwltXe7esWMrXjmSspF+x/RuCQ9UKOOscpNidsiN67N28m2FnkN62cA6
         hdTg==
X-Forwarded-Encrypted: i=1; AJvYcCVFkm1iCLHiQ7NqEcv82M/iyuhDBpIN+7/Qo4qvi1RGlWDTD3x6wler644Y+JW3ZkvmPWMzLXlW4ew=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIxv6ulixkpKlXCPTGE7pZ5cBAoe8cJUEBtdHlcAb6bwlOPQev
	/7FyGqyFxgflEAy1WYzaX5mTLqBGIFLpePDrQru48X2IM9BEj3DE
X-Google-Smtp-Source: AGHT+IENz5mwtWHtkPPjZFK+I8sGggUcDkXaE5WZHxkY3QmdHU4icE62BAzIHG+lJO+kM3iPAsGlug==
X-Received: by 2002:a05:6512:2813:b0:539:9746:2d77 with SMTP id 2adb3069b0e04-539a07af74fmr3419652e87.61.1727965869012;
        Thu, 03 Oct 2024 07:31:09 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	"Dr. David Alan Gilbert" <dave@treblig.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Thomas Huth <thuth@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PULL v1 1/5] hw/xen: Remove deadcode
Date: Thu,  3 Oct 2024 16:30:58 +0200
Message-ID: <20241003143103.1476805-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241003143103.1476805-1-edgar.iglesias@gmail.com>
References: <20241003143103.1476805-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <dave@treblig.org>

xen_be_copy_grant_refs is unused since 2019's
  19f87870ba ("xen: remove the legacy 'xen_disk' backend")

xen_config_dev_console is unused since 2018's
  6d7c06c213 ("Remove broken Xen PV domain builder")

Remove them.

Signed-off-by: Dr. David Alan Gilbert <dave@treblig.org>
Acked-by: Anthony PERARD <anthony.perard@vates.tech>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/xen/xen-legacy-backend.c         | 18 ------------------
 hw/xen/xen_devconfig.c              |  8 --------
 include/hw/xen/xen-legacy-backend.h |  5 -----
 3 files changed, 31 deletions(-)

diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 5514184f9c..e8e1ee4f7d 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -147,24 +147,6 @@ void xen_be_unmap_grant_refs(struct XenLegacyDevice *xendev, void *ptr,
     }
 }
 
-int xen_be_copy_grant_refs(struct XenLegacyDevice *xendev,
-                           bool to_domain,
-                           XenGrantCopySegment segs[],
-                           unsigned int nr_segs)
-{
-    int rc;
-
-    assert(xendev->ops->flags & DEVOPS_FLAG_NEED_GNTDEV);
-
-    rc = qemu_xen_gnttab_grant_copy(xendev->gnttabdev, to_domain, xen_domid,
-                                    segs, nr_segs, NULL);
-    if (rc) {
-        xen_pv_printf(xendev, 0, "xengnttab_grant_copy failed: %s\n",
-                      strerror(-rc));
-    }
-    return rc;
-}
-
 /*
  * get xen backend device, allocate a new one if it doesn't exist.
  */
diff --git a/hw/xen/xen_devconfig.c b/hw/xen/xen_devconfig.c
index 2150869f60..45ae134b84 100644
--- a/hw/xen/xen_devconfig.c
+++ b/hw/xen/xen_devconfig.c
@@ -66,11 +66,3 @@ int xen_config_dev_vkbd(int vdev)
     xen_config_dev_dirs("vkbd", "vkbd", vdev, fe, be, sizeof(fe));
     return xen_config_dev_all(fe, be);
 }
-
-int xen_config_dev_console(int vdev)
-{
-    char fe[256], be[256];
-
-    xen_config_dev_dirs("console", "console", vdev, fe, be, sizeof(fe));
-    return xen_config_dev_all(fe, be);
-}
diff --git a/include/hw/xen/xen-legacy-backend.h b/include/hw/xen/xen-legacy-backend.h
index 943732b8d1..e198b120c5 100644
--- a/include/hw/xen/xen-legacy-backend.h
+++ b/include/hw/xen/xen-legacy-backend.h
@@ -50,10 +50,6 @@ void *xen_be_map_grant_refs(struct XenLegacyDevice *xendev, uint32_t *refs,
 void xen_be_unmap_grant_refs(struct XenLegacyDevice *xendev, void *ptr,
                              uint32_t *refs, unsigned int nr_refs);
 
-int xen_be_copy_grant_refs(struct XenLegacyDevice *xendev,
-                           bool to_domain, XenGrantCopySegment segs[],
-                           unsigned int nr_segs);
-
 static inline void *xen_be_map_grant_ref(struct XenLegacyDevice *xendev,
                                          uint32_t ref, int prot)
 {
@@ -70,6 +66,5 @@ static inline void xen_be_unmap_grant_ref(struct XenLegacyDevice *xendev,
 void xen_config_cleanup(void);
 int xen_config_dev_vfb(int vdev, const char *type);
 int xen_config_dev_vkbd(int vdev);
-int xen_config_dev_console(int vdev);
 
 #endif /* HW_XEN_LEGACY_BACKEND_H */
-- 
2.43.0


