Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D95CA85A7C
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 12:52:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946998.1344732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Bzk-0006hs-QL; Fri, 11 Apr 2025 10:52:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946998.1344732; Fri, 11 Apr 2025 10:52:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Bzk-0006g0-N4; Fri, 11 Apr 2025 10:52:24 +0000
Received: by outflank-mailman (input) for mailman id 946998;
 Fri, 11 Apr 2025 10:52:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cS7z=W5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u3Bzj-0006S8-Fq
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 10:52:23 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bd54e34-16c3-11f0-9ead-5ba50f476ded;
 Fri, 11 Apr 2025 12:52:22 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-39c0dfad22aso948452f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 03:52:22 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233c81f6sm78493215e9.20.2025.04.11.03.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 03:52:20 -0700 (PDT)
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
X-Inumbo-ID: 0bd54e34-16c3-11f0-9ead-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744368741; x=1744973541; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMF9e3oJkccAPgvDEUGsPmSxBbanEG/SINaFCwPFSM0=;
        b=vtgJBQBCCH1AKUxb7TS6Tcise1eT1gVjJMUwXQN/7sNWg/CB1U/1D8rx8qBz7D1RX2
         1FeWmaah3j/XRtd/NyTRjrxAupoqEyxNJUH5HL/dFgxQa28ybrjxe4A4NuKoTExOJLky
         bMjCtD9/GtFpm/iq3n3lnCGB0/PInoS/kbSt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744368741; x=1744973541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMF9e3oJkccAPgvDEUGsPmSxBbanEG/SINaFCwPFSM0=;
        b=mcxiN9oH3B0Z4I+WjHS87+tmj228TNvTGuZNQ038fahncz9wWbWmTntLkAn4f4LElB
         tn1bFSVS4FGa0V/79dN0oz3Kacq7ngAEkXiMmTlBPBT/Pv85WPTx500o5awCBb/ujkae
         Teyon3Unlp52rf1AI3I2mP0n4eRUbimBJ4i/fE0JhdJ4VlJEFzWv9Sk/zk6Rzutnr21h
         VWO81JzBmGzyxSNzXCaSOCR7i7zMtErljsZIUkTmLmEnurzATJRhTwkKNHXt0yzg3M0A
         R5OCQxgm9krCm+tafssh6Es0IxSBZaI7uSGaoqqD7rUMm9g4RahU3xVVwsKWiVe5vo7J
         yGSw==
X-Gm-Message-State: AOJu0Yylr73Z6D9tzzJRtm/zebPRWw2icfCXmoKOTmBgso/PB0vRn1yf
	RXLUjTfersu8yRbalbP29SRBbDi38w0Dp/6vkLw8OVBMap82yKr+VBHRbteWjD6rNPN05osFPLR
	fYbI=
X-Gm-Gg: ASbGncsrZD8g6vRRqZiVEKfQGV7lg3Rbz/ZS3sSuxwQ05mbVPlCfvYTE8TMC/kjHzq9
	TBnBD/zSXiFOlECAhaZUKyhWZ5CoIBZN63wbixbPtxx7iTNrR7TDxXPEWBQmZQwu4BtGMv0PX+S
	ZUkXogL2bXTyRzssDwpts92KRAedlSbDA4UiOnZiH9TX25kTz4Ub6upvzNpYVTKCxS6nduO5ChC
	932XLZPj/muDyHUt3Z6UytvVj6speKXpa7VPGsBPWkjZkYE6XzsRV7r1wmicOwI7KiamZC66pFW
	xmdoX72KTNKZUNZgEB9mrwZLysxxlGJ5ghcpgaTgi5yi3ipk5qPHeVUJwEVPbhmPKmI2YlOEbSs
	fvTCIOI3AF/VXlpeVh2pYzJn7
X-Google-Smtp-Source: AGHT+IF/GXqtxQeTKbNkj/0FtvWWntKG1rB1kAsgxo5ygd409/KHLm+X2aCrn0x8/6kbcgWZFkgAcA==
X-Received: by 2002:a05:6000:144d:b0:391:4999:776c with SMTP id ffacd0b85a97d-39eaaecdb44mr1931563f8f.40.1744368741248;
        Fri, 11 Apr 2025 03:52:21 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 1/3] Rework rootfs generation to make a cpio archive
Date: Fri, 11 Apr 2025 11:52:15 +0100
Message-Id: <20250411105217.2141356-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250411105217.2141356-1-andrew.cooper3@citrix.com>
References: <20250411105217.2141356-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rename the script as we're going to use it for ARM64 shortly, and have it take
a tar or cpio parameter to determine the output format.

Turn it into a proper bash script, and provide the cpio form under the new
artefact naming scheme.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 .gitlab-ci.yml                                |  9 +++++++-
 ...6_64-rootfs-alpine.sh => alpine-rootfs.sh} | 21 +++++++++++++++++--
 2 files changed, 27 insertions(+), 3 deletions(-)
 rename scripts/{x86_64-rootfs-alpine.sh => alpine-rootfs.sh} (75%)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 1d2c72b268a3..916c5ae9d508 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -42,6 +42,13 @@ linux-6.6.86-arm64:
 #
 # x86_64 artifacts
 #
+alpine-3.18-x86_64-rootfs:
+  extends: .x86_64-artifacts
+  script:
+    - ./scripts/alpine-rootfs.sh cpio
+  variables:
+    CONTAINER: alpine:3.18-x86_64-base
+
 linux-6.6.56-x86_64:
   extends: .x86_64-artifacts
   script: ./scripts/build-linux.sh
@@ -62,7 +69,7 @@ x86_64-kernel-linux-6.6.56:
 x86_64-rootfs-alpine-3.18:
   extends: .x86_64-artifacts
   script:
-    - . scripts/x86_64-rootfs-alpine.sh
+    - ./scripts/alpine-rootfs.sh tar
   variables:
     CONTAINER: alpine:3.18-x86_64-base
 
diff --git a/scripts/x86_64-rootfs-alpine.sh b/scripts/alpine-rootfs.sh
similarity index 75%
rename from scripts/x86_64-rootfs-alpine.sh
rename to scripts/alpine-rootfs.sh
index b70b3a54ede5..c29c92d1c682 100755
--- a/scripts/x86_64-rootfs-alpine.sh
+++ b/scripts/alpine-rootfs.sh
@@ -1,4 +1,9 @@
+#!/bin/bash
+
+set -eu
+
 WORKDIR="${PWD}"
+COPYDIR="${WORKDIR}/binaries"
 
 apk update
 
@@ -56,5 +61,17 @@ passwd -d "root" root
 
 # Create rootfs
 cd /
-tar cvzf "${WORKDIR}/binaries/initrd.tar.gz" \
-    bin dev etc home init lib mnt opt root sbin usr var
+PATHS="bin dev etc home init lib mnt opt root sbin usr var"
+
+case $1 in
+    cpio)
+        find $PATHS | cpio -o -H newc | gzip > "${COPYDIR}/rootfs.cpio.gz"
+
+        # Print the contents for the build log
+        zcat "${COPYDIR}/rootfs.cpio.gz" | cpio -tv
+        ;;
+
+    tar)
+        tar cvzf "${COPYDIR}/initrd.tar.gz" $PATHS
+        ;;
+esac
-- 
2.39.5


