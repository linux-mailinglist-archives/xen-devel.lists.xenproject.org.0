Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE5798D381
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 14:42:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808759.1220757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svygG-0007OY-Vk; Wed, 02 Oct 2024 12:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808759.1220757; Wed, 02 Oct 2024 12:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svygG-0007Lo-Sn; Wed, 02 Oct 2024 12:42:12 +0000
Received: by outflank-mailman (input) for mailman id 808759;
 Wed, 02 Oct 2024 12:42:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3lMz=Q6=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1svygF-0007Li-Jr
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 12:42:11 +0000
Received: from fout-a2-smtp.messagingengine.com
 (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bce199b1-80bb-11ef-a0ba-8be0dac302b0;
 Wed, 02 Oct 2024 14:42:09 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfout.phl.internal (Postfix) with ESMTP id 3DC0E1380198;
 Wed,  2 Oct 2024 08:42:08 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Wed, 02 Oct 2024 08:42:08 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Oct 2024 08:42:07 -0400 (EDT)
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
X-Inumbo-ID: bce199b1-80bb-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1727872928; x=1727959328; bh=aS+PJ7LKA9tUCRQKTc93IyrC3+X3cz76
	nEll6rzei8A=; b=GlpGjK8P0qbYCEXK0eoXL2W3hGksPF62OP3cgnhVEJfulYoe
	nPmG0wOkg8yoMzEGjUtV0wINsVGij2RDpxv373+0m+F3SChKMrbE/wPJ6y2WyvXO
	VJ0Bw6+JZFIlToOW0s6aQoc1XPdsOScRU2H3dGFpz45LTH9opFo4jevbKQEa+x1j
	zyQ39tkQr11f/W+fkt2tKMG4ZkkVOSQGXkK1GzJVSqRo3lx8o+M1qdJAdXjESrPd
	ESRl0400UTZzKu9LLjIWMmpIc09mngFC4UtOW80Lm/wAu65JyuB5AGt1LDX2RaHX
	cMGl+avIM2Nyt3EFXS9D24GtQ0C9klgBkce9pQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1727872928; x=1727959328; bh=aS+PJ7LKA9tUC
	RQKTc93IyrC3+X3cz76nEll6rzei8A=; b=DWLi9o7VdfMGSkzNIAUMZqVf12Z83
	Ssrq7PRdnLTIpQrxNjiQtiGAsRn05N3I9/we3WeCcrSng+Kb1mgw7s8cca5mxHH7
	/SlJlNn2JFlm68PIYTne+PcaGCeoz+nO+iLftkfHAjAzs56bI4Ia12CA84iJWdmG
	/T/uxMs+xBW+djZWiPpCRWFn/FBcuYgeR3fCDbbfRRbZ6NgrmFEkRpSYqLZbuWd3
	lUC7cmRJPnwpfyrEfB/3HOqVO73sdo++hP66+4fAR+cfr2TzRgXMsc2FqCL+2hBd
	odpG3Napq2iqv5+u0ZS5GcyfD0nUjJw4Epilz/zmqnOI0qA7fD3fancpQ==
X-ME-Sender: <xms:nz_9Zrbnpf2PQOX-ZB_SbztiXAKv7II7ZILUPdI8LGzTeMQMziruFQ>
    <xme:nz_9ZqZIj8XD8sGNdJQ--rf5ktL9I9j9-tD29gEB1q3oLt5IrA3NkS12dW-UvdDGI
    c01cp4h4qCs_Q>
X-ME-Received: <xmr:nz_9Zt9qr71lNBjrkWlQIQrMeLkznv7Niow0RhSn-GX_sUw7nRc9sMJWIGaPvwVEcmcywcOs6zucOegeh2gu1xG18ZGdXTLUFiv__QKDk5acepLp_V8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdduledghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecu
    hfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrg
    hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffr
    rghtthgvrhhnpefhkeduleeggfeihedtvddvveeileduueeugefftddvfeelkeeggfehje
    ffhfetkeenucffohhmrghinhepghhithhlrggsrdgtohhmpdigvghnrdhorhhgnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvg
    hksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohep
    gedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhish
    htshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdprhgtphhtthhopegtrghrughovg
    estggrrhguohgvrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhn
    vghlrdhorhhg
X-ME-Proxy: <xmx:oD_9ZhpHLIpa-f6cgWc4Ek07QSSFnKnRMpzmRwX2_6UHc8709KFYpg>
    <xmx:oD_9Zmpm9_Aj5H-SBck9b83cYp9Hdhx1R98o8jevHBYAyIOh3lYhDQ>
    <xmx:oD_9ZnRz-LU-T2-NmyRpE28Iym2r_BZ_QNiXk61epW_tu2OSaA0sQA>
    <xmx:oD_9ZurxECwbQYLWzql-_nKIIgsvlbBNDM6LF3D_eVrY0kK5GnPRnw>
    <xmx:oD_9ZpVTKGZUcPibiLbyGTBs_EVlfQ9I7eer0fCUUoOYmwLLYT30HWIL>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] automation: add a smoke test for xen.efi on X86
Date: Wed,  2 Oct 2024 14:41:55 +0200
Message-ID: <20241002124159.716270-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.46.0
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


