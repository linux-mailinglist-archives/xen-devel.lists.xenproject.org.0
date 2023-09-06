Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE70793D9F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 15:26:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596619.930559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdsWt-0000By-Ch; Wed, 06 Sep 2023 13:25:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596619.930559; Wed, 06 Sep 2023 13:25:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdsWt-0000A2-9s; Wed, 06 Sep 2023 13:25:11 +0000
Received: by outflank-mailman (input) for mailman id 596619;
 Wed, 06 Sep 2023 13:25:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Jy9=EW=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qdsWr-00009b-QX
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 13:25:09 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc97563a-4cb8-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 15:25:08 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-401d67434daso36132585e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Sep 2023 06:25:08 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a1c7416000000b003fe23b10fdfsm23024250wmc.36.2023.09.06.06.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 06:25:07 -0700 (PDT)
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
X-Inumbo-ID: cc97563a-4cb8-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1694006708; x=1694611508; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gHZT37ph+apRRKVcB+jqgGnudNtO5NAW3UTxBPcaBmY=;
        b=G9hWF1dhaRCu4RjudwR98T2pZAf+zXJ3DPW5VMtV/z6GxvSH2Yvc7HRLit2Z/uWhv2
         VZZsSLQ1CgoY3PkCotiOFX283r+LlTyV+JSjipTUzNzFQQTGEc11icZmE8ULUjsUF17O
         L7w5U8ibPFVE9k3ktNOblhaOOWPu7mkpqy1hQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694006708; x=1694611508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gHZT37ph+apRRKVcB+jqgGnudNtO5NAW3UTxBPcaBmY=;
        b=dwwWxtqBngPtyu0LZAVFZ58w9eb3Ue11BWDLcf2er7w2sfZBAQMOGEHOJ7JlpP3ouG
         i6wIUwZ4d0D369wQMBvqxxN6MBaQKyxwuKoaq2gfPSWvV0hI30ge9bhlPl/aub0tLdSa
         HKAUTybEZOw6pM0OUfeQHMlZ2Q364nfoy/LjCOByHXuuQ6DtAPyv+kACfd2MAbDKl0es
         q140Wn7xM/yYeAUR0zT43f9ia9jd4gpXjeWIfVv36S+EoJe+0ghiPrHE57ycLVpyAUBt
         8JdVBUbj5trTnzGPk8P3O0+kEA4UNzPc3nPWVmECEJgEJnSuXRVsMYO172zx2wSZZBO+
         opNw==
X-Gm-Message-State: AOJu0YxoQgnTgsPQHax7popU6regGh+vRruwjvO0FmrkH1SrFeSczLzk
	JcP5J5P3ZZtT/LbM7MEZw9kn9H7vmlHnNqSPeikoeA==
X-Google-Smtp-Source: AGHT+IFRyI7vnw2itWYrvrd1dlj8ak/GmBDyIg87mloQAJiyVTgqPJNfmLhCD2ztSTk+8gXRSIT/yQ==
X-Received: by 2002:a7b:c389:0:b0:3ff:28b8:c53d with SMTP id s9-20020a7bc389000000b003ff28b8c53dmr2174762wmj.33.1694006707892;
        Wed, 06 Sep 2023 06:25:07 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1] tools/xentrace/xentrace_format: Add python 3 compatibility
Date: Wed,  6 Sep 2023 14:14:46 +0100
Message-ID: <20230906131616.7681-1-javi.merino@cloud.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Closes issue #155

Signed-off-by: Javi Merino <javi.merino@cloud.com>
---

Tested using the format file in tools/xentrace/formats.  With this patch, both python2 and python3 produce the same output.

 tools/xentrace/xentrace_format | 63 +++++++++++++++++++---------------
 1 file changed, 36 insertions(+), 27 deletions(-)

diff --git a/tools/xentrace/xentrace_format b/tools/xentrace/xentrace_format
index 5ff85ae2e8..166ebae325 100644
--- a/tools/xentrace/xentrace_format
+++ b/tools/xentrace/xentrace_format
@@ -4,11 +4,15 @@
 
 # Program for reformatting trace buffer output according to user-supplied rules
 
+from __future__ import division
+from __future__ import print_function
+from __future__ import unicode_literals
+from builtins import str
+from past.utils import old_div
 import re, sys, string, signal, struct, os, getopt
 
 def usage():
-    print >> sys.stderr, \
-          "Usage: " + sys.argv[0] + """ defs-file
+    print("Usage: " + sys.argv[0] + """ defs-file
           Parses trace data in binary format, as output by Xentrace and
           reformats it according to the rules in a file of definitions.  The
           rules in this file should have the format ({ and } show grouping
@@ -29,7 +33,7 @@ def usage():
           this script may not be able to keep up with the output of xentrace
           if it is piped directly.  In these circumstances you should have
           xentrace output to a file for processing off-line.
-          """
+          """, file=sys.stderr)
     sys.exit(1)
 
 def read_defs(defs_file):
@@ -49,7 +53,7 @@ def read_defs(defs_file):
 
         m = reg.match(line)
 
-        if not m: print >> sys.stderr, "Bad format file" ; sys.exit(1)
+        if not m: print("Bad format file", file=sys.stderr) ; sys.exit(1)
 
         defs[str(eval(m.group(1)))] = m.group(2)
 
@@ -83,8 +87,8 @@ interrupted = 0
 
 try:
     defs = read_defs(arg[0])
-except IOError, exn:
-    print exn
+except IOError as exn:
+    print(exn)
     sys.exit(1)
 
 # structure of trace record (as output by xentrace):
@@ -117,12 +121,17 @@ TRC_PV_HYPERCALL_SUBCALL = 0x20100e
 NR_VECTORS = 256
 irq_measure = [{'count':0, 'tot_cycles':0, 'max_cycles':0}] * NR_VECTORS
 
+if sys.version_info >= (3, 0):
+    stdin_bytes = sys.stdin.buffer
+else:
+    stdin_bytes = sys.stdin
+
 i=0
 
 while not interrupted:
     try:
         i=i+1
-        line = sys.stdin.read(struct.calcsize(HDRREC))
+        line = stdin_bytes.read(struct.calcsize(HDRREC))
         if not line:
             break
         event = struct.unpack(HDRREC, line)[0]
@@ -140,43 +149,43 @@ while not interrupted:
         tsc = 0
 
         if tsc_in == 1:
-            line = sys.stdin.read(struct.calcsize(TSCREC))
+            line = stdin_bytes.read(struct.calcsize(TSCREC))
             if not line:
                 break
             tsc = struct.unpack(TSCREC, line)[0]
 
         if n_data == 1:
-            line = sys.stdin.read(struct.calcsize(D1REC))
+            line = stdin_bytes.read(struct.calcsize(D1REC))
             if not line:
                 break
             d1 = struct.unpack(D1REC, line)[0]
         if n_data == 2:
-            line = sys.stdin.read(struct.calcsize(D2REC))
+            line = stdin_bytes.read(struct.calcsize(D2REC))
             if not line:
                 break
             (d1, d2) = struct.unpack(D2REC, line)
         if n_data == 3:
-            line = sys.stdin.read(struct.calcsize(D3REC))
+            line = stdin_bytes.read(struct.calcsize(D3REC))
             if not line:
                 break
             (d1, d2, d3) = struct.unpack(D3REC, line)
         if n_data == 4:
-            line = sys.stdin.read(struct.calcsize(D4REC))
+            line = stdin_bytes.read(struct.calcsize(D4REC))
             if not line:
                 break
             (d1, d2, d3, d4) = struct.unpack(D4REC, line)
         if n_data == 5:
-            line = sys.stdin.read(struct.calcsize(D5REC))
+            line = stdin_bytes.read(struct.calcsize(D5REC))
             if not line:
                 break
             (d1, d2, d3, d4, d5) = struct.unpack(D5REC, line)
         if n_data == 6:
-            line = sys.stdin.read(struct.calcsize(D6REC))
+            line = stdin_bytes.read(struct.calcsize(D6REC))
             if not line:
                 break
             (d1, d2, d3, d4, d5, d6) = struct.unpack(D6REC, line)
         if n_data == 7:
-            line = sys.stdin.read(struct.calcsize(D7REC))
+            line = stdin_bytes.read(struct.calcsize(D7REC))
             if not line:
                 break
             (d1, d2, d3, d4, d5, d6, d7) = struct.unpack(D7REC, line)
@@ -211,7 +220,7 @@ while not interrupted:
         if cpu >= len(last_tsc):
             last_tsc += [0] * (cpu - len(last_tsc) + 1)
         elif tsc < last_tsc[cpu] and tsc_in == 1:
-            print "TSC stepped backward cpu %d !  %d %d" % (cpu,tsc,last_tsc[cpu])
+            print("TSC stepped backward cpu %d !  %d %d" % (cpu,tsc,last_tsc[cpu]))
 
         # provide relative TSC
         if last_tsc[cpu] > 0 and tsc_in == 1:
@@ -223,7 +232,7 @@ while not interrupted:
             last_tsc[cpu] = tsc
 
         if mhz:
-            tsc = tsc / (mhz*1000000.0)
+            tsc = old_div(tsc, (mhz*1000000.0))
 
         args = {'cpu'   : cpu,
                 'tsc'   : tsc,
@@ -239,18 +248,18 @@ while not interrupted:
 
         try:
 
-            if defs.has_key(str(event)): 
-                print defs[str(event)] % args
+            if str(event) in defs: 
+                print(defs[str(event)] % args)
             else:
-                if defs.has_key(str(0)): print defs[str(0)] % args
+                if str(0) in defs: print(defs[str(0)] % args)
         except TypeError:
-            if defs.has_key(str(event)):
-                print defs[str(event)]
-                print args
+            if str(event) in defs:
+                print(defs[str(event)])
+                print(args)
             else:
-                if defs.has_key(str(0)):
-                    print defs[str(0)]
-                    print args
+                if str(0) in defs:
+                    print(defs[str(0)])
+                    print(args)
 
 
-    except IOError, struct.error: sys.exit()
+    except (IOError, struct.error): sys.exit()
-- 
2.41.0


