Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCFA792FC9
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 22:18:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595825.929446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdcUL-0001py-O2; Tue, 05 Sep 2023 20:17:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595825.929446; Tue, 05 Sep 2023 20:17:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdcUL-0001me-KS; Tue, 05 Sep 2023 20:17:29 +0000
Received: by outflank-mailman (input) for mailman id 595825;
 Tue, 05 Sep 2023 20:17:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=91v+=EV=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qdcUK-0001mY-2W
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 20:17:28 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a859cf0-4c29-11ee-9b0d-b553b5be7939;
 Tue, 05 Sep 2023 22:17:25 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-307d20548adso2471018f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Sep 2023 13:17:25 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (cpc92302-cmbg19-2-0-cust781.5-4.cable.virginm.net. [82.1.211.14])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a5d46c7000000b0031accc7228asm18276300wrs.34.2023.09.05.13.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 13:17:24 -0700 (PDT)
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
X-Inumbo-ID: 3a859cf0-4c29-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1693945045; x=1694549845; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/KfqP95JahvULL+583DSkWljDAxm9MZrxXWX/SVz384=;
        b=gYpQcTWLk+LVhj104NK+S4F/M4lnzrzRt7Njio+3M71rVMYo7vFH15x4Eq77dKcpIS
         a3z/H5KIGiSH4KcrTpnTYbIzfcSbEGzud9AfloTS8bNO2wkXzR2O/UpMrzZWBhtwMGgr
         VGDwPwpTvFMIqlvDBGXzK7LJCNX5/rmsSObDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693945045; x=1694549845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/KfqP95JahvULL+583DSkWljDAxm9MZrxXWX/SVz384=;
        b=KzZcwpIHaytETluh9WbJNWMcQxudfs2h1gYq/ZGWDAEBr7rxp1Rkc+lNEKO5jtbpLL
         0eDcDDvksyn12N17WbR/2NDZAFrwOlXneKhD/w/9BIumD8vGjPdpkKU+/kZqbmuuquqp
         LNh/sFlCNZRbZhymFwYv+MzmTLL5DakxNkt8Q+PmMsgbz6ZU0/lVQ1/pLrYRrzIKqlxo
         +jBKOTkNR0KBt9JhMAAmO84UDL41fRES0SkgHcHoK3rWknl4mKYrkyFBZEimCEDdzfeQ
         QmC2LU2ppUQrWQEGNCvw5gH6ueRu2FDMwn9D+yvd2IFjrZOuRbtml/zHle3HUZ+gFLt4
         b6Rw==
X-Gm-Message-State: AOJu0YyUgHduQh+qEjNOyBtDZMtA/Ni2pIKCBF4qAIQ+lsw2l3WSJa+m
	DQIgv86fekFfvmyiVaKVR5uZep+/oi/YdqBRXcA=
X-Google-Smtp-Source: AGHT+IFBW8XfZ2BPrde/X1D0kHod3Df3PZ/NfMGOJjnw2za8CXKCiQiEHC2toZNLQJs/TIEeFKem7w==
X-Received: by 2002:adf:ed4e:0:b0:31a:dbd8:95d4 with SMTP id u14-20020adfed4e000000b0031adbd895d4mr650990wro.12.1693945044884;
        Tue, 05 Sep 2023 13:17:24 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Javi Merino <javi.merino@cloud.com>
Subject: [PATCH v2] tools/misc/xencov_split: Add python 3 compatibility
Date: Tue,  5 Sep 2023 21:15:37 +0100
Message-ID: <20230905201653.98425-1-javi.merino@cloud.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Closes #154

Signed-off-by: Javi Merino <javi.merino@cloud.com>
---

Changes since v1:
  - Don't touch the shebang.

 tools/misc/xencov_split | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/tools/misc/xencov_split b/tools/misc/xencov_split
index e4f68ebb6e..a921e8ef44 100755
--- a/tools/misc/xencov_split
+++ b/tools/misc/xencov_split
@@ -1,5 +1,7 @@
 #!/usr/bin/env python
 
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


