Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D178D954775
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 13:09:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778486.1188515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seup1-0001QO-Cz; Fri, 16 Aug 2024 11:08:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778486.1188515; Fri, 16 Aug 2024 11:08:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seup1-0001Oi-9F; Fri, 16 Aug 2024 11:08:43 +0000
Received: by outflank-mailman (input) for mailman id 778486;
 Fri, 16 Aug 2024 11:08:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0eKx=PP=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1seup0-0001Oc-KO
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 11:08:42 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3871937-5bbf-11ef-8776-851b0ebba9a2;
 Fri, 16 Aug 2024 13:08:40 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 22AEA27830;
 Fri, 16 Aug 2024 07:08:38 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 199842782F;
 Fri, 16 Aug 2024 07:08:38 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id F1EFE2782E;
 Fri, 16 Aug 2024 07:08:36 -0400 (EDT)
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
X-Inumbo-ID: e3871937-5bbf-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=6amzTM1Zuwycn82X5gGukLcTmcXTY8X+13zqceSKBQo=; b=NDEz
	HyprqY8K2sk/y4mP/2mO/Hbe4yz8AokKn8cUCQ4kLbiNX6t7uxo8Gwm0dY++PuzO
	a1CL0sF5HFY0otDYVVHNVymLkAANoe0MzRP0sSMsUWImCDVeLIgmGeeJ/oCtr3Vs
	oEcTy6suPqnML0LLXmgGwJsOaOotSoFzQf6vgbI=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 0/5] x86/CPU: optional build of Intel/AMD CPUs support
Date: Fri, 16 Aug 2024 14:08:34 +0300
Message-Id: <cover.1723805717.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 E2963234-5BBF-11EF-9452-2BAEEB2EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

This series is one more step towards separation of Intel/AMD support in X=
en.
With all preparation work is mostly done now, it becomes possible to make=
 build
of arch/x86/cpu/{amd.c,intel.c} files optional, depending on whether
CONFIG_{AMD,INTEL} are enabled or not.

This can be useful for builds tuned for specific platform -- by reducing =
dead
code that won't ever be executed on that platform anyway.

Note: this series (namely its Intel part) depends on optional PSR support=
 patch:
https://lore.kernel.org/xen-devel/20240801084453.1163506-1-Sergiy_Kibrik@=
epam.com/

v1 series' discussion here:
https://lore.kernel.org/xen-devel/cover.1723196909.git.Sergiy_Kibrik@epam=
.com/

Changelogs are provided per-patch.

  -Sergiy
=20
Sergiy Kibrik (5):
  x86/Kconfig: introduce CENTAUR, HYGON & SHANGHAI config options
  x86/amd: configurable handling of AMD-specific MSRs access
  x86/spec-ctrl: configurable Intlel/AMD-specific calculations
  x86/intel: optional build of intel.c
  x86/amd: optional build of amd.c

 xen/arch/x86/Kconfig.cpu             | 29 ++++++++++++++++++++++++++++
 xen/arch/x86/cpu/Makefile            | 12 ++++++------
 xen/arch/x86/cpu/common.c            | 12 +++++++++++-
 xen/arch/x86/hvm/svm/svm.c           |  6 ++++--
 xen/arch/x86/include/asm/amd.h       | 23 +++++++++++++++++++---
 xen/arch/x86/include/asm/processor.h |  3 ++-
 xen/arch/x86/msr.c                   |  4 ++++
 xen/arch/x86/spec_ctrl.c             | 19 ++++++++++++++----
 8 files changed, 91 insertions(+), 17 deletions(-)

--=20
2.25.1


