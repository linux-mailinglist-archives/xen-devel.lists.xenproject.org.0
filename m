Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 928898AE033
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 10:47:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710425.1109640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzBn2-0001Lz-FQ; Tue, 23 Apr 2024 08:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710425.1109640; Tue, 23 Apr 2024 08:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzBn2-0001KF-Cr; Tue, 23 Apr 2024 08:46:12 +0000
Received: by outflank-mailman (input) for mailman id 710425;
 Tue, 23 Apr 2024 08:46:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKuO=L4=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1rzBn0-0001K9-Vv
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 08:46:11 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebdd5a13-014d-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 10:46:07 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 7296B293A4;
 Tue, 23 Apr 2024 04:46:04 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 5D1DB293A3;
 Tue, 23 Apr 2024 04:46:04 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 4EA622939D;
 Tue, 23 Apr 2024 04:46:00 -0400 (EDT)
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
X-Inumbo-ID: ebdd5a13-014d-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=Uh4F9no4BIYC1nQL2ejMcfVoDtu9aEa2CEXPvaH2j0Q=; b=ANlo
	c16bMuYA0Z9Vf/I6uWkcHzNvYUogE59oNXcCcg7H7BGPUuuO1BJRNZ07KcVetI0H
	vc/LSFHZ5OEzCGGPRVhBBlFXhKU2R4PBgcKdHQoMZs/x9yuRKtUJPuTxXfJ+aZzG
	mahkcK8pOPYIRkC8W96tx3Vex9uLFnP9c5BHxaI=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 0/7] x86: make Intel/AMD vPMU & MCE support configurable
Date: Tue, 23 Apr 2024 11:45:56 +0300
Message-Id: <cover.1713860310.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 E8E77480-014D-11EF-8AA1-A19503B9AAD1-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

Here's an attempt to further separate support of Intel & AMD CPUs in Xen =
build.
The code to drive both platforms used to be built unconditionally, until =
recent
introduction of CONFIG_{AMD,INTEL} Kconfig options.

This series extends coverage of these options on vpmu and mcheck subsyste=
ms,
that is not building Intel or AMD vpmu/mcheck support if CPU vendor's sup=
port
was explicitly disabled.

Sergiy Kibrik (7):
  x86/vpmu: separate amd/intel vPMU code
  x86/intel: guard vmce_has_lmce() with INTEL option
  x86/MCE: guard access to Intel/AMD-specific MCA MSRs
  x86/MCE: guard lmce_support/cmci_support
  x86/MCE: guard {intel/amd}_mcheck_init() calls
  x86/MCE: guard call to Intel-specific intel_get_extended_msrs()
  x86/MCE: optional build of AMD/Intel MCE code

 xen/arch/x86/cpu/Makefile           |  4 +++-
 xen/arch/x86/cpu/mcheck/Makefile    |  6 ++----
 xen/arch/x86/cpu/mcheck/mce.c       | 13 ++++++++-----
 xen/arch/x86/cpu/mcheck/non-fatal.c |  6 ++++++
 xen/arch/x86/cpu/mcheck/vmce.c      | 18 +++++++++++-------
 xen/arch/x86/cpu/mcheck/vmce.h      |  1 +
 xen/arch/x86/include/asm/vpmu.h     | 19 +++++++++++++++++++
 xen/arch/x86/msr.c                  |  2 +-
 8 files changed, 51 insertions(+), 18 deletions(-)

--=20
2.25.1


