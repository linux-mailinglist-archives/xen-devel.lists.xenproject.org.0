Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B879487AA4B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 16:17:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692563.1079882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQLv-0007Zp-Dk; Wed, 13 Mar 2024 15:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692563.1079882; Wed, 13 Mar 2024 15:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQLv-0007W9-7K; Wed, 13 Mar 2024 15:17:11 +0000
Received: by outflank-mailman (input) for mailman id 692563;
 Wed, 13 Mar 2024 15:17:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WIWB=KT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rkQLs-0005e0-Ro
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 15:17:08 +0000
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com
 [103.168.172.146]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c10a0061-e14c-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 16:17:07 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfout.nyi.internal (Postfix) with ESMTP id 961B41380063;
 Wed, 13 Mar 2024 11:17:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 13 Mar 2024 11:17:06 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Mar 2024 11:17:04 -0400 (EDT)
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
X-Inumbo-ID: c10a0061-e14c-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm1; t=1710343026; x=1710429426; bh=rqAlWJ788XGq8tNuFWR/8
	CwesBByjaWaSAP4BkMnyEs=; b=KmXybWfqPZ5FXd7uhqw9z5UweMLZ+OASdIDdd
	2CAloPqIaW5uyVPavfKwG9NJqYo6q3FIW4GQL1yvFmdkeB6nhGHp06QLV60UtBiG
	fkcdVQmAysQO/suw1eNMaWsDATj+FMWwa2OZvQS3cWSYwRGCSWNkr+a+J1crgkYM
	NSTIVOdykSMhM8nStI7iNfvKaEAiunUE/1kfRiuEykZnO3B18zlvhe7o+Z5NOBbj
	p5HuzYR0Fg/nMNXaf2Ex1Vdz8/Pm6eEnU9XUybk+++LJDRwyVSey6MWr6aVkQ19Z
	9nxyjMCan//Pd//C36ilSrJmGlnPNbdO+FRNxFMwNhhk8q5TQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1710343026; x=
	1710429426; bh=rqAlWJ788XGq8tNuFWR/8CwesBByjaWaSAP4BkMnyEs=; b=I
	EpOTZre72V/R9KM4M3B5tt+XtrdmVc5AMZGW5iUIfjy/o/loE4wInAV6+Sjf/9Jg
	W8Uv0oY9A1DyNneY7JP8HYQlcCHQ0xqMcutK2L5JF8IHsgB3i+rGC9Wb3CD+FcU/
	RSZNV5LgBs1j0Pk+Q08O6PGF8aIaIfnXMb6+WVw1HcY4nekZln414ijY1/e7we+H
	LNL9cda5nreRVoUTlv5Ia37Ptd1zwzOuaAsxm1qo72s2UGL7Urjms1NHAZ2F8s+f
	QUD4Xjj5/s82QiECZjMv/LhHpUo35Y807YIBiTYANc1yQAQh1q9TigGEla7pjEGg
	wkox0OjTJOVsLSho0jmFw==
X-ME-Sender: <xms:csPxZcsSwPPB0ORp5X7LaC4N5S6TR_wzmAcHFq-vXX85uRPQLzuTvw>
    <xme:csPxZZd-xP5z59q0d0k1DWQl4SaJ6Mb5Ed1OrvoeNEFVDEM_RqTNg0Sm3ZxPiw-kZ
    rRn3lOH1cqZTg>
X-ME-Received: <xmr:csPxZXzo-Z9oAg5hmyikQDWdX1FJDPMWdQ0CdUItD43MaX9lE3lNVOEd0_8PdI9t9iD-M9BBZovNGcfkA5_MoAwKyMAKBnaAjrxncGw9A5lZ5Z7uKLY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjeehgdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeuteeh
    gfeiheehfedtueeludfhgfeileeujefhgffgieeiveethfeffffffedtheenucffohhmrg
    hinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:csPxZfPQesNIHll1ntf5PSuwhA1PdUdt2wCqzKIzDuG7brDxme3G7w>
    <xmx:csPxZc8NTSlsLQ4JduTr_JOK3EPKRX2_y5t-cLfyBWseukbCs0iPIg>
    <xmx:csPxZXV38Y1zy338ZCjdGAkIgSU2YxT73SiYPhl5MEMzlWGG5Yen7Q>
    <xmx:csPxZVeMnGnlIqDgdA5WYIMw5vR6SVy1pioxBpITqVVGY8Q0lJ9jgA>
    <xmx:csPxZQav3H4QcZcpOcXILzJ8fCWs6rMxn4whZcpjY8oM7Dy2Pq_iDA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 7/7] [DO NOT APPLY] switch to alternative artifact repo
Date: Wed, 13 Mar 2024 16:16:12 +0100
Message-ID: <6e8f9bd56b241e101b014f748888010adf280da5.1710342968.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.afa2d89161590f5193dd6bfd340c5e9347877aae.1710342968.git-series.marmarek@invisiblethingslab.com>
References: <cover.afa2d89161590f5193dd6bfd340c5e9347877aae.1710342968.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For testing, switch to my containers registry that includes containers
rebuilt with changes in this series.
---
 automation/gitlab-ci/build.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 6d2cb18b8883..7dafbf144494 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -320,7 +320,7 @@ qemu-system-ppc64-8.1.0-ppc64-export:
 
 alpine-3.18-rootfs-export:
   extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.18
+  image: registry.gitlab.com/xen-project/people/marmarek/xen/tests-artifacts/alpine:3.18
   script:
     - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
   artifacts:
@@ -331,7 +331,7 @@ alpine-3.18-rootfs-export:
 
 kernel-6.1.19-export:
   extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:6.1.19
+  image: registry.gitlab.com/xen-project/people/marmarek/xen/tests-artifacts/kernel:6.1.19
   script:
     - mkdir binaries && cp /bzImage binaries/bzImage
   artifacts:
-- 
git-series 0.9.1

