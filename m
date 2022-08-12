Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEFC5915EB
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 21:25:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385854.621631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMaHN-0000JO-UV; Fri, 12 Aug 2022 19:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385854.621631; Fri, 12 Aug 2022 19:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMaHN-0000Fd-RD; Fri, 12 Aug 2022 19:25:09 +0000
Received: by outflank-mailman (input) for mailman id 385854;
 Fri, 12 Aug 2022 19:25:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oMaHM-0000FQ-9y
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 19:25:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMaHL-0000xQ-Sv; Fri, 12 Aug 2022 19:25:07 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMaHL-0006n6-IQ; Fri, 12 Aug 2022 19:25:07 +0000
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
	Subject:Cc:To:From; bh=QGnXW4Wry4/tBL2jXolSsyjgqkQRuQIIQb4KjRUDLIY=; b=YZX9OL
	wBxZA2gncGtpQVHbh914vJbBjG4PeSwHbt9rTiwu5kwpN62yupmWC62MNFXbHMafSxINhTo0arfPn
	4kYXzfUCtzlyd30ese3JBukEziA+Rf3dU3EuWAhTORE78eg7berurnPixez2hmRCrbpqRR8PRew7y
	PCV8FZhnaWc=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/7] xen/arm: More clean-ups and improvement
Date: Fri, 12 Aug 2022 20:24:39 +0100
Message-Id: <20220812192448.43016-1-julien@xen.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Hi all,

This is another collection of patches that I accumulated while
reworking the boot code. I am not planning to target Xen 4.17
for the boot code (still working on it and it is risky). But I
the clean-ups and improvement patches could be.

Cheers,

Julien Grall (7):
  xen/arm64: head: Don't set x22 and update the documentation
  xen/arm64: head: Introduce get_table_slot() and use it
  xen/arm32: head: Introduce get_table_slot() and use it
  xen/arm32: heap: Rework adr_l so it doesn't rely on where Xen is
    loaded
  xen/arm32: head: Move earlyprintk messages to .rodata.str
  xen/arm: Tweak the dump page-table walk output
  xen/arm32: traps: Dump more information for hypervisor data abort

 xen/arch/arm/arm32/head.S        | 102 +++++++++++++++----------------
 xen/arch/arm/arm32/traps.c       |   2 +-
 xen/arch/arm/arm64/head.S        |  61 +++++++++---------
 xen/arch/arm/include/asm/traps.h |   1 +
 xen/arch/arm/mm.c                |   2 +-
 5 files changed, 83 insertions(+), 85 deletions(-)

-- 
2.37.1


