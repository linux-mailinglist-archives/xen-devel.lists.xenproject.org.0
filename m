Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF4DA6083F
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 06:20:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913728.1319632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsxRy-00017T-Md; Fri, 14 Mar 2025 05:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913728.1319632; Fri, 14 Mar 2025 05:19:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsxRy-00014Q-JG; Fri, 14 Mar 2025 05:19:14 +0000
Received: by outflank-mailman (input) for mailman id 913728;
 Fri, 14 Mar 2025 05:19:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HRIH=WB=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1tsxRw-00014K-Rc
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 05:19:12 +0000
Received: from fforwardh-a2-smtp.messagingengine.com
 (fforwardh-a2-smtp.messagingengine.com [103.168.172.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbea4240-0093-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 06:19:11 +0100 (CET)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfforwardh.phl.internal (Postfix) with ESMTP id 624952920249;
 Fri, 14 Mar 2025 01:19:09 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
 by phl-compute-10.internal (MEProxy); Fri, 14 Mar 2025 01:19:09 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Mar 2025 01:19:07 -0400 (EDT)
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
X-Inumbo-ID: dbea4240-0093-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1741929549; x=1742015949; bh=kZfdsh1cDuaKJdNIrBysFqAQEveOzxpyKd+
	rwbGFPAI=; b=7mWnOWIMUSkxgrabbBG2J7jkjLxR7JQDy3nFnDep3bEI2ZAscFq
	Jsuexttxbv3TZKPKtTdvrbd4BY+G5vqG/eTWCmJy9aRXxEioHlCD3A/oKRTHyQ8c
	JQTzqlB2mkSj4Nw6DAih17zTMihr6VYTRzo+nmiV4zjpId7A6SqlIr5a9cbZBsVd
	kQmqTzepEBw2/BgTSay7+OG3n/ERu6E1HYJiz/oQmNchfX/L+xG3nq5n4Xx4THjm
	1f9TVmLfPqz0mS0t3XWXhxpvCVKI9EzKv+E+Q9fe1KsFO7Nm86aUybXj0ilzE+r1
	IEXT6/bti6k+CRww9Ca8iEuv3NDefM/5TCQ==
X-ME-Sender: <xms:S7zTZwaGg10HAac17VncZ-DqI56W8QCpKhV7bG5YP4HbS8FXaiqXng>
    <xme:S7zTZ7aQ5wQsMpkVrfSkTrINV0KtRoTELEM7aPxWGlWvrOjvn5-Ia_DztLk-sEhKm
    Ius8xT2l27kMHPHKps>
X-ME-Received: <xmr:S7zTZ695xFXcaCrjop3T9SQWonZbkHrqMNqYirYhGL2N5y8bQmkiYoDr42YR3i9EutX014EyVEqi0FzzxL9oPanWLay4B08TQ-Lk6gcMm3Hiqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdelleejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:S7zTZ6p1Mj6m17ffG4OAmvjD6Xee8vHOU25xvayYjZheef_gWprMRg>
    <xmx:S7zTZ7qZLvL1frrB-wGt017rrsMILpmbD6c9e_jCxISeTp8H1Hvg1Q>
    <xmx:S7zTZ4QsU4DT49uIKh29H8UxwPs95xcWoBbsQsRCfC1x_N3HUa6M0Q>
    <xmx:S7zTZ7odtlHfOLHBtkSXwV7fyykDUo0_SuTZnyOS7GNPyiLcHk8Z8g>
    <xmx:S7zTZw6RaCWlClw7EklrsPZeNeKMxOSpuw7A1WY76IrwXBVdLfWNLQ>
    <xmx:TbzTZ3oOnGFWh5f-JG45PQO5hrqkcziVUGF7rK4Rj0buyEF-ph3WLhZfDvzK>
Feedback-ID: i75f97a0f:Fastmail
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
Subject: [PATCH v4 0/3] make build of vm_event/mem_access/monitor optional
Date: Fri, 14 Mar 2025 07:19:03 +0200
Message-Id: <cover.1741772330.git.Sergiy_Kibrik@epam.com>
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

v3 series:
https://lore.kernel.org/xen-devel/cover.1741687645.git.Sergiy_Kibrik@epam.com/
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


