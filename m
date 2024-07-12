Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7A8930238
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jul 2024 00:46:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758357.1167821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSP1c-0004by-ME; Fri, 12 Jul 2024 22:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758357.1167821; Fri, 12 Jul 2024 22:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSP1c-0004aH-JQ; Fri, 12 Jul 2024 22:46:00 +0000
Received: by outflank-mailman (input) for mailman id 758357;
 Fri, 12 Jul 2024 22:45:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ilSY=OM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sSP1b-0004aA-4R
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 22:45:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80c5121e-40a0-11ef-bbfb-fd08da9f4363;
 Sat, 13 Jul 2024 00:45:58 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6262A619B0;
 Fri, 12 Jul 2024 22:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BBD8C32782;
 Fri, 12 Jul 2024 22:45:55 +0000 (UTC)
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
X-Inumbo-ID: 80c5121e-40a0-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720824356;
	bh=tNvDrLIwB9v6RbLpfTEFhpue7YBQWeeNEzOHwRcw4zQ=;
	h=Date:From:To:cc:Subject:From;
	b=r4P6fIxJu7GI4Xbm4/4qHp8v4YCPAsOhT74VNjRHrqQOV6cKcDyKYf60nTfLfcHTm
	 q/PQSDJSg69htnwcAyGTFYCwlAPG2RMeWgercdj0nLjMibRp8DlWCrvkwhSDhzX1G3
	 PDgjyJc1CzkrNT/xrchGs7Vr8xnlNKh8Pk9eEg/Zc0znwhJi/oEGQLxlNNVH1rUs6f
	 YzpuvgzenSQVSlBv9GtSzmgsjQdgys9w4+M5ukTx22FPTUIRniAJQvGTTfx7O0QcMf
	 fP81pcQTlU3Cipj4qKbXiSPPlQSc6b2vDpKtxK26dAqmbWjq6fJFPKbixtmxnbIfp7
	 fJRaPfZnRghfQ==
Date: Fri, 12 Jul 2024 15:45:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: jbeulich@suse.com, sstabellini@kernel.org, andrew.cooper3@citrix.com, 
    julien@xen.org, michal.orzel@amd.com, bertrand.marquis@arm.com, 
    roger.pau@citrix.com
Subject: [PATCH] docs/misra: add rule 12.2
Message-ID: <alpine.DEB.2.22.394.2407121543250.3635@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

As discussed during the last MISRA C meeting, add Rule 12.2 to the list
of MISRA C rules we accept, together with an explanation that we use gcc
-fsanitize=undefined alone to check for violations.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 2e11566e20..a7e2b646de 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -443,6 +443,14 @@ maintainers if you want to suggest a change.
      - The macro NULL shall be the only permitted form of null pointer constant
      -
 
+   * - `Rule 12.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_12_02.c>`_
+     - Required
+     - The right hand operand of a shift operator shall lie in the range
+       zero to one less than the width in bits of the essential type of
+       the left hand operand
+     - We rely exclusively on gcc -fsanitize=undefined to check for
+       dangerious violations to this rule and to ensure compliance
+
    * - `Rule 12.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_12_05.c>`_
      - Mandatory
      - The sizeof operator shall not have an operand which is a function

