Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD898C4D94
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 10:16:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721213.1124434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6nKo-0003aq-UV; Tue, 14 May 2024 08:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721213.1124434; Tue, 14 May 2024 08:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6nKo-0003ZN-Rg; Tue, 14 May 2024 08:16:30 +0000
Received: by outflank-mailman (input) for mailman id 721213;
 Tue, 14 May 2024 08:16:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XrDB=MR=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1s6nKn-0003Z8-G8
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 08:16:29 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41cb8f15-11ca-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 10:16:27 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 1FB383A4C0;
 Tue, 14 May 2024 04:16:25 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 181113A4BF;
 Tue, 14 May 2024 04:16:25 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 127BC3A4BE;
 Tue, 14 May 2024 04:16:24 -0400 (EDT)
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
X-Inumbo-ID: 41cb8f15-11ca-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=5h1V3cl8XHOKSgcuBJuKqihrCoEZnPy9xnGmQ9Ui9F8=; b=UGSz
	D04qMWlIn9AqJv2/CHP9Xf/mjskq5BtxDULt9CzLDowapaeQdWk14iqkOveFVbPO
	HmyCVku6FzYYBki/XNiVsRtBQdCAmN/6/VRiTZJcOXUtluogcdG8xIelusto2T+a
	TYP0Dij4GhWPbniudksGcfBwTCZ7fthYECeXYa8=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v3 0/6] x86: make Intel/AMD vPMU & MCE support configurable
Date: Tue, 14 May 2024 11:16:21 +0300
Message-Id: <cover.1715673586.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 40DAC67E-11CA-11EF-9C88-78DCEB2EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

This series aims to separate support of Intel & AMD CPUs in Xen build.
The code to drive both platforms used to be built unconditionally, until =
recent
introduction of CONFIG_{AMD,INTEL} Kconfig options.

This series extends coverage of these options on vpmu and mcheck subsyste=
ms,
which allows not to build Intel or AMD vpmu/mcheck support if CPU vendor'=
s support
was explicitly disabled.

Since v2 series one patch had been split into two patches for more clarit=
y,
hence series became one piece longer, and last patch changed significantl=
y.
Other changes are mostly cosmetic and tags addition.
Specific changes since v2 are provided per-patch.

v2 series here:
https://lore.kernel.org/xen-devel/cover.1714640459.git.Sergiy_Kibrik@epam=
.com/

  -Sergiy

Sergiy Kibrik (6):
  x86/vpmu: separate amd/intel vPMU code
  x86/intel: move vmce_has_lmce() routine to header
  x86/MCE: guard access to Intel/AMD-specific MCA MSRs
  x86/MCE: guard {intel/amd}_mcheck_init() calls
  x86/MCE: add default switch case in init_nonfatal_mce_checker()
  x86/MCE: optional build of AMD/Intel MCE code

 xen/arch/x86/cpu/Makefile           |  4 +++-
 xen/arch/x86/cpu/mcheck/Makefile    |  8 ++++----
 xen/arch/x86/cpu/mcheck/mce.c       |  8 ++++++++
 xen/arch/x86/cpu/mcheck/mce.h       |  5 +++++
 xen/arch/x86/cpu/mcheck/mce_intel.c |  8 --------
 xen/arch/x86/cpu/mcheck/non-fatal.c |  8 ++++++++
 xen/arch/x86/cpu/mcheck/vmce.c      | 13 ++++++++++---
 xen/arch/x86/cpu/vpmu.c             |  4 ++++
 xen/arch/x86/include/asm/mce.h      |  1 -
 xen/arch/x86/msr.c                  |  2 ++
 10 files changed, 44 insertions(+), 17 deletions(-)

--=20
2.25.1


