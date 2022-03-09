Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D274D2DD9
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 12:21:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287729.487872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRuNn-0007CQ-Oz; Wed, 09 Mar 2022 11:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287729.487872; Wed, 09 Mar 2022 11:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRuNn-0007Aa-LK; Wed, 09 Mar 2022 11:21:31 +0000
Received: by outflank-mailman (input) for mailman id 287729;
 Wed, 09 Mar 2022 11:21:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nRuNl-0007AO-Q1
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 11:21:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nRuNl-0002k8-93; Wed, 09 Mar 2022 11:21:29 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nRuNl-0004wn-0o; Wed, 09 Mar 2022 11:21:29 +0000
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
	Subject:Cc:To:From; bh=YDBOygF2/EnnHsZrv2Io8p/Me0uGA7yPiBzzvhLw+V0=; b=R1DkAG
	a6B6pvBnRh/pDhaGzYCN17qFzXSrS6QDn8Hjkp6UqoV6HSzsC0DHIHZsw/J3qR2L8vjnZ7O/g59+T
	FAW/Oyuv0vjns157YFku5RaD0ezQ2VhjrOJ3r4z50gyXV22MVkTfwGgX9f5I3YYWqJ5OQdBxtQj/f
	Ng7GykwUoJQ=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: marco.solieri@minervasys.tech,
	lucmiccio@gmail.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH early-RFC 0/5] xen/arm: Don't switch TTBR while the MMU is on
Date: Wed,  9 Mar 2022 11:20:43 +0000
Message-Id: <20220309112048.17377-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Hi all,

Currently, Xen on Arm will switch TTBR whilst the MMU is on. This is
similar to replacing existing mappings with new ones. So we need to
follow a break-before-make sequence.

When switching the TTBR, we need to temporary disable the MMU
before update the TTBR. This means the page-tables must contain an
identity mapping.

The current memory layout is not very flexible and has an higher chance
to clash with the identity mapping.

On Arm64, we have plenty of unused virtual address space Therefore, we can
simply reshuffle the layout to leave the first part of the virtual
address space empty.

On Arm32, the virtual address space is already quite full. That said,
we are currently reserving 2GB for the temporary mapping. This is far
too much given those mappings are temporary. It would be sufficient
to only reserve a few MBs.

The Arm32 part is not yet addressed in this version. The series is
sent as an early RFC to gather some feedback on the approach.

After this series, most of Xen page-table code should be compliant
with the Arm Arm. The last two issues I am aware of are:
 - domheap: Mappings are replaced without using the Break-Before-Make
   approach.
 - The cache is not cleaned/invalidated when updating the page-tables
   with Data cache off (like during early boot).

This series is based on "xen/arm: mm: Remove open-coding mappings"
along with some extra small patches. Some of them are already merged.
For convience, I pushed a branch with everything applied:

https://xenbits.xen.org/git-http/people/julieng/xen-unstable.git
branch boot-pt-rework-v1

Note the build for arm32 is likely broken. This will be addressed
on the next version.

Cheers,

Julien GralL (1):
  xen/arm: mm: Introduce helpers to prepare/enable/disable the identity
    mapping

Julien Grall (4):
  xen/arm: Clean-up the memory layout
  xen/arm64: Rework the memory layout
  xen/arm: mm: Rework switch_ttbr()
  xen/arm: smpboot: Directly switch to the runtime page-tables

 xen/arch/arm/arm64/head.S         |  63 ++++++++--------
 xen/arch/arm/include/asm/config.h |  44 +++++++----
 xen/arch/arm/include/asm/mm.h     |   2 +
 xen/arch/arm/mm.c                 | 120 +++++++++++++++++++++++-------
 xen/arch/arm/smpboot.c            |   3 +
 5 files changed, 160 insertions(+), 72 deletions(-)

-- 
2.32.0


