Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 119D0AC9784
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 00:03:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001558.1381684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL7od-00049P-Pk; Fri, 30 May 2025 22:03:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001558.1381684; Fri, 30 May 2025 22:03:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL7od-00046p-ME; Fri, 30 May 2025 22:03:03 +0000
Received: by outflank-mailman (input) for mailman id 1001558;
 Fri, 30 May 2025 22:03:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AEV3=YO=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uL7oa-00045N-Ii
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 22:03:01 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5574dfd-3da1-11f0-b894-0df219b8e170;
 Sat, 31 May 2025 00:02:53 +0200 (CEST)
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
X-Inumbo-ID: d5574dfd-3da1-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1748642571; x=1748901771;
	bh=glH4XqxhewUB98TpoL3qF3CvZPVH4kQohk0QLoyW63o=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=YhKDr1Y6BIZaFGU1eF6k9x1mFKKTLH689Ksj7RQH+m7N1zUAREJRmsJllIgY9W9Lu
	 9p5BDEM118hTTPAte6HtlsVmKhgVo5d4PuUtzK3BVqnma3o9DFnaPwI7/ip8EmP9wR
	 KTr9ESXMdrnltcSJtRHFkLjyZFuOkWve3lNSGwCLjnQyaj9nOS3X84kIBCLLkshuWj
	 MWiPdBEf6zIUSjzPWvclIub02i50Su+uPkm32IvMfrWkpCOI/DiQ6tKNm3IqovBfZR
	 Nf6r9OW+Fu77H0pEt5Ux5QFeNIdC5PYXeSr+52aWCc2D6H0VqSrR7keDCdY1OKhiD7
	 62DUNYPD1WenQ==
Date: Fri, 30 May 2025 22:02:46 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v4 0/2] xen/domain: updates to hardware emulation flags
Message-ID: <20250530220242.63175-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 144328512307bc879ff491f1c005bcdbf1fe5f74
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Patch 1 introduces emulation_flags in common domain struct for enabling dom=
ain
emulation features on non-x86 platforms.

Patch 2 rewrites emulation_flags_ok() on x86 with a goal of improving
readability and maintainability of the code.

Originally, the code was part of [1], part of NS16550 emulator v3 series.

[1] https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-6-c5d36b3=
1d66c@ford.com/
[2] Link to v3: https://lore.kernel.org/xen-devel/20250528210139.2572609-1-=
dmukhin@ford.com/
[3] Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelin=
es/1845145225

Denis Mukhin (2):
  xen/domain: introduce common hardware emulation flags
  xen/domain: rewrite emulation_flags_ok()

 xen/arch/x86/domain.c             | 93 ++++++++++++++++++++++++-------
 xen/arch/x86/domctl.c             |  2 +-
 xen/arch/x86/include/asm/domain.h | 25 ++++-----
 xen/common/keyhandler.c           |  1 +
 xen/include/xen/sched.h           |  2 +
 5 files changed, 89 insertions(+), 34 deletions(-)

--=20
2.34.1



