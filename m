Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F58E533459
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 02:35:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336794.561222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntezY-0001hS-M0; Wed, 25 May 2022 00:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336794.561222; Wed, 25 May 2022 00:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntezY-0001ex-I1; Wed, 25 May 2022 00:35:12 +0000
Received: by outflank-mailman (input) for mailman id 336794;
 Wed, 25 May 2022 00:35:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AIJu=WB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ntezX-0001N9-Gh
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 00:35:11 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 889b80e3-dbc2-11ec-837f-e5687231ffcc;
 Wed, 25 May 2022 02:35:10 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CF817B81BBD;
 Wed, 25 May 2022 00:35:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D1DC34100;
 Wed, 25 May 2022 00:35:07 +0000 (UTC)
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
X-Inumbo-ID: 889b80e3-dbc2-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653438908;
	bh=5xZ+kaGEO4k/xwRCqA5XePrkd+GNdWNbh3kA/sS07Qo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fVMx/qmcDeO5SD61bgr1oBWbp9f3tqdI/O1GT0MQWqmPDLJyMgq3gvAegR3lakIIa
	 rvIcqCOnZuMyb2YtHRFyNdhGKPYXGcRTq4Zv0zgl0aH2L7szzYYjq1N+QzB7V2a/DZ
	 ZJDhWyeDWv4qlsc4EnSoiEy07tIrhapgd2VVdni6C0dNBCE12+NMw8UJilVWmNR++o
	 sMK/s9Gc1rSIuCtWY4X8OjZzoQfYjlKMDGduHIBTof/pdFdCmfTLU9dW6beZB8ujfG
	 Z6cTDsYfQIwGM/7LfdCcCup6pELsRVl8HoH08d8HYRaskEaL7d/zcfb/AOTNzZQ5xA
	 BkbDh+DK9btug==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	andrew.cooper3@citrix.com,
	jbeulich@suse.com,
	roger.pau@citrix.com,
	julien@xen.org,
	Bertrand.Marquis@arm.com,
	George.Dunlap@citrix.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH 1/2] docs/misra: introduce rules.rst
Date: Tue, 24 May 2022 17:35:04 -0700
Message-Id: <20220525003505.304617-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Introduce a list of MISRA C rules that apply to the Xen hypervisor. The
list is in RST format.

Add a mention of the new list to CODING_STYLE.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 CODING_STYLE         |  6 ++++
 docs/misra/rules.rst | 65 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 docs/misra/rules.rst

diff --git a/CODING_STYLE b/CODING_STYLE
index 9f50d9cec4..1ef35ee8d0 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -235,3 +235,9 @@ callstack between the initial function call and the failure, no error
 is returned.  Using domain_crash() requires careful inspection and
 documentation of the code to make sure all callers at the stack handle
 a newly-dead domain gracefully.
+
+MISRA C
+-------
+
+The Xen Project hypervisor follows the MISRA C coding rules and
+directives listed under docs/misra/rules.rst.
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
new file mode 100644
index 0000000000..c0ee58ab25
--- /dev/null
+++ b/docs/misra/rules.rst
@@ -0,0 +1,65 @@
+=====================
+MISRA C rules for Xen
+=====================
+
+**IMPORTANT** All MISRA C rules, text, and examples are copyrighted by the
+MISRA Consortium Limited and used with permission.
+
+Please refer to https://www.misra.org.uk/ to obtain a copy of MISRA C, or for
+licensing options for other use of the rules.
+
+The following is the list of MISRA C rules that apply to the Xen Project
+hypervisor.
+
+- Rule: Dir 2.1
+  - Severity:  Required
+  - Summary:  All source files shall compile without any compilation errors
+  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_02_01.c
+- Rule: Dir 4.7
+  - Severity:  Required
+  - Summary:  If a function returns error information then that error information shall be tested
+  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_07.c
+- Rule: Dir 4.10
+  - Severity:  Required
+  - Summary:  Precautions shall be taken in order to prevent the contents of a header file being included more than once
+  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_10.c
+- Rule: Dir 4.14
+  - Severity:  Required
+  - Summary:  The validity of values received from external sources shall be checked
+  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_14.c
+- Rule: Rule 1.3
+  - Severity:  Required
+  - Summary:  There shall be no occurrence of undefined or critical unspecified behaviour
+  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_01_03.c
+- Rule: Rule 3.2
+  - Severity:  Required
+  - Summary:  Line-splicing shall not be used in // comments
+  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_03_02.c
+- Rule: Rule 6.2
+  - Severity:  Required
+  - Summary:  Single-bit named bit fields shall not be of a signed type
+  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_06_02.c
+- Rule: Rule 8.1
+  - Severity:  Required
+  - Summary:  Types shall be explicitly specified
+  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_01.c
+- Rule: Rule 8.4
+  - Severity:  Required
+  - Summary:  A compatible declaration shall be visible when an object or function with external linkage is defined
+  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_04.c
+- Rule: Rule 8.5
+  - Severity:  Required
+  - Summary:  An external object or function shall be declared once in one and only one file
+  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_05_2.c
+- Rule: Rule 8.6
+  - Severity:  Required
+  - Summary:  An identifier with external linkage shall have exactly one external definition
+  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_06_2.c
+- Rule: Rule 8.8
+  - Severity:  Required
+  - Summary:  The static storage class specifier shall be used in all declarations of objects and functions that have internal linkage
+  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_08.c
+- Rule: Rule 8.12
+  - Severity:  Required
+  - Summary:  Within an enumerator list the value of an implicitly-specified enumeration constant shall be unique
+  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_12.c
-- 
2.25.1


