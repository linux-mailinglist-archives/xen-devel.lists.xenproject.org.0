Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE108AB2035
	for <lists+xen-devel@lfdr.de>; Sat, 10 May 2025 01:29:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980516.1367056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDX8a-0005Em-KE; Fri, 09 May 2025 23:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980516.1367056; Fri, 09 May 2025 23:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDX8a-0005Cq-Hc; Fri, 09 May 2025 23:28:16 +0000
Received: by outflank-mailman (input) for mailman id 980516;
 Fri, 09 May 2025 23:28:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/D4s=XZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uDX8Z-0005Ci-7e
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 23:28:15 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45c22edb-2d2d-11f0-9eb5-5ba50f476ded;
 Sat, 10 May 2025 01:28:12 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EFF00629F5;
 Fri,  9 May 2025 23:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 254A6C4CEE4;
 Fri,  9 May 2025 23:28:09 +0000 (UTC)
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
X-Inumbo-ID: 45c22edb-2d2d-11f0-9eb5-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746833290;
	bh=dgXlK7y214YIzcU4dKTD5XN3coMYXHMT5wpKw/OIWaw=;
	h=Date:From:To:cc:Subject:From;
	b=bKNzrn3fedWTt3IC62YzNoBmWNCYF+p6087SZ6cK4IG+GlMQO9i6D+E4jiBWrjMP0
	 JyvehB9U6VSNRq/e814LT6tZzHYKc8AXbpW7/UJgMC+B6f2sdaGtL0ozqnfAzOBx+f
	 j6hDNuqbgbvKasOIHnlA6uAB0owDkhcOr1pmHn1oOATGxN8cW7zGO4mJ96Az4Tvpnf
	 p6hg2tv89HVl1faP3Wo6VqP2hNt3mDmx2LOtKNs64OE0mzlfDzp21dYHWL6doPJ9Ad
	 iuBoN7HPHvknM/8pLScOeACQgpQoIERe9Fo4tEMzunLMng/4jJO/hu8LgZDJY6+3nq
	 RriFFx65IdtIQ==
Date: Fri, 9 May 2025 16:28:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Victor Lira <victorm.lira@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v2 1/2] xen/page_alloc: address violation of Rule 14.3
Message-ID: <alpine.DEB.2.22.394.2505091625390.3879245@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; CHARSET=US-ASCII
Content-ID: <alpine.DEB.2.22.394.2505091626371.3879245@ubuntu-linux-20-04-desktop>

From: Federico Serafini <federico.serafini@bugseng.com>

MISRA C Rule 14.3 states that "Controlling expressions shall not be
invariant".

Change the #define to static inline to resolve the violation.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Signed-off-by: Victor Lira <victorm.lira@amd.com>

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index bd4538c28d..9ee1506703 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2005,7 +2005,10 @@ static unsigned long __initdata buddy_alloc_size =
     MB(CONFIG_BUDDY_ALLOCATOR_SIZE);
 size_param("buddy-alloc-size", buddy_alloc_size);
 #else
-#define domain_num_llc_colors(d) 0
+static inline unsigned int domain_num_llc_colors(const struct domain *d)
+{
+    return 0;
+}
 #define domain_llc_color(d, i)   0
 #endif
 

