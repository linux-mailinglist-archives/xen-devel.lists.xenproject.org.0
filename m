Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E93828E9B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 21:48:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664986.1035143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNJ0O-0006GR-Ff; Tue, 09 Jan 2024 20:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664986.1035143; Tue, 09 Jan 2024 20:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNJ0O-0006E1-CL; Tue, 09 Jan 2024 20:47:24 +0000
Received: by outflank-mailman (input) for mailman id 664986;
 Tue, 09 Jan 2024 20:47:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qgrd=IT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rNJ0N-00065f-Lx
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 20:47:23 +0000
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [2607:f8b0:4864:20::832])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49773ba1-af30-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 21:47:22 +0100 (CET)
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-4299400fd94so14397291cf.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 12:47:22 -0800 (PST)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 fh7-20020a05622a588700b00425442a2f32sm1181628qtb.16.2024.01.09.12.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 12:47:20 -0800 (PST)
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
X-Inumbo-ID: 49773ba1-af30-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704833241; x=1705438041; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmDIAatmxct3SyiOSDfQ1Zlj25zPKv9fsM2oRUEHdKU=;
        b=CDCY1hh8Rz7d1hb31I9gqvyt3Sabb9MglsumerW1PF8wrHQOOJLf6u4zHbwkUBry7f
         4fvmHXQrLJBGDgqSYvsddXw829B6N+xKP3arwG66Lidh4/H5JvaNvAMsbTJm5hHzNXu1
         DWq4piaE8u6pwvz4dQrM62yFk6EIOFtd2X6+Y4Vw/vW0E71muXexMLhntL5zZPLp3VJN
         miFN7NetiHpZZqtaRhnGQ7uvxpUmAd/kzM9+vLaRykug+i9LSRR0FcdJLq5OdhTbDxXe
         uuDqxSGdRwYcFz9jSQhMmF6RsKToak9dbXqDCWYaiHJaPfBL64ZGACHxmPJaWWjk4YlX
         efIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704833241; x=1705438041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LmDIAatmxct3SyiOSDfQ1Zlj25zPKv9fsM2oRUEHdKU=;
        b=d37F+hAJjFeP+7ZJv1bbY79Ap5yzL5zQsxqJN+afF5/VeXSmnXLhRm+5XU2vb12p6z
         3Ma7tVF5NpB8g24w5g4qIMwLDwiuYYYnDQZaz3KYb4W//eKSvtHkcrrgceU1033EVjax
         oYmwluDVAHSy8k2Mb9DMUot+lElxU/gH7DFtDsJSBr4ECdnzX4G9siML8I6Y0NVOo/Yl
         3mv7uYag9ZUjmsjGir9yWoQtYemN/hMP/pEqcLcqlycQlEEc1akAJ+MFXfuXyZTGd7V4
         4H7IFrsjykJlVVbcHaJ0Ch5QJD7+Ew4Bm84LVBOtY4fsPUe+/NOEJQkVpII4pvBZYYdx
         WaDQ==
X-Gm-Message-State: AOJu0YzF2yntWqpi1vs3jbHhaOPrr2tfUA9wFe+Sfsm8npW1SXdAsHEE
	4CKqhA75fHy5RnCrd9QE7KxXrCBBrjM=
X-Google-Smtp-Source: AGHT+IG0IOClNAHazYB/C5f+kT4FJpwVJFR67PGWdq0fBU8Keue7kuvgqUmwtb/0T76zcvdaYRG73g==
X-Received: by 2002:ac8:5c0e:0:b0:428:34c5:491e with SMTP id i14-20020ac85c0e000000b0042834c5491emr31195qti.23.1704833241054;
        Tue, 09 Jan 2024 12:47:21 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/2] libxl: Remove cdrom forced QDISK w/ stubdom
Date: Tue,  9 Jan 2024 15:46:54 -0500
Message-ID: <20240109204655.72063-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109204655.72063-1-jandryuk@gmail.com>
References: <20240109204655.72063-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A Linux HVM domain ignores PV block devices with type cdrom.  The
Windows PV drivers also ignore device-type != "disk".  Therefore QEMU's
emulated CD-ROM support is used.  This allows ejection and other CD-ROM
features to work.

With a stubdom, QEMU is running in the stubdom.  A PV disk is still
connected into the stubdom, and then QEMU can emulate the CD-ROM into
the guest.  This removes the need for forcing to a QDISK.  Relax the
checks to support this.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libs/light/libxl_disk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
index b65cad33cc..d1f84ef404 100644
--- a/tools/libs/light/libxl_disk.c
+++ b/tools/libs/light/libxl_disk.c
@@ -192,7 +192,8 @@ static int libxl__device_disk_setdefault(libxl__gc *gc, uint32_t domid,
 
     /* Force Qdisk backend for CDROM devices of guests with a device model. */
     if (disk->is_cdrom != 0 &&
-        libxl__domain_type(gc, domid) == LIBXL_DOMAIN_TYPE_HVM) {
+        libxl__domain_type(gc, domid) == LIBXL_DOMAIN_TYPE_HVM &&
+        !libxl_get_stubdom_id(CTX, domid)) {
         if (!(disk->backend == LIBXL_DISK_BACKEND_QDISK ||
               disk->backend == LIBXL_DISK_BACKEND_UNKNOWN)) {
             LOGD(ERROR, domid, "Backend for CD devices on HVM guests must be Qdisk");
-- 
2.43.0


