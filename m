Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AD887EE2D
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:56:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694956.1084383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHT-0006WB-Jd; Mon, 18 Mar 2024 16:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694956.1084383; Mon, 18 Mar 2024 16:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHS-00067z-F0; Mon, 18 Mar 2024 16:56:10 +0000
Received: by outflank-mailman (input) for mailman id 694956;
 Mon, 18 Mar 2024 16:56:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHM-0002f9-Qb
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:56:04 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67824e16-e548-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:56:03 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4140edd58c9so10184315e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:56:03 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:56:02 -0700 (PDT)
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
X-Inumbo-ID: 67824e16-e548-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780962; x=1711385762; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jEUzBm46DKDKIcvqZl7uzOx5U6pv71UqK2TcBX4GGFk=;
        b=h9N8BBsCRGmvBpDRoPOylUJn9KpiAdSIkC+GOlD/6yyPdRjiozWa2JN7Ey2JOtHTDT
         2/Xbc7zepa1/GSkOKdGiIZrA+Fh3JxwgyZUu/yWgKQF+L1FfANO23vrzPt54mPRYXMqC
         sETdIsY1IWxwlePqXgUO850uVE7xxzA8x+HUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780962; x=1711385762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jEUzBm46DKDKIcvqZl7uzOx5U6pv71UqK2TcBX4GGFk=;
        b=OKpxNWQ2KomxiM3f9HN3pfZj/zgf91o+wHgEC7yrRvAW2xaspjgB+lGY/mb8iYNNdl
         FQt3LH3oiyE8N5gq7lvbgEgyX9bBkIUfLyFPpaX7QrGUnpSy0YWmZJYPuW//XdyUfQB4
         LRA8sLh6POzdGPMK7VeNtu9+Ellp0BbVeIOMXzT8oaIilHhMlfAEYO8qxLrcbeKcJm7g
         UbgkO0J8PhqxQZT5xd0uWk8MJpFfioRJa6ll0W0kY8YhmDRgM0JlHnAVVS/uMdhvP1vM
         UfdDHxBAFHjoh/g5R0nW++M7x5pKDFRwItebHt23efwZNyMI+wqpWekipq5qXNz2NAEN
         zFjQ==
X-Gm-Message-State: AOJu0YwwqCtnznJqRs8vkzweHM+K4PoI5d3PuUBjuc8alz0z1ec85iPI
	zXTUywlUK5BzTXiBV94YIk0rp0FsZnoI3IBn3fPSHaSRVNy4N7WiGwGrFMTRVowLjJcSDXImIEG
	n
X-Google-Smtp-Source: AGHT+IHzbkjiHlHlbmYcOmyi2Ux5us6fmp/TDFt1UIjlqO3csZ1DIXqrVicrgzK5/h4a2vfbgqdK1g==
X-Received: by 2002:a05:600c:16d3:b0:414:a75:7457 with SMTP id l19-20020a05600c16d300b004140a757457mr59490wmn.10.1710780962746;
        Mon, 18 Mar 2024 09:56:02 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 14/36] preseed_base, ts-host-install: Change NIC NamePolicy to "mac"
Date: Mon, 18 Mar 2024 16:55:23 +0000
Message-Id: <20240318165545.3898-15-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On "italia?" machine, the two network interfaces are competing to have
"eno1", base on the "onboard" naming policy. So the name of the
network interface can change between "eno1" and "eth0".

Switching to "mac" should avoid the unpredictable name based on
"onboard" or "slot" policy.

The "mac" naming policy break `vif-bridge` for the "vif*.*" network
interfaces. So we will avoid the "mac" policy if the driver is "vif".
This also have an impact on guest created with ./ts-debian-install, as
they use the initrd from dom0, so the interface in the guest will be
renamed according to default policy (which rename eth0 to enX0).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 Osstest/Debian.pm | 22 ++++++++++++++++++++++
 ts-host-install   | 16 ++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index 102b0246..31d32d6f 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -962,6 +962,28 @@ cp /$RULESDIR/70-persistent-*.rules /target/$RULESDIR 2>/dev/null || true
 
 END
 
+    if ($ho->{Suite} !~ m/lenny|squeeze|wheezy|jessie|stretch|buster/) {
+        # Always use MAC address in network interface names.
+        #
+        # But keep the default policy if the driver is "vif", which match the
+        # "vif$domid.$idx" interface in dom0, and the interface in domU. This file
+        # is going to be added to dom0's initrd, which is used by some guests
+        # (created with ts-debian-install).
+        preseed_hook_installscript($ho, $sfx,
+            '/usr/lib/base-installer.d/', '05ifnamepolicy', <<'END');
+#!/bin/sh -e
+linkfile=/target/etc/systemd/network/90-eth-mac-policy.link
+mkdir -p `dirname $linkfile`
+cat > $linkfile <<EOF
+[Match]
+Type=ether
+Driver=!vif
+[Link]
+NamePolicy=mac
+EOF
+END
+    }
+
     debian_overlays($ho, sub {
 	my ($srcdir, $tfilename) = @_;
 	preseed_hook_overlay($ho, $sfx, $srcdir, $tfilename);
diff --git a/ts-host-install b/ts-host-install
index 88481038..0b6aaeea 100755
--- a/ts-host-install
+++ b/ts-host-install
@@ -248,6 +248,22 @@ END
     print CANARY "\n# - canary - came via initramfs\n" or die $!;
     close CANARY or die $!;
 
+    if ($ho->{Suite} !~ m/lenny|squeeze|wheezy|jessie|stretch|buster/) {
+        # Switch to more predictale nic name based on mac address, instead of the
+        # policy "onboard" which can try to set the same name ("eno1") to two
+        # differents nic, or "slot". New names are "enx$mac".
+        system_checked(qw(mkdir -p --), "$initrd_overlay.d/lib/systemd/network");
+        file_simple_write_contents
+            ("$initrd_overlay.d/lib/systemd/network/90-eth-mac-policy.link",
+                <<END);
+[Match]
+Type=ether
+Driver=!vif
+[Link]
+NamePolicy=mac
+END
+    }
+
     my %xopts;
 
     di_special_kernel($ho, sub {
-- 
Anthony PERARD


