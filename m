Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E1B7B0105
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 11:53:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608803.947539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlRE7-0008Oj-C0; Wed, 27 Sep 2023 09:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608803.947539; Wed, 27 Sep 2023 09:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlRE7-0008Nd-5k; Wed, 27 Sep 2023 09:53:03 +0000
Received: by outflank-mailman (input) for mailman id 608803;
 Wed, 27 Sep 2023 09:53:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U53p=FL=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qlRE5-0008Lo-4J
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 09:53:01 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3c3d07b-5d1b-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 11:52:59 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 111C04EE073C;
 Wed, 27 Sep 2023 11:52:56 +0200 (CEST)
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
X-Inumbo-ID: a3c3d07b-5d1b-11ee-9b0d-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [XEN PATCH v2 1/3] docs/misra: add documentation skeleton for MISRA C:2012 Dir 4.1
Date: Wed, 27 Sep 2023 11:52:30 +0200
Message-Id: <5bb4dea2f48d0ef9a48a06c1b11c0dfcbd991aaf.1695801813.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695801813.git.nicola.vetrini@bugseng.com>
References: <cover.1695801813.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The aforementioned directive requires the project to supply documentation
on the measures taken towards the minimization of run-time failures.

The actual content of the documentation still needs feedback from the
community.

The 'rules.rst' file is updated accordingly to mention the newly
added documentation.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- Incorporated suggestions from Stefano.
---
 docs/misra/C-runtime-failures.rst | 200 ++++++++++++++++++++++++++++++
 docs/misra/rules.rst              |   8 +-
 2 files changed, 207 insertions(+), 1 deletion(-)
 create mode 100644 docs/misra/C-runtime-failures.rst

diff --git a/docs/misra/C-runtime-failures.rst b/docs/misra/C-runtime-failures.rst
new file mode 100644
index 000000000000..325d3fab1fa5
--- /dev/null
+++ b/docs/misra/C-runtime-failures.rst
@@ -0,0 +1,200 @@
+===================================================================
+Measures taken towards the minimization of Run-time failures in Xen
+===================================================================
+
+This document specifies which procedures and techinques are used troughout the
+Xen codebase to prevent or minimize the impact of certain classes of run-time
+errors that can occurr in the execution of a C program, due to the very minimal
+built-in checks that are present in the language.
+
+The presence of such documentation is requested by MISRA C:2012 Directive 4.1,
+whose headline states: "Run-time failures shall be minimized".
+
+
+Documentation for MISRA C:2012 Dir 4.1: overflow
+________________________________________________
+
+Pervasive use of assertions and extensive test suite.
+
+
+Documentation for MISRA C:2012 Dir 4.1: unexpected wrapping
+___________________________________________________________
+
+The only wrapping the is present in the code concerns
+unsigned integers and they are all expected.
+
+
+Documentation for MISRA C:2012 Dir 4.1: invalid shift
+_____________________________________________________
+
+Pervasive use of assertions and extensive test suite.
+
+
+Documentation for MISRA C:2012 Dir 4.1: division/remainder by zero
+__________________________________________________________________
+
+The division or remainder operations in the project code ensure that
+their second argument is never zero.
+
+
+Documentation for MISRA C:2012 Dir 4.1: unsequenced side effects
+________________________________________________________________
+
+Code executed in interrupt handlers uses spinlocks or disables interrupts
+at the right locations to avoid unsequenced side effects.
+
+
+Documentation for MISRA C:2012 Dir 4.1: read from uninitialized automatic object
+________________________________________________________________________________
+
+The amount of dynamically allocated objects is limited at runtime in
+static configurations. We make sure to initialize dynamically allocated
+objects before reading them, and we utilize static analysis tools to
+help check for that.
+
+
+Documentation for MISRA C:2012 Dir 4.1: read from uninitialized allocated object
+________________________________________________________________________________
+
+Dynamically allocated storage is used in a controlled manner, to prevent the
+access to uninitialized allocated storage.
+
+
+Documentation for MISRA C:2012 Dir 4.1: write to string literal or const object
+_______________________________________________________________________________
+
+The toolchain puts every string literal and const object into a read-only
+section of memory.  The hardware exception raised when a write is attempted
+on such a memory section is correctly handled.
+
+
+Documentation for MISRA C:2012 Dir 4.1: non-volatile access to volatile object
+______________________________________________________________________________
+
+Volatile access is limited to registers that are always accessed
+through macros or inline functions, or by limited code chunks that are only used
+to access a register.
+
+
+Documentation for MISRA C:2012 Dir 4.1: access to dead allocated object
+_______________________________________________________________________
+
+Although dynamically allocated storage is used in the project, in safety
+configurations its usage is very limited at runtime (it is "almost" only used
+at boot time). Coverity is regularly used to scan the code to detect non-freed
+allocated objects.
+
+
+Documentation for MISRA C:2012 Dir 4.1: access to dead automatic object
+_______________________________________________________________________
+
+Pointers to automatic variables are never returned, nor stored in
+wider-scoped objects.  No function does the same on any pointer
+received as a parameter.
+
+
+Documentation for MISRA C:2012 Dir 4.1: access to dead thread object
+____________________________________________________________________
+
+The program does not use per-thread variables.
+
+
+Documentation for MISRA C:2012 Dir 4.1: access using null pointer
+_________________________________________________________________
+
+All possibly null pointers are checked before access.
+
+
+Documentation for MISRA C:2012 Dir 4.1: access using invalid pointer
+____________________________________________________________________
+
+Usage of pointers is limited.  Pointers passed as parameters are
+always checked for validity.
+
+
+Documentation for MISRA C:2012 Dir 4.1: access using out-of-bounds pointer
+__________________________________________________________________________
+
+Pointers are never used to access arrays without checking for the array size
+first.
+
+
+Documentation for MISRA C:2012 Dir 4.1: access using unaligned pointer
+______________________________________________________________________
+
+Pointer conversion that may result in unaligned pointers are never used.
+
+
+Documentation for MISRA C:2012 Dir 4.1: mistyped access to object
+_________________________________________________________________
+
+Pointer conversions that may result in mistyped accesses to objects
+are never used.
+
+
+Documentation for MISRA C:2012 Dir 4.1: mistyped access to function
+___________________________________________________________________
+
+The code never uses function pointers.
+
+
+Documentation for MISRA C:2012 Dir 4.1: invalid pointer arithmetic
+__________________________________________________________________
+
+Pointer arithmetic is never used without checking object boundaries.
+
+
+Documentation for MISRA C:2012 Dir 4.1: invalid pointer comparison
+__________________________________________________________________
+
+Pointers to different objects are never compared (except for pointers that are
+actually linker symbols, but those cases are deviated with a justification).
+
+
+Documentation for MISRA C:2012 Dir 4.1: overlapping copy
+________________________________________________________
+
+The code never uses memcpy() to copy overlapping objects. The instances of
+assignments involving overlapping objects are very limited and motivated.
+
+
+Documentation for MISRA C:2012 Dir 4.1: invalid arguments to function
+_____________________________________________________________________
+
+Many parameters to functions are checked for validity; there is ongoing work to
+make this true for all parameters.
+
+
+Documentation for MISRA C:2012 Dir 4.1: returned function error
+_______________________________________________________________
+
+Many functions that may produce an error, do return a suitable status code
+that is checked at each call site. There is ongoing work to make this true for
+all such functions.
+
+
+Documentation for MISRA C:2012 Dir 4.1: tainted input
+_____________________________________________________
+
+All parameters of all functions in the extenal ABI are checked before being
+used.
+
+
+Documentation for MISRA C:2012 Dir 4.1: data race
+_________________________________________________
+
+Data that can be accessed concurrently from multiple threads and code executed
+by interrupt handlers is protected using spinlocks and other forms of locking,
+as appropriate.
+
+
+Documentation for MISRA C:2012 Dir 4.1: invariant violation
+___________________________________________________________
+
+To be written.
+
+
+Documentation for MISRA C:2012 Dir 4.1: communication error
+___________________________________________________________
+
+This project does not involve any external communication.
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 8e7d17d242a0..dd71fbe87f43 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -47,7 +47,13 @@ maintainers if you want to suggest a change.
    * - `Dir 2.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_02_01.c>`_
      - Required
      - All source files shall compile without any compilation errors
-     -
+
+   * - `Dir 4.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_01.c>`_
+     - Required
+     - Run-time failures shall be minimized
+     - The strategies adopted by Xen to prevent certain classes of runtime
+       failures is be documented by
+       `C-runtime-failures.rst <docs/misra/C-runtime-failures.rst>`_
 
    * - `Dir 4.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_07.c>`_
      - Required
-- 
2.34.1


