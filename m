Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0260CA62393
	for <lists+xen-devel@lfdr.de>; Sat, 15 Mar 2025 02:01:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915594.1321072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttFtU-0002R5-FV; Sat, 15 Mar 2025 01:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915594.1321072; Sat, 15 Mar 2025 01:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttFtU-0002NM-BM; Sat, 15 Mar 2025 01:00:52 +0000
Received: by outflank-mailman (input) for mailman id 915594;
 Sat, 15 Mar 2025 01:00:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ms5H=WC=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ttFtS-0000Y2-5G
 for xen-devel@lists.xenproject.org; Sat, 15 Mar 2025 01:00:51 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed0592fa-0138-11f0-9899-31a8f345e629;
 Sat, 15 Mar 2025 02:00:46 +0100 (CET)
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
X-Inumbo-ID: ed0592fa-0138-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742000444; x=1742259644;
	bh=TznwrzIe2FCPCA/to/Ni9VILSQYxECCrtxBZ6W6gh5U=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=BQdGX2gWt2cL+YHRZsfOkHePM/i1qopLKL2R0bPKTMUOk0hFlLdWSF3C9pFJTy4r/
	 +RSFbld/74MTeb7eP8OhSCMbwqoxxdN6IqCQSVIgLYPv83Ki7nPoa3h7TWJNUEjVlL
	 icltkNq9OljfPz7xFgmUFA/ppYOsoxvg/CpMLzEI09IvlFAmGZkiznFvBBb1VfnFJz
	 8H97X9EszMoTHniUZmwSJRYxiEo7I7YtPlB9bgKITFgCgxT6OpFxN8GKt6EoNITjN9
	 aXdK10z8h114SeITryYCr8x2U8xQLFYj3XCyUpqoo08UgU5NKY7dn4NuNup17KDTxA
	 6Iqvie+Py4lNQ==
Date: Sat, 15 Mar 2025 01:00:39 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH 0/3] x86/irq: cleanup use of open-coded values
Message-ID: <20250315010033.2917197-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 764e4ffa73979e91989f5696ffba1ca535c38e67
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Remove uses of open-coded value 16 in x86's interrupt management code
to enhance readability.
 =20
Patch 0 makes a cosmetic rename NR_ISAIRQS -> NR_ISA_IRQS as per
code review [1].

Patch 1 makes use of NR_ISA_IRQS in the code where necessary.
=20
Patch 2 adds new symbol APIC_VECTOR_VALID and makes use of it.
=20
No functional changes.
=20
[1]: https://lore.kernel.org/xen-devel/20250314011528.2608217-1-dmukhin@for=
d.com/

Denis Mukhin (3):
  x86/irq: rename NR_ISAIRQS to NR_ISA_IRQS
  x86/irq: use NR_ISA_IRQS instead of open-coded value
  x86/irq: introduce APIC_VECTOR_VALID

 xen/arch/x86/cpu/mcheck/mce_intel.c |  2 +-
 xen/arch/x86/hvm/dm.c               |  2 +-
 xen/arch/x86/hvm/hvm.c              |  4 ++--
 xen/arch/x86/hvm/irq.c              | 17 +++++++++--------
 xen/arch/x86/hvm/vlapic.c           | 10 +++++-----
 xen/arch/x86/hvm/vpic.c             |  4 ++--
 xen/arch/x86/hvm/vpt.c              |  2 +-
 xen/arch/x86/include/asm/apicdef.h  |  1 +
 xen/arch/x86/include/asm/hvm/irq.h  |  4 ++--
 xen/arch/x86/include/asm/irq.h      |  2 +-
 xen/arch/x86/io_apic.c              | 12 ++++++------
 xen/arch/x86/irq.c                  |  6 +++---
 xen/arch/x86/physdev.c              |  2 +-
 xen/drivers/passthrough/x86/hvm.c   |  4 ++--
 14 files changed, 37 insertions(+), 35 deletions(-)

--=20
2.34.1



