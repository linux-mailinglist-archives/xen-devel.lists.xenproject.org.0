Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7990730AFF
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 00:55:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549247.857690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9ZOh-0003nF-3A; Wed, 14 Jun 2023 22:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549247.857690; Wed, 14 Jun 2023 22:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9ZOg-0003kx-UT; Wed, 14 Jun 2023 22:55:26 +0000
Received: by outflank-mailman (input) for mailman id 549247;
 Wed, 14 Jun 2023 22:55:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/4vD=CC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q9ZOf-0003kp-Kz
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 22:55:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bb29fbd-0b06-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 00:55:24 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 58CE560B8D;
 Wed, 14 Jun 2023 22:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A31FC433C8;
 Wed, 14 Jun 2023 22:55:21 +0000 (UTC)
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
X-Inumbo-ID: 8bb29fbd-0b06-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686783322;
	bh=ZdNVErUCeGAT83PF+zOGrrZsYSZg7ptoQjkJ3ghi4Y0=;
	h=From:To:Cc:Subject:Date:From;
	b=Z6r6uEtI9hOI0U+GUzZaN19ywKh84/3IcFrZrTif8ldo795wg5elXREFtQxKFZCX9
	 Vsclub1V051GHLOrEPCQfxJRvAsMdXjAPaQKoppb9NWfot3ySmhEUa3+Xgrdn/o5XR
	 M8FSmIsxIgFZ2cybSUJYHR/o76biaFyHqPDby4La1IF44QdJvTq6q8QGuPqz+DSZWo
	 Zrv+Xj7QA0MTe5XsRQ/btFLJxZd2hX5GGD+wJKrdk08Q91KTF+FNz6niuOmCQgYJZj
	 AbTJ9mp2DbEtwWRCZuT5+FZ/moq0iVbX96hFXIIyF87chRWiIZHdIxmUlA8jm06xoE
	 yLTnmgwffZiQQ==
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
Subject: [PATCH v4] docs/misra: new rules addition
Date: Wed, 14 Jun 2023 15:55:15 -0700
Message-Id: <20230614225515.1057820-1-sstabellini@kernel.org>
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
Changes in v4:
- improve wording of the note in 6.1

Changes in v3:
- add all signed integer types to the Notes of 6.1
- clarify 7.2 in the Notes
- not added: marking "inapplicable" rules, to be a separate patch

Changes in v2:
- drop 5.6
- specify additional appropriate types for 6.1
---
 docs/misra/rules.rst | 50 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index d5a6ee8cb6..41a727ca98 100644
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
@@ -133,6 +146,12 @@ existing codebase are work-in-progress.
        headers (xen/include/public/) are allowed to retain longer
        identifiers for backward compatibility.
 
+   * - `Rule 6.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_06_01.c>`_
+     - Required
+     - Bit-fields shall only be declared with an appropriate type
+     - In addition to the C99 types, we also consider appropriate types
+       enum and all explicitly signed / unsigned integer types.
+
    * - `Rule 6.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_06_02.c>`_
      - Required
      - Single-bit named bit fields shall not be of a signed type
@@ -143,6 +162,32 @@ existing codebase are work-in-progress.
      - Octal constants shall not be used
      -
 
+   * - `Rule 7.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_02.c>`_
+     - Required
+     - A "u" or "U" suffix shall be applied to all integer constants
+       that are represented in an unsigned type
+     - The rule asks that any integer literal that is implicitly
+       unsigned is made explicitly unsigned by using one of the
+       indicated suffixes.  As an example, on a machine where the int
+       type is 32-bit wide, 0x77777777 is signed whereas 0x80000000 is
+       (implicitly) unsigned. In order to comply with the rule, the
+       latter should be rewritten as either 0x80000000u or 0x80000000U.
+       Consistency considerations may suggest using the same suffix even
+       when not required by the rule. For instance, if one has:
+
+       Original: f(0x77777777); f(0x80000000);
+
+       one might prefer
+
+       Solution 1: f(0x77777777U); f(0x80000000U);
+
+       over
+
+       Solution 2: f(0x77777777); f(0x80000000U);
+
+       after having ascertained that "Solution 1" is compatible with the
+       intended semantics.
+
    * - `Rule 7.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_03.c>`_
      - Required
      - The lowercase character l shall not be used in a literal suffix
@@ -314,6 +359,11 @@ existing codebase are work-in-progress.
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


