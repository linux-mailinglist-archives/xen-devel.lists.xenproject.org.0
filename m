Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5964B280B75
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 01:54:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1612.4888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO8On-0007tt-9E; Thu, 01 Oct 2020 23:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1612.4888; Thu, 01 Oct 2020 23:54:09 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO8On-0007tU-5i; Thu, 01 Oct 2020 23:54:09 +0000
Received: by outflank-mailman (input) for mailman id 1612;
 Thu, 01 Oct 2020 23:54:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=44uA=DI=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kO8Om-0007tO-Il
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 23:54:08 +0000
Received: from mail-qv1-xf43.google.com (unknown [2607:f8b0:4864:20::f43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ac46d3f-093b-4a95-a847-b7afba73396f;
 Thu, 01 Oct 2020 23:54:07 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id p15so428059qvk.5
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 16:54:07 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:d1f7:ee69:1dfe:5706])
 by smtp.gmail.com with ESMTPSA id t26sm7338124qkt.29.2020.10.01.16.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 16:54:05 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=44uA=DI=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kO8Om-0007tO-Il
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 23:54:08 +0000
X-Inumbo-ID: 3ac46d3f-093b-4a95-a847-b7afba73396f
Received: from mail-qv1-xf43.google.com (unknown [2607:f8b0:4864:20::f43])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3ac46d3f-093b-4a95-a847-b7afba73396f;
	Thu, 01 Oct 2020 23:54:07 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id p15so428059qvk.5
        for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 16:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yFF6fvVarLXwIeCYKkEhI6nrhgmMv9+Zhw6bLLwScMI=;
        b=j7K9mQwWIquOybazSniet4mYmJelUM2Z9+ggruaaKw3DSeYhMse9D6zxuDkfqzeQZ0
         AHEKZsgiDZox17KvmWmWaE+ZIT65MGemT/CKYQHuXzMNb3AAUo0VSUqFsq00Nxd9KlyH
         6XwhpZ7RFFrzvQNX+wH4yeg49Pw6cXTiTtTwbwVRs6RIqijGFMrTlJRsrH87AvuSn6UY
         NyM2sFJTIkOH+sQTmEC0Ofv/HTkUm+Rzz9/CCKNXXuKCAmf1p6c4LlvKIKmGJygyjl3w
         /q4vOxIM1zwMT/jpaYmhUYG9q54nTUNqPA9yesqqvC0cTdF6ie1wozKF/WdafDQxFRDu
         Il3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yFF6fvVarLXwIeCYKkEhI6nrhgmMv9+Zhw6bLLwScMI=;
        b=JyMFtjQ5ylocwTVflsVhyBhiszmkU3DwoKdsfSP2X+RtzfS1iFpJkYOXNogHnjewQN
         UbtLGxzi+GqkcljX/NUFM7OMeqcib5Si366fHrVrsGVEK29dpE0goFZ+al+rDQ/pCQ7+
         VoN/zPY/n0yQqfp3Ev3gePo9hhMaBSoxVRXoRT0KPdcpPWaejrzfZptIuJfhK1XgcaTT
         J78loxVL+vl4/xE5BfrCdTB0nqGzk9o4KgB1DbDhfb/W28BP4nhAI4qARzU+rT3q7q6Q
         jYfdUW3Ivym58q2nFrngvcJ0AQPin2hZS6/Mel87nrv/VF6zweKyvaOeJYLkkjJUQxZe
         hb4A==
X-Gm-Message-State: AOAM532gwhaMAK3tZxZu7VCJxbu/SC6xtQPu/OFI+kcQfWyzRNXdOhWt
	oWZheb2FTHgT52iKg38CDNXrXzcPews=
X-Google-Smtp-Source: ABdhPJwEcoQIPfytlq+Ki8ylOdbQBMIdEsMnTEQCOD0g8ih9DEOXf2KpQO/nlAAiuSMjrvNa+dI14Q==
X-Received: by 2002:a0c:b3dd:: with SMTP id b29mr10280317qvf.59.1601596446938;
        Thu, 01 Oct 2020 16:54:06 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:d1f7:ee69:1dfe:5706])
        by smtp.gmail.com with ESMTPSA id t26sm7338124qkt.29.2020.10.01.16.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 16:54:05 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] libxl: only query VNC when enabled
Date: Thu,  1 Oct 2020 19:53:37 -0400
Message-Id: <20201001235337.83948-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

QEMU without VNC support (configure --disable-vnc) will return an error
when VNC is queried over QMP since it does not recognize the QMP
command.  This will cause libxl to fail starting the domain even if VNC
is not enabled.  Therefore only query QEMU for VNC support when using
VNC, so a VNC-less QEMU will function in this configuration.

'goto out' jumps to the call to device_model_postconfig_done(), the
final callback after the chain of vnc queries.  This bypasses all the
QMP VNC queries.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libs/light/libxl_dm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index a944181781..d1ff35dda3 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -3140,6 +3140,7 @@ static void device_model_postconfig_chardev(libxl__egc *egc,
 {
     EGC_GC;
     libxl__dm_spawn_state *dmss = CONTAINER_OF(qmp, *dmss, qmp);
+    const libxl_vnc_info *vnc = libxl__dm_vnc(dmss->guest_config);
     const libxl__json_object *item = NULL;
     const libxl__json_object *o = NULL;
     int i = 0;
@@ -3197,6 +3198,9 @@ static void device_model_postconfig_chardev(libxl__egc *egc,
         if (rc) goto out;
     }
 
+    if (!vnc)
+        goto out;
+
     qmp->callback = device_model_postconfig_vnc;
     rc = libxl__ev_qmp_send(egc, qmp, "query-vnc", NULL);
     if (rc) goto out;
-- 
2.25.1


