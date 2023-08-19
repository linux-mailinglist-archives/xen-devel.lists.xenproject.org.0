Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 258F878161A
	for <lists+xen-devel@lfdr.de>; Sat, 19 Aug 2023 02:33:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586766.918106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9tu-0004JX-S0; Sat, 19 Aug 2023 00:33:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586766.918106; Sat, 19 Aug 2023 00:33:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9tu-0004Gb-Ov; Sat, 19 Aug 2023 00:33:10 +0000
Received: by outflank-mailman (input) for mailman id 586766;
 Sat, 19 Aug 2023 00:33:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IgEN=EE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qX9tt-0004GV-NN
 for xen-devel@lists.xenproject.org; Sat, 19 Aug 2023 00:33:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f74f6ab4-3e27-11ee-877e-cb3800f73035;
 Sat, 19 Aug 2023 02:33:08 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2D27062D25;
 Sat, 19 Aug 2023 00:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F10FC433C7;
 Sat, 19 Aug 2023 00:33:04 +0000 (UTC)
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
X-Inumbo-ID: f74f6ab4-3e27-11ee-877e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692405185;
	bh=+9TMKciaReS23IR9bUxPYz6n0wY3XsTXpnj5G81lttM=;
	h=From:To:Cc:Subject:Date:From;
	b=QtQEO1G1yqIlSwHY7W5g4OG+lfOhExzLIuarEu0t+RzziQwPuoRN0yOd+uJF8/uqp
	 NaNDyrdKmdIsVPP0Sn2fQ4FSa86+OyotNkluyK7SdrCUZBhj3/Y7q0jm+MUX0xp3+Y
	 CUscC7lvGddx3jiQgIDGOjz2n+a90uUIgCglc85uiNo1/yvyfsKS6BcfmlT51FRCfS
	 WCcwkXt2XDo0I7UWiYe2pCENdU4BOurCCLsGrS904a6vCkfGOWlyS0ThquenQLpq27
	 axXfdBPScJPaDKBRH9KDBeEu5l9inUFx9YuEzZYW304TXLjaPi+/Uiv6ABjRnAyu6S
	 EmUVhxUkENTuw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	julien@xen.org,
	bertrand.marquis@arm.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH] docs/misra: document gcc-specific behavior with shifting signed integers
Date: Fri, 18 Aug 2023 17:33:03 -0700
Message-Id: <20230819003303.1744466-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- use "shift" instead of << or >>
- use All Architectures (I haven't changed all the other instances of
x86/arm in the file yet)
---
 docs/misra/C-language-toolchain.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
index 785aed1eaf..f5ca7bd2c8 100644
--- a/docs/misra/C-language-toolchain.rst
+++ b/docs/misra/C-language-toolchain.rst
@@ -200,6 +200,12 @@ The table columns are as follows:
      - ARM64, X86_64
      - See Section "6.29 Designated Initializers" of GCC_MANUAL
 
+   * - Signed shift acts on negative numbers by sign extension
+     - All architectures
+     - See Section "4.5 Integers" of GCC_MANUAL. As an extension to the
+       C language, GCC does not use the latitude given in C99 and C11
+       only to treat certain aspects of signed shift as undefined.
+
 
 Translation Limits
 __________________
-- 
2.25.1


