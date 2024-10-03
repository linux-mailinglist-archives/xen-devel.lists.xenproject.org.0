Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D2698F6A7
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 20:57:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809818.1222358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swR0d-0007pN-8d; Thu, 03 Oct 2024 18:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809818.1222358; Thu, 03 Oct 2024 18:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swR0d-0007nI-4i; Thu, 03 Oct 2024 18:57:07 +0000
Received: by outflank-mailman (input) for mailman id 809818;
 Thu, 03 Oct 2024 18:57:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wyt=Q7=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1swR0b-0007Yu-SU
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 18:57:05 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4840cf42-81b9-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 20:57:05 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5399041167cso2277775e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 11:57:05 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539a82510b0sm239556e87.40.2024.10.03.11.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 11:57:03 -0700 (PDT)
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
X-Inumbo-ID: 4840cf42-81b9-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727981825; x=1728586625; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5QkDAThvHzn8nk+HGJi0H/5a08f7RDTFwzrMcXuWa4E=;
        b=SrI1hVTlLwfC+637UQhhV2LuZAMFGVnfVVVrRwBK5e0G6GFNbEikqpPWw+jCN6JuwJ
         sf2CiBNOs2Db+KDeyHvtmWdUfjTjGaGFqIOdr5ZYzCK2mYvw5SfLP1pwEduFicnnjBL9
         nrCYFIe3zsPCxRfUF0IiT9Sb20DZY+6GMF1Itrj+wJTVH3qjMimvMmArvESRiTDAX7SY
         BmyKDTQgXEK1us4URnzFRIpJ7y5wrgJ3i31VTXUDI1PsS91uqdtRmLO46N4FV7lwMjY/
         0cThhib8k/AvOfujRJLP4d5TyK4dj6qRR92ELG4vSlqtbnt209/KDDrlAm2Rp/aM6VKI
         Ys9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727981825; x=1728586625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5QkDAThvHzn8nk+HGJi0H/5a08f7RDTFwzrMcXuWa4E=;
        b=gJB7+ZqAttJK992nOA10pDrr36MYgo5bnlsFTIJr3FkTT0zMmrvWUieRrcdCQq17VV
         4J4HCvHOMqO5yfh0x4Fa5tDW9UpKLeHaMNXES0H5FpXyh89vFabH20Cn6r61PvkdrAhg
         AJTZQne49nG7FiMj4GielcSzo/spjgE2dXer9wgd0mIaPyalrFarQNGUe9Od2meW/CQm
         zQJVbpZN0F0KUbn5xMzkfB5ymX4oHEqG5orE2yNfOgPVBYjZyVlWntZtFrMok9+TRxFv
         I66Lw9xp5za8UIyWoSlolJ6wtxpHmdrxQgJK0XaGNION9zojghs5IofFPa3hokFbVlwV
         BlMg==
X-Forwarded-Encrypted: i=1; AJvYcCU1Iwi4rwH7EaUOEeHz1/MAsXZ4YN8gdYMi2cNl8xRks9tRgtqyoPAZbSZlzCEIRQRNyAm507vAOco=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5B+JG2rOhtjZKvedYZU754YwHJ1cUF86YFDvAl3xa78FSOECw
	F5TBBkDBvlZpJUT6J0BWps2WjNf4ZH6vT+euwsspdAXcgOnRDdiA
X-Google-Smtp-Source: AGHT+IH+YJp2VQbmukXoxo+KucnNQOI52hduggo5ZWOqudKcMJoLnpK4pu8dv199MzOrbVPSxfrmWw==
X-Received: by 2002:a05:6512:b29:b0:530:ab68:25c5 with SMTP id 2adb3069b0e04-539ab84e022mr346818e87.2.1727981824696;
        Thu, 03 Oct 2024 11:57:04 -0700 (PDT)
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
Subject: [PULL v2 1/5] hw/xen: Remove deadcode
Date: Thu,  3 Oct 2024 20:56:50 +0200
Message-ID: <20241003185655.1480819-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241003185655.1480819-1-edgar.iglesias@gmail.com>
References: <20241003185655.1480819-1-edgar.iglesias@gmail.com>
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


