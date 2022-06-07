Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E348F540165
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 16:31:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343345.568666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyaEm-00064h-H1; Tue, 07 Jun 2022 14:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343345.568666; Tue, 07 Jun 2022 14:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyaEm-00061L-Dk; Tue, 07 Jun 2022 14:31:16 +0000
Received: by outflank-mailman (input) for mailman id 343345;
 Tue, 07 Jun 2022 14:31:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fbs7=WO=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nyaEj-000619-Rs
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 14:31:14 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 797a938f-e66e-11ec-bd2c-47488cf2e6aa;
 Tue, 07 Jun 2022 16:31:11 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 0F4E85C009E;
 Tue,  7 Jun 2022 10:31:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 07 Jun 2022 10:31:10 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Jun 2022 10:31:07 -0400 (EDT)
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
X-Inumbo-ID: 797a938f-e66e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1654612270; x=1654698670; bh=R7ACutaosRorqKmEfDpSiNv/WJ0bp2X+dUr
	jFXbFlLE=; b=BukLq8aYQVUqGFBvGB5c79tvLsRiyYeFEkyTZT987Q1vGIUU/IQ
	nNw/7jj9+a3OHve83km1Wch4tUWz3FdMLSJloYjOmtp45KwxXfWNJTBWju81Nbh7
	8GYY29h82zR2/EyA9eAScOY/HxRGdCd2nmVg9CMpF+ESwel1NEmZaMb4sxN/QRFn
	GloNiIcQ2gwfLcXWpKiBhTgOH7xji6Jinz59Sb5PGGJTPKNM7CyZ/+m80k480MVe
	8CyI5H2U7kUXcCaCCYfaNBROTFYFsREFWwqO9kHo0ndYqvSFKy3saen69cd6c7MC
	3axYkp1Y94b4bE1UZNLsf/XfbZ9+Ex7N7pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1654612270; x=1654698670; bh=R7ACutaosRorq
	KmEfDpSiNv/WJ0bp2X+dUrjFXbFlLE=; b=BPf11H9T2WD6/YZ6LCN9RfvsvYZwa
	cJaurm1EnjUJb2N0cpTu8jTo3FRW3HJOxeuazNRwKnAW9bLEhXJXXRLuQMQ3cblH
	eJwsxIqg1CXzHsJydQwFqpI3bl9bf27ZTtQoxB/2LPcvlpvGccTWi0bY3OPL/ZHR
	V6jwZx6BDZe3a438HqxfhI3V/pxjkMB1Xq9hpwoLw/9/AnLiuL1pwuotc41EEM+E
	jrmJr9/uWHyI4AL4wOrs5ED5QuiuNVn5RgJ46Jilu5uzbWHfnyH7ML73PvCRjpSZ
	ldD4w2KoBpEcReQL27q9UKqXoYnk4Cwd7a4PudsTqX8uTTkRV6TIglnqQ==
X-ME-Sender: <xms:LWGfYsK5A69vdfLE98_MidZDABvZUbdOYirSG0xzkWnhjOEArLve7w>
    <xme:LWGfYsJ_SKC66dD2M3emnfmsFlTqSkhu34Xfhs_As6W0tQ4_dPwElM-EWqw508pKA
    CwWwBkICFRxCQ>
X-ME-Received: <xmr:LWGfYssJ31tLVE97orF4Pg01iv6bbjqsri282Fppva3IVkZ0Lstyg16Tnyf88tHicWh5LWEwSbeB2uA1PsmtW3pPSc9z1pi2kZnPrFgKICi9CALKFRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeefgffg
    geevhffggfetfefhffeuvefhvdevkeehkedttddtgeefkeduheevffduleenucffohhmrg
    hinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:LWGfYpb5ytZa_dz10dx15H08k-q7QpXgd98R1Bf6vxmC31ogSgiWKA>
    <xmx:LWGfYjbNNDf3KNSqqUt6no1mHGR8B54d0p-bLVGcTF3dmNo7r7fyTQ>
    <xmx:LWGfYlCAiHTQvQIC8rZMZbZ1AUq7wO-WMdNfKuw69gM-wkoufnFNdg>
    <xmx:LmGfYtmriZTmcLe2yhFp6Xml2BzHjhRS9Mo5yAFFLyhCyXqG9cAg1w>
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
Subject: [PATCH v1 00/10] Add Xue - console over USB 3 Debug Capability
Date: Tue,  7 Jun 2022 16:30:06 +0200
Message-Id: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
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

Marek Marczykowski-Górecki (9):
  xue: reset XHCI ports when initializing dbc
  xue: add support for selecting specific xhci
  ehci-dbgp: fix selecting n-th ehci controller
  console: support multiple serial console simultaneously
  IOMMU: add common API for device reserved memory
  IOMMU/VT-d: wire common device reserved memory API
  IOMMU/AMD: wire common device reserved memory API
  xue: mark DMA buffers as reserved for the device
  xue: allow driving the rest of XHCI by a domain while Xen uses DbC

 docs/misc/xen-command-line.pandoc        |    5 +-
 xen/arch/x86/Kconfig                     |    1 +-
 xen/arch/x86/include/asm/fixmap.h        |    4 +-
 xen/arch/x86/setup.c                     |    1 +-
 xen/drivers/char/Kconfig                 |    7 +-
 xen/drivers/char/Makefile                |    1 +-
 xen/drivers/char/console.c               |   58 +-
 xen/drivers/char/ehci-dbgp.c             |    2 +-
 xen/drivers/char/xue.c                   | 1089 +++++++++++++++++++++++-
 xen/drivers/passthrough/amd/iommu_acpi.c |   16 +-
 xen/drivers/passthrough/iommu.c          |   40 +-
 xen/drivers/passthrough/vtd/dmar.c       |  203 ++--
 xen/include/xen/iommu.h                  |   11 +-
 xen/include/xen/serial.h                 |    1 +-
 14 files changed, 1342 insertions(+), 97 deletions(-)
 create mode 100644 xen/drivers/char/xue.c

base-commit: 49dd52fb1311dadab29f6634d0bc1f4c022c357a
-- 
git-series 0.9.1

