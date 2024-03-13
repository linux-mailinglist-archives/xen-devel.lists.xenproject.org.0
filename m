Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F7187B527
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 00:23:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692819.1080321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkXwM-0003D9-Ex; Wed, 13 Mar 2024 23:23:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692819.1080321; Wed, 13 Mar 2024 23:23:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkXwM-0003BP-BO; Wed, 13 Mar 2024 23:23:18 +0000
Received: by outflank-mailman (input) for mailman id 692819;
 Wed, 13 Mar 2024 23:23:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EqwV=KT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rkXwL-0003BJ-3M
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 23:23:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa9e1f16-e190-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 00:23:15 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3719461445;
 Wed, 13 Mar 2024 23:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDDFCC433C7;
 Wed, 13 Mar 2024 23:23:12 +0000 (UTC)
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
X-Inumbo-ID: aa9e1f16-e190-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710372193;
	bh=4En7hBriDeUR/3n8aZrHavGdsjdCkKqRaKx13kljPKs=;
	h=Date:From:To:cc:Subject:From;
	b=kZAwOhcIr6/+5pXi0SnGbOk4XHQXZxHTf/ZEjz+ZXjvcfdsjpAsha44OPsZwFFL2F
	 Tnl4dOL3L+kz5c5Fbi+zKyFvHYyssvliWgev9CKhnXjqdTC4yaSqfMPIGlqN0y/OSg
	 5IMNVD6oyuV9zUEAJ626tThaBNToPW++gd5Sy0xl7dGqHF3/i5d09Es6DyRXILfVbr
	 RaOjWx9YJjnluoJvmh8xVCo/+DXJ7yuY/q1hTergPz/vQutfpDlH3abOLQT+YpSLXP
	 DkTzOnswimWCi5QNcipYMf9VdKw4biW5ItzQuqxuLSGwDgS1Z1V9h8WRH7pa276hOt
	 dT6leCSziXgKw==
Date: Wed, 13 Mar 2024 16:23:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: andrew.cooper3@citrix.com, bertrand.marquis@arm.com, 
    george.dunlap@citrix.com, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com
Subject: [PATCH] docs/misra: document the expected sizes of integer types
Message-ID: <alpine.DEB.2.22.394.2403131622020.853156@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Xen makes assumptions about the size of integer types on the various
architectures. Document these assumptions.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 docs/misra/C-language-toolchain.rst | 44 +++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
index b7c2000992..0d3bb2fe6e 100644
--- a/docs/misra/C-language-toolchain.rst
+++ b/docs/misra/C-language-toolchain.rst
@@ -480,4 +480,48 @@ The table columns are as follows:
      - See Section "4.13 Preprocessing Directives" of GCC_MANUAL and Section "11.1 Implementation-defined behavior" of CPP_MANUAL.
 
 
+Sizes of Integer types
+______________________
+
+.. list-table::
+   :widths: 10 10 45
+   :header-rows: 1
+
+   * - Type
+     - Size
+     - Architectures
+
+   * - char 
+     - 8 bits
+     - all architectures
+
+   * - short
+     - 16 bits
+     - all architectures
+
+   * - int
+     - 32 bits
+     - all architectures
+
+   * - long
+     - 32 bits 
+     - 32-bit architectures (x86_32, ARMv8-A AArch32, ARMv8-R AArch32)
+
+   * - long
+     - 64 bits 
+     - 64-bit architectures (x86_64, ARMv8-A AArch64, RV64, PPC64)
+
+   * - long long
+     - 64-bit
+     - all architectures
+
+   * - pointer
+     - 32-bit
+     - 32-bit architectures (x86_32, ARMv8-A AArch32, ARMv8-R AArch32)
+
+   * - pointer
+     - 64-bit
+     - 64-bit architectures (x86_64, ARMv8-A AArch64, RV64, PPC64)
+
+
 END OF DOCUMENT.
-- 
2.25.1


