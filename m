Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42310A940B5
	for <lists+xen-devel@lfdr.de>; Sat, 19 Apr 2025 03:04:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959755.1352055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5wcu-0001wE-HA; Sat, 19 Apr 2025 01:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959755.1352055; Sat, 19 Apr 2025 01:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5wcu-0001tM-D3; Sat, 19 Apr 2025 01:04:12 +0000
Received: by outflank-mailman (input) for mailman id 959755;
 Sat, 19 Apr 2025 01:04:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GNoH=XF=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u5wcs-0001gk-Cx
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 01:04:10 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32a17046-1cba-11f0-9eb0-5ba50f476ded;
 Sat, 19 Apr 2025 03:04:09 +0200 (CEST)
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
X-Inumbo-ID: 32a17046-1cba-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745024648; x=1745283848;
	bh=IjOyuXSKVCXNqvxd/Bt16D2Dy967L2dTHaZI1BEueCQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=d9ojudO7Y72loNGxZ4pf1ZgXBXgwstNtyz9/fG4VP8NX4EKuGF/0FjBqDsJB8r2fG
	 kyhVoaujIy281UAmUkx4W+nNaSyVcD3tE3cqz/r2Yivpjs4c6N8uIiFUAUPhijMvdT
	 nI5VQulV6nPxXtvIfYjp38o83UL3csK2l1Z11BR5yWwnaLFfTudVhYeSPI6GpyihHd
	 GDGmjPXLA1/bhQLRnVE4VM8b96eLQJK9Y9/VD4i/K5ed/LIfZgok0XO3tqMiMMvZd+
	 +lvfT8k7YdTPI6/s0VP6MICLJjwvlbg0dFwUTmD8l0/mkqkbYStOJNg8oHajq9RsEg
	 5aElXHkRC7xJg==
Date: Sat, 19 Apr 2025 01:04:03 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, cardoe@cardoe.com, marmarek@invisiblethingslab.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 4/4] CI: add argo x86 XTF test
Message-ID: <20250419010319.2572518-5-dmukhin@ford.com>
In-Reply-To: <20250419010319.2572518-1-dmukhin@ford.com>
References: <20250419010319.2572518-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 0eed745644dc4aa40ba247087c7f5b6212e8ffce
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Introduce new CI job to run x86 XTF argo test under QEMU to smoke test argo
feature functionality in upstream CI.

The new job lead time is ~30s, limit max job duration to 60s.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Depends on
   https://lore.kernel.org/xen-devel/20250416050443.919751-1-dmukhin@ford.c=
om/
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



