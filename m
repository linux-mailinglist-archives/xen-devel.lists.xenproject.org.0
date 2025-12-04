Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB9ACA4951
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 17:46:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178108.1502071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCTH-0006cM-8d; Thu, 04 Dec 2025 16:46:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178108.1502071; Thu, 04 Dec 2025 16:46:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCTH-0006at-56; Thu, 04 Dec 2025 16:46:23 +0000
Received: by outflank-mailman (input) for mailman id 1178108;
 Thu, 04 Dec 2025 16:46:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ymfd=6K=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vRCMB-0008JN-PU
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 16:39:03 +0000
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdc8de33-d12f-11f0-9d1a-b5c5bf9af7f9;
 Thu, 04 Dec 2025 17:39:03 +0100 (CET)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id 6AA8FEC05A6;
 Thu,  4 Dec 2025 11:39:02 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Thu, 04 Dec 2025 11:39:02 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Dec 2025 11:39:01 -0500 (EST)
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
X-Inumbo-ID: bdc8de33-d12f-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1764866342; x=1764952742; bh=dT2lw6HtLt
	QeJ5MhpVe/EmYio6/lL6n79y37dwNMdvs=; b=KfcvIhV6mZhCaPu2rkjY/rtaTd
	suRWdYlw970D8DTz7LH+3j+WrLZCEXehNg+h5Q2XV3pfmyskZF0CLoZAcZ7rThxi
	IARYKCaxi6AZhYyKTDUdCs3tmDri1OwfBEAUzmzKghAlWDHc/XaTCLQ6Ur6W8DPG
	TYSNut4xVJRkyCLiQfSC0u9YLQRF4KbZ6obyMv4584+FxTLZwqxgV4gsEpAd3m8s
	QOMiof2/y9Svj1WeDmofr+i4tFhNqWOLrL2adKqCtKUAIXtxYdUuV9r5dzthvsj4
	aoe8BwpNR3WV+2X19IAlQGEpAOmlYSlSMh3VACQxWr5Z02gWYAcw6418Mf+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764866342; x=
	1764952742; bh=dT2lw6HtLtQeJ5MhpVe/EmYio6/lL6n79y37dwNMdvs=; b=Q
	BKX6UUJ0fqLEg6GvbrAAHIiQgylJf2sqYyddmaw49hMU49HoRx9HiOGIeTvsLhnU
	710FWJjwarUjRGAPkznaoe/m0WgN0LufAmJYmtfIdpgTN4l7Uff8QHno1WwwUzkg
	M67WIw/UIjJJxuaTdFDM7wZyObtQED4trH7iRvtSnq+A7PwkTzDntSw60peY6Hsw
	jv3NFBRaI0Ms5NelTwW233QPY3HssicmnFGQufjrNFZhRWRGjL1V3RVVuTShJi7y
	vbDTkRQphNRtufbe41radWPS8zDnW65m9zuF64u56wrCCXZrRMCeXv5Zlyp2cD9I
	1dTtGilKN/Ouj1mpsYzHA==
X-ME-Sender: <xms:JrkxaVUAS-J83IeKilKODFjnExYXpFeSjX0joZHm5ElJemUpDMTMiw>
    <xme:JrkxacdoxNtFcUL6GUNoahyAfJdLXDi0qTQNVGg2HHaqSYQJY999Bh5P75AEQkkiq
    c_pG-sN6DzZJWq0YVpATQTTyAiPoSpMF3j7isZrGb-Rbz-knA>
X-ME-Received: <xmr:JrkxaZv5SdX8WggcH-QGWnbwCBQ0MM48xSAbff6J42Y3czgTiedL5RjutZu-f3mtju4mXethKKQr9McbVaJ3MLzHnxQri8rWJkSCH690YSs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeitdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgueduhefg
    vdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdig
    vghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfe
    estghithhrihigrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpd
    hrtghpthhtohepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdr
    tghomh
X-ME-Proxy: <xmx:JrkxaT-zRVFotQYQTDbC3KDTHZ5sxm9YKxOV-0sY3dM7G-QfPSmBaw>
    <xmx:Jrkxac2o4U7DJ8LGHbCJu0pOZ6XqkipTUFVgTT1bEBUqTOQQ-hdrZQ>
    <xmx:JrkxaQBntbrQKq7cX9uusm26khn8P7n1ZZ3xIfqHRC6WRoC_UbA12Q>
    <xmx:JrkxaQcjAMSVZhtGsd4cFVI8T02EbCAJNho0fR_XlS6sHueSwuLeig>
    <xmx:JrkxaTP6rWD7uKfM8iCBKf7U1N4IhwMomq87s9fN41NSqhmXf1xSNvpk>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 10/12] Prepare grub for booting x86_64 HVM domU from a disk
Date: Thu,  4 Dec 2025 17:38:47 +0100
Message-ID: <18bbbbcc6cc0642c02b90a43d8a318a6f6193079.1764866136.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
References: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The stubdomain test will use it

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 scripts/alpine-rootfs.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
index e06e72b..7d0e70d 100755
--- a/scripts/alpine-rootfs.sh
+++ b/scripts/alpine-rootfs.sh
@@ -94,5 +94,12 @@ cd /
     echo -ne "dev\0proc\0run\0sys\0"
 } | cpio -0 -R 0:0 -H newc -o | gzip > "${COPYDIR}/rootfs.cpio.gz"
 
+if [ "$UNAME" = "x86_64" ]; then
+    # Prepare boot sector for HVM disk
+    grub-mkimage -o ${COPYDIR}/grub-core.img \
+        -O i386-pc -p '(hd0,msdos1)/boot/grub2' \
+        boot part_msdos ext2 linux biosdisk configfile normal
+fi
+
 # Print the contents for the build log
 zcat "${COPYDIR}/rootfs.cpio.gz" | cpio -tv
-- 
git-series 0.9.1

