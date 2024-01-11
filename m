Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD4182B4CA
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 19:34:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666496.1037175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNzsj-0002mP-B8; Thu, 11 Jan 2024 18:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666496.1037175; Thu, 11 Jan 2024 18:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNzsj-0002k4-82; Thu, 11 Jan 2024 18:34:21 +0000
Received: by outflank-mailman (input) for mailman id 666496;
 Thu, 11 Jan 2024 18:34:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rNzsh-0002js-7C
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 18:34:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rNzsg-00047j-M9; Thu, 11 Jan 2024 18:34:18 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rNzsg-0000gW-CY; Thu, 11 Jan 2024 18:34:18 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=lLOyYGzOYxxR73FZKk/wCA+g8xZSoSsPsH50swOfQiM=; b=WlUJzQ
	hF+fLBLvMadIIPoSvP8v6c5f9qI1uzSAVgGks/gDgiN7imyFJesrpgcIhN9+unzWYifFgrO2Tvlkm
	RvrRnciiJc3SDdBLSVZeYoWDYQjdnQCKrbGNFcN8zL7aCOgak+RVVewpgNGoimdO7BjyBR9kcpwai
	JcG8yvAmYz4=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 0/2] xen/arm32: Improve logging during early boot
Date: Thu, 11 Jan 2024 18:34:08 +0000
Message-Id: <20240111183410.45566-1-julien@xen.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Hi all,

This small series is based on some debugging I added while investigating
f5a49eb7f8b3 ("xen/arm32: head: Add mising isb in
switch_to_runtime_mapping()").

This will make easier to narrow down where the CPU is stuck while
enabling the MMU.

Cheers,

Julien Grall (2):
  xen/arm32: head: Rework how the fixmap and early UART mapping are
    prepared
  xen/arm32: head: Improve logging in head.S

 xen/arch/arm/arm32/head.S               |   9 ---
 xen/arch/arm/arm32/mmu/head.S           | 100 +++++++++++++-----------
 xen/arch/arm/include/asm/arm32/macros.h |  33 +++++---
 xen/arch/arm/include/asm/asm_defns.h    |   6 +-
 xen/arch/arm/include/asm/early_printk.h |   3 +
 xen/arch/arm/include/asm/mmu/layout.h   |   4 +
 xen/arch/arm/mmu/setup.c                |   3 +
 xen/arch/arm/xen.lds.S                  |   1 +
 8 files changed, 92 insertions(+), 67 deletions(-)

-- 
2.40.1


