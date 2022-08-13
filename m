Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD9B591839
	for <lists+xen-devel@lfdr.de>; Sat, 13 Aug 2022 03:40:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386014.621860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMg7V-0000rb-S1; Sat, 13 Aug 2022 01:39:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386014.621860; Sat, 13 Aug 2022 01:39:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMg7V-0000pf-NV; Sat, 13 Aug 2022 01:39:21 +0000
Received: by outflank-mailman (input) for mailman id 386014;
 Sat, 13 Aug 2022 01:39:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zRGa=YR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oMg7T-0000pT-K0
 for xen-devel@lists.xenproject.org; Sat, 13 Aug 2022 01:39:20 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd1771b4-1aa8-11ed-bd2e-47488cf2e6aa;
 Sat, 13 Aug 2022 03:39:16 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 62ABB5C008F;
 Fri, 12 Aug 2022 21:39:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 12 Aug 2022 21:39:14 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Aug 2022 21:39:12 -0400 (EDT)
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
X-Inumbo-ID: bd1771b4-1aa8-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1660354754; x=1660441154; bh=jAU6/33E6J2XS8de59Iv1i+VWObk9wBkC+I
	uB7O8D+Y=; b=h6w9HADi6jpG+wiUwgqw3ee1CLWSqesO/HbEXaIZMM+tS5j0Uu4
	apNy+IS1+UMHs1dDpJZsXlIBnHzPsU+M2mPf9U1qWldXt4XfIHXX79CMebTf9aIj
	uRjMa4uTVzWbF3VlBYzDZP7yx5VMS4CHNLfLLCV9Qm3aELxL/KsE8xAiqaVPz6SY
	StlesPWBleGEqxyE6whtMRLC6ZJhN9kHj4b/5tIn+tAYTQ8qojwiACkIUUMhnExG
	IjcqsYEgK//YMxW/YV4Ho+veMMsjmq23xK9C3AX79vCSmwOhajktXPP4HhguEHac
	aijA33/TyWJYRtV8+6pHli7POiyKH7Bma2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1660354754; x=1660441154; bh=jAU6/33E6J2XS
	8de59Iv1i+VWObk9wBkC+IuB7O8D+Y=; b=JudS5PJmOQUDBz2j/IuQN6HawgboA
	LZikczMq4RxPH+f0mQSdnrwYMnrg7FyHZ2yDh8j1NAm1AOmRzZTBc2jWO5xGeR8M
	ouR8zvfTlF2/GJByhQxg5H3QnKp86vOdnYdqPHkAezoCYtBW5hKTyKpz+xJTEBAd
	CxZVuiQGCiH/ff+2OTlwsAvOQGj+08/HHBj2bNiHSCiUWtEkuSo+T9DqzG0VZ3Rj
	6VfUY5RAIRdDJfA7zCxrqlad3yfkjGlvRizNaLy2SrRVOYdx+SrnZRTuc9ojQALG
	RHit3rd21mK+qwhJpaM51SiD1QASOdP8wfEkFYC5HN6Gm8PAwzprOY+3Q==
X-ME-Sender: <xms:wQD3Yobk3kkMrCw1YuiytrQ61X8dDnyPKat48W2TrkRjRmJQg5tB7w>
    <xme:wQD3YjbNtdyS0PkaaPzTi3-Q69S4zq4Ft0yIoYSfC73Iqu_YF6By_g-XkmavKnBGx
    gTZYLlJjpHhIw>
X-ME-Received: <xmr:wQD3Yi8870iVHmHTOgNjDr_C2C82Wz9P7C4wXxhC7RGPFbGG08dfuFDGxrbb1oZpdy2HnPoi7Y8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegjedghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeefgffg
    geevhffggfetfefhffeuvefhvdevkeehkedttddtgeefkeduheevffduleenucffohhmrg
    hinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:wQD3YipGJoD_2riocFNpBqb_DfSJWAGdNCaXIuXcKCbL8fD7UtuV9A>
    <xmx:wQD3YjpgUUpr2ZolHgnAxJw4tR4lShoJzq3BB8EOoPgixguucmltJQ>
    <xmx:wQD3YgSxeEMehvu08rzc3Q4J4hUG3WzRoXXYWRydIuFubusAqRxtiQ>
    <xmx:wgD3Ym1FYX4tiC4fvLUU_kWOXnzGQDEMoZqqAaioxW19GgRCm7ziXg>
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
Subject: [PATCH v4 00/11] Add Xue - console over USB 3 Debug Capability
Date: Sat, 13 Aug 2022 03:38:50 +0200
Message-Id: <cover.05bda81c2f5ff91948f96e397b6836bcede71ef8.1660354597.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is integration of https://github.com/connojd/xue into mainline Xen.
This patch series includes several patches that I made in the process, some are
very loosely related.

The driver developed by Connor supports console via USB3 debug capability. The
capability is designed to operate mostly independently of normal XHCI driver,
so this patch series allows dom0 to drive standard USB3 controller part, while
Xen uses DbC for console output.

Changes since RFC:
 - move the driver to xue.c, remove non-Xen parts, remove now unneeded abstraction
 - adjust for Xen code style
 - build for x86 only
 - drop patch hidding the device from dom0
Changes since v1:
 - drop ehci patch - already applied
 - adjust for review comments from Jan (see changelogs in individual patches)
Changes since v2:
 - add runtime option to share (or not) the controller with dom0 or other domains
 - add RX support
 - several smaller changes according to review comments
Changes since v3:
 - put controller sharing behind experimental kconfig option
 - several other changes according to review comments

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
  drivers/char: Add support for USB3 DbC debugger

Marek Marczykowski-Górecki (10):
  drivers/char: reset XHCI ports when initializing dbc
  drivers/char: add support for selecting specific xhci
  drivers/char: make serial_parse_handle take const argument
  console: support multiple serial console simultaneously
  IOMMU: add common API for device reserved memory
  IOMMU/VT-d: wire common device reserved memory API
  IOMMU/AMD: wire common device reserved memory API
  drivers/char: mark DMA buffers as reserved for the XHCI
  drivers/char: add RX support to the XHCI driver
  drivers/char: allow driving the rest of XHCI by a domain while Xen uses DbC

 docs/misc/xen-command-line.pandoc        |   22 +-
 xen/arch/x86/include/asm/fixmap.h        |    4 +-
 xen/arch/x86/setup.c                     |    1 +-
 xen/drivers/char/Kconfig                 |   31 +-
 xen/drivers/char/Makefile                |    1 +-
 xen/drivers/char/console.c               |   98 +-
 xen/drivers/char/serial.c                |    2 +-
 xen/drivers/char/xhci-dbc.c              | 1399 +++++++++++++++++++++++-
 xen/drivers/passthrough/amd/iommu_acpi.c |   21 +-
 xen/drivers/passthrough/iommu.c          |   45 +-
 xen/drivers/passthrough/vtd/dmar.c       |  201 +--
 xen/include/xen/iommu.h                  |   13 +-
 xen/include/xen/serial.h                 |    8 +-
 13 files changed, 1740 insertions(+), 106 deletions(-)
 create mode 100644 xen/drivers/char/xhci-dbc.c

base-commit: 6d6aee437e37fced0c49be97e08c30da873690fc
-- 
git-series 0.9.1

