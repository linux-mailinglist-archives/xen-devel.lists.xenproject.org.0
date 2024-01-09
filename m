Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8A2828AAD
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 18:06:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664810.1034941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNFY8-0000dr-4X; Tue, 09 Jan 2024 17:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664810.1034941; Tue, 09 Jan 2024 17:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNFY8-0000Yc-1L; Tue, 09 Jan 2024 17:06:00 +0000
Received: by outflank-mailman (input) for mailman id 664810;
 Tue, 09 Jan 2024 17:05:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qgrd=IT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rNFY7-0000WK-4L
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 17:05:59 +0000
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [2607:f8b0:4864:20::734])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b5eaab1-af11-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 18:05:58 +0100 (CET)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-7831e87ba13so220446385a.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 09:05:58 -0800 (PST)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 dt15-20020a05620a478f00b0077f435ed844sm938738qkb.112.2024.01.09.09.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 09:05:56 -0800 (PST)
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
X-Inumbo-ID: 5b5eaab1-af11-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704819957; x=1705424757; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0PZby6BxJlkqBCgAX+pIJcCzjfBuPqSrxzw4k3aYx8=;
        b=ZDkJEtvdBKUQ7U9jJTdgZWobYYvCaQkFXL4k739XxGX67NWoJOdrNqlZ6FM1Vlif7q
         UTkuXbkRm3yDn+baHgsD3YPu/HtsfO3Dg33FJWOiHUi10z7xLtpPcO4h3a8JELVvzidd
         XUS3C8F2qzt8hBsK7zCdfTfClr1dfMIJSuVfxnh0HDBMIVq44cjrgo11I6vutTce/cbW
         hBj8xB49/OEyr0dXFQHRmWO9CewL2wm0b2fkAD5NZFOuGsPxx/8MtqdD9UgEm1257OYx
         ioxnxx9hthb81oE3vYAFR8ateksamXLFFkdt13nyAjWrilTq6IqdeqWMpParKr47SC7Z
         k8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704819957; x=1705424757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B0PZby6BxJlkqBCgAX+pIJcCzjfBuPqSrxzw4k3aYx8=;
        b=xAPnoNJX1rbb8bzVaPh2din9oUkincbehlsucTrEOOpwsuYxPVsN9jTcGD1/Ods92J
         PC2qJ4y1iqBBsdWr+dItuVsTqXv5nsRlkXVQW1l9SFCiTamn9u7MWbXIXvAs/erR7xmj
         3hozkkTJPC0aRkMe7zUfE+BNG9crazvaTvJbwLaVsBfNAX4NztrjxxRxHFlibWCD+/no
         ICHjONwvs76QHcNHqZ2EzrC8Ws7ncWdrVOaayXntkwyzdJ+V47KbvuMEc3pumWLJ5/wb
         sK71U8lO+wU7xpbOQR2qgFbjb6JqdTsGTbX5nFhixmyMtqUSH9cr5ZvdGflUYufx5qsK
         czFw==
X-Gm-Message-State: AOJu0YyTg8AqcedM3+Yh1ZKnGlqlRalEei6fFDEJoLc5JhMoMWnla/1f
	fPrCm6uix4rRT8BQicoG9o9UFXCfkx4=
X-Google-Smtp-Source: AGHT+IEj7HQxGa690Yfp7Wjp6VYnpuyyqaztpvN+cfh8DppYJuymX/7PNvEPnu8bJOjC9KvJ7dCcmw==
X-Received: by 2002:a05:620a:166f:b0:783:1c3e:6825 with SMTP id d15-20020a05620a166f00b007831c3e6825mr3984152qko.153.1704819956714;
        Tue, 09 Jan 2024 09:05:56 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/2] libxl: Fix segfault in device_model_spawn_outcome
Date: Tue,  9 Jan 2024 12:05:39 -0500
Message-ID: <20240109170540.38239-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109170540.38239-1-jandryuk@gmail.com>
References: <20240109170540.38239-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libxl__spawn_qdisk_backend() explicitly sets guest_config to NULL when
starting QEMU (the usual launch through libxl__spawn_local_dm() has a
guest_config though).

Bail early on a NULL guest_config/d_config.  This skips the QMP queries
for chardevs and VNC, but this xenpv QEMU instance isn't expected to
provide those - only qdisk (or 9pfs backends after an upcoming change).

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libs/light/libxl_dm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index f7c796011d..6ef16ad2a0 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -3161,8 +3161,8 @@ static void device_model_spawn_outcome(libxl__egc *egc,
 
     /* Check if spawn failed */
     if (rc) goto out;
-
-    if (d_config->b_info.device_model_version
+    /* d_config is NULL for xl devd/libxl__spawn_qemu_xenpv_backend(). */
+    if (d_config && d_config->b_info.device_model_version
             == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN) {
         rc = libxl__ev_time_register_rel(ao, &dmss->timeout,
                                          devise_model_postconfig_timeout,
-- 
2.43.0


