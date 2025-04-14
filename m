Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AF3A87FC1
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 13:52:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949959.1346396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4IMb-00088R-AR; Mon, 14 Apr 2025 11:52:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949959.1346396; Mon, 14 Apr 2025 11:52:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4IMb-00086X-6g; Mon, 14 Apr 2025 11:52:33 +0000
Received: by outflank-mailman (input) for mailman id 949959;
 Mon, 14 Apr 2025 11:52:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KxE1=XA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4IMa-00086O-EQ
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 11:52:32 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f19e0e25-1926-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 13:52:30 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso32295925e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 04:52:30 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96c123sm11099913f8f.36.2025.04.14.04.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 04:52:29 -0700 (PDT)
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
X-Inumbo-ID: f19e0e25-1926-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744631549; x=1745236349; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0n3tqYwZF1Dn/iihDQJAJlOGSgzTjHg8bzM4sIRzbcM=;
        b=M/j1b9xFZ44FgByqzO5xR6AoXtzLxotBK/lyOwJrxPJCoBuD19PkkDfcRPrJ+3PInP
         i3rMwGxCI59u8+Iowjo17ZH4jYikyEOb9eOO0p8UgRipknT1jqEgE5y7+h4rTngIfW1T
         EdGLzEI0/T9Id+zToW5RLOsSomizVr3kJtXzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744631549; x=1745236349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0n3tqYwZF1Dn/iihDQJAJlOGSgzTjHg8bzM4sIRzbcM=;
        b=vfVpBhWjotN3bR77PHRLTGL42F7xAOEOmByjwN/21KUSftxaXEKRW41BD323gagUFC
         bcUwpgp11F91qNLIGToLd9P7HuCXYYkFf4oaqBmgMhOzYo7YglBbfJnBHwglmYIbKhO3
         SosrvpamwlLv8siYHGt2oyOtdR6Qj3UPQZuO9uw5x/nFfaZPbbWSAgf9IOY5OELHlqxK
         t8PFaJxg3nC2D6chP4GbWNLJqGuIXDYsyuP5IvJ/zZ7KloZIVGRQlnbKf3snOHTtcV7C
         rgMj5xWWUUIMHV+G5TkN54F3ZtERlcjhh7F1dtSxPrQMZ/sw9+XH/c2creewAhnJ0XHu
         XY+w==
X-Gm-Message-State: AOJu0YwLDsOzFExSYRMKgBuOSvVKU4nnhxhv77pJMaBXKaon+CKhUpvV
	9mlF2zMvpc9GFbgX1SD2M1lpYJA6p3bP+TqvCpUHtDOSHo8+Tbup+8YK99QMDPFX4zaEF4AOmmB
	saSA=
X-Gm-Gg: ASbGncvU+fV23ZolkEo6VsExhdC7pbbhBefCsNk8sFvwjrO8JX8fm7Km7HciEozAzqb
	9BZWG+f4VnGFZ2BEbgWkzZoygOT5j0QBS+wLpoloSNADlUrQgZkKmQOg271ngPvGsJWZbfPC6ab
	El3d9CP4dwjCgo0BsdeXw1rwAcWL7T9TA7PQYh25r60xU9TJaSfqglY1A/kIULG1KwIxpsjrYXq
	iMsIPLr++fXfRsZydbbeRBVW0/uvrkn4EcpjZLmv9jgpSDmMZ+vX48668f3ofVx03IADisf5tyq
	3MwVMxxGAa7VpqhlnsNSRgqZDrtXvSLxQPGfsoiWG5mvGCelgF1Aiqb0D7nDub028YVKYExTTX6
	EhY3LnihaBCuwqw==
X-Google-Smtp-Source: AGHT+IH2NDdWIpHMEVJ14kGKU7RlilwWD5YfOnSTjM00pL91i5eecFvFzdc/QbtpHAW7ylClHIzSQA==
X-Received: by 2002:a05:6000:22c8:b0:391:2d97:7d0e with SMTP id ffacd0b85a97d-39eaaebd2d7mr9881974f8f.42.1744631549460;
        Mon, 14 Apr 2025 04:52:29 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2.1 4/7] Shrink the rootfs substantially
Date: Mon, 14 Apr 2025 12:52:26 +0100
Message-Id: <20250414115226.2357714-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414101843.2348330-5-andrew.cooper3@citrix.com>
References: <20250414101843.2348330-5-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

bash, busybox, musl and zlib are all in the base container.

python3 and ncurses are in principle used by bits of Xen, but not in anything
we test in CI.  argp-standlone, curl, dbus, libfdt, libgcc and sudo aren't
used at all (for x86 at least).

libbz2 and libuuid were pulled in transitively before, and need to be included
explicitly now.

Use apk --no-cache to avoid keeping a ~2M package index on disk.  Use apk
upgrade in case there are changes to the base container.

Remove the modules scan on boot.  We don't have or build any (except argo, and
that's handled specially).  This removes a chunk of warnings on boot.

This shrinks the rootfs from ~30M down to ~8M.

Factor out some x86-isms in preparation for ARM64 support.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

v2.1:
 * Extend commit message
 * Use apk upgrade

https://gitlab.com/xen-project/hardware/test-artifacts/-/jobs/9713228239
https://gitlab.com/xen-project/hardware/test-artifacts/-/jobs/9713228242
---
 scripts/alpine-rootfs.sh | 60 +++++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 26 deletions(-)

diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
index 75e2f8648ce5..b01de9709d02 100755
--- a/scripts/alpine-rootfs.sh
+++ b/scripts/alpine-rootfs.sh
@@ -4,33 +4,42 @@ set -eu
 
 WORKDIR="${PWD}"
 COPYDIR="${WORKDIR}/binaries"
+UNAME=$(uname -m)
 
-apk update
+apk --no-cache upgrade
 
-# xen runtime deps
-apk add musl
-apk add libgcc
-apk add openrc
-apk add busybox
-apk add sudo
-apk add dbus
-apk add bash
-apk add python3
-apk add zlib
-apk add lzo
-apk add ncurses
-apk add yajl
-apk add libaio
-apk add xz
-apk add util-linux
-apk add argp-standalone
-apk add libfdt
-apk add glib
-apk add pixman
-apk add curl
-apk add udev
-apk add pciutils
-apk add libelf
+PKGS=(
+    # System
+    openrc
+    udev
+    util-linux
+
+    # Xen toolstack runtime deps
+    libbz2
+    libuuid
+    lzo
+    xz
+    yajl
+
+    # QEMU
+    glib
+    libaio
+    pixman
+    )
+
+case $UNAME in
+    x86_64)
+        PKGS+=(
+            # System
+            pciutils
+
+            # QEMU
+            libelf
+            )
+        ;;
+esac
+
+apk add --no-cache "${PKGS[@]}"
 
 # Xen
 cd /
@@ -45,7 +54,6 @@ rc-update add dmesg sysinit
 rc-update add hostname boot
 rc-update add hwclock boot
 rc-update add hwdrivers sysinit
-rc-update add modules boot
 rc-update add killprocs shutdown
 rc-update add mount-ro shutdown
 rc-update add savecache shutdown
-- 
2.39.5


