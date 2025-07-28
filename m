Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B45BB142E5
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 22:23:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061938.1427542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugUNU-0003Qi-6B; Mon, 28 Jul 2025 20:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061938.1427542; Mon, 28 Jul 2025 20:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugUNU-0003Oq-1F; Mon, 28 Jul 2025 20:23:20 +0000
Received: by outflank-mailman (input) for mailman id 1061938;
 Mon, 28 Jul 2025 20:23:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BLX+=2J=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ugUNR-0003OM-FC
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 20:23:18 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afb08085-6bf0-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 22:23:13 +0200 (CEST)
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
X-Inumbo-ID: afb08085-6bf0-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753734192; x=1753993392;
	bh=H25JjHBc/18R4Og2ToMQuBqOpyBiSiTSB6Jz4uoypV0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=DDJOT2Vn9o0dPBGg3nlnIRwd/K/bc0hufYin65Y/WSX6nf/JWvzQTnNSCJpryx/NJ
	 UTaNjNFB6RXEZaUQ+Ek4j4+cpUFfHNulSkOqpVW5qzRn7gPxu7Ccw1IGAo1TxiwcFO
	 TVkqXTOZyN5phXFZuX1fwMWhk4iU44LGcZqbDfQeM7Y8TFy3KnF59EBqfnUci1sBtz
	 eiSbtRpbYYMiuEWa/O3EOz2MCCQnHbNDr/1xziSm2cypCuAAU2RefVgjHwDxduMr3Y
	 mClMSYc9RGlunax0MUjYDvIBv/vpIe8EQ1gCcn61ynD3l7DfIj6NLFhQMk7w3OZoW7
	 XIGGCRtMbpHIQ==
Date: Mon, 28 Jul 2025 20:23:06 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 0/2] remove use of run_in_exception_handler() in console code
Message-ID: <20250728202300.1017904-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 2b301c782d1a2465257867d89cc4f37f222b12ee
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The series is a small cleanup in console drivers which removes
run_in_exception_handler() in few places.

Patch 1 updates EHCI driver.

Patch 2 updates NS16550-compatible driver.

[1] Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelin=
es/1953178528

Denis Mukhin (2):
  drivers/ehci-dbgp: remove use of run_in_exception_handle()
  drivers/ns16550: remove use of run_in_exception_handler()

 xen/drivers/char/ehci-dbgp.c | 19 ++-----------------
 xen/drivers/char/ns16550.c   | 18 ++----------------
 2 files changed, 4 insertions(+), 33 deletions(-)

--=20
2.34.1



