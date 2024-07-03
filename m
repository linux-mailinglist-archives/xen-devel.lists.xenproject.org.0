Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2690926C21
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 00:55:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753356.1161613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP8t0-0004sR-Ij; Wed, 03 Jul 2024 22:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753356.1161613; Wed, 03 Jul 2024 22:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP8t0-0004pW-Et; Wed, 03 Jul 2024 22:55:38 +0000
Received: by outflank-mailman (input) for mailman id 753356;
 Wed, 03 Jul 2024 22:55:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i9qc=OD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sP8sz-0004Kt-Mt
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 22:55:37 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ca5a0bf-398f-11ef-bbf9-fd08da9f4363;
 Thu, 04 Jul 2024 00:55:37 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a7194ce90afso1946666b.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 15:55:37 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72aaf638f3sm549984566b.89.2024.07.03.15.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 15:55:33 -0700 (PDT)
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
X-Inumbo-ID: 5ca5a0bf-398f-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720047335; x=1720652135; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFUGiegqbMuC9H9PbqyiLhEoErZkG5s/nrc/O3c/qqA=;
        b=OxGXtAVJ4Nv5v67J+5JiaUB/8NAldl+flItHWUuPHqRHBjrpVZDA4KGltCfcWd7oNW
         NJs8AAjQuXDD5BMy5OKoCPheo6W14jKvIeWWQq6g/xl13EYHaIrnliC+7zJ0ulXxQdwc
         7+k+S8mlkP5ZkkNZLkWBsuQg12Mqn934cTA+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720047335; x=1720652135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFUGiegqbMuC9H9PbqyiLhEoErZkG5s/nrc/O3c/qqA=;
        b=AQmDgDnyO7CQc22kjkmO75bn8pdiqn6L/WoXqoDJPl8dRU7+mRxl83PaBsCwBi5k2i
         J3DE4+KCenjGK+0IS/vHUas7Y5Uu0xPrUoJP++9jdqVa3xDpLwlTvS8jzaDoMncEx7+V
         ziwQC0Ua7aLKPfpVL9rdcHLNGu4+I1wAYUe6pCe0HjuyJCgW7K0dwd07UdeccdVi+yXL
         IrQVgRLpmgcHTTI12RaMnToY/0sA5h2Z99YYQCVQQOQF6nBFcnQje2Z/ZuVnTz0oQAb2
         NfttDK67NiSmJf9hw2xJM9TmQ/J6/V6xSRe0MYe3HhCA5JodFhIaDMq3vNWHLkExnlvJ
         S/eg==
X-Gm-Message-State: AOJu0Yy+6VUpCzflH4zg9x3KQ2Qr3jNSq/z7PYrxF7rdvi5CcXvNrgDF
	iOcaXvsUFUD0YSwQUGEwa4SjaMtxlfB97pedlIOgGWW76oQBTL+l5x9CO3EKVCD7ROHwdIxZ0kd
	w
X-Google-Smtp-Source: AGHT+IETyXGsHmaw2eGrnOW4zIkrlxRNxnzOyZgqrp1bog7Onu2fsOpqcWadq5jB2XvIpNO5yxp0ww==
X-Received: by 2002:a17:907:31c6:b0:a72:b340:8827 with SMTP id a640c23a62f3a-a75144398c7mr1014444966b.41.1720047335609;
        Wed, 03 Jul 2024 15:55:35 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 2/2] build/mkheader: Fix Syntax/DeprecationWarnings
Date: Wed,  3 Jul 2024 23:55:25 +0100
Message-Id: <20240703225525.1759907-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240703225525.1759907-1-andrew.cooper3@citrix.com>
References: <20240703225525.1759907-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With Python 3.11, the following is emitted during a build:

  tools/include/xen-foreign/mkheader.py:162: DeprecationWarning: invalid escape sequence '\s'
    regex = "#define\s+%s\\b" % define;
  tools/include/xen-foreign/mkheader.py:177: DeprecationWarning: invalid escape sequence '\*'
    input = re.compile("/\*(.*?)\*/", re.S).sub("", input)
  tools/include/xen-foreign/mkheader.py:178: DeprecationWarning: invalid escape sequence '\s'
    input = re.compile("\n\s*\n", re.S).sub("\n", input);
  tools/include/xen-foreign/mkheader.py:182: DeprecationWarning: invalid escape sequence '\s'
    regex = "union\s+%s\s*\{(.*?)\n\};" % union;
  tools/include/xen-foreign/mkheader.py:192: DeprecationWarning: invalid escape sequence '\s'
    regex = "(?:#ifdef ([A-Z_]+))?\nstruct\s+%s\s*\{(.*?)\n\};" % struct;
  tools/include/xen-foreign/mkheader.py:218: DeprecationWarning: invalid escape sequence '\s'
    output = re.sub("\\b(union\s+%s)\\b" % union, "\\1_%s" % arch, output);
  tools/include/xen-foreign/mkheader.py:222: DeprecationWarning: invalid escape sequence '\s'
    output = re.sub("\\b(struct\s+%s)\\b" % struct, "\\1_%s" % arch, output);

Python regexes should use raw strings.  Convert all regexes, and drop escaped
backslashes.  Note that regular escape sequences are interpreted normally when
parsing a regex, so \n even in a raw-string regex is a newline.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 tools/include/xen-foreign/mkheader.py | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/tools/include/xen-foreign/mkheader.py b/tools/include/xen-foreign/mkheader.py
index 3a33df4984a2..128b0f3014c2 100644
--- a/tools/include/xen-foreign/mkheader.py
+++ b/tools/include/xen-foreign/mkheader.py
@@ -159,7 +159,7 @@ defined = {}
 # add defines to output
 for line in re.findall("#define[^\n]+", input):
     for define in defines:
-        regex = "#define\s+%s\\b" % define
+        regex = r"#define\s+%s\b" % define
         match = re.search(regex, line)
         if None == match:
             continue
@@ -168,18 +168,18 @@ for line in re.findall("#define[^\n]+", input):
             replace = define + "_" + arch.upper()
         else:
             replace = define + "_" + arch
-        regex = "\\b%s\\b" % define
+        regex = r"\b%s\b" % define
         output += re.sub(regex, replace, line) + "\n"
 output += "\n"
 
 # delete defines, comments, empty lines
 input = re.sub("#define[^\n]+\n", "", input)
-input = re.compile("/\*(.*?)\*/", re.S).sub("", input)
-input = re.compile("\n\s*\n", re.S).sub("\n", input)
+input = re.compile(r"/\*(.*?)\*/", re.S).sub("", input)
+input = re.compile(r"\n\s*\n", re.S).sub("\n", input)
 
 # add unions to output
 for union in unions:
-    regex = "union\s+%s\s*\{(.*?)\n\};" % union
+    regex = r"union\s+%s\s*\{(.*?)\n\};" % union
     match = re.search(regex, input, re.S)
     if None == match:
         output += "#define %s_has_no_%s 1\n" % (arch, union)
@@ -189,7 +189,7 @@ for union in unions:
 
 # add structs to output
 for struct in structs:
-    regex = "(?:#ifdef ([A-Z_]+))?\nstruct\s+%s\s*\{(.*?)\n\};" % struct
+    regex = r"(?:#ifdef ([A-Z_]+))?\nstruct\s+%s\s*\{(.*?)\n\};" % struct
     match = re.search(regex, input, re.S)
     if None == match or \
            (match.group(1) is not None and match.group(1) not in defined):
@@ -211,20 +211,20 @@ for define in defines:
         replace = define + "_" + arch.upper()
     else:
         replace = define + "_" + arch
-    output = re.sub("\\b%s\\b" % define, replace, output)
+    output = re.sub(r"\b%s\b" % define, replace, output)
 
 # replace: unions
 for union in unions:
-    output = re.sub("\\b(union\s+%s)\\b" % union, "\\1_%s" % arch, output)
+    output = re.sub(r"\b(union\s+%s)\b" % union, r"\1_%s" % arch, output)
 
 # replace: structs + struct typedefs
 for struct in structs:
-    output = re.sub("\\b(struct\s+%s)\\b" % struct, "\\1_%s" % arch, output)
-    output = re.sub("\\b(%s)_t\\b" % struct, "\\1_%s_t" % arch, output)
+    output = re.sub(r"\b(struct\s+%s)\b" % struct, r"\1_%s" % arch, output)
+    output = re.sub(r"\b(%s)_t\b" % struct, r"\1_%s_t" % arch, output)
 
 # replace: integer types
 for old, new in inttypes[arch]:
-    output = re.sub("\\b%s\\b" % old, new, output)
+    output = re.sub(r"\b%s\b" % old, new, output)
 
 # print results
 with open(outfile, "w") as f:
-- 
2.39.2


