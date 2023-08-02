Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3331E76C9B7
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 11:45:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574820.900421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR8Pe-0000Ri-8R; Wed, 02 Aug 2023 09:45:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574820.900421; Wed, 02 Aug 2023 09:45:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR8Pe-0000O4-3O; Wed, 02 Aug 2023 09:45:02 +0000
Received: by outflank-mailman (input) for mailman id 574820;
 Wed, 02 Aug 2023 09:45:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YIS5=DT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qR8Pc-0000Lc-5p
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 09:45:00 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3df6e956-3119-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 11:44:58 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id C26E14EE0737;
 Wed,  2 Aug 2023 11:44:55 +0200 (CEST)
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
X-Inumbo-ID: 3df6e956-3119-11ee-8613-37d641c3527e
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
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH 0/4] x86: address some violations of MISRA C:2012 Rule 5.3
Date: Wed,  2 Aug 2023 11:44:27 +0200
Message-Id: <cover.1690969271.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some variables are renamed or deleted in this series to avoid shadowing, which
violates MISRA C:2012 Rule 5.3, whose headline is:
"An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope".

Nicola Vetrini (4):
  x86/mce: address MISRA C:2012 Rule 5.3
  x86/mtrr: address MISRA C:2012 Rule 5.3
  x86/irq: rename variable to address MISRA C:2012 Rule 5.3
  x86/setup: address MISRA C:2012 Rule 5.3

 xen/arch/x86/cpu/mcheck/barrier.c |  8 ++++----
 xen/arch/x86/cpu/mcheck/barrier.h |  8 ++++----
 xen/arch/x86/hvm/hvm.c            |  2 +-
 xen/arch/x86/hvm/mtrr.c           | 32 +++++++++++++++----------------
 xen/arch/x86/include/asm/irq.h    |  2 +-
 xen/arch/x86/include/asm/setup.h  |  2 +-
 xen/arch/x86/io_apic.c            | 10 +++++-----
 xen/arch/x86/irq.c                | 12 ++++++------
 xen/arch/x86/msi.c                |  4 ++--
 xen/arch/x86/setup.c              |  3 +--
 xen/include/xen/irq.h             |  2 +-
 11 files changed, 42 insertions(+), 43 deletions(-)

--
2.34.1

