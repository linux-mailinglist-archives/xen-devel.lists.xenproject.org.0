Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E600A076F4
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 14:16:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868359.1279880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVsNp-0002X2-RT; Thu, 09 Jan 2025 13:15:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868359.1279880; Thu, 09 Jan 2025 13:15:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVsNp-0002V0-OI; Thu, 09 Jan 2025 13:15:33 +0000
Received: by outflank-mailman (input) for mailman id 868359;
 Thu, 09 Jan 2025 13:15:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eYg4=UB=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tVsNo-0002Uu-B2
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 13:15:32 +0000
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc176354-ce8b-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 14:15:30 +0100 (CET)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id C089313803AD;
 Thu,  9 Jan 2025 08:15:28 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Thu, 09 Jan 2025 08:15:28 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Jan 2025 08:15:27 -0500 (EST)
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
X-Inumbo-ID: cc176354-ce8b-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1736428528; x=1736514928; bh=m2abBxRo9SxXbM+8hKw6HSWO7tQK6uGC
	f+3A+K3+Z/w=; b=qpIny3qBOTky6gnYuyXNGQSpVicu6rXc1uqTzZ2ghg09WLXe
	SnXiZoYh5I1/ILNuR/4MD+2oyYvIFNVNhrZMOVRz18FGnNP18bT9UG7LmXJyr3wW
	jVHpQpMUktP8Hhk96l4qBoq0TBDwJBaOKQdtGLChaPapGBHQUMJQsHNsSinrJN/Y
	48WdrrI6lAtmzIufohr6mRbSCAqcjijHrd1V+TFmXlDa82Wc394h6yoDcFO+yiFZ
	h3fZI9kvXnNiAZoQoWoGNH2UnCeKwRZWu7hCTrZ6QTnt0VrmOQBKHdvfstDRck8z
	ua0N6qvODYB12+HtR9CIZu0WmLFDayGd5VKK9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1736428528; x=1736514928; bh=m2abBxRo9SxXbM+8hKw6HSWO7tQK
	6uGCf+3A+K3+Z/w=; b=n7W22jrHcplfqZIHK4BXpBGI232DM49ZVj8qWxe2Z6Yp
	9fHmGzUWDeh0AQIwovHQaGH5sFuv2eJi35mzUecO0jZi7CYTvj9vB5gA6tt7thcO
	oW0zlcydrFrWvFnW4+wffxGnlTvdkYeAIJNe0+mkkPmWdgaokGPS5ylm2cN10PWx
	/NzRkLogsGVCuR2y+R7hE5oHNg3BaABy6XRe+sTsyo7IQYESQFLB2TDUuQMFDyIU
	8K3T86ZTltDiD9MzylHxaN7Af3B/G+MeQzUbmY17QAVdbRHClYhajuKsJNaJRH4Q
	YdY8/QA0jg4jpmmcj4yIYaA6VfTw/IKHQARNw6EyjA==
X-ME-Sender: <xms:8Mt_Z5hHYCR3rhblQfaG3dFpp4K3ak1AHdPQAvsb0xVkTgG4XHK0mg>
    <xme:8Mt_Z-AnZxVbizxqu-usTkuoYH6FsFq3RcxtMSJJ3wz1rnqZghnkto2PUN1jbRQ4R
    gJ_-2uxin5icg>
X-ME-Received: <xmr:8Mt_Z5GSn8Qghm70mCdY951k410x89B5B2BKHwczA1cTxAFAn4Kv46YPkgKUWwKPVcGUMkWIcmeVqI0szZ2u6WtckLE8uFEqrPfmeLwzixTCkkJ-cag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegiedggeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecu
    hfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrg
    hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffr
    rghtthgvrhhnpedtjeehieevhfettdefudefgfegteejkeffueegudekieeftddvudfggf
    dugfekgfenucffohhmrghinhepsggrshgvrdhlughspdhofhhfshgvthdrlhgushenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrh
    gvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthho
    peeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlih
    hsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghpthhtohepfhhrvgguih
    grnhhordiiihhglhhiohestghlohhuugdrtghomhdprhgtphhtthhopehjsggvuhhlihgt
    hhesshhushgvrdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtih
    htrhhigidrtghomhdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtgho
    mh
X-ME-Proxy: <xmx:8Mt_Z-QZLzbbVMdAIPyt6LRH243jGZly2N0VQWWjFBKdsat8px0CDA>
    <xmx:8Mt_Z2yixDW4WMOowvulaKlOIsw28-T5D3g_mPS_lU5DtiZmwlQBTg>
    <xmx:8Mt_Z07MHHNvCFhEL--P29UiydINeEjXQqzSASBnMsTeCcyTbrwHsA>
    <xmx:8Mt_Z7yiVlGLoz8z6L1snPeCNi40Vnazu_Zl6YPaaRtidJXLsvLufQ>
    <xmx:8Mt_Z9nCThlsocEatcRJoGPd64nqpSJLP1gWktTTvD02tPDVgAZXbmcJ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/boot: adjust text gap/diff to work with 64-bytes alignment too
Date: Thu,  9 Jan 2025 14:15:06 +0100
Message-ID: <20250109131515.1757764-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Xen compiled with -mtune=generic has .text alignment set to 64-bytes.
Having text_diff non-64-bytes-aligned breaks stuff:

    Traceback (most recent call last):
      File "/builddir/build/BUILD/xen-4.20.0-build/xen-4.20.0-rc0/xen/./tools/combine_two_binaries.py", line 96, in <module>
        raise Exception('File sizes do not match')
    Exception: File sizes do not match: 70160 != 4080 + 66048

Adjust the numbers as suggested by Frediano to work with 64-bytes and
even 128-bytes alignment.

Suggested-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/arch/x86/boot/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index d45787665907..80c32163fbbd 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -40,8 +40,8 @@ LD32 := $(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT))
 # are affected by both text_diff and text_gap.  Ensure the sum of gap and diff
 # is greater than 2^16 so that any 16bit relocations if present in the object
 # file turns into a build-time error.
-text_gap := 0x010200
-text_diff := 0x408020
+text_gap := 0x010240
+text_diff := 0x608040
 
 $(obj)/build32.base.lds: AFLAGS-y += -DGAP=$(text_gap) -DTEXT_DIFF=$(text_diff)
 $(obj)/build32.offset.lds: AFLAGS-y += -DGAP=$(text_gap) -DTEXT_DIFF=$(text_diff) -DAPPLY_OFFSET
-- 
2.46.0


