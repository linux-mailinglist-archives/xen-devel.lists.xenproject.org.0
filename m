Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37221A86743
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 22:33:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947816.1345401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3L47-0007Tr-UO; Fri, 11 Apr 2025 20:33:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947816.1345401; Fri, 11 Apr 2025 20:33:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3L47-0007R2-RT; Fri, 11 Apr 2025 20:33:31 +0000
Received: by outflank-mailman (input) for mailman id 947816;
 Fri, 11 Apr 2025 20:33:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5hfk=W5=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u3L46-0007Qw-Uv
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 20:33:31 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39553918-1714-11f0-9eae-5ba50f476ded;
 Fri, 11 Apr 2025 22:33:28 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id 229421380214;
 Fri, 11 Apr 2025 16:33:27 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Fri, 11 Apr 2025 16:33:27 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Apr 2025 16:33:26 -0400 (EDT)
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
X-Inumbo-ID: 39553918-1714-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1744403607; x=1744490007; bh=C/hTXG+MPNyrw9iV2eCibw2i0F8RAuek
	lbURE1Ptgjc=; b=lBMvOkCXbDvLVoa+TRYGbYsePy4uk+nYMVkC3QY9s+jLlyvM
	SC04MITv7TFABVbaH7hBV+tpQztm7Nmlnb051x0HoC4eLp5aPWgP0qC4X2mfNTnN
	dScvTw0sEMrWIC0ZxCCTduTt5sMmSvHns5eEY6x5ZvNSs+cCjWrXJuDcJcGyJ5bC
	kl/XeprKAY4wApUwlIWlE18G6LzBhnslZVCPxcEnNVdC/HubJhgGVGHCsGs1fh8v
	lEkQeRjnVqU/gJJK+lny8ldujX+aiH78Rut21bvxghXRccY7NXuWxOFAcAyr9Jn2
	PFni5h3fOgnKWEujzXBKywrw6pgdfoUl7kRZ8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1744403607; x=1744490007; bh=C/hTXG+MPNyrw9iV2eCibw2i0F8R
	AueklbURE1Ptgjc=; b=RUOyfbl36v+ALKsgwftHzMdt2hT5Go2K37AT4DZ532rF
	1lT16LEcRfB6hFVOnaa2f5qvCPXVeT38nq3ewSSfTHaPYiE8CWr4c7xHYIynZcKl
	omG6qVC5agdI5g88j3nv6Gvp8XpI1a9ETRF8hiTGDTmuhU2EQUAw01gH1Ro/Knfz
	3hQguU9Pqi1bpSmGPvfcxY6etO00VyCA7ReT258f/34UljfeMNJEPGigGC7KaPXx
	g/FX964XvVtvAE2QbEjxhjAKW84iDq7L+6zJD38E6Ppw9HstyD9fARGMQhIoWRk2
	1pLsfahLMQpUxI6CF84tff8mL5yJPkXszgzDn0+4Nw==
X-ME-Sender: <xms:lnz5Z_1chf7gritI3zLu6QHOaizJXfZyX39x6k0c0zkucDrN0XrOzQ>
    <xme:lnz5Z-EBhpemVJYhyZFPKBP-hjC2B9dKPzailhDmUMKSc0jyGLpYTIm8fZYk3afBM
    Imc4cYr3Subiw>
X-ME-Received: <xmr:lnz5Z_5Ki7rMeqDzaBu6FGdXblu1M6fGazlLFEvr6eILtOA4Wc8XGDvp9mHWwTcUli4MddB7JWnGeWLwKOBn8-oNDIBljUOOKdUeBg-h5DGVH_DzjK8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddvjeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpeelkefhudelteelleelteetveeffeetffekteetjeehlefggeekle
    eghefhtdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpd
    hnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeigvghn
    qdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhope
    grnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohepmhgr
    rhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:lnz5Z02Ouj2CQYAuw060a0W7hWGXTiCbNY7m8MLPaIN5edOU3FZEng>
    <xmx:lnz5ZyGJhxW6RNeKrpN214oATSbJqWuJSgzFw_hD_3d_C863gcWzZw>
    <xmx:lnz5Z1-lO3nDsI6T0tvuC2U9-DHyqGmvoXFv8prs0YfzmXdY1HhV_Q>
    <xmx:lnz5Z_lUKn0-MOLiWgMZPxMxz6k88kPaf7zqLyXPrJZZD-NyDiTM6Q>
    <xmx:l3z5Z6xDUNdSBwlA6lWPDirLI2IFg3qQmHkI8X-ZUNKqWznjWNsAnsmE>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v3 0/7] Several CI cleanups and improvements around initrd/rootfs
Date: Fri, 11 Apr 2025 22:32:12 +0200
Message-ID: <cover.146eb3617cc9cf442dd4fc7a0a8950fb1bc191c8.1744403499.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some of those patches are collected from my stubdomain test series, others are
made while getting the new runner working. This series initially included
adding Zen4 runner, but drop it in this version as there is quite enough stuff
here already, and there are few more dependencies for the new runner (fixing
some PVH issues, getting 6.12 kernel to build etc).

This series also evolved into refactoring initrd/rootfs handling and now
depends on test-artifacts changes posted by Andrew. This significantly reduces
hw test jobs time.

Marek Marczykowski-Górecki (7):
  CI: wait for Xen to start before waiting for test to complete
  CI: fix waiting for final test message
  CI: switch qubes runners to use console.exp
  CI: write whole etc/issue for domU initrd
  CI: avoid repacking initrd as part of the test job
  CI: remove now unused alpine-3.18-arm64-rootfs job and its container
  CI: save toolstack artifact as cpio.gz

 automation/build/alpine/3.18-arm64v8.dockerfile           |  1 +-
 automation/gitlab-ci/build.yaml                           | 11 +-
 automation/gitlab-ci/test.yaml                            |  6 +-
 automation/scripts/build                                  |  2 +-
 automation/scripts/console.exp                            | 40 +++-
 automation/scripts/qemu-alpine-x86_64.sh                  | 12 +-
 automation/scripts/qemu-smoke-dom0-arm32.sh               |  1 +-
 automation/scripts/qemu-smoke-dom0-arm64.sh               | 10 +-
 automation/scripts/qemu-smoke-dom0less-arm32.sh           |  1 +-
 automation/scripts/qemu-smoke-dom0less-arm64.sh           |  9 +-
 automation/scripts/qemu-xtf-dom0less-arm64.sh             |  1 +-
 automation/scripts/qubes-x86-64.sh                        | 79 ++------
 automation/scripts/xilinx-smoke-dom0-x86_64.sh            | 23 +-
 automation/scripts/xilinx-smoke-dom0less-arm64.sh         | 17 +--
 automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile | 66 +-------
 15 files changed, 108 insertions(+), 171 deletions(-)
 delete mode 100644 automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile

base-commit: 7bf777b42cade81d4f20f78cb85c4bc0f638de7b
-- 
git-series 0.9.1

