Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7433EB4A3
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 13:38:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166760.304385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEVVL-0007Oa-H1; Fri, 13 Aug 2021 11:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166760.304385; Fri, 13 Aug 2021 11:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEVVL-0007Lh-Df; Fri, 13 Aug 2021 11:37:39 +0000
Received: by outflank-mailman (input) for mailman id 166760;
 Fri, 13 Aug 2021 11:37:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mEVVK-0007Lb-CO
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 11:37:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mEVVK-0004ji-95
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 11:37:38 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mEVVK-000324-7x
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 11:37:38 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mEVVI-0001Cq-EB; Fri, 13 Aug 2021 12:37:36 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=E/ZfXHENP7P55HzjubU2iwB//gmRG6iBP57sfbVEeNk=; b=XR/aFWfdWFLG1Pg3mtNSaqRMri
	ms3zzh+dOu7uePrQnNZ1hP1W16Xh+5sbmlzh6HyElCy0ZF7lYTnauUNwiV7nMVFRCsVIzzwT48hp5
	zH4bbDkkn00wRhPXDTlsz9WJGMkKkte+m8vC6p6St2w6gh4oemm28BxTkA2KSG77YDRE=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Cc: iwj@xenproject.org,
	committers@xenproject.org
Subject: [PATCH] RFC: Version support policy
Date: Fri, 13 Aug 2021 12:37:27 +0100
Message-Id: <20210813113727.6028-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current policy for minimum supported versions of tools, compilers,
etc. is unsatisfactory: For many dependencies no minimum version is
specified.  For those where a version is stated, updating it is a
decision that has to be explicitly taken for that tool.

The result is persistent debates over what is good to support,
conducted in detail in the context of individual patches.

Decisions about support involve tradeoffs, often tradeoffs between the
interests of different people.  Currently we don't have anything
resembling a guideline.  The result is that the individual debates are
inconclusive; and also, this framework does not lead to good feelings
amongst participants.

I suggest instead that we adopt a date-based policy: we define a
maximum *age* of dependencies that we will support.

The existing documentation about actually known working versions
then becomes a practical consequence of that policy.

In this patch I propose a cutoff of 6 years.
Obviously there will be debate about the precise value.

It will also be necessary to make exceptions, and/or to make different
rules for different architectures.  In particular, new architectures,
new configurations, or new features, may need an absolute earliest
tooling date which is considerably less than the usual limit.

I have tried to transcribe the current compiler version info into this
format.  The dates in the exceptions are all more recent than my
suggested 6 year cutoff, so if this patch is applied to staging and
not applied retrospectively, they could be removed.

I'm not sure if this policy should be here in README (where the
version support was until now) or in SUPPORT.md.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 README | 38 +++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/README b/README
index 562b808080..5859f8bbf4 100644
--- a/README
+++ b/README
@@ -35,19 +35,8 @@ Second, there are a number of prerequisites for building a Xen source
 release. Make sure you have all the following installed, either by
 visiting the project webpage or installing a pre-built package
 provided by your OS distributor:
-    * GNU Make v3.80 or later
-    * C compiler and linker:
-      - For x86:
-        - GCC 4.1.2_20070115 or later
-        - GNU Binutils 2.16.91.0.5 or later
-        or
-        - Clang/LLVM 3.5 or later
-      - For ARM 32-bit:
-        - GCC 4.9 or later
-        - GNU Binutils 2.24 or later
-      - For ARM 64-bit:
-        - GCC 5.1 or later
-        - GNU Binutils 2.24 or later
+    * GNU Make
+    * C compiler and linker (x86: GCC or CLang; ARM: GCC)
     * Development install of zlib (e.g., zlib-dev)
     * Development install of Python 2.6 or later (e.g., python-dev)
     * Development install of curses (e.g., libncurses-dev)
@@ -65,6 +54,29 @@ provided by your OS distributor:
     * GNU bison and GNU flex
     * ACPI ASL compiler (iasl)
 
+In general, tools and compilers no more than 6 years old are
+supported (measured from the release date of the Xen version).
+However:
+    * x86: CLang/LLVM earlier than 3.5 is unsppported
+    * ARM 64-bit, dependencies older than 2015-04-22 are unsupported
+    * ARM 32-bit, dependencies older than 2014-04-22 are unsupported
+
+FYI, we believe the following versions work with this version of Xen:
+    * GNU Make
+       - v3.80 or later
+    * C compiler and linker:
+      - For x86:
+        - GCC 4.1.2_20070115 or later
+        - GNU Binutils 2.16.91.0.5 or later
+        or
+        - Clang/LLVM 3.5 or later
+      - For ARM 32-bit:
+        - GCC 4.9 or later
+        - GNU Binutils 2.24 or later
+      - For ARM 64-bit:
+        - GCC 5.1 or later
+        - GNU Binutils 2.24 or later
+
 In addition to the above there are a number of optional build
 prerequisites. Omitting these will cause the related features to be
 disabled at compile time:
-- 
2.20.1


