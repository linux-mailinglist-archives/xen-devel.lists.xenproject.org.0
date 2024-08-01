Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C758794533B
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 21:21:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769951.1180816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZbLK-0000cf-6s; Thu, 01 Aug 2024 19:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769951.1180816; Thu, 01 Aug 2024 19:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZbLK-0000ZA-4A; Thu, 01 Aug 2024 19:20:06 +0000
Received: by outflank-mailman (input) for mailman id 769951;
 Thu, 01 Aug 2024 19:20:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SIAI=PA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sZbLI-0000LO-Mp
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 19:20:04 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c283965-503b-11ef-8776-851b0ebba9a2;
 Thu, 01 Aug 2024 21:20:02 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4043662951;
 Thu,  1 Aug 2024 19:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4228C32786;
 Thu,  1 Aug 2024 19:19:58 +0000 (UTC)
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
X-Inumbo-ID: 0c283965-503b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722539999;
	bh=QVhnscDB2j1iOQPQoj+waVit8XwxzRSwaEgt7pQ6LCs=;
	h=Date:From:To:cc:Subject:From;
	b=Lr/F4YVkdMRJSquPFMYimGoNFkFjnwQGg78+GEuXYG2m1aSGy8IVcAIIgQi13WnHV
	 WFLQXaI+uBYEZtxuJjRMNAbNb8AWBQXSzdaDRiOOjEXZzVFqvri1Ruvdi7V2ZYdT9k
	 UNE0fIw4w9aDiCrlxNNSV7zo44VeAWVo8R6NJEGdcABSh1hSzA3H3w8puKil8RLniv
	 A9xUr4pwWaH4L8xj/kr2sczUh/YfBW19O3Q6Vp1/7d7mPegR9UFTARQnXgfzobGNHu
	 9+dP/8HvzC+Jp0NiP59v9wNRgbN74G5J1jV40p9jX0pPj6+19Wg5yeXjzLXZh7bqZn
	 nPcSpeyKqmVTA==
Date: Thu, 1 Aug 2024 12:19:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>
Subject: [PATCH v3] docs/misra: add R13.2 and R18.2 to rules.rst
Message-ID: <alpine.DEB.2.22.394.2408011218250.114241@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Add MISRA C rules 13.2 and 18.2 to rules.rst. Both rules have zero
violations reported by Eclair but they have some cautions. We accept
both rules and for now we'll enable scanning for them in Eclair but only
violations will cause the Gitlab CI job to fail (cautions will not.)

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v3:
- improve notes
Changes in v2:
- clarify that new code is expected to follow the rule
---
 docs/misra/rules.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 7b366edb07..e99cb81089 100644
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
+       in regard to Rule 13.2. Caution reports might not be violations.
+       The rule should be followed in any case in new code submitted.
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
+       in regard to Rule 18.2. Caution reports might not be violations.
+       The rule should be followed in any case in new code submitted.
+
    * - `Rule 18.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_18_03.c>`_
      - Required
      - The relational operators > >= < and <= shall not be applied to objects of pointer type except where they point into the same object
-- 
2.25.1


