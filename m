Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E1A2BC0A5
	for <lists+xen-devel@lfdr.de>; Sat, 21 Nov 2020 17:51:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.33011.64092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgW6W-0001kg-Sr; Sat, 21 Nov 2020 16:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 33011.64092; Sat, 21 Nov 2020 16:51:16 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgW6W-0001kH-PE; Sat, 21 Nov 2020 16:51:16 +0000
Received: by outflank-mailman (input) for mailman id 33011;
 Sat, 21 Nov 2020 16:51:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KIx3=E3=redhat.com=trix@srs-us1.protection.inumbo.net>)
 id 1kgW6U-0001kC-Jm
 for xen-devel@lists.xenproject.org; Sat, 21 Nov 2020 16:51:14 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 0be25e19-0a35-4f47-8b96-3bc1f2cdf15b;
 Sat, 21 Nov 2020 16:51:12 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-X48RMHn8N1Swh15Ci0suvg-1; Sat, 21 Nov 2020 11:51:08 -0500
Received: by mail-qk1-f198.google.com with SMTP id 202so10918044qkl.9
 for <xen-devel@lists.xenproject.org>; Sat, 21 Nov 2020 08:51:08 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id j202sm4129196qke.108.2020.11.21.08.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2020 08:51:06 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=KIx3=E3=redhat.com=trix@srs-us1.protection.inumbo.net>)
	id 1kgW6U-0001kC-Jm
	for xen-devel@lists.xenproject.org; Sat, 21 Nov 2020 16:51:14 +0000
X-Inumbo-ID: 0be25e19-0a35-4f47-8b96-3bc1f2cdf15b
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 0be25e19-0a35-4f47-8b96-3bc1f2cdf15b;
	Sat, 21 Nov 2020 16:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605977471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type;
	bh=zLH0U0S3qPuM/4/c12zDySDpu72UCHtVP0nLwv0orcI=;
	b=AFEeC4LwJVQY50Rclp0n+cpskzGMKTYLo6JEX0eKNm0GvOoPPRr0PIlzZZR4c90sUF1AFa
	wWxnbbHvzUJD9uKYKMOZDMNEn0QtuGxgpp5z9GJnrDgiQ4ysveuwkSR6FRmHHm8xJN+LCI
	+l5BMm33isMWCeCIZOiQlxjVKkD6iAY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-X48RMHn8N1Swh15Ci0suvg-1; Sat, 21 Nov 2020 11:51:08 -0500
X-MC-Unique: X48RMHn8N1Swh15Ci0suvg-1
Received: by mail-qk1-f198.google.com with SMTP id 202so10918044qkl.9
        for <xen-devel@lists.xenproject.org>; Sat, 21 Nov 2020 08:51:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=zLH0U0S3qPuM/4/c12zDySDpu72UCHtVP0nLwv0orcI=;
        b=YTiUCAYWNw96vHft/4JnhlK8v65oiuz/WlCgXBBp7wDLhCVTxKyMxaEeFN4n/l/cI2
         A1orddk6zLBLa9lihnmBulfZPbJGiNBrqE69Ov3KAzjIZ2nCCQEJWRNvFr9M6pCD1s97
         KMwznW4u8+d3TNGSlyWJFiKy+4nOPPHIDeORDwZRBrpR2HuBlptI9flmLVTwfJd9ML4v
         UY5IMN947OQKLz3Va+Zr9AG9XJgjoJpyewl0X9KHQN8imOp0k+bKSNP2RmOAZUa1GlLX
         HBnt3J24Uif8fTQRMD6mV+9Lx5PdOK6C4+DvD7Txr8e5apJX4BeMHvck2/N7PjZiRNlC
         pGoQ==
X-Gm-Message-State: AOAM533/V+++i+3Gv7opWjyuGnlsaGUuLA1ZuwZyfRjfA60FxVGjC4rh
	AMFfqooNO+7JK+wjsH3nD4BluPVW0qcOZi/W0o71FtaWM66UDbsDvHl6/bSapIjB8UE4YzRZdeU
	CPugkgC4OUbjd7n7tB2IYH074W04=
X-Received: by 2002:a05:620a:15ce:: with SMTP id o14mr22885262qkm.231.1605977467694;
        Sat, 21 Nov 2020 08:51:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJMB7Phx6GdQ/NzrSSCIOwTBjDbbn+gugDtHjIEeXte769cdu0l51J2LUn/+h4QxN+fnLujw==
X-Received: by 2002:a05:620a:15ce:: with SMTP id o14mr22885248qkm.231.1605977467468;
        Sat, 21 Nov 2020 08:51:07 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id j202sm4129196qke.108.2020.11.21.08.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 08:51:06 -0800 (PST)
From: trix@redhat.com
To: trix@redhat.com,
	joe@perches.com,
	clang-built-linux@googlegroups.com
Cc: linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	tboot-devel@lists.sourceforge.net,
	kvm@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	devel@acpica.org,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	netdev@vger.kernel.org,
	linux-media@vger.kernel.org,
	MPT-FusionLinux.pdl@broadcom.com,
	linux-scsi@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	ecryptfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	cluster-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	keyrings@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	alsa-devel@alsa-project.org,
	bpf@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [RFC] MAINTAINERS tag for cleanup robot
Date: Sat, 21 Nov 2020 08:50:58 -0800
Message-Id: <20201121165058.1644182-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"

A difficult part of automating commits is composing the subsystem
preamble in the commit log.  For the ongoing effort of a fixer producing
one or two fixes a release the use of 'treewide:' does not seem appropriate.

It would be better if the normal prefix was used.  Unfortunately normal is
not consistent across the tree.

So I am looking for comments for adding a new tag to the MAINTAINERS file

	D: Commit subsystem prefix

ex/ for FPGA DFL DRIVERS

	D: fpga: dfl:

Continuing with cleaning up clang's -Wextra-semi-stmt

A significant number of warnings are caused by function like macros with
a trailing semicolon.  For example.

#define FOO(a) a++; <-- extra, unneeded semicolon
void bar() {
	int v = 0;
	FOO(a);
} 

Clang will warn at the FOO(a); expansion location. Instead of removing
the semicolon there,  the fixer removes semicolon from the macro
definition.  After the fixer, the code will be:

#define FOO(a) a++
void bar() {
	int v = 0;
	FOO(a);
} 

The fixer review is
https://reviews.llvm.org/D91789

A run over allyesconfig for x86_64 finds 62 issues, 5 are false positives.
The false positives are caused by macros passed to other macros and by
some macro expansions that did not have an extra semicolon.

This cleans up about 1,000 of the current 10,000 -Wextra-semi-stmt
warnings in linux-next.

An update to [RFC] clang tooling cleanup
This change adds the clang-tidy-fix as a top level target and
uses it to do the cleaning.  The next iteration will do a loop of
cleaners.  This will mean breaking clang-tidy-fix out into its own
processing function 'run_fixers'.

Makefile: Add toplevel target clang-tidy-fix to makefile

Calls clang-tidy with -fix option for a set of checkers that
programatically fixes the kernel source in place, treewide.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 Makefile                               |  7 ++++---
 scripts/clang-tools/run-clang-tools.py | 20 +++++++++++++++++---
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 47a8add4dd28..57756dbb767b 100644
--- a/Makefile
+++ b/Makefile
@@ -1567,20 +1567,21 @@ help:
 	 echo  ''
 	@echo  'Static analysers:'
 	@echo  '  checkstack      - Generate a list of stack hogs'
 	@echo  '  versioncheck    - Sanity check on version.h usage'
 	@echo  '  includecheck    - Check for duplicate included header files'
 	@echo  '  export_report   - List the usages of all exported symbols'
 	@echo  '  headerdep       - Detect inclusion cycles in headers'
 	@echo  '  coccicheck      - Check with Coccinelle'
 	@echo  '  clang-analyzer  - Check with clang static analyzer'
 	@echo  '  clang-tidy      - Check with clang-tidy'
+	@echo  '  clang-tidy-fix  - Check and fix with clang-tidy'
 	@echo  ''
 	@echo  'Tools:'
 	@echo  '  nsdeps          - Generate missing symbol namespace dependencies'
 	@echo  ''
 	@echo  'Kernel selftest:'
 	@echo  '  kselftest         - Build and run kernel selftest'
 	@echo  '                      Build, install, and boot kernel before'
 	@echo  '                      running kselftest on it'
 	@echo  '                      Run as root for full coverage'
 	@echo  '  kselftest-all     - Build kernel selftest'
@@ -1842,30 +1843,30 @@ nsdeps: modules
 quiet_cmd_gen_compile_commands = GEN     $@
       cmd_gen_compile_commands = $(PYTHON3) $< -a $(AR) -o $@ $(filter-out $<, $(real-prereqs))
 
 $(extmod-prefix)compile_commands.json: scripts/clang-tools/gen_compile_commands.py \
 	$(if $(KBUILD_EXTMOD),,$(KBUILD_VMLINUX_OBJS) $(KBUILD_VMLINUX_LIBS)) \
 	$(if $(CONFIG_MODULES), $(MODORDER)) FORCE
 	$(call if_changed,gen_compile_commands)
 
 targets += $(extmod-prefix)compile_commands.json
 
-PHONY += clang-tidy clang-analyzer
+PHONY += clang-tidy-fix clang-tidy clang-analyzer
 
 ifdef CONFIG_CC_IS_CLANG
 quiet_cmd_clang_tools = CHECK   $<
       cmd_clang_tools = $(PYTHON3) $(srctree)/scripts/clang-tools/run-clang-tools.py $@ $<
 
-clang-tidy clang-analyzer: $(extmod-prefix)compile_commands.json
+clang-tidy-fix clang-tidy clang-analyzer: $(extmod-prefix)compile_commands.json
 	$(call cmd,clang_tools)
 else
-clang-tidy clang-analyzer:
+clang-tidy-fix clang-tidy clang-analyzer:
 	@echo "$@ requires CC=clang" >&2
 	@false
 endif
 
 # Scripts to check various things for consistency
 # ---------------------------------------------------------------------------
 
 PHONY += includecheck versioncheck coccicheck export_report
 
 includecheck:
diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
index fa7655c7cec0..c177ca822c56 100755
--- a/scripts/clang-tools/run-clang-tools.py
+++ b/scripts/clang-tools/run-clang-tools.py
@@ -22,43 +22,57 @@ def parse_arguments():
     Returns:
         args: Dict of parsed args
         Has keys: [path, type]
     """
     usage = """Run clang-tidy or the clang static-analyzer on a
         compilation database."""
     parser = argparse.ArgumentParser(description=usage)
 
     type_help = "Type of analysis to be performed"
     parser.add_argument("type",
-                        choices=["clang-tidy", "clang-analyzer"],
+                        choices=["clang-tidy-fix", "clang-tidy", "clang-analyzer"],
                         help=type_help)
     path_help = "Path to the compilation database to parse"
     parser.add_argument("path", type=str, help=path_help)
 
     return parser.parse_args()
 
 
 def init(l, a):
     global lock
     global args
     lock = l
     args = a
 
 
 def run_analysis(entry):
     # Disable all checks, then re-enable the ones we want
     checks = "-checks=-*,"
-    if args.type == "clang-tidy":
+    fix = ""
+    header_filter = ""
+    if args.type == "clang-tidy-fix":
+        checks += "linuxkernel-macro-trailing-semi"
+        #
+        # Fix this
+        # #define M(a) a++; <-- clang-tidy fixes the problem here
+        # int f() {
+        #   int v = 0;
+        #   M(v);  <-- clang reports problem here
+        #   return v;
+        # }
+        fix += "-fix"
+        header_filter += "-header-filter=.*"
+    elif args.type == "clang-tidy":
         checks += "linuxkernel-*"
     else:
         checks += "clang-analyzer-*"
-    p = subprocess.run(["clang-tidy", "-p", args.path, checks, entry["file"]],
+    p = subprocess.run(["clang-tidy", "-p", args.path, checks, header_filter, fix, entry["file"]],
                        stdout=subprocess.PIPE,
                        stderr=subprocess.STDOUT,
                        cwd=entry["directory"])
     with lock:
         sys.stderr.buffer.write(p.stdout)
 
 
 def main():
     args = parse_arguments()
 
-- 
2.18.4


