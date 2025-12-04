Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 143DDCA48B0
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 17:38:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178000.1502041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCLa-0001be-45; Thu, 04 Dec 2025 16:38:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178000.1502041; Thu, 04 Dec 2025 16:38:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCLa-0001Ya-0L; Thu, 04 Dec 2025 16:38:26 +0000
Received: by outflank-mailman (input) for mailman id 1178000;
 Thu, 04 Dec 2025 16:38:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ymfd=6K=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vRCLY-0008JO-Cd
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 16:38:24 +0000
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5b1822d-d12f-11f0-980a-7dc792cee155;
 Thu, 04 Dec 2025 17:38:22 +0100 (CET)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 060031400207;
 Thu,  4 Dec 2025 11:38:22 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Thu, 04 Dec 2025 11:38:22 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Dec 2025 11:38:20 -0500 (EST)
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
X-Inumbo-ID: a5b1822d-d12f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1764866302; x=1764952702; bh=mD2dRjf3Wv
	rGjyNzsPSZzat166qty54LXGSNonTfYHo=; b=cXX2kQMQrTMkwJtsrYDjSDdpdi
	epd3fB2xwL57nUyWjYPMpgTus6XbbpRA7C6WaTqFYdg0f0MgxAFzJyhEqniNSkEf
	E0JTF9+rSYzwQ54T418ZPRCDf31E3RKON6R/5hHMHKxpBX3Bfz6d+SBexx6yIir+
	ugXEvy9C6WchJuGHRyyMfecOrw407996oCNNc9ybP9fgtkqg0W0nxiCmz51hBlvH
	++kkdn01qgDUNV9r6GnBqpiTYWnDYdIDyx9HGOw1348nJou6LPY9Cay5etUjdEXh
	PQX1kO+LQb8ypCl+Ff4RlvDRido/aTjm6E9FrPo77ikmJVXe8MwhicFKQbhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764866302; x=
	1764952702; bh=mD2dRjf3WvrGjyNzsPSZzat166qty54LXGSNonTfYHo=; b=T
	Uxvfpm9Ktg6IoWuTvtMVPqEyT2pugBAd00BM9e8DGVed42tazD+8b9PB5aCdO/jF
	HskcdjxirdECulPnqzXPu3bsR93lh84bjYx3ZhDxNNE6oiwfXFgnJqIDYwaM2UdV
	wrXRhdydkr5BKJABdQHq8TozIuqpbXtJCkhr7cNXTAAAe7tO9eyheQZ29xCSGYAo
	035cWoIGDqxW5RYIt972FE5jeXYsA8FSf1+N4EwcCSBYWOG5NWlilthAEtUMHsI5
	fjp2kp1jNcwsGkMg9O0Qt0LoSdT2gLjqu4n7+XyNC8c3W0/FUE+UE+v+IseLe8Hx
	IKudroyZmPh3lu2pit9EA==
X-ME-Sender: <xms:_bgxaU4WkaORa_eBjK5GGffIuF6UCHtlqAw64zl6aOWSAPPHeFzA0Q>
    <xme:_bgxacx55U1wu2EV9ZW9HO9aui6Wz8i7TxA57_ApWSLy1enJ2xbIltsvFU7a0-zsq
    87_fuz-W7jczNfmeYLpip9ROfa7j-szmsyIw4TaM2tqRWUZFQ>
X-ME-Received: <xmr:_bgxaby2RCkQSAyVvOoNI1b-5rKF8f9wTszVzf4_4UWshVhhxHSf_fMlI4Lj6cDh3dzt4zJBOHhRv85QEYZJADni8-PHefbgwzVh3fMjkh0>
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
X-ME-Proxy: <xmx:_bgxaUzgX1Fmxg_aIQzI9umbrWjcZbJjNSWelJ3O-h_uKDFzeFbjfg>
    <xmx:_bgxaVaFfKxD0fHUItlc5U6p3RKElMJkmMFXstaIALwvz3qippWpIA>
    <xmx:_bgxaVVjFNQnwSMQ6oCE8yol75Cf2YSkgu27n3l0BR0iTwkpkehv9Q>
    <xmx:_bgxaTjxgTwH_zJddJAI85keDyxMVyCfBC45m9Gncp7H1p1WM5OqlA>
    <xmx:_rgxaYAZMWegMMt6QH2NhsjPNEX9t_ooXpVGw8BSaCa6ieEyIOuCmd5C>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 09/12] Add linux-stubdom dependencies
Date: Thu,  4 Dec 2025 17:37:30 +0100
Message-ID: <0bca999f88773b6b4ea2edabbdb5d1bfd4f1996a.1764866136.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
References: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 scripts/alpine-rootfs.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
index c9c0d43..e06e72b 100755
--- a/scripts/alpine-rootfs.sh
+++ b/scripts/alpine-rootfs.sh
@@ -39,6 +39,10 @@ case $UNAME in
 
             # QEMU
             libelf
+
+            # Stubdomain
+            grub-bios
+            libseccomp
             )
         if ! grep -q VERSION_ID=3.18 /etc/os-release; then
             # QEMU
-- 
git-series 0.9.1

