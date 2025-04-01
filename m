Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA36A7721E
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 02:52:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933295.1335279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzPrz-000158-Jo; Tue, 01 Apr 2025 00:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933295.1335279; Tue, 01 Apr 2025 00:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzPrz-00012l-Eo; Tue, 01 Apr 2025 00:52:47 +0000
Received: by outflank-mailman (input) for mailman id 933295;
 Tue, 01 Apr 2025 00:52:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dnoa=WT=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tzPrw-00012a-GM
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 00:52:45 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d7e3286-0e93-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 02:52:41 +0200 (CEST)
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
X-Inumbo-ID: 9d7e3286-0e93-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743468760; x=1743727960;
	bh=GFqthro3iq6tf+JDFaLzzXcjIdmu4fT0hxT+wTrVwBk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=QFhMeFhIKw4VC9zjG3iF8PSy/PFNYiNAVIGDcC+het2nmyYd6qAfeJLPWD4C3aP0H
	 2B9yrrvCDG1iKVKmtOhtIEAgiHdQ8gPg1tBX7QnzMDpHTteZaF+pVObR1mzCSMkh4m
	 UNEJH8F1PSbFp71G8ckpYTTtX3JsQ3bn3JNotqxBpc1GlrcWLc688uOXH6FKLaVd9p
	 Sdw+5hIOfjyJR5w3f6MFLIhbbqBiqy7LScOF0/YYWEoa8pG8BZYAwX8sgWAzzO30H0
	 /mvJyjm2J4DrofsIZ/tG18ZQPVu784vmrPhsoWhknyyALSwybwSpLpQggEUMITOXZT
	 5jHXXg3IG+upA==
Date: Tue, 01 Apr 2025 00:52:33 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 0/3] xen/domain: updates to hardware emulation flags
Message-ID: <20250401005224.461325-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 744bf75cc58d419b653e38a1aaca5637be21d919
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The patch series introduces use of d->arch.emulation_flags for non-x86
platforms (patch 1) and hooks emulation_flags to 'q' keyhandler for
debugging. emulation_flags on non-x86 systems will be used in the follow
on virtual UARTs clean up series.

Also, series adds helper macros (patch 2) which are used in re-write of
emulation_flags_ok() on x86 (patch 3, depends on patch 2).

Originally, the code was part of [1], part of NS16550 emulator v3 series.

[1] https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-6-c5d36b3=
1d66c@ford.com/
[2] Link to CI run: https://gitlab.com/xen-project/people/dmukhin/xen/-/pip=
elines/1745622772

Denis Mukhin (3):
  xen/domain: introduce non-x86 hardware emulation flags
  x86/domain: add helpers to simplify emulation flags management
  xen/domain: rewrite emulation_flags_ok()

 tools/python/xen/lowlevel/xc/xc.c   |  4 +---
 xen/arch/arm/include/asm/domain.h   |  2 ++
 xen/arch/ppc/include/asm/domain.h   |  2 ++
 xen/arch/riscv/include/asm/domain.h |  2 ++
 xen/arch/x86/domain.c               | 29 +++++++++++------------------
 xen/arch/x86/include/asm/domain.h   |  2 +-
 xen/common/keyhandler.c             |  1 +
 xen/include/public/arch-x86/xen.h   |  7 +++++++
 8 files changed, 27 insertions(+), 22 deletions(-)

--=20
2.34.1



