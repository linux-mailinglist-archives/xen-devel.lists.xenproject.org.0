Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 476A458F352
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 21:49:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384001.619278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrhS-0008Ds-I7; Wed, 10 Aug 2022 19:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384001.619278; Wed, 10 Aug 2022 19:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrhS-0008BG-CO; Wed, 10 Aug 2022 19:49:06 +0000
Received: by outflank-mailman (input) for mailman id 384001;
 Wed, 10 Aug 2022 19:49:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UxBI=YO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oLrhQ-0007rn-RW
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 19:49:05 +0000
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [2607:f8b0:4864:20::82b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c7242b0-18e5-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 21:49:03 +0200 (CEST)
Received: by mail-qt1-x82b.google.com with SMTP id u12so12077995qtk.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 12:49:03 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:289e:b898:c7de:df6c])
 by smtp.gmail.com with ESMTPSA id
 bk9-20020a05620a1a0900b006b978b521c8sm520897qkb.69.2022.08.10.12.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 12:49:01 -0700 (PDT)
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
X-Inumbo-ID: 7c7242b0-18e5-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=UYR0+uohvDIXv206Eq7xqYEcXJtgPEmS478u5ZUE58M=;
        b=LLmFZQIXXQR5s7aFFARrKKhoL7RS9PfJtLk+hCdCy0aMZ7snwvIODOVNup8KuprMGb
         Dt1ibz50BR8ZcFRg2gBumMj8lDOPAI/hxXdJngGeaTVy9Slir4k8qV8LujOQuiC1WpU+
         b6AagDGv8Nke6toKpx9fSOSRje6XxLk5IFh8BvgB9vKkYwuptPyalD3eBHWzLZrZkZ7X
         O6xSerIYCA00eutDFTqEWkT/bW/V2K+B8VSDZVHkx90akTn65fGczEtNfX5nJm4s3vk2
         TeAnCbFtjDoTktVlhKTBTUYwgstSa8POgeVm/4Z2FFSmXh0g076FT/G6xIImGuSjGgMk
         UzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=UYR0+uohvDIXv206Eq7xqYEcXJtgPEmS478u5ZUE58M=;
        b=tzxVNKOvXrwjTrk+rHeWKBeuyqPMQTB4kfc8xV+cmtU/6UUxnGPHlSmrnJMokHDlL7
         S8rpS9OEDYqC89MYfAh+FPzmnll3O9WLb3nBRbPcFInzT/3iw40ENcXPT4e/DxyD4TFD
         VxND4K9f3sCquSpZoJ6dZaZSu3lVNDAtGiMiHTpQzfbcTWNfM99fLzCyYnrm7o8P5C6I
         ERmSXbA5Za31HZvB2IFtFra0WnwN/oQ6Z/GN0oguySp5Jkd1O23zUcdJGdCnHPFanYi9
         oVFi93UnlWfBbWnNzY2Cyw9sk5QIIyRwqG6L/25LDKJ2ZV150B0sNpXjaahd/T7JwAHD
         F8qQ==
X-Gm-Message-State: ACgBeo3fT0nNG59z17bh5JRMIYR2Gpx4zzNKAX4Od/lBefkz9EYKUoVc
	wdy09hdm3uWEfdqsMFieuwnBWKdqclI=
X-Google-Smtp-Source: AA6agR40LUsRMZXNfAIHlTIAI+WhtV2fN3eSZ/8pzxbMagSPZBUttDo96OvAI48aq5j3PvHaDDRguA==
X-Received: by 2002:ac8:7e96:0:b0:340:be9a:8ce1 with SMTP id w22-20020ac87e96000000b00340be9a8ce1mr25787460qtj.228.1660160942481;
        Wed, 10 Aug 2022 12:49:02 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 3/3] xl/libxl: Add OEM string support to smbios
Date: Wed, 10 Aug 2022 15:48:27 -0400
Message-Id: <20220810194827.103428-4-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810194827.103428-1-jandryuk@gmail.com>
References: <20220810194827.103428-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for OEM strings in the SMBIOS type 11.

hvmloader checks them sequentially, so hide the implementation detail.
Allow multiple plain oem= items and assign the numeric values
internally.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
This change re-introduces the newline before ms_vm_genid.
---
 docs/man/xl.cfg.5.pod.in           |  4 ++
 tools/golang/xenlight/types.gen.go | 99 ++++++++++++++++++++++++++++++
 tools/libs/light/libxl_types.idl   | 99 ++++++++++++++++++++++++++++++
 tools/xl/xl_parse.c                | 15 +++++
 4 files changed, 217 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 7edf5d23f3..7947bf07ea 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2104,8 +2104,12 @@ Each B<SMBIOS_SPEC_STRING> is a C<KEY=VALUE> string from the following list:
 
 =item B<battery_device_name=STRING>
 
+=item B<oem=STRING>
+
 =back
 
+oem= strings can be specified mutiple times up to a limit of 99.
+
 =item B<ms_vm_genid="OPTION">
 
 Provide a VM generation ID to the guest.
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index e084c3540b..bd5752f634 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -405,6 +405,105 @@ SmbiosTypeEnclosureSerialNumber SmbiosType = 14
 SmbiosTypeEnclosureAssetTag SmbiosType = 15
 SmbiosTypeBatteryManufacturer SmbiosType = 16
 SmbiosTypeBatteryDeviceName SmbiosType = 17
+SmbiosTypeOem1 SmbiosType = 18
+SmbiosTypeOem2 SmbiosType = 19
+SmbiosTypeOem3 SmbiosType = 20
+SmbiosTypeOem4 SmbiosType = 21
+SmbiosTypeOem5 SmbiosType = 22
+SmbiosTypeOem6 SmbiosType = 23
+SmbiosTypeOem7 SmbiosType = 24
+SmbiosTypeOem8 SmbiosType = 25
+SmbiosTypeOem9 SmbiosType = 26
+SmbiosTypeOem10 SmbiosType = 27
+SmbiosTypeOem11 SmbiosType = 28
+SmbiosTypeOem12 SmbiosType = 29
+SmbiosTypeOem13 SmbiosType = 30
+SmbiosTypeOem14 SmbiosType = 31
+SmbiosTypeOem15 SmbiosType = 32
+SmbiosTypeOem16 SmbiosType = 33
+SmbiosTypeOem17 SmbiosType = 34
+SmbiosTypeOem18 SmbiosType = 35
+SmbiosTypeOem19 SmbiosType = 36
+SmbiosTypeOem20 SmbiosType = 37
+SmbiosTypeOem21 SmbiosType = 38
+SmbiosTypeOem22 SmbiosType = 39
+SmbiosTypeOem23 SmbiosType = 40
+SmbiosTypeOem24 SmbiosType = 41
+SmbiosTypeOem25 SmbiosType = 42
+SmbiosTypeOem26 SmbiosType = 43
+SmbiosTypeOem27 SmbiosType = 44
+SmbiosTypeOem28 SmbiosType = 45
+SmbiosTypeOem29 SmbiosType = 46
+SmbiosTypeOem30 SmbiosType = 47
+SmbiosTypeOem31 SmbiosType = 48
+SmbiosTypeOem32 SmbiosType = 49
+SmbiosTypeOem33 SmbiosType = 50
+SmbiosTypeOem34 SmbiosType = 51
+SmbiosTypeOem35 SmbiosType = 52
+SmbiosTypeOem36 SmbiosType = 53
+SmbiosTypeOem37 SmbiosType = 54
+SmbiosTypeOem38 SmbiosType = 55
+SmbiosTypeOem39 SmbiosType = 56
+SmbiosTypeOem40 SmbiosType = 57
+SmbiosTypeOem41 SmbiosType = 58
+SmbiosTypeOem42 SmbiosType = 59
+SmbiosTypeOem43 SmbiosType = 60
+SmbiosTypeOem44 SmbiosType = 61
+SmbiosTypeOem45 SmbiosType = 62
+SmbiosTypeOem46 SmbiosType = 63
+SmbiosTypeOem47 SmbiosType = 64
+SmbiosTypeOem48 SmbiosType = 65
+SmbiosTypeOem49 SmbiosType = 66
+SmbiosTypeOem50 SmbiosType = 67
+SmbiosTypeOem51 SmbiosType = 68
+SmbiosTypeOem52 SmbiosType = 69
+SmbiosTypeOem53 SmbiosType = 70
+SmbiosTypeOem54 SmbiosType = 71
+SmbiosTypeOem55 SmbiosType = 72
+SmbiosTypeOem56 SmbiosType = 73
+SmbiosTypeOem57 SmbiosType = 74
+SmbiosTypeOem58 SmbiosType = 75
+SmbiosTypeOem59 SmbiosType = 76
+SmbiosTypeOem60 SmbiosType = 77
+SmbiosTypeOem61 SmbiosType = 78
+SmbiosTypeOem62 SmbiosType = 79
+SmbiosTypeOem63 SmbiosType = 80
+SmbiosTypeOem64 SmbiosType = 81
+SmbiosTypeOem65 SmbiosType = 82
+SmbiosTypeOem66 SmbiosType = 83
+SmbiosTypeOem67 SmbiosType = 84
+SmbiosTypeOem68 SmbiosType = 85
+SmbiosTypeOem69 SmbiosType = 86
+SmbiosTypeOem70 SmbiosType = 87
+SmbiosTypeOem71 SmbiosType = 88
+SmbiosTypeOem72 SmbiosType = 89
+SmbiosTypeOem73 SmbiosType = 90
+SmbiosTypeOem74 SmbiosType = 91
+SmbiosTypeOem75 SmbiosType = 92
+SmbiosTypeOem76 SmbiosType = 93
+SmbiosTypeOem77 SmbiosType = 94
+SmbiosTypeOem78 SmbiosType = 95
+SmbiosTypeOem79 SmbiosType = 96
+SmbiosTypeOem80 SmbiosType = 97
+SmbiosTypeOem81 SmbiosType = 98
+SmbiosTypeOem82 SmbiosType = 99
+SmbiosTypeOem83 SmbiosType = 100
+SmbiosTypeOem84 SmbiosType = 101
+SmbiosTypeOem85 SmbiosType = 102
+SmbiosTypeOem86 SmbiosType = 103
+SmbiosTypeOem87 SmbiosType = 104
+SmbiosTypeOem88 SmbiosType = 105
+SmbiosTypeOem89 SmbiosType = 106
+SmbiosTypeOem90 SmbiosType = 107
+SmbiosTypeOem91 SmbiosType = 108
+SmbiosTypeOem92 SmbiosType = 109
+SmbiosTypeOem93 SmbiosType = 110
+SmbiosTypeOem94 SmbiosType = 111
+SmbiosTypeOem95 SmbiosType = 112
+SmbiosTypeOem96 SmbiosType = 113
+SmbiosTypeOem97 SmbiosType = 114
+SmbiosTypeOem98 SmbiosType = 115
+SmbiosTypeOem99 SmbiosType = 116
 )
 
 type Smbios struct {
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index d04207748e..58f404af37 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -436,6 +436,105 @@ libxl_smbios_type = Enumeration("smbios_type", [
     (15, "enclosure_asset_tag"),
     (16, "battery_manufacturer"),
     (17, "battery_device_name"),
+    (18, "oem_1"),
+    (19, "oem_2"),
+    (20, "oem_3"),
+    (21, "oem_4"),
+    (22, "oem_5"),
+    (23, "oem_6"),
+    (24, "oem_7"),
+    (25, "oem_8"),
+    (26, "oem_9"),
+    (27, "oem_10"),
+    (28, "oem_11"),
+    (29, "oem_12"),
+    (30, "oem_13"),
+    (31, "oem_14"),
+    (32, "oem_15"),
+    (33, "oem_16"),
+    (34, "oem_17"),
+    (35, "oem_18"),
+    (36, "oem_19"),
+    (37, "oem_20"),
+    (38, "oem_21"),
+    (39, "oem_22"),
+    (40, "oem_23"),
+    (41, "oem_24"),
+    (42, "oem_25"),
+    (43, "oem_26"),
+    (44, "oem_27"),
+    (45, "oem_28"),
+    (46, "oem_29"),
+    (47, "oem_30"),
+    (48, "oem_31"),
+    (49, "oem_32"),
+    (50, "oem_33"),
+    (51, "oem_34"),
+    (52, "oem_35"),
+    (53, "oem_36"),
+    (54, "oem_37"),
+    (55, "oem_38"),
+    (56, "oem_39"),
+    (57, "oem_40"),
+    (58, "oem_41"),
+    (59, "oem_42"),
+    (60, "oem_43"),
+    (61, "oem_44"),
+    (62, "oem_45"),
+    (63, "oem_46"),
+    (64, "oem_47"),
+    (65, "oem_48"),
+    (66, "oem_49"),
+    (67, "oem_50"),
+    (68, "oem_51"),
+    (69, "oem_52"),
+    (70, "oem_53"),
+    (71, "oem_54"),
+    (72, "oem_55"),
+    (73, "oem_56"),
+    (74, "oem_57"),
+    (75, "oem_58"),
+    (76, "oem_59"),
+    (77, "oem_60"),
+    (78, "oem_61"),
+    (79, "oem_62"),
+    (80, "oem_63"),
+    (81, "oem_64"),
+    (82, "oem_65"),
+    (83, "oem_66"),
+    (84, "oem_67"),
+    (85, "oem_68"),
+    (86, "oem_69"),
+    (87, "oem_70"),
+    (88, "oem_71"),
+    (89, "oem_72"),
+    (90, "oem_73"),
+    (91, "oem_74"),
+    (92, "oem_75"),
+    (93, "oem_76"),
+    (94, "oem_77"),
+    (95, "oem_78"),
+    (96, "oem_79"),
+    (97, "oem_80"),
+    (98, "oem_81"),
+    (99, "oem_82"),
+    (100, "oem_83"),
+    (101, "oem_84"),
+    (102, "oem_85"),
+    (103, "oem_86"),
+    (104, "oem_87"),
+    (105, "oem_88"),
+    (106, "oem_89"),
+    (107, "oem_90"),
+    (108, "oem_91"),
+    (109, "oem_92"),
+    (110, "oem_93"),
+    (111, "oem_94"),
+    (112, "oem_95"),
+    (113, "oem_96"),
+    (114, "oem_97"),
+    (115, "oem_98"),
+    (116, "oem_99"),
     ])
 
 libxl_smbios = Struct("smbios", [
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 4f3f962773..fb7f1f6867 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1787,12 +1787,16 @@ void parse_config_data(const char *config_source,
         switch (xlu_cfg_get_list(config, "smbios", &smbios, &num_smbios, 0))
         {
         case 0: /* Success */
+        {
+            unsigned int num_oem = 1;
+
             b_info->u.hvm.num_smbios = num_smbios;
             b_info->u.hvm.smbios = xcalloc(num_smbios, sizeof(libxl_smbios));
             for (i = 0; i < num_smbios; i++) {
                 char *option_untrimmed, *value_untrimmed;
                 char *option, *value;
                 libxl_smbios_type v;
+                char oem_buf[] = "oem_99";
 
                 buf = xlu_cfg_get_listitem(smbios, i);
                 if (!buf) continue;
@@ -1807,6 +1811,16 @@ void parse_config_data(const char *config_source,
                 trim(isspace, option_untrimmed, &option);
                 trim(isspace, value_untrimmed, &value);
 
+                if (strcmp(option, "oem") == 0) {
+                    if (num_oem > 99) {
+                        fprintf(stderr, "xl: sbmios oem strings limited to 99\n");
+                        exit(-ERROR_FAIL);
+                    }
+                    sprintf(oem_buf, "oem_%d", num_oem);
+                    num_oem++;
+                    option = oem_buf;
+                }
+
                 e = libxl_smbios_type_from_string(option, &v);
                 if (e) {
                     fprintf(stderr,
@@ -1819,6 +1833,7 @@ void parse_config_data(const char *config_source,
                 b_info->u.hvm.smbios[i].value = value;
             }
             break;
+        }
         case ESRCH: break; /* Option not present */
         default:
             fprintf(stderr,"xl: Unable to parse smbios options.\n");
-- 
2.37.1


