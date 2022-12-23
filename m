Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABBE654F94
	for <lists+xen-devel@lfdr.de>; Fri, 23 Dec 2022 12:17:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468888.728105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8g2c-0002WZ-NE; Fri, 23 Dec 2022 11:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468888.728105; Fri, 23 Dec 2022 11:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8g2c-0002T3-Jb; Fri, 23 Dec 2022 11:16:42 +0000
Received: by outflank-mailman (input) for mailman id 468888;
 Fri, 23 Dec 2022 11:16:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2p1Y=4V=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1p8g2a-0001vi-Qj
 for xen-devel@lists.xenproject.org; Fri, 23 Dec 2022 11:16:40 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45bb3902-82b3-11ed-8fd4-01056ac49cbb;
 Fri, 23 Dec 2022 12:16:40 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 f13-20020a1cc90d000000b003d08c4cf679so3302598wmb.5
 for <xen-devel@lists.xenproject.org>; Fri, 23 Dec 2022 03:16:40 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 bi20-20020a05600c3d9400b003c6c5a5a651sm4015400wmb.28.2022.12.23.03.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 03:16:39 -0800 (PST)
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
X-Inumbo-ID: 45bb3902-82b3-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMA9GaAKAwvSkcExFphr9K3QaVLSpIpDAhw9a6cKCNM=;
        b=gvDJniLm2Mwmt9UtGRo1qDm1eyfvbRTxTF7X14YgiSadYAvDfwBaHIvL7jIj9rGYM3
         /hfMut0w2TTznEBZkRQX3+ZRP1yyDl0eORZUiXTLlekq9MPzU3KvWpIZH8oNa1bfUkoB
         6IiI4VpsQhqXr96ceeDacK+Poc5JgMn1xwSYCY8T6Kibd66sId8nL+MqMXNPAaKEmZtU
         0RwHXZUKqA0z5OlGdLw2tcxJzGWTRHfMf4ATwiU0cAlO6DLdlgVZyUHNUD70ItvLlaW4
         jYRz3Tyd9I7yOtFrsHVTotAQBAvd6PXrdm1IKRadrI0pFrwicLEckMm+kce43jpgUZ2e
         CiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nMA9GaAKAwvSkcExFphr9K3QaVLSpIpDAhw9a6cKCNM=;
        b=Ce/Ujh8uB0c7PxxckbFvh06arHCFsmmvYXOjYTDFGnyROdUi/g+L4ql6UlU3lknmEl
         Audmh0k1S0145XecJCbLfHIZ+YjzQ+l7cRd3fZkVaHCxULJLbcM5BFfjQrdLQOSpSqBJ
         Y7dj5HA9jTtlionH7WrkYatyp8o8rm31OoixZ5GJ8j27y1RuY2+bm+GsmzIkdB17GjtD
         w6xTXM1XLUxRZ7IvXm4jxXv3no3aad8QZ52InNpYllePPprpT9tFMrA94jcMGY2sVuH+
         LXNK03ohZ/kawgRQJNGwwSBDQ2nULwRNTv87D8BQyjf++3EY7/MKdV7zNkdZkTGZXZbt
         tnlQ==
X-Gm-Message-State: AFqh2krTUWeuSKpdtuoNXuanmfPV3Ak/sz/P+yvh2Pl6fP/wY6CXcEbz
	x3iXSzdQWBTFvb7GTlH1hBpfGME1MBYo0v72
X-Google-Smtp-Source: AMrXdXuuVKaWn+IuwicpenQafiKLQF6LsbpNCUjVJGrjAmGfmmCVzkEE+PMkHdhowPaYOp1MkAtpzw==
X-Received: by 2002:a1c:6a16:0:b0:3c6:f732:bf6f with SMTP id f22-20020a1c6a16000000b003c6f732bf6fmr6821962wmc.13.1671794199369;
        Fri, 23 Dec 2022 03:16:39 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH v1 2/4] automation: add cross-compiler support for the build script
Date: Fri, 23 Dec 2022 13:16:21 +0200
Message-Id: <3c926f637c4738bd14db10e8fe8f72a6eae2dfd4.1671789736.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671789736.git.oleksii.kurochko@gmail.com>
References: <cover.1671789736.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Docker images that are currently available and used for
cross-compilation is additionally installed GCC/Binutils
which is why the build script doesn't crash.

RISC-V docker image doesn't have native GCC only          
cross-compiler which will lead to the fact  that the build
script will fail.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 automation/scripts/build | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index a593419063..026f480e76 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -2,12 +2,12 @@
 
 test -f /etc/os-release && cat "$_"
 
-$CC --version
+${CROSS_COMPILE}${CC} --version
 
 # Express the compiler version as an integer.  e.g. GCC 4.9.2 => 0x040902
 cc-ver()
 {
-    $CC -dumpversion | awk -F. '{ printf "0x%02x%02x%02x", $1, $2, $3 }'
+    ${CROSS_COMPILE}${CC} -dumpversion | awk -F. '{ printf "0x%02x%02x%02x", $1, $2, $3 }'
 }
 
 # random config or default config
@@ -66,7 +66,7 @@ if ! type python3 || python3 -c "import sys; res = sys.version_info < (3, 5); ex
 fi
 
 # SeaBIOS requires GCC 4.6 or later
-if [[ "${CC}" == "gcc" && `cc-ver` -lt 0x040600 ]]; then
+if [[ "${CROSS_COMPILE}${CC}" == "gcc" && `cc-ver` -lt 0x040600 ]]; then
     cfgargs+=("--with-system-seabios=/bin/false")
 fi
 
-- 
2.38.1


