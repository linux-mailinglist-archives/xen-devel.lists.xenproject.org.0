Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFA976519D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 12:48:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571006.893792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOyXq-00074Z-Eb; Thu, 27 Jul 2023 10:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571006.893792; Thu, 27 Jul 2023 10:48:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOyXq-00072G-Bw; Thu, 27 Jul 2023 10:48:34 +0000
Received: by outflank-mailman (input) for mailman id 571006;
 Thu, 27 Jul 2023 10:48:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGGP=DN=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qOyXp-00072A-Br
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 10:48:33 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2123079f-2c6b-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 12:48:32 +0200 (CEST)
Received: from nico.bugseng.com (unknown [37.161.207.213])
 by support.bugseng.com (Postfix) with ESMTPSA id 48FD94EE073F;
 Thu, 27 Jul 2023 12:48:30 +0200 (CEST)
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
X-Inumbo-ID: 2123079f-2c6b-11ee-b247-6b7b168915f2
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
	Paul Durrant <paul@xen.org>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [XEN PATCH 0/4] address violations of MISRA C:2012 Rule 5.3 on x86
Date: Thu, 27 Jul 2023 12:47:58 +0200
Message-Id: <cover.1690449587.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
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
  x86: avoid shadowing to address MISRA C:2012 Rule 5.3

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

