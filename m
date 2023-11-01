Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F08137DE8DF
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 00:30:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626671.977130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyKfH-0003u5-VN; Wed, 01 Nov 2023 23:30:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626671.977130; Wed, 01 Nov 2023 23:30:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyKfH-0003qj-S9; Wed, 01 Nov 2023 23:30:23 +0000
Received: by outflank-mailman (input) for mailman id 626671;
 Wed, 01 Nov 2023 23:30:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qyKfG-0003qV-6V
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 23:30:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qyKfF-0008DY-KQ; Wed, 01 Nov 2023 23:30:21 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qyKfF-0007xN-7y; Wed, 01 Nov 2023 23:30:21 +0000
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
	Subject:Cc:To:From; bh=dhJ/etmUDjW6epQfiaacmo0FmAD08Ix58n7Dzp56Xg4=; b=sxxgHv
	jTibZAmBlzqRlhGbGejQLmfuSoxLtJ8tK8e9q+aLXOrkZXF1ghSND0MnFeoEvDRn2bN7KZvhJ50e8
	LXQn4OGCRIT5ePoR34VQVWY41lna8wFGvVGpOCMxw9kAju++NsrSnXZRNdsO9CrVhk/YeoIDEUPQr
	nLO7auLbQaY=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	michal.orzel@amd.com,
	ayan.kumar.halder@amd.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/2] xen/arm32: Improve logging during early boot
Date: Wed,  1 Nov 2023 23:30:09 +0000
Message-Id: <20231101233011.83098-1-julien@xen.org>
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

Julien Grall (2):
  xen/arm32: head: Rework how the fixmap and early UART mapping are
    prepared
  xen/arm32: head: Improve logging in head.S

 xen/arch/arm/arm32/head.S               | 106 +++++++++++++-----------
 xen/arch/arm/include/asm/asm_defns.h    |   6 +-
 xen/arch/arm/include/asm/early_printk.h |   3 +
 xen/arch/arm/include/asm/mmu/layout.h   |   4 +
 xen/arch/arm/mm.c                       |   5 ++
 xen/arch/arm/xen.lds.S                  |   1 +
 6 files changed, 75 insertions(+), 50 deletions(-)

-- 
2.40.1


