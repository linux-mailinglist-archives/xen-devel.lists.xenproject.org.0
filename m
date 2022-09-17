Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5077D5BB5AB
	for <lists+xen-devel@lfdr.de>; Sat, 17 Sep 2022 04:52:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408200.650928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZNvp-00033R-0S; Sat, 17 Sep 2022 02:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408200.650928; Sat, 17 Sep 2022 02:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZNvo-0002zA-Sv; Sat, 17 Sep 2022 02:51:48 +0000
Received: by outflank-mailman (input) for mailman id 408200;
 Sat, 17 Sep 2022 02:51:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=os+o=ZU=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oZNvn-0002wR-M2
 for xen-devel@lists.xenproject.org; Sat, 17 Sep 2022 02:51:47 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a96cd88d-3633-11ed-a31c-8f8a9ae3403f;
 Sat, 17 Sep 2022 04:51:44 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DFD5C5C00A9;
 Fri, 16 Sep 2022 22:51:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 16 Sep 2022 22:51:42 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Sep 2022 22:51:40 -0400 (EDT)
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
X-Inumbo-ID: a96cd88d-3633-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1663383102; x=1663469502; bh=azpcZR6JeUZIjxremNW7dMxcSa72o8Eqspg
	1UYeperM=; b=rVBrqaUaVy5k6ji35yWuVwf5gUECeUatT+jwluP9dJO89eWwcQF
	GSyDtw+2jiitfN/iFUbgfA3JMMnNo6vr2ynGAwXuJqFhJJcOwZfgCxsm8xf2F1jk
	bGQhyYf+QrOrKh9BpLRiRcgIY2e06wZSXuDxPey3771dEMJ/oZkn5P3yIngtmpc5
	HV7S4EiAIs8Pj9Ge0y18yBUTbvkJi2mnqXQaVlLHdI9HrZ9SHCQjMDjGdd7TaJbB
	OTgTwjQFh3qdftSIDJeRofE2+E2B6SSe1OVuqZ9ugjpfzT+i6QzEADVs4qe+jc9Q
	gWLbFzGIoIrXysfoiB611E1G5VV41Lq2OKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1663383102; x=1663469502; bh=azpcZR6JeUZIj
	xremNW7dMxcSa72o8Eqspg1UYeperM=; b=owE7MAZsZdwCbLBirD5OKdiE+bWX1
	Nfu30cDUGXL4S2u11oAo+ymRsqW5bKgoJg8gEqpKeRH2BGHutOqzyxo7BWoXavKD
	jVDaeDIyerUiWlTnYSJA0HH2Kj/JYw7Pv/yAg1whJa56z04btRi+8tQtd5wh0ICv
	wqVWgco2hwCkU5wvGEhA5YajhPikXWHi1n82ZWn1ucNMFAoJXSmh2VOnidtNkEiV
	ckoEdlFVUMdkEmivttMJzBtoUtamMnIyPa1RPh5kG3Fy8w0Vs9N0ofwInyPKbaK0
	/V8nVnXcJyBe4+iksd0NeyT1im3b1loTj4R7aOTT0feQSPxRmoMheqSBQ==
X-ME-Sender: <xms:PjYlY2uSM3bMjJRa-IWTzkoMcZWHBuxFMztLGOc1YA9KTGLDLT5X9Q>
    <xme:PjYlY7eVG7Z12GWoal1AzxTGFVFd_LaXDW9bHXXQyEXWI4ijtIQiQreMn0Utm_cAY
    VNTFoKLDur1Og>
X-ME-Received: <xmr:PjYlYxyBVQAOUchiWePBWT_u79I2ovWfakw0_lTpmwH6BWvGcwF0vHyX4T8iCamtVd4ZKqKO-9ika079QbYJ5WFN1nfSeDSGNkjO959EtTIbPihDMjziSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvuddgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeefgffg
    geevhffggfetfefhffeuvefhvdevkeehkedttddtgeefkeduheevffduleenucffohhmrg
    hinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:PjYlYxONGom1pySyPOHQVr5K2IN0k2GjzJIB-Jj-hn2yxeeWg2Ja3g>
    <xmx:PjYlY2_n1P6vmiCbc9HaGor2X5hhR5nWVuvtEqiTTricph_WWznB0g>
    <xmx:PjYlY5XgzuXoabQCdA-GVnynTp1qoFontkjO6HcqpAqitBvy0fliXg>
    <xmx:PjYlY5YYiS7tNXbwwR3-9tyJ_RtpYrgCiGUa4ggGMFZmXe1EpWXPbg>
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
Subject: [PATCH v7 00/11] Add Xue - console over USB 3 Debug Capability
Date: Sat, 17 Sep 2022 04:51:19 +0200
Message-Id: <cover.677e6604707b02741b065906ac6f3ea8f3a2f4ca.1663383053.git-series.marmarek@invisiblethingslab.com>
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
Changes since v4:
 - drop first 4 patches - already applied to staging
 - split dbgp=xhci into dbc=xhci
Changes since v5:
 - roll dbc=xhci back into dbgp=xhci, but make it work together with dbgp=ehci
Changes since v6:
 - reorder patches - put acked ones early (I've put acked IOMMU ones early too,
   even without VT-d, because they do make it work on AMD, and it's kind
   of required to get the console work with IOMMU enabled)
 - drop barriers patch (at least for now)
 - new patches for suspend support and console=ehci alias

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

Marek Marczykowski-Górecki (11):
  drivers/char: allow using both dbgp=xhci and dbgp=ehci
  IOMMU: add common API for device reserved memory
  IOMMU/AMD: wire common device reserved memory API
  drivers/char: mark DMA buffers as reserved for the XHCI
  drivers/char: add RX support to the XHCI driver
  drivers/char: fix handling cable re-plug in XHCI console driver
  drivers/char: allow driving the rest of XHCI by a domain while Xen uses DbC
  IOMMU/VT-d: wire common device reserved memory API
  console: support multiple serial console simultaneously
  drivers/char: suspend handling in XHCI console driver
  drivers/char: add console=ehci as an alias for console=dbgp

 docs/misc/xen-command-line.pandoc        |  30 +-
 xen/drivers/char/Kconfig                 |  11 +-
 xen/drivers/char/console.c               |  98 ++++--
 xen/drivers/char/ehci-dbgp.c             |  14 +-
 xen/drivers/char/serial.c                |  12 +-
 xen/drivers/char/xhci-dbc.c              | 392 +++++++++++++++++++++---
 xen/drivers/passthrough/amd/iommu_acpi.c |  21 +-
 xen/drivers/passthrough/iommu.c          |  46 +++-
 xen/drivers/passthrough/vtd/dmar.c       | 201 +++++++-----
 xen/include/xen/iommu.h                  |  14 +-
 xen/include/xen/serial.h                 |   4 +-
 11 files changed, 693 insertions(+), 150 deletions(-)

base-commit: 3007efadf74d6146a1c0ff1c2fbbae6b53ce7898
-- 
git-series 0.9.1

