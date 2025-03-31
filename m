Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7704CA77142
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 01:06:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933113.1335138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzOCG-0003Kq-GI; Mon, 31 Mar 2025 23:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933113.1335138; Mon, 31 Mar 2025 23:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzOCG-0003Ij-Dg; Mon, 31 Mar 2025 23:05:36 +0000
Received: by outflank-mailman (input) for mailman id 933113;
 Mon, 31 Mar 2025 23:05:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MI1n=WS=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tzOCD-0003Id-Fl
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 23:05:34 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3c8ebde-0e84-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 01:05:29 +0200 (CEST)
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
X-Inumbo-ID: a3c8ebde-0e84-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743462328; x=1743721528;
	bh=bx402NalM9Q9561gDSzMNIBVydfKL7X0jaCGQHifp7Q=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=O+P5iBK2RFFDqIoNVIgO2n8Dujp7YJOJ618PNTq7XBtWz50t8U5QqLnMh8p7VXDN5
	 Z6NJ3IPF2vDnDDXzSuPfc9DzZ3RvrATqB1gqsNnfbcoaK6xjer5jKGiA7JKhbh9DSd
	 aeBSuMdfeihF2uqge484jtikT4yQEcYgTYT3iXopQmkQVVNInZNkQEP25Hoj6BJnMA
	 V5PT0J+b2M84tWq2IW4TRKnusHhnb7l8QUDV7OT+dZcd3RrZqDBA8EUxT5S8++nqbR
	 pD7JAuZZP5f3q1L4iAMqVo56vZPzkRJT+OV/0Ec2uz98UrI1yWAJvAw19xW9PuDkef
	 FCZBrsf1HmTpA==
Date: Mon, 31 Mar 2025 23:05:24 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 0/7] xen/console: cleanup console input switch logic
Message-ID: <20250331230508.440198-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: db5457489bbde1121d88189599b6978ebbff108d
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Currently, on x86, console input can be rotated in round-robin manner
only between dom0, PV shim, and Xen itself. On Arm the input rotation
can include domUs with vpl011.
 =20
The patch series introduces the concept of "console focus", which is
defined as the ID of the domain that currently owns the physical console
input.
 =20
The patch series originates from the NS16550 UART emulator series [1]
for x86, which requires ability to switch physical console input to a
PVH/HVM domain with an emulated UART.
=20
The main idea is introducing a per-domain permission flag that is set
during domain initialization and used by the console driver to switch
the input across permitted domains.

Patch 1 introduces a new domain permission flag to mark ownership of the
console input for the console driver.
=20
Patches 2, 3 prepare console driver to allow console input rotation
across multiple domains based on the new permission flag. Patch 3
depends on patch 2.

Patches 4, 5 perform mechanical renames to fit the usage in the code.
=20
Patch 6 cleans up the console input switch logic; depends on patches
3, 4, 5.

Patch 7 simplifies the existing vUART code by using newly introduced APIs,
depends on patch 5.

[1] https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-0-c5d36b3=
1d66c@ford.com/
[2] Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelin=
es/1745537898
[3] Link to v1: https://lore.kernel.org/xen-devel/20250318233617.849903-1-d=
mukhin@ford.com/=20

Denis Mukhin (7):
  xen/console: introduce console input permission
  xen/domain: introduce domid_alloc()
  xen/domain: introduce domid_top()
  xen/console: rename switch_serial_input() to console_switch_input()
  xen/console: rename console_rx to console_focus
  xen/console: introduce console_set_focus()
  xen/console: introduce console_get_focus()

 xen/arch/arm/dom0less-build.c      |  15 ++--
 xen/arch/arm/domain_build.c        |  19 +++--
 xen/arch/arm/include/asm/setup.h   |   2 -
 xen/arch/arm/setup.c               |   2 -
 xen/arch/arm/vpl011.c              |   7 +-
 xen/arch/ppc/include/asm/setup.h   |   2 -
 xen/arch/riscv/include/asm/setup.h |   2 -
 xen/arch/x86/include/asm/setup.h   |   2 -
 xen/arch/x86/pv/shim.c             |   2 +
 xen/arch/x86/setup.c               |   8 +-
 xen/common/domain.c                |  70 +++++++++++++++++
 xen/common/domctl.c                |  45 +----------
 xen/drivers/char/console.c         | 121 ++++++++++++++++-------------
 xen/include/xen/console.h          |   3 +-
 xen/include/xen/domain.h           |   4 +
 xen/include/xen/sched.h            |   8 +-
 16 files changed, 186 insertions(+), 126 deletions(-)

--=20
2.34.1



