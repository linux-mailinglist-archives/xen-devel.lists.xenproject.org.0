Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A53AB940D
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 04:29:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986189.1371840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFkp1-0006SD-3i; Fri, 16 May 2025 02:29:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986189.1371840; Fri, 16 May 2025 02:29:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFkp1-0006Q0-0B; Fri, 16 May 2025 02:29:15 +0000
Received: by outflank-mailman (input) for mailman id 986189;
 Fri, 16 May 2025 02:29:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=07xk=YA=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uFkoy-0006Ps-CC
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 02:29:13 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c1426f8-31fd-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 04:29:10 +0200 (CEST)
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
X-Inumbo-ID: 8c1426f8-31fd-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=imedksexubfk5coe2xwez3mdjq.protonmail; t=1747362548; x=1747621748;
	bh=/BEUwhhP72BtvkVKFKsbgSbbCNM2TCebK6uJAiCil08=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=RHDhQN1k6mQpt3G+gtoqDn66xiB8JSwtgeazA6klZbMd44O8CG7detoJPoeaBcnsl
	 eyJwQvq1FdkOxmZHRhzETSVSdIpgD0ZZVE/fVP5CjeZGD4DWmyBIkITfc6AHlG+E9S
	 LhPPayFP2VUv3m6BChYGO1RBpkqyiVJ+2mJOZSkMNZObDddvO9Nb5kUso/DL5rY1sQ
	 wn4gig83VfDeILX3Cz8fXxpUEeuxsB0Du3oYS0p8UJZKVHLAHwXR07QohgsTaSJfF7
	 6Lqgj4DwjOOWpUH/NGS/br5b8uv+809VvqGAcRG5O+arqaz1P/H4F+dKRplzGiSWmh
	 m8bYnWP9Hngxg==
Date: Fri, 16 May 2025 02:29:02 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 0/2] xen/domain: updates to hardware emulation flags
Message-ID: <20250516022855.1146121-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: ab2bc2529e178cc3b1adb026cb919c31d21ed593
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Patch 1 introduces use of d->arch.emulation_flags for non-x86 platforms and
hooks emulation_flags to 'q' keyhandler for debugging. emulation_flags on
non-x86 systems can be used for enabling domain emulation features.

Patch 2 rewrites emulation_flags_ok() on x86 with a goal of improving
readability of the code.

Originally, the code was part of [1], part of NS16550 emulator v3 series.

[1] https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-6-c5d36b3=
1d66c@ford.com/
[2] Link to v1: https://lore.kernel.org/xen-devel/20250401005224.461325-1-d=
mukhin@ford.com/
[3] Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelin=
es/1820121879=20

Denis Mukhin (2):
  xen/domain: introduce non-x86 hardware emulation flags
  xen/domain: rewrite emulation_flags_ok()

 xen/arch/arm/include/asm/domain.h   |  1 +
 xen/arch/ppc/include/asm/domain.h   |  1 +
 xen/arch/riscv/include/asm/domain.h |  1 +
 xen/arch/x86/domain.c               | 29 +++++++++++------------------
 xen/arch/x86/include/asm/domain.h   |  6 ++++++
 xen/common/keyhandler.c             |  1 +
 6 files changed, 21 insertions(+), 18 deletions(-)

--=20
2.34.1


