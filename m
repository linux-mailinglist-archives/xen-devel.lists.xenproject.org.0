Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC376A3AFD7
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 03:58:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892317.1301346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkaHV-0003PH-Sb; Wed, 19 Feb 2025 02:57:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892317.1301346; Wed, 19 Feb 2025 02:57:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkaHV-0003NI-O5; Wed, 19 Feb 2025 02:57:49 +0000
Received: by outflank-mailman (input) for mailman id 892317;
 Wed, 19 Feb 2025 02:57:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rZvE=VK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tkaHU-00020f-FB
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 02:57:48 +0000
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 449a7079-ee6d-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 03:57:34 +0100 (CET)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfout.phl.internal (Postfix) with ESMTP id 12BE113809B6;
 Tue, 18 Feb 2025 21:57:34 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Tue, 18 Feb 2025 21:57:34 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Feb 2025 21:57:32 -0500 (EST)
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
X-Inumbo-ID: 449a7079-ee6d-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1739933854; x=1740020254; bh=qEM2A4la9R
	xFkprKX9G/QxR7b4Sa8TkAC496vEy+pno=; b=dUOKVpBY64vl5/4jsw9FPzAMRf
	7EUtsXMRSo7pW5rXxFmYb78KLyVFzqvxgsudeP5fS71JBb7DO7wulGUzW1LhJ27Y
	R3IC7uMKCWU4f0m874+8A5ZhLbUgOjKMPz1PNF4JJxSZ30/LcsaVe7hen20c2m9v
	xRl1DAb+L/QLdl9s7uNReQHLqNPya6davK5JyBaicd0ca2w9H3pVN5fx7gLEblTo
	/aaLa4Hl9KWW8zvfUj6DD1Ag1w8QlzqGIMXWSpyXrtD6dBGreACC26luy1UtmY6t
	6YahetMASzyN53JAqSnSGOWPD7PgGX9d/W6+DP04icC+bkjC6kIFnkKYiJUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739933854; x=
	1740020254; bh=qEM2A4la9RxFkprKX9G/QxR7b4Sa8TkAC496vEy+pno=; b=p
	fVfMe8zd6nzUdOhEgpVnWcfgndNT2r32ShhRBVz96ymvShOVTi1qw6VdeiGIZeG0
	vZUeb7a4B0iAG4LNNmVkC/ouYq6dD1iLAdIAIz4HZ/p33DGpIPA2qjFct4ay7kEa
	hyZL0ygVEiMCRPU6mWus3UznNFa/qSC7N3CIOyS5i09EBb38lfzeKJ99zQDgxfGW
	BBw6vgFpCJ1PSB4eXrqiO6ITXZnokJG2CD7ucFRfAJ8nK7+Rxo0g68JXSeQAn4Ju
	YZgDfbYzwVZSOOCINVQDb00k/cBlpg8QKz/YSWNv6vFExvz6ZPRm3EAN1se5j4YF
	YRvFjKfyvDfhMETO3UZlg==
X-ME-Sender: <xms:nUi1Z5_-cLCGzZUglGY-SH26aydXs5i3PkeC5Giame5n_I2YFDD3fA>
    <xme:nUi1Z9tfaYmBE_QJ44nZ_3ttYKlasQfi4cbcRx8EpQoOrx_DNYBvAN7OQegKF3uZb
    BrlU8Tg5pMsZw>
X-ME-Received: <xmr:nUi1Z3DqQG0ayWfe4K3Mji-z3TR4eD3Rcva8_n42N4w2YX1cGYPqg26xGyo7M0OGfeRHHxvz9ZPBQ1Plu_jI_sBS6aTk_nHOarE186FW3DqaxysZfXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeifedtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfeuudehgfdvfeehhedujeehfeduveeugefhkefhheelgeevud
    etueeiudfggfffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgigv
    nhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoh
    eprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehm
    rghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghpth
    htohepshhtvghfrghnohdrshhtrggsvghllhhinhhisegrmhgurdgtohhmpdhrtghpthht
    oheptggrrhguohgvsegtrghrughovgdrtghomhdprhgtphhtthhopehsshhtrggsvghllh
    hinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:nUi1Z9fdZ1upRaHSKbywYxGNmWWC-4ldsoZ77Bk1-mhs3-LE1Jgrsw>
    <xmx:nUi1Z-NiAG04O27IDCZr-SyO2taJqjKXg2-dg2KMF11IrJ3TnjxoiA>
    <xmx:nUi1Z_moLEZmGkbPCzwK2xMu6sVv5u_A1GTziXYpULbb39z5ibjAcw>
    <xmx:nUi1Z4s5_SY6zyvIYqXs-h4ErPuc8ySUtXWErL6-Wr-OC0flGovnWA>
    <xmx:nki1Z6BJJ1r92i3v-268JJ4lAqIl9jfRqW4NB14smVngwMqd_a_sn4VX>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 1/5] automation: skip building domU if there is no test defined for it
Date: Wed, 19 Feb 2025 03:56:51 +0100
Message-ID: <1bcb6bea13c964df6119ae04502e0fee3c928052.1739933790.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <cover.0fd3c8fb7cf6db337edfd5c5d6ea18bcc44bdef3.1739933790.git-series.marmarek@invisiblethingslab.com>
References: <cover.0fd3c8fb7cf6db337edfd5c5d6ea18bcc44bdef3.1739933790.git-series.marmarek@invisiblethingslab.com>
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

