Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 392E5AE454B
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 15:50:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022411.1398237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThZN-0000hT-KP; Mon, 23 Jun 2025 13:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022411.1398237; Mon, 23 Jun 2025 13:50:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThZN-0000fd-GS; Mon, 23 Jun 2025 13:50:45 +0000
Received: by outflank-mailman (input) for mailman id 1022411;
 Mon, 23 Jun 2025 13:50:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TVau=ZG=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uThWN-0004sG-K9
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 13:47:39 +0000
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0370650-5038-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 15:47:39 +0200 (CEST)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfout.phl.internal (Postfix) with ESMTP id 46303138082B;
 Mon, 23 Jun 2025 09:47:38 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-09.internal (MEProxy); Mon, 23 Jun 2025 09:47:38 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Jun 2025 09:47:37 -0400 (EDT)
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
X-Inumbo-ID: a0370650-5038-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1750686458; x=1750772858; bh=N9MD8Mvw6f
	t7X7ieLTItulxJ3A0QGL2tSAmCCfyuQa4=; b=kXGFTVTqZ8w4MQA6G6i1+dbc8b
	Eh4Ir+2CRc6ewSVfhS8anJIMwDs12smDyUQYG0fuQJ/YLdme4MZ10lAuceG6oe/W
	JhvajcMOAWF7FVTyRGPTENsNJFxExjF069lpaKIcUgHWu5MoUP9A1QZBzPhuJW68
	/gf55yaNpRs21+N9gLSH/iFCjIcpnMibuCcZmDtfVLutwO98+FzuR5KjBV0YHmAn
	rbx9tHXLWjBOr02gso6YwqlMRLpLHEan0kADU0mvtqfyR5rN+vmaOcL/7H3elgbE
	XQwVRSG/cB+U3Ri6XpGqu0/tuHhwvv7BzWMb6xmVl7CY19mYifEfZtqlFFPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750686458; x=
	1750772858; bh=N9MD8Mvw6ft7X7ieLTItulxJ3A0QGL2tSAmCCfyuQa4=; b=P
	vMeL3dMGXUOwKSlI/tqZpA9wLaDFKpmbhIIGRCbUoRbC91COahJ+lxup6QCXt3fK
	l/bLhkzvnO4223mYjMfqheaoJ9aCBc2/ZaOdYErqim+BZfFo1q/xomjWb1Bl06db
	nt8QxO5D6WYW12E1WkWYOiAIvjMiml8f3uuTMBKRoxncRPh993pbk7tOFVtZyfjI
	CbyaNnM55Fb1Gy2l4osBcPfSYMUQE2011al2iUX6CpP3JBKB0R0giGKmoFwqBOz9
	7Mj0UGuryh9AvH9cukDbHFksvpqPFYL2HIVtue/naZUqkbLgNmkV8JrBwX2URYLw
	vEr8r1urQYe8u3DA2e90g==
X-ME-Sender: <xms:-lpZaKYZjbdxDmpoYokat6ae28MlNpz40QNiXRrSDTg_UvrWw4nzZw>
    <xme:-lpZaNYrHc1QQDdzzjG0L4GrsQdC_kTRhrHyClnyOkQ09I8WejBaTnBcknQdfle5U
    px2__JgxOs8RA>
X-ME-Received: <xmr:-lpZaE9Gdn8f0lRy1gx30Eo2am-AomJdtaU7Zs2yqlXfPzkjtffy3jvClVcJ-4ROjCp-gv76EuVLnvEHvU6gvjV_knXbTP_5oMVDQt8J9o82Or8E2vGz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujedukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepffeitdeg
    veffteelvdeghffhvefghfefkeelheeujeejgedvvdfgffejuedtvdelnecuffhomhgrih
    hnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprh
    gtphhtthhopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgt
    ohhmpdhrtghpthhtoheptggrrhguohgvsegtrghrughovgdrtghomhdprhgtphhtthhope
    hsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:-lpZaMpVPiDPbBsDFhic8mmjBJhl2ZWTbILsnCXlg0gtXv04O47bxg>
    <xmx:-lpZaFrHGTplmQaEZJ76hAcDtjHVbDRaAvMa9bvjSPItriKa_hz6XQ>
    <xmx:-lpZaKRZ8zkgqEJRRfByiOky8QY6SBHHMk5l6EwfAfltqOK_fhVcqw>
    <xmx:-lpZaFoU9JwQD_OviSSCH0kmTlSLy3LVxwrsMO9vM64O2zw3Zao19g>
    <xmx:-lpZaDzZtAk8tj0rKj3qKwYTpJ-TtI7jVF4eBO9eVmz8w6Rdo9XurU_0>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 1/6] CI: Switch x86 tests to 6.12.34 kernel
Date: Mon, 23 Jun 2025 15:47:10 +0200
Message-ID: <56c63be504a72b689591b1888970fc5d340d0649.1750686195.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.16ccd290bf95e314a4f23777f5564b3aa2417e57.1750686195.git-series.marmarek@invisiblethingslab.com>
References: <cover.16ccd290bf95e314a4f23777f5564b3aa2417e57.1750686195.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is necessary for the upcoming Zen4 runner.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Previous version posted in https://lore.kernel.org/xen-devel/cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com/T/#u (but actual patch didn't make it into the ML, as it contained dockerfile change...)
---
 automation/gitlab-ci/test.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 842cecf71382..1b88ee5c3be7 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -21,7 +21,7 @@
 
 .x86-64-test-needs: &x86-64-test-needs
   - project: xen-project/hardware/test-artifacts
-    job: linux-6.6.56-x86_64
+    job: linux-6.12.34-x86_64
     ref: master
   - project: xen-project/hardware/test-artifacts
     job: alpine-3.18-x86_64-rootfs
-- 
git-series 0.9.1

