Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDTRHpCul2nO5QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 01:45:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0290163F59
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 01:45:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236771.1539307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtEcf-0004rz-0c; Fri, 20 Feb 2026 00:43:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236771.1539307; Fri, 20 Feb 2026 00:43:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtEce-0004pA-T8; Fri, 20 Feb 2026 00:43:56 +0000
Received: by outflank-mailman (input) for mailman id 1236771;
 Fri, 20 Feb 2026 00:43:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8OLq=AY=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vtEce-0004p4-1f
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 00:43:56 +0000
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a9c3b86-0df5-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 01:43:53 +0100 (CET)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 2974D14000A4;
 Thu, 19 Feb 2026 19:43:52 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-10.internal (MEProxy); Thu, 19 Feb 2026 19:43:52 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Feb 2026 19:43:50 -0500 (EST)
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
X-Inumbo-ID: 3a9c3b86-0df5-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1771548232; x=1771634632; bh=hKubb8dOWuRmnUzSNPpGPvNmcUjoXCor
	aP1dW3dZk0k=; b=PhPJmpqWdGXWw/XmDL5uzUT7/7ulhjaf15ogYHYWuqm7HQVe
	hqdpx0CNaG5H5Oiv8Qs7JIFerWf9nnoj8+s8c85g6M2yAfcFVu2V7HQdsk8cTI2s
	OHXJLJGVQoRC8jAG6EH0ojG02hdTSBZiaUWxthXomlbS+vL/5c/hiC8fzTmQhL29
	kgEtclVd38nkAATe7FCX+r/w6GHIiaaQ1YGfIhZLhREyWC6Z+14cwGZPt4K8NDzW
	JBiDx3O5MBMlpMH+yiy9trxRkZ770gzOIwi2/4WrRQIO6CG+zcFxQJMrd4mjG5Sq
	es/BG+O/axmWZtpO1F+jZHqPphKnlP7yvQikQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1771548232; x=1771634632; bh=hKubb8dOWuRmnUzSNPpGPvNmcUjo
	XCoraP1dW3dZk0k=; b=U4FfCmFIOXHlemHrHV4SGCJfM56oLzR3UO+7VSyTNW11
	Ic0F48FB2r3W6tIgolKSPGowZBqovQjow5+5vwkQYFB6xVZ1wvmA/C4xweifc8T/
	fXHMZHGdL7OlsCC5grcucdJGy3gc3c5H3fNaM4iUgy9L9K2jnLzMTdLN2P3PAMsR
	UKuWFaDmcyWyBvJPEq2LirJcCzrKOUoasYvjWyc9h8+7FLYIVNLBmZ4pliM77aj7
	ZaDVIdr0dwjTR9D/pY+DGFLEGGL4rQomOC9CXUBmopXKnmIiTkqdi5lBuj3vjpXg
	HY2pJGKhv4ztNY44p+msZIJjYLYrRgeEmy5BRFMz1Q==
X-ME-Sender: <xms:R66XadLjf-C3mzEwvfQQVfg_W-rOHnM2-iAwq-T57XQYaDLVYSNgaw>
    <xme:R66XaQmkjFCBs57kYSTDCe_f_sJJUer0_X7yYZlxbWkljyMyQLZOIxXv6919muXt-
    pMalchOxBoLboSduIgfFnJ8FZDYp9hOC2IguJvBkNmY5wKihA>
X-ME-Received: <xmr:R66XaTH2C-L6mcu2P5PzXXY0wGggkGs1RoifnTXunPV8JGXuX97vf1CQ8cYe89ww3dab-YESXTYCKf3k0Wb-EeofqiIAuiLqWy8uMvSEVlY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvdejtdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelkefhudel
    teelleelteetveeffeetffekteetjeehlefggeekleeghefhtdehvdenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeefpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdig
    vghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghpthhtoheprghnthhhohhnhidrphgv
    rhgrrhgusehvrghtvghsrdhtvggthh
X-ME-Proxy: <xmx:R66XaYFcPlp2osPVETYh7A2wsoOSxia8rTV4VmaevthwmFr2oNQSrQ>
    <xmx:R66XaYPE9gLSIUJ4nRuc0QFltRvDyi-9xJVtakzC0ie1d9HwyC5skQ>
    <xmx:R66XafHe9MTJZpxRxh9wzENtt1H-o9DqOk_Z9djLDPPZBdh3rXXTqQ>
    <xmx:R66XaXN8js4h5RWRwrHcR-gJxgO-DZhrXfbTBPY1Vh9LqBNu-gzNIQ>
    <xmx:SK6XacJNuYLi8nh72JqrABLp1kb4JIKs0bJbtrsIrXuO0BOKjNuJUtWF>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2] tools: specify C standard explicitly
Date: Fri, 20 Feb 2026 01:43:21 +0100
Message-ID: <20260220004344.1980775-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[3];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:marmarek@invisiblethingslab.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,invisiblethingslab.com:mid,invisiblethingslab.com:dkim,invisiblethingslab.com:email];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: B0290163F59
X-Rspamd-Action: no action

Archlinux just updated gcc to 15.2.1+r604+g0b99615a8aef-1, and that
defaults now to GNU23 standard. This isn't what Xen codebase expects, for
example libxl fails to build with:

    libxl_cpuid.c: In function ‘libxl_cpuid_parse_config_xend’:
    libxl_cpuid.c:447:16: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
      447 |         endptr = strchr(str, '=');
          |                ^
    libxl_cpuid.c:452:16: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
      452 |         endptr = strchr(str, ',');
          |                ^
    libxl_cpuid.c:454:20: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
      454 |             endptr = strchr(str, 0);
          |                    ^
    libxl_cpuid.c: In function ‘libxl_cpuid_parse_config_xend’:
    libxl_cpuid.c:447:16: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
      447 |         endptr = strchr(str, '=');
          |                ^
    libxl_cpuid.c:452:16: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
      452 |         endptr = strchr(str, ',');
          |                ^
    libxl_cpuid.c:454:20: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
      454 |             endptr = strchr(str, 0);
          |                    ^
    cc1: all warnings being treated as errors

Specify GNU99 explicitly (same version as in the hypervisor, but the
GNU dialect), to fix the build, and avoid such surprises in the future.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
As discussed in v1, I'm changing the standard version for now. Note GCC
14 used to default to -std=gnu17, so that should work too, but keep it
consistent with the hypervisor.
The v1 that adjusted libxl can be used anyway, but it's less
backport-friendly.

Changes in v2:
- revert to old standard (specify it explicitly now), instead of
  adjusting the code to the new standard - this way is more
  backport-friendly
---
 tools/Rules.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index d9b9c740e964..de9100eb1681 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -38,6 +38,8 @@ ifeq ($(debug_symbols),y)
 CFLAGS += -g3
 endif
 
+CFLAGS += -std=gnu99
+
 ifneq ($(nosharedlibs),y)
 INSTALL_SHLIB = $(INSTALL_PROG)
 SYMLINK_SHLIB = ln -sf
-- 
2.51.0


