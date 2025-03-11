Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F7AA5BDB3
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 11:22:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907683.1314886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwje-000329-Bm; Tue, 11 Mar 2025 10:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907683.1314886; Tue, 11 Mar 2025 10:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwje-00030s-7i; Tue, 11 Mar 2025 10:21:18 +0000
Received: by outflank-mailman (input) for mailman id 907683;
 Tue, 11 Mar 2025 10:21:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RDOX=V6=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1trwjc-00030m-IX
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 10:21:16 +0000
Received: from fforwardh-b1-smtp.messagingengine.com
 (fforwardh-b1-smtp.messagingengine.com [202.12.124.196])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ec6cf79-fe62-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 11:21:14 +0100 (CET)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal
 [10.202.2.47])
 by mailfforwardh.stl.internal (Postfix) with ESMTP id B65D81740269;
 Tue, 11 Mar 2025 06:21:11 -0400 (EDT)
Received: from phl-frontend-01 ([10.202.2.160])
 by phl-compute-07.internal (MEProxy); Tue, 11 Mar 2025 06:21:12 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Mar 2025 06:21:08 -0400 (EDT)
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
X-Inumbo-ID: 8ec6cf79-fe62-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1741688471; x=1741774871; bh=2Defy8U+bjmTXCamc6FHJEvRbqpM+3QzVqD
	UmXwi6Cs=; b=d/85DfpwsQK9T4M+t9OqQvpU+ge8ByQHthQ+PMyiOeDy8GhEOGV
	56RD1tOgi/ILokZGj82+ZC51tqDSTfVm34AFsrKoCnuNplt+WuWEzV9nhkciI31X
	Fqf+cRmlBUODmv/OI/JFxwDfOyDLnYzYXDlwnhSU8OqKBQEIhds4G9fGst4t9E/B
	VZ5WJqhEZOLJ6DFOsMZMShzUcPSECSHf8xFZwG/y86U2piSM/g5VB0+5/8fqDy5K
	x/i9BdRV6FV3dmaFNMmqoLM07fy5rxRxXq+vHuoffXWwBVyH5kqbSw2fxllQb4ft
	DRizUoCmVPnA5z+/dKbns4Zyt6DYGh1TzvQ==
X-ME-Sender: <xms:lQ7QZ1ylZEe6Vzz8o7unOd4i2QfKbS_znGkpqfWQ8CdChTJH1uQ0Jw>
    <xme:lQ7QZ1QsMVPJdoI-4jz0xCBzJr_c7pnwxIduaq2NZzZdOcjzxUe2EtjpsnyNTn6d2
    fwfKsGJfxf-I74GIao>
X-ME-Received: <xmr:lQ7QZ_Wvk0YNPwknIf3Z2UeOaOoEWW2AOzdE1Wge2n62nf6nz28uVtHC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdduleejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttden
    ucfhrhhomhepufgvrhhgihihucfmihgsrhhikhcuoefuvghrghhihigpmfhisghrihhkse
    gvphgrmhdrtghomheqnecuggftrfgrthhtvghrnhepgedvfeefhfduvdetkeegleeggfel
    heekveeiuddufeehtdehleelhfekiedvvedvnecuffhomhgrihhnpehkvghrnhgvlhdroh
    hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehs
    rghkihgssegurghrkhhsthgrrhdrshhithgvpdhnsggprhgtphhtthhopedvuddpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigv
    nhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepshgvrhhgihihpghkihgsrhhikhesvg
    hprghmrdgtohhmpdhrtghpthhtoheptggrrhguohgvsegtrghrughovgdrtghomhdprhgt
    phhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpth
    htoheprghnthhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthhdprhgtphhtthho
    pehmihgthhgrlhdrohhriigvlhesrghmugdrtghomhdprhgtphhtthhopehjsggvuhhlih
    gthhesshhushgvrdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhr
    tghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:lQ7QZ3h1t61-vePn8G2Ek5V24hf5zVhZPddcVNvNVnNPHgqVRbsqbQ>
    <xmx:lQ7QZ3CYimEQK6LwyQe-b7WIgNXxrcVE_PCiiyEvWePSmO2JGriZJA>
    <xmx:lQ7QZwIkHjXW8vgUzrrMPk5wGDA6EchMrrplYMjkHCqjtykW4d3GqQ>
    <xmx:lQ7QZ2CypBKS-lu4d-Zi7E-17bL6dynkcevETwsUf1lO6v6L73xz8w>
    <xmx:lQ7QZ7z_kqHKA49fC23zPWen6YwekNy4bPOPYiXXXCZc5YTEVO28CA>
    <xmx:lw7QZ2D3_bcBjhBt3X-mKChJsetnX9oRAm3qC--O6xDaIQtCB5bYPgA3Jasz>
Feedback-ID: ifd673d30:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 0/3] make build of vm_event/mem_access/monitor optional
Date: Tue, 11 Mar 2025 12:21:06 +0200
Message-Id: <cover.1741687645.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series aims to provide a possibility to build Xen without mem_access and
related features. It is already largely covered by corresponding
CONFIG_MEM_ACCESS option, yet there're still some parts remaining.
Hopefully this would help to reduce dead code a bit.

As coverage of MEM_ACCESS config option begins to extend beyond actual
mem_access code it has been suggested to rename it into VM_EVENT, as a more
general option controlling mem_access, vm_event and monitor code.

One patch for automation from v2 series had been squashed into #1 patch in
v3 series, v2 reference below:
https://lore.kernel.org/xen-devel/cover.1737452864.git.Sergiy_Kibrik@epam.com/

  -Sergiy

Sergiy Kibrik (2):
  xen: kconfig: rename MEM_ACCESS -> VM_EVENT
  x86:monitor: control monitor.c build with CONFIG_VM_EVENT option

Stefano Stabellini (1):
  xen: mem_access: conditionally compile vm_event.c & monitor.c

 automation/gitlab-ci/build.yaml         |  2 +-
 xen/arch/arm/Makefile                   |  6 +++---
 xen/arch/arm/configs/tiny64_defconfig   |  2 +-
 xen/arch/arm/include/asm/mem_access.h   |  4 ++--
 xen/arch/arm/vsmc.c                     |  3 ++-
 xen/arch/ppc/configs/ppc64_defconfig    |  2 +-
 xen/arch/riscv/configs/tiny64_defconfig |  2 +-
 xen/arch/x86/Kconfig                    |  2 +-
 xen/arch/x86/Makefile                   |  2 +-
 xen/arch/x86/mm/Makefile                |  2 +-
 xen/common/Kconfig                      |  2 +-
 xen/common/Makefile                     |  6 +++---
 xen/common/domctl.c                     |  2 +-
 xen/include/xen/mem_access.h            |  6 +++---
 xen/include/xen/monitor.h               |  9 +++++++++
 xen/include/xen/vm_event.h              | 14 +++++++++++---
 xen/include/xsm/dummy.h                 |  2 +-
 xen/include/xsm/xsm.h                   |  4 ++--
 xen/xsm/dummy.c                         |  2 +-
 xen/xsm/flask/hooks.c                   |  4 ++--
 20 files changed, 48 insertions(+), 30 deletions(-)

-- 
2.25.1


