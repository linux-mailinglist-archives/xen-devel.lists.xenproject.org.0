Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD535AC727C
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 23:02:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999516.1380152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKNuN-00088H-GX; Wed, 28 May 2025 21:01:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999516.1380152; Wed, 28 May 2025 21:01:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKNuN-00085A-DT; Wed, 28 May 2025 21:01:55 +0000
Received: by outflank-mailman (input) for mailman id 999516;
 Wed, 28 May 2025 21:01:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ql61=YM=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uKNuL-000854-KY
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 21:01:54 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa5d7fad-3c06-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 23:01:51 +0200 (CEST)
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
X-Inumbo-ID: fa5d7fad-3c06-11f0-a2fe-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1748466111; x=1748725311;
	bh=VGRa4NemlQLo9DcwpzLy2eNoBIZSx8+eUmMrQUjhwCQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=EUeetRkYA17scbZDQP5+3D6+RlS3Dz9lIzMjKGu2HodpbXnJ/Ata/dCMJ/g331jFa
	 OkVGuCdUVauiBsOf1yEASVGKDTo92a2WdhiVWlntFDKIuP/35nEXSusYYrJ4sPNhYP
	 5Qmhjxz+gX+Os2P7D0zXYev9hPeYwmJFpbZljd6LABNLJ1v7/b3kTarlSu6xSk/x8e
	 hn9KgYabl+oKoZoBjzhTNBKfmzS/5CC5q8nqsfpj4e5nJ45+amDuOL+TaI0GdMhQ+7
	 fYYJOr6Gs+5BdklptDKTLq04HEaUUar1a7a6hczSUa6dOGVDpKzrw8UXG6196ZXT/c
	 q0RXCLDxIC5QA==
Date: Wed, 28 May 2025 21:01:45 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3 0/2] xen/domain: updates to hardware emulation flags
Message-ID: <20250528210139.2572609-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 0949bbcdbe54d322368dd08447a3a908ddfedc0e
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
[2] Link to v2: https://lore.kernel.org/xen-devel/20250516022855.1146121-1-=
dmukhin@ford.com/
[3] Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelin=
es/1841708353

Denis Mukhin (2):
  xen/domain: introduce common hardware emulation flags
  xen/domain: rewrite emulation_flags_ok()

 xen/arch/x86/domain.c             | 94 ++++++++++++++++++++++++-------
 xen/arch/x86/domctl.c             |  2 +-
 xen/arch/x86/include/asm/domain.h | 25 ++++----
 xen/common/keyhandler.c           |  1 +
 xen/include/xen/sched.h           |  2 +
 5 files changed, 90 insertions(+), 34 deletions(-)

--=20
2.34.1



