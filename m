Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B88A85A7E
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 12:52:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947000.1344748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Bzn-0006zh-Cr; Fri, 11 Apr 2025 10:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947000.1344748; Fri, 11 Apr 2025 10:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Bzn-0006wX-7E; Fri, 11 Apr 2025 10:52:27 +0000
Received: by outflank-mailman (input) for mailman id 947000;
 Fri, 11 Apr 2025 10:52:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cS7z=W5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u3Bzk-0006S2-HX
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 10:52:24 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c27b090-16c3-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 12:52:22 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so13396505e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 03:52:22 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233c81f6sm78493215e9.20.2025.04.11.03.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 03:52:21 -0700 (PDT)
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
X-Inumbo-ID: 0c27b090-16c3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744368742; x=1744973542; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIPah+Nx1tiLQuGiODCJoASZliWThOAtOi1NpKaYDJ4=;
        b=eCIHm3Zb07Cne8mjxEAH8IYLceUlHP8bQtjTL2fA9XwUS8ba8ofOuH9UoHR3h/dc2F
         9yKLhIEUqn9N4GWhX+qGWTGD+w+H3LOn5XZmsjk7GPWV6VD8n7gm7pqEJhc7cQ0iHBu6
         tvcij3oLA6ZOvostpijPNy9QNVAhWXeUMWI/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744368742; x=1744973542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kIPah+Nx1tiLQuGiODCJoASZliWThOAtOi1NpKaYDJ4=;
        b=sBLkg5RcOCwgW/6GoYzR2xouMCEtUKe1NikuaXzPbWDGmKxqOveW2K0JwSOJ14Xfxx
         Os2nySYU8/jJ1qzNWJstDs7N8H33BeK1u3Dc/i/zYNtCqwObEyNcbvZu/BvFDeM7YKrl
         di7ZDhM/xbmQiZx1lDhZRb5V0G4/FDChtMfXylvdfqvjsbyuTBfcAKWZfvmhb19WSs0g
         8mKoAqG8HALVpLsOouq/GB3GYn8TbtpGBB+nM1YSoOsPmZ85/0YkttAk04+PGH6sHGi2
         JP2MS+oQy+YbQO7qy5V5GwRYVWpd7tYfMIvWnkdW9gFEwlF5gZaD0JOB5N5YvrTRm2AW
         axDw==
X-Gm-Message-State: AOJu0YwnIEqh4eQtE2hO76wtHCh9du9L39hjQ0TqPP0iyNnbvN7qujDD
	u0C+YVVQ2uU2BZUzQ0AV5wW91VPlw7Q0TLS0/PHw95k4CSqcSQb9pBPKPZCe5EhotzBIWbhV+gZ
	evkA=
X-Gm-Gg: ASbGnctVC8cv49Qw/4cB7g1qoJL4rNtAOh9G9n7hwoqPSNiJIwk7IWAtYJnLuxZMgj0
	pDbAa5KRjiWKaiaWtjlGsfralbVcny0BEVx3C8eqvXoJ5fTHmNXc/nY51fya4aFy97Xgp4+yOQp
	WVsxgjPIMs/mvKYnF41j0IaVgFs4Lgg3f7Sq8TA3gsnVqasQtgDI68WUAOoU2jUqF4GvTorNVwE
	QukvyV8eTB3h35dHObTW5EezkKTXH+pLQ+09qgWYfcIGSMomDi4fxqPG7uUootCeuveO3ss0faW
	bhwPsdLC9lmeAAFcgj5EIp/Vw7/zYCV8GLxaTsatpIAYc4UQXD4AGxqFMxw/i1HEhTXe1aDZM1f
	6SPWqZNXeWjIWKieX72+84Ryl
X-Google-Smtp-Source: AGHT+IHxNnyGxSy+jEWj44G/v+alf89pz1jubUkwU8Hk71aX6eIU0Xs2G157ky69QIENoNftEyM7cA==
X-Received: by 2002:a05:600c:83c6:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-43f3a7d872dmr21597355e9.0.1744368742037;
        Fri, 11 Apr 2025 03:52:22 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 2/3] Shrink the rootfs substantially
Date: Fri, 11 Apr 2025 11:52:16 +0100
Message-Id: <20250411105217.2141356-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250411105217.2141356-1-andrew.cooper3@citrix.com>
References: <20250411105217.2141356-1-andrew.cooper3@citrix.com>
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

I'm still working on the integration of the new rootfs's int Xen, and will
hold off until committing that's ready but
https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1763510164
shows good early progress.
---
 scripts/alpine-rootfs.sh | 60 +++++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 26 deletions(-)

diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
index c29c92d1c682..30d426d6e88f 100755
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


