Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AADAE44F6
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 15:47:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022372.1398167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThVo-0004gs-7n; Mon, 23 Jun 2025 13:47:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022372.1398167; Mon, 23 Jun 2025 13:47:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThVo-0004eI-53; Mon, 23 Jun 2025 13:47:04 +0000
Received: by outflank-mailman (input) for mailman id 1022372;
 Mon, 23 Jun 2025 13:47:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TVau=ZG=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uThVn-00048y-1n
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 13:47:03 +0000
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 893a86a0-5038-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 15:47:00 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 6CAF61140123;
 Mon, 23 Jun 2025 09:46:59 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Mon, 23 Jun 2025 09:46:59 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Jun 2025 09:46:58 -0400 (EDT)
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
X-Inumbo-ID: 893a86a0-5038-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1750686419; x=1750772819; bh=6lArJVya6sMHXsEjN3PqQO2uV8GEcc8U
	gEN6bG492KY=; b=km6pCW1oQfx6Gvcb4NFDr9IhzGys2kPmrJgq1BiP/zS0xyI5
	tBc35IGnRFLKFeXjDRI6BFNKLJ6TXjxvhCi5eblC2YPSHGj5OWQOgnuZf5c5EQdU
	UpnYvbt/3hEduPFMaZTqb05o6XdECtgWssF5+H0nICR3qS1IEHiKQpGFJs8yecgQ
	5muE8nx9+tadMuHdleHQIEcU7mj0yypnX0pysTp8e222yG4kTg1F4gPcEbVZ/DA6
	hF2W7gVnDdQrbXqlBucjAn1WbESVrbKXe+aqP3lnKFUGYJGLMlABGR8+/MMBDVnc
	5AtHyiAMhvrQXS2/4m6DKz5Qk2ylpL2Npio15Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1750686419; x=1750772819; bh=6lArJVya6sMHXsEjN3PqQO2uV8GE
	cc8UgEN6bG492KY=; b=JrJqIp5XmdEZ4jeL9B6uFBzYwYCngVc5ztBlCz61jDVu
	Xzb/CWeRs+L74h1ioOlDI9HdUMtokkiuI0jnhkFt03Bup8tx+Twysmg5ysD0klsW
	E4dQDIxTYx9Dt+qqevOCq207bj7ijvZJ3Wje4j4b6jAnsZ9oU1Mwl6swWih0z95a
	VS+NARq5PefWr2NIXjWnkV+nQjQPNcb78LKVokH7fjukh/q+39UDlPhmUr5XxlHp
	OPbptVGZhMhJ40XyKZfTyMrRwARexKypbOmjx0pijP3VJejfIKhv1avaJvMH+KE8
	44qs7MbvK/glXdwg93hxSwF9MyawqZwpmc4l88rLcw==
X-ME-Sender: <xms:01pZaMBYTjGnc-hmc3TMATSV8tdj0OCAbHQR-v1P2zcTxC5b_aq3Sg>
    <xme:01pZaOhlDvvrM0LB7jnMCNb3j5IOZZ0fXcfptKkYZ35NjWRkkFIJm5miFtJ9g3rqo
    3ulXSETjsBOBQ>
X-ME-Received: <xmr:01pZaPkr8O3x9J5DKc0dlAQr9eysUWPAabhzP99uHl7cuvXxLpAdd_wbVblcR0ft45ZlTYPR6l1xSmtdsv9d0RtUtNKSCopaBkigyyGOYuqQVE9ulLSW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujedukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepjeeufefhleei
    keegfedtgfeiueeghfduteejtefhfeevheffjefhieeggfejkeelnecuffhomhgrihhnpe
    hgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    peigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtph
    htthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthht
    ohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhogh
    gvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:01pZaCzbM9MoeLeFF7CvWbCiBGT6VQxBbDFUFsl4_LKE1lT7kz7vIw>
    <xmx:01pZaBSe0fQAaZaYnOKMEx9htLQ07iLA_pEDs6-OW1MUGFdahqAT-A>
    <xmx:01pZaNbinCRV6ClNgyHe7ejV-CLOy8ZK4FYlbVips_aYaRS4Z5BCrA>
    <xmx:01pZaKRqfq68pXuo8emskOcM0zmxveGFom8SZvi6BoOHm_NgnHOVaA>
    <xmx:01pZaDoxo35QppeAIQr-pKAtNbkwoABbaU0ii4XYblyLsnBQvK36AqK6>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH test-artifacts v1 0/5] Changes for building arbitrary Linux branch and for hw12 runner
Date: Mon, 23 Jun 2025 15:46:19 +0200
Message-ID: <cover.7129d44a341f3fb3a85f808a998c28ebe8a77ee8.1750684376.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series is necessary for the other one sent in a moment.

Technically, the last patch isn't strictly required, but it eases debugging.

Green pipeline: https://gitlab.com/xen-project/people/marmarek/test-artifacts/-/pipelines/1881057399

Marek Marczykowski-Górecki (5):
  Add linux-6.12.34-x86_64
  Enable CONFIG_USB_RTL8152 in kernel for hw12 runner
  Include git in the ARM64 build container too
  Support building arbitrary Linux branch/tag/commit
  Setup ssh access to test systems

 .gitlab-ci.yml                            | 28 ++++++++++++++++++++++++-
 images/alpine/3.18-arm64-build.dockerfile |  1 +-
 scripts/alpine-rootfs.sh                  |  4 +++-
 scripts/build-linux.sh                    | 19 +++++++++++-----
 4 files changed, 47 insertions(+), 5 deletions(-)

base-commit: d7434697deec41ddf31a2f3d189dee75d4d2486f
-- 
git-series 0.9.1

