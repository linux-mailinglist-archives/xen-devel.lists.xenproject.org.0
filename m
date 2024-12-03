Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 893439E1738
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 10:22:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847520.1262621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIP6l-0004CT-Kj; Tue, 03 Dec 2024 09:22:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847520.1262621; Tue, 03 Dec 2024 09:22:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIP6l-0004AX-GZ; Tue, 03 Dec 2024 09:22:15 +0000
Received: by outflank-mailman (input) for mailman id 847520;
 Tue, 03 Dec 2024 09:22:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yzh2=S4=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tIP6j-0003Be-MH
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 09:22:13 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1446cfc6-b158-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 10:22:12 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5cf6f367f97so6273392a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 01:22:13 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.146])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa599801591sm590543266b.91.2024.12.03.01.22.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 03 Dec 2024 01:22:12 -0800 (PST)
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
X-Inumbo-ID: 1446cfc6-b158-11ef-a0d3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733217732; x=1733822532; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/6Bk/TIHmUcRxz6rQ6nK013EsFPgzobZnpt1ORjNTg=;
        b=Ns0faxOLv/DHDL/hqcwnpNQ3liJ2RfEeerFr/34ttx5RJ1+/MeAKddbDKOrl2WfG6n
         d43uB0eBHdycZG1VAMySXGfehlWPhi9b3B9Jw4aNI/CYAuDP7ocxRYhNJnw+I5iBF/v5
         1Vnp7RlQiJGH9byGA15iwLiwvBbwA8z7f9qgsRazuBWwzcsftQf6ijzIqLw3HH7ddYOC
         /eHicsE6K01d2pxaEg7XLMgTIa01Yn1Z2WRNkXKCAo7ViEveCgD+sq/P9qdePe9QfLsu
         MRTCI7nmuI8dbNweZbrgltQAToBJLa/Kk3MEh4OXoVcEij5uOKf5K19CW6ScLN+LPkW6
         8hKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733217732; x=1733822532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/6Bk/TIHmUcRxz6rQ6nK013EsFPgzobZnpt1ORjNTg=;
        b=PRFGVfn2u4qyHzB6Psi4MS0990fQrPPSQGviSSf313HUAPpXoV5FC3GehFczY/s9k0
         tHFUztD/VA/r0NO92Ix+fxutAOCbG0QSlwL2ctY/nXeNauQDXfbbAT7ILNV8Omjee5IP
         6duBsqz/8ObyF5Ih44fis/zPm3fD6vgGHjNwY+dAWzFA9IFy33a9nm35vCQtYOzuylM8
         oqg3lDipstHfl7yAvg+GbmY8RTuq1c5c0x5vhUHdN5KeMflx3veMzcm2ZGIF6viZab2V
         7N+H5qkuNNwTrxY/bC0/0lTUgiT4foLRhGGXR4LtDj6XoLFzWA0Zj9QHVJKXbVphX26P
         K5gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsu8lwBwrh3lfJCWWcLvoEJmJMbu4rB6iVTITibiVnbwOy67CnCmiXUgORgfMuaGhh3rgRXiFD988=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxivcle1vKA+1EMRaM+Wd8KGhn5iNDQxr/COMpgey2qLNCsQcax
	iNaKZDSPPvb0+uLfAc0HicN/R+fte85jO3WRqdCIajM2Eyq1tgwrQUJL3bXuA08=
X-Gm-Gg: ASbGncsqA/x2JjpFWittxkRGfq7wLC7nu7kpUWkfBf5eeUBCeMPKHDtSwx/WJ0i91GZ
	dglcSBSjRRuoC7iZLcMudnErhBy5ROGnCmJmjDoLt8JbSvQvUpuEuyFKAE3UpflH7H6SnFLIK31
	J6HUUj7xSQwLvp3dNE8cEwy57rZ5oafGhXjeXH+qjTb7Ppdn+hEIwQ7Gub7sHg2FTnQxwptAJc0
	t41OZ+96dMXhim9/DY44ob29jMDR6XK1RxuUOmPy8jhdYuO0pj6dudCnKfkoVcfQIbOneWG
X-Google-Smtp-Source: AGHT+IHoObOZjdwlMr3aboz/4y2YVDb50eN7RHCCjr/fwpXa6yi9c/pFOSALP0ifpRtK2osZHvNbbA==
X-Received: by 2002:a17:906:30cb:b0:aa5:297a:ac65 with SMTP id a640c23a62f3a-aa5f7d4ec91mr122028566b.19.1733217732604;
        Tue, 03 Dec 2024 01:22:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	xen-devel@lists.xenproject.org,
	qemu-ppc@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/7] tests/qtest/fuzz: Remove legacy '-machine foo,accel=bar'
Date: Tue,  3 Dec 2024 10:21:49 +0100
Message-ID: <20241203092153.60590-4-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241203092153.60590-1-philmd@linaro.org>
References: <20241203092153.60590-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit 6f6e1698a68 ("vl: configure accelerators from -accel
options") we prefer the '-accel bar' command line option.

Replace '-machine foo,accel=bar' -> '-machine foo -accel bar' in
fuzzer scripts and tests.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/fuzz/generic_fuzz.c                | 2 +-
 tests/qtest/fuzz/i440fx_fuzz.c                 | 2 +-
 tests/qtest/fuzz/qos_fuzz.c                    | 2 +-
 scripts/oss-fuzz/output_reproducer.py          | 2 --
 scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py | 6 +++---
 5 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index d107a496da6..a8737a4c463 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -919,7 +919,7 @@ static GString *generic_fuzz_cmdline(FuzzTarget *t)
         usage();
     }
     g_string_append_printf(cmd_line, " -display none \
-                                      -machine accel=qtest, \
+                                      -accel qtest \
                                       -m 512M %s ", getenv("QEMU_FUZZ_ARGS"));
     return cmd_line;
 }
diff --git a/tests/qtest/fuzz/i440fx_fuzz.c b/tests/qtest/fuzz/i440fx_fuzz.c
index 155fe018f80..b5487996625 100644
--- a/tests/qtest/fuzz/i440fx_fuzz.c
+++ b/tests/qtest/fuzz/i440fx_fuzz.c
@@ -145,7 +145,7 @@ static void i440fx_fuzz_qos(QTestState *s,
     pciconfig_fuzz_qos(s, bus, Data, Size);
 }
 
-static const char *i440fx_qtest_argv = TARGET_NAME " -machine accel=qtest"
+static const char *i440fx_qtest_argv = TARGET_NAME " -accel qtest"
                                        " -m 0 -display none";
 static GString *i440fx_argv(FuzzTarget *t)
 {
diff --git a/tests/qtest/fuzz/qos_fuzz.c b/tests/qtest/fuzz/qos_fuzz.c
index d3839bf9994..9267e63889d 100644
--- a/tests/qtest/fuzz/qos_fuzz.c
+++ b/tests/qtest/fuzz/qos_fuzz.c
@@ -84,7 +84,7 @@ static GString *qos_build_main_args(void)
     }
     /* Prepend the arguments that we need */
     g_string_prepend(cmd_line,
-            TARGET_NAME " -display none -machine accel=qtest -m 64 ");
+            TARGET_NAME " -display none -accel qtest -m 64 ");
     return cmd_line;
 }
 
diff --git a/scripts/oss-fuzz/output_reproducer.py b/scripts/oss-fuzz/output_reproducer.py
index e8ef76b3413..840da3b5a5b 100755
--- a/scripts/oss-fuzz/output_reproducer.py
+++ b/scripts/oss-fuzz/output_reproducer.py
@@ -64,8 +64,6 @@ def c_reproducer(name, args, trace):
 
     # libqtest will add its own qtest args, so get rid of them
     args = args.replace("-accel qtest","")
-    args = args.replace(",accel=qtest","")
-    args = args.replace("-machine accel=qtest","")
     args = args.replace("-qtest stdio","")
     result.append("""QTestState *s = qtest_init("{}");""".format(args))
     for l in trace.splitlines():
diff --git a/scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py b/scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py
index b154a25508f..f3813944d3b 100755
--- a/scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py
+++ b/scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py
@@ -5,15 +5,15 @@
 Use this to convert qtest log info from a generic fuzzer input into a qtest
 trace that you can feed into a standard qemu-system process. Example usage:
 
-QEMU_FUZZ_ARGS="-machine q35,accel=qtest" QEMU_FUZZ_OBJECTS="*" \
+QEMU_FUZZ_ARGS="-machine q35 -accel qtest" QEMU_FUZZ_OBJECTS="*" \
         ./i386-softmmu/qemu-fuzz-i386 --fuzz-target=generic-pci-fuzz
 # .. Finds some crash
 QTEST_LOG=1 FUZZ_SERIALIZE_QTEST=1 \
-QEMU_FUZZ_ARGS="-machine q35,accel=qtest" QEMU_FUZZ_OBJECTS="*" \
+QEMU_FUZZ_ARGS="-machine q35 -accel qtest" QEMU_FUZZ_OBJECTS="*" \
         ./i386-softmmu/qemu-fuzz-i386 --fuzz-target=generic-pci-fuzz
         /path/to/crash 2> qtest_log_output
 scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py qtest_log_output > qtest_trace
-./i386-softmmu/qemu-fuzz-i386 -machine q35,accel=qtest \
+./i386-softmmu/qemu-fuzz-i386 -machine q35 -accel qtest \
         -qtest stdio < qtest_trace
 
 ### Details ###
-- 
2.45.2


