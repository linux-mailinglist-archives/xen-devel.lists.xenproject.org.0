Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7556DA334AC
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 02:28:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886996.1296581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiO1J-0002vt-IH; Thu, 13 Feb 2025 01:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886996.1296581; Thu, 13 Feb 2025 01:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiO1J-0002tX-Bz; Thu, 13 Feb 2025 01:28:01 +0000
Received: by outflank-mailman (input) for mailman id 886996;
 Thu, 13 Feb 2025 01:27:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZTDb=VE=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tiO1H-0002et-Av
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 01:27:59 +0000
Received: from fhigh-b5-smtp.messagingengine.com
 (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c09cc945-e9a9-11ef-a075-877d107080fb;
 Thu, 13 Feb 2025 02:27:57 +0100 (CET)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfhigh.stl.internal (Postfix) with ESMTP id D6A0A254022D;
 Wed, 12 Feb 2025 20:27:55 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-09.internal (MEProxy); Wed, 12 Feb 2025 20:27:55 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Feb 2025 20:27:54 -0500 (EST)
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
X-Inumbo-ID: c09cc945-e9a9-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1739410075; x=1739496475; bh=4H8q28RBwO
	0fsczKjYmAk0JYmP0oRIZ18QAagB4kiT4=; b=dcYhXqCJ56FQOFWGPPfiBh14i0
	nSgNBQDws1MNZE9r6PCShR6u9M1Vl+W6u1QHN8FRUW6YKJ6KDYKan8/V8d8/ggDn
	DZW0ljwYOiXNN53JrsVjosSFCZGVds+Zn7NqkRzMgqUEn2UY881C7suP5aiPcffm
	W9xrIzWVC57uIDTQ6LRa9C4AzsAxbQj0poiR1h8Pt3S9LsR5tFP2oZ8nA199ORPG
	aH2LILMU2nXBNSvg0vu2N687WlTdTZ/z95/dDrkz3KDhMqFStUd/Cx5LCesQBEdZ
	BcSAUoku4ccPoi6zzUeTvA7zJ+tv0W0It7lgYn4wcIQDgCdaltWVcEPgNXeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739410075; x=
	1739496475; bh=4H8q28RBwO0fsczKjYmAk0JYmP0oRIZ18QAagB4kiT4=; b=0
	1+/JjovSHQIFFr8ovqERoC5T3RkDmoW3Z5QyUUAR25rC+Izr+gIdinqISyK8osIe
	ip73OuioZNihHr3iizYYGK4ZAEkwFo4lSNdv4YVc2Ums/Ro622T5JcaN1ZP4au69
	6RPuTU8feiiqX/24v2S340W5NqjV8CgROVdXxuheG279KzDR6O794xi+l3bltqAr
	4h0R3LbA9dlHHikOyBiMrGUcSBZh0QqWsKP+GJK/0UMLSkvy9m5cl9konZqTtCvz
	sJ1gJdmrHCW3LN0sRYA7BjzNlpqiqp/v2Jirvoc68Rtp1vT5bRvrT/JuWv+TXDMc
	WGZvUOGxRlu6vZtKr8bRQ==
X-ME-Sender: <xms:m0qtZwuE0igDtuc51DvjFdXlySYZS7R1QWR0qKgx52xIRvyunM6dqw>
    <xme:m0qtZ9c2XhBzR8i-RYzFRq5RFSc04jLvWNT5Gs7-hOMKRpeAwe4-yKmPE98j1GiY1
    eEgj7EiaGmIIA>
X-ME-Received: <xmr:m0qtZ7zb9pSUZyXvXzii6wDoUFODLtW4M0G5a-Usq_qvkM1vSkDbB6-zOvWQXOaN1DhsvEpo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegheeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfeuudehgfdvfeehhedujeehfeduveeugefhkefhheelgeevud
    etueeiudfggfffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgigv
    nhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoh
    epmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdprhgt
    phhtthhopegtrghrughovgestggrrhguohgvrdgtohhmpdhrtghpthhtohepshhsthgrsg
    gvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:m0qtZzPjuRQNd9KLywpUq_azsejTO12J8RTI2BppCag_v_g-wBXP3Q>
    <xmx:m0qtZw9Tjb5v7WY1WSAVf70EeI0dKdbyhDaAkH0kfk6MjpKlz2NVsA>
    <xmx:m0qtZ7Vzhi9EPN2Vcr3JEt1q77fq38S3heM6ZuN4O-44dnubXFR1Ug>
    <xmx:m0qtZ5dzrRu8ykXASFHQ-CdZVdCUTFk2vU1WF7VQG-fz23h6PyVJIQ>
    <xmx:m0qtZ0Y-6x5fT8Q9u_XYrwFDb6Q1Uj5CuR3TXtKbVyPXuUcWqiP0lWrp>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 1/3] automation: skip building domU if there is no test defined for it
Date: Thu, 13 Feb 2025 02:23:54 +0100
Message-ID: <bcedc3d646e93a43525976fc4548a9c5e307b93a.1739409822.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <cover.068c7421003863de7fca1cbe6aed2af000f061a7.1739409822.git-series.marmarek@invisiblethingslab.com>
References: <cover.068c7421003863de7fca1cbe6aed2af000f061a7.1739409822.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This will be useful for later tests not using generic domU (unit tests,
xtf etc).

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/scripts/qubes-x86-64.sh | 50 +++++++++++++++++++------------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 8a0b7bfbc0d0..7eb3ce1bf703 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -144,26 +144,28 @@ disk = [ ]
 ${domU_extra_config}
 "
 
-# DomU
-mkdir -p rootfs
-cd rootfs
-# fakeroot is needed to preserve device nodes in rootless podman container
-fakeroot -s ../fakeroot-save tar xzf ../binaries/initrd.tar.gz
-mkdir proc
-mkdir run
-mkdir srv
-mkdir sys
-rm var/run
-echo "#!/bin/sh
+if [ -n "$domU_check" ]; then
+    # DomU
+    mkdir -p rootfs
+    cd rootfs
+    # fakeroot is needed to preserve device nodes in rootless podman container
+    fakeroot -s ../fakeroot-save tar xzf ../binaries/initrd.tar.gz
+    mkdir proc
+    mkdir run
+    mkdir srv
+    mkdir sys
+    rm var/run
+    echo "#!/bin/sh
 
 ${domU_check}
 " > etc/local.d/xen.start
-chmod +x etc/local.d/xen.start
-echo "rc_verbose=yes" >> etc/rc.conf
-sed -i -e 's/^Welcome/domU \0/' etc/issue
-find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
-cd ..
-rm -rf rootfs
+    chmod +x etc/local.d/xen.start
+    echo "rc_verbose=yes" >> etc/rc.conf
+    sed -i -e 's/^Welcome/domU \0/' etc/issue
+    find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
+    cd ..
+    rm -rf rootfs
+fi
 
 # DOM0 rootfs
 mkdir -p rootfs
@@ -188,11 +190,19 @@ ifconfig eth0 up
 ifconfig xenbr0 up
 ifconfig xenbr0 192.168.0.1
 
+" > etc/local.d/xen.start
+
+if [ -n "$domU_check" ]; then
+    echo "
 # get domU console content into test log
 tail -F /var/log/xen/console/guest-domU.log 2>/dev/null | sed -e \"s/^/(domU) /\" &
 xl create /etc/xen/domU.cfg
 ${dom0_check}
-" > etc/local.d/xen.start
+" >> etc/local.d/xen.start
+else
+    echo "${dom0_check}" >> etc/local.d/xen.start
+fi
+
 chmod +x etc/local.d/xen.start
 echo "$domU_config" > etc/xen/domU.cfg
 
@@ -201,7 +211,9 @@ echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
 echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
 mkdir -p var/log/xen/console
 cp ../binaries/bzImage boot/vmlinuz
-cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
+if [ -n "$domU_check" ]; then
+    cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
+fi
 find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
-- 
git-series 0.9.1

