Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E35F98D384
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 14:43:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808763.1220777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svyh1-00087s-G3; Wed, 02 Oct 2024 12:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808763.1220777; Wed, 02 Oct 2024 12:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svyh1-00084k-D1; Wed, 02 Oct 2024 12:42:59 +0000
Received: by outflank-mailman (input) for mailman id 808763;
 Wed, 02 Oct 2024 12:42:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3lMz=Q6=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1svygz-0007os-HO
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 12:42:57 +0000
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7d67e60-80bb-11ef-99a2-01e77a169b0f;
 Wed, 02 Oct 2024 14:42:54 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfhigh.phl.internal (Postfix) with ESMTP id D44A21140124;
 Wed,  2 Oct 2024 08:42:53 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Wed, 02 Oct 2024 08:42:53 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Oct 2024 08:42:52 -0400 (EDT)
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
X-Inumbo-ID: d7d67e60-80bb-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1727872973; x=1727959373; bh=aS+PJ7LKA9
	tUCRQKTc93IyrC3+X3cz76nEll6rzei8A=; b=OBJHHA3UQea2mdal7HuDJIWLIu
	y2tOnlMGA42dh03CLQ7ZIAFwgk5HG+Dz15f8SvHYLCQYtVIInNiWGNphzKH+BKGZ
	Rc+aB+p9Y2cmz0EN+UK1NV0XZD+5qIWLM+rWWO8ajwOSd8H3m+wvk0kevn9EcaCy
	Y/QOoW0Kp5BB1qZ4X92WlHPNjcX1ljm0eEv1Ejd38X7DaJRPeVqlYl6BflkTQ6+G
	bW4ql2p2PshX3AAEt0s1cpGGCV+E64dTyMaPsXLrw6bE4mPXuB/psiS1D4KCxUjS
	SFkzUokzpQvIpfYicNwO18ZK2QUQAp1Az4brZxddtPC7gbc8CHZGzQieN3Kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727872973; x=
	1727959373; bh=aS+PJ7LKA9tUCRQKTc93IyrC3+X3cz76nEll6rzei8A=; b=c
	q9oC+U7HD+MfDspTnAsqGhyZqS3HOIdJAQsWPZMf+nvSjgSmUxp2Ayurp/o2tFfo
	CK2GUZLo+bMHKI6sxAh/iG1MHntRQ3aVeZwjGdrYxcQ0C6LohzCMvU9ydTFPVqj/
	TSt+E6vKN40athXV+dJZuO39hJE3pyP6QvA2BS3kRAet7xEpklQ0KWTAUsZdW/k0
	dRlYysEXWtttvd7929q6UApCNs1vDsjHYf1MWdVn6xd02ppnK7F+EvLZ458uGdwr
	ikZOtfZZfU11ItGAEyTkGKLoAvtdF6l0aXWG8w8UlOTbyZ/On55rzZsJtWbBL00l
	a/DfPdglwQRSUpfnTjMOQ==
X-ME-Sender: <xms:zT_9Zm0sEBP6DXctIXG8AgIA8KDm7yLVUCMh19J-C7jJ41U078HmCg>
    <xme:zT_9ZpH0PmiLD8Yql1UqwmKZQqherz3bjMpWTB5tPV6vxKascx4TXG56q1dyF9IPO
    QyaQSh8bprxow>
X-ME-Received: <xmr:zT_9Zu6_lB0psmOvLmSXGxdwrSAcxT-E-sGkV0BP66I4EpYmMHMHWrxNUorLefRxvzA-y0DlbVl8w6zysWjmTfzFRU3RR0ENtriOiksHe4eEr0kSbxM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdduledghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpedtfffgleejfffhhfdvkeehieeuuefhveffjeejledvtdetgefhie
    ejteelhedvhfenucffohhmrghinhepghhithhlrggsrdgtohhmpdigvghnrdhorhhgnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrg
    hrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthht
    ohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslh
    hishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdprhgtphhtthhopegtrghrug
    hovgestggrrhguohgvrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:zT_9Zn34ENXD8VfL9yFc4yH84BKMis3r6wTeUVaL5FDHc0ALFAu0Uw>
    <xmx:zT_9ZpHf-ay-c-Ln8vz0t24Tkr1K9XOn7RRzeZDnHeD94hPydJP3-A>
    <xmx:zT_9Zg8T033pcw2lygKm-8jmA7dC8uwwdFDhD-ErclLjLZAydlKzZg>
    <xmx:zT_9ZukocDydFZr3UXodnY2z6eWOE97Qw5Ky9U1rpcO_rmeZiNJbmw>
    <xmx:zT_9ZpAr30gx8bdNWpemxsFcuIARioejFqwlazaiMgk3vrk8U5YBrrg8>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] automation: add a smoke test for xen.efi on X86
Date: Wed,  2 Oct 2024 14:42:41 +0200
Message-ID: <20241002124245.716302-2-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241002124245.716302-1-marmarek@invisiblethingslab.com>
References: <20241002124245.716302-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Check if xen.efi is bootable with an XTF dom0.

The TEST_TIMEOUT is set in the script to override project-global value.
Setting it in the gitlab yaml file doesn't work, as it's too low
priority
(https://docs.gitlab.com/ee/ci/variables/#cicd-variable-precedence).

The multiboot2+EFI path is tested on hardware tests already.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
This requires rebuilding debian:bookworm container.

The TEST_TIMEOUT issue mentioned above applies to xilix-* jobs too. It's
not clear to me why the default TEST_TIMEOUT is set at the group level
instead of in the yaml file, so I'm not adjusting the other places.
---
 automation/build/debian/bookworm.dockerfile |  1 +
 automation/gitlab-ci/test.yaml              |  7 ++++
 automation/scripts/qemu-smoke-x86-64-efi.sh | 44 +++++++++++++++++++++
 3 files changed, 52 insertions(+)
 create mode 100755 automation/scripts/qemu-smoke-x86-64-efi.sh

diff --git a/automation/build/debian/bookworm.dockerfile b/automation/build/debian/bookworm.dockerfile
index 3dd70cb6b2e3..061114ba522d 100644
--- a/automation/build/debian/bookworm.dockerfile
+++ b/automation/build/debian/bookworm.dockerfile
@@ -46,6 +46,7 @@ RUN apt-get update && \
         # for test phase, qemu-smoke-* jobs
         qemu-system-x86 \
         expect \
+        ovmf \
         # for test phase, qemu-alpine-* jobs
         cpio \
         busybox-static \
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 8675016b6a37..74fd3f3109ae 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -463,6 +463,13 @@ qemu-smoke-x86-64-clang-pvh:
   needs:
     - debian-bookworm-clang-debug
 
+qemu-smoke-x86-64-gcc-efi:
+  extends: .qemu-x86-64
+  script:
+    - ./automation/scripts/qemu-smoke-x86-64-efi.sh pv 2>&1 | tee ${LOGFILE}
+  needs:
+    - debian-bookworm-gcc-debug
+
 qemu-smoke-riscv64-gcc:
   extends: .qemu-riscv64
   script:
diff --git a/automation/scripts/qemu-smoke-x86-64-efi.sh b/automation/scripts/qemu-smoke-x86-64-efi.sh
new file mode 100755
index 000000000000..e053cfa995ba
--- /dev/null
+++ b/automation/scripts/qemu-smoke-x86-64-efi.sh
@@ -0,0 +1,44 @@
+#!/bin/bash
+
+set -ex -o pipefail
+
+# variant should be either pv or pvh
+variant=$1
+
+# Clone and build XTF
+git clone https://xenbits.xen.org/git-http/xtf.git
+cd xtf && make -j$(nproc) && cd -
+
+case $variant in
+    pvh) k=test-hvm64-example    extra="dom0-iommu=none dom0=pvh" ;;
+    *)   k=test-pv64-example     extra= ;;
+esac
+
+mkdir -p boot-esp/EFI/BOOT
+cp binaries/xen.efi boot-esp/EFI/BOOT/BOOTX64.EFI
+cp xtf/tests/example/$k boot-esp/EFI/BOOT/kernel
+
+cat > boot-esp/EFI/BOOT/BOOTX64.cfg <<EOF
+[global]
+default=test
+
+[test]
+options=loglvl=all console=com1 noreboot console_timestamps=boot $extra
+kernel=kernel
+EOF
+
+cp /usr/share/OVMF/OVMF_CODE.fd OVMF_CODE.fd
+cp /usr/share/OVMF/OVMF_VARS.fd OVMF_VARS.fd
+
+rm -f smoke.serial
+export TEST_CMD="qemu-system-x86_64 -nographic -M q35,kernel-irqchip=split \
+        -drive if=pflash,format=raw,readonly=on,file=OVMF_CODE.fd \
+        -drive if=pflash,format=raw,file=OVMF_VARS.fd \
+        -drive file=fat:rw:boot-esp,media=disk,index=0,format=raw \
+        -m 512 -monitor none -serial stdio"
+
+export TEST_LOG="smoke.serial"
+export PASSED="Test result: SUCCESS"
+export TEST_TIMEOUT=120
+
+./automation/scripts/console.exp | sed 's/\r\+$//'
-- 
2.46.0


