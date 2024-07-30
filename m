Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1495C942369
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 01:31:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768119.1178868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYwIP-00040n-I2; Tue, 30 Jul 2024 23:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768119.1178868; Tue, 30 Jul 2024 23:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYwIP-0003yy-Ep; Tue, 30 Jul 2024 23:30:21 +0000
Received: by outflank-mailman (input) for mailman id 768119;
 Tue, 30 Jul 2024 23:30:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0AIz=O6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sYwIN-0003ys-Kz
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 23:30:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad7bd759-4ecb-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 01:30:17 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 58E246212D;
 Tue, 30 Jul 2024 23:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC28C32782;
 Tue, 30 Jul 2024 23:30:15 +0000 (UTC)
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
X-Inumbo-ID: ad7bd759-4ecb-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722382216;
	bh=G/NerJrxdmHr6YCYnARbwwuhXFGRVodoUT5YVoxt9zU=;
	h=Date:From:To:cc:Subject:From;
	b=dJuFl8/UZ74yJAjck0tL/AU6WgzC5aD5dAEb62p/rq/FsfoYJy3Yqk+c4Tn3k9kzI
	 46/AQK90zpma4IfzOC6ea9ifS8NbksB9zHiUryZsQgOObqokroGmxGEhREENrHQJ2v
	 4E4aMCIbf7leEJknKhU88unB3DVeBFFoCDLhOsUTEfNJ5RmrmKMERz1FTxjG0qNRmI
	 y5OrMT/BC1laX2AP/2wliBkiPteNy7aPLWYUDnwQFkTtcmX87ifyCibbTYGFatNChZ
	 Uh+GsqT8BzF8JiUVzZDjaFdivaAW02IlEayFGAznk2gFjofD8/cfKgE6yPu/aJteXp
	 wYCylZ7WprreQ==
Date: Tue, 30 Jul 2024 16:30:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>
Subject: [PATCH] docs/misra: add R13.2 and R18.2 to rules.rst
Message-ID: <alpine.DEB.2.22.394.2407301626460.4857@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Add MISRA C rules 13.2 and 18.2 to rules.rst. Both rules have zero
violations reported by Eclair but they have some cautions. We accept
both rules and for now we'll enable scanning for them in Eclair but only
violations will cause the Gitlab CI job to fail (cautions will not.)

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 7b366edb07..ef60e9a455 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -462,6 +462,15 @@ maintainers if you want to suggest a change.
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
+
    * - `Rule 13.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_13_06.c>`_
      - Required
      - The operand of the sizeof operator shall not contain any
@@ -583,6 +592,15 @@ maintainers if you want to suggest a change.
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
+
    * - `Rule 18.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_18_03.c>`_
      - Required
      - The relational operators > >= < and <= shall not be applied to objects of pointer type except where they point into the same object

