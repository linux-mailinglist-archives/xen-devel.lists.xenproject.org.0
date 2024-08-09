Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7273794CE42
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 12:08:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774609.1185061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scMXR-0000tf-BV; Fri, 09 Aug 2024 10:08:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774609.1185061; Fri, 09 Aug 2024 10:08:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scMXR-0000rV-8b; Fri, 09 Aug 2024 10:08:01 +0000
Received: by outflank-mailman (input) for mailman id 774609;
 Fri, 09 Aug 2024 10:08:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7QEF=PI=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1scMXQ-0000rP-2d
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 10:08:00 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a1c64e6-5637-11ef-8776-851b0ebba9a2;
 Fri, 09 Aug 2024 12:07:21 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id ADE912A0AA;
 Fri,  9 Aug 2024 06:07:22 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id A3BA42A0A7;
 Fri,  9 Aug 2024 06:07:22 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 11FE62A0A1;
 Fri,  9 Aug 2024 06:07:16 -0400 (EDT)
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
X-Inumbo-ID: 2a1c64e6-5637-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=X8/HED5BuW05zs9K9lACT5yymLeMN0/h3TfhqeVH2oY=; b=jz8C
	oGmqPHP5YoBibOmAGYjsM4izPryRC/vU8O26SdZrJx1aKmtdbRfRtvCeZO2ryijW
	mTKkPjc5npvbQst/JxNMjyjZvWhybbitze52aFKyfbfjljtOyLTJ+h2K2LYq3eln
	l6ukXxUkOWw7nxHt9VFlIRe8JPL2A4gtk6BEO9U=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 0/2] x86/CPU: optional build of Intel/AMD CPUs support
Date: Fri,  9 Aug 2024 13:07:13 +0300
Message-Id: <cover.1723196909.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 27B162AA-5637-11EF-8F10-9B0F950A682E-90055647!pb-smtp2.pobox.com
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

  -Sergiy
 =20
Sergiy Kibrik (2):
  x86/intel: optional build of intel.c
  x86/amd: optional build of amd.c

 xen/arch/x86/cpu/Makefile            | 10 +++++-----
 xen/arch/x86/cpu/common.c            |  8 ++++++--
 xen/arch/x86/include/asm/amd.h       | 22 ++++++++++++++++++++++
 xen/arch/x86/include/asm/processor.h |  7 ++++---
 xen/arch/x86/spec_ctrl.c             |  2 ++
 5 files changed, 39 insertions(+), 10 deletions(-)

--=20
2.25.1


