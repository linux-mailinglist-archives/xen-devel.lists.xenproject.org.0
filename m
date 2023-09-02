Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FC8790AD4
	for <lists+xen-devel@lfdr.de>; Sun,  3 Sep 2023 06:59:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594836.928333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qcfBh-0001Im-Aa; Sun, 03 Sep 2023 04:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594836.928333; Sun, 03 Sep 2023 04:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qcfBh-0001GC-7e; Sun, 03 Sep 2023 04:58:17 +0000
Received: by outflank-mailman (input) for mailman id 594836;
 Sat, 02 Sep 2023 16:23:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M48F=ES=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qcTP4-0007ci-Rp
 for xen-devel@lists.xenproject.org; Sat, 02 Sep 2023 16:23:18 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03836172-49ad-11ee-9b0d-b553b5be7939;
 Sat, 02 Sep 2023 18:23:13 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-401187f8071so500015e9.0
 for <xen-devel@lists.xenproject.org>; Sat, 02 Sep 2023 09:23:15 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (public.devonshire.individualpubs.co.uk. [82.68.35.2])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a1c7c0f000000b003feef82bbefsm8307408wmc.29.2023.09.02.09.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Sep 2023 09:23:14 -0700 (PDT)
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
X-Inumbo-ID: 03836172-49ad-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1693671795; x=1694276595; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LgeK+aY1vpTJ3t7aZjZxOVf5kztKqWqhUwyAaFM32YE=;
        b=R+Jo6R8Z9hFDbsw6MNn7yA7JufWOX1oyPanbJ73aOLYbtWGKhRvye2KqZu/hZCHL/l
         UuYnjZ6R89BK8A+jqpw1WnZxBgyGxcHa9jvvVTv/gUUDXnxOTrpB8IIztAq9LRy6Got3
         OXdSG4DIYUvB1GDNnj0v7KdxFn6FbkG7ATX0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693671795; x=1694276595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LgeK+aY1vpTJ3t7aZjZxOVf5kztKqWqhUwyAaFM32YE=;
        b=hRPZD9nM8SCYhw84fXZEmbB7QmuyHQ4inSfGtBAyt945NAEnzj8ZVL0Bal0UUVoIVW
         gLP2Y0IjAIGrGY1SyJYyBnTLOnNU3+2rhc017ZwaA1ZE3ZfVGzrslUKp4gvTWetWzvTN
         AnqkfaE4v2hgS19zvaQqFR34BoUVbs1kQgr2wREG6+ANhTyG2aegz+rL2B0gbrpRayZX
         CpYAcOLvhSt2VGRR/jlbTesAEvBfLAE/u7feH6JfSLQiL/weHA970ouEM0Sco9v2cXfB
         hOOqic6v/OuhACVFwgWkk/Sv8jYWvDnHj2UcMS5Ev2D8hC8tLDHzfWAfvKJxryAvGBuV
         mt7g==
X-Gm-Message-State: AOJu0Yxk+SVHEa5iJ7tFvRrFihVRo9pRtuu9UfAOp5WvyEO/js6y6jNF
	LldikN9uMH/ayqIDtEW57lArwJFVw0cKrLU0q14=
X-Google-Smtp-Source: AGHT+IGxP0iU5Nf0OmsfxKK19LVYO1HSy4TX1yNJ1vVfcvLkhZQ5AsIjnvWDZ6NN/dX8wjp7LsGHjw==
X-Received: by 2002:a7b:c385:0:b0:401:c1e2:f74f with SMTP id s5-20020a7bc385000000b00401c1e2f74fmr4436867wmj.15.1693671794956;
        Sat, 02 Sep 2023 09:23:14 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/misc/xencov_split: Add python 3 compatibility
Date: Sat,  2 Sep 2023 17:21:08 +0100
Message-ID: <20230902162246.15672-1-javi.merino@cloud.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Closes #154

Signed-off-by: Javi Merino <javi.merino@cloud.com>
---

Generating coverage data is a bit broken at the moment.  Depending on
the compiler you are using, you would need "coverage: update gcov info
for newer versions of gcc" (Message-Id:
20230902151351.10325-1-javi.merino@cloud.com) which I just sent to the
list. On top of that, you would have to comment out the freeing of the
init sections due to #168 .

I have tested it with these two fixes and the python2 and python3
create the same outputs.

 tools/misc/xencov_split | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/tools/misc/xencov_split b/tools/misc/xencov_split
index e4f68ebb6e..8f1271bfe7 100755
--- a/tools/misc/xencov_split
+++ b/tools/misc/xencov_split
@@ -1,5 +1,7 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
+from __future__ import print_function
+from builtins import str
 import sys, os, os.path as path, struct, errno
 from optparse import OptionParser
 
@@ -16,7 +18,7 @@ def xencov_split(opts):
 
     input_file = opts.args[0]
 
-    f = open(input_file)
+    f = open(input_file, "rb")
 
     # Magic number
     s = f.read(4)
@@ -31,9 +33,10 @@ def xencov_split(opts):
     f.close()
 
     while content:
-        off = content.find('\x00')
+        off = content.find(b'\x00')
         fmt = bo_prefix + str(off) + 's'
         fn, = struct.unpack_from(fmt, content)
+        fn = fn.decode('utf-8')
         content = content[off+1:]
 
         fmt = bo_prefix + 'I'
@@ -51,14 +54,14 @@ def xencov_split(opts):
         dir = opts.output_dir + path.dirname(fn)
         try:
             os.makedirs(dir)
-        except OSError, e:
+        except OSError as e:
             if e.errno == errno.EEXIST and os.path.isdir(dir):
                 pass
             else:
                 raise
 
         full_path = dir + '/' + path.basename(fn)
-        f = open(full_path, "w")
+        f = open(full_path, "wb")
         f.write(payload)
         f.close()
 
@@ -89,8 +92,8 @@ def main():
 if __name__ == "__main__":
     try:
         sys.exit(main())
-    except Exception, e:
-        print >>sys.stderr, "Error:", e
+    except Exception as e:
+        print("Error:", e, file=sys.stderr)
         sys.exit(1)
     except KeyboardInterrupt:
         sys.exit(1)
-- 
2.41.0


