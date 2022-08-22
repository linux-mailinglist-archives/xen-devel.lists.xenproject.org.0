Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AF459C2B4
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 17:27:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391468.629310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ9Ku-0003H7-Rl; Mon, 22 Aug 2022 15:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391468.629310; Mon, 22 Aug 2022 15:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ9Ku-0003Dx-OZ; Mon, 22 Aug 2022 15:27:32 +0000
Received: by outflank-mailman (input) for mailman id 391468;
 Mon, 22 Aug 2022 15:27:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YSJC=Y2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oQ9Kt-0003Dm-4E
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 15:27:31 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecadb46c-222e-11ed-bd2e-47488cf2e6aa;
 Mon, 22 Aug 2022 17:27:28 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 236F03200A55;
 Mon, 22 Aug 2022 11:27:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 22 Aug 2022 11:27:24 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Aug 2022 11:27:19 -0400 (EDT)
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
X-Inumbo-ID: ecadb46c-222e-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1661182041; x=1661268441; bh=gUW5D9LD3cdHwMQPYd75erht9//zLlY5a+P
	2oLxz5yo=; b=IYnb5zf5CLHCUP1kCMhULK9yUUvi9Ubz9b1P2Mc53YvIQ97xpdm
	dZ8VLXLUog/X4EMk3Ol0/qIOX83DGTJR2l4frr0EJAqIaW9Kua9PRvil7gCqKpgb
	ilSWcwAD1xuJBwPjrNmZWv0L1TbtyGrtd3gnlQU5hyy+f0eXdlQNA3/1GwbgfhrU
	jGKEV9PTrs9ZpfHXQH85n9lobArjjew9iDwiHS1h0lhVa38+1CqTVxndhZGHB/rJ
	RQjemFs7ei7Fos+sseOcCoezf6It0jDG0KOf7f+FotxVLTWQO41e4Jg+KNq77Rje
	1tZ0XPrOCsVVV77wdZsUaBOdBvWhMd/jceg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1661182041; x=1661268441; bh=gUW5D9LD3cdHw
	MQPYd75erht9//zLlY5a+P2oLxz5yo=; b=Je16SDgYrAtGz/Xr60eKqjcBzhAQB
	HERfVVNNDxCu0ideOAft7PYlaJz/v6GSk6DoxkPvnZG6ClO0DrQqPexzVKtXKZVe
	5bAsC4mr0H6BpBLCAAoO5IWzqii6tWF3XteUWnnWpfbOrUqNX8RfXq19G2j6H/NT
	ycc2Fa4dE4m8a+7FBeyKYKEx25SVO7DC+sJDB8Vlw/c0XjPTLYzjopJN2tj1+Xnk
	gtdoJNR8bZQqbXwN6D2OKYQxmb56qrr6rX5fBPgKB+QYuemW+JJALiBhy9oNvegX
	9gw9ZiM7HcGah6CG9jOeCjPWRcXBjQfZtxu6Ca/gYb/FQoz+aTOpsMRxw==
X-ME-Sender: <xms:WaADYyv6CQxJd0yAh7Bp0CxGgEJ4OoaBUHniiuE60KPYLZRKunTT8A>
    <xme:WaADY3dCnEjTU77vJ3lH633MgiFGpOrGFYRNGyhzye-pnl-RSQbWCdWv8NDpYPSkz
    _JnEpLylDNEeQ>
X-ME-Received: <xmr:WaADY9yOU73qVovfOGboqRg_t-wpWCIk-TQ1j1_N82khJikS5JmXVw21_LKCEcbbvX48HUm6U0G7Chvo7qgDSQmzJX2FrBlSf5Opsc_LhNg7osAI3Bq_Kg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeijedgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeefgffg
    geevhffggfetfefhffeuvefhvdevkeehkedttddtgeefkeduheevffduleenucffohhmrg
    hinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:WaADY9PnoG6EGyZ4MQOD3Fdeo2I1Xi-YSwSqQFIKPQcExsYzLVbrWQ>
    <xmx:WaADYy8LkpeWJRo-vOkguhacyuypaluVL3Yag14DiFWHcPiaWzMe0g>
    <xmx:WaADY1WZdVFvdeclJ-CQyTJ0JyDrzz3_gk08gVF-xunDkoQPlEWERw>
    <xmx:WaADY1ajW6FRVXC9P7uHe83--Py2hxGN8ICEOw5Po_xt-MbcqO3MuQ>
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
Subject: [PATCH v5 0/9] Add Xue - console over USB 3 Debug Capability
Date: Mon, 22 Aug 2022 17:27:00 +0200
Message-Id: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
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

Marek Marczykowski-Górecki (9):
  drivers/char: separate dbgp=xhci to dbc=xhci option
  console: support multiple serial console simultaneously
  IOMMU: add common API for device reserved memory
  IOMMU/VT-d: wire common device reserved memory API
  IOMMU/AMD: wire common device reserved memory API
  drivers/char: mark DMA buffers as reserved for the XHCI
  drivers/char: add RX support to the XHCI driver
  drivers/char: allow driving the rest of XHCI by a domain while Xen uses DbC
  drivers/char: fix handling cable re-plug in XHCI console driver

 docs/misc/xen-command-line.pandoc        |  36 ++-
 xen/drivers/char/Kconfig                 |  11 +-
 xen/drivers/char/console.c               |  98 +++++--
 xen/drivers/char/serial.c                |   6 +-
 xen/drivers/char/xhci-dbc.c              | 335 +++++++++++++++++++++---
 xen/drivers/passthrough/amd/iommu_acpi.c |  21 ++-
 xen/drivers/passthrough/iommu.c          |  46 +++-
 xen/drivers/passthrough/vtd/dmar.c       | 201 ++++++++------
 xen/include/xen/iommu.h                  |  14 +-
 xen/include/xen/serial.h                 |   2 +-
 10 files changed, 623 insertions(+), 147 deletions(-)

base-commit: f6cd15188e097de1eb04855eb790a5f51c3ad71a
-- 
git-series 0.9.1

