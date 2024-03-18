Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0277F87EE2A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:56:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694953.1084355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHO-0005Pw-Gt; Mon, 18 Mar 2024 16:56:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694953.1084355; Mon, 18 Mar 2024 16:56:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHN-0005De-Cy; Mon, 18 Mar 2024 16:56:05 +0000
Received: by outflank-mailman (input) for mailman id 694953;
 Mon, 18 Mar 2024 16:56:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHK-0002gq-Ud
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:56:02 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 670cf8ff-e548-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 17:56:02 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-513da1c1f26so5002614e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:56:02 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:56:01 -0700 (PDT)
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
X-Inumbo-ID: 670cf8ff-e548-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780962; x=1711385762; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2v7zAAUJTcHPnQWXPNIf3DNM+jdDTySTxnOrx9fx8gI=;
        b=SEsFMIhNJRYmVzF0aUM05JGCAUoRxpGvFltsmBKxpzd2GqvuEnpNfCC9UF+A0goe7w
         ZxgZJ5Ws7oxo6t0qMnc33c0t6Yr6dWGzPcFBreQWW4jIykiPmhpCsk4s8v5fbuXEdqp5
         Z2ATGOxYNEh2P9BjLF/MXl8n92a9wO02vE1gE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780962; x=1711385762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2v7zAAUJTcHPnQWXPNIf3DNM+jdDTySTxnOrx9fx8gI=;
        b=cfS2Qm5rStoUaDewrQvWU0p4/NKD30uTCvm3X3RD5ycaEe0acyXNGhO13ygFzAqjJy
         a4nB7gOG2eltieZ/6lb1HZGez7eEAlpTbVDD5Kh9w+M9XHHc3xNJnMlnyD0rzeJ7ribV
         DUoGL/54sAvuqlhcLzno2iYGXZ6SQJPs06pOCl0bQ5y2r00KhdMOjOnEjMa8URAR21ky
         Fe5pmUCdzxMOGQn6e/vSbH6A/5QVTd9QntIpAtZlioZUZ/t2Jd5wxxvxCu3FQPGvp7N/
         dzxulO+wsd17rEZP3stSZdm/NLM+G4u4/kq5igIrupHyhUCZUVxOhOyMge2+aF/eELfk
         tu2g==
X-Gm-Message-State: AOJu0Yxo+loR+qmM8Kp9rAI2HNrXSd8XWiAZgmYTzLgfQMXPG7xB4iew
	B2BV56A+my94suYki1wRhJbEqsQY6xMG+pcaiia9KsWMrpKIh0fQDNo6b5yy7nxjg4bQI6gZ4fS
	a
X-Google-Smtp-Source: AGHT+IEVe9Iy8l1iOZhUjc/dwpqS9uIw7e2EYiEnDJrFJCr6GwYqghYVQZd1C0pbnwZcEwEgPhUZCA==
X-Received: by 2002:a05:6512:21cc:b0:513:27a1:24cb with SMTP id d12-20020a05651221cc00b0051327a124cbmr7433132lft.51.1710780961922;
        Mon, 18 Mar 2024 09:56:01 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 13/36] Disable persistent net generator on Bookworm
Date: Mon, 18 Mar 2024 16:55:22 +0000
Message-Id: <20240318165545.3898-14-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This schema doesn't work. Even if the udev rule is there, the name of
the different NIC are different from one boot to the next. On a
machine (sabro*) with 3 different NIC, the name of each interface is
basically random and could take on of three name, "eth[0-2]".

net.ifnames=0 does still mean that we have "eth*" names, but the
generated file "75-persistent-net-generator" doesn't seems to name the
interfaces as expected.

The new predictable network interface names schema seems to work well
enough. The names are still the same after rebooting into Xen, at
least on the few machine tested so far. But, we will change to a "mac"
name policy in a follow-up commit.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 Osstest/Debian.pm | 12 +++++++-----
 ts-host-install   |  2 +-
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index cf5a3bd1..102b0246 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -87,10 +87,12 @@ sub debian_boot_setup ($$$$$;$) {
         $kopt .= ' '.$targkopt;
     }
 
-    # https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/
-    # In fact these are anything but predictable.  We use the scheme
-    # from Debian jessie and earlier, persistent-net-generator etc.
-    $kopt .= ' net.ifnames=0';
+    if ($ho->{Suite} =~ m/stretch|buster/) {
+        # https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/
+        # In fact these are anything but predictable.  We use the scheme
+        # from Debian jessie and earlier, persistent-net-generator etc.
+        $kopt .= ' net.ifnames=0';
+    }
 
     foreach my $hook ($hooks ? @$hooks : ()) {
         my $bo_hook= $hook->{EditBootOptions};
@@ -800,7 +802,7 @@ sub debian_overlays ($$) {
     # network device names', is the default; but it is anything but
     # predictable, so we disable it.  Instead, we restore the
     # 75-persistent-net-generator mechanism from jessie and earlier.
-    $maybe->("overlay-persistent-net") if $ho->{Suite} !~ m/wheezy|jessie/;
+    $maybe->("overlay-persistent-net") if $ho->{Suite} =~ m/stretch|buster/;
 
     $maybe->("overlay-$suite");
     $maybe->($c{OverlayLocal}, 'overlay-local.tar');
diff --git a/ts-host-install b/ts-host-install
index 17a1bf78..88481038 100755
--- a/ts-host-install
+++ b/ts-host-install
@@ -214,7 +214,7 @@ sub setup_netboot_firstboot($) {
     system qw(rm -rf --),"$initrd_overlay.d";
     mkdir "$initrd_overlay.d" or die "$initrd_overlay.d: $!";
 
-    if ($ho->{Suite} !~ m/wheezy|jessie/) {
+    if ($ho->{Suite} =~ m/stretch|buster/) {
 	my @cmd = (qw(cp -dR overlay-persistent-net/.),
 		   "$initrd_overlay.d/.");
 	logm("using persistent-net-generator: @cmd");
-- 
Anthony PERARD


