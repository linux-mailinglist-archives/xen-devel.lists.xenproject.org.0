Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4122375BB78
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 02:24:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566811.886169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMdvf-0000Vn-Ji; Fri, 21 Jul 2023 00:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566811.886169; Fri, 21 Jul 2023 00:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMdvf-0000TB-Ga; Fri, 21 Jul 2023 00:23:31 +0000
Received: by outflank-mailman (input) for mailman id 566811;
 Fri, 21 Jul 2023 00:23:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BzSz=DH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qMdvf-0000T5-0i
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 00:23:31 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cffe5a7b-275c-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 02:23:28 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 257A061CB8;
 Fri, 21 Jul 2023 00:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59A43C433C7;
 Fri, 21 Jul 2023 00:23:25 +0000 (UTC)
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
X-Inumbo-ID: cffe5a7b-275c-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689899006;
	bh=e9pw3Wu++8sH3JJUIceGQdL1jV8FwV7ikMwnMDXbwIo=;
	h=From:To:Cc:Subject:Date:From;
	b=n9HrwVa9dgis9Bg/e/YgzidA3tpx6Za3vKsxNqBVHi5ubQJQaaOigcpICQF2gIRXf
	 cZRz+o7udTeiTwIQp/HXLlS+hUpLG/6pd3U29lbsRXjKNX9bmhm8eEJvW+sDIaLnvG
	 efgscAdphnDGa4svwJO0p4Htyw7uXMw3M4wGWKoky4BMZSgGAv8sCUjCuHy4HICjDh
	 dYFEEdPqpt7xAfgR2rJnXTpmLKTe5hU+ZM+Owbsa9XSp+1vpM2l2w6ZpO+EmDwPl8o
	 VcZiXxFSIJSVCCS8rPdIK3YSNJ7tyn3KJ3qnasjbo91CZBBJm11GHEKghFnIq5HVna
	 iPUgAz+YSqEXw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	julien@xen.org,
	sstabellini@kernel.org,
	george.dunlap@citrix.com,
	bertrand.marquis@arm.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH] docs/misra: add Rule 1.1 and 5.6
Date: Thu, 20 Jul 2023 17:23:22 -0700
Message-Id: <20230721002322.3457802-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Rule 1.1 is uncontroversial and we are already following it.

Rule 5.6 has been deemed a good rule to have by the MISRA C group.
However, we do have a significant amount of violations that will take
time to resolve and might require partial deviations in the form of
in-code comments or MISRA C scanners special configurations (ECLAIR).
For new code, we want this rule to apply hence the addition to
docs/misra/rules.rst.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 docs/misra/rules.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 29a777938a..9406ff0d8f 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -82,6 +82,13 @@ maintainers if you want to suggest a change.
      - Summary
      - Notes
 
+   * - `Rule 1.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_01_01.c>`_
+     - Required
+     - The program shall contain no violations of the standard C syntax
+       and constraints, and shall not exceed the implementation's
+       translation limits
+     -
+
    * - `Rule 1.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_01_03.c>`_
      - Required
      - There shall be no occurrence of undefined or critical unspecified
@@ -156,6 +163,11 @@ maintainers if you want to suggest a change.
        headers (xen/include/public/) are allowed to retain longer
        identifiers for backward compatibility.
 
+   * - `Rule 5.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_06.c>`_
+     - Required
+     - A typedef name shall be a unique identifier
+     -
+
    * - `Rule 6.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_06_01.c>`_
      - Required
      - Bit-fields shall only be declared with an appropriate type
-- 
2.25.1


