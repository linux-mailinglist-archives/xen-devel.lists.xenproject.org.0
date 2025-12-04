Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6A4CA4912
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 17:41:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178076.1502061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCOc-0005bk-Op; Thu, 04 Dec 2025 16:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178076.1502061; Thu, 04 Dec 2025 16:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCOc-0005YL-L5; Thu, 04 Dec 2025 16:41:34 +0000
Received: by outflank-mailman (input) for mailman id 1178076;
 Thu, 04 Dec 2025 16:41:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ymfd=6K=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vRCME-0008JO-5X
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 16:39:06 +0000
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be937b87-d12f-11f0-980a-7dc792cee155;
 Thu, 04 Dec 2025 17:39:04 +0100 (CET)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfout.phl.internal (Postfix) with ESMTP id C6570EC05A9;
 Thu,  4 Dec 2025 11:39:03 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Thu, 04 Dec 2025 11:39:03 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Dec 2025 11:39:02 -0500 (EST)
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
X-Inumbo-ID: be937b87-d12f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1764866343; x=1764952743; bh=fc2RrMT47D
	rD+n9gHG+/vQrT+WQOaN5fCNWOga27JQE=; b=WjoXnxtySQNrjxxt05oW14enUK
	c7kEm5UjJ8nHodDEovt2whqLdtEX8BvwAWbYi55wqSCCbzsVj1Y635BUmhVLb7AU
	V8oJ8tgu5Z9qwAmJo0OMnBK54f7QTNlBmNWsKvdDlr93/TmmWTrJO7pliDIL2S0+
	gJ/OqWfVeDQhIcld90gfVt0ZoK2zpBYMT6pOyVfX1luX5OgtTuybyZ5ueIX1C0NO
	c5Ptox4h4Ajp0pBilxJhQElS6UMGwvvkJ0u/IwvzC8d8OcQR6Xm5itXCPFLI/Xyq
	gCYSCxn5y7bo3IoQfKpobsHV3XZcSqMf8dSkSFkwHGZ8uk9MRx3s1zZU2+8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764866343; x=
	1764952743; bh=fc2RrMT47DrD+n9gHG+/vQrT+WQOaN5fCNWOga27JQE=; b=w
	ThBCJWkVjzt3dS5Oh7+/cXeiXrJWqfVKfCd7aOKdGhO0UKsHe3yxkAZ6R+CxECcY
	bIztHtADFAeISDfcKNnjf4jJGVr3j+J26tg7wTEs7j+Mks95jGEdMvk143Sd94BD
	jU3rF3fioZUdaZw+EvLJx2t0adtjYHAC5/clXw5P7gWW1fwmTa3vhICcvFQn4KFs
	1GnZpICDkxFVqjw5YTTU06V7x5KqHZLt1njCWnhOWNbvWcHmH6FhSV4BE6cjuBy9
	L7WGKP/PatmNqOKcNGQLBJJSBplRKTR18lRjULpyV/rVgUbyh43aSY2FzY+xkBiP
	TCO4ZYJ+SqyCdTA6BxgMw==
X-ME-Sender: <xms:J7kxaUZ08zTN14xgpX4JFavd3L6Qzk-aV4qRgqlaf21Wn4qeQ9tBOg>
    <xme:J7kxaWRM1EU3WKE5YDSoZmudRnOFSBUR8WcnAlSrKwvu2LTq_Z0mRJVOfwtxP0Tnk
    hldKPfQKZrrNhjWAsFtWu82jxgqIajVoMJT5GmLd38hmkb9>
X-ME-Received: <xmr:J7kxaXTxSD_Z9UZBOsKSEPkcilg3hW2HPNORXA2M7ZVG0oHDO6esXVoYxOT0riSlYhmK7g12ciN5rHKjJFzXGy-Onfv9mGvgLM2s7-ofr_Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeitdejucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:J7kxaaQwji8GfRpCs3VL-A1VAwjZiuW3DOHM1oY_wacmkoAbXvC0QA>
    <xmx:J7kxac7Kg0P6_ES9pr9oTA8VnIc7WiNvFAym2FBg3JoMYVUm1P-lHg>
    <xmx:J7kxaW3HNsX4Kl8BUJPi1-DJFcRtEHpqbu-dPBwkOwU26wg4cPwjIg>
    <xmx:J7kxaXAfNOSzZoVvZ1OelhuCDrlhoUu4HHorTGpBuarazrjLmHqqLQ>
    <xmx:J7kxacRZ4Okt76Y_J0Mh8czgzey3i3QfFIDO7O15mg1SAlhY8RprVr0s>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 11/12] Prepare grub for booting x86_64 HVM domU from a cdrom
Date: Thu,  4 Dec 2025 17:38:48 +0100
Message-ID: <194d96e98604de85e75428ad5b0fc91a13bf1bb2.1764866136.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
References: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The stubdomain test will use it.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 scripts/alpine-rootfs.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
index 7d0e70d..5945657 100755
--- a/scripts/alpine-rootfs.sh
+++ b/scripts/alpine-rootfs.sh
@@ -99,6 +99,9 @@ if [ "$UNAME" = "x86_64" ]; then
     grub-mkimage -o ${COPYDIR}/grub-core.img \
         -O i386-pc -p '(hd0,msdos1)/boot/grub2' \
         boot part_msdos ext2 linux biosdisk configfile normal
+    grub-mkimage -o ${COPYDIR}/grub-core-eltorito.img \
+        -O i386-pc-eltorito -p '(cd)/boot/grub2' \
+        boot part_msdos ext2 linux biosdisk configfile normal iso9660
 fi
 
 # Print the contents for the build log
-- 
git-series 0.9.1

