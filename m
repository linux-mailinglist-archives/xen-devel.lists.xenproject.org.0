Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD284C4883
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:16:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279256.476967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKY-0008HH-Fv; Fri, 25 Feb 2022 15:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279256.476967; Fri, 25 Feb 2022 15:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKY-0008CS-9D; Fri, 25 Feb 2022 15:16:26 +0000
Received: by outflank-mailman (input) for mailman id 279256;
 Fri, 25 Feb 2022 15:16:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcIR-0006fy-Rh
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:14:15 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96495a21-964d-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 16:14:13 +0100 (CET)
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
X-Inumbo-ID: 96495a21-964d-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802053;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iBXan52Uptq1lv5gul5Hkg1gH0pXMqxs3qqmW+W01jw=;
  b=MjzXe7hcOsy22c/tbQJt8Su0MlspPKBSRMoDwBUNGfMUJKeTCt4+q+ts
   A1w+VEyV1bMS1ygcoO4SmKH0duOqHElUqPQZMhfXz2jDVD8g4asBP1z0h
   aVeyMWDBgiJ10fgwpXeMQPdK8RMF8SVHMyyt+xnDcPHYdQVzfFF6FoAdS
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65000328
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:2sa8AqDh4G2S8xVW/1Pjw5YqxClBgxIJ4kV8jS/XYbTApDNzhmQPy
 GsfDDyDbv+JMWr1eI1/PoTj8R8DsJbQzodhQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Rj39Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhj6
 /tKh4e9czwMI4SStLkkWThTHBphaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp4TRa6GP
 JBJAdZpRErtTwVPOWxKMb4vofv2uCKmQywbp2vA8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru/WvjBQoBHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKalgw/dd1iCOAA0ySQ4/T4vj+TJ2MLdSEUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/4+SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFRON/Ni2+AswGzARN8wGCxFAjpU
 J8swZX20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4MvW4ifRs0ap5cIVcFh
 XM/XysLtfe/21PwMMdKj3+ZUZx2ncAM6/y/PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1ulAv7GMGgpzz6gOX2WZJgYepcWLd4Rrtit/3sTcS82
 4s3CvZmPD0ECLyuOnSMqNVLRb3IRFBiba3LRwVsXrbrCmJb9KsJUZc9HZtJl1RZoplo
IronPort-HdrOrdr: A9a23:mzn/raivuTaJtnmKfbjVxuAX0HBQXtwji2hC6mlwRA09TySZ//
 rAoB19726StN9xYgBYpTnuAsi9qB/nmKKdpLNhX4tKPzOW3FdATrsD0WKK+VSJcEfDH6xmpM
 JdmsBFebvN5DNB4/oSjjPVLz9Z+qjlzJyV
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="65000328"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 22/29] libs/stat: Fix and rework perl-binding build
Date: Fri, 25 Feb 2022 15:13:14 +0000
Message-ID: <20220225151321.44126-23-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

For PERL_FLAGS, use make's shell rather than a backquote.

Rather than relying on the VCS to create an empty directory for us,
we can create one before generating the *.c file for the bindings.

Make use of generic variable names to build a shared library from a
source file: CFLAGS, LDFLAGS, and LDLIBS.

To build a shared library, we need to build the source file with
"-fPIC", which was drop by 6d0ec05390 (tools: split libxenstat into
new tools/libs/stat directory).

The source file generated by swig seems to be missing many prototype for
many functions, so we need "-Wno-missing-prototypes" in order to
build it. Also, one of the prototype is deemed malformed, so we also
need "-Wno-strict-prototypes".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---

Notes:
    v2:
    - reviewed

 tools/libs/stat/Makefile                  | 15 +++++++++++----
 tools/libs/stat/bindings/swig/perl/.empty |  1 -
 2 files changed, 11 insertions(+), 5 deletions(-)
 delete mode 100644 tools/libs/stat/bindings/swig/perl/.empty

diff --git a/tools/libs/stat/Makefile b/tools/libs/stat/Makefile
index b8d75810fc..7eaf50e91e 100644
--- a/tools/libs/stat/Makefile
+++ b/tools/libs/stat/Makefile
@@ -94,13 +94,20 @@ uninstall:: uninstall-python-bindings
 endif
 
 # Perl bindings
-PERL_FLAGS=`perl -MConfig -e 'print "$$Config{ccflags} -I$$Config{archlib}/CORE";'`
+PERL_FLAGS = $(shell $(PERL) -MConfig -e 'print "$$Config{ccflags} -I$$Config{archlib}/CORE";')
 $(PERLMOD): $(PERLSRC)
 $(PERLSRC): bindings/swig/xenstat.i
-	swig -perl $(SWIG_FLAGS) -outdir $(@D) -o $(PERLSRC) $<
-
+	mkdir -p $(@D)
+	swig -perl $(SWIG_FLAGS) -outdir $(@D) -o $@ $<
+
+$(PERLLIB): CFLAGS += -fPIC
+$(PERLLIB): CFLAGS += -Wno-strict-prototypes
+$(PERLLIB): CFLAGS += -Wno-missing-prototypes
+$(PERLLIB): LDFLAGS += $(PERL_FLAGS)
+$(PERLLIB): LDFLAGS += $(SHLIB_LDFLAGS)
+$(PERLLIB): LDLIBS := $(LDLIBS_libxenstat)
 $(PERLLIB): $(PERLSRC)
-	$(CC) $(CFLAGS) $(LDFLAGS) $(PERL_FLAGS) $(SHLIB_LDFLAGS) -lxenstat -o $@ $< $(APPEND_LDFLAGS)
+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $< $(LDLIBS) $(APPEND_LDFLAGS)
 
 .PHONY: perl-bindings
 perl-bindings: $(PERLLIB) $(PERLMOD)
diff --git a/tools/libs/stat/bindings/swig/perl/.empty b/tools/libs/stat/bindings/swig/perl/.empty
deleted file mode 100644
index 2a8dd4274d..0000000000
--- a/tools/libs/stat/bindings/swig/perl/.empty
+++ /dev/null
@@ -1 +0,0 @@
-This directory is empty; this file is included to prevent version control systems from removing the directory.
-- 
Anthony PERARD


