Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 507D88C2D9F
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2024 01:34:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720125.1123150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5ZjO-0002mG-Uh; Fri, 10 May 2024 23:32:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720125.1123150; Fri, 10 May 2024 23:32:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5ZjO-0002jQ-RV; Fri, 10 May 2024 23:32:50 +0000
Received: by outflank-mailman (input) for mailman id 720125;
 Fri, 10 May 2024 23:32:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pcT1=MN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s5ZjN-0002jK-Na
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 23:32:49 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a99d379-0f25-11ef-909d-e314d9c70b13;
 Sat, 11 May 2024 01:32:47 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3FF69CE1F15;
 Fri, 10 May 2024 23:32:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8014BC113CC;
 Fri, 10 May 2024 23:32:41 +0000 (UTC)
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
X-Inumbo-ID: 9a99d379-0f25-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715383962;
	bh=VFyqvmvkheA5VgmNYOdDhu9yAtABDX1w7nVHdXCv7do=;
	h=Date:From:To:cc:Subject:From;
	b=t0Tg5HnuM3T+kbZiaFHtDFvoWj/6KOkQldZ4+kmkGkGpbVBB+H1zBCT7a7neFJPL8
	 84uu18y860jBla1wL0V/SvxdaPc1/8xY4p19meNFzrPxYlGweEAyAWH2ltuGMKym75
	 d/+JTBvIDliPHxHxLXd22Ctcpegq3gpk9Cl3NlQkOF+F8qK80WssdBUbeQXZPQdce/
	 ECIdop3OdvyjjXRC+XI/7lsLhUGdJHr8ZX90hUxvqU3a62qUeQLAVHCOnRZFJmfmFA
	 GoTpqoSm+Xqv9gZ7GVNK0rQAz+kbe+9TWzBPlOO/m1LsWXYbej8zAp+ajczhfg0wQ5
	 y/vA6z061yhjQ==
Date: Fri, 10 May 2024 16:32:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com, 
    julien@xen.org, michal.orzel@amd.com, bertrand.marquis@arm.com, 
    roger.pau@citrix.com
Subject: [PATCH] docs/misra: replace R13.1 with R13.2
Message-ID: <alpine.DEB.2.22.394.2405101625470.2544314@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

After looking closely at the R13.1 violations and potential fixes or
deviations, upon further reflection and discussions, we realized that it
is R13.2, limited to initializers list, that we want to comply with.

Link: https://marc.info/?l=xen-devel&m=170751643325805
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index d3b70fdf04..c02dea9af8 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -449,10 +449,11 @@ maintainers if you want to suggest a change.
        parameter declared as "array of type"
      -
 
-   * - `Rule 13.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_13_01_1.c>`_
+   * - `Rule 13.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_13_02.c>`_
      - Required
-     - Initializer lists shall not contain persistent side effects
-     -
+     - The value of an expression and its persistent side-effects shall
+       be the same under all permitted evaluation orders
+     - Limit the scope of this rule to initializer lists
 
    * - `Rule 13.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_13_06.c>`_
      - Required

