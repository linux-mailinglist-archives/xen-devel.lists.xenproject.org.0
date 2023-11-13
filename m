Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA577EA728
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 00:46:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632072.986026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2gbw-0000AT-8j; Mon, 13 Nov 2023 23:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632072.986026; Mon, 13 Nov 2023 23:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2gbw-00007W-4D; Mon, 13 Nov 2023 23:44:56 +0000
Received: by outflank-mailman (input) for mailman id 632072;
 Mon, 13 Nov 2023 23:44:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lmv8=G2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r2gbu-00007Q-Vz
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 23:44:54 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a299309b-827e-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 00:44:50 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 88E0AB80EB7;
 Mon, 13 Nov 2023 23:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5359C433C7;
 Mon, 13 Nov 2023 23:44:47 +0000 (UTC)
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
X-Inumbo-ID: a299309b-827e-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699919088;
	bh=voyOJVCSVfVQEPaPCOqvBXShmeGZTsBDSJ+ki1IsNT0=;
	h=Date:From:To:cc:Subject:From;
	b=ryY8pkZXxhMVZqUakTVaxHGvRYkLDtEC5xEa18EDgF5GawUg+cgFJs+Z7mtH8AIIN
	 KXUl1bwbBgyLsUSH5rUZaeXSxb/8GUxRQdnGgIBTsy9NZp2LMI61IzSpZFUmgR/zI3
	 qRqVMBVfmNeWFFzY6CoMxePc7sWGlKk7v/UPbmcN/bT9ln7FnweXAFSOGNFHrHKXy8
	 xTtYaVW8ZnZzYuj80U1kAM7EfRJKr59Sc8v3AiLwuQ86anK09PHCN1LuC18/cEcR47
	 yLKzih3cQATYc11SMTvkgpwqC3/HhLxsI3aODPvWHMUMn+xyEKdHYCW5qpwUY90Pqq
	 j7krs14PEAhgg==
Date: Mon, 13 Nov 2023 15:44:45 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH] docs/misra: add R11.1 R11.2 R11.3 R11.6
Message-ID: <alpine.DEB.2.22.394.2311131540490.160649@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Add MISRA C Rules 11.1, 11.2, 11.3, 11.6 as discussed.

Explicitly add in the notes that conversions to integer types are
permitted if the destination type has enough bits to hold the entire
value. GCC gives enough guarantees in terms of preserving the bit
content in such situations.

Also allow for bool conversions (e.g. to check if a function point is
valid).

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index aa65eb4dd0..8c49b81085 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -383,6 +383,38 @@ maintainers if you want to suggest a change.
 
        CFLAGS="-Warith-conversion -Wno-error=arith-conversion" make -C xen
 
+   * - `Rule 11.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_01.c>`_
+     - Required
+     - Conversions shall not be performed between a pointer to a
+       function and any other type
+     - All conversions to integer types are permitted if the destination
+       type has enough bits to hold the entire value. Conversions to
+       bool and void* are permitted.
+
+   * - `Rule 11.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_02.c>`_
+     - Required
+     - Conversions shall not be performed between a pointer to an
+       incomplete type and any other type
+     - All conversions to integer types are permitted if the destination
+       type has enough bits to hold the entire value. Conversions to
+       bool and void* are permitted.
+
+   * - `Rule 11.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_03.c>`_
+     - Required
+     - A cast shall not be performed between a pointer to object type
+       and a pointer to a different object type
+     - All conversions to integer types are permitted if the destination
+       type has enough bits to hold the entire value. Conversions to
+       bool and void* are permitted.
+
+   * - `Rule 11.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_06.c>`_
+     - Required
+     - A cast shall not be performed between pointer to void and an
+       arithmetic type
+     - All conversions to integer types are permitted if the destination
+       type has enough bits to hold the entire value. Conversions to
+       bool and void* are permitted.
+
    * - `Rule 11.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_07.c>`_
      - Required
      - A cast shall not be performed between pointer to object and a noninteger arithmetic type

