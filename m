Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE46B7890B2
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 23:49:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590999.923387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZefm-0002S9-Tb; Fri, 25 Aug 2023 21:48:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590999.923387; Fri, 25 Aug 2023 21:48:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZefm-0002P8-Qc; Fri, 25 Aug 2023 21:48:54 +0000
Received: by outflank-mailman (input) for mailman id 590999;
 Fri, 25 Aug 2023 21:48:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bmKO=EK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qZefk-0002OB-Us
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 21:48:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bba93ef-4391-11ee-9b0c-b553b5be7939;
 Fri, 25 Aug 2023 23:48:48 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 78868631DB;
 Fri, 25 Aug 2023 21:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F709C433C8;
 Fri, 25 Aug 2023 21:48:45 +0000 (UTC)
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
X-Inumbo-ID: 2bba93ef-4391-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693000126;
	bh=yQDxjk542wIydwKqstyY8m1srjngnP+Iju4uYgiIt0I=;
	h=From:To:Cc:Subject:Date:From;
	b=gLL0Gc/NsSvUbMEEopgZm7xfgGAIUhCudrTi31YgLNy7agZfxHzJoOOesA60TCKw9
	 OgbNBmXH9l3zTufaz9zVcLMzF1+/muivWSD75dzZNQ8X3k9c2uuURChYNODB10o++q
	 bze4IAJOxSNfvAmVk1XWgycPwfBjupdbdDU65VDZa5S25qL7JyA+wz+JTr8WyUGyRx
	 Lfwp7/3mP6MuWIFsUQIITKsVN7FAu8LpckitX525givjUK9QWiuU1it0G+zhU6K17N
	 twSpA+1xH8b6Xng9JJuGb86cyIjzSaplDTe4yLxikMC3JXuRHSzv0WkoBsCd99jPGm
	 /oXBmV1ah3NlQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	julien@xen.org,
	sstabellini@kernel.org,
	george.dunlap@citrix.com,
	bertrand.marquis@arm.com,
	nicola.vetrini@bugseng.com,
	roberto.bagnara@bugseng.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v2] docs/misra: add rules 10.1 10.2 10.3 10.4
Date: Fri, 25 Aug 2023 14:48:42 -0700
Message-Id: <20230825214842.3467599-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

10.1 with several caveats, described in the notes.
10.3 and 10.4 as "aspirational" guidelines, as clarified in the notes.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
v2:
- typo fix
- Implicit conversions to boolean for conditionals and logical operators
- make -C xen
---
 docs/misra/rules.rst | 53 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index db30632b93..34916e266a 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -310,6 +310,59 @@ maintainers if you want to suggest a change.
      - An element of an object shall not be initialized more than once
      -
 
+   * - `Rule 10.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_10_01.c>`_
+     - Required
+     - Operands shall not be of an inappropriate essential type
+     - The following are allowed:
+         - Value-preserving conversions of integer constants
+         - Bitwise and, or, xor, one's complement, bitwise and assignment,
+           bitwise or assignment, bitwise xor assignment (bitwise and, or, xor
+           are safe on non-negative integers; also Xen assumes two's complement
+           representation)
+         - Left shift, right shift, left shift assignment, right shift
+           assignment (see C-language-toolchain.rst for uses of
+           compilers' extensions)
+         - Implicit conversions to boolean for conditionals (?: if while
+           for) and logical operators (! || &&)
+
+   * - `Rule 10.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_10_02.c>`_
+     - Required
+     - Expressions of essentially character type shall not be used
+       inappropriately in addition and subtraction operations
+     -
+
+   * - `Rule 10.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_10_03.c>`_
+     - Required
+     - The value of an expression shall not be assigned to an object
+       with a narrower essential type or of a different essential type
+       category
+     - Please beware that this rule has many violations in the Xen
+       codebase today, and its adoption is aspirational. However, when
+       submitting new patches please try to decrease the number of
+       violations when possible.
+
+       gcc has a helpful warning that can help you spot and remove
+       violations of this kind: conversion. For instance, you can use
+       it as follows:
+
+       CFLAGS="-Wconversion -Wno-error=sign-conversion -Wno-error=conversion" make -C xen
+
+   * - `Rule 10.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_10_04.c>`_
+     - Required
+     - Both operands of an operator in which the usual arithmetic
+       conversions are performed shall have the same essential type
+       category
+     - Please beware that this rule has many violations in the Xen
+       codebase today, and its adoption is aspirational. However, when
+       submitting new patches please try to decrease the number of
+       violations when possible.
+
+       gcc has a helpful warning that can help you spot and remove
+       violations of this kind: arith-conversion. For instance, you
+       can use it as follows:
+
+       CFLAGS="-Warith-conversion -Wno-error=arith-conversion" make -C xen
+
    * - `Rule 12.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_12_05.c>`_
      - Mandatory
      - The sizeof operator shall not have an operand which is a function
-- 
2.25.1


