Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHJdCQqV+GnnwgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A20594BD243
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299771.1574343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgI-0002Fj-Eb; Mon, 04 May 2026 12:45:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299771.1574343; Mon, 04 May 2026 12:45:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgI-0002DV-B0; Mon, 04 May 2026 12:45:50 +0000
Received: by outflank-mailman (input) for mailman id 1299771;
 Mon, 04 May 2026 12:45:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wJsgH-0002CB-7Q
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 12:45:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJsgG-001PV9-JB
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:45:48 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f894f0-e002-0a2a0a5209dd-0a2a45018504-40
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:45:48 +0200
Received: from [202.12.124.154] (helo=fhigh-b3-smtp.messagingengine.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f894fa-c1f2-0a2a45010019-ca0c7c9ae9db-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:45:47 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 876DC7A0095;
 Mon,  4 May 2026 08:45:46 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Mon, 04 May 2026 08:45:46 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 May 2026 08:45:45 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1777898746; x=1777985146; bh=9tevKSqDRz
	difcUXtJIijWe/rZ834b3pQcdRCdRtHlc=; b=S9sLNcyvYBrJ5cMZAa85vLBC4W
	5fJPMRZTwHnEAKUKrtOMgJPGIaL2S79kC26+7Ez8NHnSM+2eYBXsj4g+w+INjFuv
	v9tdOlWrT+UEOfl8faD7Z2BFmlZ4HLRqlewCSG7sN3OV5SlbbrOE1TXB8EaO/Mbc
	/pnjq5UsR0wfHBnJbe5bMJFSlyJzyLTo+4frH+HkaM88iBJNrRkdq0umswI2ncOu
	j8NS26Cxp8+K0awPs49sXyJ091z47S0wsjKTRO9ih0RUT/anmW2/gV7CPKJ/ntL5
	J6L7ExRDSezhruLu57001pXfp4VFP79PfbZiLfosuayYmlBcnErmBnc4SvGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777898746; x=
	1777985146; bh=9tevKSqDRzdifcUXtJIijWe/rZ834b3pQcdRCdRtHlc=; b=Y
	Myom1NrGaBMFEuUksG3QcTiJDEwZlLtd6e1RhmsspzmZJclQsNsixUIP7odxhgUc
	8mov59jEGaoFkEIbM8MhCDXFHrzsXi2qquqzIY/nsJ3PjJHhIEclUo5n2oIG9Q4L
	Hqe4riRcnIj5SsDw/UMmWg3JxiUhRE0If/QBL65pRXkBF7Ig0gXoQa3e7bibo90J
	l9k72yIRpOvkmbccFkep7yjfAObEEWHA4XMEYP7ySr3aAuf8bcHpkL3ZOZ/hZaE8
	OEn6yRxj/j6+4+6zOYZNcwdNRxwF9hrC0HlXAmkeK3+oDPL5yRuiV1s1SBHXLV1v
	hDF85Y+I2SBmZS63vDiaA==
X-ME-Sender: <xms:-pT4aa6Im53zFJ_7UDPPVRk1yxjGRzuwf3Zo9CCFP5l358RfBXa5Yw>
    <xme:-pT4aXnH3rObNYUTDYJan_uqDsPf3ivtxf6A8CLJhjwJ-Wdnezdy7MOdymmmJTmGd
    kEqpr1WqWz7GlmULZZYBkz_FuyOWzSmiQP3l4l5rpUKIr_-PA>
X-ME-Received: <xmr:-pT4aTT_YNcNS90BIDvGOyCy4SYGWXTTHOntJxkNCglwEH8nhRRpsLR4ZwYZ8zR3rxuiaUMou0JjAdtUaNgRqO0szhBul01-0FR1J5MxN_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelkeekkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeuudeh
    gfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepiedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdr
    gigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrh
    efsegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
    dprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggs
    rdgtohhmpdhrtghpthhtoheprghnthhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvg
    gthh
X-ME-Proxy: <xmx:-pT4aeHQchlvh7J4mLVf4BDI9PGO74n66wLN1q4fsX4qyxigoG8fRw>
    <xmx:-pT4aQHlbhFfkFMfPBT6CAK7a8UPTuyD-OHzz93gHxcRpfC-b9RPaQ>
    <xmx:-pT4aUSGEpinw5D_-sg-m2RfRweqsn2pUzYWy6bHDYnx1PNerPaVUw>
    <xmx:-pT4aZK5PDFUs5_FryCos4nbHkXpHAlBCRMZ1LgdqzMmwrb9H2K-Lw>
    <xmx:-pT4aRoesoKHOOHxy9SfCXKFx16_7eVOes8iYd-cfWREnty2-CWiT6Sp>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v4 03/13] Add debian rootfs artifact
Date: Mon,  4 May 2026 14:35:42 +0200
Message-ID: <2247b496ddb5fa94fad000bc4be65c2b3fc89b00.1777898148.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
References: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1777898748-BC617FF4-CE8D8A4F/10/63158204843
X-purgate-type: spam
X-purgate-size: 4332
X-Rspamd-Queue-Id: A20594BD243
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:email,invisiblethingslab.com:dkim,invisiblethingslab.com:mid,messagingengine.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]

Will be used as dom0/domU in some tests.

Install systemd, but set it up to start scripts in /etc/local.d/ too, so
tests don't need different paths for Alpine and Debian.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
Changes in v4:
- disable persistent journal via config
Changes in v3:
- fix typo and missing dropbear args
Changes in v2:
- Use systemd
- update to trixie
- disable systemd-journal-catalog-update.service,
  systemd-modules-load.service and persistent journal to save boot time

---
---
 .gitlab-ci.yml                          |   7 ++-
 images/debian/13-x86_64-base.dockerfile |   4 +-
 scripts/debian-rootfs.sh                | 100 +++++++++++++++++++++++++-
 3 files changed, 111 insertions(+)
 create mode 100644 images/debian/13-x86_64-base.dockerfile
 create mode 100755 scripts/debian-rootfs.sh

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5281c1f..4147be5 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -71,6 +71,13 @@ alpine-3.23-x86_64-rootfs:
   variables:
     CONTAINER: alpine:3.23-x86_64-base
 
+debian-13-x86_64-rootfs:
+  extends: .x86_64-artifacts
+  script:
+    - ./scripts/debian-rootfs.sh
+  variables:
+    CONTAINER: debian:13-x86_64-base
+
 linux-6.6.56-x86_64:
   extends: .x86_64-artifacts
   script: ./scripts/build-linux.sh
diff --git a/images/debian/13-x86_64-base.dockerfile b/images/debian/13-x86_64-base.dockerfile
new file mode 100644
index 0000000..f98355f
--- /dev/null
+++ b/images/debian/13-x86_64-base.dockerfile
@@ -0,0 +1,4 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 debian:trixie-slim
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/scripts/debian-rootfs.sh b/scripts/debian-rootfs.sh
new file mode 100755
index 0000000..1da54a5
--- /dev/null
+++ b/scripts/debian-rootfs.sh
@@ -0,0 +1,100 @@
+#!/bin/bash
+
+set -eu
+
+WORKDIR="${PWD}"
+COPYDIR="${WORKDIR}/binaries"
+UNAME=$(uname -m)
+
+apt-get update
+
+PKGS=(
+    # System
+    bridge-utils
+    dropbear
+    udev
+    systemd-sysv
+    iproute2
+    inetutils-ping
+    util-linux
+    cpio
+
+    # Xen toolstack runtime deps
+    libbz2-1.0
+    libuuid1
+    liblzo2-2
+    liblzma5
+    libyajl2
+
+    # Xen Test Framework
+    python3
+
+    # QEMU
+    libglib2.0-0
+    libaio1t64
+    libpixman-1-0
+    )
+
+case $UNAME in
+    x86_64)
+        PKGS+=(
+            # System
+            pciutils
+
+            # QEMU
+            libelf1
+            )
+        ;;
+
+    aarch64)
+        PKGS+=(
+            # Xen
+            libfdt
+            )
+        ;;
+esac
+
+apt-get -y install "${PKGS[@]}"
+
+# Xen
+cd /
+# Minimal ramdisk environment in case of cpio output
+echo "ttyS0" >> /etc/securetty
+echo "hvc0" >> /etc/securetty
+echo "ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100" >> /etc/inittab
+echo "hvc0::respawn:/sbin/getty -L hvc0 115200 vt100" >> /etc/inittab
+echo "rc_verbose=yes" >> /etc/rc.conf
+echo "DROPBEAR_EXTRA_ARGS=\"-R\"" >> /etc/default/dropbear
+echo > /etc/modules
+# disable unneded services
+rm -f etc/systemd/system/timers.target.wants/apt-daily*.timer
+rm -f etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service
+rm -f usr/lib/systemd/system/sysinit.target.wants/systemd-journal-catalog-update.service
+rm -f usr/lib/systemd/system/sysinit.target.wants/systemd-modules-load.service
+# don't need persistent logging, avoid journal flush service
+mkdir -p etc/systemd/journald.conf.d
+cat >> etc/systemd/journald.conf.d/storage.conf <<EOF
+[Journal]
+Storage=volatile
+EOF
+# Tests install a startup script as /etc/local.d/xen.start
+cat > /etc/rc.local << EOF
+#!/bin/sh
+
+for f in /etc/local.d/*.start; do
+    \$f
+done
+EOF
+chmod +x /etc/rc.local
+passwd -d root
+
+# Create rootfs
+cd /
+{
+    PATHS="bin etc home init lib lib64 mnt opt root sbin srv tmp usr var"
+    find $PATHS -print0
+    echo -ne "dev\0proc\0run\0sys\0"
+} | cpio -0 -H newc -o | gzip > "${COPYDIR}/rootfs.cpio.gz"
+
+# Print the contents for the build log
+zcat "${COPYDIR}/rootfs.cpio.gz" | cpio -tv
-- 
git-series 0.9.1

