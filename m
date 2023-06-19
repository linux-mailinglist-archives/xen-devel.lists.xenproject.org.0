Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DD3735C9F
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 19:01:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551241.860672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBIFk-0003DJ-Do; Mon, 19 Jun 2023 17:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551241.860672; Mon, 19 Jun 2023 17:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBIFk-0003AP-B4; Mon, 19 Jun 2023 17:01:20 +0000
Received: by outflank-mailman (input) for mailman id 551241;
 Mon, 19 Jun 2023 17:01:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qBIFj-0003AJ-HJ
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 17:01:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBIFj-0002du-2J; Mon, 19 Jun 2023 17:01:19 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBIFi-00079R-PQ; Mon, 19 Jun 2023 17:01:18 +0000
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
	Subject:Cc:To:From; bh=WPhdZd1f4X1KRfyL6B2cOBUC2KUCMrhBVaJE39hZ52I=; b=mQMdKl
	P5sFdHiS3WNceA6YJ4rBR+apZN56qIYrQrfsP4UVzVrQucVWEkbAPL+q9JlgABH1l0aXbiF/vAT7E
	2Ghii5hhzlW/9dg4FK5DwgHSVpM13Km1mmQs8WEng4LM7D4XQlGaVHFETFQRcNKL7NodyU7MW5HcY
	7hkTojyX/EQ=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	michal.orzel@amd.com,
	Henry.Wang@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/7] xen/arm: Add some missing ISBs after updating the PTEs
Date: Mon, 19 Jun 2023 18:01:08 +0100
Message-Id: <20230619170115.81398-1-julien@xen.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Hi all,

The main goal of this series is to add some missing ISBs after update
the PTEs.

The last patch is re-ingesting a patch that was reverted
due to a boot failure on the Arndale. This has now been fixed by patch
#2.

Cheers,

Julien Grall (7):
  xen/arm32: head: Add missing isb in setup_fixmap()
  xen/arm32: head: Add mising isb in switch_to_runtime_mapping()
  xen/arm64: head: Add missing isb in setup_fixmap()
  xen/arm: page: Consolidate write_pte() and clarify the documentation
  xen/arm: pmap: Add missing ISB in arch_pmap_map()
  xen/arm: mm: Add missing ISB in xen_pt_update()
  xen/arm32: head: Widen the use of the temporary mapping

 xen/arch/arm/arm32/head.S             | 96 ++++++++-------------------
 xen/arch/arm/arm64/head.S             |  5 ++
 xen/arch/arm/include/asm/arm32/page.h | 16 -----
 xen/arch/arm/include/asm/arm64/page.h | 11 ---
 xen/arch/arm/include/asm/page.h       | 17 +++++
 xen/arch/arm/include/asm/pmap.h       |  5 ++
 xen/arch/arm/mm.c                     | 14 ++++
 7 files changed, 67 insertions(+), 97 deletions(-)

-- 
2.40.1


