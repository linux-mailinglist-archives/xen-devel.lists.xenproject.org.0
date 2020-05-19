Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE47F1D8D58
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 03:56:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jarUC-0000AL-Ne; Tue, 19 May 2020 01:56:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Ytr=7B=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jarUA-0000A7-Lo
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 01:56:02 +0000
X-Inumbo-ID: dfcb737e-9973-11ea-b07b-bc764e2007e4
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dfcb737e-9973-11ea-b07b-bc764e2007e4;
 Tue, 19 May 2020 01:55:54 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id n14so12854525qke.8
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 18:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3tvoe8SF1AjGsABKutuEKPrEzuPGqgtVPQhRYGoZ/qw=;
 b=mtmHxT/nE6SREvNjSTa70xknAuOQYCx3mhJxYqKW85A3On172I5aHclVH4KtBHHOoT
 wOnMHUayFj8Z4zzIVlul9ezbk7gVx1yjmoE5CGuHqgw88MMd1JxZDtMb45Zu97BX/Yo9
 LF1NF7C2VLdrRkFAhqNfujQ+aL/Ynn7HMS4FRNmnvzlxvlBWBX++kmklq6lZ9Ll5EVvI
 bAuqUU8QCnaBqJqH5U0ZynbreaZF+NOG4Z4hg1RNhCBTxau6UubxlS7t7vmv7EIKPXln
 /qOyDtZZ3vt9eCQBnhsrqcDM1bXgGmedKH7dPeplz2jXSevSfL8gwLjGo/ykyUReeYjY
 nW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3tvoe8SF1AjGsABKutuEKPrEzuPGqgtVPQhRYGoZ/qw=;
 b=MbYjBBQlcM6H6vdxpRtth6Aa/+5uy8FxaJCgNiACT2Du6pnuL+HGB7JpDBh5NyWFl/
 RqpYC6pVX9mLTFCqLkfAz+cuXduku+QyycA4PCg4ujI7YYT9vFCj69wN2E6q5g3UsC2H
 y2GklUngD0eh0d1sVoqsHnu2PPy9wHidr+OAT+ezVK6RiR328cC8+wxlSXTnDZJjKwrd
 DG7lOdMQsD+yK/trGDIblhYOuyttUaYUYnHc/QhhQ/lPJ1hPED3W4jm7Dm9Li9wLbrne
 ANrE8Bff8DDBSPhRVQpHkGYKGQIv5bCoZEbKkqB9muBd5O4aEq8cM1FPrPwbpfD3gevv
 YHLw==
X-Gm-Message-State: AOAM530HiauYalJPlcROLdqw7tnE8/nU1farCmo8TZPO1LaXx7AnLJNq
 mGC1pVTpf8XKOMUqIiYzVq9Hdf26
X-Google-Smtp-Source: ABdhPJyYIiU6vwj09ZG7ffxrFoNLNx6KlximjmsF7KaLQBQ/lZA6U6mHSo6feSFCergEFepY74bWYg==
X-Received: by 2002:a37:5146:: with SMTP id f67mr4070554qkb.308.1589853353718; 
 Mon, 18 May 2020 18:55:53 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:e463:db9c:c6eb:4544])
 by smtp.gmail.com with ESMTPSA id q2sm9731898qkn.116.2020.05.18.18.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 18:55:53 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 03/19] libxl: fix qemu-trad cmdline for no sdl/vnc case
Date: Mon, 18 May 2020 21:54:47 -0400
Message-Id: <20200519015503.115236-4-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200519015503.115236-1-jandryuk@gmail.com>
References: <20200519015503.115236-1-jandryuk@gmail.com>
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


