Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3351A98FC57
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 04:30:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809932.1222516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swY4z-0005r6-8V; Fri, 04 Oct 2024 02:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809932.1222516; Fri, 04 Oct 2024 02:30:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swY4z-0005hJ-2M; Fri, 04 Oct 2024 02:30:05 +0000
Received: by outflank-mailman (input) for mailman id 809932;
 Fri, 04 Oct 2024 02:30:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v+dN=RA=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1swY4x-00056c-D8
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 02:30:03 +0000
Received: from fhigh-b3-smtp.messagingengine.com
 (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d0a27af-81f8-11ef-a0ba-8be0dac302b0;
 Fri, 04 Oct 2024 04:30:00 +0200 (CEST)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfhigh.stl.internal (Postfix) with ESMTP id A089125400BE;
 Thu,  3 Oct 2024 22:29:58 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-08.internal (MEProxy); Thu, 03 Oct 2024 22:29:58 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Oct 2024 22:29:57 -0400 (EDT)
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
X-Inumbo-ID: 8d0a27af-81f8-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1728008998; x=1728095398; bh=UUSX/6jdgQ
	dvcUrZZczumy32nQDsNtQu974vvHbh+9w=; b=UwVqcwIah+Til0lEJD2Mn/rfg+
	oGVgi9k7Twgd9RPoVUHLx70I/Xuoxr0vVgJlkG+bMpQviqjHQjFllr4Mjhzn66d+
	4S+6fkEb/tUb+RtXj9mhN04Bn9kyZIgVjbNpQXWvIJtwVpokdISNrtbjMgMb7lz3
	ErH80KCcboNMYxe3M7ZRXWModJ2R3x3QwMHqbA2lLaiOutelwmyZMVFI/k9Kmq2C
	1/ZeYL2XuHqq+fFuKSnjgvNP4WLVd9HftjIJsYYvNS8qgiqYMr21+KI/a1ESfc3g
	ft3797B54bD6CGevtlNtQkOd3Subf9/vZKGyzPm3nglcPXd/G40kBWcO1UYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728008998; x=
	1728095398; bh=UUSX/6jdgQdvcUrZZczumy32nQDsNtQu974vvHbh+9w=; b=K
	5gCq8x+UDosa6RCWjodXJYQ24lJOe8hWCrThJ81THUKvM1mv+J6RCKqsmKx1U7SK
	dZ+hbWpippIgUFCvj+lzgc4t7mqyYVKKerzwFwKdGYUYBLcGFGfERTzkOyyXq7L/
	hbx3TmKpR9u2C2SzPdXHvWsCL24iAmrFJJa3UG3GlJ/9FusPwdaRd6v8C9JiB4Y5
	9jGB1+q+ZD8Jjy+m69ASaM7d3ejLdndtlSZIhmPbkNYWtSepFOmc89Jg8lyhb9p9
	orkSbKzvYyYQtK3bBW/u2edPx+zftN9zFROP2SiKYS872s9gN7/L1+qA1sv8CiVb
	HuVoraTtHqSyOEevEW4fg==
X-ME-Sender: <xms:JlP_ZqEtnpz_obkTY-GPMCl8pCv0E8X19hLvL0TOcBUgVd8iAYEjHg>
    <xme:JlP_ZrUvusLzA6CkRIrgvHidyX1Nlgai19RXWRxktCVuavK9Wee-VIZEtp-6XJbsc
    OWOs2MC_q9_0A>
X-ME-Received: <xmr:JlP_ZkJGXxhJRkS5-qLU2T9DAFvTFewGX2fBbGYXlMvoaJlLJ7mVhvnm2lvXlBvM7vuaWaze_hyPufr5FpZOUSwElfr3slbTbs58kTfXFZ4Rli-ZIls>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvvddgiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpeekieettdeivdevhffgtdduveetveejheevgedtheevhefghfefgf
    ekkeefudekffenucffohhmrghinhepgigvnhdrohhrghenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhroh
    hjvggtthdrohhrghdprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhishhisghlvght
    hhhinhhgshhlrggsrdgtohhmpdhrtghpthhtoheptggrrhguohgvsegtrghrughovgdrtg
    homhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:JlP_ZkGiaz-FT2-n3193XJVJ8d6OcJe1eiUVnIpoCXBYkVzkstuZBw>
    <xmx:JlP_ZgVAyuKmCLYe_0D8xcpdXrivZ1wLFtyNiLlunRXVPsOolq6vAw>
    <xmx:JlP_ZnNcJCHm-hQ6U0j3uSb2qSEB1rTR-zaLBC5g_hXxuODCQnx5Mg>
    <xmx:JlP_Zn1ALC4-M__Sa5UvAMAG1Dg_7oGCxOzR9uz4iwal7ptfpRek8Q>
    <xmx:JlP_ZnS9YoqMSP4FKhtXqpMjoOBp5-yAuulCq33oJ_R3HSo9ZV0va_lS>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/3] automation: add a smoke test for xen.efi on X86
Date: Fri,  4 Oct 2024 04:29:38 +0200
Message-ID: <6114373e9513b531af06d7e1e34ead90eedf02d3.1728008940.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1bb6f2ab5669356ea3ff954b7c324d2f31c19399.1728008940.git-series.marmarek@invisiblethingslab.com>
References: <cover.1bb6f2ab5669356ea3ff954b7c324d2f31c19399.1728008940.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Check if xen.efi is bootable with an XTF dom0.
The multiboot2+EFI path is tested on hardware tests already.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
This requires rebuilding debian:bookworm container.

Changes in v2:
- drop forcing TEST_TIMEOUT in the script - now can be set from test.yml
  when needed; and move actually reducing timeout to separate commit
---
 automation/build/debian/bookworm.dockerfile |  1 +-
 automation/gitlab-ci/test.yaml              |  7 ++++-
 automation/scripts/qemu-smoke-x86-64-efi.sh | 43 ++++++++++++++++++++++-
 3 files changed, 51 insertions(+)
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
index e9477361955a..5687eaf9143d 100644
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
index 000000000000..7572722be6e5
--- /dev/null
+++ b/automation/scripts/qemu-smoke-x86-64-efi.sh
@@ -0,0 +1,43 @@
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
+
+./automation/scripts/console.exp | sed 's/\r\+$//'
-- 
git-series 0.9.1

