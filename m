Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38857A97266
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 18:19:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963265.1354308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7GL5-0003ca-QE; Tue, 22 Apr 2025 16:19:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963265.1354308; Tue, 22 Apr 2025 16:19:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7GL5-0003Y1-K2; Tue, 22 Apr 2025 16:19:15 +0000
Received: by outflank-mailman (input) for mailman id 963265;
 Tue, 22 Apr 2025 16:19:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8D33=XI=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u7GL3-0002uR-La
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 16:19:13 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8722221b-1f95-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 18:19:12 +0200 (CEST)
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
X-Inumbo-ID: 8722221b-1f95-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=kws2ikdhtvcfbjqicgoxdcmfgi.protonmail; t=1745338751; x=1745597951;
	bh=lluC37bYu1rla9tiJD23HA8Ll/epPWACSifBUXpaAG4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=ddyv90S+nKj9XjI4HZ20RzmtBHGFVOpnihAqyWGTPtLHFw41M1dh8/NVmb4NDwTUI
	 siuAAf2zlKGqOF0H5nxPDGmXirU1JEYAH7zmb2CFE98Z/DKM2fhatPagrRHH9npWql
	 RTR4hlrPmuI6qUtY5+FonthnLqRtfxjsPlBhScQUmTo0oRofaj2UAQ7u02NUD5k3ZJ
	 wcnEsUlWt5hHZXWdP8MgZrQpXatbkBk5RIplSE+rbnKZOyyou9SoNz0t5p4/igE0Ku
	 UC9gDAniwy/djaY+LgrD+LyP/zxvI5o1xdI+lTSQ5W0vzVWex4V1Zlv9RysAnRY0Zp
	 OK9+pJZQZGcNw==
Date: Tue, 22 Apr 2025 16:19:06 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, cardoe@cardoe.com, marmarek@invisiblethingslab.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3 4/4] CI: add argo x86 XTF test
Message-ID: <20250422161819.2089738-5-dmukhin@ford.com>
In-Reply-To: <20250422161819.2089738-1-dmukhin@ford.com>
References: <20250422161819.2089738-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 7fbbef330dd6936ec6b0785d770909581a7d0fb2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Introduce new CI job to run x86 XTF argo test under QEMU to smoke test argo
feature functionality in upstream CI.

The new job lead time is ~30s, limit max job duration to 60s.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes v2->v3:
- Added Stefano's R-b
---
 automation/gitlab-ci/test.yaml        | 9 +++++++++
 automation/scripts/include/xtf-runner | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yam=
l
index a603d4039a..eba41f4048 100644
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
index 320eb65dc8..b7fea52dad 100644
--- a/automation/scripts/include/xtf-runner
+++ b/automation/scripts/include/xtf-runner
@@ -68,6 +68,9 @@ function xtf_build_cmdline()
     local xtf_variant=3D$1
     local xtf_name=3D$2
     declare -a cmdline=3D()
+    declare -A per_test_args=3D(
+        [argo]=3D"argo=3D1 mac-permissive=3D1"
+    )
=20
     cmdline+=3D("${XEN_CMDLINE}")
=20
@@ -76,6 +79,10 @@ function xtf_build_cmdline()
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



