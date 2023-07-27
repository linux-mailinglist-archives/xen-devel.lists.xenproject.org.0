Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9097B76519F
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 12:48:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571011.893842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOyXy-0008R7-6U; Thu, 27 Jul 2023 10:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571011.893842; Thu, 27 Jul 2023 10:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOyXy-0008OQ-0o; Thu, 27 Jul 2023 10:48:42 +0000
Received: by outflank-mailman (input) for mailman id 571011;
 Thu, 27 Jul 2023 10:48:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGGP=DN=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qOyXw-0008Gd-Kg
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 10:48:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24c44e3c-2c6b-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 12:48:38 +0200 (CEST)
Received: from nico.bugseng.com (unknown [37.161.207.213])
 by support.bugseng.com (Postfix) with ESMTPSA id C7D524EE0745;
 Thu, 27 Jul 2023 12:48:37 +0200 (CEST)
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
X-Inumbo-ID: 24c44e3c-2c6b-11ee-8613-37d641c3527e
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [XEN PATCH 0/4] address violations of MISRA C:2012 Rule 5.3 on x86
Date: Thu, 27 Jul 2023 12:48:03 +0200
Message-Id: <cover.1690449118.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690449587.git.nicola.vetrini@bugseng.com>
References: <cover.1690449587.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series aims to address some violations of MISRA C:2012 Rule 5.3:
"An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope"

To resolve such violations two strategies have been applied:

1. rename several function parameters or local variables;
2. remove a local variable declaration in an inner scope, if
   using the outer variable does not change the semantics of the function.

Nicola Vetrini (4):
  x86: mechanically rename to address MISRA C:2012 Rule 5.3
  x86/emulate: move a variable declaration to address MISRA C:2012 Rule
    5.3
  x86/mm: mechanically rename variable to avoid shadowing
  x86: address MISRA C:2012 Rule 5.3

 xen/arch/x86/apic.c                    |  8 ++++----
 xen/arch/x86/cpu/mcheck/mce.c          | 12 ++++++------
 xen/arch/x86/cpu/mwait-idle.c          | 24 ++++++++++++------------
 xen/arch/x86/domain.c                  |  2 +-
 xen/arch/x86/e820.c                    |  6 +++---
 xen/arch/x86/emul-i8254.c              |  2 +-
 xen/arch/x86/hvm/emulate.c             |  6 +++---
 xen/arch/x86/include/asm/e820.h        |  2 +-
 xen/arch/x86/include/asm/hvm/save.h    |  8 ++++----
 xen/arch/x86/include/asm/hvm/vpt.h     |  2 +-
 xen/arch/x86/mm/p2m.c                  |  6 +++---
 xen/arch/x86/psr.c                     |  4 ++--
 xen/arch/x86/traps.c                   |  4 ++--
 xen/arch/x86/x86_emulate/x86_emulate.c | 14 ++++++--------
 14 files changed, 49 insertions(+), 51 deletions(-)

--
2.34.1

