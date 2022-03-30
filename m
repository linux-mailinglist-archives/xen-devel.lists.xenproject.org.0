Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3644ECBAD
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 20:18:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296472.504690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZctG-00038a-Nw; Wed, 30 Mar 2022 18:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296472.504690; Wed, 30 Mar 2022 18:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZctG-00035V-Kc; Wed, 30 Mar 2022 18:17:54 +0000
Received: by outflank-mailman (input) for mailman id 296472;
 Wed, 30 Mar 2022 18:17:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wjcS=UJ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nZctF-0001bv-BS
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 18:17:53 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b60b46e3-b055-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 20:17:52 +0200 (CEST)
Received: by mail-qk1-x735.google.com with SMTP id q200so4081645qke.7
 for <xen-devel@lists.xenproject.org>; Wed, 30 Mar 2022 11:17:52 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 bl3-20020a05620a1a8300b0067d4cd00231sm11525314qkb.135.2022.03.30.11.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 11:17:50 -0700 (PDT)
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
X-Inumbo-ID: b60b46e3-b055-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y8hAJm5nFvLb+2d5b5NF8UEhR+NwlN1X22DHUZ0xAUo=;
        b=Su9ofTZ0O+5/KRzDarC2PH14JHfV1VRuN3JWpE6MzKW6GBKh4xdJdtVb19hM5sWVbp
         9CXUSiO+ax3VYoWmq9CnnaYrvHf6ooodI8GP7OYSAJs38icHSOzbk1Q7LJyhEnt0pXbb
         95Ehc11koTC/odaZcG/F0JrncQmRf8+a7wOT6MlW3Vvq7lBX4tWsnqGRnXFR5buzGQMK
         4a8UfVe8ZbsRMHmV7br2ketF/w9OXA/Hen2l5GFmUB4W8H0k/3In7a3PFQlHfzjsG//7
         +gX8swsxLCX8VY18coHJts0nOaujS9rKRITfS2qvWmuoXeJmv9Cz/JALmTXBdJLUe3XU
         4qdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y8hAJm5nFvLb+2d5b5NF8UEhR+NwlN1X22DHUZ0xAUo=;
        b=SKr7wyCxo1eslHy1CssyNiYmAFA+7aTGKEiqyddqatPJTBm71VlJtJstu+nTbQhnDz
         3ueCvZYIUEyYR46QrBylMC0YLoBscyhwISBQzMO55FD32XBfrtys1Mfg1LnhUe5EWuS4
         MazqrId+T/vlUuZDd5MIXrEa16DtMO4f6Y4BccKn7fnHM/aIIadgcJ4TCYOeIqgZT6l4
         6QPTwOCP1DO6YlhEHv5rNfa085czkI7bAP0xQ9sMzB8egMuV6j9VZ/uV9HNW2+Vcx1zY
         2ckPegIyGqvNdT/uo5Iq/rKhN5J7CEayRlDEsl3Sw9TjLgNRMP/gQjxneMe5wJcNjVed
         MvrQ==
X-Gm-Message-State: AOAM5322QCu/AX+QRb9sDuA/F4qE5zfSIVrf7lM361+G8Zw8ptkJgsxU
	/atJkLKTqgaSNLdt4wkWHV2BqDYiz2Q=
X-Google-Smtp-Source: ABdhPJwcylafR/yBAF1iUnytuyKOEARKPzzEzzTVQ6KD6oY2V3EhHwo2qaqHd/NC4uUOEyNUpfdelw==
X-Received: by 2002:a05:620a:b1a:b0:67c:a5bf:a8bf with SMTP id t26-20020a05620a0b1a00b0067ca5bfa8bfmr717097qkg.38.1648664271313;
        Wed, 30 Mar 2022 11:17:51 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] xl: Fix global pci options
Date: Wed, 30 Mar 2022 14:17:41 -0400
Message-Id: <20220330181741.30334-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit babde47a3fed "introduce a 'passthrough' configuration option to
xl.cfg..." moved the pci list parsing ahead of the global pci option
parsing.  This broke the global pci configuration options since they
need to be set first so that looping over the pci devices assigns their
values.

Move the global pci options ahead of the pci list to restore their
function.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/xl/xl_parse.c | 52 ++++++++++++++++++++++-----------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 117fcdcb2b..b98c0de378 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1478,6 +1478,32 @@ void parse_config_data(const char *config_source,
         exit(1);
     }
 
+    /* To be reworked (automatically enabled) once the auto ballooning
+     * after guest starts is done (with PCI devices passed in). */
+    if (c_info->type == LIBXL_DOMAIN_TYPE_PV) {
+        xlu_cfg_get_defbool(config, "e820_host", &b_info->u.pv.e820_host, 0);
+    }
+
+    if (!xlu_cfg_get_long (config, "pci_msitranslate", &l, 0))
+        pci_msitranslate = l;
+
+    if (!xlu_cfg_get_long (config, "pci_power_mgmt", &l, 0))
+        pci_power_mgmt = l;
+
+    if (!xlu_cfg_get_long (config, "pci_permissive", &l, 0))
+        pci_permissive = l;
+
+    if (!xlu_cfg_get_long (config, "pci_seize", &l, 0))
+        pci_seize = l;
+
+    if (!xlu_cfg_get_string(config, "rdm", &buf, 0)) {
+        libxl_rdm_reserve rdm;
+        if (!xlu_rdm_parse(config, &rdm, buf)) {
+            b_info->u.hvm.rdm.strategy = rdm.strategy;
+            b_info->u.hvm.rdm.policy = rdm.policy;
+        }
+    }
+
     if (!xlu_cfg_get_list (config, "pci", &pcis, 0, 0)) {
         d_config->num_pcidevs = 0;
         d_config->pcidevs = NULL;
@@ -2338,32 +2364,6 @@ skip_vfb:
         }
     }
 
-    if (!xlu_cfg_get_long (config, "pci_msitranslate", &l, 0))
-        pci_msitranslate = l;
-
-    if (!xlu_cfg_get_long (config, "pci_power_mgmt", &l, 0))
-        pci_power_mgmt = l;
-
-    if (!xlu_cfg_get_long (config, "pci_permissive", &l, 0))
-        pci_permissive = l;
-
-    if (!xlu_cfg_get_long (config, "pci_seize", &l, 0))
-        pci_seize = l;
-
-    /* To be reworked (automatically enabled) once the auto ballooning
-     * after guest starts is done (with PCI devices passed in). */
-    if (c_info->type == LIBXL_DOMAIN_TYPE_PV) {
-        xlu_cfg_get_defbool(config, "e820_host", &b_info->u.pv.e820_host, 0);
-    }
-
-    if (!xlu_cfg_get_string(config, "rdm", &buf, 0)) {
-        libxl_rdm_reserve rdm;
-        if (!xlu_rdm_parse(config, &rdm, buf)) {
-            b_info->u.hvm.rdm.strategy = rdm.strategy;
-            b_info->u.hvm.rdm.policy = rdm.policy;
-        }
-    }
-
     if (!xlu_cfg_get_list(config, "usbctrl", &usbctrls, 0, 0)) {
         d_config->num_usbctrls = 0;
         d_config->usbctrls = NULL;
-- 
2.35.1


