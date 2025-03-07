Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA52DA5621A
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 08:58:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904637.1312488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqSbV-000684-5K; Fri, 07 Mar 2025 07:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904637.1312488; Fri, 07 Mar 2025 07:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqSbV-00065Q-1Z; Fri, 07 Mar 2025 07:58:45 +0000
Received: by outflank-mailman (input) for mailman id 904637;
 Fri, 07 Mar 2025 07:58:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ceor=V2=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tqSbU-00065D-09
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 07:58:44 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id fc1c9fda-fb29-11ef-9ab5-95dc52dad729;
 Fri, 07 Mar 2025 08:58:42 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CEDB1682;
 Thu,  6 Mar 2025 23:58:53 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6A033F673;
 Thu,  6 Mar 2025 23:58:39 -0800 (PST)
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
X-Inumbo-ID: fc1c9fda-fb29-11ef-9ab5-95dc52dad729
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 0/2] Prerequisite patches for Arm64 MPU build
Date: Fri,  7 Mar 2025 07:58:16 +0000
Message-Id: <20250307075818.740649-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

in order to build Xen for Arm64 with MPU support, there are few changes to
support the compilation of Arm code without HAS_PASSTHROUGH and some Kconfig
changes.

Luca Fancellu (2):
  xen/passthrough: Provide stub functions when !HAS_PASSTHROUGH
  xen/arm: Restrict Kconfig configuration for LLC coloring

 xen/arch/arm/Kconfig                   |  2 +-
 xen/arch/arm/include/asm/grant_table.h |  5 +--
 xen/include/xen/iommu.h                | 50 +++++++++++++++++++++++++-
 3 files changed, 53 insertions(+), 4 deletions(-)

-- 
2.34.1


