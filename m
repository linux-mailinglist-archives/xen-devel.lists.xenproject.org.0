Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6211AC74D2
	for <lists+xen-devel@lfdr.de>; Thu, 29 May 2025 02:09:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999629.1380261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKQpe-0001Eh-Kf; Thu, 29 May 2025 00:09:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999629.1380261; Thu, 29 May 2025 00:09:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKQpe-0001DG-Gn; Thu, 29 May 2025 00:09:14 +0000
Received: by outflank-mailman (input) for mailman id 999629;
 Thu, 29 May 2025 00:09:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VQJb=YN=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uKQpb-0001DA-S6
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 00:09:12 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24946ce1-3c21-11f0-a2fe-13f23c93f187;
 Thu, 29 May 2025 02:09:09 +0200 (CEST)
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
X-Inumbo-ID: 24946ce1-3c21-11f0-a2fe-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1748477348; x=1748736548;
	bh=fXnq4428mtXJJTvN8RDXljIOFAvdt9NLb3tDvOQykf0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=PXNCM5xrL0ef41Ny2K/+880cFfsVjGHJ/YgzqYeWcuorLbRJegKISxrlDoztqEtEA
	 +Ibbsg8bsg69gMjn5QiH39jGguZ/ttyRAaIfYO2LOKIpRd8Hwr2JaatoBuPjC2z2g2
	 rA0TatyL1MSOP3Uk09fE93WCJJtGTgE48bPOCezfG48awTalH3tGe/rdsrAIGliFdX
	 59OIWR5BkF40fGmdlNb1s0dMfK978p7mdSn53JLbcCW3BDdsYjH1WRvnB0iGXl07nk
	 wR+ynxZFv/STZYfsMSLsvHlT5IZCC7BS8SMdW6xjjcQ16KtSaT2cjSO7VhcktbYrdy
	 x0L9rIPhQnDeQ==
Date: Thu, 29 May 2025 00:08:58 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v4 0/4] xen/console: cleanup console input switch logic
Message-ID: <20250529000848.2675903-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: ccd94a3d72fd7dc839ba735fa2e7b99fb260556b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The patch series originates from the NS16550 UART emulator series [1] (x86)
which requires ability to switch physical console input to a PVH/HVM domain
with an emulated UART.

Currently, on x86, console input can be rotated in round-robin manner only
between dom0, PV shim, and Xen itself. On Arm the input rotation can includ=
e
domUs with vpl011.

The main idea of this series is introducing a per-domain permission flag th=
at
is set during domain initialization and used by the console driver to switc=
h
the input across permitted domains.

Patch 1 performs rename of switch_serial_input() to fit the console driver
notation.

Patch 2 introduces a new domain permission flag to mark ownership of the
console input for the console driver.

Patch 3 cleans up the console input switch logic by removing dependency
on max_init_domid. Depends on patches 1, 2 and [2].

Patch 4 performs rename of console_rx to console_domid to match the usage
of the symbol in the code.

[1] https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-0-c5d36b3=
1d66c@ford.com/
[2] https://lore.kernel.org/xen-devel/20250528225030.2652166-1-dmukhin@ford=
.com/
[3] Link to v3: https://lore.kernel.org/xen-devel/20250519201211.1366244-1-=
dmukhin@ford.com/
[4] Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelin=
es/1841674752

Denis Mukhin (4):
  xen/console: rename switch_serial_input() to console_switch_input()
  xen/console: introduce console input permission
  xen/console: remove max_init_domid dependency
  xen/console: rename console_rx to console_domid

 xen/arch/arm/include/asm/setup.h        |  2 -
 xen/arch/arm/setup.c                    |  2 -
 xen/arch/arm/vpl011.c                   |  2 +
 xen/arch/ppc/include/asm/setup.h        |  2 -
 xen/arch/riscv/include/asm/setup.h      |  2 -
 xen/arch/x86/include/asm/setup.h        |  2 -
 xen/arch/x86/pv/shim.c                  |  2 +
 xen/common/device-tree/dom0less-build.c |  2 -
 xen/common/domain.c                     | 31 ++++++++
 xen/drivers/char/console.c              | 96 +++++++++++--------------
 xen/include/xen/domain.h                |  1 +
 xen/include/xen/sched.h                 |  8 ++-
 12 files changed, 85 insertions(+), 67 deletions(-)

--=20
2.34.1



