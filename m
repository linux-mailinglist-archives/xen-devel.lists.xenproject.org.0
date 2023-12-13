Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC2F8118D4
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 17:12:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654092.1020754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDRqB-00081b-AG; Wed, 13 Dec 2023 16:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654092.1020754; Wed, 13 Dec 2023 16:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDRqB-0007yf-6x; Wed, 13 Dec 2023 16:12:07 +0000
Received: by outflank-mailman (input) for mailman id 654092;
 Wed, 13 Dec 2023 16:12:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mCut=HY=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rDRq9-0007yZ-7N
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 16:12:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59f7d8e0-99d2-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 17:12:02 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id D99BA4EE0737;
 Wed, 13 Dec 2023 17:12:01 +0100 (CET)
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
X-Inumbo-ID: 59f7d8e0-99d2-11ee-9b0f-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v2 0/2] xen: address violations of MISRA C:2012 Rule 14.4
Date: Wed, 13 Dec 2023 17:10:49 +0100
Message-Id: <cover.1702310368.git.maria.celeste.cesario@bugseng.com>
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

Changes in v2:
- rename patch prefix from AMD/IOMMU to x86/IOMMU;
- move changes on hpet.c and msi.c from xen/x86 to x86/IOMMU patch;
- rename patch prefix from xen/x86 to xen/x86_emulate.

Maria Celeste Cesario (2):
  x86/IOMMU: address violations of MISRA C:2012 Rule 14.4
  xen/x86_emulate: address violations of MISRA C:2012 Rule 14.4

 xen/arch/x86/hpet.c                      | 6 +++---
 xen/arch/x86/msi.c                       | 4 ++--
 xen/arch/x86/x86_emulate/x86_emulate.c   | 8 ++++----
 xen/drivers/passthrough/amd/iommu_init.c | 4 ++--
 xen/drivers/passthrough/vtd/iommu.c      | 4 ++--
 xen/drivers/passthrough/vtd/quirks.c     | 2 +-
 6 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.40.0


