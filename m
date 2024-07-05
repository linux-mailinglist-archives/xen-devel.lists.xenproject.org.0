Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B70928B83
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2024 17:21:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754378.1162802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPkk3-0000Qc-Ft; Fri, 05 Jul 2024 15:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754378.1162802; Fri, 05 Jul 2024 15:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPkk3-0000Oc-D5; Fri, 05 Jul 2024 15:20:55 +0000
Received: by outflank-mailman (input) for mailman id 754378;
 Fri, 05 Jul 2024 15:20:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A4R/=OF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sPkk1-00005r-9i
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2024 15:20:53 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a2e1b15-3ae2-11ef-8776-851b0ebba9a2;
 Fri, 05 Jul 2024 17:20:51 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-58f9874aeb4so1178733a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jul 2024 08:20:51 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77c8ad6c6esm78100366b.49.2024.07.05.08.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 08:20:47 -0700 (PDT)
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
X-Inumbo-ID: 2a2e1b15-3ae2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720192850; x=1720797650; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OcZcOS3Zfs0qn5whvyKffCaiaSIRTopD2hbn/NMOSac=;
        b=fiKR+IhIQHV5NGy+/YevliOo039PKAOHjc8f8vvmgX5p4V9xoxGHFKa1m2nUPldCxn
         7uzq4ktfNSfuMyiwrTINTspp7u7z3lQTbAm/5WCVhimM2YFt6jFmsYv0NZYxuPOCU48B
         OI6c5I8J7bDHkKDP436BVNcwIX2SDyGlQvJfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720192850; x=1720797650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OcZcOS3Zfs0qn5whvyKffCaiaSIRTopD2hbn/NMOSac=;
        b=qGBPf++B0q6w5/fscGc+utFN0SX/38m8iJUxyFc2IRf8e6YYQB6DdrEVlmhrD55AhQ
         XuYK0Cc7/39Bc9RP7uNjtDkLyGe9+ECIitZQQfCyhODS/je7z/j423jGXI/rt4YNOidD
         FBAryCLlAteJnkol5Nng8BRwzjDcUNynjtnMZki3nF63DkVHkeVg8+QwAi2nz9WlzYXH
         wIYBfhw13vDihdT4G1zD+JoI712nrrVqYhyKORt0ncnNZdAv3t2KOlisByDmpa8hzkhW
         V+25GsmY4HIsgbh3CiUoXJT4j1xVCeVkpa5LqB3uTcnoQKH0xfE/wsdR0l4j2zHz3Ody
         fIeA==
X-Gm-Message-State: AOJu0YzHJL8LGGFCeXIpeCRgU6y33svGou/JvSwe/VejigLmJ2a/A6hF
	bx3ZgcRsIoL9iShfCGq3qJu8zN6wftFwJNR+es23g6Nz4c9Hka876gugZTG3UVlePfkPhfoa33O
	a
X-Google-Smtp-Source: AGHT+IHFfV8n32lBYuoEDVkYpY4UpnOOVGoPJhADeAiwu+PZuCiN4zx8kwRW/ds3I9uR6+zovrlcQg==
X-Received: by 2002:a17:906:40d0:b0:a72:5bb9:b140 with SMTP id a640c23a62f3a-a77ba7123abmr307449966b.54.1720192849948;
        Fri, 05 Jul 2024 08:20:49 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 2/6] build: Fix the version of python checked for by ./configure
Date: Fri,  5 Jul 2024 16:20:33 +0100
Message-Id: <20240705152037.1920276-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240705152037.1920276-1-andrew.cooper3@citrix.com>
References: <20240705152037.1920276-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We previously upped the minimum python version to 2.6, but neglected to
reflect this in ./configure

Fixes: 2a353c048c68 ("tools: Don't use distutils in configure or Makefile")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 tools/configure    | 8 ++++----
 tools/configure.ac | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/configure b/tools/configure
index 6c1084b7b28a..d160ca296202 100755
--- a/tools/configure
+++ b/tools/configure
@@ -8298,15 +8298,15 @@ if test x"${PYTHONPATH}" = x"no"
 then
     as_fn_error $? "Unable to find $PYTHON, please install $PYTHON" "$LINENO" 5
 fi
-{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for python version >= 2.6 " >&5
-printf %s "checking for python version >= 2.6 ... " >&6; }
-`$PYTHON -c 'import sys; sys.exit(eval("sys.version_info < (2, 6)"))'`
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for python version >= 2.7 " >&5
+printf %s "checking for python version >= 2.7 ... " >&6; }
+`$PYTHON -c 'import sys; sys.exit(eval("sys.version_info < (2, 7)"))'`
 if test "$?" != "0"
 then
     python_version=`$PYTHON -V 2>&1`
     { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
 printf "%s\n" "no" >&6; }
-    as_fn_error $? "$python_version is too old, minimum required version is 2.6" "$LINENO" 5
+    as_fn_error $? "$python_version is too old, minimum required version is 2.7" "$LINENO" 5
 else
     { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: yes" >&5
 printf "%s\n" "yes" >&6; }
diff --git a/tools/configure.ac b/tools/configure.ac
index ac0fdc4314c4..be58f06be450 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -385,7 +385,7 @@ PYTHONPATH=$PYTHON
 PYTHON=`basename $PYTHONPATH`
 
 AX_PATH_PROG_OR_FAIL([PYTHONPATH], [$PYTHON])
-AX_CHECK_PYTHON_VERSION([2], [6])
+AX_CHECK_PYTHON_VERSION([2], [7])
 
 AS_IF([test "$cross_compiling" != yes], [
     AX_CHECK_PYTHON_DEVEL()
-- 
2.39.2


