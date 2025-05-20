Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10180ABE536
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 22:53:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991134.1375064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHTxA-0006vo-8o; Tue, 20 May 2025 20:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991134.1375064; Tue, 20 May 2025 20:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHTxA-0006qk-2r; Tue, 20 May 2025 20:52:48 +0000
Received: by outflank-mailman (input) for mailman id 991134;
 Tue, 20 May 2025 20:52:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BmRr=YE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uHTx9-0006hP-90
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 20:52:47 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 612c3e36-35bc-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 22:52:45 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a36efcadb8so2140590f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 13:52:45 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a3674fed67sm13346626f8f.89.2025.05.20.13.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 13:52:43 -0700 (PDT)
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
X-Inumbo-ID: 612c3e36-35bc-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747774364; x=1748379164; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfhsUGiiQGKcqNXvuoCj4gQfcfj05NuHnllW0lUrwak=;
        b=sVx8AfwfaAV9Pr26TRafSsqLLvLS0Ugl8OPqPxMjY8eZgk0Sm12jhYhnhOqFN/OPQU
         O1rPC40/dapnd4HKI6JID+MqO8wJHG9Up4rErDPnqN8OgAgAjPIW4PsOafn+6hyltcrA
         xYnf2pyBhBkioDpwieUPMlb++h0u1gJcNF3J4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747774364; x=1748379164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QfhsUGiiQGKcqNXvuoCj4gQfcfj05NuHnllW0lUrwak=;
        b=i4+Y9sl6Huir9D19Vl48kGKNv6H0bXmWGP/R5Xaf1/xcq9kjxA9KVzK4T9EZBSqAYf
         vv10kEdytW9GxsuorIznQMVi9vRIVaLOxlQ0IaWpIT1TWmw+1rl0Imhi7kQCnwY2FOZx
         BPD7hP20X/MABkpFGgGvXxp+h89dWccB5GeiADLfvZgHtWmvjOr5vTcleczXe/YKHOo/
         25MzqG+m29e77YHb4bkZ6QIzwxQU3mYAFMya3xAfIlF1E32TVgWl9x2cTBqrKFOVsLru
         w+Z4dTCTbjow2Uh71ro93DAudyLNFKWbXuAMA/F9/by8PgQekgk7BaXEXYFLxCz9AQN/
         /t/Q==
X-Gm-Message-State: AOJu0YyhOyeouSg9T7DMjYBZbDjoK8CTT1QKPrUWQ3UA4f135ztGpmjp
	Vbztu4nrdLs3sTPV6reowg2u0dTqpL4FyAgxUAPRaEB0CfCQKktl/346q7UzGKPEyH/0u8v1pdE
	1b/dt
X-Gm-Gg: ASbGncuqtEVGPRNz58midjjozcB1hK6sf5F/u7/jW9QzGcMYWXc1sx3piPuT5t/1yCv
	oZ3FXSeEEXhTfng21VEfd7o8xrQIbKirQPlo8DqwOgIjpSyaWqWh28UuUD/K5IcjnDmwoGzpQ7N
	BeqD8+z0LfCuwDIJ4eq2U2RqZhQ5ONNBzKyr1MnZFusjObWhTIkqX9PEEkkiheWSIrzpud1E29w
	fpZnlw+dfitvcNzyZyiOc/eLAvvXZBfCzp3mPJ8NuPmhHZvAyItvsX6AsSuuVLTyUgofBVD+WAU
	abYd+txGdCtlQ2bA5iiAjVIo9tZjsKkO5hIZpFHwet7UllPeSrV2Qs217SnGNkjnhH5RbBVhK1x
	I36PxkR4ZlHbE67ZrrA33SiYt
X-Google-Smtp-Source: AGHT+IHZzkHzMWJczmaSAVLmaheYUXHfYvPj47cipkwBJABK0sJZa5J9y+KNAjZkNCfUlFKBK2hxfA==
X-Received: by 2002:a05:6000:1846:b0:38f:4d20:4a17 with SMTP id ffacd0b85a97d-3a35c8218b5mr14937603f8f.13.1747774364176;
        Tue, 20 May 2025 13:52:44 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 3/3] CI: Drop custom handling of tools/tests
Date: Tue, 20 May 2025 21:52:39 +0100
Message-Id: <20250520205239.203253-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250520205239.203253-1-andrew.cooper3@citrix.com>
References: <20250520205239.203253-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... and use them from their installed location.

The full recusive copy of tools/tests brings in all build and intermediate
artefacts.  e.g. for test-tsx alone:

  ./tests/tsx
  ./tests/tsx/.test-tsx.o.d
  ./tests/tsx/test-tsx.o
  ./tests/tsx/.gitignore
  ./tests/tsx/test-tsx
  ./tests/tsx/Makefile
  ./tests/tsx/test-tsx.c

duplicating the test binary which is also in ./usr/lib/xen/tests

Rewrite run-tools-tests to run tests from their installed
location (/usr/lib/xen/tests in alpine), which effectively removes the outer
loop over $dir.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

This doesn't change any tests that run, although in the XML we get two fewer skips.

Both skips can be fixed by giving vpci and x86_emulator some install targets
---
 automation/scripts/build           |  1 -
 automation/scripts/qubes-x86-64.sh |  7 +++--
 automation/scripts/run-tools-tests | 43 +++++++++++++-----------------
 3 files changed, 22 insertions(+), 29 deletions(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index cdb8cd7c722b..0e7494ff6d87 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -109,6 +109,5 @@ else
     # even though dist/ contains everything, while some containers don't even
     # build Xen
     (cd dist/install; find | cpio -o -H newc | gzip) > binaries/xen-tools.cpio.gz
-    cp -r tools/tests binaries/
     collect_xen_artefacts
 fi
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index aa47ba6bf5c0..577a00238a75 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -136,7 +136,7 @@ done
         passed="test passed"
         domU_check=""
         dom0_check="
-/tests/run-tools-tests /tests /tmp/tests-junit.xml && echo \"${passed}\"
+/root/run-tools-tests /usr/lib/xen/tests /tmp/tests-junit.xml && echo \"${passed}\"
 nc -l -p 8080 < /tmp/tests-junit.xml >/dev/null &
 "
         if [ "${test_variant}" = "tools-tests-pvh" ]; then
@@ -195,9 +195,8 @@ cat binaries/xen-tools.cpio.gz >> binaries/dom0-rootfs.cpio.gz
 # test-local configuration
 mkdir -p rootfs
 cd rootfs
-mkdir -p boot etc/local.d
-cp -ar ../binaries/tests .
-cp -a ../automation/scripts/run-tools-tests tests/
+mkdir -p boot etc/local.d root
+cp -a ../automation/scripts/run-tools-tests root/
 
 echo "#!/bin/bash
 
diff --git a/automation/scripts/run-tools-tests b/automation/scripts/run-tools-tests
index 770e97c3e943..8d7aa8fa5140 100755
--- a/automation/scripts/run-tools-tests
+++ b/automation/scripts/run-tools-tests
@@ -12,30 +12,25 @@ printf '<?xml version="1.0" encoding="UTF-8"?>\n' > "$xml_out"
 printf '<testsuites name="tools.tests">\n' >> "$xml_out"
 printf ' <testsuite name="tools.tests">\n' >> "$xml_out"
 failed=
-for dir in "$1"/*; do
-    [ -d "$dir" ] || continue
-    echo "Running test in $dir"
-    printf '  <testcase name="%s">\n' "$dir" >> "$xml_out"
-    ret=
-    for f in "$dir"/*; do
-        [ -f "$f" ] || continue
-        [ -x "$f" ] || continue
-        "$f" 2>&1 | tee /tmp/out
-        ret=$?
-        if [ "$ret" -ne 0 ]; then
-            echo "FAILED: $ret"
-            failed+=" $dir"
-            printf '   <failure type="failure" message="binary %s exited with code %d">\n' "$f" "$ret" >> "$xml_out"
-            # TODO: could use xml escaping... but current tests seems to
-            # produce sane output
-            cat /tmp/out >> "$xml_out"
-            printf '   </failure>\n' >> "$xml_out"
-        else
-            echo "PASSED"
-        fi
-    done
-    if [ -z "$ret" ]; then
-        printf '   <skipped type="skipped" message="no executable test found in %s"/>\n' "$dir" >> "$xml_out"
+for f in "$1"/*; do
+    if [ -x "$f" ]; then
+        echo "SKIP: $f not executable"
+        continue
+    fi
+    echo "Running $f"
+    printf '  <testcase name="%s">\n' "$f" >> "$xml_out"
+    "$f" 2>&1 | tee /tmp/out
+    ret=$?
+    if [ "$ret" -ne 0 ]; then
+        echo "FAILED: $f"
+        failed+=" $f"
+        printf '   <failure type="failure" message="binary %s exited with code %d">\n' "$f" "$ret" >> "$xml_out"
+        # TODO: could use xml escaping... but current tests seems to
+        # produce sane output
+        cat /tmp/out >> "$xml_out"
+        printf '   </failure>\n' >> "$xml_out"
+    else
+        echo "PASSED"
     fi
     printf '  </testcase>\n' >> "$xml_out"
 done
-- 
2.39.5


