Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8183A8AFBE
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 07:32:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954999.1348891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4vOB-00055r-Dh; Wed, 16 Apr 2025 05:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954999.1348891; Wed, 16 Apr 2025 05:32:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4vOB-00054E-AL; Wed, 16 Apr 2025 05:32:47 +0000
Received: by outflank-mailman (input) for mailman id 954999;
 Wed, 16 Apr 2025 05:32:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1z0E=XC=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u4vOA-0003si-LW
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 05:32:46 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3965d38f-1a84-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 07:32:45 +0200 (CEST)
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
X-Inumbo-ID: 3965d38f-1a84-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744781564; x=1745040764;
	bh=D9Cgha2SO1BNucjhG9GORmWwPJ0BvTYcJSIZrXZF8Ws=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=LyC3YwHxpH0xYzYvbah4TcAHDJ+Eqs7f133qf0qa3ZFyUuuHcRl+PakFFepucYOwP
	 QXURvwsSd6rzMFvzA+/2FITM9xk9s2JoP/Gk4qvhyjuFIY40M89vQAGZ4NCLZ2BhMf
	 SBxdWp2jV9uUB0btrgICFhEav0+Uj0qscPZjGut0z5gRO8VxyIlepHBK9Yyrpf894w
	 cqnhzu0ovbsCnw4oYT+Q/XmOLs4nxE5jebP9GiKVoFMNYYOJIIR0ov3gIExtpVzNsD
	 ltfm3fMer7ZVj+/h/BnTc1QG+uw2B5eetIOfM13Jh/Bv4whVGH/SGL9zvig1w4rVt8
	 TpUE7Tdm8Saeg==
Date: Wed, 16 Apr 2025 05:32:41 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, cardoe@cardoe.com, marmarek@invisiblethingslab.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 4/4] CI: add argo x86 XTF test
Message-ID: <20250416053213.921444-5-dmukhin@ford.com>
In-Reply-To: <20250416053213.921444-1-dmukhin@ford.com>
References: <20250416053213.921444-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: f05f6260e2cd634798a6c0dfc99d27a6ec6a89a4
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Introduce new CI job to run x86 XTF argo test under QEMU to smoke test argo
feature functionality in upstream CI.

The new job lead time is ~30s, limit max job duration to 60s.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 automation/gitlab-ci/test.yaml        | 9 +++++++++
 automation/scripts/include/xtf-runner | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yam=
l
index d6e4a0a622..9001efb45c 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -691,6 +691,15 @@ qemu-smoke-x86-64-gcc-efi:
   needs:
     - debian-12-x86_64-gcc-debug
=20
+qemu-xtf-argo-x86_64-gcc-debug:
+  extends: .qemu-smoke-x86-64
+  variables:
+    TEST_TIMEOUT_OVERRIDE: 60
+  script:
+    - ./automation/scripts/qemu-xtf.sh x86-64 pv64 argo 2>&1 | tee ${LOGFI=
LE}
+  needs:
+    - alpine-3.18-gcc-debug
+
 qemu-smoke-riscv64-gcc:
   extends: .qemu-riscv64
   script:
diff --git a/automation/scripts/include/xtf-runner b/automation/scripts/inc=
lude/xtf-runner
index 55b7b34b89..12470b3979 100644
--- a/automation/scripts/include/xtf-runner
+++ b/automation/scripts/include/xtf-runner
@@ -70,6 +70,9 @@ function xtf_build_cmdline()
     local xtf_variant=3D$1
     local xtf_name=3D$2
     declare -a cmdline=3D()
+    declare -A per_test_args=3D(
+        [argo]=3D"argo=3D1 mac-permissive=3D1"
+    )
=20
     cmdline+=3D("loglvl=3Dall noreboot console_timestamps=3Dboot")
     cmdline+=3D("console=3D${XEN_CONSOLE}")
@@ -79,6 +82,10 @@ function xtf_build_cmdline()
         cmdline+=3D("dom0-iommu=3Dnone dom0=3Dpvh")
     fi
=20
+    if [[ -v per_test_args[${xtf_name}] ]]; then
+        cmdline+=3D("${per_test_args[${xtf_name}]}")
+    fi
+
     export XEN_CMDLINE=3D"${cmdline[@]}"
 }
=20
--=20
2.34.1



