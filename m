Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6A77BBF3C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 20:55:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613804.954593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qopxv-00012p-8V; Fri, 06 Oct 2023 18:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613804.954593; Fri, 06 Oct 2023 18:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qopxv-00010p-4Z; Fri, 06 Oct 2023 18:54:23 +0000
Received: by outflank-mailman (input) for mailman id 613804;
 Fri, 06 Oct 2023 18:54:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LN/y=FU=citrix.com=prvs=63610b956=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qopxu-0000VZ-9Q
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 18:54:22 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0a731e7-6479-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 20:54:20 +0200 (CEST)
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
X-Inumbo-ID: c0a731e7-6479-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696618459;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rMavS1NfaJw4CYhTkB8gR9Bg90slPE68f/jMV8qjH/E=;
  b=fP5t09zOqGeXvNjZD2sN+SrMkly/qN5lSFC00rFne7+HAxqkvPaM3qjh
   Mk/UXITM6GCkgqbyCNRUxeORo5t4/ST0e2fBYmKOaLqGOUtkpUh64wsG3
   MveEhLLAkbNs0Gme8H/Feb3z5GW/DpqCPQGKdiP0ejE4WCorg12qi74JB
   M=;
X-CSE-ConnectionGUID: zbM/wUseSAGyzS4rw3cmBQ==
X-CSE-MsgGUID: S2+NhLujSDi0i7KMN1/qLg==
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 123474049
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:EuqDNq1UxZnDtU0oDvbD5QRxkn2cJEfYwER7XKvMYLTBsI5bp2MBy
 TNJX2CDP/yDYmr9fYpzao+08UxQsZbdxoBlSQo9pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliOfQAOK6UbaYUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb83uDgNyo4GlD5wRmO6gS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfE2trs
 uMlMz02Rz+Sldnq2q3gQexGv5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGc+KkuYC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTH54JwRrA+
 jOuE2LROUtZEty71Di+3nP0h7DsuAWiH5s2G+jtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslhsdUNpZF6s98hOAzoLd5grfDW8BJhZjQtE7sM49RRQxy
 0SE2djuAFRHq6aJQHiQ8rOVqzKaOiUPK2IGIygeQmMt/N3LsIw1yBXVQb5LErOxj9DzMSH9x
 XaNtidWr5Uei9QakZqy+1/viiip4JPOS2YICh7/Bzz/qFkjPcj8Ot3utgCzAet8wJixXFOk+
 2c5gMWlxc8fH6rRjjPWS+AnJeT8jxqaCwEwkWKDDrF4qWXzpi/zI9sJiN1tDB03aJtYJ1cFd
 GeW6VsIu8EJVJe/RfIvC79dHfjG2kQJ+T7NbvfRdtNIZdBbeQaM/EmCjmbLhDizziDAfUwlU
 Kp3kPpA7l5AU8yLNBLsG48gPUYDn0jSP1/7S5Hh1AiA2rGDfnOTQrptGALQP75kt/vV+V2Lr
 4c32y62J/J3CbKWX8Uq2dRLcQBiwYYTWvgaVPC7hsbce1E7SQnN+tfawK87epwNokimvr6gw
 51JYWcBkACXrSSedW23hoVLNOuHsWBX8ShqYkTB/D+AhxAeXGpYxP1PKcNnIOh2q7QLIDwdZ
 6BtRvhsy89nElzvkwnxp7GkxGC+XHxHXT6zAhc=
IronPort-HdrOrdr: A9a23:OvIHZKlLSynGIm2BwlZrRX4MkmzpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-Talos-CUID: 9a23:M2BQCmDN0wiCWXv6Eztt0QkLJ9soSVTy3WXrf1WnUm1sYoTAHA==
X-Talos-MUID: 9a23:DUhXTwkxHl9I5J0n9kcPdnpZboRO44CzCnshkM0H5OqhE3U3IhOS2WE=
X-IronPort-AV: E=Sophos;i="6.03,204,1694750400"; 
   d="scan'208";a="123474049"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
	"Jan Beulich" <JBeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "Wei Liu" <wl@xen.org>, Julien Grall
	<julien@xen.org>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH for-4.18 v2 2/2] x86: Clarify that only 5 hypercall parameters are supported
Date: Fri, 6 Oct 2023 19:54:02 +0100
Message-ID: <20231006185402.1098400-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231006185402.1098400-1-andrew.cooper3@citrix.com>
References: <20231006185402.1098400-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Michal Orzel <michal.orzel@amd.com>

The x86 hypercall ABI really used to have 6-argument hypercalls.  V4V, the
downstream predecessor to Argo did take 6th args.

However, the 6th arg being %ebp in the 32bit ABI makes it unusable in
practice, because that's the frame pointer in builds with frame pointers
enabled.  Therefore Argo was altered to being a 5-arg hypercall when it was
upstreamed.

c/s 2f531c122e95 ("x86: limit number of hypercall parameters to 5") removed
the ability for hypercalls to take 6 arguments.

Update the documentation to match reality.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Henry Wang <Henry.Wang@arm.com>

v2:
 * Extend with the historical context of how 6-arg hypercalls have come and gone.
---
 docs/guest-guide/x86/hypercall-abi.rst   | 15 +++++++++++----
 xen/include/public/arch-x86/xen-x86_32.h |  2 +-
 xen/include/public/arch-x86/xen-x86_64.h |  2 +-
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/docs/guest-guide/x86/hypercall-abi.rst b/docs/guest-guide/x86/hypercall-abi.rst
index 42a820386b68..c7a11a76712f 100644
--- a/docs/guest-guide/x86/hypercall-abi.rst
+++ b/docs/guest-guide/x86/hypercall-abi.rst
@@ -4,7 +4,7 @@ Hypercall ABI
 =============
 
 Hypercalls are system calls to Xen.  Two modes of guest operation are
-supported, and up to 6 individual parameters are supported.
+supported, and up to 5 individual parameters are supported.
 
 Hypercalls may only be issued by kernel-level software [#kern]_.
 
@@ -18,17 +18,17 @@ The registers used for hypercalls depends on the operating mode of the guest.
 
    * - ABI
      - Hypercall Index
-     - Parameters (1 - 6)
+     - Parameters (1 - 5) [#params]_
      - Result
 
    * - 64bit
      - RAX
-     - RDI RSI RDX R10 R8 R9
+     - RDI RSI RDX R10 R8
      - RAX
 
    * - 32bit
      - EAX
-     - EBX ECX EDX ESI EDI EBP
+     - EBX ECX EDX ESI EDI
      - EAX
 
 32 and 64bit PV guests have an ABI fixed by their guest type.  The ABI for an
@@ -119,6 +119,13 @@ means.
 .. [#kern] For HVM guests, ``HVMOP_guest_request_vm_event`` may be configured
    to be usable from userspace, but this behaviour is not default.
 
+.. [#params] Xen's ABI used to declare support for 6 hypercall arguments,
+   using ``r9`` and ``ebp``.  However, such an ABI clobbers the frame pointer
+   in the 32bit code and does interact nicely with guest-side debugging.  The
+   predecessor to ``HYPERCALL_argo_op`` was a 6-argument hypercall, but the
+   ABI was intentionally altered when Argo was upstreamed (Xen 4.13) to be the
+   5-argument hypercall it now is.
+
 .. [#mode] While it is possible to use compatibility mode segments in a 64bit
    kernel, hypercalls issues from such a mode will be interpreted with the
    32bit ABI.  Such a setup is not expected in production scenarios.
diff --git a/xen/include/public/arch-x86/xen-x86_32.h b/xen/include/public/arch-x86/xen-x86_32.h
index 139438e83534..9e3bf06b121e 100644
--- a/xen/include/public/arch-x86/xen-x86_32.h
+++ b/xen/include/public/arch-x86/xen-x86_32.h
@@ -12,7 +12,7 @@
 
 /*
  * Hypercall interface:
- *  Input:  %ebx, %ecx, %edx, %esi, %edi, %ebp (arguments 1-6)
+ *  Input:  %ebx, %ecx, %edx, %esi, %edi (arguments 1-5)
  *  Output: %eax
  * Access is via hypercall page (set up by guest loader or via a Xen MSR):
  *  call hypercall_page + hypercall-number * 32
diff --git a/xen/include/public/arch-x86/xen-x86_64.h b/xen/include/public/arch-x86/xen-x86_64.h
index 5d9035ed2230..43f6e3d22001 100644
--- a/xen/include/public/arch-x86/xen-x86_64.h
+++ b/xen/include/public/arch-x86/xen-x86_64.h
@@ -12,7 +12,7 @@
 
 /*
  * Hypercall interface:
- *  Input:  %rdi, %rsi, %rdx, %r10, %r8, %r9 (arguments 1-6)
+ *  Input:  %rdi, %rsi, %rdx, %r10, %r8 (arguments 1-5)
  *  Output: %rax
  * Access is via hypercall page (set up by guest loader or via a Xen MSR):
  *  call hypercall_page + hypercall-number * 32
-- 
2.30.2


