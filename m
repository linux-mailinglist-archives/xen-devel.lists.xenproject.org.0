Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C418A6ACF53
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 21:41:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507111.780350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZHdZ-0001dq-98; Mon, 06 Mar 2023 20:40:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507111.780350; Mon, 06 Mar 2023 20:40:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZHdZ-0001ar-4v; Mon, 06 Mar 2023 20:40:49 +0000
Received: by outflank-mailman (input) for mailman id 507111;
 Mon, 06 Mar 2023 20:40:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r4JU=66=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pZHdY-0001Yf-1N
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 20:40:48 +0000
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [2607:f8b0:4864:20::82a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a586ee2-bc5f-11ed-a550-8520e6686977;
 Mon, 06 Mar 2023 21:40:44 +0100 (CET)
Received: by mail-qt1-x82a.google.com with SMTP id l18so12121307qtp.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Mar 2023 12:40:44 -0800 (PST)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:2825:cedc:1289:7391])
 by smtp.gmail.com with ESMTPSA id
 j10-20020ac8440a000000b003b82a07c4d6sm8086316qtn.84.2023.03.06.12.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 12:40:42 -0800 (PST)
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
X-Inumbo-ID: 2a586ee2-bc5f-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678135242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vfk/rPawOAJLlZCQLkL2VKm1IzggPUh3nbzo39BZfvE=;
        b=pwib/E7fZpMEgZj6q46rp1M996L8fifkdOsW0gnX3Af6a4vYp+P1tlK7GbElvhYOjS
         6QGFp0mUGfCQEjOe/8yWcFyPkc/3Q20aIkRTjDCyGMndNA9iwth9GPSS3Po3XCSwaL6x
         qAXze8FXhkMtayNkHrnps9TCNG3wDUjHPpe5ADetj6gx29Ln651lFrf/E/D6g9SxX+po
         BSucj+v8OIi+wqHfty6d3H3vpTk6HoLptbkDdFORu4jerCf+eDf96gIK5xG7hn5inpmk
         iEapkUIXmfSoOILJwPJF5+LfuDB9Aqs1qHEp5jTKKx0h8x6oGJKQY9JopKTDFf/VdlVU
         +DPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678135242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vfk/rPawOAJLlZCQLkL2VKm1IzggPUh3nbzo39BZfvE=;
        b=klTR/O4MxAQTpGO2lTihz0ONsv8CJIg9fAYaImTutCSnJ/pUYpxfi0etZxCUR0X0Aq
         0WI7VYlSsVdgGdEE2Wrnu3bQ9pqZxyEgPJGyLL4mjPwgUOGfEYYtHbE08UgMz/D1vT1s
         gnNVEtt4JCVNSREX3eaiEpv9Lzf3OHUjDu4GPtwIZYfitb5nBh+IKGxA/YZ3q03GL248
         5duQGlIUQBKye+CeDCsE2eeA6xSV9lkS94ODuUhWWOeEen5TbY/9m+SXOFiWjGwDnnIC
         7mWpdvj/VeHyh7pve/W8yam8DA6yNT2gUYx9HdQGJv3jjE0UuTfXT8z1yCBEVRTJNNQk
         5wig==
X-Gm-Message-State: AO0yUKXfGnxTH67onf7Ql5EvdKwvX3RIXk2iUIhjTUwGWPxJUyRl8yuP
	L5cTNOArzHKANzzVl1YBewHij+bYJz0=
X-Google-Smtp-Source: AK7set9QDBiBf+sZ/r6SIHghP2w3mQO/LyXVMA0sMDoSswzRUsoDvnNEF54FensgRkQH04z/GIaIsA==
X-Received: by 2002:a05:622a:5c9:b0:3bf:d9a9:25e5 with SMTP id d9-20020a05622a05c900b003bfd9a925e5mr18486750qtb.30.1678135242687;
        Mon, 06 Mar 2023 12:40:42 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 3/3] xl/libxl: Add OEM string support to smbios
Date: Mon,  6 Mar 2023 15:40:24 -0500
Message-Id: <20230306204024.124882-4-jandryuk@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306204024.124882-1-jandryuk@gmail.com>
References: <20230306204024.124882-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for OEM strings in the SMBIOS type 11.

hvmloader checks them sequentially, so hide the implementation detail.
Allow multiple plain oem= items and assign the numeric values
internally.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
v3:
Add } from patch 2 to parse_config_data
Use EXIT_FAILURE
Print error message in libxl for > 99 OEM strings

v2:
Move oem= description to be indented in docs
Re-work oem= description
Re-word oem string limit xl error message
Replace OEM_{1,99) with just OEM and handle in libxl

This change re-introduces the newline before ms_vm_genid.
---
 docs/man/xl.cfg.5.pod.in           |  4 ++++
 tools/golang/xenlight/types.gen.go |  1 +
 tools/libs/light/libxl_dom.c       | 16 ++++++++++++++--
 tools/libs/light/libxl_types.idl   |  1 +
 tools/xl/xl_parse.c                | 13 +++++++++++++
 5 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index bc4386ee96..10f37990be 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2122,6 +2122,10 @@ Each B<SMBIOS_SPEC_STRING> is a C<KEY=VALUE> string from the following list:
 
 =item B<battery_device_name=STRING>
 
+=item B<oem=STRING>
+
+oem= can be specified up to 99 times.
+
 =back
 
 =item B<ms_vm_genid="OPTION">
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 2d8bc7654a..a7c17699f8 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -411,6 +411,7 @@ SmbiosTypeEnclosureSerialNumber SmbiosType = 14
 SmbiosTypeEnclosureAssetTag SmbiosType = 15
 SmbiosTypeBatteryManufacturer SmbiosType = 16
 SmbiosTypeBatteryDeviceName SmbiosType = 17
+SmbiosTypeOem SmbiosType = 18
 )
 
 type Smbios struct {
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index 5433301f70..25fb716084 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -755,6 +755,7 @@ static int hvm_build_set_xs_values(libxl__gc *gc,
                                    const libxl_domain_build_info *info)
 {
     char *path = NULL;
+    int num_oem = 1;
     int ret = 0;
 
     if (dom->smbios_module.guest_addr_out) {
@@ -775,8 +776,19 @@ static int hvm_build_set_xs_values(libxl__gc *gc,
 
     for (int i = 0; i < info->u.hvm.num_smbios; i++) {
         char *p;
-        path = GCSPRINTF("/local/domain/%d/"HVM_XS_BIOS_STRINGS"/%s", domid,
-                   libxl_smbios_type_to_string(info->u.hvm.smbios[i].key));
+        if (info->u.hvm.smbios[i].key == LIBXL_SMBIOS_TYPE_OEM) {
+            if (num_oem > 99) {
+                LOGD(ERROR, domid, "More than 99 SMBIOS OEM strings specified");
+                ret = ERROR_INVAL;
+                goto err;
+            }
+            path = GCSPRINTF("/local/domain/%d/"HVM_XS_OEM_STRINGS, domid,
+                             num_oem);
+            num_oem++;
+        } else {
+            path = GCSPRINTF("/local/domain/%d/"HVM_XS_BIOS_STRINGS"/%s", domid,
+                       libxl_smbios_type_to_string(info->u.hvm.smbios[i].key));
+        }
 
         /* Convert libxl_smbios_type string to xenstore path that hvmloader
          * will use, as defined by HVM_XS_*. That is convert the '_' to '-'. */
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index df4dd36697..c10292e0d7 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -441,6 +441,7 @@ libxl_smbios_type = Enumeration("smbios_type", [
     (15, "enclosure_asset_tag"),
     (16, "battery_manufacturer"),
     (17, "battery_device_name"),
+    (18, "oem"),
     ])
 
 libxl_smbios = Struct("smbios", [
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index ba219024b6..e344d4fda3 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1864,6 +1864,9 @@ void parse_config_data(const char *config_source,
         switch (xlu_cfg_get_list(config, "smbios", &smbios, &num_smbios, 0))
         {
         case 0: /* Success */
+        {
+            unsigned int num_oem = 1;
+
             b_info->u.hvm.num_smbios = num_smbios;
             b_info->u.hvm.smbios = xcalloc(num_smbios, sizeof(libxl_smbios));
             for (i = 0; i < num_smbios; i++) {
@@ -1903,12 +1906,22 @@ void parse_config_data(const char *config_source,
                     exit(EXIT_FAILURE);
                 }
 
+                if (type == LIBXL_SMBIOS_TYPE_OEM) {
+                    if (num_oem > 99) {
+                        fprintf(stderr,
+                                "xl: smbios limited to 99 oem strings\n");
+                        exit(EXIT_FAILURE);
+                    }
+                    num_oem++;
+                }
+
                 b_info->u.hvm.smbios[i].key = type;
                 b_info->u.hvm.smbios[i].value = xstrdup(value);
 
                 free(option);
             }
             break;
+        }
         case ESRCH: /* Option not present */
             break;
         default:
-- 
2.39.2


