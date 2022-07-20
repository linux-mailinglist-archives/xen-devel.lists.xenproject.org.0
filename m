Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 200D257BDFE
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 20:45:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372153.604003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEEgz-0003Tc-SP; Wed, 20 Jul 2022 18:45:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372153.604003; Wed, 20 Jul 2022 18:45:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEEgz-0003RL-P2; Wed, 20 Jul 2022 18:45:05 +0000
Received: by outflank-mailman (input) for mailman id 372153;
 Wed, 20 Jul 2022 18:45:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oEEgy-0003RF-Vy
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 18:45:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oEEgy-00077F-DS; Wed, 20 Jul 2022 18:45:04 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oEEgy-000309-3m; Wed, 20 Jul 2022 18:45:04 +0000
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
	Subject:Cc:To:From; bh=Y6gaNSd3J8zMYtlrc2f3c5lRDg45a2ZJJJFHbvZPWxQ=; b=ckezgs
	iQiV7ws2QyQoxFV7k7W4kaTLtRA6Lw9FJOoghWvbE6VarVlieABw16KVGKFZEDQnjE20kuARxP35Y
	ZeaGYQnhAz2pC6bejRJUb6V6n0uXi1FR1VBq9CpTboEFdPxgC2oOuBegb62LHOfMe78grHjMZcowX
	EPGRJIKuYtY=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 0/5] xen/arm: mm: Bunch of clean-ups
Date: Wed, 20 Jul 2022 19:44:54 +0100
Message-Id: <20220720184459.51582-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Hi all,

This series is a collection of patches to clean-up the MM subsystem
I have done in preparation for the next revision of "xen/arm: Don't
switch TTBR while the MMU is on" [1].

Cheers,

[1] https://lore.kernel.org/all/20220309112048.17377-1-julien@xen.org/

Julien Grall (5):
  xen/arm: Remove most of the *_VIRT_END defines
  xen/arm32: mm: Consolidate the domheap mappings initialization
  xen: Rename CONFIG_DOMAIN_PAGE to CONFIG_ARCH_MAP_DOMAIN_PAGE and...
  xen/arm: mm: Move domain_{,un}map_* helpers in a separate file
  xen/arm: mm: Reduce the area that xen_second covers

 xen/arch/arm/Kconfig                |   1 +
 xen/arch/arm/Makefile               |   1 +
 xen/arch/arm/domain_page.c          | 193 ++++++++++++++++++++++++
 xen/arch/arm/include/asm/arm32/mm.h |   8 +
 xen/arch/arm/include/asm/config.h   |  19 +--
 xen/arch/arm/include/asm/lpae.h     |  17 +++
 xen/arch/arm/livepatch.c            |   2 +-
 xen/arch/arm/mm.c                   | 221 ++++------------------------
 xen/arch/arm/setup.c                |  21 ++-
 xen/arch/x86/Kconfig                |   1 +
 xen/arch/x86/include/asm/config.h   |   1 -
 xen/common/Kconfig                  |   6 +
 xen/include/xen/domain_page.h       |   6 +-
 13 files changed, 283 insertions(+), 214 deletions(-)
 create mode 100644 xen/arch/arm/domain_page.c

-- 
2.32.0


