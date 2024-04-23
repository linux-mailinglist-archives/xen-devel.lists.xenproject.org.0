Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C58108AEA4D
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 17:13:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710788.1110242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHpP-0004tk-9A; Tue, 23 Apr 2024 15:13:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710788.1110242; Tue, 23 Apr 2024 15:13:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHpP-0004sE-6P; Tue, 23 Apr 2024 15:13:03 +0000
Received: by outflank-mailman (input) for mailman id 710788;
 Tue, 23 Apr 2024 15:13:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r5BF=L4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rzHpO-0004ry-7M
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 15:13:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9109791-0183-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 17:13:00 +0200 (CEST)
Received: from nico.bugseng.com.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id AC32B4EE073C;
 Tue, 23 Apr 2024 17:12:55 +0200 (CEST)
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
X-Inumbo-ID: f9109791-0183-11ef-909a-e314d9c70b13
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org,
	nicola.vetrini@bugseng.com
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 00/10] Address violations of MISRA C Rule 20.7
Date: Tue, 23 Apr 2024 17:12:42 +0200
Message-Id: <cover.1713885065.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

this series aims to refactor some macros that cause violations of MISRA C Rule
20.7 ("Expressions resulting from the expansion of macro parameters shall be
enclosed in parentheses"). All the macros touched by these patches are in some
way involved in violations, and the strategy adopted to bring them into
compliance is to add parentheses around macro arguments where needed.

Nicola Vetrini (10):
  libelf: address violations of MISRA C Rule 20.7
  xen/page-defs: address violation of MISRA C Rule 20.7
  automation/eclair_analysis: deviate macro count_args_ for MISRA Rule
    20.7
  drivers: char: address violation of MISRA C Rule 20.7
  xen/spinlock: address violations of MISRA C Rule 20.7
  x86/pci: address violation of MISRA C Rule 20.7
  x86/acpi: power: address violations of MISRA Rule 20.7
  x86/hvm: hpet: address violations of MISRA C Rule 20.7
  x86/debugreg: address violation of MISRA C Rule 20.7
  x86/mm: address violations of MISRA C Rule 20.7

 automation/eclair_analysis/ECLAIR/deviations.ecl |  6 ++++++
 docs/misra/deviations.rst                        |  6 ++++++
 xen/arch/x86/acpi/power.c                        | 12 ++++++------
 xen/arch/x86/hvm/hpet.c                          |  4 ++--
 xen/arch/x86/include/asm/debugreg.h              |  2 +-
 xen/arch/x86/include/asm/pci.h                   |  8 ++++----
 xen/arch/x86/mm.c                                |  2 +-
 xen/common/libelf/libelf-private.h               |  2 +-
 xen/common/spinlock.c                            |  2 +-
 xen/drivers/char/omap-uart.c                     |  5 +++--
 xen/include/xen/libelf.h                         |  2 +-
 xen/include/xen/page-defs.h                      |  3 ++-
 xen/include/xen/spinlock.h                       |  2 +-
 13 files changed, 35 insertions(+), 21 deletions(-)

-- 
2.34.1

