Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KK+tAtVGg2nqkgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 14:17:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA76E64CD
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 14:17:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220534.1529211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vncke-0004hI-Rt; Wed, 04 Feb 2026 13:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220534.1529211; Wed, 04 Feb 2026 13:17:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vncke-0004fq-P0; Wed, 04 Feb 2026 13:17:00 +0000
Received: by outflank-mailman (input) for mailman id 1220534;
 Wed, 04 Feb 2026 13:17:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=THT1=AI=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vnckd-0004fi-VE
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 13:16:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id c7eaaade-01cb-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 14:16:57 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0067F339;
 Wed,  4 Feb 2026 05:16:50 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.54.132])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 188E33F778;
 Wed,  4 Feb 2026 05:16:54 -0800 (PST)
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
X-Inumbo-ID: c7eaaade-01cb-11f1-9ccf-f158ae23cfc8
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH] xen: Add macOS hypervisor build support
Date: Wed,  4 Feb 2026 14:16:30 +0100
Message-ID: <d923a50ff7870087347ef783516f3c2d2764dc6e.1770210872.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.11 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AFA76E64CD
X-Rspamd-Action: no action

Xen does not currently document how to build the hypervisor on macOS, and
there is no Darwin configuration for a Homebrew-based toolchain. In
addition, the Makefile silent-mode detection can be tripped by -I paths
that contain an "s", which hides build commands unexpectedly.

Add a minimal Darwin configuration, document the Homebrew toolchain and
PATH setup (including prefix differences and an out-of-tree example), and
clarify that the guide is tested on arm64. Tighten silent-mode detection
to only look at the short option word.

Functional impact: The Xen hypervisor can be cross-built on macOS (arm64)
with the documented Homebrew toolchain, and make output is no longer forced
silent by --include-dir paths.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
This patch does not intent to say that building on mac os is supported
but it can be helpful for people developing on mac os (I have been using
that for a while) and is solving a Makefile issue that could be hit by
others in other environments.
The doc file is quick attempt to document that for others, happy to get
comments from others to find out if they think this is useful or not or
if this should not be documented there.
---
 config/Darwin.mk            |  4 +++
 docs/misc/build-on-macos.md | 66 +++++++++++++++++++++++++++++++++++++
 xen/Makefile                |  2 +-
 3 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 config/Darwin.mk
 create mode 100644 docs/misc/build-on-macos.md

diff --git a/config/Darwin.mk b/config/Darwin.mk
new file mode 100644
index 000000000000..64a1dfcb42ed
--- /dev/null
+++ b/config/Darwin.mk
@@ -0,0 +1,4 @@
+include $(XEN_ROOT)/config/StdGNU.mk
+
+# We are always cross compiling so fake COMPILE_ARCH
+XEN_COMPILE_ARCH = Darwin
diff --git a/docs/misc/build-on-macos.md b/docs/misc/build-on-macos.md
new file mode 100644
index 000000000000..6b56cd8eccab
--- /dev/null
+++ b/docs/misc/build-on-macos.md
@@ -0,0 +1,66 @@
+# Building Xen Hypervisor on macOS
+
+This guide explains how to cross-compile the Xen hypervisor (xen
+subdirectory only) on macOS. This does **not** build the tools.
+
+## Prerequisites
+
+Install the following packages using Homebrew:
+
+```bash
+# Cross-compilation toolchain for ARM64
+brew install aarch64-elf-gcc
+
+# GNU tools (required for compatibility)
+brew install make gnu-sed
+```
+
+Homebrew installs under `/opt/homebrew` on Apple Silicon and `/usr/local` on
+Intel Macs. Adjust paths below accordingly.
+
+### Verification
+
+Verify your installation:
+
+```bash
+# Check cross compiler
+aarch64-elf-gcc --version
+
+# Check GNU make (adjust prefix if needed)
+/opt/homebrew/opt/make/libexec/gnubin/make --version
+
+# Check GNU sed (adjust prefix if needed)
+/opt/homebrew/opt/gnu-sed/libexec/gnubin/sed --version
+```
+
+## Building the Hypervisor
+
+Set up GNU tools in PATH and build:
+
+```bash
+# Set up GNU tools in PATH (adjust prefix if needed)
+export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:/opt/homebrew/opt/make/libexec/gnubin:$PATH"
+
+# Build Xen hypervisor only (in-tree)
+cd xen/
+make XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-elf- HOSTCC=gcc
+
+# Optional: out-of-tree build directory
+# make XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-elf- HOSTCC=gcc O=$PWD/build-mac
+```
+
+## Architecture Support
+
+Currently supported architectures:
+
+- **ARM64** (`arm64`) - Default, uses `aarch64-elf-gcc`
+
+Other targets may work if the corresponding cross toolchain is installed,
+but this guide has only been tested on ARM64.
+
+## Limitations
+
+- **Hypervisor only**: This only builds the Xen hypervisor, not the tools
+- **Cross-compilation only**: Native builds are not supported
+- **macOS-specific**: Instructions optimized for macOS with Homebrew
+- **GNU tools required**: Native BSD tools are not compatible
diff --git a/xen/Makefile b/xen/Makefile
index 13e336ba5484..adeb869f32ad 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -116,7 +116,7 @@ endif
 # If the user is running make -s (silent mode), suppress echoing of
 # commands
 
-ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
+ifneq ($(findstring s,$(firstword $(MAKEFLAGS))),)
     quiet := silent_
 endif
 
-- 
2.52.0


