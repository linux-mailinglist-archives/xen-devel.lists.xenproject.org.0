Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B47B71D6E75
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 03:15:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaUMs-0008T3-35; Mon, 18 May 2020 01:14:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJLm=7A=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jaUMq-0008Sx-Rc
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 01:14:56 +0000
X-Inumbo-ID: f7337eb4-98a4-11ea-ae69-bc764e2007e4
Received: from mail-qk1-x744.google.com (unknown [2607:f8b0:4864:20::744])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7337eb4-98a4-11ea-ae69-bc764e2007e4;
 Mon, 18 May 2020 01:14:47 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id z80so8666542qka.0
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2020 18:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3tvoe8SF1AjGsABKutuEKPrEzuPGqgtVPQhRYGoZ/qw=;
 b=EqaonDD1s63rJJcyTTB0dwNKRO7dRlGbjoVwcid1g/eOXpEooPxdi4HHl8eWvdpkSt
 kWpiCfceq4V8/WcdVlWw7gFIyYgS5diJXVyzA5aOXWMPsoTg9OjfC4uG85JwyKrCIAik
 CC9wzu5mNTzBxjcItSRQVmx9b+fdCxNtpI89u0OcBXQfVFTuXyMtMnl0J+xURksB/ocF
 lt/KmyD0nlof1MY8YwtMRuNGhNZZXwjrl5Gd0/cbhNJwQxl42FYbiVmKF7AaV9WhHgfh
 tfg++Qx2Q8R9b9QLq74Aj04CNVKKYrSXwE3vUiK8g4yEHRsF3dx4c6HtsK+WF3BeCO8v
 PBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3tvoe8SF1AjGsABKutuEKPrEzuPGqgtVPQhRYGoZ/qw=;
 b=l6JKWb81luA3nVGjUrG1+TTRX9Jgdr7u2JPHUYYI0sVzCX2Nd8Bud7lbJ7TN+0MNH9
 +1f226caSZ7UEAdJkgFGCIGtWRgiYhjGy3Ss7DOaBpyof/mfklvBfNAAtLvr67gHR+t3
 2CXh3GxpUgOPL/u72ZRfsEP1Mt1F/AVRcAiwlEBhgGRByrCla4ifAlHW62S4c2XghWSv
 JOAHj4sj+zThd6ANZ0JQIaTUMRMZUDAfpTvzgbbYIQRNR1moPx94FmkzD/QYenqvrTTF
 t+OkBbYjJWdp5poerbCg5r3/8gE1vf5PSfaYnDsrDOUE/zQm9Va9la7cPrIYo8/ppV33
 Cy3A==
X-Gm-Message-State: AOAM532j7vbtLFRxywkw33kCKgZCtcx4LmK0V2K224ZQZxivWFCYL9up
 e16PJOznUAQFV+F/mkQ3l6HRZ/FA
X-Google-Smtp-Source: ABdhPJx+0nrOUsdpBC+yOU0jzbNkIHJpkML3dNlwR+94zjFMhrwW4iamZSUQB1230VZmiawf0rfVPw==
X-Received: by 2002:a37:8844:: with SMTP id k65mr13969716qkd.309.1589764487202; 
 Sun, 17 May 2020 18:14:47 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:ec68:c92e:af5a:2d3a])
 by smtp.gmail.com with ESMTPSA id l2sm7072864qkd.57.2020.05.17.18.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 18:14:46 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 03/18] libxl: fix qemu-trad cmdline for no sdl/vnc case
Date: Sun, 17 May 2020 21:13:38 -0400
Message-Id: <20200518011353.326287-4-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200518011353.326287-1-jandryuk@gmail.com>
References: <20200518011353.326287-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wei.liu2@citrix.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

When qemu is running in stubdomain, any attempt to initialize vnc/sdl
there will crash it (on failed attempt to load a keymap from a file). If
vfb is present, all those cases are skipped. But since
b053f0c4c9e533f3d97837cf897eb920b8355ed3 "libxl: do not start dom0 qemu
for stubdomain when not needed" it is possible to create a stubdomain
without vfb and contrary to the comment -vnc none do trigger VNC
initialization code (just skips exposing it externally).
Change the implicit SDL avoiding method to -nographics option, used when
none of SDL or VNC is enabled.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
Acked-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
Changes in v2:
 - typo in qemu option
Changes in v3:
 - add missing { }
---
 tools/libxl/libxl_dm.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index f4007bbe50..b91e63db6f 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -734,14 +734,15 @@ static int libxl__build_device_model_args_old(libxl__gc *gc,
         if (libxl_defbool_val(vnc->findunused)) {
             flexarray_append(dm_args, "-vncunused");
         }
-    } else
+    } else if (!sdl) {
         /*
          * VNC is not enabled by default by qemu-xen-traditional,
-         * however passing -vnc none causes SDL to not be
-         * (unexpectedly) enabled by default. This is overridden by
-         * explicitly passing -sdl below as required.
+         * however skipping -vnc causes SDL to be
+         * (unexpectedly) enabled by default. If undesired, disable graphics at
+         * all.
          */
-        flexarray_append_pair(dm_args, "-vnc", "none");
+        flexarray_append(dm_args, "-nographic");
+    }
 
     if (sdl) {
         flexarray_append(dm_args, "-sdl");
-- 
2.25.1


