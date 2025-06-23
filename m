Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EB3AE4555
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 15:51:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022430.1398257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThZv-00025J-1z; Mon, 23 Jun 2025 13:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022430.1398257; Mon, 23 Jun 2025 13:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThZu-00022v-VM; Mon, 23 Jun 2025 13:51:18 +0000
Received: by outflank-mailman (input) for mailman id 1022430;
 Mon, 23 Jun 2025 13:51:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TVau=ZG=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uThWR-00048y-3u
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 13:47:43 +0000
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1b77b1c-5038-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 15:47:41 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id D190511401A3;
 Mon, 23 Jun 2025 09:47:40 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Mon, 23 Jun 2025 09:47:40 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Jun 2025 09:47:39 -0400 (EDT)
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
X-Inumbo-ID: a1b77b1c-5038-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1750686460; x=1750772860; bh=aD3ow6S5dt
	waOUDKDHpJxMSWCeAGUGRzl6OblX2n4jc=; b=J02puwvHlegt/ferO6+arj+bDW
	0xKAbdFdu9L2MAp12qdEfv3G8TURHvzOmi8sqWKqFlb6xq8Fyd5gm5PzmQK+ebhb
	WDTjTiEPsS4/WSbbyhQKcBc3ZVtTjetsb2Iq8yn/kBD99PWp5JAopmiSVJVw78H/
	FIKFXRWAfWjfpi7I5/AkNiymtqOxQHDzZd4NApVGPfewpFBzGugTztfpqlk45Bwn
	lpmlREkv7FHBNdcKhhlGQaAXdt3VFB1+hFuQnE8xlO3lJTSJQ2u8haQwfQKc8OFs
	o3/Dknc88gv1p4jjEqafDTF5ndL+3JBSNxblSvzahliaEJ3e+5R0TMz2Gkxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750686460; x=
	1750772860; bh=aD3ow6S5dtwaOUDKDHpJxMSWCeAGUGRzl6OblX2n4jc=; b=c
	CAT9HGN3VhY2ulaEOE3rJdSJzbhwZWuXjMEKxERL9WErT9wotl64Ifr+zpIKXBHl
	eVGU6uA3XgP/UJcCcgJr1anACiMyqgQzFxmXyWd/sovnhPVjQJX34EGVp61v995C
	ZVlsWK7z8Zto2W6COJcQLQkbZ1cOMHofcChaeJeySCDWW9aj9XLfF5bqF6K2T1KV
	NI5DRZRTebTiZLKGhesrNZ8jlvY3x3wU6QN/Ni09E6mtbI3tnhjAL5jtCWq40RbZ
	BPrNiZtExp23cE9ktQ/oLphOecY95WmLUglTHuSN/CTGim5woDqYu/r35x5FRrFd
	U8I7UTUe8MA9DvPaj1ycA==
X-ME-Sender: <xms:_FpZaGGxo5-NzaKEdH_RF_vXYb99WFL4uhsoGJljoJVjeJYFa1RgGQ>
    <xme:_FpZaHXIcfVInEPg__gYZvIaV1E5kdu4ydzmx0YkX8FtnFnK5oMfGhky1nKv-m6_F
    8kr8FybrwQ8Og>
X-ME-Received: <xmr:_FpZaALQx_QYq5tICS2DtcauNpM6IcI25tsnsTMn6v5diCOhp2E2vbWjwn7oAdb2AelB2ML233lqZoX-7KYLRzsoebEZOQ1Ko33AhjjMNPc4H2cInLnc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujedukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeuudeh
    gfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdr
    gigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepmhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomhdprhgtphhtthhopegtrghrughovgestggr
    rhguohgvrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrd
    horhhg
X-ME-Proxy: <xmx:_FpZaAHJsIC8LxjpzocGuVOBeY3joP2upsi95wN13ajX5s9G-ejOXA>
    <xmx:_FpZaMU_DAdpXgrAb86of45tdWLNc5Rt1CCHrZpPcM6hXM4RlH378A>
    <xmx:_FpZaDPBBCLlRiLkFxhM2pdM9WxIVPdd2avwgky1_7XkQB2NpFL5aw>
    <xmx:_FpZaD2mO4kim5FX8i7sfI5yOAvIiS5hDabQsTi0kzW2APs0wGARzw>
    <xmx:_FpZaFegCzj7u10_nv1qDAY1To9vUYS7MNYF0heP0KHX2ntYKgzA9NXG>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 3/6] CI: upload tests-junit.xml as a normal artifact too
Date: Mon, 23 Jun 2025 15:47:12 +0200
Message-ID: <84bdfa33c8382080bb78fbf3a0b46e4dfd6b9187.1750686195.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.16ccd290bf95e314a4f23777f5564b3aa2417e57.1750686195.git-series.marmarek@invisiblethingslab.com>
References: <cover.16ccd290bf95e314a4f23777f5564b3aa2417e57.1750686195.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This allows checking the file if gitlab can't parse it for some reason.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/gitlab-ci/test.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index a9d871cf72ad..dc08488e76f4 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -155,6 +155,7 @@
     paths:
       - smoke.serial
       - '*.log'
+      - tests-junit.xml
     when: always
   rules:
     - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
-- 
git-series 0.9.1

