Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 511D42B9B18
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 20:08:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31361.61685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfpHf-0005WY-NR; Thu, 19 Nov 2020 19:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31361.61685; Thu, 19 Nov 2020 19:07:55 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfpHf-0005W9-KL; Thu, 19 Nov 2020 19:07:55 +0000
Received: by outflank-mailman (input) for mailman id 31361;
 Thu, 19 Nov 2020 19:07:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfpHe-0005W4-PD
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 19:07:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfpHe-0003SX-7N; Thu, 19 Nov 2020 19:07:54 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfpHd-0000TE-Tw; Thu, 19 Nov 2020 19:07:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfpHe-0005W4-PD
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 19:07:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=RBmBaVqmiUjfq+YgUTE0vJmyrxBqE/rwdqrNFYyLDHc=; b=6oUTZanFTg59Q1EOMCPjBTSsMd
	VdE4CrPnGMnT0rDjnM1F05nmfkMS1k4rHxPbg7tPsTFMMeBDRLwMrzVJEZ/3or+imZi3fVDSNrtrx
	hxbtDHkczn46355GctRu8cClSM/x0xiXfudqdBaqF2XGwfUlaptLBOInw4EmfMRb3sMs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfpHe-0003SX-7N; Thu, 19 Nov 2020 19:07:54 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=ufe34d9ed68d054.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfpHd-0000TE-Tw; Thu, 19 Nov 2020 19:07:54 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH RFC 0/6] xen/arm: mm: Add limited support for superpages
Date: Thu, 19 Nov 2020 19:07:45 +0000
Message-Id: <20201119190751.22345-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Hi all,

This is a first attempt to add superpage mapping in
xen_pt_update_entry(). The end goal if to remove open-coding mappings
which will help to:
  1) get better compliance with the Arm memory model
  2) pave the way for other page size (64KB, 16KB).

For now, only the open-code mappings for the Device-Tree is reworked.
The others will be added later.

Julien Grall (5):
  xen/arm: mm: Remove ; at the end of mm_printk()
  xen/arm: setup: Call unregister_init_virtual_region() after the last
    init function
  xen/arm: mm: Allow other mapping size in xen_pt_update_entry()
  xen/arm: mm: Don't open-code Xen PT update in remove_early_mappings
  xen/arm: mm: Re-implement early_fdt_map() using map_pages_to_xen()

Stefano Stabellini (1):
  xen/arm: mm: Remove special case for CPU0 in dump_hyp_walk()

 xen/arch/arm/mm.c          | 122 +++++++++++++++++++++++++++----------
 xen/arch/arm/setup.c       |   3 +-
 xen/include/asm-arm/page.h |   4 ++
 3 files changed, 95 insertions(+), 34 deletions(-)

-- 
2.17.1


