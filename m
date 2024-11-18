Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA06D9D1C14
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 00:54:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839592.1255379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDBZX-0000vZ-0r; Mon, 18 Nov 2024 23:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839592.1255379; Mon, 18 Nov 2024 23:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDBZW-0000u8-UQ; Mon, 18 Nov 2024 23:54:22 +0000
Received: by outflank-mailman (input) for mailman id 839592;
 Mon, 18 Nov 2024 23:54:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5+n=SN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tDBZV-0000u2-7F
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 23:54:21 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b61241e-a608-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 00:54:16 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7C9C8A41FDB;
 Mon, 18 Nov 2024 23:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69D94C4CECC;
 Mon, 18 Nov 2024 23:54:14 +0000 (UTC)
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
X-Inumbo-ID: 6b61241e-a608-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE0Ny43NS4xOTMuOTEiLCJoZWxvIjoibnljLnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6IjZiNjEyNDFlLWE2MDgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxOTc0MDU3LjA1OTMxNSwic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731974055;
	bh=KQ3L1eWdcdQePO4aaRNycCadqyTE11THxVsYbSj5ZS8=;
	h=Date:From:To:cc:Subject:From;
	b=s3/j4hlT9sEHRfZYWNxHCrfMEPeOF0A0Yzq0oCU9RMSDfYw5XtyIlec6juECx1bhr
	 zP1Ul7RzSMqmcU10ho7fZ96r664ElBiKqHC6Rn7c69bVm8myIgEA+RzfyUtlMNPmun
	 izizURfKfrBpiNeRkp5D3mdPeBwFUxHqJS1aYTuyCw9jYRQoriFfD/rAqzUfdBxSl0
	 LrwvBrSERki7yrZBaFN6CyvGqQhEOAqoaFNLHMP7XcUrEeSSP+1+nW0VAGxWh6av8y
	 2WjkkBth8EOzRnDOIPZCNXcMVHZfgq65UM4ctVdYHJmq7HlTPEHcsB26OUF68ygINM
	 70bBhH5wkbSOg==
Date: Mon, 18 Nov 2024 15:54:12 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, alessandro.zucchelli@bugseng.com, 
    simone.ballarin@bugseng.com, consulting@bugseng.com, jbeulich@suse.com, 
    andrew.cooper3@citrix.com, julien@xen.org, roger.pau@citrix.com, 
    bertrand.marquis@arm.com, michal.orzel@amd.com
Subject: [PATCH v2] misra: increase identifiers length to 63
Message-ID: <alpine.DEB.2.22.394.2411181552510.1160299@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Currently the identifiers characters limit is arbitrarily set to 40. It
causes a few violations as we have some identifiers longer than 40.

Increase the limit to another rather arbitrary limit of 63. Thanks to
this change, we remove a few violations, getting us one step closer to
marking Rules 5.2 and 5.4 as clean.

The ECLAIR configuration is already using 63, so this change matches
the rules.rst documentation with the ECLAIR behavior.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- use 63 instead of 64
- drop unneeded change to ECLAIR config

 docs/misra/rules.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 4a144da8d6..3ed5801bff 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -154,7 +154,7 @@ maintainers if you want to suggest a change.
    * - `Rule 5.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_01_2.c>`_
      - Required
      - External identifiers shall be distinct
-     - The Xen characters limit for identifiers is 40. Public headers
+     - The Xen characters limit for identifiers is 63. Public headers
        (xen/include/public/) are allowed to retain longer identifiers
        for backward compatibility.
 
@@ -162,7 +162,7 @@ maintainers if you want to suggest a change.
      - Required
      - Identifiers declared in the same scope and name space shall be
        distinct
-     - The Xen characters limit for identifiers is 40. Public headers
+     - The Xen characters limit for identifiers is 63. Public headers
        (xen/include/public/) are allowed to retain longer identifiers
        for backward compatibility.
 
@@ -177,7 +177,7 @@ maintainers if you want to suggest a change.
    * - `Rule 5.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_04.c>`_
      - Required
      - Macro identifiers shall be distinct
-     - The Xen characters limit for macro identifiers is 40. Public
+     - The Xen characters limit for macro identifiers is 63. Public
        headers (xen/include/public/) are allowed to retain longer
        identifiers for backward compatibility.
 
-- 
2.25.1


