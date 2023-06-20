Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 096FF737298
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:17:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552002.861901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBez3-0000g8-JR; Tue, 20 Jun 2023 17:17:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552002.861901; Tue, 20 Jun 2023 17:17:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBez3-0000Y9-CS; Tue, 20 Jun 2023 17:17:37 +0000
Received: by outflank-mailman (input) for mailman id 552002;
 Tue, 20 Jun 2023 17:17:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBez1-0005QM-47
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:17:35 +0000
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [2607:f8b0:4864:20::b2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5758b775-0f8e-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 19:17:32 +0200 (CEST)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-bacf685150cso4920969276.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:17:32 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 f81-20020a25cf54000000b00bcc0f2e4f05sm461938ybg.59.2023.06.20.10.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:17:30 -0700 (PDT)
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
X-Inumbo-ID: 5758b775-0f8e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281451; x=1689873451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0+IH6WutOOhss8a6x2jgwcV2LXw+L6iCti+oajsAV0=;
        b=R12VZbvVmViVHNuFRP0d8ysgoYTijNG9Dm9PqMQpio4eNeBCvyuInefSHdIn+uUFhP
         Tu6svVi9RoLuhymnDHSTc5owwsIbgdM+oBmFZBD0S2UtEXX/vT3pPy0z31Zq6XoNWBlZ
         ohwyrSfng1ANBezTIJWtHbBWKXuO4RYqso5JnwdSdETgBSNpz/5rSgsJsAe36slFowgf
         xWuP1xJZDCIfkUzYHZm6zJ9wwsrfYiV5gOaYMGFUCKOvFEhBjK35WX9ICqDJ0X6Px8za
         sqZXT+QfOoIpTfoI451s3puwqycegEbJgKk7JfiiH1aA45BZy1KXJrgX6GxCnSfA/+H7
         G/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281451; x=1689873451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0+IH6WutOOhss8a6x2jgwcV2LXw+L6iCti+oajsAV0=;
        b=StmgAjKkx6BJGyWY3Tg+9UN1f7bfVQpAqX13NJtUwnD7/oNgWfrWMSu3dHjEXUizrL
         n9eVManrMphtF90U9V73k0mzKlxTHLsDYA42RgNdXwP0tQoffbAuPjioqCVLHrDaHNg1
         TZyRQsH4+BwGUMlkasSxSbOFbnXY1sZYKZgvgkNlPAdrx90UXqD9q/MK4aV6pvqtYi+/
         HtH423i4IXDG00nFjiZXNyS5b4YHEGNrlZKuVjjmjSYW0HQwf36oR81TxkuMDFseMLxd
         t+Dh12Lg1/Brwqdy8BVFtknYk6LFTANK0GMqVtJWs6CGhBEFKT1OUMwX4XUZu8Mqhbwu
         cawA==
X-Gm-Message-State: AC+VfDy6ojnJIUIrC27kkGvGRI6tRMdAW5w3zBiQrZPxVUujlOxdGd8b
	DsXGCd2C92Zcv6xwoKL16P0mCEOan/YGqA==
X-Google-Smtp-Source: ACHHUZ4OcSi/v7pNBl5g5dWsqt/1R98rs9PycPxVdap3h+BGz0V8h3JwT18jdLRU6sUQkmVbTLNoXQ==
X-Received: by 2002:a5b:88e:0:b0:bc9:e58c:bfea with SMTP id e14-20020a5b088e000000b00bc9e58cbfeamr10556234ybq.16.1687281451157;
        Tue, 20 Jun 2023 10:17:31 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Joel Upham <jupham125@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 12/12] libxl_dm: handle the new 6 port ahci controller
Date: Tue, 20 Jun 2023 13:15:52 -0400
Message-Id: <7556e5b5ae930a7f331293f1a87c1e7f68e8a214.1687215890.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687215890.git.jupham125@gmail.com>
References: <cover.1687215890.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds support to allow for 6 emulated devices on a
controller, and handling cdrom drives properly. This is not from the
original patch series.

Signed-off-by: Joel Upham <jupham125@gmail.com>
---
 tools/libs/light/libxl_dm.c | 40 ++++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 17bc2113e1..792dbc4383 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1937,29 +1937,51 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
 
             if (disks[i].is_cdrom) {
                 const char *drive_id;
-                if (disk > 4) {
+                if (disk > 4 && b_info->device_model_machine == LIBXL_DEVICE_MODEL_MACHINE_I440) {
                     LOGD(WARN, guest_domid, "Emulated CDROM can be only one of the first 4 disks.\n"
                          "Disk %s will be available via PV drivers but not as an "
                          "emulated disk.",
                          disks[i].vdev);
                     continue;
+                } else if (disk > 6 && 
+                           b_info->device_model_machine == LIBXL_DEVICE_MODEL_MACHINE_Q35) {
+                    LOGD(WARN, guest_domid, "Emulated CDROM can be only one of the first 6 disks.\n"
+                         "Disk %s will be available via PV drivers but not as an "
+                         "emulated disk.",
+                         disks[i].vdev);
+                    continue;
                 }
+		if (b_info->device_model_machine == LIBXL_DEVICE_MODEL_MACHINE_I440) {
+                     drive_id = GCSPRINTF("ide-%i", dev_number);
+                     drive = GCSPRINTF("if=none,readonly=on,id=%s", drive_id);
 
-                drive_id = GCSPRINTF("ide-%i", dev_number);
-                drive = GCSPRINTF("if=none,readonly=on,id=%s", drive_id);
-
-                if (target_path)
-                    drive = libxl__sprintf(gc, "%s,file=%s,format=%s",
-                                           drive, target_path, format);
+                    if (target_path)
+                        drive = libxl__sprintf(gc, "%s,file=%s,format=%s",
+                                               drive, target_path, format);
 
-                flexarray_vappend(dm_args,
+                    flexarray_vappend(dm_args,
                     "-drive", drive,
                     "-device",
                     GCSPRINTF("ide-cd,id=%s,drive=%s,bus=ide.%u,unit=%u",
                               drive_id, drive_id,
                               disk / 2, disk % 2),
                     NULL);
-                continue;
+                   continue;
+                } else {
+                    drive_id = GCSPRINTF("sata-0-%i", dev_number);
+                    drive = GCSPRINTF("if=none,readonly=on,id=%s", drive_id);
+                        if (target_path)
+                            drive = libxl__sprintf(gc, "%s,file=%s,format=%s",
+                                                   drive, target_path, format);
+
+                        flexarray_vappend(dm_args,
+                            "-drive", drive,
+                            "-device",
+                            GCSPRINTF("ide-cd,id=%s,drive=%s,bus=ide.0",
+                                      drive_id, drive_id),
+                            NULL);
+                        continue;
+                }
             } else {
                 /*
                  * Explicit sd disks are passed through as is.
-- 
2.34.1


