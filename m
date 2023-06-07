Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B794D725196
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 03:38:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544281.849943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6i7w-0000yU-GW; Wed, 07 Jun 2023 01:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544281.849943; Wed, 07 Jun 2023 01:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6i7w-0000vS-Bv; Wed, 07 Jun 2023 01:38:20 +0000
Received: by outflank-mailman (input) for mailman id 544281;
 Wed, 07 Jun 2023 01:38:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ksrr=B3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q6i7v-0000vM-5a
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 01:38:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8dc8889-04d3-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 03:38:16 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DF53A60B45;
 Wed,  7 Jun 2023 01:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E009C433D2;
 Wed,  7 Jun 2023 01:38:12 +0000 (UTC)
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
X-Inumbo-ID: f8dc8889-04d3-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686101894;
	bh=VkXphGgITwqS2qBelPArt1k3PXjyQME1JBtsvwguZOk=;
	h=From:To:Cc:Subject:Date:From;
	b=SwynRGdxCil7iabPXfiQieJQWLxN+quh+h/NvK+78LrGSq3+3pmm7j1X4+YbGvKeW
	 Jbd/eayWf6JgrrMxGErGKsNnsuyO8VtJavkVMQ2OxZcEX0H6h41RcHZR3LVk+rzGO4
	 2G6jyZc3qcKEenc3Ngh1zYs4BwE8RigibkTFqCzvv1PPznUDQWIU9R9akwZ4G9Ypwz
	 4DuwYmJB70+H618I/BufedXx2uHt2MibqJusT66S+qGehXEy2L03+ukAwedjhg2Qk1
	 HtEmIXeNLvCx3Fu3ZPWQK/NWqxv/zqB8xHwH07tsBfefPAzj5fEfclbPvn1XnL0hbm
	 OvQfvybnmEHJA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jbeulich@suse.com,
	julien@xen.org,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	roberto.bagnara@bugseng.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH] docs/misra: new rules addition
Date: Tue,  6 Jun 2023 18:38:10 -0700
Message-Id: <20230607013810.3385316-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

For Dir 1.1, a document describing all implementation-defined behaviour
(i.e. gcc-specific behavior) will be added to docs/misra, also including
implementation-specific (gcc-specific) appropriate types for bit-field
relevant to Rule 6.1.

Rule 21.21 is lacking an example on gitlab but the rule is
straightforward: we don't use stdlib at all in Xen.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
We also discussed Rules 2.1, 5.5 and 7.4 but they require more work
before we can decide one way or the other.
---
 docs/misra/rules.rst | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index d5a6ee8cb6..0e298edeb8 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -40,6 +40,12 @@ existing codebase are work-in-progress.
      - Summary
      - Notes
 
+   * - `Dir 1.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_01_01.c>`_
+     - Required
+     - Any implementation-defined behaviour on which the output of the
+       program depends shall be documented and understood
+     -
+
    * - `Dir 2.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_02_01.c>`_
      - Required
      - All source files shall compile without any compilation errors
@@ -57,6 +63,13 @@ existing codebase are work-in-progress.
        header file being included more than once
      -
 
+   * - `Dir 4.11 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_11.c>`_
+     - Required
+     - The validity of values passed to library functions shall be checked
+     - We do not have libraries in Xen (libfdt and others are not
+       considered libraries from MISRA C point of view as they are
+       imported in source form)
+
    * - `Dir 4.14 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_14.c>`_
      - Required
      - The validity of values received from external sources shall be
@@ -133,6 +146,16 @@ existing codebase are work-in-progress.
        headers (xen/include/public/) are allowed to retain longer
        identifiers for backward compatibility.
 
+   * - `Rule 5.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_06.c>`_
+     - Required
+     - A typedef name shall be a unique identifier
+     -
+
+   * - `Rule 6.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_06_01.c>`_
+     - Required
+     - Bit-fields shall only be declared with an appropriate type
+     -
+
    * - `Rule 6.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_06_02.c>`_
      - Required
      - Single-bit named bit fields shall not be of a signed type
@@ -143,6 +166,12 @@ existing codebase are work-in-progress.
      - Octal constants shall not be used
      -
 
+   * - `Rule 7.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_02.c>`_
+     - Required
+     - A "u" or "U" suffix shall be applied to all integer constants
+       that are represented in an unsigned type
+     -
+
    * - `Rule 7.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_03.c>`_
      - Required
      - The lowercase character l shall not be used in a literal suffix
@@ -314,6 +343,11 @@ existing codebase are work-in-progress.
        used following a subsequent call to the same function
      -
 
+   * - Rule 21.21
+     - Required
+     - The Standard Library function system of <stdlib.h> shall not be used
+     -
+
    * - `Rule 22.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_02.c>`_
      - Mandatory
      - A block of memory shall only be freed if it was allocated by means of a
-- 
2.25.1


