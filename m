Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2B8806230
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 23:57:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648629.1012623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAeLQ-0001C7-So; Tue, 05 Dec 2023 22:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648629.1012623; Tue, 05 Dec 2023 22:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAeLQ-00019y-P0; Tue, 05 Dec 2023 22:56:48 +0000
Received: by outflank-mailman (input) for mailman id 648629;
 Tue, 05 Dec 2023 22:56:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paSO=HQ=citrix.com=prvs=696dacbf7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1rAeLP-00010j-Gf
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 22:56:47 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f5a392a-93c1-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 23:56:46 +0100 (CET)
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
X-Inumbo-ID: 8f5a392a-93c1-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1701817006;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=09HDfo5QPRXVSv3hpnAY4bTW5tmPUkNxIgrHBOQg9vc=;
  b=IA5p4LbIwApx4hYuDcwqu+3ycV3EN3DKcGyUccplW/KRn/HcuT79rWYQ
   bd+VLk1juftaMX3+PjuHAobNTwg/UXDx2TFVQ0jLg9S35M+UuUuUDgMN9
   KodvFzuUXNw0EUeVgTGCsQu10QrDynA5OB5iSlG+MLWYKxUzadTrasARi
   Y=;
X-CSE-ConnectionGUID: oiKzt41pSQywTZ6KANt97A==
X-CSE-MsgGUID: AFTTlP6SSHGJaNTVZLw1Mg==
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 129016668
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:fAxJvKnBZrfbjUEcQGsN7/To5gzjJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYCzyGbvyJNGX2LYh0O9nn90IHvsXcmNNqQFRkpS49QiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+e6UKicfHkpGWeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5KiaVA8w5ARkPqkR5AKGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fsZCyIRMkmbvNun346JFMpFoNhyc+C+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dMlsQYj/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xxzJ/
 juYoTqpav0cHPWx9QaByiyXvc/gvyrdZLwgMKLh0/E/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JLCPEz4gyJzqvS4i6aC3ICQzoHb8Yp3OczRDcq3
 1vPmMn7CDhHubiZD3ma89+8pjqoNS8YBWQLfyMDQE0O5NyLnW0opkuRFJA5Svfz14CkX26oq
 9yXkMQgr7ISrtwXi/yjxmnWnA6e+LvgaBJkuSyCCwpJ8ThFiJ6Zi52AsAeDtKkRdt/IFDG8U
 G44d99yBd3i7K1hdwTXGY3h5Jnzu5643MT02DaD5aUJ+TW34GKEdotN+jx4L0oBGp9bIWa5O
 BaO4lsJtMU70J6WgUhfOdrZNijX5fK4SYSNug78P7KinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ/EMJruMow+lGDeb75EgdcWKtUWmTu7qWbTk072jtJzpRe9Fd84Dbd5RrxjsfjV+luFq
 L6y9aKikn1ibQE3WQGPmaZ7ELzABSFT6UzewyCPStO+Hw==
IronPort-HdrOrdr: A9a23:KyPzRK5uBLLHQV9MmwPXwMTXdLJyesId70hD6qhwISY6TiX+rb
 HIoB17726RtN9/YhEdcLy7VJVoIkmskKKdg7NhXotKNTOO0ADDQb2KhbGSpQEIcBeeygcy78
 hdmtBFeb/NMWQ=
X-Talos-CUID: 9a23:11l75GDXMQw2dEv6Ey5m11wIRpk9SUTM00vifWyRL3o4F5TAHA==
X-Talos-MUID: 9a23:fEQ2RwUa4YeP/87q/BbCuA1mDJlT2ISBKkkrras0n9bdECMlbg==
X-IronPort-AV: E=Sophos;i="6.04,253,1695700800"; 
   d="scan'208";a="129016668"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] CI: Fix fallout from adding elfutils-dev to the build container
Date: Tue, 5 Dec 2023 22:56:40 +0000
Message-ID: <20231205225640.75987-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Commit 948e03303138 ("automation/alpine: add elfutils-dev") had an unintended
consequence of causing Qemu to gain a runtime dependency on libdw.so

The {adl,zen3p}-pci-hvm-x86-64-gcc-debug tests, which are the only two tests
that run the built Qemu, started failing with:

  Error loading shared library libdw.so.1: No such file or directory (needed by /usr/local/lib/xen/bin/qemu-system-i386)
  Error relocating /usr/local/lib/xen/bin/qemu-system-i386: dwfl_begin: symbol not found

Update the test container with libelf to cope.

While editing the runtime dependency list, fix up two other problems causing
bloat.  texinfo isn't a runtime dependency, and we should be using xz itself,
not it's development libraries.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

I've already pushed the x86 container as part of confirming the fix.
---
 automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile | 3 +--
 automation/tests-artifacts/alpine/3.18.dockerfile         | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile b/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile
index 94f69621f40e..0e5ae7f2b4d8 100644
--- a/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile
+++ b/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile
@@ -21,10 +21,9 @@ RUN \
   apk add python3 && \
   apk add zlib && \
   apk add ncurses && \
-  apk add texinfo && \
   apk add yajl && \
   apk add libaio && \
-  apk add xz-dev && \
+  apk add xz && \
   apk add util-linux && \
   apk add argp-standalone && \
   apk add libfdt && \
diff --git a/automation/tests-artifacts/alpine/3.18.dockerfile b/automation/tests-artifacts/alpine/3.18.dockerfile
index f1b4a8b7a191..9cde6c9ad4da 100644
--- a/automation/tests-artifacts/alpine/3.18.dockerfile
+++ b/automation/tests-artifacts/alpine/3.18.dockerfile
@@ -22,10 +22,9 @@ RUN \
   apk add python3 && \
   apk add zlib && \
   apk add ncurses && \
-  apk add texinfo && \
   apk add yajl && \
   apk add libaio && \
-  apk add xz-dev && \
+  apk add xz && \
   apk add util-linux && \
   apk add argp-standalone && \
   apk add libfdt && \
@@ -34,6 +33,7 @@ RUN \
   apk add curl && \
   apk add udev && \
   apk add pciutils && \
+  apk add libelf && \
   \
   # Xen
   cd / && \

base-commit: ff1178062094837d55ef342070e58316c43a54c9
prerequisite-patch-id: 477e3af5692ee0daa13d795fdf78384be604fd66
prerequisite-patch-id: 60d13b1c04d8a808a42d20b3432270cfd87a47fc
prerequisite-patch-id: 457b56a295e75d2d9f837b44cd483812ca66cd85
-- 
2.30.2


