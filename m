Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0F9A8722D
	for <lists+xen-devel@lfdr.de>; Sun, 13 Apr 2025 15:49:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.948964.1345673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3xhS-000553-Ve; Sun, 13 Apr 2025 13:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 948964.1345673; Sun, 13 Apr 2025 13:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3xhS-00052i-PI; Sun, 13 Apr 2025 13:48:42 +0000
Received: by outflank-mailman (input) for mailman id 948964;
 Sun, 13 Apr 2025 13:48:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hQaa=W7=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u3xhR-00052c-LW
 for xen-devel@lists.xenproject.org; Sun, 13 Apr 2025 13:48:41 +0000
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00037112-186e-11f0-9eae-5ba50f476ded;
 Sun, 13 Apr 2025 15:48:38 +0200 (CEST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id C0D42254009D;
 Sun, 13 Apr 2025 09:48:36 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Sun, 13 Apr 2025 09:48:36 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 13 Apr 2025 09:48:35 -0400 (EDT)
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
X-Inumbo-ID: 00037112-186e-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1744552116; x=1744638516; bh=65+6xqnS0v0IeL+vIucI1i3MsAbiGj9z
	Lb6pCAV3vYM=; b=anjin7aYA4VJ89goijEEvyAdCON0mVAHvsx59LZpsLgmYBsx
	ODHO5fyJWpx0hvhzc1ztCMq49yuRQZU1Y7PlbXyNZbIQ1OXNzO72gNPwnz4bQshJ
	NRXuk+L4xMj3hHMstYJSRgnrTKjT+qWUtntwcnZFmi9MUuzwySq4dDvkdh33ALZw
	7+XmZNODMIes6O9jRAJC1bahwSwfdIWdcxDoyvsL3XC6p6sLytz8QllILHZsV3wd
	zV0PsNNUqwyhHrHu/N/T3cQjBxYd4/CUzfX3IzMJ51eNdZWbLmf1ya88Qy9luhDv
	NyJMwiLokXmfsmlGssZGtfFbBtO6w5S33A7BTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1744552116; x=1744638516; bh=65+6xqnS0v0IeL+vIucI1i3MsAbi
	Gj9zLb6pCAV3vYM=; b=V+mr2BKshYHokSf1u4N6Pw/cjQKELSGlX8UVcjo2DATd
	oTyjllcqo2YQTqO4Qx9e2FxHJuHE0s8FrB8aj2Ga5NyHJRDOoJdyNmAV/oZvr5zY
	VP4EFEPU+8Q6GUA+KcUPgQ7daA7/Q6AsOGddTbObf/ePI86+SZQfrYw4L0MkQFTI
	pinkxZ0CcNX/xc9qJRnVMs7ZK9+494Dv19KSKwyDjPbVPc1kg7h4wpceOJZ/pPkq
	Y47LdRS6reKR2juQSgAISwUSvGlMBigsuvt/Q0TwB8VRGq0AbcHDYLqhblE9k7oX
	h8IM+57sC/s0udR4np1PJGLqvNEZ5rLEA64eq0IAug==
X-ME-Sender: <xms:tMD7Z69nPjafj8jTtVDDUadcmsokE4lt6QPn7kbSS5Gq54MntTBZsA>
    <xme:tMD7Z6t7A8nmQxs7km7l_Sy1JRJnaMNlBhR89F--EeRNdcrNq_SQGgPjRDL1_coR6
    cszlLjc7yOCXw>
X-ME-Received: <xmr:tMD7ZwCim_oVMxvyMFXVVaiVlG96PQlOsx-TccVu4RcL6-HEU2AXS5_L8X6xp3YxcSFwRxfJPobNWO1ngjBG3ReyzVe3BgogUOOKFxL0HD4fMydKVFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudejkedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpeelkefhudelteelleelteetveeffeetffekteetjeehlefggeekle
    eghefhtdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpd
    hnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeigvghn
    qdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhope
    grnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohepmhgr
    rhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdprhgtphhtth
    hopegtrghrughovgestggrrhguohgvrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhl
    ihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:tMD7ZydmsyRn3vA5x8_JP3aloF9PMDQIc8WtNlQrmHzzclzvSPxTtQ>
    <xmx:tMD7Z_NMYQh3ltbF1sXBBa5ZIFlxs6hbsf3xpJA6Se1EK1KFfZbb_w>
    <xmx:tMD7Z8mxeif3BNN9TJBNSSblM2K9_gX8hwS6TFJmpdLqsGgE74Rn2w>
    <xmx:tMD7Zxva4bCNuD2k3PcclBfUvQqjbF8EsmCDZKUBas0SLxl_m9kWvg>
    <xmx:tMD7Z8WfI5glGWCiTi_5FaezT9S0fd6Lk9xg0EXvx7P6opQrnDdup9bn>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] CI: fix waiting for final test message (again)
Date: Sun, 13 Apr 2025 15:47:31 +0200
Message-ID: <20250413134826.1366350-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The previous attempt has correct diagnosis, but added -notransfer flag
in a wrong place - it should be used in the first (outer) match out of
two, not the second (inner) one.

Fixes: 1e12cbd6af2c ("CI: fix waiting for final test message")
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
This actually fixes the issue described in the referenced commit. When
that issue happens, it can be seen as a complete console output (up to
Alpine login prompt), but test still failed.
But that is not all the issues, sometimes it hangs really in the middle
of dom0 boot, for example with last lines as:

    [    1.816052] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
    Poking KASLR using RDRAND RDTSC...
    [    1.818089] Dynamic Preempt: voluntary
    [    1.818251] rcu: Preemptible hierarchical RCU implementation.
    [    1.818254] rcu: 	RCU event tracing is ena

and sits there for over 120s.

It's unclear to me yet whether it's a real dom0 hang, or an issue with
grabbing console output. Debugging...
---
 automation/scripts/console.exp | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/automation/scripts/console.exp b/automation/scripts/console.exp
index bdb1dd982003..fc80513dfb35 100755
--- a/automation/scripts/console.exp
+++ b/automation/scripts/console.exp
@@ -60,12 +60,12 @@ if {[info exists env(WAKEUP_CMD)]} {
 
 if {[info exists env(LOG_MSG)]} {
     expect {
-        -re "$env(PASSED)" {
-            expect -notransfer -re "$env(LOG_MSG)"
+        -notransfer -re "$env(PASSED)" {
+            expect -re "$env(LOG_MSG)"
             exit 0
         }
-        -re "$env(LOG_MSG)" {
-            expect -notransfer -re "$env(PASSED)"
+        -notransfer -re "$env(LOG_MSG)" {
+            expect -re "$env(PASSED)"
             exit 0
         }
     }
-- 
2.48.1


