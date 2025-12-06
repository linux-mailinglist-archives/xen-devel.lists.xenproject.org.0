Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCC4CA9F2D
	for <lists+xen-devel@lfdr.de>; Sat, 06 Dec 2025 03:49:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179692.1503191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRiMb-0007iT-Tp; Sat, 06 Dec 2025 02:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179692.1503191; Sat, 06 Dec 2025 02:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRiMb-0007bh-QJ; Sat, 06 Dec 2025 02:49:37 +0000
Received: by outflank-mailman (input) for mailman id 1179692;
 Sat, 06 Dec 2025 02:49:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JSAj=6M=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vRiMa-0007Zh-TQ
 for xen-devel@lists.xenproject.org; Sat, 06 Dec 2025 02:49:36 +0000
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32e9d38f-d24e-11f0-9d1b-b5c5bf9af7f9;
 Sat, 06 Dec 2025 03:49:36 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id CD6137A0161;
 Fri,  5 Dec 2025 21:49:34 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Fri, 05 Dec 2025 21:49:34 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Dec 2025 21:49:33 -0500 (EST)
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
X-Inumbo-ID: 32e9d38f-d24e-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1764989374; x=1765075774; bh=vJBT5K2eNg
	qcFcTpoaQhIeuJpfsyH1nWf1doE6FT5lA=; b=nmi30XLaefncKSHceVI9gFDtmQ
	v6PkhmeWH9pZPJXbaiUlouHvhfQz04Ozm2tTLuDb3kSTEWr0DBMPFagFrsJ39TDz
	/fZHNb/VgFtjUJQbbHbPqxuzwshPNyLfD2vue11dUShztjf7uVy+ISquIyxIrN9h
	G7TOOjOcTWAGUrbIotlOg+UmZ8wuQQ2eRyt6ZsYEbU95Qslebu2UMD7t6pdCZ245
	1MtN019zlEa4SN/d4Uv8ozME+OVRh9t7UKr8s4Wc7vCnVaPUy75M4gTKTTIo7PjF
	9yZ/pen3OSy1OXWp8dQRZEWcN4uqIab5y8jpJkYS482DfzUeXOj3p3YHViVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764989374; x=
	1765075774; bh=vJBT5K2eNgqcFcTpoaQhIeuJpfsyH1nWf1doE6FT5lA=; b=r
	V0zr1NzO5ylRM4loYcOGqSNzVCaX6ICAag5GUdrVyJ/fa+y3PFl+7JzHabHii4vd
	4Y+JgS+M7MVhP6vLJSFvBLKtaTJAnnPcYeJ6Q2yK72WJZ9dfiDazJzH2Knl+rhJX
	JxnObXCi6S1iYolyaq8Vk0UqkLoIr2f2ISq+DytWx0ENehZ1BaUg5EIWZavaHjYv
	2pywj8yGaxOk2TiSpQM2yCwugTLX1xOBFLFZyfQMSt7vzs31fHopO1DyduAReoUf
	QJiTDk875A/QBP9iVx8GIHppcMUbq6NcT5IgGLirr+VNrhYH+304p85cbCfWclgZ
	BQM+XDt5h5HCXaY22TP2Q==
X-ME-Sender: <xms:vpkzaS7A3hNmYg409D4lMbMe504J9zNej7lhKi9PbIlEhM1AuctkRQ>
    <xme:vpkzaSwOFsCE7Zxb1xhvC-zHPa2_ylzGpLVPOfq0CrcvyeATEdjwxoJiux-IUlKER
    _huvBNj9Ky81jkpACmWX3r7lt96upY9QRo3ZygtJ97qBwmkEj8>
X-ME-Received: <xmr:vpkzaZwjwnUskxHqPLCi8hxe9dXyMa3dMz34niicjFeglSCru8gRUDNY1mvRyGOCLjlh4Yfu2wvH8PYwDNSm3DUl580C9QEObv5gfrb7mgY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelkeduucetufdoteggodetrfdotf
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
    estghithhrihigrdgtohhmpdhrtghpthhtohepmhgrrhhmrghrvghksehinhhvihhsihgs
    lhgvthhhihhnghhslhgrsgdrtghomhdprhgtphhtthhopegtrghrughovgestggrrhguoh
    gvrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:vpkzaax7GDHBBqd_Z4pW1yjBokUlNzJ01Tdq-n6GDGBnmeLa1xlgkQ>
    <xmx:vpkzaTbtLkYcgzEO8jrlpBve268S1wWgrBajaQRQRX5wHMWmSXrekw>
    <xmx:vpkzabXd3ZA8qtJDRJJiXTLdlVPvxffCQb3Yif1QzmyLDwYmxMPl9A>
    <xmx:vpkzaRhMvbIBFmRQHh583LFGSAPRB4b6QtzVu6ED4w89bwCwrMD8rQ>
    <xmx:vpkzaeCsGXLGy6fyjGM77y71qsRK2m63aj6oa5bomQtJJTQIiVdcZkOD>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 5/6] CI: Add configure --enable-systemd for full build
Date: Sat,  6 Dec 2025 03:48:07 +0100
Message-ID: <1363a4377800fb2cbe8dbbbbc2b08d2af968a47e.1764989098.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.b56a66dfe4d98db2f1cc8b1fe0c2091d02cebe38.1764989098.git-series.marmarek@invisiblethingslab.com>
References: <cover.b56a66dfe4d98db2f1cc8b1fe0c2091d02cebe38.1764989098.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This doesn't exclude sysvinit scripts, but allows testing systemd too.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
--
Changes in v4:
- drop systemd-dev, add --enable-systemd always
Changes in v3:
- switch to trixie

New in v2.
---
 automation/scripts/build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/scripts/build b/automation/scripts/build
index 7a81d229decd..9485f37c7020 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -71,6 +71,7 @@ else
     # Full build.  Figure out our ./configure options
     cfgargs=("--prefix=/usr")
     cfgargs+=("--enable-docs")
+    cfgargs+=("--enable-systemd")
 
     # booleans for which compiler is in use
     cc_is_gcc="$($cc --version | grep -q gcc && echo "y" || :)"
-- 
git-series 0.9.1

