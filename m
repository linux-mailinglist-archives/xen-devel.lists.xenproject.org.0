Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 859F57990F9
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 22:27:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598186.932773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qei4j-0004iu-Eo; Fri, 08 Sep 2023 20:27:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598186.932773; Fri, 08 Sep 2023 20:27:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qei4j-0004h3-Bl; Fri, 08 Sep 2023 20:27:33 +0000
Received: by outflank-mailman (input) for mailman id 598186;
 Fri, 08 Sep 2023 20:27:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hmm/=EY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qei4i-0004gY-2R
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 20:27:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 216267b4-4e86-11ee-9b0d-b553b5be7939;
 Fri, 08 Sep 2023 22:27:29 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1607D61558;
 Fri,  8 Sep 2023 20:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D8CC433C7;
 Fri,  8 Sep 2023 20:27:25 +0000 (UTC)
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
X-Inumbo-ID: 216267b4-4e86-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694204847;
	bh=DTMmO7AYIwNZ6W4Gaw2rbvq67TMngWT+5KjJwP+VMiQ=;
	h=From:To:Cc:Subject:Date:From;
	b=eGrqoq9lpy6SDILAs5ZehXVbtmzA12zFn1IcveJ6MWfYeMwYQ/DpdSd9L/QYBmCQe
	 el/NUlvCvHJr2hH4cARPTwrBmd5wd75EQf2RQUTLMuQfHvfq3eblg59rn5daGCovMm
	 knJYEGjv1+cQwzel7b6JJeLpvOZqF06ZOt+0e+wyYSMV7BLd1xosQQltI8gXuI2Ci/
	 DyEbbD7vFoqCbqKIOtsduEILHFS/bVBx5npa0mQd7dyshg/vUpUewmCurp8sO/Nq5B
	 HdvkKrveijYdwZysXQFySpB7+i+W7kYKjUBX7A00oKir9SECivrMJoUMpEi5ljlbvl
	 nna29tsmiKTfg==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	julien@xen.org,
	sstabellini@kernel.org,
	george.dunlap@citrix.com,
	bertrand.marquis@arm.com,
	roberto.bagnara@bugseng.com,
	nicola.vetrini@bugseng.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v3] docs/misra: add 14.3
Date: Fri,  8 Sep 2023 13:27:23 -0700
Message-Id: <20230908202723.1641469-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Add 14.3, with project-wide deviations.

Also take the opportunity to clarify that parameters of function pointer
types are expected to have names (Rule 8.2).

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v3:
- add ,
- add switch(sizeof(...)) and switch(offsetof(...))
---
 docs/misra/rules.rst | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 34916e266a..ac76e20a9c 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -234,7 +234,8 @@ maintainers if you want to suggest a change.
    * - `Rule 8.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_02.c>`_
      - Required
      - Function types shall be in prototype form with named parameters
-     -
+     - Clarification: both function and function pointers types shall
+       have named parameters.
 
    * - `Rule 8.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_03.c>`_
      - Required
@@ -385,6 +386,18 @@ maintainers if you want to suggest a change.
      - A loop counter shall not have essentially floating type
      -
 
+   * - `Rule 14.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_03.c>`_
+     - Required
+     - Controlling expressions shall not be invariant
+     - Due to the extensive usage of IS_ENABLED, sizeof compile-time
+       checks, and other constructs that are detected as errors by MISRA
+       C scanners, managing the configuration of a MISRA C scanner for
+       this rule would be unmanageable. Thus, this rule is adopted with
+       a project-wide deviation on if, ?:, switch(sizeof(...)), and
+       switch(offsetof(...)) statements.
+
+       while(0) and while(1) and alike are allowed.
+
    * - `Rule 16.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_07.c>`_
      - Required
      - A switch-expression shall not have essentially Boolean type
-- 
2.25.1


