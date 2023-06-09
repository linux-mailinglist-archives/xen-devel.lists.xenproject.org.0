Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C89072A190
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 19:46:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546249.852975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7gBM-0007aL-Qy; Fri, 09 Jun 2023 17:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546249.852975; Fri, 09 Jun 2023 17:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7gBM-0007Yc-My; Fri, 09 Jun 2023 17:45:52 +0000
Received: by outflank-mailman (input) for mailman id 546249;
 Fri, 09 Jun 2023 17:45:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=464j=B5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q7gBK-0007Qh-JK
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 17:45:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77adf362-06ed-11ee-8611-37d641c3527e;
 Fri, 09 Jun 2023 19:45:48 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AEF1260FD7;
 Fri,  9 Jun 2023 17:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E635CC433EF;
 Fri,  9 Jun 2023 17:45:45 +0000 (UTC)
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
X-Inumbo-ID: 77adf362-06ed-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686332747;
	bh=dqfiNuKNAwHmTD6p7fTf0hehefrrkpHdKFChwJoI6SQ=;
	h=From:To:Cc:Subject:Date:From;
	b=B9zzudKRneFaC8kmI+9nmceyDjQirLwWLf+WU36xxZhJ+rkl3wfWp03EpjqkW4iE1
	 r00UfXjefV4ujty70WXYNxESh2AFTYVMCT9LsA6pw2MnRUgZBH47B6QmM/engHnNur
	 SC7PDErXHja6W05reeWHVNF3Wi4OLmmzkP6+qR3CPFOJqoKq9ai9NhwbC4Hr1GCFsw
	 evAyWMCDqXdX/Ga5Ao9IeeNKeFR0/9SH9pACfAGc+xHpPDBInA5u/tYXoqHV69xZxU
	 lYFOURvV4eMpC5NnkqRwFgH/iHVRz5th/qyy/BXUUGUQWyId1LEONTInBqudtMxAm2
	 rhjg43kqjKbfA==
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
Subject: [PATCH v2] docs/misra: new rules addition
Date: Fri,  9 Jun 2023 10:45:43 -0700
Message-Id: <20230609174543.4067574-1-sstabellini@kernel.org>
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
Changes in v2:
- drop 5.6
- specify additional appropriate types for 6.1
---
 docs/misra/rules.rst | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index d5a6ee8cb6..8be6868496 100644
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
@@ -133,6 +146,13 @@ existing codebase are work-in-progress.
        headers (xen/include/public/) are allowed to retain longer
        identifiers for backward compatibility.
 
+   * - `Rule 6.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_06_01.c>`_
+     - Required
+     - Bit-fields shall only be declared with an appropriate type
+     - In addition to the C99 types, we also consider appropriate types:
+       unsigned char, unsigned short, unsigned long, unsigned long long,
+       enum.
+
    * - `Rule 6.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_06_02.c>`_
      - Required
      - Single-bit named bit fields shall not be of a signed type
@@ -143,6 +163,12 @@ existing codebase are work-in-progress.
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
@@ -314,6 +340,11 @@ existing codebase are work-in-progress.
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


