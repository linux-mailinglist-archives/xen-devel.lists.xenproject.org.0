Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C8AABC82E
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 22:12:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990252.1374205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH6qd-0001YP-Rw; Mon, 19 May 2025 20:12:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990252.1374205; Mon, 19 May 2025 20:12:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH6qd-0001VW-Oa; Mon, 19 May 2025 20:12:31 +0000
Received: by outflank-mailman (input) for mailman id 990252;
 Mon, 19 May 2025 20:12:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wD6k=YD=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uH6qa-0001VO-Q8
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 20:12:29 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94fec518-34ed-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 22:12:26 +0200 (CEST)
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
X-Inumbo-ID: 94fec518-34ed-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747685545; x=1747944745;
	bh=YnK3jLYPaV1fhqO+rkXjLhrCb+WsBMtOZfRJm26nEZM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=YP+DDJEVyoAVGSP1QRuPscMiebHrsuW1ap2+viODyFkeKIbbTTbVo9voo4QCS/pBT
	 Yd+vDjciyS/wdauFyiRr0G+DYv4HTeIzBS9XkZLagqWtzu4c6JD2+PjInzje1gnErb
	 Dop1VcuBwYTj1jiJdxj1jbcv78BepR5abcxLteVXkZkgSgUCnVTTqL+7kJGrsiJJ86
	 7s9c6y53fLbaAOHgtYeU51kDUxNSsvZX0wcYLXLnMXiVqTPx6Hki+IQJ187VvqVp+J
	 TRwqZk1nLXXSS+2gDz+IXEN5ZzzuYR36Sf8fYQt5p/n6RJ84dJMzykjjnxVOaeOLMR
	 GwqeVEEvwg0PA==
Date: Mon, 19 May 2025 20:12:20 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3 0/5] xen/console: cleanup console input switch logic
Message-ID: <20250519201211.1366244-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: f13a340c786106a4c45b586f208fea8863fccf3f
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

Patch 2 simplifies the existing vUART code by using newly introduced API.

Patch 3 introduces a new domain permission flag to mark ownership of the
console input for the console driver.

Patch 4 cleans up the console input switch logic by removing dependency
on max_init_domid. Depends on patches 1, 3 and [2].

Patch 5 performs rename of console_rx to console_domid to match the usage
of the symbol in the code.

[1] https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-0-c5d36b3=
1d66c@ford.com/
[2] https://lore.kernel.org/xen-devel/20250519192306.1364471-1-dmukhin@ford=
.com/
[3] Link to v2: https://lore.kernel.org/xen-devel/20250331230508.440198-1-d=
mukhin@ford.com/
[4] Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelin=
es/1825448327

Denis Mukhin (5):
  xen/console: rename switch_serial_input() to console_switch_input()
  xen/console: introduce console_get_domid()
  xen/console: introduce console input permission
  xen/console: remove max_init_domid dependency
  xen/console: rename console_rx to console_domid

 xen/arch/arm/include/asm/setup.h        |   2 -
 xen/arch/arm/setup.c                    |   2 -
 xen/arch/arm/vpl011.c                   |   7 +-
 xen/arch/ppc/include/asm/setup.h        |   2 -
 xen/arch/riscv/include/asm/setup.h      |   2 -
 xen/arch/x86/include/asm/setup.h        |   2 -
 xen/arch/x86/pv/shim.c                  |   2 +
 xen/common/device-tree/dom0less-build.c |   2 -
 xen/common/domain.c                     |  31 +++++++
 xen/drivers/char/console.c              | 105 +++++++++++-------------
 xen/include/xen/console.h               |   3 +-
 xen/include/xen/domain.h                |   1 +
 xen/include/xen/sched.h                 |   8 +-
 13 files changed, 94 insertions(+), 75 deletions(-)

--=20
2.34.1



