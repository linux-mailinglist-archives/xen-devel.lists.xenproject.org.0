Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5A9AE4557
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 15:51:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022435.1398286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTha0-0002wr-4R; Mon, 23 Jun 2025 13:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022435.1398286; Mon, 23 Jun 2025 13:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTha0-0002tF-0c; Mon, 23 Jun 2025 13:51:24 +0000
Received: by outflank-mailman (input) for mailman id 1022435;
 Mon, 23 Jun 2025 13:51:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TVau=ZG=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uThWR-0004sG-Hr
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 13:47:43 +0000
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a278ca05-5038-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 15:47:42 +0200 (CEST)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfout.phl.internal (Postfix) with ESMTP id 1D40613805FF;
 Mon, 23 Jun 2025 09:47:42 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-08.internal (MEProxy); Mon, 23 Jun 2025 09:47:42 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Jun 2025 09:47:41 -0400 (EDT)
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
X-Inumbo-ID: a278ca05-5038-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1750686462; x=1750772862; bh=VguRMJhpxw
	xq/YO8TuwoUJYN3PnY9OBoKFJfvWdIwJY=; b=FO4LfyRYsrbYasRaQe+6igoUdc
	VSdS3uUQACGtkNEXBZ5P6nvHgrUZ4KcV/Blqp3Xin1G70kwxtMJ+u06DtV0nsxJd
	FgUe0j2ELdYHjTrOx4Bq/JJUMUUqjwSWywBCj0ZGSzbHwCNrx1DyCwnL5PqocMoO
	xwmMSrQ+iXhN5DI9MtG/lhI70nd8qHa0vVW9SrFCOcTsJZUqbOw1WZzeksOWylrn
	uBVW+t3ibPzAGKKlyYXEMdgUWlHeOnnzSANT7SfQ6G1eblPB+hNWVEYDVr1iwP5u
	DbC//VXk19cCYFdic1tI/BEolLLlvQmIMXHfhE0cFYI4ddlaBGd4CxpzEtGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750686462; x=
	1750772862; bh=VguRMJhpxwxq/YO8TuwoUJYN3PnY9OBoKFJfvWdIwJY=; b=i
	fP3VImKvFyZ0iWdLJ1VPH6+3JJjFeJjpltU3aXBc1VNy2RMnxfQcq2j14ezysiRu
	khrmEpk8t3srE5QS+tEHdz9ETPjLbQKZ+DbVN46sFtZINcfSg6qXIqYvi8A9HD3f
	qgZFKJvHDRoK7MoACDHay6r6mLfDCVyVAE6n5bDkNKctW7AKnpYyCpGkNI2woZ0D
	YvPfhDPOfZc4RuWzikJXCXVrC3wu3gQUMeEIvDGIrn0FFNxM87kQ4QqaBiklaelB
	q/NLnlXsXNp14Uv4MtXGX5OUef3+OJC54hGqw3DA3Y82FlVLqfRN64Hr9ZS9HMY7
	ZIiGE8mmQEU2Aq5gvOI6g==
X-ME-Sender: <xms:_VpZaDvSfZWcYHnF-aVYlZLs6GJP8mGaKE9PwDjNakE6tPE5AJF8Fg>
    <xme:_VpZaEehzfFzZEH97kBNz4IcKiKyw8UAdvL-KvFmU0jd0mqbsKVh93cdIT7HUJlVf
    EmuF_tOufu04g>
X-ME-Received: <xmr:_VpZaGzNR-pFzuHUSCmVSNU4HOUezGyLVzHiQhnuE04FgCdCf5jNPwu0O86sSpYkujFI5KuhikMXiDvASp6QNMAUuUeqq2fySqACmE5xQRgTrnfAOAaZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujedukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleeftdef
    gfffgffhvefhhedvieelheehffeukeeiteeffffhteeggffgjedugfegnecuffhomhgrih
    hnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprh
    gtphhtthhopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgt
    ohhmpdhrtghpthhtoheptggrrhguohgvsegtrghrughovgdrtghomhdprhgtphhtthhope
    hsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:_VpZaCPrlI-LFx5um8i9K7H8aUTqBALWSK1tJSYYrkbyHIE4QT5yEQ>
    <xmx:_VpZaD9UMUhKWuUnZXQaKGrkrbLrg6Chu1FEK3R-I7NlML94IDvWzw>
    <xmx:_VpZaCUVrNuBQ61MH5BZLgYcvEJmVjwv7QNrCvcDN_qCuRBaiU_uzQ>
    <xmx:_VpZaEfQ_SkwSYpS2BPKYwb51uzcs56_5SDyYpjlswL_qh5X3e1Eww>
    <xmx:_lpZaHHsW6vDnIgGlhEYHhh7GeqPMAcFXh71q0D-eUurfItanxlfO0al>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 4/6] CI: make test-artifacts branch/job customizable
Date: Mon, 23 Jun 2025 15:47:13 +0200
Message-ID: <7c032d51b6183888cb0fcb71662b452fd9cb5a20.1750686195.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.16ccd290bf95e314a4f23777f5564b3aa2417e57.1750686195.git-series.marmarek@invisiblethingslab.com>
References: <cover.16ccd290bf95e314a4f23777f5564b3aa2417e57.1750686195.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Allow choosing which artifacts branch and job to use for Linux. This
allows running the same tests for different Linux versions, without
duplicating a lot of yaml sections.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
I have considered common LINUX_JOB and then add architecture suffix, but
even now X86 and ARM use different jobs, so I made them separate.
---
 .gitlab-ci.yml                 |  9 +++++++++
 automation/gitlab-ci/test.yaml |  8 ++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7974ac4e82bc..c1d92dc485e7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -2,6 +2,15 @@ variables:
   XEN_REGISTRY: registry.gitlab.com/xen-project/xen
   SELECTED_JOBS_ONLY:
     description: "Regex to select only some jobs, must be enclosed with /. For example /job1|job2/"
+  LINUX_ARTIFACTS_BRANCH:
+    description: "Branch in test-artifacts to use for Linux"
+    value: master
+  LINUX_JOB_X86_64:
+    description: "Job name in test-artifacts to use for Linux x86_64"
+    value: linux-6.12.34-x86_64
+  LINUX_JOB_ARM64:
+    description: "Job name in test-artifacts to use for Linux arm64"
+    value: linux-6.6.86-arm64
 
 workflow:
   name: "$CI_PIPELINE_SCHEDULE_DESCRIPTION"
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index dc08488e76f4..9fd66fb6138d 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -9,8 +9,8 @@
 
 .arm64-test-needs: &arm64-test-needs
   - project: xen-project/hardware/test-artifacts
-    job: linux-6.6.86-arm64
-    ref: master
+    job: $LINUX_JOB_ARM64
+    ref: $LINUX_ARTIFACTS_BRANCH
   - project: xen-project/hardware/test-artifacts
     job: alpine-3.18-arm64-rootfs
     ref: master
@@ -21,8 +21,8 @@
 
 .x86-64-test-needs: &x86-64-test-needs
   - project: xen-project/hardware/test-artifacts
-    job: linux-6.12.34-x86_64
-    ref: master
+    job: $LINUX_JOB_X86_64
+    ref: $LINUX_ARTIFACTS_BRANCH
   - project: xen-project/hardware/test-artifacts
     job: alpine-3.18-x86_64-rootfs
     ref: master
-- 
git-series 0.9.1

