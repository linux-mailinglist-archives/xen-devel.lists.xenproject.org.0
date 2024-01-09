Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E08828ADA
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 18:17:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664855.1034981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNFiY-00054A-Kv; Tue, 09 Jan 2024 17:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664855.1034981; Tue, 09 Jan 2024 17:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNFiY-00052L-IH; Tue, 09 Jan 2024 17:16:46 +0000
Received: by outflank-mailman (input) for mailman id 664855;
 Tue, 09 Jan 2024 17:16:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qgrd=IT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rNFiX-00052F-4E
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 17:16:45 +0000
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc614c99-af12-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 18:16:44 +0100 (CET)
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-783269124a8so128115485a.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 09:16:44 -0800 (PST)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 p17-20020ae9f311000000b007832f812b55sm554709qkg.82.2024.01.09.09.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 09:16:41 -0800 (PST)
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
X-Inumbo-ID: dc614c99-af12-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704820602; x=1705425402; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zLntkworFozqUhIj+VSpyXjWsszU3gOI1osMehFczYM=;
        b=Gx5JFo/P3tR4G2uU9AqTxNMxbF/9SiqRKZ7+/ELiQINtLUv48wGegb0lQbsi6CNs80
         RvryR8rO2pO7Jbc550IUZ8WBCbmazv8gYE6U89OBvFC5qt3APlLQHFa2yBjGN/RldQAP
         r97xRZZ8lDOZaD42BTiSjY835Njtnm5xeftAcpBb9ISWJBS/dwulIv9GaK/RsjF6cnsn
         K27d/eLoXXS4AqrnR1d8Qur7KTJlMewicbuBc1Rn5qc2hRTP9qdvqNByA5PfnlOhOxpr
         phd1OMzFuDOMoRWEkpEt/cMmxMKZiIBsjzET5vCaKyWQVZY8iTesr1aC8B0Oe60DxLfp
         2www==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704820602; x=1705425402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zLntkworFozqUhIj+VSpyXjWsszU3gOI1osMehFczYM=;
        b=gizYfgJ/AR0ge/Y1yw0v1Wl26mFEeLqnwsf5GLmwvRCRV8rfkv7veK1jmGVauCZ07m
         gaX7aunwh8nx9wcZirKaZTzjp09Uj061hzl5enPvD0vYVrFP2X2AeVfUANj7HodfHn8w
         oA0tgcmx5JyUZej4NYcXg3hKX8CJuyswuz8XQ5gCNiqgc/rTu/c1xEFpBKTUPVOHR4bo
         Ms/LD4SjzYC5sQesLYxX7vaxIUVjzy7MIOJ2c840BW98IE0qOCPJate6QM70JyVWdXPG
         AuScVkqSN0wc0jnDu80+4B1DaF3O+Wlb1oT6jZ1mvHBHd3cf4sqrL19cxSFzft9ocBPq
         gtmQ==
X-Gm-Message-State: AOJu0YwhsIKY2EI3Pm+mhkayWRWbk2EVXhEkE6A/qPG2jpseKxT6zQD4
	ZJNK0qcS/JIFnmhg35j6lAjt+jhbV/4=
X-Google-Smtp-Source: AGHT+IGpbora5pdnB3/OUkiqC2O3dLZLTuWijKCAy87CFi3pzqDSs3LwcYfbIv4ezQjE5MZHzO/YUA==
X-Received: by 2002:a05:620a:4690:b0:781:bdfe:33b7 with SMTP id bq16-20020a05620a469000b00781bdfe33b7mr8514985qkb.151.1704820602223;
        Tue, 09 Jan 2024 09:16:42 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] libxl: Use vkb=[] for HVMs
Date: Tue,  9 Jan 2024 12:16:31 -0500
Message-ID: <20240109171631.40071-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xl/libxl only applies vkb=[] to PV & PVH guests.  HVM gets only a single
vkb by default, but that can be disabled by the vkb_device boolean.
Notably the HVM vkb cannot be configured, so feature-abs-pointer or the
backend-type cannot be specified.

Re-arrange the logic so that vkb=[] is handled regardless of domain
type.  If vkb is empty or unspecified, follow the vkb_device boolean for
HVMs.  Nothing changes for PVH & PV.  HVMs can now get a configured vkb
instead of just the default one.

The chance for regression is an HVM config with
vkb=["$something"]
vkb_device=false

Which would now get a vkb.

This is useful for vGlass which provides a VKB to HVMs.  vGlass wants to
specify feature-abs-pointer, but that is racily written by vGlass
instead of coming through the xl.cfg.  Unhelpfully, Linux xen-kbdfront
reads the backend nodes without checking that the backend is in
InitWait.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libs/light/libxl_create.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index ce1d431103..39c50b3711 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1771,24 +1771,31 @@ static void domcreate_launch_dm(libxl__egc *egc, libxl__multidev *multidev,
         libxl__device_add(gc, domid, &libxl__virtio_devtype,
                           &d_config->virtios[i]);
 
+    if (d_config->num_vkbs) {
+        for (i = 0; i < d_config->num_vkbs; i++) {
+            libxl__device_add(gc, domid, &libxl__vkb_devtype,
+                              &d_config->vkbs[i]);
+        }
+    } else if (d_config->c_info.type == LIBXL_DOMAIN_TYPE_HVM &&
+               libxl_defbool_val(d_config->b_info.u.hvm.vkb_device)) {
+        libxl_device_vkb vkb;
+
+        libxl_device_vkb_init(&vkb);
+        libxl__device_add(gc, domid, &libxl__vkb_devtype, &vkb);
+        libxl_device_vkb_dispose(&vkb);
+    }
+
     switch (d_config->c_info.type) {
     case LIBXL_DOMAIN_TYPE_HVM:
     {
         libxl__device_console console;
         libxl__device device;
-        libxl_device_vkb vkb;
 
         init_console_info(gc, &console, 0);
         console.backend_domid = state->console_domid;
         libxl__device_console_add(gc, domid, &console, state, &device);
         libxl__device_console_dispose(&console);
 
-        if (libxl_defbool_val(d_config->b_info.u.hvm.vkb_device)) {
-            libxl_device_vkb_init(&vkb);
-            libxl__device_add(gc, domid, &libxl__vkb_devtype, &vkb);
-            libxl_device_vkb_dispose(&vkb);
-        }
-
         dcs->sdss.dm.guest_domid = domid;
         if (libxl_defbool_val(d_config->b_info.device_model_stubdomain))
             libxl__spawn_stub_dm(egc, &dcs->sdss);
@@ -1816,11 +1823,6 @@ static void domcreate_launch_dm(libxl__egc *egc, libxl__multidev *multidev,
                               &d_config->vfbs[i]);
         }
 
-        for (i = 0; i < d_config->num_vkbs; i++) {
-            libxl__device_add(gc, domid, &libxl__vkb_devtype,
-                              &d_config->vkbs[i]);
-        }
-
         if (d_config->b_info.arch_arm.vuart == LIBXL_VUART_TYPE_SBSA_UART) {
             init_console_info(gc, &vuart, 0);
             vuart.backend_domid = state->console_domid;
-- 
2.43.0


