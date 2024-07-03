Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B29926C1F
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 00:55:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753355.1161603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP8sz-0004by-9X; Wed, 03 Jul 2024 22:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753355.1161603; Wed, 03 Jul 2024 22:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP8sz-0004Zv-69; Wed, 03 Jul 2024 22:55:37 +0000
Received: by outflank-mailman (input) for mailman id 753355;
 Wed, 03 Jul 2024 22:55:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i9qc=OD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sP8sx-0004Kt-Ml
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 22:55:35 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b515ba4-398f-11ef-bbf9-fd08da9f4363;
 Thu, 04 Jul 2024 00:55:34 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-36799a67d9cso68760f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 15:55:34 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72aaf638f3sm549984566b.89.2024.07.03.15.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 15:55:30 -0700 (PDT)
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
X-Inumbo-ID: 5b515ba4-398f-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720047333; x=1720652133; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nc6jPiNiL6yKZZqXuTh5pDooCk6e0PT5O2QbWpQhSHI=;
        b=n5xbw8LzwNYaG65SL2RdRRtR8U0mrwTTmLapG0dmPhFQxbhq897S981Xk/G5AzhyFr
         iX1RPJILXbYW75/NnwHv3iH6tqwcdCIR11O1m4z4L2jTYkYKO7HX/qhQt+EXxr1n8YbY
         CVayakmKUdwjvO1HIOSDI0uvWQ3wgr3/eQgxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720047333; x=1720652133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nc6jPiNiL6yKZZqXuTh5pDooCk6e0PT5O2QbWpQhSHI=;
        b=G/i0UVABQeRuVKGBHwEv8xuUdxmMEy4TLP3IcO7hxcr80+5qxa20W+Z3dtoNCP4x8L
         inb7sC171p3FkZYp9csByDYowv6YsSOE0HbJytz8tlghs3m+xGR1Ssczu8aWcsPduBAu
         iYXfSYjIHuxylxpW1GVjL/sAY8ywBV0BtoKnQBpXbgr+31/Q9hA+jhVT23Lz1u75tnmx
         4DBvGg117sTOA/Km4bib2nn/kHnzdXTdyC8qQrvBQ5Hj0uq7BmjaYJHrld1xDYIWibf1
         GzmB/f1tKH945R2Y+0XI9p02KHjrwO4NzDDJjxGq3Blm8PJ1Son6Ev4zakuaPWtfkVkO
         QItA==
X-Gm-Message-State: AOJu0Ywllm0pB+BNBalVT2v+39LqKl6DhURFhd2w3WEoAKteN/ITc8m8
	27gqLMKDOntVzuMWDMVfn7fN5daFMmkwNc59P1JymM6PnbW58xdk88XTO1ZGicpSVpV78tbixui
	2
X-Google-Smtp-Source: AGHT+IHK6dAz6/ClADPFpho9/pZFjPiB4wEg0e0Rt8mllSGYd2/Wv6a8YnlFCR+ELQkPE1R23gSDYw==
X-Received: by 2002:a5d:4a45:0:b0:367:9114:4693 with SMTP id ffacd0b85a97d-3679dd31348mr18355f8f.31.1720047333205;
        Wed, 03 Jul 2024 15:55:33 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 1/2] build/mkheader: Remove C-isms from the code
Date: Wed,  3 Jul 2024 23:55:24 +0100
Message-Id: <20240703225525.1759907-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240703225525.1759907-1-andrew.cooper3@citrix.com>
References: <20240703225525.1759907-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was clearly written by a C programmer, rather than a python programmer.
Drop all the useless semi-colons.

The very final line of the script simply references f.close, rather than
calling the function.  Switch to using a with: statement, as python does care
about unclosed files if you enable enough warnings.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 tools/include/xen-foreign/mkheader.py | 104 +++++++++++++-------------
 1 file changed, 51 insertions(+), 53 deletions(-)

diff --git a/tools/include/xen-foreign/mkheader.py b/tools/include/xen-foreign/mkheader.py
index 081b57f842a2..3a33df4984a2 100644
--- a/tools/include/xen-foreign/mkheader.py
+++ b/tools/include/xen-foreign/mkheader.py
@@ -2,21 +2,21 @@
 
 from __future__ import print_function
 
-import sys, re;
-from structs import unions, structs, defines;
+import sys, re
+from structs import unions, structs, defines
 
 # command line arguments
-arch    = sys.argv[1];
-outfile = sys.argv[2];
-infiles = sys.argv[3:];
+arch    = sys.argv[1]
+outfile = sys.argv[2]
+infiles = sys.argv[3:]
 
 
 ###########################################################################
 # configuration #2: architecture information
 
-inttypes = {};
-header = {};
-footer = {};
+inttypes = {}
+header = {}
+footer = {}
 
 #arm
 inttypes["arm32"] = [
@@ -35,7 +35,7 @@ header["arm32"] = """
 # define __DECL_REG(n64, n32) uint64_t n64
 # define __align8__ FIXME
 #endif
-""";
+"""
 footer["arm32"] = """
 #undef __DECL_REG
 """
@@ -56,7 +56,7 @@ header["arm64"] = """
 # define __DECL_REG(n64, n32) uint64_t n64
 # define __align8__ FIXME
 #endif
-""";
+"""
 footer["arm64"] = """
 #undef __DECL_REG
 """
@@ -73,12 +73,12 @@ header["x86_32"] = """
 #define __DECL_REG_LO16(name) uint32_t e ## name
 #define __i386___X86_32 1
 #pragma pack(4)
-""";
+"""
 footer["x86_32"] = """
 #undef __DECL_REG_LO8
 #undef __DECL_REG_LO16
 #pragma pack()
-""";
+"""
 
 # x86_64
 inttypes["x86_64"] = [
@@ -100,7 +100,7 @@ header["x86_64"] = """
 #define __DECL_REG_LO16       __DECL_REG
 #define __DECL_REG_HI         __DECL_REG
 #define __x86_64___X86_64 1
-""";
+"""
 footer["x86_64"] = """
 #undef __DECL_REG
 #undef __DECL_REG_LOHI
@@ -112,12 +112,12 @@ footer["x86_64"] = """
 ###########################################################################
 # main
 
-input  = "";
-output = "";
-fileid = re.sub("[-.]", "_", "__FOREIGN_%s__" % outfile.upper());
+input  = ""
+output = ""
+fileid = re.sub("[-.]", "_", "__FOREIGN_%s__" % outfile.upper())
 
 for name in infiles:
-    f = open(name, "r");
+    f = open(name, "r")
 
     # Sanity check the licence of the input file(s)
     line = f.readline()
@@ -126,8 +126,8 @@ for name in infiles:
               (sys.argv[0], name, line.strip()), file=sys.stderr)
         exit(1)
 
-    input += f.read();
-    f.close();
+    input += f.read()
+    f.close()
 
 # replace path in "infiles" by path in '/usr/include' to avoid exposing the
 # build directory path in the generated headers.
@@ -151,83 +151,81 @@ output += """/* SPDX-License-Identifier: MIT */
 """ % (arch, headers_name_list, sys.argv[0], fileid, fileid)
 
 if arch in header:
-    output += header[arch];
-    output += "\n";
+    output += header[arch]
+    output += "\n"
 
 defined = {}
 
 # add defines to output
 for line in re.findall("#define[^\n]+", input):
     for define in defines:
-        regex = "#define\s+%s\\b" % define;
-        match = re.search(regex, line);
+        regex = "#define\s+%s\\b" % define
+        match = re.search(regex, line)
         if None == match:
-            continue;
+            continue
         defined[define] = 1
         if define.upper()[0] == define[0]:
-            replace = define + "_" + arch.upper();
+            replace = define + "_" + arch.upper()
         else:
-            replace = define + "_" + arch;
-        regex = "\\b%s\\b" % define;
-        output += re.sub(regex, replace, line) + "\n";
-output += "\n";
+            replace = define + "_" + arch
+        regex = "\\b%s\\b" % define
+        output += re.sub(regex, replace, line) + "\n"
+output += "\n"
 
 # delete defines, comments, empty lines
-input = re.sub("#define[^\n]+\n", "", input);
+input = re.sub("#define[^\n]+\n", "", input)
 input = re.compile("/\*(.*?)\*/", re.S).sub("", input)
-input = re.compile("\n\s*\n", re.S).sub("\n", input);
+input = re.compile("\n\s*\n", re.S).sub("\n", input)
 
 # add unions to output
 for union in unions:
-    regex = "union\s+%s\s*\{(.*?)\n\};" % union;
+    regex = "union\s+%s\s*\{(.*?)\n\};" % union
     match = re.search(regex, input, re.S)
     if None == match:
-        output += "#define %s_has_no_%s 1\n" % (arch, union);
+        output += "#define %s_has_no_%s 1\n" % (arch, union)
     else:
-        output += "union %s_%s {%s\n};\n" % (union, arch, match.group(1));
-    output += "\n";
+        output += "union %s_%s {%s\n};\n" % (union, arch, match.group(1))
+    output += "\n"
 
 # add structs to output
 for struct in structs:
-    regex = "(?:#ifdef ([A-Z_]+))?\nstruct\s+%s\s*\{(.*?)\n\};" % struct;
+    regex = "(?:#ifdef ([A-Z_]+))?\nstruct\s+%s\s*\{(.*?)\n\};" % struct
     match = re.search(regex, input, re.S)
     if None == match or \
            (match.group(1) is not None and match.group(1) not in defined):
-        output += "#define %s_has_no_%s 1\n" % (arch, struct);
+        output += "#define %s_has_no_%s 1\n" % (arch, struct)
     else:
-        output += "struct %s_%s {%s\n};\n" % (struct, arch, match.group(2));
-        output += "typedef struct %s_%s %s_%s_t;\n" % (struct, arch, struct, arch);
-    output += "\n";
+        output += "struct %s_%s {%s\n};\n" % (struct, arch, match.group(2))
+        output += "typedef struct %s_%s %s_%s_t;\n" % (struct, arch, struct, arch)
+    output += "\n"
 
 # add footer
 if arch in footer:
-    output += footer[arch];
-    output += "\n";
-output += "#endif /* %s */\n" % fileid;
+    output += footer[arch]
+    output += "\n"
+output += "#endif /* %s */\n" % fileid
 
 # replace: defines
 for define in defines:
     if define.upper()[0] == define[0]:
-        replace = define + "_" + arch.upper();
+        replace = define + "_" + arch.upper()
     else:
-        replace = define + "_" + arch;
-    output = re.sub("\\b%s\\b" % define, replace, output);
+        replace = define + "_" + arch
+    output = re.sub("\\b%s\\b" % define, replace, output)
 
 # replace: unions
 for union in unions:
-    output = re.sub("\\b(union\s+%s)\\b" % union, "\\1_%s" % arch, output);
+    output = re.sub("\\b(union\s+%s)\\b" % union, "\\1_%s" % arch, output)
 
 # replace: structs + struct typedefs
 for struct in structs:
-    output = re.sub("\\b(struct\s+%s)\\b" % struct, "\\1_%s" % arch, output);
-    output = re.sub("\\b(%s)_t\\b" % struct, "\\1_%s_t" % arch, output);
+    output = re.sub("\\b(struct\s+%s)\\b" % struct, "\\1_%s" % arch, output)
+    output = re.sub("\\b(%s)_t\\b" % struct, "\\1_%s_t" % arch, output)
 
 # replace: integer types
 for old, new in inttypes[arch]:
     output = re.sub("\\b%s\\b" % old, new, output)
 
 # print results
-f = open(outfile, "w");
-f.write(output);
-f.close;
-
+with open(outfile, "w") as f:
+    f.write(output)
-- 
2.39.2


