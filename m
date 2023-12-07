Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B23258084EF
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 10:49:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649719.1014527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBB0p-0002oc-5C; Thu, 07 Dec 2023 09:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649719.1014527; Thu, 07 Dec 2023 09:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBB0p-0002m0-2f; Thu, 07 Dec 2023 09:49:43 +0000
Received: by outflank-mailman (input) for mailman id 649719;
 Thu, 07 Dec 2023 09:49:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TliB=HS=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rBB0n-0002ln-Cy
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 09:49:41 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f03e76d6-94e5-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 10:49:39 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 4FCD74EE073A;
 Thu,  7 Dec 2023 10:49:38 +0100 (CET)
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
X-Inumbo-ID: f03e76d6-94e5-11ee-9b0f-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 0/3] xen: address violations of MISRA C:2012 Rule 14.4
Date: Thu,  7 Dec 2023 10:48:41 +0100
Message-Id: <cover.1701941924.git.maria.celeste.cesario@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

The xen sources contain violations of MISRA C:2012 Rule 14.4 whose
headline states:
"The controlling expression of an if statement and the controlling
expression of an iteration-statement shall have essentially Boolean type".

Add comparisons to avoid using enum constants as controlling expressions
to comply with Rule 14.4.

Example:
    extern enum __packed iommu_intremap {
       iommu_intremap_off,
       iommu_intremap_restricted,
       iommu_intremap_full,
    } iommu_intremap;

    if ( iommu_intremap )                       /* non-compliant */
    if ( iommu_intremap != iommu_intremap_off ) /* compliant, proposed change */

Struct domain member is_dying is an anonymous enum variable designed to act as boolean.
Add deviation to mark its uses in controlling expressions as deliberate.

Maria Celeste Cesario (3):
  AMD/IOMMU: address violations of MISRA C:2012 Rule 14.4
  xen/x86: address violations of MISRA C:2012 Rule 14.4
  xen: address violations of MISRA C:2012 Rule 14.4

 automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
 docs/misra/deviations.rst                        | 6 ++++++
 xen/arch/x86/hpet.c                              | 6 +++---
 xen/arch/x86/msi.c                               | 4 ++--
 xen/arch/x86/x86_emulate/x86_emulate.c           | 8 ++++----
 xen/drivers/passthrough/amd/iommu_init.c         | 4 ++--
 xen/drivers/passthrough/vtd/iommu.c              | 4 ++--
 xen/drivers/passthrough/vtd/quirks.c             | 2 +-
 8 files changed, 26 insertions(+), 14 deletions(-)

-- 
2.40.0


