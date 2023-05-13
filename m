Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8CA7013E3
	for <lists+xen-devel@lfdr.de>; Sat, 13 May 2023 04:13:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534122.831413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxel5-0003HB-NJ; Sat, 13 May 2023 02:13:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534122.831413; Sat, 13 May 2023 02:13:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxel5-0003DN-Jc; Sat, 13 May 2023 02:13:19 +0000
Received: by outflank-mailman (input) for mailman id 534122;
 Sat, 13 May 2023 02:13:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cp9A=BC=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pxel3-0002fe-Oj
 for xen-devel@lists.xenproject.org; Sat, 13 May 2023 02:13:17 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5852979-f133-11ed-b229-6b7b168915f2;
 Sat, 13 May 2023 04:13:15 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 819205C023B;
 Fri, 12 May 2023 22:13:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 12 May 2023 22:13:10 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 May 2023 22:13:09 -0400 (EDT)
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
X-Inumbo-ID: b5852979-f133-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1683943990; x=1684030390; bh=Gi
	NsMeX+zewnzsWVeGVX0jm6GR36XVArwG8BgmM3BnY=; b=lpVHpz6lJzix7sHvDl
	pxFM8lhTF32KT/IQdzFFbEt8WDad2Fh1jV05CuW7sNeLVK0kYCf17yRjd4i+V/ID
	70AQQKsNPc3nzesy9TUt186fxhwWstlhzujnYL7cBkhG+o/3fKthL5Dz1ZCcxn2h
	wh2eXnlaUKAksi86HJvEUCF/6LOr3XUWxcJmTJA3AVZLJWscZbNf0xej3Kz6JN+a
	Ub0moDYNW+/LmdhF0SGAu/Asg9zsRr3gnZiY2WTC476cXt7q/qWPANITMhNSeL+C
	0HrRwOl9snaAzE9qxBJVDrEocZNLzxe1nvdKZIEtXVQ0xtxMtpDRc3wg88ffdTX8
	xJWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1683943990; x=1684030390; bh=GiNsMeX+zewnzsWVeGVX0jm6GR36XVArwG8
	BgmM3BnY=; b=Bzh0cg6liXki1XVf5GDnlHHOMudOggd+GR0IHG7rPBDzv4jlyZ9
	dhlNtcdq/AG23vcbCLbQ03jl3YSQKQ7jFXSVWiMueKc19+O+6vhfpK7FavwHt+76
	zRLp3uW6EDTTWTj36XSEgwem/B9qwc521QEH9372eeXac4dpMSyRqwQU7g/BRYJi
	miTYPcex5CNP14tMgreIyRKamsh99mphA9sGHOiHmu8P2Jupry2iO0UthDiaI8cN
	h2uWp/KQO+XDZY/QeKLFxnWNOm9qJQ05K6a9uPaFtNaI3wyIgp5wAlblJhYv+m+p
	36/tTWonYBRJLuFTOGFtZaRSq0k4tRtTWrw==
X-ME-Sender: <xms:NvJeZJN9cNvicmVEiNp4mdRPys920qpiqOG6U5fD9GeGxk3zpHZ6Mw>
    <xme:NvJeZL-lMQXGiqlDEsVBkmUpWYF6VvPoWo1opULr6IUlCDiICiQnCjjDINIF-j08M
    h7sj4XwlwtEEA>
X-ME-Received: <xmr:NvJeZISEgTZZ7G3slpGexG-Sos97aog4486PxDjEvfzP07UIQq2t-cTFNRHkU3GdsBI_dbB8KUbNStFB1biiqD5rPuz9b13NH17vmbUzFISv-1t8PS3l>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehuddgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:NvJeZFtwx3gRlSj2E_cRys3AA96i4qNN0qByb1c4g6MM-BuNbOxeng>
    <xmx:NvJeZBddBFY853gATdwflFCqOApGDp4zfJ-xzsFmP4dnykTSIYt3RA>
    <xmx:NvJeZB3pmM9KuwcVeQB7kNO9CVYfin7_pB4ozmOf8b7TrDz3PCfeoA>
    <xmx:NvJeZBEM_E07lwNIuIdibg5oahmiWK7yNWNT7fc3Mu-9E0_H6CcrKw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/4] automation: enable earlyprintk=xen for both dom0 and domU in hw tests
Date: Sat, 13 May 2023 04:12:45 +0200
Message-Id: <7247aca99f5faf35ff1c6efd048a10c08883bc41.1683943670.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.83768735557180cd65fb5f932c285271063e04ac.1683943670.git-series.marmarek@invisiblethingslab.com>
References: <cover.83768735557180cd65fb5f932c285271063e04ac.1683943670.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make debugging early boot failures easier based on just CI logs.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/scripts/qubes-x86-64.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index ae766395d184..bd09451d7d28 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -80,7 +80,7 @@ type = "'${test_variant#pci-}'"
 name = "domU"
 kernel = "/boot/vmlinuz"
 ramdisk = "/boot/initrd-domU"
-extra = "root=/dev/ram0 console=hvc0"
+extra = "root=/dev/ram0 console=hvc0 earlyprintk=xen"
 memory = 512
 vif = [ ]
 disk = [ ]
@@ -186,7 +186,7 @@ CONTROLLER=control@thor.testnet
 
 echo "
 multiboot2 (http)/gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G
-module2 (http)/gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0
+module2 (http)/gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen
 module2 (http)/gitlab-ci/initrd-dom0
 " > $TFTP/grub.cfg
 
-- 
git-series 0.9.1

