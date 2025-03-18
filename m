Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13656A67A4B
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 18:05:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919551.1323968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuaNc-0006Sm-97; Tue, 18 Mar 2025 17:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919551.1323968; Tue, 18 Mar 2025 17:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuaNc-0006RA-6L; Tue, 18 Mar 2025 17:05:28 +0000
Received: by outflank-mailman (input) for mailman id 919551;
 Tue, 18 Mar 2025 17:05:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wPrW=WF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tuaNa-0006Qw-JD
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 17:05:26 +0000
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e6ee38f-041b-11f0-9abb-95dc52dad729;
 Tue, 18 Mar 2025 18:05:24 +0100 (CET)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id 623CA114015D;
 Tue, 18 Mar 2025 13:05:23 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Tue, 18 Mar 2025 13:05:23 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Mar 2025 13:05:22 -0400 (EDT)
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
X-Inumbo-ID: 2e6ee38f-041b-11f0-9abb-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1742317523; x=1742403923; bh=CzLALV+Svxnq3j5ei54OhOCfOqGIDwd6
	+fde85qlpdI=; b=Bctijby77xifVqnZBq+a+E6ppC84OlE4mQ+xMfvxeTk+RUCX
	ugI9c+/Iv9oqR3Wju+pIASPoEp6FqXQdIRD+vxp3DAWnqhoLkHoUzagGGMv5k5oU
	8WtBq+cUoop1Fv417me6hFhX6nd68De4M1z+T6++Si4Fi2v2Qz4goQ+YzDyCcQ6Y
	Hnr5Qf333p0pKA1pkcs8bKpSwR3M5Bcxfk/qqwWJ44bl6i8nb3oY/D69rMuefNvT
	LGATKBKBQB2dLgbsXGDdY8S1nNLGrEZmK9RnwmxNTlWURNre3swD4H+64b2ZpXgB
	HW7zX+DHxfhiNa+UzXZcDydy3IAWqIOx7kfEvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1742317523; x=1742403923; bh=CzLALV+Svxnq3j5ei54OhOCfOqGI
	Dwd6+fde85qlpdI=; b=cJmynHo9YUtiiptfCKjbQYMpHBw+dSxGL7DA5kRh+oKV
	GfeTXemzBHfBqJUjNFQwkH3NCzwxSTDiBmnkRvSL3M87xXoa3XT/944kn5kFpIb5
	YO+uSA3/iXFV+hu/vdCYyoEBt/47Hq3g1jR+lQMT9PqC4G8znjL9t4wqAWXHAuFC
	rx8l7XFtTk1OkO0YoDKCqmpCWLDMqGiiu8cfN6IezT64QZ2XI9PqUmjqxAelC9N9
	Vu3DflTbZ10mPdOTOLlDV9gbRGwETNbNT210t2xO/qBMFkdbnFOStP6vzB8IQrZf
	QXU6EUS+gvX6hzzo1/+RyuhG1o6GJX5NyFY56gTKgg==
X-ME-Sender: <xms:0qfZZ5CzcYq8SY6kjlJrSTagkb0I_SLubXiB82I2kYWCnTDcEKSCqg>
    <xme:0qfZZ3jwcspsJ3T2PgKfuGEzSIYI7VCQh5YImanyJVtViI-eg9QMGV6Tnsuf-zvnG
    X1pn2XgAljrnA>
X-ME-Received: <xmr:0qfZZ0mL_CwBhQtRe6l1HE24-ikPPVYOCNQ6-IiSMiD-y3xte3rfXMTNx-a54q6glsw54SD43Al4PKztSJ8vGcjZ_OuECtXhJLV-Thomz1KHGiBRdkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedvleelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvf
    evufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiih
    khhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvth
    hhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleekhfduleetleelleet
    teevfeefteffkeetteejheelgfegkeelgeehhfdthedvnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgs
    lhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhho
    jhgvtghtrdhorhhgpdhrtghpthhtohepmhgrrhhmrghrvghksehinhhvihhsihgslhgvth
    hhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:06fZZzxQ2gbNZL7lcvN3hqbwnggg--qQHiS_bHy-lI0FCSI69A2VIw>
    <xmx:06fZZ-TVnUq7l4a_d7enQD8FdT825IXprzaP3hNsDOg4YE4WxVIO0A>
    <xmx:06fZZ2aGdfowJiMWCm5eV-aJwKE0dfUQBLYk62M9X5q81obqDzUMGA>
    <xmx:06fZZ_RubwdpRXj2abkZOrPrKC9Sm3cGlBOToJYaNkdRh7eTbyeEeA>
    <xmx:06fZZ5c78Og4EVqG17BkofntKxK6hbAsmqWMeyuSsQPiuax0R7y1BUJ_>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v1 0/2] Improve reproducibility of build artifacts
Date: Tue, 18 Mar 2025 18:01:55 +0100
Message-ID: <cover.a5cb9c3a17249fc067ab501818c3a3e6c7c229cf.1742317309.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Few patches from qubes patch queue that improve reproducible builds.

Frédéric Pierret (fepitre) (2):
  docs/xen-headers: use alphabetical sorting for @incontents
  Strip build path directories in tools, xen and xen/arch/x86

 docs/xen-headers      | 2 +-
 tools/Rules.mk        | 2 ++
 xen/Makefile          | 2 ++
 xen/arch/x86/Makefile | 1 +
 4 files changed, 6 insertions(+), 1 deletion(-)

base-commit: 77be740e8182fa6b31291a8ae983d253187e9b50
-- 
git-series 0.9.1

