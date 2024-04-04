Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C65897D54
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 03:13:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700655.1094145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsBeh-0007J9-DC; Thu, 04 Apr 2024 01:12:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700655.1094145; Thu, 04 Apr 2024 01:12:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsBeh-0007GX-9I; Thu, 04 Apr 2024 01:12:39 +0000
Received: by outflank-mailman (input) for mailman id 700655;
 Thu, 04 Apr 2024 01:12:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1z08=LJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rsBef-0007GR-CL
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 01:12:37 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69333881-f220-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 03:12:33 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E583CCE2E12;
 Thu,  4 Apr 2024 01:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B676C433F1;
 Thu,  4 Apr 2024 01:12:25 +0000 (UTC)
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
X-Inumbo-ID: 69333881-f220-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712193147;
	bh=vCMDSED+I/58Pvvt51e6EiSkC/7ydwn1Qs1LrKP4W04=;
	h=Date:From:To:cc:Subject:From;
	b=onFIc5AapNS0Xvm5P9pIX9tjB3+yGfVrH4ULUSFfev9t9lKoMGYdw7krasbtQrALy
	 UWLmJqETZ7dNMy+zSbTrxtXEjTRpO7ztFNanjm++G7e9PBrRv7+HPIWnJL6k0r+K1N
	 wYlRkwOTfmPpI4BbVjOyOdlTQVcDI9D5j7M62ViAO9lLtiuMiS6Pr0bXr957JMcGLO
	 ffKL43PCDB2qLZp3mc/Zh6WR9x7GC7SE/I815Xgfeo5+o7ptuWlffGsMLXTGmOhMsO
	 QQm1sJLI0ylZ1yfaLGOOoaE27/e22GpfTBI0jaN3g4xwg/ihuw0rCLe5FM2M3sZVR9
	 yyi5leT9ZVtTg==
Date: Wed, 3 Apr 2024 18:12:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, 
    bertrand.marquis@arm.com, george.dunlap@citrix.com, jbeulich@suse.com, 
    julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com
Subject: [PATCH v3] docs/misra: document the expected sizes of integer
 types
Message-ID: <alpine.DEB.2.22.394.2404031806510.2245130@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Xen makes assumptions about the size of integer types on the various
architectures. Document these assumptions.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v3:
- add links to System V, AAPCS32 and AAPCS64

---
 docs/misra/C-language-toolchain.rst | 69 +++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
index b7c2000992..84b21992bc 100644
--- a/docs/misra/C-language-toolchain.rst
+++ b/docs/misra/C-language-toolchain.rst
@@ -480,4 +480,73 @@ The table columns are as follows:
      - See Section "4.13 Preprocessing Directives" of GCC_MANUAL and Section "11.1 Implementation-defined behavior" of CPP_MANUAL.
 
 
+Sizes of Integer types
+______________________
+
+Xen expects System V ABI on x86_64:
+  https://gitlab.com/x86-psABIs/x86-64-ABI
+
+Xen expects AAPCS32 on ARMv8-A AArch32:
+  https://github.com/ARM-software/abi-aa/blob/main/aapcs32/aapcs32.rst
+
+Xen expects AAPCS64 LP64 on ARMv8-A AArch64:
+  https://github.com/ARM-software/abi-aa/blob/main/aapcs64/aapcs64.rst
+
+A summary table of data types, sizes and alignment is below:
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


