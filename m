Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 185C5ACBB64
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 21:18:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003772.1383377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMAfB-0008He-6P; Mon, 02 Jun 2025 19:17:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003772.1383377; Mon, 02 Jun 2025 19:17:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMAfB-0008Fv-2T; Mon, 02 Jun 2025 19:17:37 +0000
Received: by outflank-mailman (input) for mailman id 1003772;
 Mon, 02 Jun 2025 19:17:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J+98=YR=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uMAf8-0008Fp-OJ
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 19:17:35 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39ff5286-3fe6-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 21:17:29 +0200 (CEST)
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
X-Inumbo-ID: 39ff5286-3fe6-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ysr6kma3xzaxpcxtq754jyg2t4.protonmail; t=1748891848; x=1749151048;
	bh=TYIdmTL1y/opNybyESvYe5Fbsw4UmNMLAVDl4CmjMFI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=GRoz+OSUwfpkjv3uGhrO/5dma8jSGfL0plPq3kSBtWLsrXLVbJbMkY8DliKPHP1YA
	 YDPM5xvzQ3qmrvb9MBf+D6BjfZxd2b8lpU6iWbDUtJ0pRqI4TEorI9V3wB8JkZkM/A
	 nT8kEtIDsfXX0QkbPrw9nvNbsM+e3IA4tNAYkPbck+PQbgNgvVgL/d3Ft3EFWdL+oH
	 JVLoxoIreo3bmdikcuGXxbGv6RCm/LAwTRiai+NCXyrhgg4ookkjmSsElsCLHm0jzw
	 JHxh5DNS6obwlr17wb/iXHHZJLit8SvvakydhmFB1WcIRToHlZdTvFNRMXEOQ6eTzH
	 0F1gmRLflwf6A==
Date: Mon, 02 Jun 2025 19:17:22 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com
Subject: [PATCH v5 0/2] xen/domain: updates to hardware emulation flags
Message-ID: <20250602191717.148361-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: d2232326d5e419126d8b29309ba460596b9e8bf8
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
[2] Link to v4: https://lore.kernel.org/xen-devel/20250530220242.63175-1-dm=
ukhin@ford.com/
[3] Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelin=
es/1849512714

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



