Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8665809EE
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 05:23:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374934.607151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGBAR-0003Rn-0G; Tue, 26 Jul 2022 03:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374934.607151; Tue, 26 Jul 2022 03:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGBAQ-0003P6-Tu; Tue, 26 Jul 2022 03:23:30 +0000
Received: by outflank-mailman (input) for mailman id 374934;
 Tue, 26 Jul 2022 03:23:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zoO2=X7=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oGBAP-0003P0-Hv
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 03:23:29 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50bfcbde-0c92-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 05:23:28 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9C45D5C00C4;
 Mon, 25 Jul 2022 23:23:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 25 Jul 2022 23:23:27 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Jul 2022 23:23:25 -0400 (EDT)
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
X-Inumbo-ID: 50bfcbde-0c92-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1658805807; x=1658892207; bh=k9jiFqn51KOOI3U/+3qfkMWa6aFW6+VVMrP
	BEdhS56M=; b=vZ/QRA655qUHdCeHVhbIWlYnF8sVQCFTkJ+hbLLCueP1Baa+eT4
	mhxPEX/IxsbTvyBzChMj9Zte3wswbYu2zn/cNuWhFIgPkNvzUWn3uZ+qHFWg8ZC+
	HxWYU/S3n0U3gpwvhD+5tXdPar4bmnb+rastZ1RJacfQV9QhO7qpoQp3s1DcpAS6
	LgG5P3E2pUJfIWaIUig8A0a2V0RmaHs3EKGJV8hD0gI9XzPLAawbXd1/MA/XS4Dg
	eaYeZ96UiI3ASUaA2xRq0A0ai5Bkx0WxUQmktBlJ4uN0h5JrV9KO3IzduB4UUA9O
	5/3ExKBtc7I00L9FkxWjcKdqVPgwAFQ1yTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1658805807; x=1658892207; bh=k9jiFqn51KOOI
	3U/+3qfkMWa6aFW6+VVMrPBEdhS56M=; b=J5x6/abGkbWhobYAAN2psLNxLWKEP
	oavtbI80Qta4m4ukptTuUuVTX/6BYklorcfYFkV86/+HzgnUYe4XrwfjhrbmpChs
	TPLsDKtXjFKfdfT9bG5OHS512bAIPTFLJtHi9kZX45GUbTyezB2qKT1mhpu5b9sU
	By9hDrgwk92/RI6AGFCsBOHAAhEIW2iZXtqvat4T8dEGC3BzOsmnF3v4Hyj9THlu
	+agFvjMj1xQo//7C0HeJ40YC9xa6DtWMLdxZpCYRF89Qp2seLA1wv0d5UVbYl0zU
	J7jNqMhJG8N4cOvS3rJei+EYrrtOUOjErKEEVDDTK2i8wEnorygIun5Iw==
X-ME-Sender: <xms:L17fYl9_jIlKIyzEsf99jcp0UVe3xcuivDcB1n2KI_wN3fopsLNbaw>
    <xme:L17fYpuxy-BXL_SqmpltDt3__-udVh9VTGMc8tkN9CyUx9hE834BJiPv2UXiKJK1s
    gXjnGEGatAfag>
X-ME-Received: <xmr:L17fYjA5kNTjLPG6ra3gLjw1zu_-BYyijMYCRITbN_9oJk0772x4rJPlL1UosXY4p3K5t5_vvrjVZC435iUMjpq4I6FY_-Gq1u7w82YLmnnMXB-3oIVp3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtledgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeefgffg
    geevhffggfetfefhffeuvefhvdevkeehkedttddtgeefkeduheevffduleenucffohhmrg
    hinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:L17fYpfl7LGoPYJYk6cKh9fZDdCna99L-6pccoEm-30doUF0o_DUTQ>
    <xmx:L17fYqMvm21KpRFHvnl7xpB6ThBVAsaJuLbkN9969NexDeIX3C4vlA>
    <xmx:L17fYrlWCt1PZsmnA4hOnuWwfcAzH6L4YdX7W35pMgBl0UZ3WCZJyg>
    <xmx:L17fYhqacsyF6NzSvx63y_oYC4o41GpvcvZNQ6BcmZCnbua4xurTDg>
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
Subject: [PATCH v3 00/10] Add Xue - console over USB 3 Debug Capability
Date: Tue, 26 Jul 2022 05:23:05 +0200
Message-Id: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
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

Marek Marczykowski-Górecki (9):
  drivers/char: reset XHCI ports when initializing dbc
  drivers/char: add support for selecting specific xhci
  console: support multiple serial console simultaneously
  IOMMU: add common API for device reserved memory
  IOMMU/VT-d: wire common device reserved memory API
  IOMMU/AMD: wire common device reserved memory API
  drivers/char: mark DMA buffers as reserved for the XHCI
  drivers/char: allow driving the rest of XHCI by a domain while Xen uses DbC
  driver/char: add RX support to the XHCI driver

 docs/misc/xen-command-line.pandoc        |   19 +-
 xen/arch/x86/include/asm/fixmap.h        |    4 +-
 xen/arch/x86/setup.c                     |    1 +-
 xen/drivers/char/Kconfig                 |   20 +-
 xen/drivers/char/Makefile                |    1 +-
 xen/drivers/char/console.c               |   97 +-
 xen/drivers/char/xhci-dbc.c              | 1367 +++++++++++++++++++++++-
 xen/drivers/passthrough/amd/iommu_acpi.c |   21 +-
 xen/drivers/passthrough/iommu.c          |   45 +-
 xen/drivers/passthrough/vtd/dmar.c       |  201 +--
 xen/include/xen/iommu.h                  |   13 +-
 xen/include/xen/serial.h                 |    6 +-
 12 files changed, 1690 insertions(+), 105 deletions(-)
 create mode 100644 xen/drivers/char/xhci-dbc.c

base-commit: 4df2e99d731402da48afb19dc970ccab5a0814d6
-- 
git-series 0.9.1

