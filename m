Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9247B98FC56
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 04:30:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809931.1222509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swY4y-0005iE-Vk; Fri, 04 Oct 2024 02:30:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809931.1222509; Fri, 04 Oct 2024 02:30:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swY4y-0005ag-Ny; Fri, 04 Oct 2024 02:30:04 +0000
Received: by outflank-mailman (input) for mailman id 809931;
 Fri, 04 Oct 2024 02:30:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v+dN=RA=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1swY4w-0004wg-Th
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 02:30:02 +0000
Received: from fout-b7-smtp.messagingengine.com
 (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8df03d1d-81f8-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 04:30:01 +0200 (CEST)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfout.stl.internal (Postfix) with ESMTP id 2C2ED11400EA;
 Thu,  3 Oct 2024 22:30:00 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-10.internal (MEProxy); Thu, 03 Oct 2024 22:30:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Oct 2024 22:29:58 -0400 (EDT)
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
X-Inumbo-ID: 8df03d1d-81f8-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1728009000; x=1728095400; bh=q7xGTN37Al
	8UjpHCPbgwMdAd2LdqV8NjdJmY0wCHOpU=; b=Mu1m8qc9ZrhiYmDCQlhY8ZXK1T
	OQXQusda0wFU9dQjIo6zKyJ7KOVzmoIPesh/Q93ItchsOjXCgLv6un/lU99nb+b6
	mH9q1AJ0otT1kSxhZ0cLvjHlzwNOkRpijHgd7kZ1ctkyvUNKWNSC2j0rScVVpZB7
	YxeHqR36rGsjO9HuJxdTJbR1SwxPbVvJyv3BZQcMRQHfwEuOQVStc/CeQnW+uivf
	NirbiYAayG6C8Rba8VYNegg3WYIxpO1SzOl24LBmUNTC0kgySMsx2nwFvljBEJ2t
	IXyOotCIscVC1KABEwHdRhZ0427B1A6x3kOgYF7FgMxO86+J6OkqKZx25+qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728009000; x=
	1728095400; bh=q7xGTN37Al8UjpHCPbgwMdAd2LdqV8NjdJmY0wCHOpU=; b=b
	ncGC3KJVtOgyjc0MtsfFf320ptIlrthXSYqP784fj2rLLrxvLISWKdTyYG3eUsLe
	eUfJoitx4+IECM+mlAdRsmTZ4ofTCijPX87A2Gl2icsIubdFhFJCPd1VHztTW0Z8
	f2xHrFeptmfbnQoHQv3MClR3JssUDIVMaQvwnlmzOl+UPmCevCjbI3M137YvV9wG
	jBrHy6r6bdOdFF6cT8TT7aSz8ePqRpChfWZRfZt3PiJ/V3qj5lIT3gdJyqAQyRej
	duiqwxcawnduZfAcjLGuD4+JH9xGzuVy9huo1RJzB2X6t52finUai6b9OcEgQN4f
	pp1MXeovdxBYDJ0sOGFYQ==
X-ME-Sender: <xms:J1P_ZqaWnRjvfF3iJ8rG2KowLqFzOIS5LkIboatZGSQg1epAr5SxSA>
    <xme:J1P_ZtZkcC3-X5Af-sMwHNju9XmYaVg-WbMjUuyBIeZYh8BR4EF8cjko4ADRN5fk_
    iqKB7--8UwxHg>
X-ME-Received: <xmr:J1P_Zk-LG9S_g_dFx2XAaFcF79QKGnhQTpIhtfGPRkeGFKej5yM1GVjuKcGgxzeLEjjxWPFR5B87fZ4Rc2UbxvgKqFrMagadM98R2IseeFxFxoC_kiM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvvddgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpefgueduhefgvdefheehudejheefudevueeghfekhfehleegvedute
    euiedugffgffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpd
    hnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeigvghn
    qdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhope
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghp
    thhtoheptggrrhguohgvsegtrghrughovgdrtghomhdprhgtphhtthhopehsshhtrggsvg
    hllhhinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:J1P_Zsq2mkJsqsxsVA3kBi7_PUeo-2kMc6YcGnGwUEgbe9XcYa8QOg>
    <xmx:J1P_ZloUlUbpsAR4pIlqFM-ggO5MhNRW6W__0jmVEl0SO7LC98cACw>
    <xmx:J1P_ZqQioU0IvEUkcetI0OOzqwaseonfQaM7rzwM6VTI3iH_B3m3EA>
    <xmx:J1P_ZlqpiGyPQAYdtIu7qYVD30ase5xRLHH06cmAQ1TsVgX0L2kzIA>
    <xmx:KFP_ZsW4pdnRAnqu9Z3j81J3vpOdAMeglIdb0v52hfizf1KGrZl3X2Sg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 3/3] automation: shorten the timeout for smoke tests
Date: Fri,  4 Oct 2024 04:29:39 +0200
Message-ID: <cc627ef416a4957615786158a05e3b64c454f560.1728008940.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1bb6f2ab5669356ea3ff954b7c324d2f31c19399.1728008940.git-series.marmarek@invisiblethingslab.com>
References: <cover.1bb6f2ab5669356ea3ff954b7c324d2f31c19399.1728008940.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The smoke tests when successful complete in about 5s. Don't waste
20min+ on failure, shorten the timeout to 120s

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/gitlab-ci/test.yaml | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 5687eaf9143d..b27c2be17487 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -53,6 +53,11 @@
   tags:
     - x86_64
 
+.qemu-smoke-x86-64:
+  extends: .qemu-x86-64
+  variables:
+    TEST_TIMEOUT_OVERRIDE: 120
+
 .qemu-riscv64:
   extends: .test-jobs-common
   variables:
@@ -436,35 +441,35 @@ qemu-alpine-x86_64-gcc:
     - alpine-3.18-gcc
 
 qemu-smoke-x86-64-gcc:
-  extends: .qemu-x86-64
+  extends: .qemu-smoke-x86-64
   script:
     - ./automation/scripts/qemu-smoke-x86-64.sh pv 2>&1 | tee ${LOGFILE}
   needs:
     - debian-bookworm-gcc-debug
 
 qemu-smoke-x86-64-clang:
-  extends: .qemu-x86-64
+  extends: .qemu-smoke-x86-64
   script:
     - ./automation/scripts/qemu-smoke-x86-64.sh pv 2>&1 | tee ${LOGFILE}
   needs:
     - debian-bookworm-clang-debug
 
 qemu-smoke-x86-64-gcc-pvh:
-  extends: .qemu-x86-64
+  extends: .qemu-smoke-x86-64
   script:
     - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee ${LOGFILE}
   needs:
     - debian-bookworm-gcc-debug
 
 qemu-smoke-x86-64-clang-pvh:
-  extends: .qemu-x86-64
+  extends: .qemu-smoke-x86-64
   script:
     - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee ${LOGFILE}
   needs:
     - debian-bookworm-clang-debug
 
 qemu-smoke-x86-64-gcc-efi:
-  extends: .qemu-x86-64
+  extends: .qemu-smoke-x86-64
   script:
     - ./automation/scripts/qemu-smoke-x86-64-efi.sh pv 2>&1 | tee ${LOGFILE}
   needs:
-- 
git-series 0.9.1

