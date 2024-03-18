Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54ACC87EE6B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 18:08:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695033.1084560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGT9-0005Rb-7P; Mon, 18 Mar 2024 17:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695033.1084560; Mon, 18 Mar 2024 17:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGT9-0005P2-3w; Mon, 18 Mar 2024 17:08:15 +0000
Received: by outflank-mailman (input) for mailman id 695033;
 Mon, 18 Mar 2024 17:08:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHY-0002f9-50
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:56:16 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e3d44a0-e548-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:56:14 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4140efa16caso10029935e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:56:14 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:56:13 -0700 (PDT)
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
X-Inumbo-ID: 6e3d44a0-e548-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780974; x=1711385774; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HtBRI5q1ugGBdzMJ59lHIWI9JzPcvWqKCvzTLY9svUQ=;
        b=EE+xHZOAJhdSIh8NINBrfOwg2ccsxY8pxncDazLPiZQUpqUgPck3OEFXN3fjzxR5pi
         KUXJCy+hfpp1QqkF9ERwK+QQsvkQFZCPLPEcHqOn6x03epFLM4tS7gU3wrT+GjBBKJJ5
         +Ne+SGfWQRNinS/0TKKsSPXKtQSO9Y91zFwc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780974; x=1711385774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HtBRI5q1ugGBdzMJ59lHIWI9JzPcvWqKCvzTLY9svUQ=;
        b=WhDW3fxUIz4b7ymsCgVZkMLCCmzcdyzogZnLbPRqOuQRkgM/AdORPm3j2OpFU1RWpw
         rixjwt8E8y8L8zLsOGriJDoKqby/tRI3x9XIQ8qNcuAsnVinx2yXEjoVrrGpGbi+eicf
         y42D62jzZHWimSAnQHjOvXjMrKC7mfB1dmLcbpDP6lITLMo7TdiZB6b9sMOO+YEWkysB
         sYjD/y+scFR7TbqmiP4bOQFFwH5BGieHMh4Wg/95CBYJVLE8OTiMelwLraGkBA2qM8Kr
         JSwC16Sfla1nPT7uu+d1ju08doeHRrNTgPrIeFjsiQgqlEm5IZmU7AynFuD2jk24rjz3
         oRrg==
X-Gm-Message-State: AOJu0Ywj2Tb9c73QObJiVscowmKcJrkh4F0vH/gVWxkR8o+ZPKHPK7Lx
	czS2RyQfx6LZ0W6La7FmPNcMepQAwdsUPLN+SNK90KP/XEENIL0Ooms09w3ygOEo4OvCrz2cz4y
	d
X-Google-Smtp-Source: AGHT+IFYpwoT1G6V0oSTOM12VU2g8triWdGvu3YXT2EEYJ3eTddOLxI3qxKpKBcLlryHUBMfFt9Z5A==
X-Received: by 2002:a05:600c:a02:b0:414:8d7:8292 with SMTP id z2-20020a05600c0a0200b0041408d78292mr5089597wmp.0.1710780973942;
        Mon, 18 Mar 2024 09:56:13 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 27/36] ts-debian-fixup: Fix nic names for bookworm
Date: Mon, 18 Mar 2024 16:55:36 +0000
Message-Id: <20240318165545.3898-28-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`xen-create-image` doesn't create image for bookworm with a working
network, we need to fix the interface name.

For reference, there's a bug report upstream:
    "UnPredictableNetworkInterfaceNames 'fun' with Bookworm domU: eth0 -> enX0"
    https://github.com/xen-tools/xen-tools/issues/65

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 ts-debian-fixup | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/ts-debian-fixup b/ts-debian-fixup
index 810b3aba..4cf5f980 100755
--- a/ts-debian-fixup
+++ b/ts-debian-fixup
@@ -142,6 +142,20 @@ sub filesystems () {
 END
 }
 
+sub fix_networking () {
+    return if debian_guest_suite($gho) !~ m/bookworm/;
+
+    # `xen-create-image` doesn't setup network in a way that work with bookworm.
+    # The guest boots with "enX0" interface name, but it only try to setup "eth0".
+    # https://github.com/xen-tools/xen-tools/issues/65
+    target_editfile_root($ho, $mountpoint."/etc/network/interfaces", sub {
+        while (<::EI>) {
+            s/\beth0\b/enX0/g;
+            print ::EO or die $!;
+        }
+    });
+}
+
 sub unmount () {
     guest_umount_lv($ho, $gho);
 }
@@ -243,6 +257,7 @@ target_cmd_root($ho, debian_dhcp_rofs_fix($ho, $mountpoint));
 console();
 randomseed();
 filesystems();
+fix_networking();
 otherfixupcfg();
 writecfg();
 unmount();
-- 
Anthony PERARD


