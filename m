Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hE8NLgB2IWpOGwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 14:56:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA246401A1
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 14:56:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=RHhceAU1;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1327793.1592534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV7bk-0007m3-3Q; Thu, 04 Jun 2026 12:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327793.1592534; Thu, 04 Jun 2026 12:55:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV7bk-0007kO-0H; Thu, 04 Jun 2026 12:55:36 +0000
Received: by outflank-mailman (input) for mailman id 1327793;
 Thu, 04 Jun 2026 12:55:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wV7bi-0007kI-Ad
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 12:55:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV7bh-009x3A-DO
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 14:55:33 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a2175a8-2eae-0a2a0a5409dd-0a2a4504e80e-46
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 14:55:33 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a2175c5-1dec-0a2a45040019-d155802eedd2-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 14:55:33 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-490ac357c55so8362025e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 05:55:33 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3b5b06sm63302045e9.3.2026.06.04.05.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 05:55:32 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1780577733; x=1781182533; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GOex6cUH76+5UO2A6nOut6BRNcxrNo78P3qFnuIkBHg=;
        b=RHhceAU1ZMtrmgXVZ0ZkAvhH2bI/DHDAqRI5ZOFQ+XgDcOkkWYhTfuKTg7NsSnOlmY
         8Lp4/yb3LcHsIBzA+EPXPeAcOHHBFWB4SsLg5WNtGTRbjcXnCDo37dkeQqyYlcg8iTOk
         6BcovvHYqPjHf4ZLDKDCv+UB56EZvNbg2uUyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780577733; x=1781182533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOex6cUH76+5UO2A6nOut6BRNcxrNo78P3qFnuIkBHg=;
        b=caMnbOoBLqjr3XYpyPmcY8oaWCRVtKP9mUUpG3MJKtUwSn746Nj1s2U5RMcH5N60QQ
         4JT3rHqIYUem5FOsTxALv+eimiSRJsux79yjiJ4lzTHHo7WoXwBMr7l4VjT/eQt1ynuV
         Z6AeeZ21vDYp3cTCvMvzeF+tei7KMjq8eIsUFcuDqe4IkzpbnaDR8G12CKbcikDbDfZb
         x1ZhUrlwTYp9ZU0V/6KYXmDJNEigk3W1VtbubpIDeLYdc8pK2IY+j8qhtYSDdMwV6ghv
         VFNKcBrO4my447BbhtIES0v+GTQXlCQHNrBW6MWhlxvk8C9AM35/XgiwJ/pi0C2RLQlq
         LjOg==
X-Gm-Message-State: AOJu0YyV/TZcK/TtaTcHBbg+jmMKA01Y6lvwa9PzaHnViRmuJIbkmbJK
	9JvJomptQiLpWDpJnSJ7l3p+h2UliWoIGZWQiyUSlLbPDrdmeqIUl65d0Pp7TNSrdXzCFEQLXsM
	f7FEM
X-Gm-Gg: Acq92OGdbthvXP7ngQYDO1Eqf/KfdFYJJSYzkOht1AbxkIivjoHb0BBcb23rSG2ZWHB
	qIb7NV3Aj7uvoNAI+bAtfbD7Eb9VIUruf96GRjCXkxXdKMSaJDcqztJB/nwtmEeT8O3kis8pjrO
	R9TEAtJyihFkw56e3i84MrN16VCM3kjLQ0G5ziVGG59HQA/NV4jh4Sd1E63rRS3SVrQ25GnTmTp
	tO0WH4f7dLi9H9ZksYOXJtutcyLRSW8DrJ1ricyAtcxRoeI7Ld8vZjPDlmsnMYvs122LPYAEUq+
	k0/KvjrNIrH+jzD9jvaMHVUb/HT2fD1lrRHSauaznPlCIsuUwRL3agFy06Qc8SjvVY2M0OMFv3q
	8X4J1rRsz3vi8QdSZiBMDTWLKxiiHKGui9eMxZeS0+Q99fiuQWKlASO7niJGb2jW1qbj/GKK3u4
	RlEWNKMBJLT7+GWDB5NdcJhECTet8f1xig8SeFFlRa4Dt8fq6POGTAxv1arA+DPhwdrAFUC1I+7
	BXIhw0GIe9XW/w=
X-Received: by 2002:a05:600c:4ec6:b0:490:b8e2:6380 with SMTP id 5b1f17b1804b1-490b8e264c9mr116497775e9.12.1780577732485;
        Thu, 04 Jun 2026 05:55:32 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] CI: Remove .cirrus.yml now that CirrusCI has shut down
Date: Thu,  4 Jun 2026 13:55:30 +0100
Message-Id: <20260604125530.2718761-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1780577733-28D743FF-7E33B57B/10/73395122804
X-purgate-type: spam
X-purgate-size: 6750
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,kernel.org,amd.com,cardoe.com,gmail.com];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0EA246401A1

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 .cirrus.yml | 212 ----------------------------------------------------
 1 file changed, 212 deletions(-)
 delete mode 100644 .cirrus.yml

diff --git a/.cirrus.yml b/.cirrus.yml
deleted file mode 100644
index 839c25149c9e..000000000000
--- a/.cirrus.yml
+++ /dev/null
@@ -1,212 +0,0 @@
-## FreeBSD Build Jobs
-
-# https://cirrus-ci.org/guide/tips-and-tricks/#sharing-configuration-between-tasks
-freebsd_versions: &FREEBSD_VERSIONS
-  env:
-    FREEBSD_LEGACY:     freebsd-13-5
-    FREEBSD_PRODUCTION: freebsd-14-3
-    FREEBSD_CURRENT:    freebsd-15-0-amd64-ufs
-
-# Build jobs
-
-freebsd_template: &FREEBSD_ENV
-  environment:
-    APPEND_LIB: /usr/local/lib
-    APPEND_INCLUDES: /usr/local/include
-    CIRRUS_CLONE_DEPTH: 1
-    CIRRUS_LOG_TIMESTAMP: true
-
-freebsd_template_latest: &FREEBSD_ENV_PRODUCTION
-  << : *FREEBSD_VERSIONS
-  freebsd_instance:
-    image_family: $FREEBSD_PRODUCTION
-  << : *FREEBSD_ENV
-
-freebsd_configure_artifacts: &FREEBSD_CONFIGURE_ARTIFACTS
-  always:
-    rename_script:
-      - cp xen/.config xen-config
-    config_artifacts:
-      path: xen-config
-      type: text/plain
-
-task:
-  name: 'FreeBSD: full build'
-
-  # It's not possible to use the matrix keyword in YAML aliases, as they
-  # keyword usage is restricted to task, docker_builder or pipe.  Attempting to
-  # use a YAML alias with the duplicated keys doesn't work either. Use an env
-  # variable so the version can also be appended to the task alias.
-  << : *FREEBSD_VERSIONS
-  env:
-    matrix:
-      FREEBSD_VERSION: $FREEBSD_LEGACY
-      FREEBSD_VERSION: $FREEBSD_PRODUCTION
-      FREEBSD_VERSION: $FREEBSD_CURRENT
-
-  alias: freebsd_full_$FREEBSD_VERSION
-  freebsd_instance:
-    image_family: $FREEBSD_VERSION
-
-  << : *FREEBSD_ENV
-
-  install_script: pkg install -y seabios gmake ninja bash
-                                 pkgconf bison perl5
-                                 json-c lzo2 pixman argp-standalone
-                                 libxml2 glib git python3 libinotify
-
-  configure_script:
-    - cc --version
-    - ./configure --with-system-seabios=/usr/local/share/seabios/bios.bin
-                  --with-extra-qemuu-configure-args="--extra-ldflags=-L${APPEND_LIB} --extra-cflags=-I${APPEND_INCLUDES}"
-    - gmake -j`sysctl -n hw.ncpu` -C xen clang=y defconfig
-
-  << : *FREEBSD_CONFIGURE_ARTIFACTS
-
-  build_script:
-    - gmake -j`sysctl -n hw.ncpu` clang=y
-
-  xen_artifacts:
-    path: xen/xen
-    type: application/octet-stream
-
-  debug_artifacts:
-    path: xen/xen-syms
-    type: application/octet-stream
-
-task:
-  name: 'FreeBSD: randconfig build'
-
-  # It's not possible to use the matrix keyword in YAML aliases, as they
-  # keyword usage is restricted to task, docker_builder or pipe.  Attempting to
-  # use a YAML alias with the duplicated `image_family` keys doesn't work
-  # either. Abstract the version numbers at least.
-  << : *FREEBSD_VERSIONS
-  freebsd_instance:
-    matrix:
-      image_family: $FREEBSD_LEGACY
-      image_family: $FREEBSD_PRODUCTION
-      image_family: $FREEBSD_CURRENT
-
-  << : *FREEBSD_ENV
-
-  install_script: pkg install -y gmake python3 bison
-
-  configure_script:
-    - cc --version
-    - gmake -j`sysctl -n hw.ncpu` -C xen clang=y \
-            KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
-
-  << : *FREEBSD_CONFIGURE_ARTIFACTS
-
-  build_script:
-    - gmake -j`sysctl -n hw.ncpu` build-xen clang=y
-
-task:
-  name: 'FreeBSD: XTF build'
-  alias: xtf
-
-  << : *FREEBSD_ENV_PRODUCTION
-
-  clone_script:
-    - pkg install -y git
-    - git clone --depth 1 https://xenbits.xen.org/git-http/xtf.git
-
-  install_script: pkg install -y gmake
-
-  build_script:
-    - cd xtf
-    - cc --version
-    - git rev-parse HEAD
-    - gmake -j`sysctl -n hw.ncpu` LLVM=y
-
-  xtf_artifacts:
-    path: xtf/tests/selftest/test-*-selftest
-    type: application/octet-stream
-
-## macOS Build Jobs
-
-task:
-  name: 'macOS: hypervisor build'
-
-  env:
-    matrix:
-      ARCH: x86_64
-      ARCH: aarch64
-
-  alias: macos-$ARCH
-  macos_instance:
-    image: ghcr.io/cirruslabs/macos-runner:sonoma
-
-  environment:
-    CIRRUS_CLONE_DEPTH: 1
-    CIRRUS_LOG_TIMESTAMP: true
-
-  install_script:
-    - brew install $ARCH-elf-gcc $ARCH-elf-binutils
-
-  build_script:
-    - make -j`sysctl -n hw.ncpu`
-           XEN_TARGET_ARCH=`echo $ARCH | sed -e s/aarch64/arm64/`
-           CROSS_COMPILE=$ARCH-elf- HOSTCC=clang -C xen
-
-  xen_artifacts:
-    path: xen/xen
-    type: application/octet-stream
-
-  debug_artifacts:
-    path: xen/xen-syms
-    type: application/octet-stream
-
-## Test Jobs
-
-task:
-  name: 'XTF selftest'
-
-  << : *FREEBSD_ENV_PRODUCTION
-
-  env:
-    matrix:
-      BUILD: freebsd_full_$FREEBSD_LEGACY
-      BUILD: freebsd_full_$FREEBSD_PRODUCTION
-      BUILD: freebsd_full_$FREEBSD_CURRENT
-      BUILD: macos-x86_64
-
-  depends_on:
-    - $BUILD
-    - xtf
-
-  install_script: pkg install -y qemu-nox11 expect
-
-  env:
-    matrix:
-      XTF_ARCH: hvm32
-      XTF_ARCH: hvm32pae
-      XTF_ARCH: hvm32pse
-      XTF_ARCH: hvm64
-      XTF_ARCH: pv64
-
-  fetch_script:
-    - fetch https://api.cirrus-ci.com/v1/artifact/build/$CIRRUS_BUILD_ID/xtf/xtf.zip
-    - fetch https://api.cirrus-ci.com/v1/artifact/build/$CIRRUS_BUILD_ID/$BUILD/xen.zip
-    - unzip xtf.zip
-    - unzip xen.zip
-
-  test_script: |
-    case "$XTF_ARCH" in \
-      *hvm*) \
-        XEN_EXTRA_CMD="dom0=pvh dom0-iommu=none" \
-        ;; \
-    esac
-    export TEST_CMD="qemu-system-x86_64 -kernel xen/xen -initrd xtf/tests/selftest/test-${XTF_ARCH}-selftest \
-                                        -append \"loglvl=all console=com1 noreboot console_timestamps=boot dom0=verbose ${XEN_EXTRA_CMD}\" \
-                                        -m 512 -nographic -monitor none -serial stdio"
-    export TEST_LOG="serial-${FREEBSD_BUILD}-${XTF_ARCH}.txt"
-    export PASSED="Test result: SUCCESS"
-    export TEST_TIMEOUT=120
-    ./automation/scripts/console.exp 2>&1 | sed 's/\r\+$//'
-
-  always:
-    serial_artifacts:
-      path: serial-*.txt
-      type: text/plain

base-commit: 0b03d963730b4c3df5b4583c054e2cd0d99758c2
-- 
2.39.5


