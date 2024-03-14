Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A61587C4DF
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 22:50:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693500.1081636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rksy5-0003zu-Lt; Thu, 14 Mar 2024 21:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693500.1081636; Thu, 14 Mar 2024 21:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rksy5-0003x7-JB; Thu, 14 Mar 2024 21:50:29 +0000
Received: by outflank-mailman (input) for mailman id 693500;
 Thu, 14 Mar 2024 21:50:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=69K2=KU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rksy4-0003x1-Pp
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 21:50:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd87e35d-e24c-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 22:50:26 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 55DA0614FE;
 Thu, 14 Mar 2024 21:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7750AC433F1;
 Thu, 14 Mar 2024 21:50:23 +0000 (UTC)
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
X-Inumbo-ID: dd87e35d-e24c-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710453024;
	bh=MgpMG91kr6ccIQgc4f7pyYqg/BDji6TRP7AqFlrewPI=;
	h=Date:From:To:cc:Subject:From;
	b=k/3bivuhbe+q35WO3YG+17un2vlI/2t4nXzluCmmyR2eLIELEsSkh3AX++ar5qheq
	 y1xz5BlbMTfWf7fylPQFkJJoe6CkBR9Nu2ufBtDxumClghMao9/yvopB9AXBt/QmC2
	 KpN+bfeijWlo50Da4GsmZ2Ktho1F7u1zbMmcZrY4RkJJBigc5+WaNOKNGda6h04WfQ
	 J6lY93RZyONZ7V1bx9bDBGZsAjblhCQSgEfoZ7ZBppSy/WYAwmmVWuEJpqLMoRCxVm
	 f6BaSVDjlMyXlFWdQeM7rqJffLkorDW9heHbKLIb0zsB43j5vFpF05VLaDk+Mhy14/
	 IZoo73r+fVSRw==
Date: Thu, 14 Mar 2024 14:50:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, 
    bertrand.marquis@arm.com, george.dunlap@citrix.com, jbeulich@suse.com, 
    julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com
Subject: [PATCH v2] docs/misra: add Rule 16.4
Message-ID: <alpine.DEB.2.22.394.2403141449510.853156@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- mention -Werror
- change the position of the in-code comment in the example
- use "notifier pattern" in the example
- clarify it is only an example
---
 docs/misra/rules.rst | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 1e134ccebc..5c84091e45 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -478,6 +478,31 @@ maintainers if you want to suggest a change.
      - In addition to break, also other unconditional flow control statements
        such as continue, return, goto are allowed.
 
+   * - `Rule 16.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_04.c>`_
+     - Required
+     - Every switch statement shall have a default label
+     - Switch statements with enums as controlling expression don't need
+       a default label as gcc -Wall enables -Wswitch which warns (and
+       breaks the build as we use -Werror) if one of the enum labels is
+       missing from the switch.
+
+       Switch statements with integer types as controlling expression
+       should have a default label:
+
+       - if the switch is expected to handle all possible cases
+         explicitly, then a default label shall be added to handle
+         unexpected error conditions, using BUG(), ASSERT(), WARN(),
+         domain_crash(), or other appropriate methods;
+
+       - if the switch is expected to handle a subset of all possible
+         cases, then an empty default label shall be added with an
+         in-code comment on top of the default label with a reason and
+         when possible a more detailed explanation. Example::
+
+             default:
+                 /* Notifier pattern */
+                 break;
+
    * - `Rule 16.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_02.c>`_
      - Required
      - A switch label shall only be used when the most closely-enclosing
-- 
2.25.1


