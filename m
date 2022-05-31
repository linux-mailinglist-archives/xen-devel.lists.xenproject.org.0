Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B13D538F2B
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 12:43:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339435.564291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvzLN-00083q-Qw; Tue, 31 May 2022 10:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339435.564291; Tue, 31 May 2022 10:43:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvzLN-000814-Nd; Tue, 31 May 2022 10:43:21 +0000
Received: by outflank-mailman (input) for mailman id 339435;
 Tue, 31 May 2022 10:43:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a0MG=WH=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1nvzLM-00080t-DE
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 10:43:20 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 7c02f61f-e0ce-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 12:43:19 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4F9923A;
 Tue, 31 May 2022 03:43:18 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0BBB3F73D;
 Tue, 31 May 2022 03:43:17 -0700 (PDT)
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
X-Inumbo-ID: 7c02f61f-e0ce-11ec-bd2c-47488cf2e6aa
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 0/4] Spectre BHB follow up
Date: Tue, 31 May 2022 11:43:03 +0100
Message-Id: <cover.1653993431.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following up the handling of Spectre BHB on Arm (XSA-398), this serie
contain several changes which were not needed in the XSA patches but
should be done in Xen:
- Sync sysregs and cpuinfo with latest version of Linux (5.18-rc3)
- Add new fields inside cpufeature
- Add sb instruction support. Some newer generations of CPU
  (Neoverse-N2) do support the instruction so add support for it in Xen.
- Create hidden Kconfig entries for CONFIG_ values actually used in
  arm64 cpufeature.

Changes in v2
- remove patch which was merged (workaround 1 when workaround 3 is done)
- split sync with linux and update of cpufeatures
- add patch to define kconfig entries used by arm64 cpufeature

Bertrand Marquis (4):
  xen/arm: Sync sysregs and cpuinfo with Linux 5.18-rc3
  xen/arm: Add sb instruction support
  arm: add ISAR2, MMFR0 and MMFR1 fields in cpufeature
  arm: Define kconfig symbols used by arm64 cpufeatures

 xen/arch/arm/Kconfig                     | 28 +++++++++
 xen/arch/arm/arm64/cpufeature.c          | 18 +++++-
 xen/arch/arm/cpufeature.c                | 28 +++++++++
 xen/arch/arm/include/asm/arm64/sysregs.h | 76 ++++++++++++++++++++----
 xen/arch/arm/include/asm/cpufeature.h    | 34 +++++++++--
 xen/arch/arm/include/asm/macros.h        | 33 +++++++---
 xen/arch/arm/setup.c                     |  3 +
 xen/arch/arm/smpboot.c                   |  1 +
 8 files changed, 193 insertions(+), 28 deletions(-)

-- 
2.25.1


