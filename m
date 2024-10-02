Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8852998D385
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 14:43:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808762.1220767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svygy-0007qf-7l; Wed, 02 Oct 2024 12:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808762.1220767; Wed, 02 Oct 2024 12:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svygy-0007pA-4a; Wed, 02 Oct 2024 12:42:56 +0000
Received: by outflank-mailman (input) for mailman id 808762;
 Wed, 02 Oct 2024 12:42:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3lMz=Q6=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1svygv-0007Li-V8
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 12:42:53 +0000
Received: from fout-a2-smtp.messagingengine.com
 (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d71c58db-80bb-11ef-a0ba-8be0dac302b0;
 Wed, 02 Oct 2024 14:42:53 +0200 (CEST)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfout.phl.internal (Postfix) with ESMTP id 826181380212;
 Wed,  2 Oct 2024 08:42:52 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Wed, 02 Oct 2024 08:42:52 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Oct 2024 08:42:51 -0400 (EDT)
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
X-Inumbo-ID: d71c58db-80bb-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1727872972; x=1727959372; bh=x3J25cRrdod2hsekofuGMbdpEOwomA7e
	e/WxHRc5eEM=; b=XOymqohwcNXKq4AZFF/6a+n3XxUg3wBi+aJAu/Mwyz2G5N0a
	kadtSmQBd+HaBuYGQgGPaCKEmUBTx83UA2EQs9YHqYQ19dYse/L8sTM0tYn3tQgj
	Su6kac/1hU0HiiE+hopMIk2o0lGo1aYo3n4zyT4Uo+NhaUGCtsRoA83bkrYEUXmY
	gPLDqckouu+5euon93WN730IL+vldMmfPV3X35bZ9YQzG6stFzuzMtKFszL1YDU+
	EoZztoNlTEBO3TVl7TnFSqoWEW37art/n6YDFa0ePtyxIekgCItwPf12msELgmw+
	QW7VY9mfMr/37DWWB5w9/tEcix++5jPLlGB4pA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1727872972; x=1727959372; bh=x3J25cRrdod2h
	sekofuGMbdpEOwomA7ee/WxHRc5eEM=; b=ecfT9PBSaamQBvX/Sd1cayB+Cm6HQ
	w30l1DhqRGIbWzW0rd98umFZt9plZM77xnUS5ntvdGWekMwQ96Rai5qYI/yJZihn
	ZndaGedKMq4pKsxNz4aob/93G20dH0CNi8RDJ2b7cgrTyU5XwfmALS1aYCjW18/n
	ErO0f/qJ65an913kD5Z5W8/mH7N86YNlR7i2A0+gtgAhB1PoetR8rNJoZ3DhB6UJ
	Ea25zTXL+ErBzDDPSN6gRUkCOl7500pOiXg9ZArtp9MsUsYxnmDQeZojy8pzDxOC
	blEyXmznf5QfVflH4WkWJDnQQ9TuzJvrNH7Tsrxw84xgrMvVuxEytqYoQ==
X-ME-Sender: <xms:zD_9Zn_9dLrzU0GABZkpwefMBjdt8pHeB7DKO8hUtSMB8GpMfWimrw>
    <xme:zD_9ZjslmprYB0pITFylEpV9V08RZYf6_oM55AFzbXQ3edd1kl0ByRZ_hpD4B5Kmy
    Jf3X-fVhj7-Rg>
X-ME-Received: <xmr:zD_9ZlA02cQ0nVIo8gpq_ZWonyztY5shl8yXUxt_kVXqlkcVGbtwRSmak5sm7NWng4bybXOR8xU6JYzX0o1xv-k_J-CAqrHagRNSnUrIWL18aq2wnI8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdduledghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecu
    hfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrg
    hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffr
    rghtthgvrhhnpeelkefhudelteelleelteetveeffeetffekteetjeehlefggeekleeghe
    fhtdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsg
    gprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdgu
    vghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehmrg
    hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghpthht
    oheptggrrhguohgvsegtrghrughovgdrtghomhdprhgtphhtthhopehsshhtrggsvghllh
    hinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:zD_9ZjeSHtQLSrqDEVShjsocqcLatrWmxivIWj_wZwtfJRuW6EJu_w>
    <xmx:zD_9ZsNvWYGJToKYyLrj-dgI2TPUgCt41i5tajsQ901T6nlHUkRwnQ>
    <xmx:zD_9ZllkKBDb0qzcSTLam0ufUsbbiulBhbJ5bBLCqofViU7pGziUDQ>
    <xmx:zD_9ZmtBBE6WagAaUqcUpp5GxnqpLaLfSjjd_177UHOherGA_q1LrA>
    <xmx:zD_9ZhqcDdnO6NQR3v_ehPXm6UfZ_bOZbViO0OzmzIlYGcspW5ppEUxU>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/2] automation: preserve built xen.efi
Date: Wed,  2 Oct 2024 14:42:40 +0200
Message-ID: <20241002124245.716302-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It will be useful for further tests.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/scripts/build | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index b3c71fb6fb60..4cd41cb2c471 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -47,6 +47,7 @@ if [[ "${CPPCHECK}" == "y" ]] && [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
 
     # Preserve artefacts
     cp xen/xen binaries/xen
+    if [[ -f xen/xen.efi ]]; then cp xen/xen.efi binaries/xen.efi; fi
     cp xen/cppcheck-report/xen-cppcheck.txt xen-cppcheck.txt
 elif [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
     # Xen-only build
@@ -54,6 +55,7 @@ elif [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
 
     # Preserve artefacts
     cp xen/xen binaries/xen
+    if [[ -f xen/xen.efi ]]; then cp xen/xen.efi binaries/xen.efi; fi
 else
     # Full build.  Figure out our ./configure options
     cfgargs=()
@@ -101,5 +103,8 @@ else
     # even though dist/ contains everything, while some containers don't even
     # build Xen
     cp -r dist binaries/
-    if [[ -f xen/xen ]] ; then cp xen/xen binaries/xen; fi
+    if [[ -f xen/xen ]] ; then
+        cp xen/xen binaries/xen
+        if [[ -f xen/xen.efi ]]; then cp xen/xen.efi binaries/xen.efi; fi
+    fi
 fi
-- 
2.46.0


