Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3448FAB93AC
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 03:36:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986094.1371759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFjz9-0004sY-O5; Fri, 16 May 2025 01:35:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986094.1371759; Fri, 16 May 2025 01:35:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFjz9-0004r0-LJ; Fri, 16 May 2025 01:35:39 +0000
Received: by outflank-mailman (input) for mailman id 986094;
 Fri, 16 May 2025 01:35:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=07xk=YA=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uFjz6-0004qs-UN
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 01:35:38 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d9130f1-31f6-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 03:35:31 +0200 (CEST)
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
X-Inumbo-ID: 0d9130f1-31f6-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747359329; x=1747618529;
	bh=Rkth2alHQQ+ODaS2FsPGzdQJwFsYzELi5LADKzDkptw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=J5UOez6+TXaqRdrBqTGIfOcVjRroKAlbyS+iRbTW80rhzaeNMvKDn4N+Ioy8G/3nv
	 xetkaU4rgWgvVLt+5MsgYi6zAVBX4TE27qNnP5i1hVR6N+VtSSqS0A/4dlw4i825ZB
	 w7eENduIGfPv1macli1mgLRYva/gkySajF99eKqTej1apz0bKBLGOHFaT+Q/sy7A5G
	 7KbxNExWc+XR5AfZcrZ1vFFEzuVfyH1CtdI+xJVBQGS9+o5IjQ0Wb9WkEkOxtpKnJ8
	 nCSL1miUaXC+yeUs3f/FquaBZvB1WJ3OTsxHQxk+IIyY4PiQPf/pYQhzx5FtHsOE3G
	 4Rdpc+f08/mWA==
Date: Fri, 16 May 2025 01:35:24 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v4 0/3] xen/console: few cleanups in console driver
Message-ID: <20250516013508.1144162-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 6fb10cea83077c4d5f3113336f242a8034a394ea
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The patch series introduces a few cleanups aimed at reducing code duplicati=
on
in the console driver and improving readability.

Originally, patches 2 and 3 were part of NS16550 emulator v3 series [1].

Patch 1 performs a cleanup in conring console.

Patch 2 (see [2]) removes code duplication between __putstr() and the rest =
of
the driver. It also introduces private flags to select console devices for
printout which simplifies some code paths.

Patch 3 (see [3]) adds conring_flush() to send contents of conring to all
currently available console devices.

[1] https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-0-c5d36b3=
1d66c@ford.com/
[2] https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-16-c5d36b=
31d66c@ford.com/
[3] https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-17-c5d36b=
31d66c@ford.com/
[4] Link to v3: https://lore.kernel.org/xen-devel/20250504181423.2302345-1-=
dmukhin@ford.com/
[5] Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelin=
es/1820247737

Denis Mukhin (3):
  xen/console: cleanup conring management
  xen/console: introduce console_send()
  xen/console: introduce conring_flush()

 xen/drivers/char/console.c | 184 +++++++++++++++++++++++--------------
 1 file changed, 114 insertions(+), 70 deletions(-)

--=20
2.34.1



