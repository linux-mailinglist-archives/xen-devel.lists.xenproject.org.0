Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90368A680C9
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 00:37:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919885.1324218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tugUD-00041j-14; Tue, 18 Mar 2025 23:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919885.1324218; Tue, 18 Mar 2025 23:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tugUC-0003zi-Ul; Tue, 18 Mar 2025 23:36:40 +0000
Received: by outflank-mailman (input) for mailman id 919885;
 Tue, 18 Mar 2025 23:36:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6oY5=WF=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tugUA-0003zY-F2
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 23:36:39 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d508535f-0451-11f0-9abc-95dc52dad729;
 Wed, 19 Mar 2025 00:36:36 +0100 (CET)
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
X-Inumbo-ID: d508535f-0451-11f0-9abc-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742340994; x=1742600194;
	bh=UZRHKlWYAxoJ6bEXSfVNc0RPJQ6YdMQDwDFS2riZSxc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=NgN2R0H/O7lM48rCcKHSR1YLTcWtUmgoj3V8iI816Dbw7XEWNQF3O+CTVPiKPe3Ye
	 ygidmc9/zNnp0GqTHWaa6g1qgeAaaDhy4SdHfNdyUtlfLaBzbLHRUj3xP+GZs2c7XS
	 1v9Uf3g7W6TvhN7i2yz26bAJmF6Xm6v300sdnPbONKAxUdnxs9J6pbCE9O6jFAJ1Tx
	 7mHrPCOTprV2GKSt0UqIytZCgOTyW6tH0D5k9RJpnVkcABv55a/o3IYzDx8+hkybqh
	 Gk/mE7XBTMe+LJcnzwzFPoIz/9Lx4t51BioesnM7pGDyFKySb/NDH1JpgN3GO3U6HQ
	 CNg/3bgpw+Q3g==
Date: Tue, 18 Mar 2025 23:36:30 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 0/8] xen/console: cleanup console input switch logic
Message-ID: <20250318233617.849903-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: be079d31e74ec14998a317e468bab3f1620ded3f
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
=20
Patch 0 removes all the trailing white spaces in the console driver code.
=20
Patch 1 introduces a new domain permission flag to mark ownership of the
console input for the console driver.  =20
=20
Patches 2-4 prepare console driver to allow console input rotation
across multiple domains based on the new permission flag.
=20
Patches 5-6 perform mechanical renames to fit the usage in the code.
=20
Patch 7 cleans up the console input switch logic.
=20
Patch 8 simplifies the existing vUART code by using newly introduced APIs.

CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/172336124=
8

[1]: https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-0-c5d36b=
31d66c@ford.com/

Denis Mukhin (8):
  xen/console: fix trailing whitespaces
  xen/console: introduce console input permission
  xen/domain: introduce domid_top
  xen/domain: introduce domid_alloc()
  xen/console: rename switch_serial_input() to console_switch_focus()
  xen/console: rename console_rx to console_focus
  xen/console: introduce console_set_focus()
  xen/console: introduce console_get_focus()

 xen/arch/arm/dom0less-build.c      |  15 ++-
 xen/arch/arm/domain_build.c        |  19 +++-
 xen/arch/arm/include/asm/setup.h   |   2 -
 xen/arch/arm/setup.c               |   2 -
 xen/arch/arm/vpl011.c              |   7 +-
 xen/arch/ppc/include/asm/setup.h   |   2 -
 xen/arch/riscv/include/asm/setup.h |   2 -
 xen/arch/x86/include/asm/setup.h   |   2 -
 xen/arch/x86/pv/shim.c             |   2 +
 xen/common/domain.c                |   5 +
 xen/common/domctl.c                |  71 +++++++++------
 xen/common/kernel.c                |   8 ++
 xen/drivers/char/console.c         | 142 +++++++++++++++++------------
 xen/include/xen/console.h          |   3 +-
 xen/include/xen/domain.h           |   5 +
 xen/include/xen/sched.h            |   8 +-
 16 files changed, 180 insertions(+), 115 deletions(-)

--=20
2.34.1



