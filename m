Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBFDCA48BE
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 17:38:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177999.1502031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCLX-0001JX-SB; Thu, 04 Dec 2025 16:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177999.1502031; Thu, 04 Dec 2025 16:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCLX-0001H5-Np; Thu, 04 Dec 2025 16:38:23 +0000
Received: by outflank-mailman (input) for mailman id 1177999;
 Thu, 04 Dec 2025 16:38:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ymfd=6K=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vRCLW-0008JN-2Z
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 16:38:22 +0000
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4edb181-d12f-11f0-9d1a-b5c5bf9af7f9;
 Thu, 04 Dec 2025 17:38:21 +0100 (CET)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfhigh.phl.internal (Postfix) with ESMTP id BDB80140021A;
 Thu,  4 Dec 2025 11:38:20 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Thu, 04 Dec 2025 11:38:20 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Dec 2025 11:38:19 -0500 (EST)
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
X-Inumbo-ID: a4edb181-d12f-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1764866300; x=1764952700; bh=Ir52XP2MKM
	HnfS8eoCOGHQAwNpqRJiIg6tJc3k38V5c=; b=P2n/pRnwoMBNJrzxuf6nC8Os1V
	JI/76k6g0gW1T0xULptAu3lINUOjj1PjboBwVKexCxiX8hZLh4pJAy4REGTCKesq
	tpywe8/OamJsnLFhtmd7ywVI5GnePq/dwhiuVhZd8+xS0/ub4yJ9fSkWjquOGp+Q
	LUR8o+4kuWYT75Sh4e/TkIXXzJXMZA0gCHIolzd1rOYmuABwhpxj7YvvWJSwmFqP
	4XPHpPBUJIiN0C3sBtNavFa0uuDbKasZZanixYoo10Inv8EfSzvBLPKjjba2MhDn
	NoRwsEWVcTF8dA1bIT21gx52XlUDSFdLEcgFWJu9QPSzMDunyLBH22R50pWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764866300; x=
	1764952700; bh=Ir52XP2MKMHnfS8eoCOGHQAwNpqRJiIg6tJc3k38V5c=; b=j
	4CGptC3nUTpWTK6UH94WzU+8JLpz8/yJ8NL9q5S9QMvC9t6Y0rQBC1TxmKUBommk
	BhSgeWZCgc4MBsQUoy6BUt7vWUB606fqaCOjXPl3uDOBEGmVNjf5hIO8pFBKs9a3
	pS2WqbaAVz4ZLLKoRi4sU9Ll3GaTYIvUHGEaBNNA1nqBYIixxdpNP9Yih3RU9mwD
	BlPQ6CwKXMbrSTuJf24vEAfqwtHKavWgQGwvt6yxzXy8RpRkwxFsSQNuFRrMnVks
	fx/Mvnzdqk2YlM82qCUbRCFflZ59kgpB+022qVnmegnpI2qZlPkSlTVDtAAAXbui
	IVB/3wBaSLQTA2X3Pus8g==
X-ME-Sender: <xms:_LgxaTp9C6svt_9uPA9_Q36vJgzj9TaOeW6CHC64rDk1McpWN2Poow>
    <xme:_LgxaUhUC__TXinhlwgXxSG49rySMcNQldNH-yqvq5cyfbnOcxWQRH0GxDkXDdkhq
    wXmKpUFfAwfSVPApy4QfWXwMTkwy4tPGFs3GuLDHZz_7Zp-E3k>
X-ME-Received: <xmr:_LgxaYgl_oo6gU2VzR1FafN_hLpA31a1IcsgJPydCtWcJm4IjLdXSNt27-PWiJ2Vt32pvGzyHeJ_qKEuLPcfv1tsHiz_7Dwy2PVlaHhAKao>
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
X-ME-Proxy: <xmx:_LgxaShV75IcBaQAPAAL02BanDR4475zoFXNcin5h4Kxw5dN6uXK-A>
    <xmx:_LgxaQLvXvzQYverxjR6pMRKn1uxTpsPMovJTBB95RVSDrGC637vpw>
    <xmx:_LgxaZHp-9QeWEOHZKS3OFTJrYHNT5M0Bu7PMoZDACkdD_1eOMbd0w>
    <xmx:_LgxacQAAGnShAqKwpcmWt9cGiM2ELsZxKR79IT70A3adN99ytnW1g>
    <xmx:_LgxaVy5dLQMzCgzXA2f52Z9RvHzj_ILs5LudbsZktV3tlUnKifySUpe>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 08/12] Save Linux config to artifacts too
Date: Thu,  4 Dec 2025 17:37:29 +0100
Message-ID: <7c4a97691fb1c2fb88e169205ee768773bbf0603.1764866136.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
References: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 scripts/build-linux.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/build-linux.sh b/scripts/build-linux.sh
index 1fc96d1..80cc8a5 100755
--- a/scripts/build-linux.sh
+++ b/scripts/build-linux.sh
@@ -50,6 +50,8 @@ esac
 
 make olddefconfig
 
+cp .config "${COPYDIR}/linux.config"
+
 case $UNAME in
     x86_64)
         make -j$(nproc) bzImage
-- 
git-series 0.9.1

