Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8BF943994
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 01:54:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769197.1180092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZJ8f-0001sK-IV; Wed, 31 Jul 2024 23:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769197.1180092; Wed, 31 Jul 2024 23:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZJ8f-0001qq-Fa; Wed, 31 Jul 2024 23:53:49 +0000
Received: by outflank-mailman (input) for mailman id 769197;
 Wed, 31 Jul 2024 23:53:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gQnf=O7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sZJ8e-0001qk-58
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 23:53:48 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1eaf1627-4f98-11ef-8776-851b0ebba9a2;
 Thu, 01 Aug 2024 01:53:45 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9F346CE181A;
 Wed, 31 Jul 2024 23:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BCF4C32786;
 Wed, 31 Jul 2024 23:53:39 +0000 (UTC)
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
X-Inumbo-ID: 1eaf1627-4f98-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722470021;
	bh=W5Xjc3f81/8zpLfadiBQWMMWFR0WYUWYDLWwkWYb7Vk=;
	h=Date:From:To:cc:Subject:From;
	b=D50QSJ9hyF4I7RHJAYIZnhkfDxuBOgQhk3zSyDSp8m+Dojby002qKLOhscOVUJ5TT
	 YDw1grkxioSh7Pi51pmQeheR6tizXhXnfvnjKGWuZVqzdC+Uqd8vrXOScmrI+OGfif
	 7dsFVG8rJ06st447LKcpnp5+cxPIso82d/99okUxWxsBmjmD+yuVfKEKKfp+sy7xSa
	 Wrgzi++fNncOA6gE7TrZhCAlENmHhkNVA2ETG17UGKeIHxfJKzIZmHUn/KlmzeHbHZ
	 rx9PIEpR1FktjX4L9TQ1UQC5Xr3/Bt5KhStoHiDU/SN0Y7Zo0o/XlcUU8lkrlBxcSt
	 E3MZutYF1RwWw==
Date: Wed, 31 Jul 2024 16:53:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>
Subject: [PATCH v2] docs/misra: add R13.2 and R18.2 to rules.rst
Message-ID: <alpine.DEB.2.22.394.2407311652320.4857@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Add MISRA C rules 13.2 and 18.2 to rules.rst. Both rules have zero
violations reported by Eclair but they have some cautions. We accept
both rules and for now we'll enable scanning for them in Eclair but only
violations will cause the Gitlab CI job to fail (cautions will not.)

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- clarify that new code is expected to follow the rule
---
 docs/misra/rules.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 7b366edb07..3c2c5e5ac1 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -462,6 +462,16 @@ maintainers if you want to suggest a change.
      - Initializer lists shall not contain persistent side effects
      -
 
+   * - `Rule 13.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_13_02.c>`_
+     - Required
+     - The value of an expression and its persistent side-effects shall
+       be the same under all permitted evaluation orders
+     - Be aware that the static analysis tool Eclair might report
+       several findings for Rule 13.2 of type "caution". These are
+       instances where Eclair is unable to verify that the code is valid
+       in regard to Rule 13.2. Caution reports are not violations.
+       Regardless, new code is expected to follow this rule.
+
    * - `Rule 13.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_13_06.c>`_
      - Required
      - The operand of the sizeof operator shall not contain any
@@ -583,6 +593,16 @@ maintainers if you want to suggest a change.
        submitting new patches please try to decrease the number of
        violations when possible.
 
+   * - `Rule 18.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_18_02.c>`_
+     - Required
+     - Subtraction between pointers shall only be applied to pointers
+       that address elements of the same array
+     - Be aware that the static analysis tool Eclair might report
+       several findings for Rule 18.2 of type "caution". These are
+       instances where Eclair is unable to verify that the code is valid
+       in regard to Rule 18.2. Caution reports are not violations.
+       Regardless, new code is expected to follow this rule.
+
    * - `Rule 18.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_18_03.c>`_
      - Required
      - The relational operators > >= < and <= shall not be applied to objects of pointer type except where they point into the same object
-- 
2.25.1


