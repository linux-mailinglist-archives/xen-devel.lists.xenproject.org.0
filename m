Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 385CAACE799
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 02:47:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006088.1385340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMykU-0003XD-Q9; Thu, 05 Jun 2025 00:46:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006088.1385340; Thu, 05 Jun 2025 00:46:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMykU-0003Um-N8; Thu, 05 Jun 2025 00:46:26 +0000
Received: by outflank-mailman (input) for mailman id 1006088;
 Thu, 05 Jun 2025 00:46:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nB46=YU=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uMykR-0003Uc-BS
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 00:46:24 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7db9419a-41a6-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 02:46:18 +0200 (CEST)
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
X-Inumbo-ID: 7db9419a-41a6-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749084377; x=1749343577;
	bh=yrHPGYbphu2Gt/MWqUwv4rxzUWxk5rYWOxUjjk+StiI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=XOnSHChjc3rjbnxCyzFn5uiyVWRhKK9nRR0LiFO9H4ixSDkynmzakXCi+Q3fPskrB
	 KOXkHZJnyb2hiH7Q8gEyBitWvCgO4VsLsNx7M/MSPyh//n92HdJLMlYu6laDFvMy3c
	 2XTri4Ovw64lLw6Iac9bcEmYEQ2sU/ZZ5B9V0J6mG4uotrwYjdBYAR0/l+0sT5IVft
	 Eq8gk4j9nt3SeX3kPYoz/atqakXMtC5f+MosR5WYgGqBJkGOeIVtUhw4JFAcv4JWMP
	 d/Us3Y03IlxQuteOfA/E1ZipaJnHEkOSYJVGqcaHThfTDoFIkuomRd0d97YDrH3YzM
	 SxsnZIt8VGSKg==
Date: Thu, 05 Jun 2025 00:46:08 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 0/2] xen/console: updates to diagnostic messages prefixes
Message-ID: <20250605004601.1142090-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: a2a99761fe885937cf59d8c8f5e33a91c8916145
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Patch 1 is purely cosmetic change, adds a symbol for hypervisor's messages.

Patch 2 updates the logic how the domain prefix is formed for guest message=
s
sent over emulated UART.

[1] Link to v1: https://lore.kernel.org/xen-devel/20250531000417.81750-1-dm=
ukhin@ford.com/
[2] Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelin=
es/1854205416

Denis Mukhin (2):
  xen/console: introduce CONSOLE_PREFIX
  xen/console: unify printout behavior for UART emulators

 xen/arch/arm/vpl011.c      |  6 +++---
 xen/arch/arm/vuart.c       |  2 +-
 xen/drivers/char/console.c | 30 ++++++++++++++++++++++++++----
 3 files changed, 30 insertions(+), 8 deletions(-)

--=20
2.34.1



