Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D715A71F9C3
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 07:50:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542925.847372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4xfM-0004x0-Lm; Fri, 02 Jun 2023 05:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542925.847372; Fri, 02 Jun 2023 05:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4xfM-0004v3-Iz; Fri, 02 Jun 2023 05:49:36 +0000
Received: by outflank-mailman (input) for mailman id 542925;
 Fri, 02 Jun 2023 05:49:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dv8B=BW=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1q4xfL-0004g6-LH
 for xen-devel@lists.xen.org; Fri, 02 Jun 2023 05:49:35 +0000
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [2607:f8b0:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4070913b-0109-11ee-b231-6b7b168915f2;
 Fri, 02 Jun 2023 07:49:35 +0200 (CEST)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-51b4ef5378bso1532511a12.1
 for <xen-devel@lists.xen.org>; Thu, 01 Jun 2023 22:49:35 -0700 (PDT)
Received: from localhost ([122.172.87.195]) by smtp.gmail.com with ESMTPSA id
 21-20020a170902c11500b001ac94b33ab1sm352303pli.304.2023.06.01.22.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 22:49:33 -0700 (PDT)
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
X-Inumbo-ID: 4070913b-0109-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685684973; x=1688276973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBN/RWcDvPOwXwPxKLJ7hwpbCSP4ps6soF57y3YX9cs=;
        b=LiRvyhpBsWDJitVSWNQaI/YdwbEFhNZ2v7osl22Vwh5mAvifREoEYlY5UW4Y/V6Vtv
         fF5uDnSA17Bo4PpIj9RtRPVPZxr14Ek8C52LRHpAiGqapviyDYvAoiugWbdVAe3adxwn
         yf63zomYB2e5c5KwG0z0iHzwr+Kf+qSNKi8qkFhdoOQhxGs3CmV1szqqUyhIdU1Slv26
         7wxOzHlGAhiRi3j8OXXv51D22pAEOFmOzwev8pAtPqHR5qSMCs6q7eRsd6RwrspiPxpC
         gBfDLA5WVM5rtR57Jovt+zc26Rl2go16V138sZTQ8DfploIVOp9Nw8hF3H8TaPZDUMi6
         9UqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685684973; x=1688276973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jBN/RWcDvPOwXwPxKLJ7hwpbCSP4ps6soF57y3YX9cs=;
        b=EVHqWinZQQhvugxJ4FM/taoT1YX8BglD7l2fAvYKyetSRvlBpwH33qNJYWsAxmVTP+
         Vr/BauVPHb+zhOo8RXSmi/0/ni8t6mGVigrKffZMSTGA0VlT2nRtZItW1vqKE6HjgT3t
         D948Pijsul4Xew5AI5NQ01qy+c8wALh4mg1L+RKOfV2iPNjP7vZXhbU2HKClpcKoKCw5
         TSZOUNdD8LpW7p32Qu1Km/wV6kL/Qn0r4g8h0UwKIF78locSwDbQsY9cpymM0SHLxMhe
         bz9RJSq+C0VUJz1S83Jnl5v090fm1yQzvwq5smRQq9a6I9MFJf9Br2Hrtftdy3+6PcNf
         jyVg==
X-Gm-Message-State: AC+VfDywTQQkrz36/Wf7XxILCKudGIfs4WLB3JF14xxu1zKUoEudD8Fk
	PdKIUkjgs4Xe+QszTl7onGXsMZ4JcFuPs1vWh/0=
X-Google-Smtp-Source: ACHHUZ6i8Yj/jn4nrWyKIq7yg+6FGl+3P9GNin6a55YolBhclgLGqi6thYCHu25BO4pR7fAOAlzXqA==
X-Received: by 2002:a17:902:e5c4:b0:1af:981b:eeff with SMTP id u4-20020a170902e5c400b001af981beeffmr1424317plf.64.1685684973641;
        Thu, 01 Jun 2023 22:49:33 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>
Subject: [PATCH V3 2/3] libxl: Call libxl__virtio_devtype.set_default() early enough
Date: Fri,  2 Jun 2023 11:19:08 +0530
Message-Id: <61727b8e00dd9acb0621e98528bd5051d3bd5c58.1685684586.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1685684586.git.viresh.kumar@linaro.org>
References: <cover.1685684586.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The _setdefault() function for virtio devices is getting called after
libxl__prepare_dtb(), which is late as libxl__prepare_dtb() expects the
defaults to be already set by this time.

Call libxl__virtio_devtype.set_default() from
libxl__domain_config_setdefault(), in a similar way as other devices
like disk, etc.

Suggested-by: Anthony PERARD <anthony.perard@citrix.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/libs/light/libxl_create.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index ec8eab02c207..36770af6d4ff 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1068,7 +1068,7 @@ int libxl__domain_config_setdefault(libxl__gc *gc,
                                     uint32_t domid /* for logging, only */)
 {
     libxl_ctx *ctx = libxl__gc_owner(gc);
-    int ret;
+    int ret, i;
     bool pod_enabled = false;
     libxl_domain_create_info *c_info = &d_config->c_info;
 
@@ -1266,6 +1266,15 @@ int libxl__domain_config_setdefault(libxl__gc *gc,
         goto error_out;
     }
 
+    for (i = 0; i < d_config->num_virtios; i++) {
+        ret = libxl__virtio_devtype.set_default(gc, domid,
+                                                &d_config->virtios[i], false);
+        if (ret) {
+            LOGD(ERROR, domid, "Unable to set virtio defaults for device %d", i);
+            goto error_out;
+        }
+    }
+
     ret = 0;
  error_out:
     return ret;
-- 
2.31.1.272.g89b43f80a514


