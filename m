Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F774CA9F2A
	for <lists+xen-devel@lfdr.de>; Sat, 06 Dec 2025 03:49:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179693.1503205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRiMe-000864-BF; Sat, 06 Dec 2025 02:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179693.1503205; Sat, 06 Dec 2025 02:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRiMe-000840-7R; Sat, 06 Dec 2025 02:49:40 +0000
Received: by outflank-mailman (input) for mailman id 1179693;
 Sat, 06 Dec 2025 02:49:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JSAj=6M=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vRiMc-0007Zh-Ee
 for xen-devel@lists.xenproject.org; Sat, 06 Dec 2025 02:49:38 +0000
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33d127e2-d24e-11f0-9d1b-b5c5bf9af7f9;
 Sat, 06 Dec 2025 03:49:37 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.stl.internal (Postfix) with ESMTP id 57F0E1D0019A;
 Fri,  5 Dec 2025 21:49:36 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Fri, 05 Dec 2025 21:49:36 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Dec 2025 21:49:35 -0500 (EST)
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
X-Inumbo-ID: 33d127e2-d24e-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1764989376; x=1765075776; bh=prW7XMiOMK
	ifMEePOcA3es+i0QHEsIa+PvP5prM8XC0=; b=UZ5i8v0/a1EbjX+UR/fP2Sd+it
	k1JqrNyO7va/F+uN9xDuEiGntALyeYLzfBVx+UKVbBO1GjqxFtGJ93BvqOUFn5/7
	gJEsv2cDrG5KGztAZSnoQzMfV9g1JVWv9oRSLgCSELqIzr7XiOe57rk46qVyrVoY
	h1JQ9f2eLhonBOLSiamePZGLXjxzDfT8Xi25FyNey4ZdB2NVeZr0dRBoXTQOkpwU
	jKqe6iD9+RRFqjTrNIml5/zp+r5BCUKZiHdHYih/EB1uiCsLoPeTTwsIqO6zeXnn
	qKiGKB/y9pRziD/baCM61gzejBcSJLcJtFlccMlcXFaN4UCWi71BmMHobGYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764989376; x=
	1765075776; bh=prW7XMiOMKifMEePOcA3es+i0QHEsIa+PvP5prM8XC0=; b=G
	9z1pc3skBYmsSTamg/Sfoi1TnVPCngqeRSYkvsWAs1Y1brlhR2VFSr4ug2t0yyBf
	Ya6pbQ0U4Qey33I50Zs58N9MWBXJ4tGAaUOkQgNUmuVSN1XPcvTmCRziFmsIWrN2
	yWICA33lSGM9mXrZQ8zCltifANJL1SVk6RnOIfvVUpBrz+TI3JZ/+4VyfPECCvsR
	oYkL5ULW+xjILXmIaToSMv+anbz48ctsRiBbJLIQiWVGZhMoHaU6aKYj1amMPo6d
	2bOjLXf3XVcv0b2ZkhebmjPiBWNZ4HPDiS0GjMAwq2qSsDilli24Z7IO2kHwTwHe
	Mc3g63xV8MDs5kd2kb82w==
X-ME-Sender: <xms:wJkzactuUSRQqwbS68p-bBWwpoA0zGz_HH_WKW5ybmZNGwkhLFioJw>
    <xme:wJkzaQV1h-gNs9SApC_EnhE9EYuVu1MQE-I1E-7ElTiby5NbbTfrHdnMp2jRYrrlx
    NTu7aN8hrrYtbQh6dWUjmqwEQB2i6RcEHH-MvgezNW_jQ6v0Q>
X-ME-Received: <xmr:wJkzaQHkfY7fODtRVt1nTo-qIowRrIhu3VNr1voEm44hozg40VV3sqvkaeUiRYkBGDf02zrhVfD9HORJRH9EtwXY5fkPgUpdN_UdgHc9N5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgueduhefg
    vdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlhhushhtvg
    hrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdig
    vghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfe
    estghithhrihigrdgtohhmpdhrtghpthhtohepmhgrrhhmrghrvghksehinhhvihhsihgs
    lhgvthhhihhnghhslhgrsgdrtghomhdprhgtphhtthhopegtrghrughovgestggrrhguoh
    gvrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:wJkzaa0kAFsVd8H7GxddUrbRLe_nCausvfkfJqCYmY8ro8zA9pB5Sg>
    <xmx:wJkzaaPIlOpFBPHfsS-OGCdovH3TAUHd1Zs1Unb8PMjjYSbQK2pBkg>
    <xmx:wJkzaR453OEsj9jIRsEbE7YJj0apGXh4JWDe7U2ofMEfOkFAG-Bf_w>
    <xmx:wJkzac2N9gcI8cYznPI1Z18Y7tXOR14dyC4rYzNDLkl6_r165vuv6Q>
    <xmx:wJkzadkT9IODVGz7iSdC5bxBgu0HCwZEb6-WECs6yaJjzBDoZqWhvSLy>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 6/6] CI: Run driver domains test on Debian too
Date: Sat,  6 Dec 2025 03:48:08 +0100
Message-ID: <7fdf483cb41ba04ec3949fba31991ffec2c5b712.1764989098.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.b56a66dfe4d98db2f1cc8b1fe0c2091d02cebe38.1764989098.git-series.marmarek@invisiblethingslab.com>
References: <cover.b56a66dfe4d98db2f1cc8b1fe0c2091d02cebe38.1764989098.git-series.marmarek@invisiblethingslab.com>
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
index 6382bafbd5bd..3f84ba4a8823 100644
--- a/automation/build/debian/13-x86_64.dockerfile
+++ b/automation/build/debian/13-x86_64.dockerfile
@@ -60,6 +60,7 @@ RUN <<EOF
         fakeroot
         ovmf
         qemu-system-x86
+        systemctl
 
         # for build-each-commit-gcc
         ccache
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index abc5339a74ab..ffb2880f5af3 100644
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

