Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8881E89A460
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 20:45:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701369.1095781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsoYa-0003I1-8H; Fri, 05 Apr 2024 18:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701369.1095781; Fri, 05 Apr 2024 18:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsoYa-0003GZ-5h; Fri, 05 Apr 2024 18:44:56 +0000
Received: by outflank-mailman (input) for mailman id 701369;
 Fri, 05 Apr 2024 18:44:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GKl/=LK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rsoYZ-0003GT-FZ
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 18:44:55 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96a7e152-f37c-11ee-afe6-a90da7624cb6;
 Fri, 05 Apr 2024 20:44:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9E644CE2578;
 Fri,  5 Apr 2024 18:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9428CC433C7;
 Fri,  5 Apr 2024 18:44:47 +0000 (UTC)
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
X-Inumbo-ID: 96a7e152-f37c-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712342688;
	bh=UHAOITdinMVWq70npyFzk0FScg54RY1dB3DNx+drG5s=;
	h=Date:From:To:cc:Subject:From;
	b=GfrCsifWsaqf0ezpSvbqwWmmkyISOvUc2e2cTov9mQM4PNtaSBHWLeti2Eb7pm/6P
	 6g2p7FtULHXmslDH/haRTrrtX+HCw/1uDogAKdKiUwNFx0c80HGzFJKXtxagsFHpnQ
	 M16Mj2nWzcMgtuho8NUNQzNMvBxG+H0Q6xXIYSJ/bCT5IHO1Wdes+tb7Bjmidu6cij
	 YScpP7Rf36A7wEihuOi3mfZ75zz7B4+s0uzAr9giDGXoWknPJMzGfFSxgAMOWX9HBn
	 0yg4RShRUJJlz7FH2dKU+kYJ/wPzaJv7CcSsmiejZUu4aC/Qyi2x/LezvKdDC4Df20
	 9dVTZATJXqXUQ==
Date: Fri, 5 Apr 2024 11:44:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, 
    bertrand.marquis@arm.com, george.dunlap@citrix.com, jbeulich@suse.com, 
    julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com
Subject: [PATCH v4] docs/misra: document the expected sizes of integer
 types
Message-ID: <alpine.DEB.2.22.394.2404051144020.2245130@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Xen makes assumptions about the size of integer types on the various
architectures. Document these assumptions.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v4:
- list the architectures explicitly
- add ARMv7-A
---
 docs/misra/C-language-toolchain.rst | 73 +++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
index b7c2000992..5ddfe7bdbe 100644
--- a/docs/misra/C-language-toolchain.rst
+++ b/docs/misra/C-language-toolchain.rst
@@ -480,4 +480,77 @@ The table columns are as follows:
      - See Section "4.13 Preprocessing Directives" of GCC_MANUAL and Section "11.1 Implementation-defined behavior" of CPP_MANUAL.
 
 
+Sizes of Integer types
+______________________
+
+Xen expects System V ABI on x86_64:
+  https://gitlab.com/x86-psABIs/x86-64-ABI
+
+Xen expects AAPCS32 on ARMv8-A AArch32 and ARMv7-A:
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
+     - x86_32, ARMv8-A AArch32, ARMv8-R AArch32, ARMv7-A, x86_64,
+       ARMv8-A AArch64, RV64, PPC64
+
+   * - short
+     - 16 bits
+     - 16 bits
+     - x86_32, ARMv8-A AArch32, ARMv8-R AArch32, ARMv7-A, x86_64,
+       ARMv8-A AArch64, RV64, PPC64
+
+   * - int
+     - 32 bits
+     - 32 bits
+     - x86_32, ARMv8-A AArch32, ARMv8-R AArch32, ARMv7-A, x86_64,
+       ARMv8-A AArch64, RV64, PPC64
+
+   * - long
+     - 32 bits
+     - 32 bits 
+     - x86_32, ARMv8-A AArch32, ARMv8-R AArch32, ARMv7-A
+
+   * - long
+     - 64 bits
+     - 64 bits 
+     - x86_64, ARMv8-A AArch64, RV64, PPC64
+
+   * - long long
+     - 64-bit
+     - 32-bit
+     - x86_32
+
+   * - long long
+     - 64-bit
+     - 64-bit
+     - x86_64, ARMv8-A AArch64, RV64, PPC64, ARMv8-A AArch32, ARMv8-R
+       AArch32, ARMv7-A
+
+   * - pointer
+     - 32-bit
+     - 32-bit
+     - x86_32, ARMv8-A AArch32, ARMv8-R AArch32, ARMv7-A
+
+   * - pointer
+     - 64-bit
+     - 64-bit
+     - x86_64, ARMv8-A AArch64, RV64, PPC64
+
+
 END OF DOCUMENT.
-- 
2.25.1


