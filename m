Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2FC4EF041
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 16:33:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297429.506676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naIKw-0003oq-Pz; Fri, 01 Apr 2022 14:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297429.506676; Fri, 01 Apr 2022 14:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naIKw-0003mm-MM; Fri, 01 Apr 2022 14:33:14 +0000
Received: by outflank-mailman (input) for mailman id 297429;
 Fri, 01 Apr 2022 14:33:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AW7G=UL=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1naIKu-0003Ct-TE
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 14:33:13 +0000
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [2607:f8b0:4864:20::f2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7e407f2-b1c8-11ec-8fbc-03012f2f19d4;
 Fri, 01 Apr 2022 16:33:12 +0200 (CEST)
Received: by mail-qv1-xf2e.google.com with SMTP id k7so2147346qvc.4
 for <xen-devel@lists.xenproject.org>; Fri, 01 Apr 2022 07:33:12 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:3c6c:76:9828:871b])
 by smtp.gmail.com with ESMTPSA id
 a9-20020ac85b89000000b002e2072c9dedsm2063469qta.67.2022.04.01.07.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 07:33:09 -0700 (PDT)
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
X-Inumbo-ID: a7e407f2-b1c8-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lBHMZeC91ZK2tywfZph5lp9KK7X0ZdbeDNeiV0kgKAI=;
        b=HYZ2my/OxC/ZEsMBvAcR+LRHSUFTtkzIGe4/ZPBCzM3eMzQRR0Z3GVwvTfBj4ojQQC
         jssOgwlGuyUdaM4xdFpVPEVnYyzbz2q3S6Flz9MNQEmE5eqmBqftoelkSls5evqCLc7x
         i5HNC2SVHWfyykGGUCZdEVg8Rgs9GhDxxflEk+t37gzlI+WW62PPChfjTlNSItSVk9Iw
         ZrliCKNhAJ5+BP8iy5tt+3vcBpsn47A6TfzuYAsQMhlewZfWe4SyRPFQkURjqQy0rHxC
         mTdKxr4D2sRydTq0AlfyHyEwcqXzlHrEygHSwJtGuNlYnfhbIRAc7vUXXuTn93b2r2my
         C8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lBHMZeC91ZK2tywfZph5lp9KK7X0ZdbeDNeiV0kgKAI=;
        b=vaXQ+SaWC9uxer6Re5O3pnHKOPStjA2jxRZlwW8aJZrIhzlqmGmdcDt6UmoNMsl8A3
         IBG7GmuFMKdGEt0+XgOHohvPcs1HbyvV9OeGYNM3IrgTBI51d9U3+lcVEK/o0s1Mobxh
         j4MbB7DnWTBeU5Pv0FxpC9o6ATBVLFgZSBwSml2RArnT+mUv+GNiBjYF0kzZyd8DcI3j
         LxkwCioQYWK5jopChTBI7dtZSX4IU6GLONKIpBJHJAs6MuPHysqaaMXwbg4V0s8LAQDh
         WSRyFKYVi6GCpJtN+qOtVhqDamzYg4R6IkQ/Yz5v8iFSV0Syh0Ezeo2M3pK3rsMeUs5d
         Ky9Q==
X-Gm-Message-State: AOAM530ipMRnPFQJ9mNFPO95+icTS84o+2ISKpvl4WaBoP3BVx+GUvLq
	3AUCIVByHfg7VSo/ywnNa5XmzRGc2Ts=
X-Google-Smtp-Source: ABdhPJxlrj0fiVKZVXaJOyRgmS6ydclti+4tsFbT8v5kK32od7r7a1RheVCUjVvDekoxJXislPsWiA==
X-Received: by 2002:a05:6214:27e6:b0:443:6801:ac6b with SMTP id jt6-20020a05621427e600b004436801ac6bmr8337451qvb.57.1648823590182;
        Fri, 01 Apr 2022 07:33:10 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2] libxl: Don't segfault on soft-reset failure
Date: Fri,  1 Apr 2022 10:32:56 -0400
Message-Id: <20220401143256.17720-1-jandryuk@gmail.com>
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

Move dcs->console_xswait initialization into the callers of
initiate_domain_create, do_domain_create() and do_domain_soft_reset(),
so it is initialized along with the other dcs state.

Fixes: c57e6ebd8c3e ("(lib)xl: soft reset support")
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
v2:
Add Fixes
Drop NULL check
Re-position libxl__xswait_init in callers

 tools/libs/light/libxl_create.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 15ed021f41..885675591f 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1255,8 +1255,6 @@ static void initiate_domain_create(libxl__egc *egc,
     libxl_domain_config *const d_config = dcs->guest_config;
     libxl__domain_build_state *dbs = &dcs->build_state;
 
-    libxl__xswait_init(&dcs->console_xswait);
-
     domid = dcs->domid;
     libxl__domain_build_state_init(dbs);
     dbs->restore = dcs->restore_fd >= 0;
@@ -2072,6 +2070,7 @@ static int do_domain_create(libxl_ctx *ctx, libxl_domain_config *d_config,
     cdcs->dcs.callback = domain_create_cb;
     cdcs->dcs.domid = INVALID_DOMID;
     cdcs->dcs.soft_reset = false;
+    libxl__xswait_init(&cdcs->dcs.console_xswait);
 
     if (cdcs->dcs.restore_params.checkpointed_stream ==
         LIBXL_CHECKPOINTED_STREAM_COLO) {
@@ -2172,6 +2171,7 @@ static int do_domain_soft_reset(libxl_ctx *ctx,
     cdcs->dcs.domid = domid;
     cdcs->dcs.soft_reset = true;
     cdcs->dcs.callback = domain_create_cb;
+    libxl__xswait_init(&cdcs->dcs.console_xswait);
     libxl__ao_progress_gethow(&srs->cdcs.dcs.aop_console_how,
                               aop_console_how);
     cdcs->domid_out = &domid_out;
-- 
2.35.1


