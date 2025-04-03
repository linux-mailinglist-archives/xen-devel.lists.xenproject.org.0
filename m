Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE96A79936
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 02:07:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936146.1337449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u086G-0001rb-SV; Thu, 03 Apr 2025 00:06:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936146.1337449; Thu, 03 Apr 2025 00:06:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u086G-0001pL-PY; Thu, 03 Apr 2025 00:06:28 +0000
Received: by outflank-mailman (input) for mailman id 936146;
 Thu, 03 Apr 2025 00:06:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Em9L=WV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u086E-0001pF-KV
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 00:06:27 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7aaea449-101f-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 02:06:24 +0200 (CEST)
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
X-Inumbo-ID: 7aaea449-101f-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743638782; x=1743897982;
	bh=zScPCgDT4Rb2CxmAcwTQX1VAw0rGhJQd5Vd3GI95vFs=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=nQ6H9rS4xOh9K8hq4mLIdT3yLizr5ao/wQ6y70zrRT4V2PQpcXQOWOgGRHvTDCFWH
	 uUl5S13Cclm+ihbFvGyqis9F8p82r/fLnx/r5R+KnE0KYReS8maExKmLLkyMlN3Edg
	 zS9MQ2d3JVyLhcQYWOP77/n6xqehPfpQRufF35ko0yWzkd5NgVojJgwibYhZHG0GTg
	 ckNxokDQEFO8zjPN/hMCQGwzzTTrYN/NSlKH1QjoezFOJ3j7pxKEvsOUMjRxyrPTqQ
	 rpm5gBk599HSpAt3q3x5tscQtcXOUGqQsJSiS8lf6pWJu0bWsEexQ4P/p0udDPY2qL
	 IZJ3+kHtAsCIw==
Date: Thu, 03 Apr 2025 00:06:17 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 0/3] xen/console: few cleanups in console driver
Message-ID: <20250403000604.169619-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: b5d0944d21a12ab39365ae4c2243e62852d793a7
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
[4] CI link: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/=
1749584524

Denis Mukhin (3):
  xen/console: cleanup conring management
  xen/console: introduce console_puts()
  xen/console: introduce conring_flush()

 xen/drivers/char/console.c | 175 ++++++++++++++++++++++---------------
 1 file changed, 104 insertions(+), 71 deletions(-)

--=20
2.34.1



