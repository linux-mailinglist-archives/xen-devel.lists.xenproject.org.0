Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9971CA7A198
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 13:07:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936476.1337731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0IPQ-0005i7-3J; Thu, 03 Apr 2025 11:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936476.1337731; Thu, 03 Apr 2025 11:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0IPP-0005Zj-Oh; Thu, 03 Apr 2025 11:06:55 +0000
Received: by outflank-mailman (input) for mailman id 936476;
 Thu, 03 Apr 2025 11:06:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X4pi=WV=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u0IPO-0005Qy-7i
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 11:06:54 +0000
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbec5d1a-107b-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 13:06:48 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 993EB1140298;
 Thu,  3 Apr 2025 07:06:46 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Thu, 03 Apr 2025 07:06:46 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Apr 2025 07:06:45 -0400 (EDT)
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
X-Inumbo-ID: bbec5d1a-107b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1743678406; x=1743764806; bh=9bkD07TJxB
	+lkrp/+szfLVpVnbr3Myx9P/iU4VGbZ8o=; b=PE4LxbUMkdvoUkp/29DOrAmaCk
	Zf/9PRgRF4cqOMLKQZedLvWbeFUU0TDD7ViKcYdCkyEfD5i/EPQTK0uTdyOX6rqS
	D4pFueJaVfQBwqukq23cA/G35VuUzDcdMxKcEkfIVnw5CG/zMxkHfAmxYJsK8pob
	LPSiGEgtE3r+8YXM4nnm1MkrsFACPJ4FNxLJ5q2ZJKcYcTjS7+xNuwOjHW6XgnGX
	jEia2WXXmuUQus9ET61prStyeUT0DDjT2PxM2J8O+GWSdmkXVykJzopX4cqCnfL6
	hrsNanhZLcWSuvm4pGuQN5Ej4Q79nfgmt4n8m+4dQDP6czPU5ZZKNeeKPrfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743678406; x=
	1743764806; bh=9bkD07TJxB+lkrp/+szfLVpVnbr3Myx9P/iU4VGbZ8o=; b=i
	vrun5sL1047s/6u3hdiTXOz5OMfoBUd8G2oQ6u/ljYAIPCOKCr/L0hRoZFLK/hiE
	tR/HheNWYX/TIihlmtmAHfTVmrWrpMdUnOgsCwOhc6Q5atwVEcIG069bFYji+I/v
	LUaiovxi4MLsPNUEvb2hedxxsC78lJhfZcEXd4Dztc68Rn18GEqTmnTQN7lndFc/
	/A+nBYWCxxk0DQ5XIm9HExxww9RqB4hydG1Vmzve/hY6/Wi87gbRs19xGpRGtH0a
	YoQ0OFsZhsEP8fUGpB7gQ66TVq1dj2WLW4K2ELallgwnZvqjagg0qiw9T226Nhvg
	F+cW1kspWiC5zcJgws8sQ==
X-ME-Sender: <xms:xmvuZwk-PpkoPqSJ4V6ayL5HeVixV-gesSuxoaXuP4VvmvtACWlCeg>
    <xme:xmvuZ_2bfnHrw-Xp_PTcDyArmVFHh05wJdJQ4duERQt5Mem4WhW3h551Te_o5-NAe
    jGPwik8Bg1XvA>
X-ME-Received: <xmr:xmvuZ-oQqj2L5hinYsDL2QNsK_QdQIAl_b_wiQCfQE7jwct4PDNpRYxEmJ7OeSMOioaq7SptjOjMfG0Wz7ZOFFOVhC2TgUbUTnGw55sWqUTBlXq5B2I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekgedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkih
    cuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeen
    ucggtffrrghtthgvrhhnpefgueduhefgvdefheehudejheefudevueeghfekhfehleegve
    duteeuiedugffgffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeig
    vghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtth
    hopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohep
    mhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdprhgtph
    htthhopegtrghrughovgestggrrhguohgvrdgtohhmpdhrtghpthhtohepshhsthgrsggv
    lhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:xmvuZ8nbNtVoAT3hKOVxTca6TUPnniucsG1JMMLlaHsrEcNHGnaXFw>
    <xmx:xmvuZ-3uYTmMEEVkYLKIVSz2I37H5yN399p435CcWc8hoHIt3gHT2w>
    <xmx:xmvuZztFvrSvC15kFPnUGC5XQyPvg_onr93JRM4CG78noGBFHRKnsA>
    <xmx:xmvuZ6UNOFajd3jOAv6c32q6EjluanI7W7B8dsuXs6ZWOSFmAqOW7g>
    <xmx:xmvuZ8e-HhNGtSG4GXz3YI2ZyvTpBkhq3xlve2dWAA5ybLTvThtLp7U4>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 01/11] ci: prevent grub unpacking initramfs
Date: Thu,  3 Apr 2025 13:04:36 +0200
Message-ID: <e1d07b26a92a45ed387594dd789453def1ef1eb2.1743678257.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
References: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It fails on larger initramfs (~250MB one) and sometimes even smaller
depending on memory size/memory map, let Linux do it.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/scripts/qubes-x86-64.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index f27296445901..8e78b7984e98 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -248,7 +248,7 @@ CONTROLLER=control@thor.testnet
 echo "
 multiboot2 (http)/gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot $extra_xen_opts
 module2 (http)/gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen
-module2 (http)/gitlab-ci/initrd-dom0
+module2 --nounzip (http)/gitlab-ci/initrd-dom0
 " > $TFTP/grub.cfg
 
 echo "#!ipxe
-- 
git-series 0.9.1

