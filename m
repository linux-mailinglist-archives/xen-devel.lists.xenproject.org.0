Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E77F9CA49B3
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 17:54:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178129.1502111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCbD-0000w5-Qw; Thu, 04 Dec 2025 16:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178129.1502111; Thu, 04 Dec 2025 16:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCbD-0000u1-NS; Thu, 04 Dec 2025 16:54:35 +0000
Received: by outflank-mailman (input) for mailman id 1178129;
 Thu, 04 Dec 2025 16:54:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ymfd=6K=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vRCbC-0000ds-LG
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 16:54:34 +0000
Received: from fhigh-a1-smtp.messagingengine.com
 (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7e16bf8-d131-11f0-980a-7dc792cee155;
 Thu, 04 Dec 2025 17:54:32 +0100 (CET)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 1863E140022D;
 Thu,  4 Dec 2025 11:54:32 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-10.internal (MEProxy); Thu, 04 Dec 2025 11:54:32 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Dec 2025 11:54:30 -0500 (EST)
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
X-Inumbo-ID: e7e16bf8-d131-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1764867272; x=1764953672; bh=J72eRzq98N
	ECh/4fpjgE0AyqaKIdPFIrY0AwJqY41fY=; b=apgmgbkFnGcB+2QP46jILWcERL
	AFMOcSPgHItCiDlCJAEk/Bdaq1hc4DmdHWr8IFb0yOxKYW4h3NeF7KciGWIif3x4
	WVh60I1Gn3V7yok6cJNcAKb9BsknJqk9dUPaLMMt8inHUnPE/cWxGU+C5NjoFMfz
	JYBmrBboewme5wfq3QTB9iCQ2D+sFrsCNm+YvWn/07ftGa1yD8ZmcEtEF+APLhVb
	yMMC8P8AqJ3TpVY+bbAkpR5okUAOLFqLMxB5nbdNbZxTA+w57cp9Zrj9ap7kY+JR
	i1c3d+WQ4NZqRIbRCyMBcPHp16v9EUNNPiYvni2ncSYJn0v559r8O3b8Bf3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764867272; x=
	1764953672; bh=J72eRzq98NECh/4fpjgE0AyqaKIdPFIrY0AwJqY41fY=; b=d
	e2cZ0LaxLwe8JbrVebXFi4TRc2V0SUaUMyByKInw8NiH+2nnhGdptrpPFgnU8bfh
	3Iu254OagYyQWCi3PFZuz5h7cDd93/MujMJkXrB2r/rBtGcWzVMTHDanfqLPc+U/
	D4/1BYkQaLdLBdIaWLccS7X1jG9pBfXyQwILE2tkPhqolyUByuAul6vT8FZoH3/8
	4NCwsaJ67CAqQ6Z9JtA4POn+KctmEyDTzLdGkZWvhYdyARbdOM/2JBBXnAHapTKI
	LARbVTYs9/dLAvIPhL0WUvKa782t6j374aL4stwSeM4k59RX3aW7WyOLdkrFusQH
	PMdCqx/LPZ5QtWf+lkzRQ==
X-ME-Sender: <xms:x7wxaU7hM6K0LkgxNUKx6UR1CZQldDtmkl2F7pcHFnzANfpds1kkXw>
    <xme:x7wxac7CmWcL9jTc04OEd38L2JEWGNCCzuFPod-sKGV9U81VCEvtIZnTsQPfaNvDg
    373J5ZdNu6T5_8OS9aZbPvVeh_j61X-PICREsu56d3gPsC-Jfo>
X-ME-Received: <xmr:x7wxaYcTT-n3DC6ySs246AD9M8JZeLLT5k46D55HYYU0LiW9fneOwgYzI-TKSiH89SGcKeGzF7b-h1vxIlGi0EB7U3WWXahsTeSkjQGXs24>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeiudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgueduhefg
    vdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdig
    vghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghpthhtoheptggrrhguohgvsegtrghr
    ughovgdrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:x7wxaYCoyk1Li_T0xNbDxsFLCNE-vJX7BZh3pwr1GmI1A5b0pbdGAQ>
    <xmx:x7wxaT_07TU6HosYlYF_qcku0EwvjW6QsxCJJk0jiwJDHiPYIeIV3g>
    <xmx:x7wxabLma9qkgtN7L5Jj-IUC1cQ3kXDQmg-Ary4qMbN7-lBX19F7jQ>
    <xmx:x7wxaUg5OIF0zaMFg6_eDEnqiT7cbwPBCyxrFJzwEHIFD96daITI9A>
    <xmx:yLwxaZYC5-R5aFVjAHMvhIriP4j-JXQ1AsbKeOrbZZG1ocyy9XEBXPD_>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 4/4] CI: Run driver domains test on Debian too
Date: Thu,  4 Dec 2025 17:53:51 +0100
Message-ID: <03a3f35f32af69e1f37cdb40d8e667b393a90075.1764867217.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1e7327573686b6fc1e161127e268e4042556d16e.1764867217.git-series.marmarek@invisiblethingslab.com>
References: <cover.1e7327573686b6fc1e161127e268e4042556d16e.1764867217.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The recent failure affected only glibc-based systems, so do the test on
Debian too.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v3:
- update to trixie
Changes in v2:
- use systemd in Debian
---
 automation/build/debian/13-x86_64.dockerfile    |  1 +-
 automation/gitlab-ci/test.yaml                  | 19 ++++++++++++++++++-
 automation/scripts/qemu-driverdomains-x86_64.sh | 18 +++++++++++++++--
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/automation/build/debian/13-x86_64.dockerfile b/automation/build/debian/13-x86_64.dockerfile
index 9387da453fea..d0b7b8fe69d1 100644
--- a/automation/build/debian/13-x86_64.dockerfile
+++ b/automation/build/debian/13-x86_64.dockerfile
@@ -61,6 +61,7 @@ RUN <<EOF
         fakeroot
         ovmf
         qemu-system-x86
+        systemctl
 
         # for build-each-commit-gcc
         ccache
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 52ffb271951a..292e5ddb8de5 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -30,6 +30,17 @@
     job: microcode-x86
     ref: master
 
+.debian-x86-64-test-needs: &debian-x86-64-test-needs
+  - project: xen-project/hardware/test-artifacts
+    job: linux-6.6.56-x86_64
+    ref: master
+  - project: xen-project/hardware/test-artifacts
+    job: debian-13-x86_64-rootfs
+    ref: master
+  - project: xen-project/hardware/test-artifacts
+    job: microcode-x86
+    ref: master
+
 .qemu-arm64:
   extends: .test-jobs-common
   variables:
@@ -664,6 +675,14 @@ qemu-alpine-driverdomains-x86_64-gcc:
     - *x86-64-test-needs
     - alpine-3.22-gcc
 
+qemu-debian-13-driverdomains-x86_64-gcc:
+  extends: .qemu-x86-64
+  script:
+    - ./automation/scripts/qemu-driverdomains-x86_64.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *debian-x86-64-test-needs
+    - debian-13-x86_64-gcc-debug
+
 qemu-smoke-x86-64-gcc:
   extends: .qemu-smoke-x86-64
   script:
diff --git a/automation/scripts/qemu-driverdomains-x86_64.sh b/automation/scripts/qemu-driverdomains-x86_64.sh
index c0241da54168..6a69282470ca 100755
--- a/automation/scripts/qemu-driverdomains-x86_64.sh
+++ b/automation/scripts/qemu-driverdomains-x86_64.sh
@@ -23,7 +23,11 @@ if grep -q test=backend /proc/cmdline; then
     brctl addbr xenbr0
     ip link set xenbr0 up
     ip addr add 192.168.0.1/24 dev xenbr0
-    bash /etc/init.d/xendriverdomain start
+    if [ -d /run/systemd ]; then
+        systemctl start xendriverdomain
+    else
+        bash /etc/init.d/xendriverdomain start
+    fi
     # log backend-related logs to the console
     tail -F /var/log/xen/xldevd.log /var/log/xen/xen-hotplug.log >>/dev/console 2>/dev/null &
 else
@@ -85,7 +89,11 @@ cat > etc/local.d/xen.start << EOF
 
 set -x
 
-bash /etc/init.d/xencommons start
+if [ -d /run/systemd ]; then
+    systemctl start xen-init-dom0.service
+else
+    bash /etc/init.d/xencommons start
+fi
 
 xl list
 
@@ -102,6 +110,12 @@ cp ../bzImage ./root/
 mkdir -p etc/default
 echo 'XENCONSOLED_TRACE=all' >> etc/default/xencommons
 mkdir -p var/log/xen/console
+if [ -e etc/systemd/system.conf ]; then
+    systemctl --root=. enable \
+        xenstored.service \
+        xenconsoled.service \
+        xen-init-dom0.service
+fi
 fakeroot -i ../fakeroot-save mkfs.ext4 -d . ../dom0-rootfs.img 2048M
 cd ..
 rm -rf rootfs
-- 
git-series 0.9.1

