Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2794687EE22
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:56:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694952.1084346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHM-0005Az-P3; Mon, 18 Mar 2024 16:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694952.1084346; Mon, 18 Mar 2024 16:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHM-00053s-2C; Mon, 18 Mar 2024 16:56:04 +0000
Received: by outflank-mailman (input) for mailman id 694952;
 Mon, 18 Mar 2024 16:56:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHK-0002f9-Ff
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:56:02 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 661a90c1-e548-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:56:01 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4146172fb7eso2494145e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:56:01 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:55:59 -0700 (PDT)
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
X-Inumbo-ID: 661a90c1-e548-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780960; x=1711385760; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d6vqIoo60jsb5f3ItIQP3yygc1lD7+80VS35yrYdlSk=;
        b=NBpSb9Zy9fcZf7XOo2paKA3TvdUru2Z273ukor5lUiEr4y/owK2TuwNdO5OV4lOAFE
         ZAhWS7zO9LtUYjkZcMb6V7Tvl0YQ/xRu22JVeACw6X0pUijAWuih8Sf5LGCl39yjlW1E
         AYEezZEt722zY9Ef/YA3tsVYgISjXz0HjZ1q8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780960; x=1711385760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d6vqIoo60jsb5f3ItIQP3yygc1lD7+80VS35yrYdlSk=;
        b=koJqsTHUZZZC5eVYXnmw0PT7RDyvPomWAbSO8EQ6Be6yPDbKp5FnMdAjJdtThZhOnS
         d0g1P85SOIjyksGriuHxVrnIY99ICEgVjLOgS7B+8g21iTydwPejmhGoMNYEeEeNlSjE
         TrfDTkIdG5pNukmLN1pJeHJ6j5T4Gi1rxBZuER1bCZoeviJ5PMtMQCzfTXzng1NoAxuN
         8BypxF03xrVTXYEXEmuQLQNePAFILZRFbyTbXaIB3BUvtqslhnLKkyiM0HgoMSUEJbO1
         Y89tKELwQ1lPzWn9ehXQXfiY5/l0ZjEj1QXn4cbJn9Fc5MDqqOI76yea7C+h7HAN7fom
         pxAw==
X-Gm-Message-State: AOJu0YwZs6pCIskhK/Ef7XtfWDbUe5hYDQbLBSh4m86xL7wLaxsHXtEG
	oGMtL8R1i3TKDfmxkMB84g2i9sAI7YIFO3XiApRbc6N7niiTpKG9WlgJ2s7doQ2E21f2/PYdjuX
	B
X-Google-Smtp-Source: AGHT+IGVmI7hoax2kO6sT8eGLuG8aUxlCuwOu7OpEtCC+15tMFQlCVmk8irXv/63DlcF208QG7thSQ==
X-Received: by 2002:a05:600c:3588:b0:413:160b:fcb2 with SMTP id p8-20020a05600c358800b00413160bfcb2mr6727710wmq.30.1710780960269;
        Mon, 18 Mar 2024 09:56:00 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 11/36] ts-host-install,preseed_create: Do lvm vgextend at install time
Date: Mon, 18 Mar 2024 16:55:20 +0000
Message-Id: <20240318165545.3898-12-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When there's more than one disk, like the "pinot?" machine, the name
assigned to e.g. "sda" may change after a reboot, at least when
installing Debian Bookworm, which is using Linux 6.1.

I believe Linux probes disk controller in parallel and assign "sda"
to the first controller to respond, or something like that, so disk
aren't assigned a name in a predictable order.

So, instead of extending lvm volume group to a new disk on reboot, do
that at install time when we know that lvm is on sda.

Alternatively, we could try to set "d-i partman-auto/disk" with a list
of all disk, but that would mean knowing all the disk before starting
the machine.

This new shell script in /lib/partman/finish.d/ should work in all
debian, so replace the script in ts-host-install by this new one.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 Osstest/Debian.pm | 21 +++++++++++++++++++++
 ts-host-install   |  9 ---------
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index 98b2fc86..14ec2293 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -1312,6 +1312,27 @@ echo ===
 set +e
 ls -l /dev/sd*
 true
+END
+
+    # Extend lvm vg to other disks
+    preseed_hook_installscript($ho, $sfx,
+          '/lib/partman/finish.d', '99extend-vg', <<END, 0);
+#!/bin/sh
+set -ex
+
+log () {
+    logger -t extend-vg-\$\$ "\$\@"
+}
+
+vgname="\$(hostname)-vg"
+devices="\$(sed -nE 's/^[[:space:]]*[[:digit:]]+[[:space:]]+[[:digit:]]+[[:space:]]+[[:digit:]]+[[:space:]]+([sh]d[b-z])[[:space:]]*\$/\\1/p' /proc/partitions)"
+
+for dev in \$devices; do
+    log "Extend \$vgname to \$dev"
+    pvcreate /dev/\$dev
+    vgextend \$vgname /dev/\$dev
+done
+log done
 END
 
     my $dtbs = "$d_i/dtbs.tar.gz";
diff --git a/ts-host-install b/ts-host-install
index 43ed9285..17a1bf78 100755
--- a/ts-host-install
+++ b/ts-host-install
@@ -116,15 +116,6 @@ END
         target_cmd_root($ho, "lvremove -f $1");
     }
 
-    my $partitions= target_cmd_output_root($ho, 'cat /proc/partitions');
-    foreach my $l (split /\n/, $partitions) {
-        logm("| $l");
-        next unless $l =~ m/^\s*\d+\s+\d+\s+\d+\s+((?:sd|hd)[b-z])\s*$/;
-        my $dev= "/dev/$1";
-        target_cmd_root($ho, "pvcreate $dev");
-        target_cmd_root($ho, "vgextend $vgname $dev");
-    }
-
     my $kpath= $c{TestHostKeypairPath};
     my $kleaf= $kpath;
     $kleaf =~ s,.*/,,;
-- 
Anthony PERARD


