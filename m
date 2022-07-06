Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF2A568CE2
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 17:33:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362331.592328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o971L-0008FZ-7t; Wed, 06 Jul 2022 15:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362331.592328; Wed, 06 Jul 2022 15:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o971L-0008Cy-4e; Wed, 06 Jul 2022 15:32:55 +0000
Received: by outflank-mailman (input) for mailman id 362331;
 Wed, 06 Jul 2022 15:32:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lWdV=XL=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1o971I-00081g-Ll
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 15:32:53 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4461717-fd40-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 17:32:50 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C2C9E5C0190;
 Wed,  6 Jul 2022 11:32:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 06 Jul 2022 11:32:48 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Jul 2022 11:32:45 -0400 (EDT)
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
X-Inumbo-ID: e4461717-fd40-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1657121568; x=1657207968; bh=gXRVGiGc2esI8GnrDirdRc23m3W8gp6wUHz
	KCWUNLqg=; b=IUlZYj8f0MHmJYK8S606DeGQBwEbRHFDc+0GOatQc4r524hejGb
	E7GYO817FMbN34gSfJJTWn3beFHJHB809X6YLSZ+ZGkw/qnFrOV7/wmhaYYUhz9+
	yt/pR9HtNFcIwMHzUjLY89M5AsiQ4pU+3YhZZ5c6a6GpLkW3oKK3UnCvMJiQBhY+
	BcrDFW8ULr7vlynArX2M+w78NydirWGz8MdRfSoT2qutGp/HJL5eN43V2YSW3KFg
	QShHpNdem/iCyHYUoif9KrHD2EDgFVa4XX8FJud8C7NXp+FjTnnUYaZgISJp00XF
	gUiDe8e5lpjdhNwO8AOt0/OKaf7lsBLhs6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1657121568; x=1657207968; bh=gXRVGiGc2esI8
	GnrDirdRc23m3W8gp6wUHzKCWUNLqg=; b=3UFyDPQfzYosTaxseH7KuVuye5BVT
	vM1mhcshooWsV5bQ76uLp1wlU+/e95N062VrkT6uj5Md3ncP7tE07EhhCiQpxj29
	hUj1ycj5WDvXT01h76BYn8Sl9W8E8BMBM64794risP5vjU+VM9H9DQb3/w78BmvL
	ZfG7qEkK7WJr3Leul7LNKexXcE40Yo139WDLSvMq8k1IOtiNG5ITtKqepiJ55WwK
	LvE78DyjedcPWbciS6mmtIdyOiHj+dK1/hm8t2/6eEpJfjE9tBAjyKksWRTE+uAt
	t5LEkZA0UPou8eoLmOzDDYEOTU/bjU2bpe3MOlx/GJm4RmlLhL/s3nacw==
X-ME-Sender: <xms:H6vFYujpDS2E3YORW68ivifGNrJSVd0zXKQCmGrSuLI8YgXo_ptY5Q>
    <xme:H6vFYvAj6cjTiuLQSShfvC0jE0GwvSejqZCGdqPfyDicN8Iu7inwK0TTVzJNhvmFG
    yyAOETGC49YPg>
X-ME-Received: <xmr:H6vFYmFFLjo8ttMjQ1vPCgOzWnEiZa3NcFWrjn57PHBeaWTpEZQiVlaL1I_qRkjg1SdkbO2ltf-3APk0PchJPWpzTBQ5M07LwaRtgRXowlfODtc_teY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeifedgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeefgffg
    geevhffggfetfefhffeuvefhvdevkeehkedttddtgeefkeduheevffduleenucffohhmrg
    hinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:H6vFYnQcWLBBtYqPG7_5EvnFyUuAAqP0-9zkzi9vti-zj-Wh_D5kdw>
    <xmx:H6vFYrwZSE4SbIVTjkyBDAXeTHbZcR5oQG-_zakGJJB9rFxkNKbLxQ>
    <xmx:H6vFYl55CF699q6Fm_vge1o7SB2y86KGZ6bu2UijRH0iDvDV3IgQOw>
    <xmx:IKvFYjdCPfjPjoyj17c0MDA0ZSx1XdwUmdBM0i9uO5-IbV2Cqnnh1A>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 0/9] Add Xue - console over USB 3 Debug Capability
Date: Wed,  6 Jul 2022 17:32:05 +0200
Message-Id: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is integration of https://github.com/connojd/xue into mainline Xen.
This patch series includes several patches that I made in the process, some are
very loosely related.

The driver developed by Connor supports output-only console via USB3 debug
capability. The capability is designed to operate mostly independently of
normal XHCI driver, so this patch series allows dom0 to drive standard USB3
controller part, while Xen uses DbC for console output.

Changes since RFC:
 - move the driver to xue.c, remove non-Xen parts, remove now unneeded abstraction
 - adjust for Xen code style
 - build for x86 only
 - drop patch hidding the device from dom0
Changes since v1:
 - drop ehci patch - already applied
 - adjust for review comments from Jan (see changelogs in individual patches)

Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Connor Davis <connojdavis@gmail.com>

Connor Davis (1):
  drivers/char: Add support for Xue USB3 debugger

Marek Marczykowski-Górecki (8):
  xue: reset XHCI ports when initializing dbc
  xue: add support for selecting specific xhci
  console: support multiple serial console simultaneously
  IOMMU: add common API for device reserved memory
  IOMMU/VT-d: wire common device reserved memory API
  IOMMU/AMD: wire common device reserved memory API
  xue: mark DMA buffers as reserved for the device
  xue: allow driving the rest of XHCI by a domain while Xen uses DbC

 docs/misc/xen-command-line.pandoc        |    5 +-
 xen/arch/x86/include/asm/fixmap.h        |    4 +-
 xen/arch/x86/setup.c                     |    3 +-
 xen/drivers/char/Kconfig                 |    9 +-
 xen/drivers/char/Makefile                |    1 +-
 xen/drivers/char/console.c               |   58 +-
 xen/drivers/char/xue.c                   | 1066 +++++++++++++++++++++++-
 xen/drivers/passthrough/amd/iommu_acpi.c |   16 +-
 xen/drivers/passthrough/iommu.c          |   40 +-
 xen/drivers/passthrough/vtd/dmar.c       |  203 ++--
 xen/include/xen/iommu.h                  |   11 +-
 xen/include/xen/serial.h                 |    3 +-
 12 files changed, 1323 insertions(+), 96 deletions(-)
 create mode 100644 xen/drivers/char/xue.c

base-commit: 0544c4ee4b48f7e2715e69ff3e73c3d5545b0526
-- 
git-series 0.9.1

