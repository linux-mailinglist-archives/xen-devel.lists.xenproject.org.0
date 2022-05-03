Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D6B518139
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 11:39:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319341.539561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlozS-0005ZD-DP; Tue, 03 May 2022 09:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319341.539561; Tue, 03 May 2022 09:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlozS-0005XF-A4; Tue, 03 May 2022 09:38:42 +0000
Received: by outflank-mailman (input) for mailman id 319341;
 Tue, 03 May 2022 09:38:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1P+g=VL=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1nlozR-0005X9-Ex
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 09:38:41 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d0449201-cac4-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 11:38:40 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 616EBED1;
 Tue,  3 May 2022 02:38:39 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A91B53F73D;
 Tue,  3 May 2022 02:38:38 -0700 (PDT)
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
X-Inumbo-ID: d0449201-cac4-11ec-8fc4-03012f2f19d4
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/3] Spectre BHB follow up
Date: Tue,  3 May 2022 10:38:28 +0100
Message-Id: <cover.1651570561.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following up the handling of Spectre BHB on Arm (XSA-398), this serie
contain several changes which were not needed in the XSA patches but
should be done in Xen:
- Sync sysregs and cpuinfo with latest version of Linux (5.18-rc3)
- Advertise both workaround 1 and 3 if we apply workaround 3 as it
  handle both cases. This will keep the same behaviour for guests which
  are not updated to support workaround 3.
- Add sb instruction support. Some newer generations of CPU
  (Neoverse-N2) do support the instruction so add support for it in Xen.

Bertrand Marquis (3):
  xen/arm: Sync sysregs and cpuinfo with Linux 5.18-rc3
  xen/arm: Advertise workaround 1 if we apply 3
  xen/arm: Add sb instruction support

 xen/arch/arm/arm64/cpufeature.c          | 18 +++++-
 xen/arch/arm/cpuerrata.c                 | 14 +++++
 xen/arch/arm/include/asm/arm32/macros.h  |  8 +++
 xen/arch/arm/include/asm/arm64/macros.h  | 18 ++++++
 xen/arch/arm/include/asm/arm64/sysregs.h | 76 ++++++++++++++++++++----
 xen/arch/arm/include/asm/cpufeature.h    | 17 ++++--
 xen/arch/arm/include/asm/macros.h        |  9 ---
 xen/arch/arm/vsmc.c                      | 11 +++-
 8 files changed, 141 insertions(+), 30 deletions(-)

-- 
2.25.1


