Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0457B138E3
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 12:25:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061230.1426739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugL2Z-0007dk-1w; Mon, 28 Jul 2025 10:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061230.1426739; Mon, 28 Jul 2025 10:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugL2Y-0007bD-VX; Mon, 28 Jul 2025 10:25:06 +0000
Received: by outflank-mailman (input) for mailman id 1061230;
 Mon, 28 Jul 2025 10:25:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qt5P=2J=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ugL2W-0007b5-RM
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 10:25:04 +0000
Received: from fhigh-b2-smtp.messagingengine.com
 (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ed1d24d-6b9d-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 12:25:03 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 685637A01BD;
 Mon, 28 Jul 2025 06:25:01 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Mon, 28 Jul 2025 06:25:01 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Jul 2025 06:25:00 -0400 (EDT)
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
X-Inumbo-ID: 1ed1d24d-6b9d-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1753698301; x=1753784701; bh=5kzL1yl//NUu1iEByEAbQXDTas8i4+24
	kcCE0plUOKs=; b=dWFUEPusVLho2HaNa7R9dbkF9mC16JohgvUxl8O4CTmb2wc+
	7RGbKBzaTLvTY9qswAlqeTNqbki0wTQqxGQlrzCSl/1BQDn7g6RFsSUEcF3gkNL9
	bNbbDUOPGd1XVoymGQQz7e0Q6narpcYBQJ6/Diny6Bd1PX/2TWL4Ve3n+EhkfCt3
	2awUNIWEBPAEW5hdcypmg5iWO2lXs7IZ1pAlfau7eti2gkcDgHNqjHPutzkopfD1
	vs9cBe0VxJ5h1c10PHMnnlE2JaLTh28JNX9Sb3LMBTvkNvNKd3GcskiDdbhtgnBV
	o/t7FuYiZW7h3F5ziU15FiIQYA8wh5BQLNvFQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1753698301; x=1753784701; bh=5kzL1yl//NUu1iEByEAbQXDTas8i
	4+24kcCE0plUOKs=; b=dijylUYB1/mHohsj4z1ioOCy4fi25d9XzB0oXFoMFNCP
	YXmkxv5kfNLGODYK2GWrudac/9QQPdS+64deRZEQwP/i9cMxj/eSkP1hzEc3y37Q
	ZVSw3CvkgxEWX3oVNMq385p5scJOpuqiZE2daWqy/Rh9vmaUXSJCPw+ZmuA3zGfl
	UKl4reWl/iGWBLM80IxpDa+GQWnOqxt2HWxri6buLPcnhxXlXUHdUo2Iu9rN0Tz5
	X//ZC6BmWp4E8ZxAUB9mTEp07bXX/ZM0fLJnhzIt733qGCU2aNfIQ6ILFEX9D3I/
	BOZoc2ftlGN7qEQA8c1PuZBNZLPXXK7tEaSh2t7ahQ==
X-ME-Sender: <xms:_U-HaCMlhLQcJvQc49IAukI7I_mDiS3zOxdHvbv4riB2XywDkp2Qog>
    <xme:_U-HaLhPz5mVCeS0YgdHXNtiwt1coCyKqBvTkZyz4S5iIchGwne9nomzwPFGIC4ou
    LKRcs1EdIVfCw>
X-ME-Received: <xmr:_U-HaF1PpKV3zhXDR2pIbkawUXmUmbsUEfJeYoPd_40_BAfdWVUN33UHflpeuImc3_s4ChP7rTTpwVof_RdC5-1UtlyA3yg7tuNWxcPqoXcdckAxqTaK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeludelfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleekhfduleet
    leelleetteevfeefteffkeetteejheelgfegkeelgeehhfdthedvnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigv
    nhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefse
    gtihhtrhhigidrtghomhdprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhishhisghl
    vghthhhinhhgshhlrggsrdgtohhmpdhrtghpthhtoheprghnthhhohhnhidrphgvrhgrrh
    gusehvrghtvghsrdhtvggthh
X-ME-Proxy: <xmx:_U-HaFiOQKOOzmAWepIhxyr0t3QGTR8Y98ARNfRtoJZ5tsW0jVIcCQ>
    <xmx:_U-HaFf5FVqwOlQfj27EZlAU0VoOLaLNQQR64eQ0EeAc6ozShshAAQ>
    <xmx:_U-HaIlnfu8RXfaLtmxbsXsnuV9AfaS1tuCk6gd5r51GLR9KxvBWGA>
    <xmx:_U-HaOsRUOUeTDl9BfCvIqY97SLC2hT_M4wl6zZbl0dSAOIBcmnrEA>
    <xmx:_U-HaJKiUexM6OLawT5isYHddOpEyMDseU_oaH2oD6k55rGbaKlo-ehA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] tools/xl: don't crash on NULL command line
Date: Mon, 28 Jul 2025 12:24:03 +0200
Message-ID: <20250728102422.2245808-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When running xl in a domU, it doesn't have access to the Xen command
line. Before the non-truncating xc_xenver_cmdline(), it was always set
with strdup, possibly of an empty string. Now it's NULL. Treat it the
same as empty cmdline, as it was before. Autoballoon isn't relevant for
xl devd in a domU anyway.

Fixes: 75f91607621c ("tools: Introduce a non-truncating xc_xenver_cmdline()")
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
So, apparently the "No API/ABI change" was a lie... it changed "empty
string" to NULL in libxl_version_info->commandline. Quick search didn't
spot any other (in-tree) place that could trip on NULL there. IMO NULL
value in this case makes more sense. Buf maybe for the API stability
reasons the old behavior should be restored?

PS I'm working on a CI test for this case (and driver domains in
general). I have it working with Alpine already, but it wouldn't detect
this issue, as musl's regexec() doesn't crash on NULL... So, I'll add a
test on Debian too.
---
 tools/xl/xl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/xl/xl.c b/tools/xl/xl.c
index ec72ca60c32a..e183d42b1d65 100644
--- a/tools/xl/xl.c
+++ b/tools/xl/xl.c
@@ -81,6 +81,8 @@ static int auto_autoballoon(void)
     info = libxl_get_version_info(ctx);
     if (!info)
         return 1; /* default to on */
+    if (!info->commandline)
+        return 1;
 
 #define SIZE_PATTERN "-?[0-9]+[bBkKmMgGtT]?"
 
-- 
2.49.0


