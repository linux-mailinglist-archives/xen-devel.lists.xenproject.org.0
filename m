Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CCBA87E7D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 13:09:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949715.1346234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Hgg-0001bm-Q9; Mon, 14 Apr 2025 11:09:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949715.1346234; Mon, 14 Apr 2025 11:09:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Hgg-0001Zi-LP; Mon, 14 Apr 2025 11:09:14 +0000
Received: by outflank-mailman (input) for mailman id 949715;
 Mon, 14 Apr 2025 11:09:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KxE1=XA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4Hgf-0000MT-Pa
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 11:09:13 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4ca6409-1920-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 13:09:12 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso45295115e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 04:09:12 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f205ecb8dsm176820405e9.7.2025.04.14.04.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 04:09:10 -0700 (PDT)
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
X-Inumbo-ID: e4ca6409-1920-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744628951; x=1745233751; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqFVEiY9DHURRecOhH2xsVEyvFBLoIcTk7clcfsrv2I=;
        b=WFmeiskp3+vsKPgOmZxUZ+uioA4706zkv90lQ1g3rxCwB6xFJiwRJdfBqYBHMDkVTt
         0shTUdltmBw1wDbWpM0jJSpHou/FizX8J2a3wHhi1z6T+U3V1jyaOADai5IrvHcCE/3v
         lBk8Bh+6XIBCDulIGdTUmmoxnE/62l/wB8mIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744628951; x=1745233751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FqFVEiY9DHURRecOhH2xsVEyvFBLoIcTk7clcfsrv2I=;
        b=wN5NDPE4ft+Jgj2BcBhaDL4mpDIFG5eEhYecTsLQIAF+EZ82YY5B2GcsCbbEeegWPY
         AKyqknyuOSlCnMu4WDydimf8NOE2v5qMuIU40ipG0AZ2OBWI+ESK9VWrcdMAp7x2/BdF
         9QETo1sZuxgn2RrsJToEt4MQXi2vhWBOY8XQHkcfno2/hHFQGAaoSDFhpJlXf8/JoBmq
         tTvmsUIKrw8uye/Xb6Ws/c01wRB64YWlhrTYdrb1MT9+gGRfcTaena7kBGANE6W94z/g
         qwug++P/hnRQNUHACr9K4OUQvjI61ezberobdkukzsSiq50KoMSkgkfCFWOz28XER7vG
         IG7g==
X-Gm-Message-State: AOJu0YwdurIZbOC+pLO1LIUbM/N07fxgwwBX3mph0pZoISVktPyaFBVa
	lHsmiees+KGFfYBhR7TJWJMzFJ05xNbSQcdQfiYHp54QnlJkcz5o0djzKUeOvDgtXWjrUPIfB5x
	C6nI=
X-Gm-Gg: ASbGnct2qpOOL2sGm9c6p1lFnPG6j4EVWUBJxwPFHmMQSglJs+Tu8QsfeM5a6pWlURb
	wG3XEWxN1vhMzuWKdky0qI7bYPhyCvlz4fYkwpcycPN7YXQKwviK1lhcESB7D+j65I4+7NRWLdz
	OCy5p9o+hxzTLzDC/bjai2LQ7m9jR1ky27UnrnIkJAYW0hHao7eSRPUGpB8ma6ooXtxtaEOCL/z
	tQTqGMYSGENWfI6McMnG9pjyi/v8qfB2qrbT8aTlLc4xyNOIOMwN9ncViu2OKuFbUy1AsZo/6QJ
	KtIo08EUMaSsrVNosoXtQq6qkr2nzeGzIPwlbYmFnHEakqlRZ3FFPberJDovZfAtEOYK8olPyfO
	I6uzJ5AsXfet8qA==
X-Google-Smtp-Source: AGHT+IGZ04PS5HcN2fvZn8IhAhqmw+tj3+Yj7NHz+aAhUYPXM8WPANEqvuMs2cLjpgEIY8FQQffJ9A==
X-Received: by 2002:a05:600c:1d09:b0:43b:ce3c:19d0 with SMTP id 5b1f17b1804b1-43f3a9bee1dmr64654355e9.29.1744628950945;
        Mon, 14 Apr 2025 04:09:10 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v3 5/6] CI: save toolstack artifact as cpio.gz
Date: Mon, 14 Apr 2025 12:09:02 +0100
Message-Id: <20250414110903.2355303-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414110903.2355303-1-andrew.cooper3@citrix.com>
References: <20250414110903.2355303-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

This avoids the need to re-compress it in every test job.  This saves minutes
of wallclock time.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

v3:
 * Rebase
 * Rename to xen-tools.cpio.gz to be more specific

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1766186423
---
 automation/scripts/build                          | 2 +-
 automation/scripts/qemu-alpine-x86_64.sh          | 2 +-
 automation/scripts/qemu-smoke-dom0-arm64.sh       | 2 +-
 automation/scripts/qemu-smoke-dom0less-arm64.sh   | 2 +-
 automation/scripts/qubes-x86-64.sh                | 4 +++-
 automation/scripts/xilinx-smoke-dom0-x86_64.sh    | 4 ++--
 automation/scripts/xilinx-smoke-dom0less-arm64.sh | 3 +--
 7 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index 522efe774ef3..51effec81ddd 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -108,7 +108,7 @@ else
     # Note: Some smoke tests depending on finding binaries/xen on a full build
     # even though dist/ contains everything, while some containers don't even
     # build Xen
-    cp -r dist binaries/
+    (cd dist/install; find | cpio -o -H newc | gzip) > binaries/xen-tools.cpio.gz
     cp -r tools/tests binaries/
     collect_xen_artefacts
 fi
diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index c7dd12197862..fe86caa39304 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -30,11 +30,11 @@ cd ..
 
 # Dom0 rootfs
 cp rootfs.cpio.gz dom0-rootfs.cpio.gz
+cat xen-tools.cpio.gz >> dom0-rootfs.cpio.gz
 
 # test-local configuration
 mkdir -p rootfs
 cd rootfs
-cp -ar ../dist/install/* .
 mkdir -p root etc/local.d
 mv ../domU-rootfs.cpio.gz ./root
 cp ../bzImage ./root
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index c0cf61ff8f7b..61dd24b9abef 100755
--- a/automation/scripts/qemu-smoke-dom0-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
@@ -29,11 +29,11 @@ cd ..
 
 # Dom0 rootfs
 cp rootfs.cpio.gz dom0-rootfs.cpio.gz
+cat xen-tools.cpio.gz >> dom0-rootfs.cpio.gz
 
 # test-local configuration
 mkdir -p rootfs
 cd rootfs
-cp -ar ../dist/install/* .
 mkdir -p etc/local.d root
 mv ../domU-rootfs.cpio.gz ./root
 cp ../Image ./root
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index 8e939f0b7214..58f11dd31038 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -116,11 +116,11 @@ cd ..
 
 # Dom0 rootfs
 cp binaries/rootfs.cpio.gz binaries/dom0-rootfs.cpio.gz
+cat binaries/xen-tools.cpio.gz >> binaries/dom0-rootfs.cpio.gz
 
 # test-local configuration
 mkdir -p rootfs
 cd rootfs
-cp -ar ../binaries/dist/install/* .
 mkdir -p etc/local.d
 
 echo "#!/bin/bash
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index e2376cb51cb4..3947027d6e4d 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -189,12 +189,12 @@ fi
 
 # Dom0 rootfs
 cp binaries/rootfs.cpio.gz binaries/dom0-rootfs.cpio.gz
+cat binaries/xen-tools.cpio.gz >> binaries/dom0-rootfs.cpio.gz
 
 # test-local configuration
 mkdir -p rootfs
 cd rootfs
 mkdir -p boot etc/local.d
-cp -ar ../binaries/dist/install/* .
 cp -ar ../binaries/tests .
 cp -a ../automation/scripts/run-tools-tests tests/
 
@@ -228,8 +228,10 @@ else
 fi
 
 chmod +x etc/local.d/xen.start
+mkdir -p etc/xen
 echo "$domU_config" > etc/xen/domU.cfg
 
+mkdir -p etc/default
 echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
 echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
 mkdir -p var/log/xen/console
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index 85007dcc290a..1f8cc172c630 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -107,6 +107,7 @@ rm -rf rootfs
 
 # Dom0 rootfs
 cp binaries/rootfs.cpio.gz binaries/dom0-rootfs.cpio.gz
+cat binaries/xen-tools.cpio.gz >> binaries/dom0-rootfs.cpio.gz
 if [[ "${TEST}" == argo ]]; then
     cat binaries/argo.cpio.gz >> binaries/dom0-rootfs.cpio.gz
 fi
@@ -114,8 +115,7 @@ fi
 # test-local configuration
 mkdir -p rootfs
 cd rootfs
-mkdir -p boot etc/local.d
-cp -ar ../binaries/dist/install/* .
+mkdir -p boot etc/local.d etc/xen etc/default
 echo "#!/bin/bash
 set -x
 export LD_LIBRARY_PATH=/usr/local/lib
diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
index a3031ecab0dc..59f3fe7edb3e 100755
--- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
+++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
@@ -56,12 +56,11 @@ rm -rf rootfs
 
 # Dom0 rootfs
 cp binaries/rootfs.cpio.gz binaries/dom0-rootfs.cpio.gz
+cat binaries/xen-tools.cpio.gz >> binaries/dom0-rootfs.cpio.gz
 
 # test-local configuration
 mkdir -p rootfs
 cd rootfs
-cp -ar ../binaries/dist/install/* .
-
 mkdir -p etc/local.d
 echo "#!/bin/bash
 
-- 
2.39.5


