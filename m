Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B060DA87D5D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 12:19:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949557.1346094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Gtz-0006PA-Mq; Mon, 14 Apr 2025 10:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949557.1346094; Mon, 14 Apr 2025 10:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Gtz-0006Mk-G7; Mon, 14 Apr 2025 10:18:55 +0000
Received: by outflank-mailman (input) for mailman id 949557;
 Mon, 14 Apr 2025 10:18:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KxE1=XA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4Gtx-0005Nh-On
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 10:18:53 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd23d9a6-1919-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 12:18:52 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43ede096d73so29815775e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 03:18:52 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233a2f08sm171340495e9.12.2025.04.14.03.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 03:18:51 -0700 (PDT)
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
X-Inumbo-ID: dd23d9a6-1919-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744625932; x=1745230732; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlk2C2qbHJoC+R/qrRgQwbQ441YQiHB5rm1pXRjQnSc=;
        b=sz0ZQO+H82rgAbZ7eplpczt/+u+akZusZPjcGAxJX5gCh4hIwEAtlNzn34AMcfRXT/
         5QOxAWqpA7ZqsLIaCypmE2OhsdGLYxfEQJF1V3AJkOsNnjxs3djGdHclP7oH3bc4Ag7i
         kDXtzO0wHmsWtJ4HXSk8m/nMlMCxqWG5bL/9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744625932; x=1745230732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlk2C2qbHJoC+R/qrRgQwbQ441YQiHB5rm1pXRjQnSc=;
        b=TKBotqxpqyTLcUziIeLviGkztIPAOYNcxnwSeaVVSUDTj+2aj/qF0k8r2+czorhkbh
         BrvSDn3Zeffh6e9t9I+PG/NFZSw3w2cKG059QEyBPGzYMkvFPCELoT3vhsjYSa1I3MuB
         JnKCwdAf+VMlPyQ6uZP7hSrEuSOLBD2T59Lw9p5+cNY+E4Udpj5feW/XmLMa7UdDcZjV
         mFmtLIlkLlDuJCEc7SVXec/qlr8zURSliVFYswqWXGmAGL40asnHoZJkO5m6+GeO+oZL
         dz+ZMywapb5uNTjKDUsn3DA3EWY9XGeDQCv1tdk4brqegkCIeO0LuzvjBin/GG+6pt92
         /MjA==
X-Gm-Message-State: AOJu0YySjKx5hvDI9ag6cuZqT/AKyuUZi69gAdLZwaRsH3L4ajx1vzSo
	MbZ4z5YB201QErupGeewy1737JLZlTTq0aRhkVwRXEkpY6GNyvSEklnsVnToO9kfdEIPGdpJsWp
	xiTQ=
X-Gm-Gg: ASbGnctgNyMdCFyd9lWLBvfHL/noi+sB7uDQpvpCMkB4o7VJvKGkoKZB3eqKxfabWOY
	jJfDyaoxgJuRAplLqqZXZMmILR99oWTAx2sMNrqVD3jiKtBmhX5m2WOPp3liMEmb8tFN+POMh0I
	LzUIxizHC349+jK1Ra8dzmBCFupjfxos+zXswzZO8MLR0ZDrsSTJ1CC5jf800S++03UV7wjfuJO
	P+HLZ5RD1ubhXM1MP5ust14QW7ORTkSGFPlp/EJ8yOCUu/BCwKyWfm9C99K3qaBH010lxu+mfzQ
	P7ZHbZ1jZlQR+d1bayiNcWD28Q2m3ihs+32xJfg8NadzPMx8+rQqatE4CbNhmBLki8fSvZiti5f
	yeb+OE+X85LPzCg==
X-Google-Smtp-Source: AGHT+IEYbjX2/qPltvHzwBvhqVGJSlcIvueTuo9Pe0SPfLBl1RG9OOR//v0UwuHwn84+dlnokajXwQ==
X-Received: by 2002:a05:600c:46d1:b0:43d:36c:f24 with SMTP id 5b1f17b1804b1-43f3a93de33mr103346745e9.13.1744625931696;
        Mon, 14 Apr 2025 03:18:51 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 4/7] Shrink the rootfs substantially
Date: Mon, 14 Apr 2025 11:18:40 +0100
Message-Id: <20250414101843.2348330-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414101843.2348330-1-andrew.cooper3@citrix.com>
References: <20250414101843.2348330-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

bash, busybox, musl and zlib are all in the base container.

python3 and ncurses are in principle used by bits of Xen, but not in anything
we test in CI.  argp-standlone, curl, dbus, libfdt, libgcc and sudo aren't
used at all (for x86 at least).

libbz2 and libuuid were pulled in transitively before, and need to be included
explicitly now.

Use apk --no-cache to avoid keeping a ~2M package index on disk.

Remove the modules scan on boot.  We don't have or build any.  This removes a
chunk of warnings on boot.

This shrinks the rootfs from ~30M down to ~8M.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 scripts/alpine-rootfs.sh | 60 +++++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 26 deletions(-)

diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
index 75e2f8648ce5..72c29e0a0a13 100755
--- a/scripts/alpine-rootfs.sh
+++ b/scripts/alpine-rootfs.sh
@@ -4,33 +4,42 @@ set -eu
 
 WORKDIR="${PWD}"
 COPYDIR="${WORKDIR}/binaries"
+UNAME=$(uname -m)
 
-apk update
+apk --no-cache update
 
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


