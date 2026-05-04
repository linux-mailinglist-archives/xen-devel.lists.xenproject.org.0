Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NxuLBCV+GnnwgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4EF4BD2A6
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299779.1574398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgT-0003z3-O0; Mon, 04 May 2026 12:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299779.1574398; Mon, 04 May 2026 12:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgT-0003w9-G8; Mon, 04 May 2026 12:46:01 +0000
Received: by outflank-mailman (input) for mailman id 1299779;
 Mon, 04 May 2026 12:45:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wJsgQ-0003im-VN
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 12:45:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJsgQ-002Q9j-Ak
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:45:58 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f89502-2eae-0a2a0a5409dd-0a2a450cd58e-12
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:45:58 +0200
Received: from [202.12.124.146] (helo=fout-b3-smtp.messagingengine.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f89504-62f1-0a2a450c0019-ca0c7c92868f-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:45:57 +0200
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.stl.internal (Postfix) with ESMTP id 343A31D0007D;
 Mon,  4 May 2026 08:45:56 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Mon, 04 May 2026 08:45:56 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 May 2026 08:45:55 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1777898756; x=1777985156; bh=ve9wb5iJ3q
	hyIrumeuNlQiZMz9wNHWfL9RFUX8Adii8=; b=RPsStvbo/PzmF5TMgHDYeNxsTF
	M9JOlM3b4J+U9ucy6AUqnAsapi5bl5jH4Eule8j3uFS/Thr4FQ1ts9u2uHoTlc+r
	iBX0g2e1yRYB56HAxtKmHkvS3pPEinTSXTuDg7XgDvNDZqAPi03TGbSefopQ6rR3
	LMrKmQiLAkjViTXP4XsZaYOb9ayWTTvtZD1k7RbMOp/nzTobxn1GF5hD1qhS1MCL
	O0LVYdf8LsD+PBF8oErHvc7/odyIsC26tkb9xMTPHRXrBVdunePfSciquG0FrOrm
	t5sN717mpNrtXTGXU4U/lyWhz3PSFi7PBDwCaXt0rJ7N8puO5PiIPyxJFaOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777898756; x=
	1777985156; bh=ve9wb5iJ3qhyIrumeuNlQiZMz9wNHWfL9RFUX8Adii8=; b=J
	lUijjRKDLhGzu3x0aZAlLpDHDDsGEK+Z+clfWVayU0FY01mu44kuZiEayx9iYKI+
	KJmTi+jKdMpuXLauRcIMc1kgu4uG+QwuWxczX4GUhHbfG8l2iSjV3jf0lTxyyFdn
	DHoknauGxZatFr0MPlucOIH/qCHprqKZy0BWxb0x2lazGgNzbazyAZ/E4UC2xpEZ
	6FZNQTmaxAui9sC5rJvGFn2Xu/VqMgPODkLutHU/EVc0xV9xmIDFrYw9b5mLhax0
	JgDZFKkdQbTgFUyu7Xe7trAcedwWmAc3YMPuotEa+nsBkXItQUmIeMeeMnaa/JUC
	Y7PCdyJ4o1bznqKTKG4Pw==
X-ME-Sender: <xms:BJX4aU13NEBncIpgc6pFO5fzVJJujIerv-tw8DzXWv9oUi2L7WWS6g>
    <xme:BJX4aV_grlXtr_fGWdu7Q8X3ianLWhzmuZM-7WEpE6HLLXaEPiyagQtB3JJRuGury
    wP1vi3ON_qCjmmiQt45vBr7QijJkXEHPVTnpRx8sSXm4OZpBA>
X-ME-Received: <xmr:BJX4aVN1sXVpHY_3Snp4sCNSyskvJoZykb086iI_q5Fx7MVTgIMTVzvwaSx6o2fTN26dEsVQ7nSlgKrn7WbCK7RwcDAa5okgyVogYMZcD-M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelkeekjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepffeitdeg
    veffteelvdeghffhvefghfefkeelheeujeejgedvvdfgffejuedtvdelnecuffhomhgrih
    hnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprh
    gtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghp
    thhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprh
    hoghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:BJX4aZewHDTIk5fZxvMVNoQUGcG8PrXvs7-R3DupygNU-mJiZOhowA>
    <xmx:BJX4aUWXKOlywvLD7ZANrrqh5Wy_xKd0d6hAQLZS-itLMzVesUAMYQ>
    <xmx:BJX4aRjAyAu6mwJQVnVBFSeWY3mNUBJFB4CWlpAJlz5ZwpAcCA1PVg>
    <xmx:BJX4aT-iaJ0LWYgpLwKkKXWwdpUgpMyl9dFE5iKl8NBwhttc2CMauA>
    <xmx:BJX4aawKrsd5meplNHDzItJJPdGV7TZ4zr77fU5Wnn4ExyTzjHzOlkX9>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v4 09/13] Add trigger-test job, to run test on a Linux built from a branch/tag
Date: Mon,  4 May 2026 14:35:48 +0200
Message-ID: <4fdfa09a7ff699f5d51ab9beb95b18ccbd0c0be3.1777898148.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
References: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1777898757-F7015CF5-4F876756/0/0
X-purgate-type: clean
X-purgate-size: 2195
X-Rspamd-Queue-Id: 5C4EF4BD2A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:email,invisiblethingslab.com:dkim,invisiblethingslab.com:mid,messagingengine.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]

When scheduling pipeline in test-artifacts repo, it can get also
TEST_TRIGGER_REPO and TEST_TRIGGER_BRANCH variables, to trigger relevant
pipeline to test just built artifacts.
Pass ARTIFACTS_REPO+ARTIFACTS_BRANCH to the child pipeline to ensure it
fetches artifacts from the right job, but avoid xen test pipeline
inheriting other variables, as they might have unintended consequences
(for example REGISTRY one).
For example, to build linux-next and test Xen staging on it, the
pipeline could be triggered with:

    LINUX_GIT_URL=https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
    LINUX_GIT_VERSION=master
    TEST_TRIGGER_REPO=xen-project/hardware/xen
    TEST_TRIGGER_BRANCH=staging

The triggered xen test pipeline will skip most build jobs.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

---
Changes in v4:
- add inherit:variables:false
---
 .gitlab-ci.yml | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 3ba8a31..b3c2b65 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -4,9 +4,14 @@ variables:
     description: "branch/tag/commit for the linux-git jobs"
   LINUX_GIT_URL:
     description: "git url for the linux-git jobs"
+  TEST_TRIGGER_REPO:
+    description: "gitlab repo on which test just built linux, for example 'xen-project/hardware/xen'"
+  TEST_TRIGGER_BRANCH:
+    description: "branch in TEST_TRIGGER_REPO to test on, for example 'staging'"
 
 stages:
   - build
+  - deploy
 
 .artifacts:
   stage: build
@@ -115,3 +120,20 @@ linux-git-x86_64:
 microcode-x86:
   extends: .x86_64-artifacts
   script: ./scripts/x86-microcode.sh
+
+trigger-test:
+  stage: deploy
+  trigger:
+    project: $TEST_TRIGGER_REPO
+    branch: $TEST_TRIGGER_BRANCH
+    strategy: mirror
+  inherit:
+    variables: false
+  variables:
+    ARTIFACTS_REPO: $CI_PROJECT_PATH
+    ARTIFACTS_BRANCH: $CI_COMMIT_REF_NAME
+    LINUX_JOB_X86_64: linux-git-x86_64
+    LINUX_JOB_ARM64: linux-git-arm64
+    BUILD_FOR_TESTS_ONLY: 1
+  rules:
+  - if: $TEST_TRIGGER_REPO && $TEST_TRIGGER_BRANCH
-- 
git-series 0.9.1

