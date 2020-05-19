Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 798351D90E1
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 09:21:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jawZ0-0004nf-OB; Tue, 19 May 2020 07:21:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aMO8=7B=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jawYz-0004nX-EI
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 07:21:21 +0000
X-Inumbo-ID: 506b6198-99a1-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 506b6198-99a1-11ea-b07b-bc764e2007e4;
 Tue, 19 May 2020 07:21:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5447CB210;
 Tue, 19 May 2020 07:21:12 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v10 03/12] docs: add feature document for Xen hypervisor
 sysfs-like support
Date: Tue, 19 May 2020 09:20:57 +0200
Message-Id: <20200519072106.26894-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200519072106.26894-1-jgross@suse.com>
References: <20200519072106.26894-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On the 2019 Xen developer summit there was agreement that the Xen
hypervisor should gain support for a hierarchical name-value store
similar to the Linux kernel's sysfs.

In the beginning there should only be basic support: entries can be
added from the hypervisor itself only, there is a simple hypercall
interface to read the data.

Add a feature document for setting the base of a discussion regarding
the desired functionality and the entries to add.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
V1:
- remove the "--" prefixes of the sub-commands of the user tool
  (Jan Beulich)
- rename xenfs to xenhypfs (Jan Beulich)
- add "tree" and "write" options to user tool

V2:
- move example tree to the paths description (Ian Jackson)
- specify allowed characters for keys and values (Ian Jackson)

V3:
- correct introduction (writable entries)

V4:
- add list specification
- add entry example (Julien Grall)
- correct date and Xen version (Julien Grall)
- add ARM64 as possible architecture (Julien Grall)
- add version description to the feature doc (Jan Beulich)

V8:
- clarify syntax used in hypfs-paths.pandoc (George Dunlap)

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/features/hypervisorfs.pandoc |  92 +++++++++++++++++++++++++
 docs/misc/hypfs-paths.pandoc      | 107 ++++++++++++++++++++++++++++++
 2 files changed, 199 insertions(+)
 create mode 100644 docs/features/hypervisorfs.pandoc
 create mode 100644 docs/misc/hypfs-paths.pandoc

diff --git a/docs/features/hypervisorfs.pandoc b/docs/features/hypervisorfs.pandoc
new file mode 100644
index 0000000000..a0a0ead057
--- /dev/null
+++ b/docs/features/hypervisorfs.pandoc
@@ -0,0 +1,92 @@
+% Hypervisor FS
+% Revision 1
+
+\clearpage
+
+# Basics
+---------------- ---------------------
+         Status: **Supported**
+
+  Architectures: all
+
+     Components: Hypervisor, toolstack
+---------------- ---------------------
+
+# Overview
+
+The Hypervisor FS is a hierarchical name-value store for reporting
+information to guests, especially dom0. It is similar to the Linux
+kernel's sysfs. Entries and directories are created by the hypervisor,
+while the toolstack is able to use a hypercall to query the entry
+values or (if allowed by the hypervisor) to modify them.
+
+# User details
+
+With:
+
+    xenhypfs ls <path>
+
+the user can list the entries of a specific path of the FS. Using:
+
+    xenhypfs cat <path>
+
+the content of an entry can be retrieved. Using:
+
+    xenhypfs write <path> <string>
+
+a writable entry can be modified. With:
+
+    xenhypfs tree
+
+the complete Hypervisor FS entry tree can be printed.
+
+The FS paths are documented in `docs/misc/hypfs-paths.pandoc`.
+
+# Technical details
+
+Access to the hypervisor filesystem is done via the stable new hypercall
+__HYPERVISOR_filesystem_op. This hypercall supports a sub-command
+XEN_HYPFS_OP_get_version which will return the highest version of the
+interface supported by the hypervisor. Additions to the interface need
+to bump the interface version. The hypervisor is required to support the
+previous interface versions, too (this implies that additions will always
+require new sub-commands in order to allow the hypervisor to decide which
+version of the interface to use).
+
+* hypercall interface specification
+    * `xen/include/public/hypfs.h`
+* hypervisor internal files
+    * `xen/include/xen/hypfs.h`
+    * `xen/common/hypfs.c`
+* `libxenhypfs`
+    * `tools/libs/libxenhypfs/*`
+* `xenhypfs`
+    * `tools/misc/xenhypfs.c`
+* path documentation
+    * `docs/misc/hypfs-paths.pandoc`
+
+# Testing
+
+Any new parameters or hardware mitigations should be verified to show up
+correctly in the filesystem.
+
+# Areas for improvement
+
+* More detailed access rights
+* Entries per domain and/or per cpupool
+
+# Known issues
+
+* None
+
+# References
+
+* None
+
+# History
+
+------------------------------------------------------------------------
+Date       Revision Version  Notes
+---------- -------- -------- -------------------------------------------
+2020-01-23 1        Xen 4.14 Document written
+---------- -------- -------- -------------------------------------------
diff --git a/docs/misc/hypfs-paths.pandoc b/docs/misc/hypfs-paths.pandoc
new file mode 100644
index 0000000000..39539fa1b5
--- /dev/null
+++ b/docs/misc/hypfs-paths.pandoc
@@ -0,0 +1,107 @@
+# Xenhypfs Paths
+
+This document attempts to define all the paths which are available
+in the Xen hypervisor file system (hypfs).
+
+The hypervisor file system can be accessed via the xenhypfs tool.
+
+## Notation
+
+The hypervisor file system is similar to the Linux kernel's sysfs.
+In this document directories are always specified with a trailing "/".
+
+The following notation conventions apply:
+
+        DIRECTORY/
+
+        PATH = VALUES [TAGS]
+
+The first syntax defines a directory. It normally contains related
+entries and the general scope of the directory is described.
+
+The second syntax defines a file entry containing values which are
+either set by the hypervisor or, if the file is writable, can be set
+by the user.
+
+PATH can contain simple regex constructs following the Perl compatible
+regexp syntax described in pcre(3) or perlre(1).
+
+A hypervisor file system entry name can be any 0-delimited byte string
+not containing any '/' character. The names "." and ".." are reserved
+for file system internal use.
+
+VALUES are strings and can take the following forms (note that this represents
+only the syntax used in this document):
+
+* STRING -- an arbitrary 0-delimited byte string.
+* INTEGER -- An integer, in decimal representation unless otherwise
+  noted.
+* "a literal string" -- literal strings are contained within quotes.
+* (VALUE | VALUE | ... ) -- a set of alternatives. Alternatives are
+  separated by a "|" and all the alternatives are enclosed in "(" and
+  ")".
+* {VALUE, VALUE, ... } -- a list of possible values separated by "," and
+  enclosed in "{" and "}".
+
+Additional TAGS may follow as a comma separated set of the following
+tags enclosed in square brackets.
+
+* w -- Path is writable by the user. This capability is usually
+  limited to the control domain (e.g. dom0).
+* ARM | ARM32 | ARM64 | X86: the path is available for the respective
+  architecture only.
+* PV --  Path is valid for PV capable hypervisors only.
+* HVM -- Path is valid for HVM capable hypervisors only.
+* CONFIG_* -- Path is valid only in case the hypervisor was built with
+  the respective config option.
+
+So an entry could look like this:
+
+    /cpu-bugs/active-pv/xpti = ("No"|{"dom0", "domU", "PCID-on"}) [w,X86,PV]
+
+Possible values would be "No" or a list of "dom0", "domU", and "PCID-on" with
+the list elements separated by spaces, e.g. "dom0 PCID-on".
+The entry would be writable and it would exist on X86 only and only if the
+hypervisor is configured to support PV guests.
+
+## Example
+
+A populated Xen hypervisor file system might look like the following example:
+
+    /
+        buildinfo/           directory containing build-time data
+            config           contents of .config file used to build Xen
+        cpu-bugs/            x86: directory of cpu bug information
+            l1tf             "Vulnerable" or "Not vulnerable"
+            mds              "Vulnerable" or "Not vulnerable"
+            meltdown         "Vulnerable" or "Not vulnerable"
+            spec-store-bypass "Vulnerable" or "Not vulnerable"
+            spectre-v1       "Vulnerable" or "Not vulnerable"
+            spectre-v2       "Vulnerable" or "Not vulnerable"
+            mitigations/     directory of mitigation settings
+                bti-thunk    "N/A", "RETPOLINE", "LFENCE" or "JMP"
+                spec-ctrl    "No", "IBRS+" or "IBRS-"
+                ibpb         "No" or "Yes"
+                l1d-flush    "No" or "Yes"
+                md-clear     "No" or "VERW"
+                l1tf-barrier "No" or "Yes"
+            active-hvm/      directory for mitigations active in hvm doamins
+                msr-spec-ctrl "No" or "Yes"
+                rsb          "No" or "Yes"
+                eager-fpu    "No" or "Yes"
+                md-clear     "No" or "Yes"
+            active-pv/       directory for mitigations active in pv doamins
+                msr-spec-ctrl "No" or "Yes"
+                rsb          "No" or "Yes"
+                eager-fpu    "No" or "Yes"
+                md-clear     "No" or "Yes"
+                xpti         "No" or list of "dom0", "domU", "PCID-on"
+                l1tf-shadow  "No" or list of "dom0", "domU"
+        params/              directory with hypervisor parameter values
+                             (boot/runtime parameters)
+
+## General Paths
+
+#### /
+
+The root of the hypervisor file system.
-- 
2.26.1


