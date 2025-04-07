Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3043A7DDC1
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 14:34:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939840.1339860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1lga-0007lt-SF; Mon, 07 Apr 2025 12:34:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939840.1339860; Mon, 07 Apr 2025 12:34:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1lga-0007hz-LT; Mon, 07 Apr 2025 12:34:44 +0000
Received: by outflank-mailman (input) for mailman id 939840;
 Mon, 07 Apr 2025 12:34:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uyK1=WZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u1lgY-0006u9-Ql
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 12:34:42 +0000
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad007bc2-13ac-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 14:34:41 +0200 (CEST)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 75CD8114013D;
 Mon,  7 Apr 2025 08:34:40 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-10.internal (MEProxy); Mon, 07 Apr 2025 08:34:40 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Apr 2025 08:34:39 -0400 (EDT)
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
X-Inumbo-ID: ad007bc2-13ac-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1744029280; x=1744115680; bh=H8oe0eacfK
	xNq01LDLqm7MI0DtvxX6f0297Icu1U3B8=; b=C6VUBfMRLQiEiap58n4T6sRiEc
	4g0pix3/KoV2e4fZU+4BI2IGVoqa+KdhirXYzhtRPjSUrlVl58Lh50az/hqLVXL3
	UovN60897MyznrWb6THLBlKWZvDewZdato/R8MzvPzMXbvnV5Ncigb3B0j8b8MMz
	J6XLjTqt26jSG6wBMpoo/xxKD70hkP5lpYMKoUxjm1VcneKObujGFj+w1Ksrfpsx
	5T5vvELmDAAW0SklphHOy2WvDfTDlufuzpxIzjPUfyNGrkjRhuVQOdIoOjws4ZT+
	g93EfJCu7ZvA46KdkLxuouBlF0iM7OnZi25EFhlMtB7QOl6Rl+yvnijdP2+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744029280; x=
	1744115680; bh=H8oe0eacfKxNq01LDLqm7MI0DtvxX6f0297Icu1U3B8=; b=G
	0RWU4Z2O4M6bGXGnM8I6fXt8DqRJCmtrYUjWcGTPWK19KefHhM3xvUgNkvzl2lEv
	xmXQclFZZB6Ik5yZQgI9wvUMPDYaWnJoCGkPpm/BSYtNhHq9KSvn2CYI3sYIL+wf
	ZKvdmQXZ7xN+84Vc4doHHHVp0bN6cDpVsXxd1IY9Y0RJFu1VtObxAJuyCcSUTG98
	uRighQYCH1Y2EAlYOSwUm417poPntTYD/8umaNR9uZTg03MaSefqjMEhI7P5Z5Oa
	LhuN+755xFHlKNZ+uGcgfzSVp9KuZnXDnVG403HmmH3Yj+GleKqMvBvhX6ojhW+3
	WaZwEMj/3jYFrdMK9+wTA==
X-ME-Sender: <xms:YMbzZ1NQZ---u82Ps8b6iF4zN--4xSH7lXNmeDF1viBQvKTz5e4zeA>
    <xme:YMbzZ3_hoQ8nOOL2UUVaVp7PevslI5gMqDGYBNmo60O8bBTWi_GNfpgqpkeuBJxV6
    aqIKUZoMuYysQ>
X-ME-Received: <xmr:YMbzZ0R1-RJH6Gz3Oo9aEJGXQAUQYlNmaXS1eL25rE_wYNZdoOtXxVZSWU3Nmv2dltbIQ7cllmG4G2MunlOswjVoDdBtXZVpdyMtWhffmG6iuErgtGI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkih
    cuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeen
    ucggtffrrghtthgvrhhnpefgueduhefgvdefheehudejheefudevueeghfekhfehleegve
    duteeuiedugffgffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeig
    vghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtth
    hopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhr
    tghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eptggrrhguohgvsegtrghrughovgdrtghomh
X-ME-Proxy: <xmx:YMbzZxtyJYsbtV1KdzN9Ocdm2GJNCrguD8H_63uU3N09i8868JqTag>
    <xmx:YMbzZ9ebnboAMgoCjtVd1sPc6LNuOq9AMzTJwy3BN1az5hTCSOF5DA>
    <xmx:YMbzZ90gOawql497sk7TNJM6Hw9CcabPoEvgz9rlVhTl3JOHvKQcXg>
    <xmx:YMbzZ58dMwwGn4rnjprlPZ0Y-FzCWsMVmTtY2KGa9HKxRevsGBOi8w>
    <xmx:YMbzZ4nt6IVstbsE_fP1kO11DAVIjOdVNX6UNmh5PvHFIl1vLZuAK0rD>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 06/12] CI: consistently use DOCKER_CMD in makefiles
Date: Mon,  7 Apr 2025 14:31:06 +0200
Message-ID: <3e28c1267125641ed3212c0366678474692913b2.1744028549.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
References: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This allows rebuilding containers using podman too.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 automation/build/Makefile           | 4 ++--
 automation/tests-artifacts/Makefile | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/automation/build/Makefile b/automation/build/Makefile
index 4df43b040777..fedf7524dacd 100644
--- a/automation/build/Makefile
+++ b/automation/build/Makefile
@@ -31,8 +31,8 @@ clean:
 define CLEAN_RULE
 .PHONY: clean-$(1)
 clean-$(1):
-	if [ -n "$$$$(docker image ls -q $(REGISTRY)/$(subst /,:,$(1)))" ]; then \
-		docker image rm $(REGISTRY)/$(subst /,:,$(1)); \
+	if [ -n "$$$$($(DOCKER_CMD) image ls -q $(REGISTRY)/$(subst /,:,$(1)))" ]; then \
+		$(DOCKER_CMD) image rm $(REGISTRY)/$(subst /,:,$(1)); \
 	fi
 
 endef
diff --git a/automation/tests-artifacts/Makefile b/automation/tests-artifacts/Makefile
index d055cd696bed..80a60a94f3f7 100644
--- a/automation/tests-artifacts/Makefile
+++ b/automation/tests-artifacts/Makefile
@@ -10,9 +10,9 @@ help:
 	@echo "To push container builds, set the env var PUSH"
 
 %: %.dockerfile ## Builds containers
-	docker build --pull -t $(REGISTRY)/$(@D):$(@F) -f $< $(<D)
+	$(DOCKER_CMD) build --pull -t $(REGISTRY)/$(@D):$(@F) -f $< $(<D)
 	@if [ ! -z $${PUSH+x} ]; then \
-		docker push $(REGISTRY)/$(@D):$(@F); \
+		$(DOCKER_CMD) push $(REGISTRY)/$(@D):$(@F); \
 	fi
 
 .PHONY: all
-- 
git-series 0.9.1

