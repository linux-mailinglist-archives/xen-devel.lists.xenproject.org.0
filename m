Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C7B77F687
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 14:40:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585375.916471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWcI9-0000Rg-Ov; Thu, 17 Aug 2023 12:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585375.916471; Thu, 17 Aug 2023 12:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWcI9-0000NW-KI; Thu, 17 Aug 2023 12:39:57 +0000
Received: by outflank-mailman (input) for mailman id 585375;
 Thu, 17 Aug 2023 12:39:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0n1I=EC=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qWcI8-0000KH-2m
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 12:39:56 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29edf115-3cfb-11ee-9b0c-b553b5be7939;
 Thu, 17 Aug 2023 14:39:53 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id EDD7D4EE0737;
 Thu, 17 Aug 2023 14:39:51 +0200 (CEST)
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
X-Inumbo-ID: 29edf115-3cfb-11ee-9b0c-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [XEN PATCH v2 0/3] xen: fix inclusions and static storage duration
Date: Thu, 17 Aug 2023 14:39:25 +0200
Message-Id: <cover.1692275359.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The files touched by this series contain function or variable definitions with
no prior declaration visible, because it's inside an header that is not included
or it's not present anywhere. This is a risk in itself, but also violates
MISRA C:2012 Rule 8.4, which states the following:
"A compatible declaration shall be visible when an object or function with
external linkage is defined".

The resolution strategies are as follows:

1. make the functions/variables static
2. include the header that contains the compatible declaration

No functional change.

Additional notes:
- This series is a continuation of the work done here [1], so the same additional
  notes apply.

[1] https://lore.kernel.org/xen-devel/cover.1691655814.git.nicola.vetrini@bugseng.com/T/#m28da1b5ef8d9a7683937bfc345765e3438b89977

Changes in v2:
- Addressed review comments on the leftover patches
- Patches 1,2,4 from the previous version have already been committed

Nicola Vetrini (3):
  vm_event: rework inclusions to use arch-indipendent header
  vpci/msix: make 'get_slot' static
  drivers/video: make declarations of defined functions available

 xen/arch/arm/include/asm/vm_event.h |  1 -
 xen/arch/arm/vm_event.c             |  2 +-
 xen/arch/x86/include/asm/setup.h    |  6 ------
 xen/arch/x86/platform_hypercall.c   |  2 +-
 xen/arch/x86/pv/dom0_build.c        |  2 +-
 xen/arch/x86/vm_event.c             |  2 +-
 xen/drivers/video/vga.c             |  8 --------
 xen/drivers/vpci/msix.c             |  2 +-
 xen/include/xen/console.h           |  2 --
 xen/include/xen/vga.h               | 16 ++++++++++++++++
 xen/include/xen/vm_event.h          |  1 +
 11 files changed, 22 insertions(+), 22 deletions(-)

--
2.34.1

