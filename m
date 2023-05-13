Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B95F7013E4
	for <lists+xen-devel@lfdr.de>; Sat, 13 May 2023 04:13:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534120.831392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxel3-0002iS-4f; Sat, 13 May 2023 02:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534120.831392; Sat, 13 May 2023 02:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxel3-0002gb-0n; Sat, 13 May 2023 02:13:17 +0000
Received: by outflank-mailman (input) for mailman id 534120;
 Sat, 13 May 2023 02:13:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cp9A=BC=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pxel2-0002fe-D6
 for xen-devel@lists.xenproject.org; Sat, 13 May 2023 02:13:16 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6fa99e3-f133-11ed-b229-6b7b168915f2;
 Sat, 13 May 2023 04:13:14 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 32B6A5C0231;
 Fri, 12 May 2023 22:13:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 12 May 2023 22:13:13 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 May 2023 22:13:12 -0400 (EDT)
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
X-Inumbo-ID: b6fa99e3-f133-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1683943993; x=1684030393; bh=ay
	lMptUMLdF12TA37xOr+bDz6DV0R1SEAD/bYg58y6E=; b=XEdrt2ZU6/us5vvKWb
	+Vrmfv3rX8tyHa8pm9Iq5OCqN8d69JxQDXTkD1RV2fggrcdWMknuqerm0XJcy1IY
	VTfL85bmIoy6tNMwqomQZHu7j8QsyUAAPw5AF+HujaDM/zYeSVXpsnL0yMDOt6h1
	D7QWvbmSVW8n7fOdsW/B7Vd635zUj+TyHpy4HgK8ZRA2KBv0zQlkRDs4ErD2NXDc
	xB0oW4GgfjTjCScfb1H6eH6yNrIhSL0l9oKDAgC4aH0H4ywk5WZ/gxtXQZTuiArj
	le95jv6JLWd4HP6EE0TF9GUyVNzvmmIj/+W51Remkgnyu1kIfGL2h05JqR0ZUqkS
	ryCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1683943993; x=1684030393; bh=aylMptUMLdF12TA37xOr+bDz6DV0R1SEAD/
	bYg58y6E=; b=CXJ5loGABaYuwfyZCLKTIxczIpcPUfyuCc+hPoZM25xtDpAQ7Tl
	M10t4pdOLyH+fuejaWWwFIfcSr7CNURo8SIJqCVpkJNjKWEfiPtq36gEabeOIqMg
	lQLju9jAIxHAUYpHZ2HrC7KTtHGXKQxNhTt4cMh+SIbhBvPiBpLzAFsbmCfVRIdx
	K8MkfpmEdVDWPXIz4+UdQ8kXAdbeeCa8IDuo5mU4elJ9KKrgNC1921/Zfhj280Vc
	8FMRLhhbWFmd/hWjU401fXOwE8LwYQoXF/8Tv9jZOZ+Zt2G7ogop37IHHsOUjKra
	aa50mOqk2lCVMaDPcJl7WSbVYwuaRZCHxvQ==
X-ME-Sender: <xms:OfJeZMSHBwKgeqIINQP_21iXHJ-jYrhVZscnuYixdnC7g6nvDcyiLg>
    <xme:OfJeZJwC1Qmr8uK36YzzLRXaus0mxozmLr0-yuOxdiuYg8hGKL1zoIGILNVrh8g-V
    HJTpM83MrG8gA>
X-ME-Received: <xmr:OfJeZJ2cOjeVEonY7N3hu9FHDVF-YavDo5fI3o2ewHW0IxmasMuaAYroTAUwwL05-ZkcapT0T6YGgx40A1_fS4BIVcBZQOlR96lHLk7C2fTwvNVFumOl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehuddgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:OfJeZAApSfin5-NhX3OLy5xAaWHaEwMeu7e6GzYGH54PsgzuhT5ahw>
    <xmx:OfJeZFg5QHobZwdwDJCZAhnocloyAxAAoLZECk17CHLheNZLwRsGlw>
    <xmx:OfJeZMoW5G4_R_lrycpwxJezu4g2t0Gu4WRheLQ75tDOgeTkTNnp4A>
    <xmx:OfJeZFZUPHqtQgGY-blB8ies6T4NY5rbg8BEvI6dyBupzbqHbqsZuA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 4/4] automation: add PV passthrough tests on a AMD Zen3+ runner
Date: Sat, 13 May 2023 04:12:47 +0200
Message-Id: <de2a2841e44f44eb7dd56c0b9a2c27fe041051e9.1683943670.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.83768735557180cd65fb5f932c285271063e04ac.1683943670.git-series.marmarek@invisiblethingslab.com>
References: <cover.83768735557180cd65fb5f932c285271063e04ac.1683943670.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The PV passthrough test currently fails on this system
with:
(d1) Can't find new memory area for initrd needed due to E820 map conflict

Setting e820_host=1 does not help. So, add this test with
"allow_failure: true" until the problem is fixed.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
I'm unsure if this should be included. On one hand, the test case will
help verifying potential fix. But on the other hand, until fixed it will
be wasting time.
---
 automation/gitlab-ci/test.yaml |  9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 81d027532cca..7becb7a6b782 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -194,6 +194,15 @@ zen3p-smoke-x86-64-gcc-debug:
     - *x86-64-test-needs
     - alpine-3.12-gcc-debug
 
+zen3p-pci-pv-x86-64-gcc-debug:
+  extends: .zen3p-x86-64
+  allow_failure: true
+  script:
+    - ./automation/scripts/qubes-x86-64.sh pci-pv 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.12-gcc-debug
+
 zen3p-pci-hvm-x86-64-gcc-debug:
   extends: .zen3p-x86-64
   script:
-- 
git-series 0.9.1

