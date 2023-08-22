Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F231178372D
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 03:02:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587962.919368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYFnB-0004qC-QS; Tue, 22 Aug 2023 01:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587962.919368; Tue, 22 Aug 2023 01:02:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYFnB-0004mz-NI; Tue, 22 Aug 2023 01:02:45 +0000
Received: by outflank-mailman (input) for mailman id 587962;
 Tue, 22 Aug 2023 01:02:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gk3p=EH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qYFnA-0004md-2K
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 01:02:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97d65bf5-4087-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 03:02:41 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 70A3360D2C;
 Tue, 22 Aug 2023 01:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4F5C433C8;
 Tue, 22 Aug 2023 01:02:38 +0000 (UTC)
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
X-Inumbo-ID: 97d65bf5-4087-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692666159;
	bh=oqGlp1QphlXQd9In5/s+e5b8lust1hznp7EARgpYgxo=;
	h=From:To:Cc:Subject:Date:From;
	b=i7jsHgtKgkbofj7zS1N1gdJh+tXpYN9+TSPQmR4CqQXw5jl8Yl+x8fMqIScIgFeqk
	 eqSGj8KjcGoIdXqNhHsMw/dSdB5oOhZcsfzwayxdOJU/6TriGXo6DrzA1DIbChL1R7
	 qMQwrOXUROPv1TISn/SifX0xgfkegB9Pbuc4CoasvF8FsXwKV8fxP1MvRJpvtyvZor
	 T18RSxFeAgNeKLA3AdHIw8bvK2MTykpx4ereY/PnKdi5NMuzGwUmrVFtW/u4SxSnup
	 M1MXhHeZLDfWZU9rPnFUjYUShjYNx/J+LjOpvRiOmd0GF1iAROBgyab0IUejwuH4tQ
	 E/rga4iWQqirQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	julien@xen.org,
	bertrand.marquis@arm.com,
	nicola.vetrini@bugseng.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v2] docs/misra: document gcc-specific behavior with shifting signed integers
Date: Mon, 21 Aug 2023 18:02:28 -0700
Message-Id: <20230822010228.2517542-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
v2:
- split << and >>
- do not use the word "shift" instead of << or >>
---
 docs/misra/C-language-toolchain.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
index 785aed1eaf..4c4942a113 100644
--- a/docs/misra/C-language-toolchain.rst
+++ b/docs/misra/C-language-toolchain.rst
@@ -200,6 +200,15 @@ The table columns are as follows:
      - ARM64, X86_64
      - See Section "6.29 Designated Initializers" of GCC_MANUAL
 
+   * - Signed << compiler-defined behavior
+     - All architectures
+     - See Section "4.5 Integers" of GCC_MANUAL. As an extension to the
+       C language, GCC does not use the latitude given in C99 and C11
+       only to treat certain aspects of signed << as undefined.
+
+   * - Signed >> acts on negative numbers by sign extension
+     - All architectures
+     - See Section "4.5 Integers" of GCC_MANUAL.
 
 Translation Limits
 __________________
-- 
2.25.1


