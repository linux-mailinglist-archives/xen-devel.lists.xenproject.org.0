Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3910979CC03
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 11:38:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600134.935745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfzqb-0000UZ-UO; Tue, 12 Sep 2023 09:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600134.935745; Tue, 12 Sep 2023 09:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfzqb-0000S1-Rd; Tue, 12 Sep 2023 09:38:17 +0000
Received: by outflank-mailman (input) for mailman id 600134;
 Tue, 12 Sep 2023 09:38:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3Pz=E4=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qfzqa-0008Jk-He
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 09:38:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 188c1259-5150-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 11:38:14 +0200 (CEST)
Received: from beta.station (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 82A4F4EE0743;
 Tue, 12 Sep 2023 11:38:13 +0200 (CEST)
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
X-Inumbo-ID: 188c1259-5150-11ee-9b0d-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v2 00/10] address violations of MISRA C:2012 Directive 4.10
Date: Tue, 12 Sep 2023 11:36:46 +0200
Message-Id: <cover.1694510856.git.simone.ballarin@bugseng.com>
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

Simone Ballarin (10):
  misra: add deviation for headers that explicitly avoid guards
  misra: modify deviations for empty and generated headers
  misra: add deviations for direct inclusion guards
  xen/arm: address violations of MISRA C:2012 Directive 4.10
  xen/x86: address violations of MISRA C:2012 Directive 4.10
  x86/EFI: address violations of MISRA C:2012 Directive 4.10
  xen/common: address violations of MISRA C:2012 Directive 4.10
  xen/efi: address violations of MISRA C:2012 Directive 4.10
  xen: address violations of MISRA C:2012 Directive 4.10
  x86/asm: address violations of MISRA C:2012 Directive 4.10

 .../eclair_analysis/ECLAIR/deviations.ecl     |  7 ----
 docs/misra/safe.json                          | 32 +++++++++++++++++++
 xen/arch/arm/efi/efi-boot.h                   |  6 ++++
 xen/arch/arm/efi/runtime.h                    |  1 +
 xen/arch/arm/include/asm/hypercall.h          |  1 +
 xen/arch/x86/Makefile                         |  8 ++---
 xen/arch/x86/cpu/cpu.h                        |  5 +++
 xen/arch/x86/efi/runtime.h                    |  5 +++
 xen/arch/x86/include/asm/compat.h             |  5 +++
 xen/arch/x86/include/asm/cpufeatures.h        |  5 +--
 xen/arch/x86/include/asm/efibind.h            |  5 +++
 xen/arch/x86/include/asm/hypercall.h          |  1 +
 xen/arch/x86/x86_64/mmconfig.h                |  5 +++
 xen/arch/x86/x86_emulate/private.h            |  5 +++
 xen/common/decompress.h                       |  5 +++
 xen/common/efi/efi.h                          |  5 +++
 xen/common/event_channel.h                    |  5 +++
 xen/include/Makefile                          | 10 ++++--
 xen/include/public/arch-x86/cpufeatureset.h   |  1 +
 xen/include/public/errno.h                    |  1 +
 xen/include/xen/err.h                         |  4 ++-
 xen/include/xen/pci_ids.h                     |  5 +++
 xen/include/xen/softirq.h                     |  4 ++-
 xen/include/xen/unaligned.h                   |  1 +
 xen/include/xen/vmap.h                        |  4 ++-
 25 files changed, 115 insertions(+), 21 deletions(-)

-- 
2.34.1


