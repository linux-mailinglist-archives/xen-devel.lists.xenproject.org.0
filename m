Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 263683BA9B0
	for <lists+xen-devel@lfdr.de>; Sat,  3 Jul 2021 19:12:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149547.276601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzjBT-0000aB-Qm; Sat, 03 Jul 2021 17:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149547.276601; Sat, 03 Jul 2021 17:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzjBT-0000YI-NR; Sat, 03 Jul 2021 17:12:03 +0000
Received: by outflank-mailman (input) for mailman id 149547;
 Sat, 03 Jul 2021 17:12:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lzjBS-0000Y7-9U
 for xen-devel@lists.xenproject.org; Sat, 03 Jul 2021 17:12:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lzjBQ-0007bO-Ff; Sat, 03 Jul 2021 17:12:00 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lzjBQ-0005vs-5R; Sat, 03 Jul 2021 17:12:00 +0000
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
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=vTIblyBJkpB3RsYgL5DJmQYV9pVCyJkl3ZpMr+Zl/bY=; b=qibpoE9J4RlwAnl6LmKai9Kq6R
	HeBOO/oWwtwGxjM5OEv5/PgsxaIAB1vwYh4BJOjIQQhx5ilym+0MCFFpHmSPinch9Yy23nhrUvKGk
	70xot3ergBj8VyVDZOoC3ol8DFsTyTBY77Ec4QLIePcq6Lz2npq60s5RNBkxa1BQSzLU=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 0/4] xen/arm: Properly disable M2P on Arm
Date: Sat,  3 Jul 2021 18:11:48 +0100
Message-Id: <20210703171152.15874-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Hi all,

Arm never supported a M2P yet there are some helpers implemented to deal with
the common code. However, the implementation of mfn_to_gmfn is completely
bogus.

This series aims to properly disable the M2P on Arm.

Cheers,

Julien Grall (4):
  xen: XENMEM_exchange should only be used/compiled for arch supporting
    PV guest
  xen: arm: Stop returning a bogus GFN for the shared info
  xen: arm: Remove mfn_to_gfn() macro
  xen/mm: Provide dummy M2P-related helpers when the M2P is not
    supported

 xen/arch/x86/Kconfig         |  1 +
 xen/arch/x86/domain.c        |  9 +++++++++
 xen/common/Kconfig           |  3 +++
 xen/common/domctl.c          | 10 +++++++---
 xen/common/memory.c          | 24 ++++++++++++------------
 xen/include/asm-arm/mm.h     | 12 ------------
 xen/include/asm-x86/domain.h |  3 +++
 xen/include/public/domctl.h  |  6 ++++++
 xen/include/xen/domain.h     |  7 +++++++
 xen/include/xen/mm.h         | 17 +++++++++++++++++
 10 files changed, 65 insertions(+), 27 deletions(-)

-- 
2.17.1


