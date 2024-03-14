Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2013687C514
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 23:18:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693529.1081766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rktOk-0005BY-Co; Thu, 14 Mar 2024 22:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693529.1081766; Thu, 14 Mar 2024 22:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rktOk-00059V-AK; Thu, 14 Mar 2024 22:18:02 +0000
Received: by outflank-mailman (input) for mailman id 693529;
 Thu, 14 Mar 2024 22:18:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=69K2=KU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rktOj-00059B-F3
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 22:18:01 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b60f8269-e250-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 23:17:59 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 633D6CE1ED5;
 Thu, 14 Mar 2024 22:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74FBBC433F1;
 Thu, 14 Mar 2024 22:17:52 +0000 (UTC)
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
X-Inumbo-ID: b60f8269-e250-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710454673;
	bh=vl19X1L7rDzQ4BQVx8EUyivT3+r6CM4cAn3QKJUqk6Y=;
	h=Date:From:To:cc:Subject:From;
	b=OuxpOOBtBkNrKmhgverxe/H7FYiDK22uyJDhgjEsnvTXK3adRLR2WcnNHaQFVfNeb
	 FcMSaLvZCSjGN2Go0NbxtzF0EWl2IyX0QsgOuw/CBbpXaHcXheS2GoOP8kRA1bD78d
	 xQ37h0h2QNHIihzcmLtloJnd1RSqw1T2z7L+qS6AKZa88uOtyoGUQLqSM9cdAyRvKS
	 G0i8NMLr8xNE1jt2ua6m/Qawe6/c2qOKFqTP5e8qbgKYgNfw470I+rAaob+gqd/Kr7
	 +fID80B3JQpAKDMhUxX3ZW/BX0MYY9uAUTUa1rYpE4eeO4TZZAD3ZpjpaCNh/gFclr
	 5UChpzT6GEkIA==
Date: Thu, 14 Mar 2024 15:17:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, 
    bertrand.marquis@arm.com, george.dunlap@citrix.com, jbeulich@suse.com, 
    julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com
Subject: [PATCH v2] docs/misra: document the expected sizes of integer
 types
Message-ID: <alpine.DEB.2.22.394.2403141516550.853156@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Xen makes assumptions about the size of integer types on the various
architectures. Document these assumptions.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- add alignment info
---
 docs/misra/C-language-toolchain.rst | 58 +++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
index b7c2000992..24d3c1cac6 100644
--- a/docs/misra/C-language-toolchain.rst
+++ b/docs/misra/C-language-toolchain.rst
@@ -480,4 +480,62 @@ The table columns are as follows:
      - See Section "4.13 Preprocessing Directives" of GCC_MANUAL and Section "11.1 Implementation-defined behavior" of CPP_MANUAL.
 
 
+Sizes of Integer types
+______________________
+
+.. list-table::
+   :widths: 10 10 10 45
+   :header-rows: 1
+
+   * - Type
+     - Size
+     - Alignment
+     - Architectures
+
+   * - char 
+     - 8 bits
+     - 8 bits
+     - all architectures
+
+   * - short
+     - 16 bits
+     - 16 bits
+     - all architectures
+
+   * - int
+     - 32 bits
+     - 32 bits
+     - all architectures
+
+   * - long
+     - 32 bits
+     - 32 bits 
+     - 32-bit architectures (x86_32, ARMv8-A AArch32, ARMv8-R AArch32)
+
+   * - long
+     - 64 bits
+     - 64 bits 
+     - 64-bit architectures (x86_64, ARMv8-A AArch64, RV64, PPC64)
+
+   * - long long
+     - 64-bit
+     - 32-bit
+     - x86_32
+
+   * - long long
+     - 64-bit
+     - 64-bit
+     - 64-bit architectures, ARMv8-A AArch32, ARMv8-R AArch32
+
+   * - pointer
+     - 32-bit
+     - 32-bit
+     - 32-bit architectures (x86_32, ARMv8-A AArch32, ARMv8-R AArch32)
+
+   * - pointer
+     - 64-bit
+     - 64-bit
+     - 64-bit architectures (x86_64, ARMv8-A AArch64, RV64, PPC64)
+
+
 END OF DOCUMENT.
-- 
2.25.1


