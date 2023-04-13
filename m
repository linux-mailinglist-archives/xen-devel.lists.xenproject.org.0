Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E202F6E0D66
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 14:25:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520672.808510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmvzb-0007e4-8s; Thu, 13 Apr 2023 12:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520672.808510; Thu, 13 Apr 2023 12:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmvzb-0007bK-5C; Thu, 13 Apr 2023 12:23:59 +0000
Received: by outflank-mailman (input) for mailman id 520672;
 Thu, 13 Apr 2023 12:23:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Tzi=AE=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pmvzZ-0007bE-4X
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 12:23:57 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cf44ba9-d9f6-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 14:23:53 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id AA16B5C0144;
 Thu, 13 Apr 2023 08:23:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 13 Apr 2023 08:23:51 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Apr 2023 08:23:50 -0400 (EDT)
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
X-Inumbo-ID: 0cf44ba9-d9f6-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1681388631; x=1681475031; bh=H4jzTRmNuiASiivtBudmUIm91
	iIj5Qc7O7FtvJTdyD8=; b=TfRjBKIgdBL7hNfjovnNfQRebm+pnn6643rTt6zN6
	hmOIAYHIDKTmkVCxqvCGSRkU/97NrBgurbkS/Bx3ZW5aIIrzICo8NSsoXpQb7RS5
	WQJV5SsohhCSHRlPaBg5ke3iVdnvn1+aQGN9kz42dzsfc9JI2P1iCjBVALhsKbvw
	lx3kF3ixRjIViG9yEQFtZIDk8K/zY4zjVlJm1ffCc+i+Om55H2KZsi587N40AidW
	c/Vx6f/4ClhHGoFsd7eweK6T9hdCFQSqp9UKSdJltWUi8jJNLXWc15JSo3SH38vV
	BcVOe5QNqfKzR1idOf/1mSpgMo7JFBVOBH6tknRXy5GKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1681388631; x=1681475031; bh=H
	4jzTRmNuiASiivtBudmUIm91iIj5Qc7O7FtvJTdyD8=; b=eVzccDoe7Ibp2jJk8
	bxkVqCUXlUoQoSyUp7pnReWWGm+B8bHaGSSWpCRcxK1Ti7h3MeEj8qy5EQgELeu3
	FnnRuNp6ZcICWOeRdY4LN02qMnBTqLljZTXP/25OlgFw0bo5H0cVTmE+qrRM5xAG
	jrAqA9pqM2FgOq1+/+CttkMxD8XOexbWD2lMHkXHeRe3pH49yzXCEFhpPimFCi1h
	YWgzDclIo+JMrM0g1NbuodR5MY91awqMO8KwkZg+wLOsGPtTfEk1gbAnJH0s3eul
	YlGWTvllExR/bfvDVQtoLL9PylEuLASWNHcPRKKBaAXDC2XKlg7QCeGA9/z9n87w
	vU+jw==
X-ME-Sender: <xms:V_Q3ZFgubhNfvhCNcVsV_DCvmywmtX-OxOuOfR237JVudAuD4iazTQ>
    <xme:V_Q3ZKDnopSvjpM9_-WHhdnaOsyScBmY5PO9MZLR7h6R-xy8-3_OwZYAHTmAW8c8v
    AhcRGgckU0hLA>
X-ME-Received: <xmr:V_Q3ZFG3VuTUIRvH7xON0MDOnEofU69aVo5SukgOD5s2uExhk-YmZu22upOmjPUEscO0jZa-g0BJKC6_JiItVSjpWX_3qg55jFPYkzx4ARcffYbI1DP_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekkedghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelkefh
    udelteelleelteetveeffeetffekteetjeehlefggeekleeghefhtdehvdenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:V_Q3ZKQ_LqM9TO7SRX2hK3B2oNwBgzu-tRIoKXVDkpqEVR6Fp2aqqA>
    <xmx:V_Q3ZCw1UifwQ_qbr-QT89uwtlliZ623aSCdJyEBpuggSWIx3L7hGg>
    <xmx:V_Q3ZA7IPEd9xYxL6Zd0NeDhkSiOsGU1vPogzdqaJmmjK7vsCp0npw>
    <xmx:V_Q3ZHobiOzXraln3nsJJPFomkHh-HkH_wJGG_mjTx8U4Z-e3TUXig>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] automation: switch ADL hw tests to debug build
Date: Thu, 13 Apr 2023 14:23:40 +0200
Message-Id: <20230413122340.47233-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This should give a lot more useful information in case of a failure, and
also enable some asserts for extra checks.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/gitlab-ci/test.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 0916b367ea90..d68c584269dd 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -131,21 +131,21 @@ xilinx-smoke-dom0less-arm64-gcc:
     - *arm64-test-needs
     - alpine-3.12-gcc-arm64
 
-adl-smoke-x86-64-gcc:
+adl-smoke-x86-64-gcc-debug:
   extends: .adl-x86-64
   script:
     - ./automation/scripts/qubes-x86-64.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.12-gcc
+    - alpine-3.12-gcc-debug
 
-adl-suspend-x86-64-gcc:
+adl-suspend-x86-64-gcc-debug:
   extends: .adl-x86-64
   script:
     - ./automation/scripts/qubes-x86-64.sh s3 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.12-gcc
+    - alpine-3.12-gcc-debug
 
 qemu-smoke-dom0-arm64-gcc:
   extends: .qemu-arm64
-- 
2.39.2


