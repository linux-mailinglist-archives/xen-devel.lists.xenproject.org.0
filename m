Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1418C7819
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 16:00:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723365.1128217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7beB-0008Ha-Th; Thu, 16 May 2024 13:59:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723365.1128217; Thu, 16 May 2024 13:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7beB-0008D1-Mq; Thu, 16 May 2024 13:59:51 +0000
Received: by outflank-mailman (input) for mailman id 723365;
 Thu, 16 May 2024 13:59:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R9+o=MT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s7beA-0005tl-4C
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 13:59:50 +0000
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com
 [103.168.172.151]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e8c1d35-138c-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 15:59:48 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfout.nyi.internal (Postfix) with ESMTP id BE49813803AD;
 Thu, 16 May 2024 09:59:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 16 May 2024 09:59:47 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 May 2024 09:59:46 -0400 (EDT)
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
X-Inumbo-ID: 8e8c1d35-138c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1715867987; x=1715954387; bh=PRF53+BCaf
	9Aziy/eN2Em2AqRlh6rGUA7cP+LaPIH+E=; b=OGnAGl2U4SmMOB08+dj3TM59DA
	3o063TgAuCrFfnkmkOmQMfTfCEm5WB/Evf32CpJ3UByl3vp3STuKN2SVc92ux2+f
	zatHfYBYM7oIWtMBrGo40Kad+umSEyZAGjyWawBCDakpcs2UJ2YLOXkSYMv6oQp9
	j6/AM4gxGuVdE5pI3+39vL023vG4WhKQlXMhTIVLa9HCMfTaJteXzMbRVsQ5ntLu
	kWzepZVZlK3d5Xf9x7Liunwyx9AtnXf0tAHDYVkYNyMjGZqTs84/LXiltJyubg8L
	bsUuECRGVeNu7ChnB0vrdWhixE2wyHloq4BwGBVV3OlENIxVErg0y9jvJArg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715867987; x=
	1715954387; bh=PRF53+BCaf9Aziy/eN2Em2AqRlh6rGUA7cP+LaPIH+E=; b=N
	RekwLBVqJaWLsmYT9L5zafMGv1FbQhx5EBQWlVhMuMJF2JlSvf2qjM3n9zXYbrzK
	jMOU1pkjHZaN8nriurCyOrp62afmbi2uE7WZBX1H2Lex4XCPsqBBsZNk2G9FP6Zc
	hHB2fpRXVOmDC/Mi6eAjBEmdhhgwATEu0hye5JwmqNL0iYBwXOGEDg3bsMurWE5Z
	zNoTZsqos3yLS++8kbjBUS2p0UD0wtN+rNi0P6l7h/9E2nHlM1IloMRFPP88ZF2+
	a+FOfuwFLa5O3YQ25B2FFGT66ZUF6VjjpubKz2+TMAWIS74g31U+Mcx6/sb7xaCs
	AOLuhgT2WJ5fRdQg50+FA==
X-ME-Sender: <xms:UxFGZtu4Mq9n0JyajEr5Fs8liEivH2o_cKzQlPrq8-x873ZOJQGrJg>
    <xme:UxFGZmeTh8aFai1-gOKVzipAt5-gt0PP8a4fOG3ONhutxMYzo3BA45umMVOEoxQZ6
    HUxRdkmpkEl9Q>
X-ME-Received: <xmr:UxFGZgylfII-0R9q3noViuvX7yz9T7CxGvVb8RcOU6D8s_vK9KS6at98NdXyxpCol79lOqFKE_hQjNCf9XsoJMksjXdpMhYamaX7U7lTm_ZD4Imc_Ck>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdehuddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:UxFGZkN6Tl-78y4tuYURBgbMWQH1Jyr64VTCsQWY_yd0PH8sbQGKHA>
    <xmx:UxFGZt8ESiLFsmKeC675NkLgntIBLqZ6xB7q35xImnLNFt0qsI0W-A>
    <xmx:UxFGZkUJX3o0JZ7IDt6ZVcUnS-I5U8LjjKhRT0KgZFn6Zn4uyRJuuw>
    <xmx:UxFGZueBBFGPC7hAJw2nhfDaDEMEbJR03X1DOqoMXKNOR7x4HMOXjA>
    <xmx:UxFGZoZyo-S-JtR2Hxl-CkgFiinbg-d-74GoXAPoCynfX2Fuf3ZStx8->
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 09/12] WIP: automation: temporarily add 'testlab' tag to stubdomain build
Date: Thu, 16 May 2024 15:58:30 +0200
Message-ID: <ef65781a69879d15a334f1afe644762d4f9c0bd7.1715867907.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com>
References: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make it run on newer runners that have new enough kernel for
dracut-install.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/gitlab-ci/build.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 9b9e5464f179..134a01d03efa 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -356,6 +356,9 @@ alpine-3.19-gcc-debug:
   variables:
     CONTAINER: alpine:3.19
     STUBDOM_LINUX: y
+  tags:
+  - x86_64
+  - testlab
 
 debian-stretch-gcc-debug:
   extends: .gcc-x86-64-build-debug
-- 
git-series 0.9.1

