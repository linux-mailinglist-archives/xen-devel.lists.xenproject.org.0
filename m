Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B5B5AB14A
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 15:18:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397601.638224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU6YQ-0008Tf-GD; Fri, 02 Sep 2022 13:17:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397601.638224; Fri, 02 Sep 2022 13:17:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU6YQ-0008RD-DN; Fri, 02 Sep 2022 13:17:50 +0000
Received: by outflank-mailman (input) for mailman id 397601;
 Fri, 02 Sep 2022 13:17:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uHR5=ZF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oU6YP-0008Qk-7i
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 13:17:49 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a182046f-2ac1-11ed-82f2-63bd783d45fa;
 Fri, 02 Sep 2022 15:17:45 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 12C0D5C00C6;
 Fri,  2 Sep 2022 09:17:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 02 Sep 2022 09:17:44 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Sep 2022 09:17:41 -0400 (EDT)
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
X-Inumbo-ID: a182046f-2ac1-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1662124664; x=1662211064; bh=nIelx/7ZsvQKE+ntxO6p1c58nzAFexkrxQn
	uuZ1QjIc=; b=g4X5PHstvKwVrMkEe4+v+yiKVFmZv36JNuxSBuSwUhiD2oLl3eL
	JiX+UR9/XICDLfEka738bMFm0jRt2gmVwcxQ0e5Nvi6TE87CT2Iu7TQyUlHVS4Al
	VsHjD0kKH/Tx9r2jgx4kwIPGlXQDNdgyRYcNcTb95ntZ6vkfFqzJoJtXHjkAOWku
	RNV5B5SzgTSDINEeew+RnUXChVcoyw5Zy2lCgX9Zj5hfwTFj+sDQKHuIaPS6snRa
	uIBn/qXuZAhf7Q69lAINSdFUQmnZRw+ZT2lbQ74j6Km7oHIt8Cds4ifCZNlcQRDO
	/VpVnA84XQ++yhPF4NyRleMTa94FT5W8OcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1662124664; x=1662211064; bh=nIelx/7ZsvQKE
	+ntxO6p1c58nzAFexkrxQnuuZ1QjIc=; b=L3jf99cVPKras/8TTWmQboWWPC9Kk
	WJcUYOe2jdE0rD0nsaZjKEjPadqTl2OUoc4DW8mtttJFSkdLM9QxiBYWFJ5MRQ+s
	361wY1zeGkNgYfN22dsps5bcj3SENGg8DjGB3owi7upMfJJmyma59b/OT8uBC435
	7SNPxn1pr/fBC89O3dh4JlHSieHRemFdIeI+upW4pGz1JwA4sgYEUzAP9Wz4steW
	gLA7+In+0Hhj3ugDS280R4cvBRQ8VNKGyw6XEhA41+uzfrSfIeaZdqhc80jfrCpH
	X123fuxWJkXkJIevrSe/LoKGP8zFMObfmoZ5hZjz4zklDoUYeJZ4VkeNA==
X-ME-Sender: <xms:dwISY-PyBC3HTK2POPqZPWMPDRQyD0IUwbCnHdAXOzw3Yw61WFUGog>
    <xme:dwISY894jahEM4h6RhjnAe75rpDYnAPCu1BDF2kavJg4Phz6x49t5KCg2fV67p9fn
    a2zC88M8-LUww>
X-ME-Received: <xmr:dwISY1TC-rYXW-8cdQUM1EgPVuNU9S4Dr6BcCtHOByxHpbiRrztND-IsjqAJfCGbOGqsXmC1qftq-udH06TlhQqvhaxomV_Q9-xyIMvRwTZwnGhMdlcZSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeltddgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeefgffg
    geevhffggfetfefhffeuvefhvdevkeehkedttddtgeefkeduheevffduleenucffohhmrg
    hinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:dwISY-uhr3VddEzy2UMEUyxZ195MWyfWUSfzUugokaixupHVs7HGNg>
    <xmx:dwISY2fXKDLXwNwm-WIiG2ALQoNqMDfrKcfQfvMrnAwk624H-lvyjA>
    <xmx:dwISYy3dxHK6G2ddMFf_EER2kUycUBqJsu54UXQ3jH0_l1Vl3nVzSQ>
    <xmx:eAISY24Tbdwr7C-mF2gE73FhjVdKzpiSKcHPwBM3YgymKB7D33kcZw>
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
Subject: [PATCH v6 00/10] Add Xue - console over USB 3 Debug Capability
Date: Fri,  2 Sep 2022 15:17:21 +0200
Message-Id: <cover.00134d06d2e52e209e9f7778513a27cf0b2a3bd3.1662124370.git-series.marmarek@invisiblethingslab.com>
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

Marek Marczykowski-Górecki (10):
  drivers/char: allow using both dbgp=xhci and dbgp=ehci
  console: support multiple serial console simultaneously
  IOMMU: add common API for device reserved memory
  IOMMU/VT-d: wire common device reserved memory API
  IOMMU/AMD: wire common device reserved memory API
  drivers/char: mark DMA buffers as reserved for the XHCI
  drivers/char: add RX support to the XHCI driver
  drivers/char: allow driving the rest of XHCI by a domain while Xen uses DbC
  drivers/char: fix handling cable re-plug in XHCI console driver
  drivers/char: use smp barriers in xhci driver

 docs/misc/xen-command-line.pandoc        |  30 +-
 xen/drivers/char/Kconfig                 |  11 +-
 xen/drivers/char/console.c               |  98 ++++--
 xen/drivers/char/ehci-dbgp.c             |  15 +-
 xen/drivers/char/serial.c                |   6 +-
 xen/drivers/char/xhci-dbc.c              | 364 +++++++++++++++++++++---
 xen/drivers/passthrough/amd/iommu_acpi.c |  21 +-
 xen/drivers/passthrough/iommu.c          |  46 +++-
 xen/drivers/passthrough/vtd/dmar.c       | 201 +++++++------
 xen/include/xen/iommu.h                  |  14 +-
 xen/include/xen/serial.h                 |   4 +-
 11 files changed, 652 insertions(+), 158 deletions(-)

base-commit: e997d055929665b12246e89eb092dc79c65de9a4
-- 
git-series 0.9.1

