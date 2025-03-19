Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E870A699D3
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 20:53:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921099.1325097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuzSl-0000iR-Qq; Wed, 19 Mar 2025 19:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921099.1325097; Wed, 19 Mar 2025 19:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuzSl-0000gQ-Nx; Wed, 19 Mar 2025 19:52:27 +0000
Received: by outflank-mailman (input) for mailman id 921099;
 Wed, 19 Mar 2025 19:52:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mgHu=WG=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tuzSi-0000gJ-S3
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 19:52:26 +0000
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abec4f6f-04fb-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 20:52:21 +0100 (CET)
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
X-Inumbo-ID: abec4f6f-04fb-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742413940; x=1742673140;
	bh=oQ+ebqmHQPg2Ej7WSbUSoqIIIp4Cb1iNKBatjjPI8v8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Y8VehL7XJvk4mfFJZbddN2/OFr+3CIx0GXLcAHbQ6dTdFJ6AIfKEH8fps8XJOLZYy
	 ywlPhzwDCpvdGxKb3FLJzILW71m3Ay1ZpyTPrich0nLNYu9pCrnLtWvJfYojN0hDlW
	 dlMgAPEZ9sT6UeDTP/8LAaN5Yo92rXr+tVtavjXsElL9cTq2gcmDpDOe1JBkKxQHaD
	 gtr0Ehw44HmHOk+bJ0NR/hh3XVoj3bNhglfqcX+tf+boyOlrOvNywRaHVpsyaiSluN
	 nnsIuh8Qz1/NU0N+sMYOzhp//Vi5LMKGJA4Qjp04empyAG4A3RxlPXNQgG06Ma+bts
	 nQoXCspdNZFCw==
Date: Wed, 19 Mar 2025 19:52:14 +0000
To: xen-devel@lists.xenproject.org
From: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v1 0/8] xen/console: cleanup console input switch logic
Message-ID: <LjHBVVon45WUi3x9m82YirIv4G283_RHtMZmIeruG51WIbK_rduU9YzuEqAf1EaPo5CafFr1hJFc6w-HW0pISILMq3SkADABP43LwEOqbWU=@proton.me>
In-Reply-To: <20250318233617.849903-1-dmukhin@ford.com>
References: <20250318233617.849903-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 0903348d78abf3bf5f5adb6d37ed51a4b244e12e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, March 18th, 2025 at 4:36 PM, dmkhn@proton.me <dmkhn@proton.me> =
wrote:

>=20
>=20
> Currently, on x86, console input can be rotated in round-robin manner
> only between dom0, PV shim, and Xen itself. On Arm the input rotation
> can include domUs with vpl011.
>=20
> The patch series introduces the concept of "console focus", which is
> defined as the ID of the domain that currently owns the physical console
> input.
>=20
> The patch series originates from the NS16550 UART emulator series [1]
> for x86, which requires ability to switch physical console input to a
> PVH/HVM domain with an emulated UART.
>=20
> The main idea is introducing a per-domain permission flag that is set
> during domain initialization and used by the console driver to switch
> the input across permitted domains.
>=20
> Patch 0 removes all the trailing white spaces in the console driver code.
>=20
> Patch 1 introduces a new domain permission flag to mark ownership of the
> console input for the console driver.
>=20
> Patches 2-4 prepare console driver to allow console input rotation
> across multiple domains based on the new permission flag.
>=20
> Patches 5-6 perform mechanical renames to fit the usage in the code.
>=20
> Patch 7 cleans up the console input switch logic.
>=20
> Patch 8 simplifies the existing vUART code by using newly introduced APIs=
.

Corrected series explanation:

Patch 1 removes all the trailing white spaces in the console driver code.

Patch 2 introduces a new domain permission flag to mark ownership of the
console input for the console driver.
=20
Patches 3, 4 prepare console driver to allow console input rotation
across multiple domains based on the new permission flag.

Patches 5, 6 perform mechanical renames to fit the usage in the code.
=20
Patch 7 cleans up the console input switch logic.

Patch 8 simplifies the existing vUART code by using newly introduced APIs.


>=20
> CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1723361=
248
>=20
> [1]: https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-0-c5d3=
6b31d66c@ford.com/
>=20
> Denis Mukhin (8):
> xen/console: fix trailing whitespaces
> xen/console: introduce console input permission
> xen/domain: introduce domid_top
> xen/domain: introduce domid_alloc()
> xen/console: rename switch_serial_input() to console_switch_focus()
> xen/console: rename console_rx to console_focus
> xen/console: introduce console_set_focus()
> xen/console: introduce console_get_focus()
>=20
> xen/arch/arm/dom0less-build.c | 15 ++-
> xen/arch/arm/domain_build.c | 19 +++-
> xen/arch/arm/include/asm/setup.h | 2 -
> xen/arch/arm/setup.c | 2 -
> xen/arch/arm/vpl011.c | 7 +-
> xen/arch/ppc/include/asm/setup.h | 2 -
> xen/arch/riscv/include/asm/setup.h | 2 -
> xen/arch/x86/include/asm/setup.h | 2 -
> xen/arch/x86/pv/shim.c | 2 +
> xen/common/domain.c | 5 +
> xen/common/domctl.c | 71 +++++++++------
> xen/common/kernel.c | 8 ++
> xen/drivers/char/console.c | 142 +++++++++++++++++------------
> xen/include/xen/console.h | 3 +-
> xen/include/xen/domain.h | 5 +
> xen/include/xen/sched.h | 8 +-
> 16 files changed, 180 insertions(+), 115 deletions(-)
>=20
> --
> 2.34.1

