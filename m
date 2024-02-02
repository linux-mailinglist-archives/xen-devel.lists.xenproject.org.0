Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B56B88472E2
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 16:17:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675076.1050253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVvHg-0006PJ-JF; Fri, 02 Feb 2024 15:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675076.1050253; Fri, 02 Feb 2024 15:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVvHg-0006Mj-FV; Fri, 02 Feb 2024 15:16:52 +0000
Received: by outflank-mailman (input) for mailman id 675076;
 Fri, 02 Feb 2024 15:16:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lYVL=JL=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rVvHe-0005mR-Gr
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 15:16:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 159e6126-c1de-11ee-98f5-efadbce2ee36;
 Fri, 02 Feb 2024 16:16:48 +0100 (CET)
Received: from beta.station (net-188-218-67-100.cust.vodafonedsl.it
 [188.218.67.100])
 by support.bugseng.com (Postfix) with ESMTPSA id 63D3E4EE0737;
 Fri,  2 Feb 2024 16:16:47 +0100 (CET)
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
X-Inumbo-ID: 159e6126-c1de-11ee-98f5-efadbce2ee36
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
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH v4 0/4] address violation of MISRA C:2012 Rule 13.1
Date: Fri,  2 Feb 2024 16:16:01 +0100
Message-Id: <cover.1706886631.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The Xen sources contain violations of MISRA C:2012 Rule 13.1 whose headline states:
"Initializer lists shall not contain persistent side effects".

The file properties.json containing function and macro properties is introduced, as
stated in v2 discussion. Some functions and macros are found to have properties that
can be exploited by static analyzers. For this reason, the file docs/properties.json
contains all the needed properties. A description of the json file is documented in
docs/properties.rst.

Some persistent effects have been moved outside initializer lists to address violations
of Rule 13.1.

Link to the discussion: https://lore.kernel.org/all/cover.1700844359.git.simone.ballarin@bugseng.com/T/#u

Changes in v4:
- added missing script for converting function_macro_properties.json in ECL configurations
  and other related improvements.

Changes in v3:
- change prefix from xen to xen/ns16550
- add assignment of rc in xen/ns16550
- use rc as controlling expression in the following if-statement
- change commit prefix from xen/arm to xen
- specify where saf-3-safe comments are applied in guestcopy.c
- reword saf comments text

Maria Celeste Cesario (1):
  eclair: move function and macro properties outside ECLAIR

Simone Ballarin (3):
  xen: add SAF deviation for debugging and logging effects
  xen/ns16550: address violations of MISRA C:2012 Rule 13.1
  xen/x86: address violations of MISRA C:2012 Rule 13.1

 .../eclair_analysis/ECLAIR/analysis.ecl       |   1 +
 .../ECLAIR/call_properties.ecl                | 128 ---
 automation/eclair_analysis/prepare.sh         |   2 +
 automation/eclair_analysis/propertyparser.py  |  37 +
 docs/function_macro_properties.json           | 841 ++++++++++++++++++
 docs/function_macro_properties.rst            |  58 ++
 docs/misra/safe.json                          |  16 +
 xen/arch/arm/device.c                         |   1 +
 xen/arch/arm/guestcopy.c                      |  16 +-
 xen/arch/x86/hvm/hvm.c                        |   1 +
 xen/arch/x86/io_apic.c                        |   9 +-
 xen/arch/x86/mpparse.c                        |   3 +-
 xen/arch/x86/setup.c                          |   3 +-
 xen/common/sched/core.c                       |   3 +
 xen/drivers/char/ns16550.c                    |   4 +-
 15 files changed, 985 insertions(+), 138 deletions(-)
 delete mode 100644 automation/eclair_analysis/ECLAIR/call_properties.ecl
 create mode 100644 automation/eclair_analysis/propertyparser.py
 create mode 100644 docs/function_macro_properties.json
 create mode 100644 docs/function_macro_properties.rst

-- 
2.34.1


