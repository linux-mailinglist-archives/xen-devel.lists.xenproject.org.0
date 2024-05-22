Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 997F08CBD1D
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 10:39:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727336.1131807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9hUB-0001GQ-Ux; Wed, 22 May 2024 08:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727336.1131807; Wed, 22 May 2024 08:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9hUB-0001Eu-S6; Wed, 22 May 2024 08:38:11 +0000
Received: by outflank-mailman (input) for mailman id 727336;
 Wed, 22 May 2024 08:38:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V5RZ=MZ=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1s9hUA-0001Eo-Th
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 08:38:10 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cf9d6f7-1816-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 10:38:09 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 3439D3575F;
 Wed, 22 May 2024 04:38:06 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 2BA023575E;
 Wed, 22 May 2024 04:38:06 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 3BDF13575D;
 Wed, 22 May 2024 04:38:03 -0400 (EDT)
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
X-Inumbo-ID: 9cf9d6f7-1816-11ef-90a0-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=cyvIiPqvM/7nZVlXaYF1EcDqHBNiPDg8MTnalFi55SY=; b=osH6
	QGqPLjIRfxya/+3drkSECNMz2C7FTIws5l09b5xPKfEa1ieJJirP0NhDxKg1xCI0
	wUJSn++r8Am6Jxuvxx+aj3rIwxK12Q1cwNP1/j6X7D8pz6o5aeQY16njk0EzTrSZ
	b+CyJbpMg2TvE3E9rmNIotzoqYWN85iYFzKnWVg=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v4 0/3] x86: make Intel/AMD vPMU & MCE support configurable
Date: Wed, 22 May 2024 11:37:59 +0300
Message-Id: <cover.1716366581.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 9A8663D4-1816-11EF-830E-A19503B9AAD1-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

Three remaining patches to separate support of Intel & AMD CPUs in Xen bu=
ild.
Most of related patches from previous series had already been merged.
Specific changes since v3 are provided per-patch.

v3 series here:
https://lore.kernel.org/xen-devel/cover.1715673586.git.Sergiy_Kibrik@epam=
.com/

  -Sergiy

Sergiy Kibrik (3):
  x86/intel: move vmce_has_lmce() routine to header
  x86/MCE: add default switch case in init_nonfatal_mce_checker()
  x86/MCE: optional build of AMD/Intel MCE code

 xen/arch/x86/cpu/mcheck/Makefile    | 8 ++++----
 xen/arch/x86/cpu/mcheck/mce.c       | 4 ++++
 xen/arch/x86/cpu/mcheck/mce.h       | 5 +++++
 xen/arch/x86/cpu/mcheck/mce_intel.c | 8 --------
 xen/arch/x86/cpu/mcheck/non-fatal.c | 9 +++++++++
 xen/arch/x86/cpu/mcheck/vmce.c      | 5 ++---
 xen/arch/x86/include/asm/mce.h      | 1 -
 xen/arch/x86/msr.c                  | 2 ++
 8 files changed, 26 insertions(+), 16 deletions(-)

--=20
2.25.1


