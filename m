Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEEF92CCF4
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 10:26:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756608.1165267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRSeS-0007Ez-2A; Wed, 10 Jul 2024 08:26:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756608.1165267; Wed, 10 Jul 2024 08:26:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRSeR-0007Cn-Uw; Wed, 10 Jul 2024 08:26:11 +0000
Received: by outflank-mailman (input) for mailman id 756608;
 Wed, 10 Jul 2024 08:26:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHuL=OK=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sRSeR-0007Ca-3V
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 08:26:11 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c8e76a3-3e96-11ef-8776-851b0ebba9a2;
 Wed, 10 Jul 2024 10:26:06 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 360A9313DE;
 Wed, 10 Jul 2024 04:26:04 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 1BDB5313DC;
 Wed, 10 Jul 2024 04:26:04 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 9294A313DA;
 Wed, 10 Jul 2024 04:26:02 -0400 (EDT)
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
X-Inumbo-ID: 0c8e76a3-3e96-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=xaHCLroQ9G1PraT6F99kDFenXkYPSQFS4jpds0VnLUs=; b=Y/y+
	cDVfG/mYbmlK5wjqyhMS4CoNKZOK7kY6Qe0qVJ1fJ159MA/nd0gA2pANSc889Opq
	E6AC1fnmmkR9DQmm4y/HIsSF8W+N/AIo35B3snrtMR0Yg+kYqGBq5Rf79ALdZUgz
	D9nltCoEKatEUFKHrWCPr8jSjwLs8NY9r50zm24=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v3 0/2] x86: separate powernow/hwp/acpi cpufreq code
Date: Wed, 10 Jul 2024 11:25:58 +0300
Message-Id: <cover.1720596402.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 0B3A340C-3E96-11EF-BEED-965B910A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

This is another version of a short patch series to make platform-specific=
 parts
of cpufreq optional and dependant on INTEL & AMD config options. This is =
to
allow for tuning the build for either AMD or Intel platform exclusively a=
nd
hence to drop the code that would be left unused.

Per-patch changelog provided to track what changed since v2.

v2 series & related discussion are here:
https://lore.kernel.org/xen-devel/cover.1719832871.git.Sergiy_Kibrik@epam=
.com/

Sergiy Kibrik (2):
  x86/cpufreq: move ACPI cpufreq driver into separate file
  x86/cpufreq: separate powernow/hwp/acpi cpufreq code

 xen/arch/x86/acpi/cpufreq/Makefile  |   5 +-
 xen/arch/x86/acpi/cpufreq/acpi.c    | 518 ++++++++++++++++++++++++++++
 xen/arch/x86/acpi/cpufreq/cpufreq.c | 512 +--------------------------
 xen/drivers/acpi/pmstat.c           |   5 +-
 xen/drivers/cpufreq/cpufreq.c       |   3 +-
 xen/include/acpi/cpufreq/cpufreq.h  |  10 +
 6 files changed, 542 insertions(+), 511 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/acpi.c

--=20
2.25.1


