Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 653E8904091
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 17:54:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738552.1145355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH3of-0005Gx-1f; Tue, 11 Jun 2024 15:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738552.1145355; Tue, 11 Jun 2024 15:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH3oe-0005Fa-Rg; Tue, 11 Jun 2024 15:53:44 +0000
Received: by outflank-mailman (input) for mailman id 738552;
 Tue, 11 Jun 2024 15:53:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sLxx=NN=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sH3oc-0005DH-PE
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 15:53:42 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5df9a76-280a-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 17:53:41 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 70C834EE0754;
 Tue, 11 Jun 2024 17:53:38 +0200 (CEST)
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
X-Inumbo-ID: c5df9a76-280a-11ef-90a3-e314d9c70b13
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 0/6] address several violations of MISRA Rule 20.7
Date: Tue, 11 Jun 2024 17:53:30 +0200
Message-Id: <cover.1718117557.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

this series addresses several violations of Rule 20.7, as well as a
small fix to the ECLAIR integration scripts that do not influence
the current behaviour, but were mistakenly part of the upstream
configuration.

Note that by applying this series the rule has a few leftover violations.
Most of those are in x86 code in xen/arch/x86/include/asm/msi.h .
I did send a patch [1] to deal with those, limited only to addressing the MISRA
violations, but in the end it was dropped in favour of a more general cleanup of
the file upon agreement, so this is why those changes are not included here.

[1] https://lore.kernel.org/xen-devel/2f2c865f20d0296e623f1d65bed25c083f5dd497.1711700095.git.nicola.vetrini@bugseng.com/

Nicola Vetrini (6):
  automation/eclair: address violations of MISRA C Rule 20.7
  xen/self-tests: address violations of MISRA rule 20.7
  xen/guest_access: address violations of MISRA rule 20.7
  x86emul: address violations of MISRA C Rule 20.7
  x86/irq: address violations of MISRA C Rule 20.7
  automation/eclair_analysis: clean ECLAIR configuration scripts

 automation/eclair_analysis/ECLAIR/analyze.sh     | 3 +--
 automation/eclair_analysis/ECLAIR/deviations.ecl | 8 ++++++++
 xen/arch/x86/x86_emulate/x86_emulate.c           | 4 ++--
 xen/include/xen/guest_access.h                   | 4 ++--
 xen/include/xen/irq.h                            | 2 +-
 xen/include/xen/self-tests.h                     | 8 ++++----
 6 files changed, 18 insertions(+), 11 deletions(-)

-- 
2.34.1

