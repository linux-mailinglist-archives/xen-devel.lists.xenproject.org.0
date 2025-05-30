Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DD1AC9813
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 01:19:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001600.1381715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL906-0004us-Eg; Fri, 30 May 2025 23:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001600.1381715; Fri, 30 May 2025 23:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL906-0004sL-Bh; Fri, 30 May 2025 23:18:58 +0000
Received: by outflank-mailman (input) for mailman id 1001600;
 Fri, 30 May 2025 23:18:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AEV3=YO=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uL903-0004sF-Op
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 23:18:56 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7397ca22-3dac-11f0-a300-13f23c93f187;
 Sat, 31 May 2025 01:18:53 +0200 (CEST)
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
X-Inumbo-ID: 7397ca22-3dac-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=y4v4klxpbrekxnqiutaanpovbi.protonmail; t=1748647131; x=1748906331;
	bh=BCjyQqmmXr9DrrX7yXZOHYjQ7dkkcp3YITAJ3p3dSvk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=mgKNjI3mo4GeQ7yRVg5xOEwvH6HeCJj7CTC49bs2eUB0GOYCLE9CYFIJ6WLlTxMj+
	 7UoicfBwJRyZlcDQZXfsy2BCK6J7/tHTI6P3YRIkvosOMyigmVLJF75sdcCiUxirCz
	 NbWqhuEMaFD6fguuDU2eS4gZp0/Mw5O/CzAOKfyZf2MwBgye9SBN9rxCtsyYCkkzLg
	 3Y5XX1OCtABndbjyzD88vWIPGVG9tmEKpU42y7aajVVu3lmQqOLi4GSS06h8gQ49Xl
	 BQXp2lce+6kl3WXroODeBjUuQzdKCO/ndisJE9/CsJEzIS/TcJs8wN8HwcEfcj9cS3
	 mY1FnCh9mCiNw==
Date: Fri, 30 May 2025 23:18:46 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v5 0/4] xen/console: cleanup console input switch logic
Message-ID: <20250530231841.73386-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: c0b2d05618d0335d67c55fdda1874d0c513bd904
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
[3] Link to v4: https://lore.kernel.org/xen-devel/20250529000848.2675903-1-=
dmukhin@ford.com/
[4] Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelin=
es/1845329909

Denis Mukhin (4):
  xen/console: rename switch_serial_input() to console_switch_input()
  xen/console: introduce console input permission
  xen/console: remove max_init_domid dependency
  xen/console: rename console_rx to console_domid

 xen/arch/arm/include/asm/setup.h        |  2 -
 xen/arch/arm/setup.c                    |  2 -
 xen/arch/arm/vpl011.c                   |  1 +
 xen/arch/ppc/include/asm/setup.h        |  2 -
 xen/arch/riscv/include/asm/setup.h      |  2 -
 xen/arch/x86/include/asm/setup.h        |  2 -
 xen/arch/x86/pv/shim.c                  |  2 +
 xen/common/device-tree/dom0less-build.c |  2 -
 xen/common/domain.c                     | 35 +++++++++
 xen/drivers/char/console.c              | 96 +++++++++++--------------
 xen/include/xen/domain.h                |  1 +
 xen/include/xen/sched.h                 |  8 ++-
 12 files changed, 88 insertions(+), 67 deletions(-)

--=20
2.34.1



