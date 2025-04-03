Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2384A7A19C
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 13:07:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936480.1337773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0IPT-0006qE-MR; Thu, 03 Apr 2025 11:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936480.1337773; Thu, 03 Apr 2025 11:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0IPT-0006iC-GZ; Thu, 03 Apr 2025 11:06:59 +0000
Received: by outflank-mailman (input) for mailman id 936480;
 Thu, 03 Apr 2025 11:06:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X4pi=WV=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u0IPR-0005Qy-14
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 11:06:57 +0000
Received: from fout-a5-smtp.messagingengine.com
 (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0348d85-107b-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 13:06:54 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfout.phl.internal (Postfix) with ESMTP id D35A713801AD;
 Thu,  3 Apr 2025 07:06:53 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Thu, 03 Apr 2025 07:06:53 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Apr 2025 07:06:52 -0400 (EDT)
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
X-Inumbo-ID: c0348d85-107b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1743678413; x=1743764813; bh=zB8SYUejsj
	xVpp7vu0rfC/8v4/UKO9Q5zziXn7Nf5Cc=; b=RJRJZshtwQQB4i75TEbi5B8aZ3
	u0T072LSXpLC59VFNreScrCU6S1SXCTq9RPRaoRPlSqxrJbcFLU/H9TmL+Ug7VRX
	UXovDafvcKgRbLVxAY7Mhu0itgKPDtVXiTirNVvUw2tCd9Xib8YVatjeeMI25CKj
	3mWgEjUl8Oi/oXBEyycxcIY/ohgXOHJ26M9YKksfD/cBnSQeSVGvvdNuHzZp/1sL
	DAA5p63o7LuTNshGP5iq70r14ydJIFxjG7z9P+iTBNs49u6L0r5vu2WlFDOlPQ8Z
	aTSMfMWlHl4FYGWS/7PUYB8fKNp2YgenaLYYwYCHZUiwV/ibG6fa/qto5DTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743678413; x=
	1743764813; bh=zB8SYUejsjxVpp7vu0rfC/8v4/UKO9Q5zziXn7Nf5Cc=; b=A
	S59ilIQdFO7NifDOjIq79NXxSOgG4Lhd/2N7ZMesAc+sL9Wx9GIFiyYUSf/u3tF8
	mrrDH2d3nr7Reci4h6boKM9CcL+8hkhiBcvObVLmp0ovYIthuSM5eqdrSpBFhIAs
	HVONa7K6R9fArfaeQtMsKxUc0WCr5+MIMv8RRGTBHTaOLVSwoG3C4f6+ZOVLac0A
	VKSpmfa11BEAnQk1I6qFgecWJAzYIjbjTT6AK/8Ck16vl0IdF+JJpQrUcAs/xhK7
	mt+uf/xeQ0nr6vQMnYmwaFbR2gUrn7RudFPbI9m3x6/1/xT+JO85q1Katv15UKx4
	b1PlgWtxRkQNQ76DISS2Q==
X-ME-Sender: <xms:zWvuZybvegUU5rw7A7dtqpcLsxqazL4tg6dSvEEdhWITjSTxIKgHzA>
    <xme:zWvuZ1YTMnsqTvXreomNkGfg3FGXv4GFfIah29XD6F5QAqtDg9vc5xMtcuEPL5JnI
    6hIt4Qrdtfwqw>
X-ME-Received: <xmr:zWvuZ8_XWdAJLo17DcHL9rmguE2sPg_9CwHBpyxQJsUljgg1yQ1c94tlWhcLFcUNOqG5H3SjxCyFIA-dZqDRRl1m9zHT_w-zKkowIcBTNLhM6Gu_eo4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekfeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkih
    cuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeen
    ucggtffrrghtthgvrhhnpefgueduhefgvdefheehudejheefudevueeghfekhfehleegve
    duteeuiedugffgffenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeig
    vghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtth
    hopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohep
    mhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdprhgtph
    htthhopegtrghrughovgestggrrhguohgvrdgtohhmpdhrtghpthhtohepshhsthgrsggv
    lhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:zWvuZ0pJ3Cegnol_Bklbdfv_5v4S-I9NqH8_raefBdQlWd0bdpn9dA>
    <xmx:zWvuZ9p0H9vO4_EvprhuluD4Iv_slrKgOC2jlh9x2I3anW5tByGGwQ>
    <xmx:zWvuZyQ5P9UjY8BeGNLmDAYa2sjvK1RvfFYolTyOMq4XIwob0Ygt5w>
    <xmx:zWvuZ9o9D_HTFhLsf18SnDA6fMftDnsaur9rAswkzD-Jxej2BLIadg>
    <xmx:zWvuZ_hJn0iJeNRzK7_2lkIABNgeBltJ25ECLifm_fPwQTAnLScaq1_9>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 06/11] ci: consistently use DOCKER_CMD in makefiles
Date: Thu,  3 Apr 2025 13:04:41 +0200
Message-ID: <72551291927c75a97657890df15138579f1543ac.1743678257.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
References: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This allows rebuilding containers using podman too.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
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

