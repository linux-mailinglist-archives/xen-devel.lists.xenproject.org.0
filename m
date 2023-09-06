Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18850793AC1
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 13:09:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596482.930400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdqPX-0005Jp-Ug; Wed, 06 Sep 2023 11:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596482.930400; Wed, 06 Sep 2023 11:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdqPX-0005I6-Rl; Wed, 06 Sep 2023 11:09:27 +0000
Received: by outflank-mailman (input) for mailman id 596482;
 Wed, 06 Sep 2023 11:09:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T1xS=EW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qdqPW-0005Hp-PF
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 11:09:26 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d641daeb-4ca5-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 13:09:24 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id B07CD4EE0737;
 Wed,  6 Sep 2023 13:09:22 +0200 (CEST)
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
X-Inumbo-ID: d641daeb-4ca5-11ee-9b0d-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH v2 0/2] xen: deviate asm-only function definitions for Rule 8.4
Date: Wed,  6 Sep 2023 13:09:07 +0200
Message-Id: <cover.1693998375.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As stated in 'docs/misra/rules.rst' the community decided to deviate from Rule 8.4
whereby the definitions concern entities that are only used in asm modules.
The chosen deviation mechanism is that of textual deviations, through the use of
/* SAF-n-safe */ comments.

The deviation of variables is postponed to a future patch.

Nicola Vetrini (2):
  xen: apply deviation for Rule 8.4 (asm-only definitions)
  automation: execute SAF translation before the analysis with ECLAIR

 automation/eclair_analysis/prepare.sh | 3 +++
 docs/misra/safe.json                  | 8 ++++++++
 xen/arch/arm/cpuerrata.c              | 1 +
 xen/arch/arm/setup.c                  | 1 +
 xen/arch/arm/smpboot.c                | 1 +
 xen/arch/arm/traps.c                  | 7 +++++++
 xen/arch/x86/boot/cmdline.c           | 1 +
 xen/arch/x86/boot/reloc.c             | 1 +
 xen/arch/x86/extable.c                | 4 ++--
 xen/arch/x86/setup.c                  | 1 +
 xen/arch/x86/traps.c                  | 9 +++++++++
 xen/common/efi/boot.c                 | 5 +++--
 12 files changed, 38 insertions(+), 4 deletions(-)

--
2.34.1

