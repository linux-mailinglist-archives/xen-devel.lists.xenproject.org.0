Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C247D9C6B9F
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 10:39:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835188.1251031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB9q3-000261-7x; Wed, 13 Nov 2024 09:39:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835188.1251031; Wed, 13 Nov 2024 09:39:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB9q3-00024U-51; Wed, 13 Nov 2024 09:39:03 +0000
Received: by outflank-mailman (input) for mailman id 835188;
 Wed, 13 Nov 2024 09:39:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LXmd=SI=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1tB9q0-00024O-Sq
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 09:39:01 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1adcfead-a1a3-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 10:38:57 +0100 (CET)
Received: from delta.homenet.telecomitalia.it
 (host-82-59-161-229.retail.telecomitalia.it [82.59.161.229])
 by support.bugseng.com (Postfix) with ESMTPSA id 5D0D84EE073E;
 Wed, 13 Nov 2024 10:38:55 +0100 (CET)
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
X-Inumbo-ID: 1adcfead-a1a3-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE2Mi41NS4xMzEuNDciLCJoZWxvIjoic3VwcG9ydC5idWdzZW5nLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjFhZGNmZWFkLWExYTMtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDkwNzM3Ljc0MzgzNywic2VuZGVyIjoiYWxlc3NhbmRyby56dWNjaGVsbGlAYnVnc2VuZy5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1731490736; bh=qWowrHwog5vYWGg7Rukld6FcJCxVgYyaADYK76z8eGg=;
	h=From:To:Cc:Subject:Date:From;
	b=VPDY7iFh3OKajXOLtt9bqsJPlhY65DUW3wRWN5y4//Ky9/al2/NMoKwh1AMAvZts2
	 /k7e9guwPbgV32YNHx/rcG/Cl7AtpsJD8/XFcbvXijfbVXgcPvMg92w+qAfhpnqhrr
	 4IzLoqlHgtriFlwVQQbd1kOmL24CSR4LOG+IEzm6XTUsP1v2gDKr26XAvMEzsmCJT3
	 2W1aAhnPHgjS/rDbTb2Y1AXWUm1j5BFBC86sk2ViDVqzRmRSJy21xt6+2SwEqyWwht
	 K2PWj5UzJ1yAosiU/qV+2elsFM3fKEXbDCAxJcVBVtDiMUAI0QCDHJfjksTXhnOxmY
	 m45Rh2V59h2kw==
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] xen: add deviations for MISRA C 2012 Rule R5.4
Date: Wed, 13 Nov 2024 10:38:45 +0100
Message-ID: <255ae80cc8b95f33daa7534c9552c571391cf689.1731490650.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This addresses violations of MISRA C:2012 Rule 5.4 which states as
following: Macro identifiers shall be distinct.

This deviation aims to address violations of Rule 5.4 regarding
identifiers XLAT_hvm_altp2m_set_mem_access_multi_HNDL_pfn_list and
XLAT_hvm_altp2m_set_mem_access_multi_HNDL_access_list, and identifiers
declared in header file include/asm/guest/hyperv-tlfs.h.

No functional change.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 9 +++++++++
 docs/misra/deviations.rst                        | 8 ++++++++
 2 files changed, 17 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 2f58f29203..9e780e4465 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -98,6 +98,15 @@ it defines would (in the common case) be already defined. Peer reviewed by the c
 -config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^read_debugreg$))&&any_exp(macro(^write_debugreg$))))"}
 -doc_end
 
+-doc_begin="Identifiers declared in the following header file should not be changed, therefore they are excluded from compliance with this rule."
+-config=MC3R1.R5.4,reports+={safe, "any_area(any_loc(file(^xen/arch/x86/include/asm/guest/hyperv-tlfs\\.h$)))"}
+-doc_end
+
+-doc_begin="The following macro identifiers should not be changed, therefore they are excluded from compliance with this rule."
+-config=MC3R1.R5.4,ignored_macros+=^XLAT_hvm_altp2m_set_mem_access_multi_HNDL_pfn_list$
+-config=MC3R1.R5.4,ignored_macros+=^XLAT_hvm_altp2m_set_mem_access_multi_HNDL_access_list$
+-doc_end
+
 -doc_begin="Macros expanding to their own identifier (e.g., \"#define x x\") are deliberate."
 -config=MC3R1.R5.5,reports+={deliberate, "all_area(macro(same_id_body())||!macro(!same_id_body()))"}
 -doc_end
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 15a993d050..2ce1c8e58a 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -109,6 +109,14 @@ Deviations related to MISRA C:2012 Rules:
          - __emulate_2op and __emulate_2op_nobyte
          - read_debugreg and write_debugreg
 
+   * - R5.4
+     - Macros XLAT_hvm_altp2m_set_mem_access_multi_HNDL_pfn_list and
+       XLAT_hvm_altp2m_set_mem_access_multi_HNDL_access_list should not be
+       changed, and are therefore ignored by the ECLAIR.
+       Identifiers in header file xen/arch/x86/include/asm/guest/hyperv-tlfs.halder
+       shall not be changed.
+     - Tagged as `safe` for ECLAIR.
+
    * - R5.5
      - Macros expanding to their own name are allowed.
      - Tagged as `deliberate` for ECLAIR.
-- 
2.43.0


