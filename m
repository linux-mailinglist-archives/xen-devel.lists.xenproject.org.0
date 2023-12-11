Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B930580C421
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 10:15:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651525.1017197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCcN4-0001gE-4Y; Mon, 11 Dec 2023 09:14:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651525.1017197; Mon, 11 Dec 2023 09:14:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCcN3-0001cp-RN; Mon, 11 Dec 2023 09:14:37 +0000
Received: by outflank-mailman (input) for mailman id 651525;
 Mon, 11 Dec 2023 09:14:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BtsV=HW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rCcN2-0001ce-Bm
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 09:14:36 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b321d339-9805-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 10:14:34 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 2A01C4EE073E;
 Mon, 11 Dec 2023 10:14:32 +0100 (CET)
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
X-Inumbo-ID: b321d339-9805-11ee-98e8-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [XEN PATCH v3 0/3] address some violations of MISRA C Rule 8.4
Date: Mon, 11 Dec 2023 10:14:26 +0100
Message-Id: <cover.1702285639.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C:2012 Rule 8.4 states:
"A compatible declaration shall be visible when an object or function with
external linkage is defined".

Changes from v1:
- Patch 1/7 has been committed;
- Patch 2/7 has been dropped, as the fix is already part of [1];
- Patch 3/7 drops the addition of asmlinkage on variables. Discussion on how to
  handle the existing uses can be part of a separate patch;
- Patch 4/7 is unchanged;
- Patch 5/7 has been committed;
- Patch 6/7 has been dropped
- Patch 7/7 has been revised to have a declaration for first_valid_mfn, rather
  than a deviation for the absence of a declaration
Changes from v2:
- Patch 3/3: remove redundant declarations

[1] https://lore.kernel.org/xen-devel/27dd8f40-1ea6-1e7e-49c2-31936a17e9d7@suse.com/


Nicola Vetrini (3):
  xen/x86: add missing instances of asmlinkage attributes
  x86/viridian: make build_assertions static
  xen/mm: add declaration for first_valid_mfn

 xen/arch/arm/include/asm/numa.h   | 8 ++++----
 xen/arch/ppc/include/asm/numa.h   | 7 +++----
 xen/arch/x86/efi/efi-boot.h       | 5 +++--
 xen/arch/x86/hvm/viridian/synic.c | 2 +-
 xen/arch/x86/smpboot.c            | 2 +-
 xen/include/xen/mm.h              | 2 ++
 6 files changed, 14 insertions(+), 12 deletions(-)

-- 
2.34.1

