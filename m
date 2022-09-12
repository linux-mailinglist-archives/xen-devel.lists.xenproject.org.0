Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B405B5A17
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 14:25:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405798.648231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXiVQ-0001nr-1K; Mon, 12 Sep 2022 12:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405798.648231; Mon, 12 Sep 2022 12:25:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXiVP-0001lE-UX; Mon, 12 Sep 2022 12:25:39 +0000
Received: by outflank-mailman (input) for mailman id 405798;
 Mon, 12 Sep 2022 12:25:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2z8A=ZP=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oXiVO-0001jo-Gz
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 12:25:38 +0000
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [2607:f8b0:4864:20::831])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 018f9049-3296-11ed-a31c-8f8a9ae3403f;
 Mon, 12 Sep 2022 14:25:37 +0200 (CEST)
Received: by mail-qt1-x831.google.com with SMTP id r20so5265733qtn.12
 for <xen-devel@lists.xenproject.org>; Mon, 12 Sep 2022 05:25:37 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:cc03:373b:6dc6:a951])
 by smtp.gmail.com with ESMTPSA id
 f1-20020ac87f01000000b0031d283f4c4dsm6705092qtk.60.2022.09.12.05.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 05:25:22 -0700 (PDT)
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
X-Inumbo-ID: 018f9049-3296-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=V33BKHTi+CTctDhgtOfP1KF/zJZENPtCD+zRgxvpiFQ=;
        b=n66CkPP/jpCs8+8ebpJA+lRFwv18BalWVRObdIA5HywX88tSB7vZ8uMMafdENRf9DZ
         FI2EdcBeIJ86t6mDbLmDvvLwtRLOS/9yLiKGwaBuX73foAdXwRxdUUGAD1DoPZ8toGNJ
         SXEnI7oPDrjSqEue+0B0jSTk4ueJyMHMFCcgRCAh/tHeOE1mr+FV+HEYqTPjnQREsPwU
         ZdeW5+y9+IXHs6dXuTHHd12qZLEfGuFuIDZEcyPB+Xr/x520Ufxn6QPLwD1LDxdE7+Ya
         AB1DkVEXv2PX/RGM/xjRi+yioj+CBr4nRoxDAMwwnh3nVdIOyFaQFTeb9iK1AUDrgklU
         xlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=V33BKHTi+CTctDhgtOfP1KF/zJZENPtCD+zRgxvpiFQ=;
        b=NqnsmttgEnp5G8wxnSbcnTghXn5kCutPvwsvzhQDUyMzb+lgbr9qzmrg9p+d7FTohv
         5OA6TpWl+YaRE0RCvY2/Q9U0SdPQtTElZ4UYeDs3N8Zz2FBEtzD/fCJX4XDemAzEWJWI
         7d4L6TotkH5HCAiK41M5vKSRYKu/VrD7GDHp9BVKPdHeI5Oap6/zu89q9SUpTELMmepO
         17EiLqVSoa2zh7UTLCsBzWpFpgBV2+ZB++oPwtyk5yb4RS6F7CQKeGFVAaFX6Jt0R8HO
         bX+tHuGeiQVkCsH7rnBimT+AcZboD3t6qNXGFqaxRrybE8ymdsBtyHn5md//d+CsT1oK
         WUag==
X-Gm-Message-State: ACgBeo0a+bqKnSC4x/iVTlT+kHQeI1LBDUpCRKvLLFOVMFGi1qlbHYiq
	ZAfbjBR5vvDrjwxKrxk7yw2Urm6U3QA=
X-Google-Smtp-Source: AA6agR6Q89NHRTrIucyiJfsXV9WxAvd0EHT+kmUzh29EgEAeyTtrzRtuKnIrh1AEmn9hH3EPnCtAyw==
X-Received: by 2002:ac8:5b8c:0:b0:35b:b653:70cb with SMTP id a12-20020ac85b8c000000b0035bb65370cbmr2582169qta.477.1662985536361;
        Mon, 12 Sep 2022 05:25:36 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 3/3] xl/libxl: Add OEM string support to smbios
Date: Mon, 12 Sep 2022 08:22:37 -0400
Message-Id: <20220912122237.5431-4-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220912122237.5431-1-jandryuk@gmail.com>
References: <20220912122237.5431-1-jandryuk@gmail.com>
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
index fa78fba361..ddba1c3a05 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2104,6 +2104,10 @@ Each B<SMBIOS_SPEC_STRING> is a C<KEY=VALUE> string from the following list:
 
 =item B<battery_device_name=STRING>
 
+=item B<oem=STRING>
+
+oem= can be specified up to 99 times.
+
 =back
 
 =item B<ms_vm_genid="OPTION">
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index e084c3540b..51076249b4 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -405,6 +405,7 @@ SmbiosTypeEnclosureSerialNumber SmbiosType = 14
 SmbiosTypeEnclosureAssetTag SmbiosType = 15
 SmbiosTypeBatteryManufacturer SmbiosType = 16
 SmbiosTypeBatteryDeviceName SmbiosType = 17
+SmbiosTypeOem SmbiosType = 18
 )
 
 type Smbios struct {
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index 4f85623c42..12d027a575 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -753,6 +753,7 @@ static int hvm_build_set_xs_values(libxl__gc *gc,
                                    const libxl_domain_build_info *info)
 {
     char *path = NULL;
+    int num_oem = 1;
     int ret = 0;
 
     if (dom->smbios_module.guest_addr_out) {
@@ -773,8 +774,19 @@ static int hvm_build_set_xs_values(libxl__gc *gc,
 
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
index d04207748e..76651eea43 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -436,6 +436,7 @@ libxl_smbios_type = Enumeration("smbios_type", [
     (15, "enclosure_asset_tag"),
     (16, "battery_manufacturer"),
     (17, "battery_device_name"),
+    (18, "oem"),
     ])
 
 libxl_smbios = Struct("smbios", [
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 47521e9924..f9b4db16a6 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1787,6 +1787,9 @@ void parse_config_data(const char *config_source,
         switch (xlu_cfg_get_list(config, "smbios", &smbios, &num_smbios, 0))
         {
         case 0: /* Success */
+        {
+            unsigned int num_oem = 1;
+
             b_info->u.hvm.num_smbios = num_smbios;
             b_info->u.hvm.smbios = xcalloc(num_smbios, sizeof(libxl_smbios));
             for (i = 0; i < num_smbios; i++) {
@@ -1826,12 +1829,22 @@ void parse_config_data(const char *config_source,
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
2.37.3


