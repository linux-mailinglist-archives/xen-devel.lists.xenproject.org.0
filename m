Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70041A38018
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 11:28:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890177.1299208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyM4-0002hB-7k; Mon, 17 Feb 2025 10:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890177.1299208; Mon, 17 Feb 2025 10:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyM4-0002e7-3Q; Mon, 17 Feb 2025 10:28:00 +0000
Received: by outflank-mailman (input) for mailman id 890177;
 Mon, 17 Feb 2025 10:27:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2bV9=VI=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tjyM2-0001n7-TD
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 10:27:58 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d4cc9c86-ed19-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 11:27:47 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3046E175D;
 Mon, 17 Feb 2025 02:28:06 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A03A33F6A8;
 Mon, 17 Feb 2025 02:27:45 -0800 (PST)
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
X-Inumbo-ID: d4cc9c86-ed19-11ef-9896-31a8f345e629
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 0/2] Prerequisite patches for Arm64 MPU build
Date: Mon, 17 Feb 2025 10:27:30 +0000
Message-Id: <20250217102732.2343729-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

in order to build Xen for Arm64 with MPU support, there are few changes to
support the compilation of Arm code without HAS_PASSTHROUGH and some refactoring
around the start_xen for Arm.

Luca Fancellu (2):
  xen/passthrough: Provide stub functions when !HAS_PASSTHROUGH
  xen/arm: Restrict Kconfig configuration for LLC coloring

 xen/arch/arm/Kconfig                   |  2 +-
 xen/arch/arm/include/asm/grant_table.h |  5 +--
 xen/arch/arm/setup.c                   |  1 +
 xen/include/xen/iommu.h                | 48 ++++++++++++++++++++++++--
 4 files changed, 51 insertions(+), 5 deletions(-)

-- 
2.34.1


