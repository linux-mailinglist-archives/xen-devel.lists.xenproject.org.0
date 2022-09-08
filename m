Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7496E5B2729
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 21:52:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403576.645743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWNZ4-0006cs-Fc; Thu, 08 Sep 2022 19:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403576.645743; Thu, 08 Sep 2022 19:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWNZ4-0006aJ-Bt; Thu, 08 Sep 2022 19:51:54 +0000
Received: by outflank-mailman (input) for mailman id 403576;
 Thu, 08 Sep 2022 19:51:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J4jV=ZL=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oWNZ2-0006Gh-9q
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 19:51:52 +0000
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae4d52bb-2faf-11ed-9760-273f2230c3a0;
 Thu, 08 Sep 2022 21:51:51 +0200 (CEST)
Received: by mail-qk1-x730.google.com with SMTP id d15so1315375qka.9
 for <xen-devel@lists.xenproject.org>; Thu, 08 Sep 2022 12:51:51 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 bp33-20020a05620a45a100b006b8e049cf08sm17095814qkb.2.2022.09.08.12.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 12:51:49 -0700 (PDT)
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
X-Inumbo-ID: ae4d52bb-2faf-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=BfIK73LhsgvoonHDGwM8ni7GnGln9k+nUNcjXEorNtg=;
        b=gI/EPdKEfu4OL3Ad95ueCyGYqP0gnXMZU8zy29VWl4kvsy6kmPLM2mOpOdk0GKkW6c
         uDzTYp2KBUVJUreOgiu28sVUEFbAcsd79c+W6kwIc52cel3ecQO3v6schFBn4C5sy7S1
         XNrPsXjAkv2+j/scMaaV8MjoS02oToXzVEyjIRPdblgTCZbmMwrnEkvFWMvtjibqt271
         /cOpugvA2e8EUI5os6iNGTxjD60YiR7aJGDf2EOMA9biJAL0oAG71EaV8Snm7TVVPgzn
         HmGsdzdogTvlYDEghGME1HkuO/J/fIC9/296QF2d65ekCUjKe3jjtzTXcGvDXQ3i6qkH
         7ZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BfIK73LhsgvoonHDGwM8ni7GnGln9k+nUNcjXEorNtg=;
        b=yEuSQ1AhePCHq/j82IUNpgmXTEMQWF5fVFXsxFVEzbt4ZPSfDBx5w7MngDxmZuCtHM
         q2Qx3Ge8wFXZEQbJ8om1unareYHVB6D5Z/qTzJHjhPHU+liXx91m8hN1ev79+Rf5Ltoi
         8fw1Lbh+7z9N892CaSRNRf5VrG9FbZQPBg0cjURBlkBiD74UMSuqYzNVL770xApkkEyB
         szDKCamlIO6qFx03UyzKi0k7CmA+zo6JNmPLEbf0l2qupMgPRLZiRXBTPpTsdwJzQiRB
         /xl2fB6mq+9lw+1pq94ibMxuO/E2jLUSicL3ppyuL9Ylr7z6nnTjmgfOsRsMpVigSLKY
         iVaQ==
X-Gm-Message-State: ACgBeo20YtEwqd1BH83sTQ3Pqm+k5YZb8qGSrCojHXHzTgcgaUq9SAqm
	FNTbK0QQCJxMJQ2NHKHoQx8oeLl6yco=
X-Google-Smtp-Source: AA6agR6+hC/F719d9liH745eJACRB2wYFcMVHq5BW4bw9QgoMTO+/SixWy1Hx/neKt9PnEqpKWfHeQ==
X-Received: by 2002:a05:620a:2b98:b0:6bb:11fc:40b7 with SMTP id dz24-20020a05620a2b9800b006bb11fc40b7mr7978841qkb.467.1662666710145;
        Thu, 08 Sep 2022 12:51:50 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 3/3] xl/libxl: Add OEM string support to smbios
Date: Thu,  8 Sep 2022 15:51:13 -0400
Message-Id: <20220908195113.218201-4-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220908195113.218201-1-jandryuk@gmail.com>
References: <20220908195113.218201-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for OEM strings in the SMBIOS type 11.

hvmloader checks them sequentially, so hide the implementation detail.
Allow multiple plain oem= items and assign the numeric values
internally.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
v2:
Move oem= description to be indented in docs
Re-work oem= description
Re-word oem string limit xl error message
Replace OEM_{1,99) with just OEM and handle in libxl

This change re-introduces the newline before ms_vm_genid.
---
 docs/man/xl.cfg.5.pod.in           |  4 ++++
 tools/golang/xenlight/types.gen.go |  1 +
 tools/libs/light/libxl_dom.c       | 15 +++++++++++++--
 tools/libs/light/libxl_types.idl   |  1 +
 tools/xl/xl_parse.c                | 12 ++++++++++++
 5 files changed, 31 insertions(+), 2 deletions(-)

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
index c3125ed310..0b01e09632 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -753,6 +753,7 @@ static int hvm_build_set_xs_values(libxl__gc *gc,
                                    const libxl_domain_build_info *info)
 {
     char *path = NULL;
+    int num_oem = 1;
     int ret = 0;
 
     if (dom->smbios_module.guest_addr_out) {
@@ -773,8 +774,18 @@ static int hvm_build_set_xs_values(libxl__gc *gc,
 
     for (int i = 0; i < info->u.hvm.num_smbios; i++) {
         char *p;
-        path = GCSPRINTF("/local/domain/%d/"HVM_XS_BIOS_STRINGS"/%s", domid,
-                   libxl_smbios_type_to_string(info->u.hvm.smbios[i].key));
+        if (info->u.hvm.smbios[i].key == LIBXL_SMBIOS_TYPE_OEM) {
+            if (num_oem > 99) {
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
            will use, as defined by HVM_XS_*. That is convert the '_' to '-'. */
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
index 5413c36645..d0f8a14827 100644
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
@@ -1823,6 +1826,15 @@ void parse_config_data(const char *config_source,
                 }
                 free(option);
 
+                if (v == LIBXL_SMBIOS_TYPE_OEM) {
+                    if (num_oem > 99) {
+                        fprintf(stderr,
+                                "xl: smbios limited to 99 oem strings\n");
+                        exit(-ERROR_FAIL);
+                    }
+                    num_oem++;
+                }
+
                 b_info->u.hvm.smbios[i].key = v;
                 b_info->u.hvm.smbios[i].value = value;
             }
-- 
2.37.3


