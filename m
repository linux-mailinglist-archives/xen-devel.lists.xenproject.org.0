Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 750F478B32D
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 16:30:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591518.923954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qadFp-0003jO-Oi; Mon, 28 Aug 2023 14:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591518.923954; Mon, 28 Aug 2023 14:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qadFp-0003g8-M4; Mon, 28 Aug 2023 14:30:09 +0000
Received: by outflank-mailman (input) for mailman id 591518;
 Mon, 28 Aug 2023 13:20:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJ5s=EN=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qacAQ-00031h-3M
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 13:20:30 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a78b3136-45a5-11ee-8783-cb3800f73035;
 Mon, 28 Aug 2023 15:20:28 +0200 (CEST)
Received: from beta.station (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 9381B4EE0738;
 Mon, 28 Aug 2023 15:20:26 +0200 (CEST)
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
X-Inumbo-ID: a78b3136-45a5-11ee-8783-cb3800f73035
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [XEN PATCH 00/13] address violations of MISRA C:2012 Directive 4.10
Date: Mon, 28 Aug 2023 15:19:57 +0200
Message-Id: <cover.1693228255.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add or move inclusion guards to address violations of
MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
to prevent the contents of a header file being included more than
once").

Inclusion guards must appear at the beginning of the headers
(comments are permitted anywhere) and the #if directive cannot
be used for other checks.

C files, if included somewhere, need to comply with the guideline.

Simone Ballarin (13):
  misra: add deviation for headers that explicitly avoid guards
  automation/eclair: add text-based deviation for empty headers
  xen/arm: address violations of MISRA C:2012 Directive 4.10
  xen/x86: address violations of MISRA C:2012 Directive 4.10
  automation/eclair: add deviation for usercopy.c
  x86/EFI: address violations of MISRA C:2012 Directive 4.10
  x86/asm: address violations of MISRA C:2012 Directive 4.10
  x86/mm: address violations of MISRA C:2012 Directive 4.10
  xen/common: address violations of MISRA C:2012 Directive 4.10
  xen/efi: address violations of MISRA C:2012 Directive 4.10
  xen/sched: address violations of MISRA C:2012 Directive 4.10
  xen: address violations of MISRA C:2012 Directive 4.10
  x86/asm: address violations of MISRA C:2012 Directive 4.10

 automation/eclair_analysis/ECLAIR/deviations.ecl | 9 +++++++++
 docs/misra/rules.rst                             | 5 ++++-
 xen/arch/arm/efi/efi-boot.h                      | 6 ++++++
 xen/arch/arm/include/asm/hypercall.h             | 6 +++---
 xen/arch/arm/include/asm/iocap.h                 | 6 +++---
 xen/arch/x86/Makefile                            | 8 ++++----
 xen/arch/x86/cpu/cpu.h                           | 5 +++++
 xen/arch/x86/efi/efi-boot.h                      | 6 ++++++
 xen/arch/x86/efi/runtime.h                       | 5 +++++
 xen/arch/x86/include/asm/compat.h                | 5 +++++
 xen/arch/x86/include/asm/cpufeatures.h           | 4 +---
 xen/arch/x86/include/asm/efibind.h               | 5 +++++
 xen/arch/x86/include/asm/hypercall.h             | 6 +++---
 xen/arch/x86/mm/guest_walk.c                     | 5 +++++
 xen/arch/x86/mm/hap/guest_walk.c                 | 4 ++++
 xen/arch/x86/physdev.c                           | 4 ++++
 xen/arch/x86/platform_hypercall.c                | 5 +++++
 xen/arch/x86/x86_64/compat/mm.c                  | 5 +++++
 xen/arch/x86/x86_64/mmconfig.h                   | 5 +++++
 xen/arch/x86/x86_emulate/private.h               | 5 +++++
 xen/arch/x86/x86_emulate/x86_emulate.c           | 5 +++++
 xen/common/compat/grant_table.c                  | 7 +++++++
 xen/common/coverage/gcc_4_7.c                    | 5 +++++
 xen/common/decompress.h                          | 5 +++++
 xen/common/efi/efi.h                             | 5 +++++
 xen/common/efi/runtime.c                         | 6 ++++++
 xen/common/event_channel.h                       | 5 +++++
 xen/common/multicall.c                           | 5 +++++
 xen/common/sched/compat.c                        | 6 ++++++
 xen/include/xen/err.h                            | 4 +++-
 xen/include/xen/pci_ids.h                        | 5 +++++
 xen/include/xen/softirq.h                        | 4 +++-
 xen/include/xen/unaligned.h                      | 7 ++++---
 xen/include/xen/vmap.h                           | 4 +++-
 xen/tools/compat-xlat-header.py                  | 2 ++
 35 files changed, 161 insertions(+), 23 deletions(-)

-- 
2.34.1


