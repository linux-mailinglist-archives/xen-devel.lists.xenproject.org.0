Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6485AA88E6
	for <lists+xen-devel@lfdr.de>; Sun,  4 May 2025 20:15:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975644.1362999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBdrS-000271-AA; Sun, 04 May 2025 18:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975644.1362999; Sun, 04 May 2025 18:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBdrS-000257-5W; Sun, 04 May 2025 18:14:46 +0000
Received: by outflank-mailman (input) for mailman id 975644;
 Sun, 04 May 2025 18:14:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hwa9=XU=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uBdrP-00024w-4N
 for xen-devel@lists.xenproject.org; Sun, 04 May 2025 18:14:44 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4415b21-2913-11f0-9ffb-bf95429c2676;
 Sun, 04 May 2025 20:14:38 +0200 (CEST)
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
X-Inumbo-ID: a4415b21-2913-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1746382478; x=1746641678;
	bh=AJygGobeGopWh5J6bD84LTNs6md6knJaf1SvbQvM6iE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=GFXbgzHe72M/Iw77KN+9dgjIsgYfb1ArHmsB6dHAv7stiVHOzL2GpqlPmJmBRm9nc
	 f7H5cwYCT//JehbuMJc1PVrWOAwyqTYJZ7Dq7blVtEW+P2pnm0KKkSN7yjTIlCyeJ6
	 +QBfZmLmE2rm0ju1tyKX9H6cmoMN1TNdrRbRPGTQHymtZFE9qOJfXHHLarHb5t2Vyf
	 nb1Pdw00OHveMYlv+7fgxmFeUeM7ol66cu53ytVcNHAAN0MVvb+GTHqZt0P08naHLU
	 tdJPIjbcerrxzbuFXOTRx+5FsGNI/6krUuOo1ljbRptiiqOL6ZkwYoPj64URJbv+BK
	 mFr9ADxZJ7LtQ==
Date: Sun, 04 May 2025 18:14:32 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3 0/3] xen/console: few cleanups in console driver
Message-ID: <20250504181423.2302345-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: d78f82172faf701d31078937d206713575851791
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The patch series introduces a few cleanups aimed at reducing code duplicati=
on
in the console driver.

Originally, patches 2 and 3 were part of NS16550 emulator v3 series [1].

Patch 1 removes some code duplication for logging via conring facility.

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
[4] Link to v2: https://lore.kernel.org/xen-devel/20250426185021.100646-1-d=
mukhin@ford.com/
[5] Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelin=
es/1799484502=20

Denis Mukhin (3):
  xen/console: cleanup conring management
  xen/console: introduce console_puts()
  xen/console: introduce conring_flush()

 xen/drivers/char/console.c | 186 +++++++++++++++++++++++--------------
 1 file changed, 115 insertions(+), 71 deletions(-)

--=20
2.34.1



