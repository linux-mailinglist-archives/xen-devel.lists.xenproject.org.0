Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1A07563DE
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 15:10:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564531.882010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLNz1-0004jF-Jj; Mon, 17 Jul 2023 13:09:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564531.882010; Mon, 17 Jul 2023 13:09:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLNz1-0004gR-Ft; Mon, 17 Jul 2023 13:09:47 +0000
Received: by outflank-mailman (input) for mailman id 564531;
 Mon, 17 Jul 2023 13:09:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lGkF=DD=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qLNz0-0004gL-7X
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 13:09:46 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3178706a-24a3-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 15:09:43 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id CF87F5C010E;
 Mon, 17 Jul 2023 09:09:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 17 Jul 2023 09:09:41 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Jul 2023 09:09:40 -0400 (EDT)
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
X-Inumbo-ID: 3178706a-24a3-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1689599381; x=1689685781; bh=mpvWE9oHvqFP1EWwyWR59TenP
	vomXtGlD9kPruGRJDg=; b=rhvxBv+vJyC8ed2GgfjP17wMDFN49H/rNiQWCOovn
	I68JFG+qlpsQ5huocJz5TQVROpP2RpdO6V8NidTYSiytv6LUsAIvUCZaC1UwoRnY
	aNXDQDxZZ9MB+Naml7X7lJkeXC9d2Be0wG+jAHx+j/6WFojD1yBktr+BEOkspuTp
	E+nWCgJZT2yOxTDgKt5SBT7yLEsdn5fnh8bU4BeB4EP7fhn83drzXqPcvCqw5//2
	IGD0Dq0g/8yDS0oQYnrlj8ZSooEc5OXMnHdJcoiLXkNubDt3x2UDyJAEih9KyYds
	ABhdwoc2CpSMEs5nRDUKT+e0KEntDhdQVfBe6Ikn3F6/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1689599381; x=1689685781; bh=m
	pvWE9oHvqFP1EWwyWR59TenPvomXtGlD9kPruGRJDg=; b=CYSZuv182dZCbBUC3
	ajeC5ZOBpx/fqS/dZk34alwR7qnDFTP3QG67nV/VikiSabcLg3cWzOHQ1uMpgjpT
	dVCE4iIWLS4X+PLS6qkpGBM5uYPyfd0h8jEQR5i97iVA5vAayzxbPmDTiBOvOlYp
	/kM/6kM8FWWfgwrS7LhQo/RBolkmtvAIa3ZFl4FUPtCyhEYVM+AKYWJStnhJmPqX
	ygxk8vw+aT8m66dHGhlVsIhoN2uNbx0NoDNL28ariZY6vCdnteT8MBVq7eQk2SdT
	LpGtbXOekfmMy5JWvYLGfznoSVmxZA5UyFdJ58qB53ph7NjwChjlx+/AMRZoGKwD
	OGkHw==
X-ME-Sender: <xms:lT21ZHSEW8i9Q0SDbpyddZeeA9ZhGDDjtz_XLzh5riWRtuwRYm1ENw>
    <xme:lT21ZIy53YK2ltSeLeniyy8i3tfCvelEGUhiytYqzceth6XabyGb43uTpP7pv4AP3
    KPZVMNdtG5nBw>
X-ME-Received: <xmr:lT21ZM0gjFlPhSyQPsen3ZckyXrBv-aiUHuRFteLzozbb2l3P992mxD1DfbPoCqy5N18oY2HvMz-yaNMwSHRCJnc1Fswq2yneI9QsKZ6OI7lMedJvC8->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgedvgdeitdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleekhfdu
    leetleelleetteevfeefteffkeetteejheelgfegkeelgeehhfdthedvnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:lT21ZHCRAU4RjE5MA32CoZDyQf8dNXGlfUH3oCqaaEQ6Ty4Z0YU8aw>
    <xmx:lT21ZAhR2Q5vf34oQRsmtdUwu-WwYYM2XBQ8Z8qDtQKCE_EyOyHLVQ>
    <xmx:lT21ZLpMm7XkPvMLiLyjAj65Po1yOdu2med67YYNiGv-Wprz6W0FVA>
    <xmx:lT21ZMZaD7iudbpRXXlWUCt8vga4P2QespsGu8UAslF0GwIz-ti6Vg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] automation: avoid duplicated builds of staging branch
Date: Mon, 17 Jul 2023 15:09:14 +0200
Message-ID: <20230717130925.28183-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

"staging" branch is mirrored (automatically or manually) to several
repositories. Avoid building it several times to not waste runner
resources.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 .gitlab-ci.yml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c8bd7519d5fb..c3b05e32636b 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -2,6 +2,12 @@ stages:
   - build
   - test
 
+workflow:
+  rules:
+    - if: '$CI_COMMIT_REF_NAME == "staging" && $CI_PROJECT_NAMESPACE != "xen-project"'
+      when: never
+    - when: always
+
 include:
   - 'automation/gitlab-ci/build.yaml'
   - 'automation/gitlab-ci/test.yaml'
-- 
2.41.0


