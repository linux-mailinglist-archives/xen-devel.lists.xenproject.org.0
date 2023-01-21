Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8332A6769AA
	for <lists+xen-devel@lfdr.de>; Sat, 21 Jan 2023 22:40:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482383.747863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJLab-0004d0-4V; Sat, 21 Jan 2023 21:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482383.747863; Sat, 21 Jan 2023 21:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJLab-0004Zg-0Y; Sat, 21 Jan 2023 21:39:53 +0000
Received: by outflank-mailman (input) for mailman id 482383;
 Sat, 21 Jan 2023 21:39:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ql0K=5S=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pJLaY-0004Ke-QT
 for xen-devel@lists.xenproject.org; Sat, 21 Jan 2023 21:39:50 +0000
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [2607:f8b0:4864:20::832])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20f4fb03-99d4-11ed-b8d1-410ff93cb8f0;
 Sat, 21 Jan 2023 22:39:49 +0100 (CET)
Received: by mail-qt1-x832.google.com with SMTP id g16so4885622qtu.2
 for <xen-devel@lists.xenproject.org>; Sat, 21 Jan 2023 13:39:48 -0800 (PST)
Received: from shine.lan ([2001:470:8:67e:4282:e612:9c15:499])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a05620a424600b00705be892191sm24202402qko.56.2023.01.21.13.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Jan 2023 13:39:46 -0800 (PST)
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
X-Inumbo-ID: 20f4fb03-99d4-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VlprdPagtmcclyYEQlFBNVYwZD5+y5cWhZ95XyI3Leo=;
        b=TgMzWx9ifX/noFmbJ2gaApzq0RK4TGGBMBSNDRAsGREzeFsuh0gzj8i863CeBSIcZS
         2ME+DLqYW2BMfbEVe+WovwJ9sLFLT0rvbs/8VUbdttQ6p8c/GZ2l0A4vAqCNQApafay1
         c5X/T8WS6OsVRfOO8xdH6+bhlUNhHDi+jKhW0PVV4+nNxTnif01QX1prVKr78i8rG6j7
         A1CTJSCrvcyem2AgwVbFpz/U9nu5ZPkaSiLYJkyhj9WiKw6KJ7te/8RkrZRdSVZ4nrto
         iSIVx5mEwmloMF0VwaL8hN8wGmE8i+f7TZW7HXj4KTZqQgGXcK+bNzbZhItptg6uStTK
         aocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VlprdPagtmcclyYEQlFBNVYwZD5+y5cWhZ95XyI3Leo=;
        b=T2KkMNSMGGI7B6nLEbY/971pQZyGIjdgjPNFVGtdlKHG0fG9FZJOiGkyaj4NO8JOAW
         OJdUclvh4Ueuh5SXBeCWVydgTGMvQeLrZ0y9vyPukRvybPkbUIQFL6LxW386fdQ280Ha
         9hthboLRSqB9kMsI6NOWezNzvILQLu4ycri0LY5cwYPCiE2BV4fq9OyorJW81J2lVJn4
         NXch4maxIhCu2S5vvYIt10VrxckZRFXfNnGJCtpGB3PvazHd34I/U2IFyW9Kn7pUKI62
         i8wQyMeJvapl6J+nPPlp1O2rwcKPVm2yCZHXmjoZb8UTznx+cCUr/3SeDS3SQf+sQbP7
         rNTw==
X-Gm-Message-State: AFqh2kroY4hz4Ko5/c7FCL+GoPzKx5Qgy6RvR9PCZp99/HOYb29EdJZi
	zbg+WteCQxE1oSLUtV4IjweNlNOLaRs=
X-Google-Smtp-Source: AMrXdXuv2Ijx/AyZiagmueTAO6PlPJBQtrFWQiM+a7Cq1+SAIrbfpmcChWa9Yfug9Q+/CUKjGK6ymA==
X-Received: by 2002:a05:622a:4208:b0:3b6:2cdb:e240 with SMTP id cp8-20020a05622a420800b003b62cdbe240mr27853568qtb.18.1674337187386;
        Sat, 21 Jan 2023 13:39:47 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Dongli Zhang <dongli.zhang@oracle.com>
Subject: [PATCH 1/2] libxl: Fix guest kexec - skip cpuid policy
Date: Sat, 21 Jan 2023 16:39:07 -0500
Message-Id: <20230121213908.6504-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230121213908.6504-1-jandryuk@gmail.com>
References: <20230121213908.6504-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a domain performs a kexec (soft reset), libxl__build_pre() is
called with the existing domid.  Calling libxl__cpuid_legacy() on the
existing domain fails since the cpuid policy has already been set, and
the guest isn't rebuilt and doesn't kexec.

xc: error: Failed to set d1's policy (err leaf 0xffffffff, subleaf 0xffffffff, msr 0xffffffff) (17 = File exists): Internal error
libxl: error: libxl_cpuid.c:494:libxl__cpuid_legacy: Domain 1:Failed to apply CPUID policy: File exists
libxl: error: libxl_create.c:1641:domcreate_rebuild_done: Domain 1:cannot (re-)build domain: -3
libxl: error: libxl_xshelp.c:201:libxl__xs_read_mandatory: xenstore read failed: `/libxl/1/type': No such file or directory
libxl: warning: libxl_dom.c:49:libxl__domain_type: unable to get domain type for domid=1, assuming HVM

During a soft_reset, skip calling libxl__cpuid_legacy() to avoid the
issue.  Before the fixes commit, the libxl__cpuid_legacy() failure would
have been ignored, so kexec would continue.

Fixes: 34990446ca91 "libxl: don't ignore the return value from xc_cpuid_apply_policy"
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
Probably a backport candidate since this has been broken for a while.
---
 tools/libs/light/libxl_create.c   | 4 ++--
 tools/libs/light/libxl_dom.c      | 5 +++--
 tools/libs/light/libxl_internal.h | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 5cddc3df79..587a515dff 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -510,7 +510,7 @@ int libxl__domain_build(libxl__gc *gc,
     struct timeval start_time;
     int i, ret;
 
-    ret = libxl__build_pre(gc, domid, d_config, state);
+    ret = libxl__build_pre(gc, domid, d_config, state, false);
     if (ret)
         goto out;
 
@@ -1440,7 +1440,7 @@ static void domcreate_bootloader_done(libxl__egc *egc,
         goto out;
     }
 
-    rc = libxl__build_pre(gc, domid, d_config, state);
+    rc = libxl__build_pre(gc, domid, d_config, state, dcs->soft_reset);
     if (rc)
         goto out;
 
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index b454f988fb..7cebf5047f 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -241,7 +241,8 @@ static int numa_place_domain(libxl__gc *gc, uint32_t domid,
 }
 
 int libxl__build_pre(libxl__gc *gc, uint32_t domid,
-              libxl_domain_config *d_config, libxl__domain_build_state *state)
+              libxl_domain_config *d_config, libxl__domain_build_state *state,
+              bool soft_reset)
 {
     libxl_domain_build_info *const info = &d_config->b_info;
     libxl_ctx *ctx = libxl__gc_owner(gc);
@@ -382,7 +383,7 @@ int libxl__build_pre(libxl__gc *gc, uint32_t domid,
     /* Construct a CPUID policy, but only for brand new domains.  Domains
      * being migrated-in/restored have CPUID handled during the
      * static_data_done() callback. */
-    if (!state->restore)
+    if (!state->restore && !soft_reset)
         rc = libxl__cpuid_legacy(ctx, domid, false, info);
 
 out:
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 0dc8b8f210..f0af44b523 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -1418,7 +1418,7 @@ _hidden void libxl__domain_build_state_dispose(libxl__domain_build_state *s);
 
 _hidden int libxl__build_pre(libxl__gc *gc, uint32_t domid,
               libxl_domain_config * const d_config,
-              libxl__domain_build_state *state);
+              libxl__domain_build_state *state, bool soft_reset);
 _hidden int libxl__build_post(libxl__gc *gc, uint32_t domid,
                libxl_domain_build_info *info, libxl__domain_build_state *state,
                char **vms_ents, char **local_ents);
-- 
2.34.1


