Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C29B768EE6
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 09:34:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572767.896801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQNQA-0008AK-VF; Mon, 31 Jul 2023 07:34:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572767.896801; Mon, 31 Jul 2023 07:34:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQNQA-000879-SR; Mon, 31 Jul 2023 07:34:26 +0000
Received: by outflank-mailman (input) for mailman id 572767;
 Mon, 31 Jul 2023 07:34:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wefb=DR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qQNQA-000873-7k
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 07:34:26 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac2cf0d3-2f74-11ee-b254-6b7b168915f2;
 Mon, 31 Jul 2023 09:34:25 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 05FDD4EE0737;
 Mon, 31 Jul 2023 09:34:22 +0200 (CEST)
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
X-Inumbo-ID: ac2cf0d3-2f74-11ee-b254-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [XEN PATCH v2 0/4] x86: address MISRA C:2012 Rule 5.3
Date: Mon, 31 Jul 2023 09:33:37 +0200
Message-Id: <cover.1690788513.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series aims to address some violations of MISRA C:2012 Rule 5.3:
"An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope".

To resolve such violations two strategies have been applied:

1. rename several function parameters or local variables;
2. remove a local variable declaration in an inner scope, if
   using the outer variable does not change the semantics of the function.

Nicola Vetrini (4):
  x86: mechanically rename to address MISRA C:2012 Rule 5.3
  x86/mm: remove variable to avoid shadowing
  x86emul: avoid shadowing to address MISRA C:2012 Rule 5.3
  x86emul: remove local variable to address MISRA C:2012 Rule 5.3

 xen/arch/x86/cpu/mcheck/mce.c          |  8 ++++----
 xen/arch/x86/domain.c                  |  2 +-
 xen/arch/x86/emul-i8254.c              |  2 +-
 xen/arch/x86/include/asm/e820.h        |  2 +-
 xen/arch/x86/include/asm/hvm/save.h    |  8 ++++----
 xen/arch/x86/include/asm/hvm/vpt.h     |  2 +-
 xen/arch/x86/mm/p2m.c                  |  2 --
 xen/arch/x86/psr.c                     |  4 ++--
 xen/arch/x86/traps.c                   |  5 ++---
 xen/arch/x86/x86_emulate/x86_emulate.c | 14 ++++++--------
 10 files changed, 22 insertions(+), 27 deletions(-)

--
2.34.1

