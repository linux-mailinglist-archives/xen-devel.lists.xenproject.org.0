Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0344ECBAA
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 20:17:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296468.504669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZct0-000215-WF; Wed, 30 Mar 2022 18:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296468.504669; Wed, 30 Mar 2022 18:17:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZct0-0001yO-S9; Wed, 30 Mar 2022 18:17:38 +0000
Received: by outflank-mailman (input) for mailman id 296468;
 Wed, 30 Mar 2022 18:17:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wjcS=UJ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nZcsy-0001bv-Kq
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 18:17:36 +0000
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [2607:f8b0:4864:20::f33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac1c6647-b055-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 20:17:35 +0200 (CEST)
Received: by mail-qv1-xf33.google.com with SMTP id jo24so17532985qvb.5
 for <xen-devel@lists.xenproject.org>; Wed, 30 Mar 2022 11:17:35 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a05620a410100b0067ec5ecac66sm13021652qko.19.2022.03.30.11.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 11:17:34 -0700 (PDT)
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
X-Inumbo-ID: ac1c6647-b055-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pHvZEn7+cQHssE3I7gGuWSbtom5d43HxgDpkmlD56Vg=;
        b=Y1Oywlcn4NzkRRdHX/HPJEkzgfrOjCtr9CMY+ksEZ2Dg2KVUYYn3fO5tFwDzm6kghX
         mFZNdh2BumHlGh4gwDVCfYso9IukdM/ZUaI5MKVHVcPV/gJS0id858FsU0vcfPzYxaOW
         BVTf5MyMjei83A+4YVIjffunKMn7r4vUWcOJQrGFDXrJ6cyaZS0E1onXNNwmxMQItOWL
         ge2Jf9ycPAPNf/vpZIgelBD3Aebx2pwEMEzlCelKnk1fnOynDpO7OJnDPi/L5lL8BH+2
         y0oMLxrD311yph0zd7antevynW7jgQAU428h7NIo4w+reBbpco2ksl/VA0iZcEVDiht/
         qFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pHvZEn7+cQHssE3I7gGuWSbtom5d43HxgDpkmlD56Vg=;
        b=OmabkmZhAXe9+aWO1tn/BT6SOIb1hu6ZnLDKeUThvlgxozrcW7YtVwueQ/mH5UMxPa
         AvFRuRXwQTVAf2HiTQIHP/wTPjXAXm/R7nj02QW4p4qUG+J5vLwzL47rttFpwPoRYQs0
         tXu/0BgcXWIlLA/BCHt+mRUvQluTJcMeDFaNgJ33pyAJyqnvhWfAx9EIjl7TyiOVAD8U
         HKEMUkQVJwXSS1z/5SJaVpY9qIlSFR6FZeLP/4u1BpyEWTPbFVL4wMW6jdHBXh/+VRls
         517ItVs3USS89KFNLX/NNEvLW4KV1/KVkMb+CN7cleAP9REPNwUopPfYTbI0NLwoP8GN
         zKAQ==
X-Gm-Message-State: AOAM532aYi7COM1tVG1vD+i5GxWvMvEeRt3kzf4i0kkHe4vFdz23aYyE
	8zM8Gk7sKY0U054VRNCpMljy4DPk9eE=
X-Google-Smtp-Source: ABdhPJz7VLTKVNyTETqw9Jjjy4PgrvVA/6Fer71PLcEVxi/87OqbFB2Xebxpehtuqx2lStV8f5NIWw==
X-Received: by 2002:a05:6214:622:b0:441:2918:ee18 with SMTP id a2-20020a056214062200b004412918ee18mr463749qvx.118.1648664254631;
        Wed, 30 Mar 2022 11:17:34 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] libxl: Don't segfault on soft-reset failure
Date: Wed, 30 Mar 2022 14:17:27 -0400
Message-Id: <20220330181727.30303-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If domain_soft_reset_cb can't rename the save file, it doesn't call
initiate_domain_create() and calls domcreate_complete().

Skipping initiate_domain_create() means dcs->console_wait is
uninitialized and all 0s.

We have:
  domcreate_complete()
    libxl__xswait_stop()
      libxl__ev_xswatch_deregister().

The uninitialized slotnum 0 is considered valid (-1 is the invalid
sentinel), so the NULL pointer path to passed to xs_unwatch() which
segfaults.

libxl__ev_xswatch_deregister:watch w=0x12bc250 wpath=(null) token=0/0: deregister slotnum=0

Ensure dcs->console_xswait is minimally initialized by calling
libxl__xswait_init() in do_domain_soft_reset().

Also add a check for dcs->console_xswait.path being NULL in
domcreate_complete() to avoid the segfault.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
The NULL check in domcreate_complete isn't needed when the xswait is
initialized, but it could catch other occurances.

 tools/libs/light/libxl_create.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 15ed021f41..631caa416d 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1970,7 +1970,8 @@ static void domcreate_complete(libxl__egc *egc,
     libxl_domain_config *const d_config = dcs->guest_config;
     libxl_domain_config *d_config_saved = &dcs->guest_config_saved;
 
-    libxl__xswait_stop(gc, &dcs->console_xswait);
+    if (dcs->console_xswait.path)
+        libxl__xswait_stop(gc, &dcs->console_xswait);
 
     libxl__domain_build_state_dispose(&dcs->build_state);
 
@@ -2176,6 +2177,10 @@ static int do_domain_soft_reset(libxl_ctx *ctx,
                               aop_console_how);
     cdcs->domid_out = &domid_out;
 
+    /* Initialize in case we end up in domcreate_complete without calling
+     * initiate_domain_create. */
+    libxl__xswait_init(&cdcs->dcs.console_xswait);
+
     dom_path = libxl__xs_get_dompath(gc, domid);
     if (!dom_path) {
         LOGD(ERROR, domid, "failed to read domain path");
-- 
2.35.1


