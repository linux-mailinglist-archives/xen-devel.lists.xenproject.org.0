Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF90EA3AFD6
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 03:58:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892312.1301296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkaHK-00022I-GJ; Wed, 19 Feb 2025 02:57:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892312.1301296; Wed, 19 Feb 2025 02:57:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkaHK-00020q-Db; Wed, 19 Feb 2025 02:57:38 +0000
Received: by outflank-mailman (input) for mailman id 892312;
 Wed, 19 Feb 2025 02:57:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rZvE=VK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tkaHI-00020f-Iq
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 02:57:36 +0000
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43d84954-ee6d-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 03:57:33 +0100 (CET)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id 566E313809B4;
 Tue, 18 Feb 2025 21:57:32 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Tue, 18 Feb 2025 21:57:32 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Feb 2025 21:57:31 -0500 (EST)
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
X-Inumbo-ID: 43d84954-ee6d-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1739933852; x=1740020252; bh=LYQ0irlwgaR+qOMiLcTlyvmR7Ygq6KLN
	tV8vzU0E1fc=; b=WK6D/cAUjxvuKne27f9UVVnA1MdvXD0IwBrf6iMRGbkAl1rD
	iKdVNh5ILYzaLTim0qAmuN1yW9OeuhutfVpuBicTId4yjJhKqc3d2BL8nJbnYyij
	VeK4knIwt88a1YcfWTjIK1IzZ5DLtOI90bxNxEk3xWEoXWTUB0KyCWAs8I/YwzIo
	R0Shq+pp9qXqDBC35UmY1uPsJZWgwi82dxm3twegFXCWQI1PrpzdVrDObXAEvR6z
	Jcp43ZSBA+RCwmDQDQcwkv48laEUrcfm4AO2dclP1BcxTTb1uUYUcuIK3iliv1jt
	arXegpPCoVLWi2lxIaQGjlQ4e79mJBp61qf+9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1739933852; x=1740020252; bh=LYQ0irlwgaR+qOMiLcTlyvmR7Ygq
	6KLNtV8vzU0E1fc=; b=ez55d/6tNQ/G/gDM2sv2m4l8DO7CzCjuQiPrHXVlQlBn
	NrQV/+F2c3SOrrjn1TaC0ghZVYf0nLtHJbo8OvhJdkVwTnC+eIPDzCp2EbHcvhBt
	i8rYfn71qJiC8mfP2VmgUSTvO7qRdiZMtNGytiDakxluK9L+o1fl4OTdQ9DtXYco
	ghpm8YRHO02xI/1nJ8r0VXKqT7Tt+5+Y4M+le3t+9Km5vjwJ/afCd5qVTFREAaVu
	oYS+EjnpbTzeG0nO4ZjHXgUkO2qgYWnSxJCHV7Fperzl0UV6AAV77E654C2wPM9P
	aCVUeSITmldZCU7RBeHk2iCHg93JcWTKCQek6Nk3dw==
X-ME-Sender: <xms:m0i1Zz8UuvDS7U2f0_hiYOvAsYnBx7JX_CEICYahTG_lB6IQTkrPJw>
    <xme:m0i1Z_tUdUEXlwnfe5exc8PKVJlwmIDmqksBq_5aZavDKjoWV8Wx9PLoozzNcMnn0
    tptsAfnxh9ZVw>
X-ME-Received: <xmr:m0i1ZxAJE0LetfqqUZWG1kRLlwIN3VkSj4GagtAN5vP7EmNS0SoreNri_kbpMhCLtu4BxoufJU4h328LcOkhqPyvRSEbCoMmyEhaRodYPDUDc_C-JXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeifedtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepleekhfduleetleelleetteevfeefteffkeetteejheelgfegkeelge
    ehhfdthedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdq
    uggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprg
    hnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehmrghr
    mhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:nEi1Z_en4ruuGqsQExpKsesTM1URzo-bVguon8vV-tm1SOA1DHEbYg>
    <xmx:nEi1Z4MyYehTfOQCKF1O2KpzhpCplilXo55PM9ZczOg_RmLlZJxNFA>
    <xmx:nEi1ZxnQbvDqeXGjn5H2SddTh8zBfZxQDZpCcd51Y0w_MLSrCwhd-A>
    <xmx:nEi1ZyuizuXFaudeQ_goW-u4rUFG2Igz6N_BRDugu2G8384bLxzqJg>
    <xmx:nEi1Z1orhHDcUGklYjeL6SBMfEZUSFixfA8yXKC2fzrLQVwtonX8TG34>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v3 0/5] Few CI improvements
Date: Wed, 19 Feb 2025 03:56:50 +0100
Message-ID: <cover.0fd3c8fb7cf6db337edfd5c5d6ea18bcc44bdef3.1739933790.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- Add some more test jobs
- Allow selecting individual jobs, without editing yaml files

I don't think it needs to be included in 4.20, but may be considered later for
backporting.

Marek Marczykowski-Górecki (5):
  automation: skip building domU if there is no test defined for it
  automation: add jobs running tests from tools/tests/*
  automation: allow selecting individual jobs via CI variables
  automation: add tools/tests jobs on the AMD Zen3+ runner too
  docs: add basic CI documentation

 .gitlab-ci.yml                     |  2 +-
 automation/gitlab-ci/build.yaml    |  6 ++-
 automation/gitlab-ci/test.yaml     | 60 ++++++++++++++++++++++++-
 automation/scripts/build           |  1 +-
 automation/scripts/qubes-x86-64.sh | 78 +++++++++++++++++++++++--------
 automation/scripts/run-tools-tests | 47 +++++++++++++++++++-
 docs/index.rst                     |  1 +-
 docs/misc/ci.rst                   | 35 ++++++++++++++-
 8 files changed, 211 insertions(+), 19 deletions(-)
 create mode 100755 automation/scripts/run-tools-tests
 create mode 100644 docs/misc/ci.rst

base-commit: 819c3cb186a86ef3e04fb5af4d9f9f6de032c3ee
-- 
git-series 0.9.1

