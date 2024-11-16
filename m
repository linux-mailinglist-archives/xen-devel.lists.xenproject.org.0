Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB519CFBA2
	for <lists+xen-devel@lfdr.de>; Sat, 16 Nov 2024 01:23:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.838506.1254503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tC6ar-00029C-V3; Sat, 16 Nov 2024 00:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 838506.1254503; Sat, 16 Nov 2024 00:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tC6ar-000264-Ri; Sat, 16 Nov 2024 00:23:17 +0000
Received: by outflank-mailman (input) for mailman id 838506;
 Sat, 16 Nov 2024 00:23:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWrC=SL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tC6aq-00025y-4l
 for xen-devel@lists.xenproject.org; Sat, 16 Nov 2024 00:23:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6287c0c-a3b0-11ef-a0c7-8be0dac302b0;
 Sat, 16 Nov 2024 01:23:12 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2F9B35C583B;
 Sat, 16 Nov 2024 00:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A30FAC4CECF;
 Sat, 16 Nov 2024 00:23:08 +0000 (UTC)
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
X-Inumbo-ID: f6287c0c-a3b0-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6ImY2Mjg3YzBjLWEzYjAtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNzE2NTkyLjUxODEwMiwic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731716590;
	bh=8l5ENyPPbvPs3HvVomIwy9aQjjI4LuRXkCUs3nvAmo8=;
	h=Date:From:To:cc:Subject:From;
	b=pErHPJ93aASnejwyEQbP+b+iN/957ai6aCHhU+vRZYTUq75e1HvzVSkdivlqNpO6C
	 f7RMTaWOqnTDEoCpnKzKMK6KtnL47C3tKQFfH+n1JO21//VlhgKNp9Jgim4IxX2P51
	 ogLX17A3Osmdk/2kuuNEPFdodi/cZmYQIq4rxl9vbOpTKbVWDbwIc657c8IiAOgI6q
	 lyGiOGNB88k7GbH7T7UibsXqRj2sfm+x6/RZKZG2xq0x+jaEYo6/ualxBd0SZcmvNY
	 R5R6JGwHLDFzqEYlanEmsZcIknNy0gCIdBQNzo2prcYisa8jOD9B1Kg6Dew2l0P0/Z
	 /MYZ5dnf46klA==
Date: Fri, 15 Nov 2024 16:23:07 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, alessandro.zucchelli@bugseng.com, 
    simone.ballarin@bugseng.com, consulting@bugseng.com, jbeulich@suse.com, 
    andrew.cooper3@citrix.com, julien@xen.org, roger.pau@citrix.com, 
    bertrand.marquis@arm.com, michal.orzel@amd.com
Subject: [PATCH] misra: increase identifiers length to 64
Message-ID: <alpine.DEB.2.22.394.2411151617580.1160299@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Currently the identifiers characters limit is arbitrarily set to 40. It
causes a few violations as we have some identifiers longer than 40.

Increase the limit to another rather arbitrary limit of 64. Thanks to
this change, we remove a few violations, getting us one step closer to
marking Rules 5.2 and 5.4 as clean.

Also update the ECLAIR config that was actually set to 63 as character
limit.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/automation/eclair_analysis/ECLAIR/toolchain.ecl b/automation/eclair_analysis/ECLAIR/toolchain.ecl
index 86e9a79b52..8fb1778bce 100644
--- a/automation/eclair_analysis/ECLAIR/toolchain.ecl
+++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
@@ -155,8 +155,8 @@
 -doc_end
 
 -doc_begin="See Section \"4.3 Identifiers\" of "GCC_MANUAL"."
--config=STD.extidsig, behavior+={c99, GCC_ARM64, "63"}
--config=STD.extidsig, behavior+={c99, GCC_X86_64, "63"}
+-config=STD.extidsig, behavior+={c99, GCC_ARM64, "64"}
+-config=STD.extidsig, behavior+={c99, GCC_X86_64, "64"}
 -doc_end
 
 #
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 4a144da8d6..3ed5801bff 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -154,7 +154,7 @@ maintainers if you want to suggest a change.
    * - `Rule 5.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_01_2.c>`_
      - Required
      - External identifiers shall be distinct
-     - The Xen characters limit for identifiers is 40. Public headers
+     - The Xen characters limit for identifiers is 64. Public headers
        (xen/include/public/) are allowed to retain longer identifiers
        for backward compatibility.
 
@@ -162,7 +162,7 @@ maintainers if you want to suggest a change.
      - Required
      - Identifiers declared in the same scope and name space shall be
        distinct
-     - The Xen characters limit for identifiers is 40. Public headers
+     - The Xen characters limit for identifiers is 64. Public headers
        (xen/include/public/) are allowed to retain longer identifiers
        for backward compatibility.
 
@@ -177,7 +177,7 @@ maintainers if you want to suggest a change.
    * - `Rule 5.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_04.c>`_
      - Required
      - Macro identifiers shall be distinct
-     - The Xen characters limit for macro identifiers is 40. Public
+     - The Xen characters limit for macro identifiers is 64. Public
        headers (xen/include/public/) are allowed to retain longer
        identifiers for backward compatibility.
 

