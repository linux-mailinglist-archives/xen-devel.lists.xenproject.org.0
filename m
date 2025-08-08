Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 863AFB1EA68
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 16:34:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074622.1437135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOAR-0003sG-WD; Fri, 08 Aug 2025 14:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074622.1437135; Fri, 08 Aug 2025 14:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOAR-0003nD-Sk; Fri, 08 Aug 2025 14:33:59 +0000
Received: by outflank-mailman (input) for mailman id 1074622;
 Fri, 08 Aug 2025 14:33:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9AHj=2U=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ukOAQ-00039T-DA
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 14:33:58 +0000
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6afda05-7464-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 16:33:56 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailfhigh.phl.internal (Postfix) with ESMTP id D874B1400034;
 Fri,  8 Aug 2025 10:33:55 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Fri, 08 Aug 2025 10:33:55 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Aug 2025 10:33:54 -0400 (EDT)
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
X-Inumbo-ID: b6afda05-7464-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1754663635; x=1754750035; bh=0FfikJ2T24
	3hLk5SFXlL0/Gmd9mpE0L//k8/Yat58M0=; b=Q07ZKEVnxXm3Z98IR/8fl6ZXdT
	8Y30a5qAlUuvVpMa/BogtipmkdpF2ogZmlemtMqmOHw+NV4cK7SbsZzxA4r3QBSR
	zp70SatkI93IJnJODpmCGSnRkCEYrUbRFj+oXnLmFgBFuFmL0zstx1EmEMcmq0Zf
	KaotkrSWJbQJhhoZNGDnr8E6jtB6dfv4hcb45Hv/Z/nlfTXr8z1xvkfppDxJHcSy
	8dLeVP+frF99NDlwC5ed/L13EQsIUjSwH+PuZiKjEXszyICNEJkTzD191c/ikcaj
	VZYJbxdg2K9cGhrMd9ZfY4Mohg+OVzWbIr0SLy+RpUobPxTYHbu0xzGDuL6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1754663635; x=
	1754750035; bh=0FfikJ2T243hLk5SFXlL0/Gmd9mpE0L//k8/Yat58M0=; b=X
	oPYWGoIHbJynpoSfvWTtDpU/x4BNeS2+yK9GoNvI0ZwUTdKV+ldM9EztxVZPUdOd
	RwMvLyBWY0nBNcehK9eZR7tk1oWiJGHMWFhPmOaSuCDnwOZufKgJ5dfWoVbu7f9n
	sApBDFxKVQqN+8oL6sggOC7CaINRmIKUMdc6eJGaJpyN3bbutPdpaJPKt79LppFC
	Abtw/NHiqW8ti9hr6qWiNEtovVgh/9XZ0ZhEobVCxYGkCNtFUudhQvFXJfUwqbSS
	URVDcVVtLpRTvLrY5IcmlafbEgqy0rVKCH9WRn/esD7+aG2r432PIYzMhDjaLHMu
	qeCNN8SiNon1NVXmgmJYg==
X-ME-Sender: <xms:0wqWaEx03JtUJBxW1NIEA_OEjaEY4k3DTRNiISPH_q8ZJDh_Y_N50A>
    <xme:0wqWaC3aU_kxGpQd2cJCpuRQFN245MLTdWZ2-sR0NacS6lIbyt5sPcUxm93kuy1gb
    A5TKaSXOHVu1Q>
X-ME-Received: <xmr:0wqWaC5hVH9q_CVcBV8e53GeB0dtjw4vL9V4QlVw1ZX9D8R1TWzW-27J3XQNKR9QX_xjw5GlLq8FtNXyU6sV4BxZjOgePfpbeFrMWHoKbF0LVEH5gKIf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdegtdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelfedt
    fefgfffghfevhfehvdeileehheffueekieetfeffhfetgefggfejudfggeenucffohhmrg
    hinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomhdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpd
    hrtghpthhtohepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdr
    tghomhdprhgtphhtthhopegtrghrughovgestggrrhguohgvrdgtohhmpdhrtghpthhtoh
    epshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:0wqWaFXq5S0-p5B0ZU8CsZFW9l0I2AyiPZOEceRlo0AUH27Gus7HBw>
    <xmx:0wqWaBByXyZbYBBh7FtvkFOc5xD-zrIhiCW7sSMarQH7IQDjWE9ALA>
    <xmx:0wqWaE4EyaX1G2bzP3nxHgL-2osA3970QeWajgYKyF0wJfUwQsDOaQ>
    <xmx:0wqWaMzPiecpGpXT1K5j2YurLhio4NibhOSDgLM1zwYO7gcjxtEeTA>
    <xmx:0wqWaEvipflItB7ApE-b5NazmEVCSdtsBeOrMSUR1fE3IyvuYR4Gnh13>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 3/3] CI: Run driver domains test on Debian too
Date: Fri,  8 Aug 2025 16:32:43 +0200
Message-ID: <3f4e22c2424e8b534fe743aad1e1ee4934f9444c.1754663560.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.961bf2f7929562a899b182283446598d4c055149.1754663560.git-series.marmarek@invisiblethingslab.com>
References: <cover.961bf2f7929562a899b182283446598d4c055149.1754663560.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The recent failure affected only glibc-based systems, so do the test on
Debian too.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v2:
- use systemd in Debian

I once got the following timeout:

    (backend) ==> /var/log/xen/xldevd.log <==
    (backend) libxl: error: libxl_aoutils.c:539:async_exec_timeout: killing execution of /etc/xen/scripts/vif-bridge online because of timeout

https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/10961394681
(docker-bobcat runner)

Could be related to having systemd in domU (and being on QEMU TCG, not
even KVM). I never hit this case on Alpine nor Debian with OpenRC. If
that will repeat, may need some adjustments - more CPUs in QEMU? limit
to more powerful runners? setup KVM on the runners?
---
 automation/gitlab-ci/test.yaml                  | 19 ++++++++++++++++++-
 automation/scripts/qemu-driverdomains-x86_64.sh | 18 +++++++++++++++--
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 5c4b2dc304b4..a5ae03b0eee9 100644
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
+    job: debian-12-x86_64-rootfs
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
     - alpine-3.18-gcc
 
+qemu-debian-12-driverdomains-x86_64-gcc:
+  extends: .qemu-x86-64
+  script:
+    - ./automation/scripts/qemu-driverdomains-x86_64.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *debian-x86-64-test-needs
+    - debian-12-x86_64-gcc-debug
+
 qemu-smoke-x86-64-gcc:
   extends: .qemu-smoke-x86-64
   script:
diff --git a/automation/scripts/qemu-driverdomains-x86_64.sh b/automation/scripts/qemu-driverdomains-x86_64.sh
index a8e2ceb33527..e5765ba5dbd6 100755
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
@@ -77,7 +81,11 @@ cat > etc/local.d/xen.start << EOF
 
 set -x
 
-bash /etc/init.d/xencommons start
+if [ -d /run/systemd ]; then
+    systemctl start xen-init-dom0.service
+else
+    bash /etc/init.d/xencommons start
+fi
 
 xl list
 
@@ -94,6 +102,12 @@ cp ../bzImage ./root/
 mkdir -p etc/default
 echo 'XENCONSOLED_TRACE=all' >> etc/default/xencommons
 mkdir -p var/log/xen/console
+if [ -e etc/systemd/system.conf ]; then
+    chroot . systemctl enable proc-xen.mount \
+        xenstored.service \
+        xenconsoled.service \
+        xen-init-dom0.service
+fi
 mkfs.ext4 -d . ../dom0-rootfs.img 2048M
 cd ..
 rm -rf rootfs
-- 
git-series 0.9.1

