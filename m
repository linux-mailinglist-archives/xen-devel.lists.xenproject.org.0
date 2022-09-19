Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 339F45BD005
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 17:05:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408804.651669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaIKZ-0007Pv-1s; Mon, 19 Sep 2022 15:05:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408804.651669; Mon, 19 Sep 2022 15:05:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaIKY-0007Nk-TW; Mon, 19 Sep 2022 15:05:06 +0000
Received: by outflank-mailman (input) for mailman id 408804;
 Mon, 19 Sep 2022 15:05:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Da22=ZW=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oaIKW-0007NU-NF
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 15:05:04 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e98468b-382c-11ed-bad8-01ff208a15ba;
 Mon, 19 Sep 2022 17:05:03 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 043C25C03B4;
 Mon, 19 Sep 2022 11:05:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 19 Sep 2022 11:05:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Sep 2022 11:04:58 -0400 (EDT)
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
X-Inumbo-ID: 6e98468b-382c-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1663599900; x=1663686300; bh=odLXxxvz6nzbkbzsLziod48m46GNXZ+65lY
	HR3Efirk=; b=IkFyEF7Zhk7LlFdQFWorz3dd5x8SvrrW4HjqEDxh7jpQSqLAcGt
	tVjuD5y1RtJ4rjS4qH3YJkHn/ahyJs9pb7T8xIkaXjPr+Z7yJlZh5nYg6KOan5Pl
	QNj+rYq2CajRVJwotRKxI/OdYudWZF82ZlUNPOlPA75c0O4H5ew6aLAiE+nmVSIl
	fNWxDFULqwnAHXZkFD4y3bZzzq7a/q+TmDe2A7BAKBdHEUaVcr23Cx077U6kl0aV
	tsIgSvyRcRK1gHfRy0TkncOLDY85zfXcjBj1jkN0J1GxKVlyddwdQF7SJUUdchcj
	OWzN7ati0VbqR3IT40bRIe75ehN8X+b+epw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1663599900; x=1663686300; bh=odLXxxvz6nzbk
	bzsLziod48m46GNXZ+65lYHR3Efirk=; b=PmBJAMzXRHMaSGce8Xp8ZudPA1c6V
	Fw7+aeUyVQHlsqq5DlP8JFG6WejWKSF1Yx5F1hwX+SZx7wEPeuWpPAzuXczUx7iU
	bbDvxwzTzJiCgEoBy80WXTOUlu7D70R+kNm0OijQVTfGQvLPI8baYHq8lQY40A1f
	2KyYxN9YHfBs2idPIXlfvVyUnbr3b/9+eN4RrsVo/DDI5T3qtNKH0HVQ5t+zkW01
	dVIgCOSW4zPDG3bY0bMBxYgVgoXtAXrD67bxDfsZa4YDmCxbz1BIHWQRR5ijH2SJ
	S6eW4DzzN3HnfKYYk2E4m/iEvadrl7GvNOdTBiHJsKw8HI3b5ThHct+DA==
X-ME-Sender: <xms:G4UoY54WdUtprjmLaL7fWm3bbbKmbb2REzAZqft19aB9C2e3Twl_fg>
    <xme:G4UoY26xynjFe929MVZukxaLhOjaTSeB8iNuvDy8zgloxAwbNEnbVv2pZx_Bj_XAO
    RuRaYZZWUppSQ>
X-ME-Received: <xmr:G4UoYwe4fna2dSXZcMxz2svfVXJFfQnJXZ1w8k7iFnSxhp5C2tO5w1PTr6bhXoIBSjIa10gCveykIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvjedgkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelkefh
    udelteelleelteetveeffeetffekteetjeehlefggeekleeghefhtdehvdenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:G4UoYyIRokrRbWZyRqca0KrH2HHrroAUYAnR8dKVCCHArM_K1CXSuw>
    <xmx:G4UoY9KbAeZXDjFMj7brDAgPaB6mwk3X3SdnaXBlNQkCLgDXEbTlfg>
    <xmx:G4UoY7ygLKMK1Ecf_WjSohg1WAKqnDWDb_zW36HbP7GCyLWS76MsEA>
    <xmx:HIUoY0WRIVZxUHCuJ6ydyLOW9pb8A6COLDKAl8hG0g-bgOn_tuSDvA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH] xen: credit2: respect credit2_runqueue=all when arranging runqueues
Date: Mon, 19 Sep 2022 17:04:53 +0200
Message-Id: <20220919150453.29927-1-marmarek@invisiblethingslab.com>
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


