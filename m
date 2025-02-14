Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A7BA353B4
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 02:28:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888257.1297659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tikVT-0005e3-3q; Fri, 14 Feb 2025 01:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888257.1297659; Fri, 14 Feb 2025 01:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tikVT-0005cX-0p; Fri, 14 Feb 2025 01:28:39 +0000
Received: by outflank-mailman (input) for mailman id 888257;
 Fri, 14 Feb 2025 01:28:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kkdH=VF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tikVQ-0005Nw-R6
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 01:28:36 +0000
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00f53b3d-ea73-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 02:28:34 +0100 (CET)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfhigh.phl.internal (Postfix) with ESMTP id CA92011401EC;
 Thu, 13 Feb 2025 20:28:32 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-09.internal (MEProxy); Thu, 13 Feb 2025 20:28:32 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Feb 2025 20:28:31 -0500 (EST)
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
X-Inumbo-ID: 00f53b3d-ea73-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1739496512; x=1739582912; bh=qEM2A4la9R
	xFkprKX9G/QxR7b4Sa8TkAC496vEy+pno=; b=Xp9POxlKeHX0cgV7pNJPWg/U4v
	Sd6J2dv1RYM57gboEeUaJIO0VJLU1VnciLK8SpnRBQSMcC3O306cTAtbMjVuIWI5
	l3zNcrtTAMzrkgp+IGWf/GDQdVJwGyeXUVt4ee7/6KNuBOnWpoUzTB8Dg9zmNl0b
	7WIcCm1ZuGjzbfrhw7r4oyeSN7Vrm8kSixh/hdo4rTPYJNL1KK0JaSraVK5Ha/xi
	/qxq5Ddq2dUqZjn6hr3nPWpg5ccSo3rJ4A5w/mfigMQ/FOp9HLKFQJN1NofH8P6d
	JpJwcvhIPrGHe0ftNpxw+Wcuqex9Aqt6apiKsTDypWUz6yD3zWc8yG3R4ANg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739496512; x=
	1739582912; bh=qEM2A4la9RxFkprKX9G/QxR7b4Sa8TkAC496vEy+pno=; b=c
	12i4Rf/OV+Il/+fJWNLLizwNWOjmW8dRaEyXkPqZ6br5Ho2oA3miNoZVy64mgmIb
	SA2XRnb19TmzFDwQyTIn9sDdjfIZjsnYBRqckT4M1omsWFtXPM64ybFSXmrOc7QL
	GkRnQA0fmU73zTdsWIdFCAj6E8CYIuXFuS0CeYVuCVi7FZ4yfy/M3K0ox6kvg+Vi
	BlhPVvU+LTfGBLe8V17qdyKwzA0ykht6IZ3foKMCjYDMVSP1oBjojpZZ5G55v+Ud
	diPh7/wkwoBtKvzC0X2+Og/IdrjccszDkRbmSH6Eii5Gmhv+KfxwA6bOuqLNGAY9
	c6OY2g5kJIKd+R560RrPw==
X-ME-Sender: <xms:QJyuZ1utWEJmFTrlKcSqwuochf2RDQZ-HfTAzfghMLtjwEQNcNPZ4A>
    <xme:QJyuZ-etW-1y1b-UsSifjINki6oJ6jD8vJ-Ph-YZa0pOz3dTuT9RipUETfp3796ce
    jeI6PjKUbP1DQ>
X-ME-Received: <xmr:QJyuZ4ztmgjGwpZZKmWCB4xP7d0X1CFl1EqjNLu-r6U28f8w3Zd41WR0_Pg8gzid3akJfO06>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegkeeffecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfeuudehgfdvfeehhedujeehfeduveeugefhkefhheelgeevud
    etueeiudfggfffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgigv
    nhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoh
    epmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdprhgt
    phhtthhopehsthgvfhgrnhhordhsthgrsggvlhhlihhnihesrghmugdrtghomhdprhgtph
    htthhopegtrghrughovgestggrrhguohgvrdgtohhmpdhrtghpthhtohepshhsthgrsggv
    lhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:QJyuZ8NYVoVV4uQ5gRszl_YaJnb_Znj_07sI9StASGKk4dJ4ZABoMQ>
    <xmx:QJyuZ1_BioM5j1YEJI29D_107OJw8cok4IE2d5BXp3PPpd2hTKXNRA>
    <xmx:QJyuZ8VLStLFAE3tRieHglJLFzXgC1mX-O48pKKuwMA-IMpb4aB3Pg>
    <xmx:QJyuZ2fS7msP0CleVXqGve4sYED2AOILvIAzIFiOuKpNzI4VD_7mgQ>
    <xmx:QJyuZ4ne5LnoSCKpc7d64mru-J-0cdBJ6cLuYcUheucBQf_ERaON_6F7>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/4] automation: skip building domU if there is no test defined for it
Date: Fri, 14 Feb 2025 02:28:07 +0100
Message-ID: <1bcb6bea13c964df6119ae04502e0fee3c928052.1739496480.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <cover.36ee649a8537af1a5fb5b3c5b7ffc0d8a1369969.1739496480.git-series.marmarek@invisiblethingslab.com>
References: <cover.36ee649a8537af1a5fb5b3c5b7ffc0d8a1369969.1739496480.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This will be useful for later tests not using generic domU (unit tests,
xtf etc).

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Stefano Stabellini <stefano.stabellini@amd.com>
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

