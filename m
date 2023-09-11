Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D9279AA07
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 18:08:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599621.935117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfjSe-0001Gy-Du; Mon, 11 Sep 2023 16:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599621.935117; Mon, 11 Sep 2023 16:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfjSe-0001Dz-9y; Mon, 11 Sep 2023 16:08:28 +0000
Received: by outflank-mailman (input) for mailman id 599621;
 Mon, 11 Sep 2023 16:08:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zO6f=E3=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qfjSc-0001Dt-Cq
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 16:08:26 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f213ba0-50bd-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 18:08:24 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4018af103bcso29382735e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Sep 2023 09:08:24 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a1c740b000000b003ff013a4fd9sm10499212wmc.7.2023.09.11.09.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 09:08:22 -0700 (PDT)
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
X-Inumbo-ID: 6f213ba0-50bd-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1694448503; x=1695053303; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LsdVyIxXkOCViINSF5QWJqkeUffYmbEMfEE5UQFCeYA=;
        b=K4k1TXRxU7W9qsZ8Q0lbsnBUINxRWjBRGe28TC8cIK0XKPkfPhXDz1wsFDVBNChEnc
         CHRFBJrKfpmRBdT2uXTo20ilWIaot9MqgR36bue3ekiadu8M2yfH/D8lYghtszHFfS8V
         o5bEJVjHudg7Vc800dKZrkVr9w4HGbnYo/nbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694448503; x=1695053303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LsdVyIxXkOCViINSF5QWJqkeUffYmbEMfEE5UQFCeYA=;
        b=MsrL7Eghx7/mQ764bn1mMeb9XBp2n4v5xGoKAQpQf8heMFqKKa8QsaBu6X1FvXU345
         0QHYsW90aZ/nVxUgGPpToT7hU/uYlrzgFwjDGmzlYl+gIa2hxcIRRe1gnLYdkrlG3vXC
         PWqEUrgmarnAc4Ui09XIyIoWaEWwRrxtpM5U3AuP3lale72nYF8A4t2TFbTcpA6quIqx
         1xA796PkNY+HsSI5NXHoL/07BAmtbnZjd3qIVNWwhFNzdW+qs6jZStT9d1x748o4pmWR
         1JRdFaXatKM5pABwC6FDELZy5RihaSndABrXxKUD1tI7gGjdCQIOEdbnKQiPxPsjp3Gc
         Qapw==
X-Gm-Message-State: AOJu0Yz6hdtLKISy9SbwjB24jnzT0F9neMPlbOqFatVWfXOX3a25PJDU
	CB+O1x5fgqf7nRLtl8DBcnhVjofg1Y50ChJaBT0=
X-Google-Smtp-Source: AGHT+IGIZXl0Se4q24i9mTW7FWKcWgHkztjomo+neuR4b1WolI1w7D5/CgasEQ1fC/shYE6rh7R0aA==
X-Received: by 2002:a05:600c:245:b0:401:c1e2:f74f with SMTP id 5-20020a05600c024500b00401c1e2f74fmr55409wmj.15.1694448503166;
        Mon, 11 Sep 2023 09:08:23 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [XEN PATCH v2] tools/xentrace/xentrace_format: Add python 3 compatibility
Date: Mon, 11 Sep 2023 17:07:02 +0100
Message-ID: <20230911160701.249853-2-javi.merino@cloud.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolves: xen-project/xen#155

Signed-off-by: Javi Merino <javi.merino@cloud.com>
---
Changes since v1:
   - Remove unneeded import from past.utils to avoid depending on python3's future module.

Tested using the format file in tools/xentrace/formats.  With this patch, both python 2.7.18.6 and python 3.10.12 produce the same output.

 tools/xentrace/xentrace_format | 60 +++++++++++++++++++---------------
 1 file changed, 34 insertions(+), 26 deletions(-)

diff --git a/tools/xentrace/xentrace_format b/tools/xentrace/xentrace_format
index 5ff85ae2e8..83a1b04d0c 100644
--- a/tools/xentrace/xentrace_format
+++ b/tools/xentrace/xentrace_format
@@ -4,11 +4,14 @@
 
 # Program for reformatting trace buffer output according to user-supplied rules
 
+from __future__ import division
+from __future__ import print_function
+from __future__ import unicode_literals
+from builtins import str
 import re, sys, string, signal, struct, os, getopt
 
 def usage():
-    print >> sys.stderr, \
-          "Usage: " + sys.argv[0] + """ defs-file
+    print("Usage: " + sys.argv[0] + """ defs-file
           Parses trace data in binary format, as output by Xentrace and
           reformats it according to the rules in a file of definitions.  The
           rules in this file should have the format ({ and } show grouping
@@ -29,7 +32,7 @@ def usage():
           this script may not be able to keep up with the output of xentrace
           if it is piped directly.  In these circumstances you should have
           xentrace output to a file for processing off-line.
-          """
+          """, file=sys.stderr)
     sys.exit(1)
 
 def read_defs(defs_file):
@@ -49,7 +52,7 @@ def read_defs(defs_file):
 
         m = reg.match(line)
 
-        if not m: print >> sys.stderr, "Bad format file" ; sys.exit(1)
+        if not m: print("Bad format file", file=sys.stderr) ; sys.exit(1)
 
         defs[str(eval(m.group(1)))] = m.group(2)
 
@@ -83,8 +86,8 @@ interrupted = 0
 
 try:
     defs = read_defs(arg[0])
-except IOError, exn:
-    print exn
+except IOError as exn:
+    print(exn)
     sys.exit(1)
 
 # structure of trace record (as output by xentrace):
@@ -117,12 +120,17 @@ TRC_PV_HYPERCALL_SUBCALL = 0x20100e
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
@@ -140,43 +148,43 @@ while not interrupted:
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
@@ -211,7 +219,7 @@ while not interrupted:
         if cpu >= len(last_tsc):
             last_tsc += [0] * (cpu - len(last_tsc) + 1)
         elif tsc < last_tsc[cpu] and tsc_in == 1:
-            print "TSC stepped backward cpu %d !  %d %d" % (cpu,tsc,last_tsc[cpu])
+            print("TSC stepped backward cpu %d !  %d %d" % (cpu,tsc,last_tsc[cpu]))
 
         # provide relative TSC
         if last_tsc[cpu] > 0 and tsc_in == 1:
@@ -239,18 +247,18 @@ while not interrupted:
 
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


