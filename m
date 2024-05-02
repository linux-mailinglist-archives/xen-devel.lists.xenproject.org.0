Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA268B9740
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 11:11:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715679.1117481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2SSp-0007T7-IB; Thu, 02 May 2024 09:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715679.1117481; Thu, 02 May 2024 09:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2SSp-0007QR-EL; Thu, 02 May 2024 09:10:51 +0000
Received: by outflank-mailman (input) for mailman id 715679;
 Thu, 02 May 2024 09:10:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUhA=MF=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1s2SSn-0007QL-TT
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 09:10:49 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dba3d15f-0863-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 11:10:47 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 79BD62F165;
 Thu,  2 May 2024 05:10:44 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 724A72F164;
 Thu,  2 May 2024 05:10:44 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 2D6712F163;
 Thu,  2 May 2024 05:10:40 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: dba3d15f-0863-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=ygPGeb/EjkduarrNYMv/b9FupPivWzhlS+l8I9Jci3U=; b=i2u+
	NlwsMyWE0auqctJHGd6DmtnjXYzqOZC1xpMFgQZd8GNujAEmj89GGUbC8l2OYbyw
	nYzzUzBohXY6nNYWNYcuH2tejCKV6o24H49JZR7Sa4R0WoM+D4IzF8EkYdtlcvjx
	+qUCciyX0MUFmolr5x9rRYm/no7ulTP9zaqrrx4=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 0/5] x86: make Intel/AMD vPMU & MCE support configurable
Date: Thu,  2 May 2024 12:10:36 +0300
Message-Id: <cover.1714640459.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 D8B0E80E-0863-11EF-B181-A19503B9AAD1-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

Here's a second attempt to separate support of Intel & AMD CPUs in Xen bu=
ild.
The code to drive both platforms used to be built unconditionally, until =
recent
introduction of CONFIG_{AMD,INTEL} Kconfig options.

This series extends coverage of these options on vpmu and mcheck subsyste=
ms,
which allows not to build Intel or AMD vpmu/mcheck support if CPU vendor'=
s support
was explicitly disabled.

Since v1 series one patch had been merged independently, and one more got=
 to be
squashed, so series became shorter. Specific changes since v1 are provide=
d per-patch.

v1 series here:
https://lore.kernel.org/xen-devel/cover.1713860310.git.Sergiy_Kibrik@epam=
.com/

  -Sergiy

Sergiy Kibrik (5):
  x86/vpmu: separate amd/intel vPMU code
  x86/intel: move vmce_has_lmce() routine to header
  x86/MCE: guard access to Intel/AMD-specific MCA MSRs
  x86/MCE: guard {intel/amd}_mcheck_init() calls
  x86/MCE: optional build of AMD/Intel MCE code

 xen/arch/x86/cpu/Makefile           |  4 +++-
 xen/arch/x86/cpu/mcheck/Makefile    |  8 ++++----
 xen/arch/x86/cpu/mcheck/mce.c       |  6 ++++--
 xen/arch/x86/cpu/mcheck/mce.h       | 13 +++++++++++++
 xen/arch/x86/cpu/mcheck/mce_intel.c |  4 ----
 xen/arch/x86/cpu/mcheck/non-fatal.c |  6 ++++++
 xen/arch/x86/cpu/mcheck/vmce.c      | 17 ++++++++++-------
 xen/arch/x86/cpu/vpmu.c             |  6 ++++--
 xen/arch/x86/include/asm/mce.h      |  1 -
 xen/arch/x86/msr.c                  |  2 ++
 10 files changed, 46 insertions(+), 21 deletions(-)

--=20
2.25.1


