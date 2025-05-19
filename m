Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7EAABC7F2
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 21:40:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990217.1374164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH6LV-0004LC-0F; Mon, 19 May 2025 19:40:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990217.1374164; Mon, 19 May 2025 19:40:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH6LU-0004If-T3; Mon, 19 May 2025 19:40:20 +0000
Received: by outflank-mailman (input) for mailman id 990217;
 Mon, 19 May 2025 19:40:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wD6k=YD=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uH6LT-0004IZ-BU
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 19:40:19 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17d4d88c-34e9-11f0-a2fa-13f23c93f187;
 Mon, 19 May 2025 21:40:18 +0200 (CEST)
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
X-Inumbo-ID: 17d4d88c-34e9-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747683616; x=1747942816;
	bh=6QHXa3icmGRPFD0w15MS/LTXzAqACSE6Jxm0cnbJJuk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=X2/804Xy236AYGJ2af+wHt8nyjWCwIWi5A0+0BEoDR3clF3530UCo2x5jnuOByADG
	 vOgK/4SCvYQSiAxyDxXAl5fTDv5z0WfPCB76GypXlwImmqOWodp9KfcwC5FKdiQcRv
	 zfkY9PBsJ7fNhaEwKCX2x1bM1TYZfM+Z9nL/XOzbPNxFV0Y+4+KS3JDF7ryQtNo9XD
	 RVd/xEW10M1WDFkO0/qsDO7lPLP50GD72LFvI8GUo3qZ5UKOZQc1zhPe0Xp1GCotbe
	 VuV/Uy2MeFKhuVxBrb6LeP6Yq9bpFOiJ6olO43UCp1L5kxeKMzrfuCoj4OXs2lBomq
	 q8vmGkm4iD6fQ==
Date: Mon, 19 May 2025 19:40:11 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v5 0/3] xen/console: few cleanups in console driver
Message-ID: <20250519194002.1365454-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 8a3d96259a16250a8a7f2bcba45492d1cbffbb46
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

xen/console: few cleanups in console driver

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
[4] Link to v4: https://lore.kernel.org/xen-devel/20250516013508.1144162-1-=
dmukhin@ford.com/
[5] Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelin=
es/1823639304

Denis Mukhin (3):
  xen/console: cleanup conring management
  xen/console: introduce console_send()
  xen/console: introduce conring_flush()

 xen/drivers/char/console.c | 186 +++++++++++++++++++++++--------------
 1 file changed, 116 insertions(+), 70 deletions(-)

--=20
2.34.1



