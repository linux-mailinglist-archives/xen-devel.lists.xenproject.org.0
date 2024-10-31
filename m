Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F23809B80AA
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 17:55:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828838.1243865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6YS5-0002ol-Qt; Thu, 31 Oct 2024 16:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828838.1243865; Thu, 31 Oct 2024 16:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6YS5-0002ld-Nr; Thu, 31 Oct 2024 16:55:17 +0000
Received: by outflank-mailman (input) for mailman id 828838;
 Thu, 31 Oct 2024 16:55:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7hTS=R3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t6YS3-0002lT-LI
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 16:55:15 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2ffe69f-97a8-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 17:55:09 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9a16b310f5so163278566b.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 09:55:09 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e565e0940sm85260366b.104.2024.10.31.09.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 09:55:07 -0700 (PDT)
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
X-Inumbo-ID: e2ffe69f-97a8-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzQiLCJoZWxvIjoibWFpbC1lajEteDYzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImUyZmZlNjlmLTk3YTgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzkzNzA5LjI0Mjk4Niwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730393708; x=1730998508; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=09370oDJSKlXbcjbRkgjjIjt3qFIEKrQlsjk/b2aKC0=;
        b=ngTeWNDrWkiPDj6+Isu1WoPt/+MnPdJ/LumbDxBkOIvJgXbc9aCG28K3jJZ8LUNmMV
         wM1VOUrbeHwHFpZLsvIiSTt1x2tTyq3gQCGUYDYt30vv5cKyj5wovyWzmGgKIu3jr0+7
         gAJIQpsNtVvcHZjPZbU5VJPjgYXvWxSps2mNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730393708; x=1730998508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=09370oDJSKlXbcjbRkgjjIjt3qFIEKrQlsjk/b2aKC0=;
        b=qjNsbRCk/hYHbxNLIp7yvrpqPhZx4tXftOPJXNAfXCygSHhSxk8HGeTb5h0Af5K5s8
         PsW3FBLQ1+fxiS2SD0BQHiD8cpCocaJuzyhfCqjrotSkiI5jDZmbNwoohXYoBsqkYBZf
         pK2oFH/kqgFWlfEHlG8xHJZpB5mxdDA+Ar6AsZcwLFF588Yi0lVaAOHMYetL8c6d/+Yq
         7/rFCszEK8UIFUn+I9dBZiJfnwW54YHFuBpANb36f95mpKlawt9G8NJCL8MfWI8TlHLj
         sYGKEcthFZ75A3MCVLu+i4Q4R1qk3Y+rgXaG+t8aBVt/y9iceDcbwNWUBlwEkP5ixAUo
         6eYA==
X-Gm-Message-State: AOJu0YzIUJvEnx5xTD6KwGotXZXYVKmbvNiNgZdR1oeX83HB1hhGRl+R
	U+qeMmIhrAmsNRjruy7ZVqv4ofBzGHPUBEikV1PliiqMvd7Ycs3MK9O48QfjQkuVni/bOs7ZKKS
	k
X-Google-Smtp-Source: AGHT+IE81w4gpz1KZqxbqDxtYfZJOAujfRKAoZh46C9nZaY8Fki5t56vn8OhbbYaGX595T2agupaxw==
X-Received: by 2002:a17:907:1c04:b0:a9a:423:3278 with SMTP id a640c23a62f3a-a9e50b948c5mr353741866b.49.1730393708219;
        Thu, 31 Oct 2024 09:55:08 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] CI: Fix cppcheck parallel build more
Date: Thu, 31 Oct 2024 16:55:05 +0000
Message-Id: <20241031165505.3007713-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent cppcheck run was found to fail:

  https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/8237167472

with:

  "type mismatch! call is<type>() before get<type>()" && is<std::string>()
  make[3]: *** [arch/x86/boot/Makefile:28: arch/x86/boot/reloc-trampoline.32.o] Error 1

This turns out to be a parallel build issue, combined with a recent change to
x86.  Notably, we now have a case where we build both:

  CC      arch/x86/boot/reloc-trampoline.32.o
  CC      arch/x86/boot/reloc-trampoline.o

from the same original C file, and cppcheck uses the source C file as the key
for generating it's intermediate files.

Switch cppcheck to use the object file as the unique key instead.

Fixes: 45bfff651173 ("xen/misra: xen-analysis.py: fix parallel analysis Cppcheck errors")
Fixes: db8acf31f96b ("x86/boot: Reuse code to relocate trampoline")
Suggested-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Luca Fancellu <luca.fancellu@arm.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1522120661

which seems to suggest that cppcheck is still happy.
---
 xen/tools/cppcheck-cc.sh | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/tools/cppcheck-cc.sh b/xen/tools/cppcheck-cc.sh
index 16a965edb7ec..8a58c3aa86b3 100755
--- a/xen/tools/cppcheck-cc.sh
+++ b/xen/tools/cppcheck-cc.sh
@@ -26,6 +26,7 @@ EOF
 
 BUILD_DIR=""
 CC_FILE=""
+OBJ_FILE=""
 COMPILER=""
 CPPCHECK_HTML="n"
 CPPCHECK_PLAT_PATH=""
@@ -56,6 +57,7 @@ do
         then
             # This must be the path to the obj file, turn off flag and save path
             OBJTREE_PATH="$(dirname "${OPTION}")"
+            OBJ_FILE="$(basename "${OPTION}")"
             obj_arg_content="n"
         fi
         # Forward any argument to the compiler
@@ -177,12 +179,12 @@ then
     done
     if [ "${IGNORE_PATH}" = "n" ]
     then
-        JDB_FILE="${OBJTREE_PATH}/$(basename "${CC_FILE}".json)"
+        JDB_FILE="${OBJTREE_PATH}/${OBJ_FILE}.json"
 
         # Prepare the Json Compilation Database for the file
         create_jcd "${COMPILER} ${FORWARD_FLAGS}"
 
-        out_file="${OBJTREE_PATH}/$(basename "${CC_FILE%.c}".cppcheck.txt)"
+        out_file="${OBJTREE_PATH}/${OBJ_FILE}.cppcheck.txt"
 
         # Select the right target platform, ARCH is generated from Xen Makefile
         case ${ARCH} in
@@ -211,7 +213,7 @@ then
         fi
 
         # Generate build directory for the analysed file
-        cppcheck_build_dir="${BUILD_DIR}/${OBJTREE_PATH}"
+        cppcheck_build_dir="${BUILD_DIR}/${OBJTREE_PATH}/${OBJ_FILE}"
         mkdir -p "${cppcheck_build_dir}"
 
         # Shellcheck complains about missing quotes on CPPCHECK_TOOL_ARGS, but

base-commit: 2478bed83fc6d8be1d129d9a9617eda2ab3c9790
-- 
2.39.5


