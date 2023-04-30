Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC0E6F2B6C
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 00:43:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527889.820503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptFkg-0001C1-N7; Sun, 30 Apr 2023 22:42:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527889.820503; Sun, 30 Apr 2023 22:42:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptFkg-0001A1-KJ; Sun, 30 Apr 2023 22:42:42 +0000
Received: by outflank-mailman (input) for mailman id 527889;
 Sun, 30 Apr 2023 22:42:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MVg7=AV=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ptFkf-00019p-Ge
 for xen-devel@lists.xenproject.org; Sun, 30 Apr 2023 22:42:41 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e11efa6-e7a8-11ed-b225-6b7b168915f2;
 Mon, 01 May 2023 00:42:38 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 6E43E5C0089;
 Sun, 30 Apr 2023 18:42:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sun, 30 Apr 2023 18:42:36 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 Apr 2023 18:42:35 -0400 (EDT)
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
X-Inumbo-ID: 4e11efa6-e7a8-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1682894556; x=1682980956; bh=3sUQj9tWV99SSb2ZZEQJJXH/Z
	420sQTp6kjDCThm5zk=; b=D/cULiKOMTF8Ghso+8uj+1fm+169QRaMlNbVB5lH7
	IqR0olX1rA4PvV5XfIjHwH5AcP3zDHGvsSkchkK87M5BG5qR7zyLqB9RFYuQ6VVe
	oLSqSQrVrddODSYIcQEyXM9HGDistjqhjc8x4NOT/eK1z+yHfKro2rIj4gQinw2I
	8HSRfQ9P60xwFhdASSog9mWyLG0zdOwnI8gdZNrVwuSIgLFrJROCSTJOGeoW3H+F
	Emc1kU3zdjJFrS3B9ehi7I6gdpLpC4KPVE5ifK0MX9EIyT4hJsrHJbgDUXBrv941
	jXR9P2eP3fh6w8BvMTjErOf/8JDhka9C1aBFu388xcuXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1682894556; x=1682980956; bh=3
	sUQj9tWV99SSb2ZZEQJJXH/Z420sQTp6kjDCThm5zk=; b=Iolcj6+8GfwnM05Cj
	+GJjgv/6sih3Bbr3g/0daDFBXmjWbP3kyheZ0vxcESSWCE+/2CgWj3T1zwCl+dBI
	w/d0m0B27LkuadcxEaUmtIspBW8srQSIS5VNhx9d4HWbwfzw9HHBf4P2JvCj3N2r
	18f+JOkXRbj2rXkvGTG1YyJ7cJkRenEbMIsTb7zxvew1I6hmZke+DirESyRqj6yf
	VpfC4Ncv9L5S1C2gH9/H0C193k2YLdS5W1Vnk0owHXLFeWnaHyBPVJBtcndHTxXd
	YOnpHeZMeXjdni75FxazR3UDg6JwS6asToGwN2B/rsO4cL2a7vxFAWjK4V05iMOX
	GUUow==
X-ME-Sender: <xms:3O5OZHYe_ThKxY-qGzXLykW8PRpHxGNbhSZAAzLwYC6UzoKVtK8JiQ>
    <xme:3O5OZGYY4l1spRZaBZ1N8FuYsUJFIUGMJcXPGQdEBtrUucY-OyH71eMm-x5bpqesh
    xIfD4adb2viaA>
X-ME-Received: <xmr:3O5OZJ9fmAQeO-c5yaz2ZsIMMAp7_EG5qbw5CxEBJW8CbAfSkybRpCBn5cz3WhCcSMTw6DLp_ZM8b9C47b4sbijbS5-Zxwd9M_9vt9mjmRUGmQhsWD0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvfedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffogggtgfesthekre
    dtredtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggt
    khhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    eqnecuggftrfgrthhtvghrnhepleekhfduleetleelleetteevfeefteffkeetteejheel
    gfegkeelgeehhfdthedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdr
    tghomh
X-ME-Proxy: <xmx:3O5OZNr8QCg_tmyZGazqn_t4rVz2Y6VNDujDqgRnLw41PGVg32_pMA>
    <xmx:3O5OZCpJE-hEOBnZHOIyJmPqyKJKh6lHw-2J9Tp-NwFvWXaFYN6T2Q>
    <xmx:3O5OZDR_kIN0YzVC6IyrXde6xDOfr_yBg-cQ_SiH34DhfOTZalUEYg>
    <xmx:3O5OZAGyztfFCYkfFgSOwK8K7FGPaISCcTq82QqjoXPbXyDbmjvfFw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 0/2] automation: optimize build jobs order
Date: Mon,  1 May 2023 00:42:21 +0200
Message-Id: <cover.ff073811df470285fc1011952c6cc28e9e77607e.1682894502.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This made the pipeline to complete within 45 minutes. This isn't big
improvement on its own, but should make adding more runners more
beneficial. While looking at it in real time, most jobs were really
waiting for available runners and not stuck on dependencies anymore.

Marek Marczykowski-Górecki (2):
  automation: move test artifacts jobs to the top
  automation: optimize build jobs order

 automation/gitlab-ci/build.yaml | 734 ++++++++++++++++-----------------
 1 file changed, 369 insertions(+), 365 deletions(-)

base-commit: 6a47ba2f7855f8fc094ec4f837e71a34ededb77b
-- 
git-series 0.9.1

