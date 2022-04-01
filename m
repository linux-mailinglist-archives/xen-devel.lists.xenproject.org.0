Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C3E4EF043
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 16:33:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297430.506687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naIL1-00047S-2x; Fri, 01 Apr 2022 14:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297430.506687; Fri, 01 Apr 2022 14:33:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naIL0-00044S-W1; Fri, 01 Apr 2022 14:33:18 +0000
Received: by outflank-mailman (input) for mailman id 297430;
 Fri, 01 Apr 2022 14:33:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AW7G=UL=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1naIKz-0003Ct-3o
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 14:33:17 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aaafc2f4-b1c8-11ec-8fbc-03012f2f19d4;
 Fri, 01 Apr 2022 16:33:16 +0200 (CEST)
Received: by mail-qk1-x72c.google.com with SMTP id q200so2222185qke.7
 for <xen-devel@lists.xenproject.org>; Fri, 01 Apr 2022 07:33:16 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:3c6c:76:9828:871b])
 by smtp.gmail.com with ESMTPSA id
 x18-20020a05622a001200b002eb856d7786sm1915111qtw.84.2022.04.01.07.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 07:33:14 -0700 (PDT)
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
X-Inumbo-ID: aaafc2f4-b1c8-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tEVL8KQSMfu1CGNwcmGbmVujHFwNa0z5f5gBF9b17L0=;
        b=Pen/YLahTXvY+InrMPykWZuVWfMHj2CEBx1td8wtM8vtXZ+VS9DVQ5fwbsD8qs8JW6
         uHxjhCxLbXlVmbLehY2qfup2mjj8onU9JGhKamdIS4W+2bruq2vVJWHQKpgTcHclBT3c
         eDm80yk61uafxxC+q25hIgTrgvsK8+QfGMAkb00lzfkHMftc1jIoI1RqHdSY4oxAOZkl
         yFH230iMe69zhLAq7jeItY41Bfvf0I1aR8Bu49IGTU0ExnnaWkXxqowKXPY5OxbNCev+
         JqAUujSN+B97LMLm/07bR5OMH9OYLA1A/vz8cwQy1kVWQqL7PKLnCJjB52MIX+YaB3ot
         RSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tEVL8KQSMfu1CGNwcmGbmVujHFwNa0z5f5gBF9b17L0=;
        b=MWGY26AV2SOPk5XJ3UhV09pRywnasuCS/7ETTi2In7S20FX5xg+gHm11KiWFN19Dko
         mY/wVWH/xDT4cKixlGNHXm9vBy9FG5doJ/i7ZxicIo1oGJXf0XzwEn4hurb2Q7G0pmRd
         tHu+dNb7zMJyK+YdoLafTfh6kpm6tPT6zzFtu45O5VsSHBTg+ianWqpQI/7l4F5+8AmO
         K/DAlnt/TyqjK3glAHkfb7oXX0rl+6AF7++Va+31CrHMVrpmRzIjOUHSdiJXnXV/voEQ
         +Y8ECpfBvUnN6UXXaM+cHtg12U3kWBgsy0n9aOeUf+H0O+ldObPNMBKcC/Ka81Tqe6ae
         LAFw==
X-Gm-Message-State: AOAM533CL156LFk2d0Npd8mxQwg6Jc3i3bGGNicoYUdCjmUiGyX/+v8s
	64AVVsyS1w0Ulc0Pxdm6vw+5920d5vk=
X-Google-Smtp-Source: ABdhPJwx9BzLU7NFdXRzzrzEn3GkAGQwyZ+lmNFDDnoy31BRMKYqEays8SYPFnKOnSkkmZi1YRwF5A==
X-Received: by 2002:a05:620a:a57:b0:67d:396a:8a9d with SMTP id j23-20020a05620a0a5700b0067d396a8a9dmr6904809qka.322.1648823594895;
        Fri, 01 Apr 2022 07:33:14 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2] libxl: Re-scope qmp_proxy_spawn.ao usage
Date: Fri,  1 Apr 2022 10:33:10 -0400
Message-Id: <20220401143310.17743-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I've observed this failed assertion:
libxl_event.c:2057: libxl__ao_inprogress_gc: Assertion `ao' failed.

AFAICT, this is happening in qmp_proxy_spawn_outcome where
sdss->qmp_proxy_spawn.ao is NULL.

The out label of spawn_stub_launch_dm() calls qmp_proxy_spawn_outcome(),
but it is only in the success path that sdss->qmp_proxy_spawn.ao gets
set to the current ao.

qmp_proxy_spawn_outcome() should instead use sdss->dm.spawn.ao, which is
the already in-use ao when spawn_stub_launch_dm() is called.  The same
is true for spawn_qmp_proxy().

With this, move sdss->qmp_proxy_spawn.ao initialization to
spawn_qmp_proxy() since its use is for libxl__spawn_spawn() and it can
be initialized along with the rest of sdss->qmp_proxy_spawn.

Fixes: 83c845033dc8 ("libxl: use vchan for QMP access with Linux stubdomain")
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
v2:
Change subject
Add Fixes
Change to using sdss->dm.spawn.ao

 tools/libs/light/libxl_dm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 9a8ddbe188..1864ee30f0 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -2567,7 +2567,6 @@ static void spawn_stub_launch_dm(libxl__egc *egc,
             goto out;
     }
 
-    sdss->qmp_proxy_spawn.ao = ao;
     if (libxl__stubdomain_is_linux(&guest_config->b_info)) {
         spawn_qmp_proxy(egc, sdss);
     } else {
@@ -2584,7 +2583,7 @@ out:
 static void spawn_qmp_proxy(libxl__egc *egc,
                             libxl__stub_dm_spawn_state *sdss)
 {
-    STATE_AO_GC(sdss->qmp_proxy_spawn.ao);
+    STATE_AO_GC(sdss->dm.spawn.ao);
     const uint32_t guest_domid = sdss->dm.guest_domid;
     const uint32_t dm_domid = sdss->pvqemu.guest_domid;
     const char *dom_path = libxl__xs_get_dompath(gc, dm_domid);
@@ -2598,6 +2597,7 @@ static void spawn_qmp_proxy(libxl__egc *egc,
         goto out;
     }
 
+    sdss->qmp_proxy_spawn.ao = ao;
     sdss->qmp_proxy_spawn.what = GCSPRINTF("domain %d device model qmp proxy", guest_domid);
     sdss->qmp_proxy_spawn.pidpath = GCSPRINTF("%s/image/qmp-proxy-pid", dom_path);
     sdss->qmp_proxy_spawn.xspath = DEVICE_MODEL_XS_PATH(gc, LIBXL_TOOLSTACK_DOMID,
@@ -2685,7 +2685,7 @@ static void qmp_proxy_spawn_outcome(libxl__egc *egc,
                                     libxl__stub_dm_spawn_state *sdss,
                                     int rc)
 {
-    STATE_AO_GC(sdss->qmp_proxy_spawn.ao);
+    STATE_AO_GC(sdss->dm.spawn.ao);
     /*
      * Until xenconsoled learns how to handle multiple consoles, require qemu
      * in dom0 to serve consoles for a stubdomain - it require at least 3 of them.
-- 
2.35.1


