Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B2A5BD00E
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 17:10:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408814.651680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaIPq-0000Py-Km; Mon, 19 Sep 2022 15:10:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408814.651680; Mon, 19 Sep 2022 15:10:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaIPq-0000N3-HL; Mon, 19 Sep 2022 15:10:34 +0000
Received: by outflank-mailman (input) for mailman id 408814;
 Mon, 19 Sep 2022 15:10:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Da22=ZW=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oaIPp-0000Mx-VC
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 15:10:33 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34834d54-382d-11ed-bad8-01ff208a15ba;
 Mon, 19 Sep 2022 17:10:33 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B28525C0382;
 Mon, 19 Sep 2022 11:10:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 19 Sep 2022 11:10:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Sep 2022 11:10:30 -0400 (EDT)
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
X-Inumbo-ID: 34834d54-382d-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1663600231; x=1663686631; bh=SsHRX7ivaPDrWcKxpWksUgGOVgR6mEQwwJ9
	Ag7XUYB4=; b=JW/gPK7d71tLzzL8RfvLcc9UIOy6CIOBdgiVNFndKdmtg//33pb
	Bf8P9vhlHngJfgmEcL2yB77cLNvNUe2bQQTQa02E1MIyHl0waz+C22gejquHA3JA
	0z7RBfZGu+TXrqkIaAgS4e09BIod4/zVWc3TNfS04Q5xRNmtPg9DfbKuRKv+Nevz
	4+4afMgEMhwix/Yl8vf0lGog+MmLMjmBfluZfCXIfU4s3q4QQG4eeN7VeVyUZd9P
	N9mu/d7pAZjHCFHAoS93fvP3fEQE2eVho4c9gNS7jPDW7Ikuvlhxge3gFe0m++vh
	2K81ycrlk/w2K31vp5of2q+b2QDOowkcijw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1663600231; x=1663686631; bh=SsHRX7ivaPDrW
	cKxpWksUgGOVgR6mEQwwJ9Ag7XUYB4=; b=LSrK/2rfFF0zzM7V3WohwUUyQM+2P
	BSK3N4cz2VTRXzLDpN7cgcz8TML7DtalCtz5R3ScB2bwUAVnSryxcdEKk4cgUbqD
	sG6OoRggQHV6OWrfjaPvzSHy1N9FBYj1Mumh7T00kdQqvjl+gRJwBdBJzdEoKM4P
	8qQqrzSlf1h3ng1XpHvU1AGy4cN22q8kSJtW5d0CrcC4rWWH2va+dj7lY0b9qMZ2
	xNGjHRN2R8iDm+SdQd3AEG0B2tO4VNu7LvwLNiAHOCAcb8yyB7wiSCJAE5QY/kRO
	AlcxrZcVsEQ+YUWFy+km0VzarvE2hRrO9Bl2Uwu0GnpNl9mBM13Qk3Www==
X-ME-Sender: <xms:Z4YoY3OkHjxuYlNINSfQyZcU5TraR9nihZ5WRouL3DE-KPoFaHBS5w>
    <xme:Z4YoYx9zxbwgjVEA6XOeg7pa1iA5TtK1C4re7A2ElN3YgWWIA62uK59s7CJNFXETJ
    ESk_Gdtu1VUYA>
X-ME-Received: <xmr:Z4YoY2Q2dL_znthcrt1980ubuLGSm_WzNq65wLaCG-CF_0EMuIl7TJhNffstDQTveX2radGSSyUu7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvjedgkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelkefh
    udelteelleelteetveeffeetffekteetjeehlefggeekleeghefhtdehvdenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:Z4YoY7tsbA5lFiMDPrUwtXXk2U_UKFN6CKUtzOwOAZ0G5HFqQU2FxA>
    <xmx:Z4YoY_cRgjCyJaAE3PpAMOhzbAU3QeR-zM5ZSlAo61OnOicjKtWK_Q>
    <xmx:Z4YoY30sIMbApQmu3a-969ErQMyfTBOUvItV6g7QuESm13VxJt722g>
    <xmx:Z4YoY3E04CqEJGagZMrQsO6q9n1uaKRkgbaNa5JEF4p1v2CfaOyCbg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH] xen: credit2: respect credit2_runqueue=all when arranging runqueues
Date: Mon, 19 Sep 2022 17:09:28 +0200
Message-Id: <20220919150927.30081-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Documentation for credit2_runqueue=all says it should create one queue
for all pCPUs on the host. But since introduction
sched_credit2_max_cpus_runqueue, it actually created separate runqueue
per socket, even if the CPUs count is below
sched_credit2_max_cpus_runqueue.

Adjust the condition to skip syblink check in case of
credit2_runqueue=all.

Fixes: 8e2aa76dc167 ("xen: credit2: limit the max number of CPUs in a runqueue")
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
The whole thing is under cpu_runqueue_match() already, so maybe
cpu_runqueue_siblings_match() isn't needed at all?

[resent with fixed xen-devel address...]
---
 xen/common/sched/credit2.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 0e3f89e5378e..9b8ca4d5ae24 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -996,9 +996,13 @@ cpu_add_to_runqueue(const struct scheduler *ops, unsigned int cpu)
              *
              * Otherwise, let's try to make sure that siblings stay in the
              * same runqueue, pretty much under any cinrcumnstances.
+             *
+             * Furthermore, try to respect credit2_runqueue=all, as long as
+             * max_cpus_runq isn't violated.
              */
             if ( rqd->refcnt < max_cpus_runq && (ops->cpupool->gran != SCHED_GRAN_cpu ||
-                  cpu_runqueue_siblings_match(rqd, cpu, max_cpus_runq)) )
+                  cpu_runqueue_siblings_match(rqd, cpu, max_cpus_runq) ||
+                  opt_runqueue == OPT_RUNQUEUE_ALL) )
             {
                 /*
                  * This runqueue is ok, but as we said, we also want an even
-- 
2.37.3


