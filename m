Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78678B1CFB5
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 02:09:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072316.1435513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujoBd-00038M-8r; Thu, 07 Aug 2025 00:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072316.1435513; Thu, 07 Aug 2025 00:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujoBd-00034v-4E; Thu, 07 Aug 2025 00:08:49 +0000
Received: by outflank-mailman (input) for mailman id 1072316;
 Thu, 07 Aug 2025 00:08:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=llzQ=2T=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ujoBb-0002cl-TL
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 00:08:47 +0000
Received: from fout-b2-smtp.messagingengine.com
 (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af559e14-7322-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 02:08:46 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailfout.stl.internal (Postfix) with ESMTP id 402B81D005CE;
 Wed,  6 Aug 2025 20:08:45 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-12.internal (MEProxy); Wed, 06 Aug 2025 20:08:45 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Aug 2025 20:08:44 -0400 (EDT)
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
X-Inumbo-ID: af559e14-7322-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1754525325; x=1754611725; bh=iJvMJcv0cB
	Qu55x4UgstCbKC7gtLV8geSfdU8hnYITw=; b=e7uR7CjN+a+PsQHgCRAEOwqHxY
	MtO3Ig+ZWdRIl6zZ7IotFiE5DStcQpyg9xr4mXSfRGztFq1xKHhZcNuzF5MRJwLd
	phoXHkpiwOeYKR58myLP0B470bw0enq2ZPMSRfaADZKerjHQgeR53yjUTiGWndrS
	ESkLPiRhR2q62bbBgDvBekHwVWr0cbG3RaI8KCOUohJMbbSBAawtdKFxvEx6Jrru
	3lTFii0lI2L+xJEhQd0GUU0nazFqJRPnAbtkmiH/aMdHQPDw8IlLcc8Doez3o528
	+Acs+kJ0yBJoikvVzZ+/XTWSLZ2fc/kWY3GxEVXS70dXNoaqO/RGiC/ppJfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1754525325; x=
	1754611725; bh=iJvMJcv0cBQu55x4UgstCbKC7gtLV8geSfdU8hnYITw=; b=b
	X4qQDR2dKzI+rPt6QptGwn4siItcuOz165JadWvVvC0q9E23zrmAGdCYqPu5hN76
	V+DFN0r4IxRjwjZGH7Xwx13DbcT4j+gRmCZYxgtg1H0ovI7s8jEZtaI9fx0o0uya
	b3ffWfBZTnm71jO6s5f5eUPACESV1TnBX/mTmFXdix/K6wevxuebTwL+JZQP2x9p
	D5mquwuToGK8gOn46ICOpYbt/vcSe8GhWngsRbzQni4FeX42hodai82rYYETxt9E
	yRVi4lFUrH7OPheSFucbJJL3YhFBo4cRaaKAOCt3888tGkuXmrBlr4Q9sZJXsOBn
	hUfXi6/gx5dDpoUUYfwxg==
X-ME-Sender: <xms:jO6TaPeCqa9akwvtOlL696XanBwepxTAIRLRLtZ6rXj2yf4q07hyZw>
    <xme:jO6TaDC7qt0AnWy2ZH8DspWsNAEjMtrECH2_oeEsycxErMWaX-E4bzOK3hvlg_HLN
    M9EAlrkVtKYjA>
X-ME-Received: <xmr:jO6TaC8JYKPnjxxaXZz_dakFYBjM9oxY47VdeM6uoCnsfvgAktR0JSjueRdzas_Rt1R00d9MpGje97K3AWxX1Ow4BHoYTHb3VjmFZCFSxTGTTcV6XuH2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudelgeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefguedu
    hefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhs
    rdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghpthhtoheptggrrhguohgvsegt
    rghrughovgdrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlh
    drohhrgh
X-ME-Proxy: <xmx:jO6TaOJwDmCdMpcNykjloXk_zyHyY8b4og3lgOaFlIZJL7uZqYGJSA>
    <xmx:jO6TaLgv1HOq8mQWuNWGoglWqOmiMOby4pNC953cbfrmGnsIYJZG_w>
    <xmx:jO6TaO6HBJ1ls6c4NuUVrAi_SPuT8Kf5w23zR5IXaIeuFpdePEwQtw>
    <xmx:jO6TaDZHiEMoNtheIcCY4099lS4EztY0vLHUfqHcAUbmlXDhxKK4DA>
    <xmx:je6TaPAp0L4HADeuRkJK5KXnRekAshY3ShOlXPErTsqLv2sXDOurKjRI>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 2/2] CI: Run driver domains test on Debian too
Date: Thu,  7 Aug 2025 02:06:50 +0200
Message-ID: <ebb90ba2c702b3fe59fbef29744ae3c312a9d36e.1754525202.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.a3ae44ad160fb5827451cd35aa8ebbd546cf3866.1754525202.git-series.marmarek@invisiblethingslab.com>
References: <cover.a3ae44ad160fb5827451cd35aa8ebbd546cf3866.1754525202.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The recent failure affected only glibc-based systems, so do the test on
Debian too.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/gitlab-ci/test.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 5c4b2dc304b4..a5ae03b0eee9 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -30,6 +30,17 @@
     job: microcode-x86
     ref: master
 
+.debian-x86-64-test-needs: &debian-x86-64-test-needs
+  - project: xen-project/hardware/test-artifacts
+    job: linux-6.6.56-x86_64
+    ref: master
+  - project: xen-project/hardware/test-artifacts
+    job: debian-12-x86_64-rootfs
+    ref: master
+  - project: xen-project/hardware/test-artifacts
+    job: microcode-x86
+    ref: master
+
 .qemu-arm64:
   extends: .test-jobs-common
   variables:
@@ -664,6 +675,14 @@ qemu-alpine-driverdomains-x86_64-gcc:
     - *x86-64-test-needs
     - alpine-3.18-gcc
 
+qemu-debian-12-driverdomains-x86_64-gcc:
+  extends: .qemu-x86-64
+  script:
+    - ./automation/scripts/qemu-driverdomains-x86_64.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *debian-x86-64-test-needs
+    - debian-12-x86_64-gcc-debug
+
 qemu-smoke-x86-64-gcc:
   extends: .qemu-smoke-x86-64
   script:
-- 
git-series 0.9.1

