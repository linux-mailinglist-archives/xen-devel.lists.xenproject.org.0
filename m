Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C5564957D
	for <lists+xen-devel@lfdr.de>; Sun, 11 Dec 2022 19:01:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458963.716653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4QcU-0006K9-VM; Sun, 11 Dec 2022 18:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458963.716653; Sun, 11 Dec 2022 18:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4QcU-0006IC-SK; Sun, 11 Dec 2022 18:00:10 +0000
Received: by outflank-mailman (input) for mailman id 458963;
 Sun, 11 Dec 2022 18:00:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=97oD=4J=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1p4QcS-0006I3-OM
 for xen-devel@lists.xenproject.org; Sun, 11 Dec 2022 18:00:09 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a50482a0-797d-11ed-8fd2-01056ac49cbb;
 Sun, 11 Dec 2022 19:00:07 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 2D6215C00B1;
 Sun, 11 Dec 2022 13:00:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sun, 11 Dec 2022 13:00:06 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Dec 2022 13:00:04 -0500 (EST)
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
X-Inumbo-ID: a50482a0-797d-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1670781606; x=1670868006; bh=9/o//YpAd6bPNnp2ez44OcRIJkNkCRCgVpa
	pd+ho7Ao=; b=aB5HB6mUPJs2uf7aEqlH7AYmwLVBW/G8rBmRAhqsKIQAH38SEHM
	K0KC2ztPs2RxcWL3E4V0F6bJ/mJ6xIysLOJaIVnpvQ2HOqvCeM6Jlzo0ZWEYhddr
	KevfSWtTHya9NLy/Z7icTbODRS5ycft7xPEFJTHeZkVJAADGcY/Qxudgc/8z4b7F
	7rEjB/3Rypt8BNCwMJv2XJqYOVju1QxegkMHxzAezrzVG/W7A8N6cesbdvMNmaok
	rw1FzYsQNrPY5wRj2MFGTN5iUE0n32Ec5vObwWUCzLCXh7MZiHshbmhzdbbtTzHT
	T1oXFWtx3tEQ/MMk8jPcZLiPqd7Rljq6eHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1670781606; x=1670868006; bh=9/o//YpAd6bPN
	np2ez44OcRIJkNkCRCgVpapd+ho7Ao=; b=v/VJCdlO+J+u3+32D3XYQyf+sye62
	BSbsfDAelrSiTMK0Per6d9uwgIFwwGSUNfDzweOOeDhRjSAAgeANl+Kc5N2AwdYX
	gxzNE/6m3t954wwCX4N1lY2WEL8uEq90945CrcAHmFb0u9noDxMfziELc7zY9JKV
	/8q/EXDZytV6bewAJjdolMngFQNdX6k8Mf72GoOR/Jb4mqF5KpH1Q1z/j6SNl96G
	QbWrY3LNtagzhZi62fVjVmzK7YUAhaUNQL5arycUux4rszH91UcrftnYlchlbkt8
	NpVkHnm8/s8BWJefGL53MmfKFWGsiAg+AwIFDvL8Zt2xBpqA18mBg41Qg==
X-ME-Sender: <xms:pRqWYxz4cKfSLS1myd2cJetXNNJ4cKDBbEWSRS-Ewml4aIkUWpmwAA>
    <xme:pRqWYxToyBPlF1gf0C4eh9JnTt3Xw6KHUzIq9kYGD6NTWiOWI4191RgXjRhaV9vgd
    9kXqPxeLwVk8g>
X-ME-Received: <xmr:pRqWY7Ug3S4QMa5RWxlUQONdDYNQWjK-qjUV4KOqaqgeP6yLnSBgacuAF6Qh90xCLkR_bfJXAl_B29gYx30agmxg29skj4Bq2pf4Uq_KfI2_SYCkR6s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeigddutdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelkefh
    udelteelleelteetveeffeetffekteetjeehlefggeekleeghefhtdehvdenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:pRqWYzj3SAE9LiVEmPGNzdm9LThv7zxtLvu8mfz3NsbnOF_t-zS3uw>
    <xmx:pRqWYzBXEc6FHWJlCkINIs-zjZAGr1uXgm-7CKlh2EsHe1mCLhB74w>
    <xmx:pRqWY8Lb3dKbt6HhhX_rbY3N_rf-5obEEzrIcx2uRpXr0Egir5FCwg>
    <xmx:phqWY2MaHnxD6Gxp34hOy58sLZ6eOh8ljwJsHKzgBYFCigiC7egugw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] libxl: abort on memory allocation errors
Date: Sun, 11 Dec 2022 18:59:49 +0100
Message-Id: <20221211175949.2193629-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use abort() instead of just _exit() in libxl__alloc_failed(). This
is more friendly for debugging, as it will trap into debugger,
systemd-coredump will collect coredump/backtrace etc. It's much more
useful than just "libxl: FATAL ERROR: memory allocation failure (...)"
message without context where it actually failed.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 tools/libs/light/libxl_internal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_internal.c b/tools/libs/light/libxl_internal.c
index 86556b6113b0..c95624933ffc 100644
--- a/tools/libs/light/libxl_internal.c
+++ b/tools/libs/light/libxl_internal.c
@@ -36,7 +36,7 @@ void libxl__alloc_failed(libxl_ctx *ctx, const char *func,
     }
 
     fflush(stderr);
-    _exit(-1);
+    abort();
 #undef M_NSIZE
 #undef M_SIZE
 #undef M
-- 
2.37.3


