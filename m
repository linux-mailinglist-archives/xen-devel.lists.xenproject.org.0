Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7442A353B1
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 02:28:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888258.1297663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tikVT-0005jD-Ch; Fri, 14 Feb 2025 01:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888258.1297663; Fri, 14 Feb 2025 01:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tikVT-0005e5-88; Fri, 14 Feb 2025 01:28:39 +0000
Received: by outflank-mailman (input) for mailman id 888258;
 Fri, 14 Feb 2025 01:28:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kkdH=VF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tikVR-0005Nm-06
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 01:28:37 +0000
Received: from fout-a1-smtp.messagingengine.com
 (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01d02365-ea73-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 02:28:35 +0100 (CET)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfout.phl.internal (Postfix) with ESMTP id 477201380289;
 Thu, 13 Feb 2025 20:28:34 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Thu, 13 Feb 2025 20:28:34 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Feb 2025 20:28:32 -0500 (EST)
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
X-Inumbo-ID: 01d02365-ea73-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1739496514; x=1739582914; bh=DC6A2BjUjZ
	pkR7anGZPjWglSZCWFDKHyJlMNEw2MOAA=; b=gAPuXBZxamzzHozU4vT3HTRAMw
	k645th90YnJVPR48p1Ge9LyTSnVn5AjbMhvLyWc+7gIgjs0sQXnXFcq0V3peVpQ2
	5IoOIzLTJM+xq2HbzasbGvyYcq+qmvIsQUEeoIO4/Sm16DLLt3PZ2GnYSUF4Mswj
	jMPiZZwrEXDrMfYe8rxGE04GNMiWKLKLIgQH/zg3AJ1686LzIMUbdMCpIUccr940
	qYhZMRneQHiImVIyvHUmo5VsPkh/0Bm7yJHsnJmGTTKwrEHzIYDYn1I8X/S0rNMf
	EocRwqHHeCbSd/nLkOeHpAoDw7RrJj29muJ5WsqqezUvAROeLaNzzrSeKPNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739496514; x=
	1739582914; bh=DC6A2BjUjZpkR7anGZPjWglSZCWFDKHyJlMNEw2MOAA=; b=u
	j3ZWJtpSbMVROpEeu6Np+UE56GWs50dRHcAvxdrwQ6iHY+0td6ySWdqPgotQG5xa
	eoMNj41NF+3+jCPtW7vJGeOst7IRAVSE1jz0rkLI+K1aFt/fW7Zdv+wPdVahFQCz
	GTNyCekKcOZfmJj7PQ2i9389xx8L7ECuAlCbHbDtnGsDWVEu2LM/mFIdeesKVpic
	t/SU8ljFkE0MzSlrwakHJnz5M524JN1UojuzzCW3/oxmSRgzQMxP4J+gGyyyUD1Q
	BYwjhwWKiUEh0nCOAI3ii0bdoIWHUe7hf7M5tvpaIlQ5LELTW9LzEBJxrfX8Jkmd
	WveTvHI5CvCKoeXT9KsqA==
X-ME-Sender: <xms:QZyuZ0FIMpsLNmhRKjH0ZXJJlg2rqghT_8zxTI0BE7r5n_S_jZj-8w>
    <xme:QZyuZ9VFNYP8-IHoEuW7zVX26CfgNpxj_YZX15KH1hPAi8969MeNKWnnWcErUWafz
    SHWF-kTD8o9Hg>
X-ME-Received: <xmr:QZyuZ-JxKMjdnBi05Nrld24ajpZaNtjnfIzyGMD0Au36Wi7XedigYbW6c3cgNJ1-0iYVGleR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegkeeffecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfeuudehgfdvfeehhedujeehfeduveeugefhkefhheelgeevud
    etueeiudfggfffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgigv
    nhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoh
    epmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdprhgt
    phhtthhopegtrghrughovgestggrrhguohgvrdgtohhmpdhrtghpthhtohepshhsthgrsg
    gvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:QpyuZ2H1xMxAAPzY523QgN7LPpF4AYrqLLvFSiCqt3re-PvcXxaEkA>
    <xmx:QpyuZ6VkAbRFfdOns5qf-Dx6B19U3xzBWEE7yTw4SevIQO7EU5uePw>
    <xmx:QpyuZ5O0BkTKcG4O3SSJ5nC-wVH3_IdBmSy_EuLetnJ98sPDlB9UWQ>
    <xmx:QpyuZx2GOGGIPqPXKYqob8_mBPZ1WarUiwz2s5MUpjZvhFL3GCZhyw>
    <xmx:QpyuZ4zbt10FvBLxbLsZ_mPjt5IHuL5OJOoFBTSWzM0rs_bmKBGNPNjr>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/4] automation: add jobs running tests from tools/tests/*
Date: Fri, 14 Feb 2025 02:28:08 +0100
Message-ID: <cafc69b6c01805e7ccc0fcd6ccebe0b7088c4bd5.1739496480.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <cover.36ee649a8537af1a5fb5b3c5b7ffc0d8a1369969.1739496480.git-series.marmarek@invisiblethingslab.com>
References: <cover.36ee649a8537af1a5fb5b3c5b7ffc0d8a1369969.1739496480.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are a bunch of tests in tools/tests/, let them run in CI.
For each subdirectory expect "make run" will run the test, and observe
its exit code. This way, adding new tests is easy, and they will be
automatically picked up.

For better visibility, log test output to junit xml format, and let
gitlab ingest it. Set SUT_ADDR variable with name/address of the system
under test, so a network can be used to extract the file. The actual
address is set using DHCP. And for the test internal network, still add
the 192.168.0.1 IP (but don't replace the DHCP-provided one).

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v2:
 - use bash shebang
 - clarify skipped message
 - cleanup extra printf params
 - limit calling DHCP in dom0 to only tests that need it
---
 automation/gitlab-ci/test.yaml     | 23 +++++++++++++++-
 automation/scripts/build           |  1 +-
 automation/scripts/qubes-x86-64.sh | 28 ++++++++++++++++++-
 automation/scripts/run-tools-tests | 47 +++++++++++++++++++++++++++++++-
 4 files changed, 99 insertions(+)
 create mode 100755 automation/scripts/run-tools-tests

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 1822e3ea5fd7..c21a37933881 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -130,6 +130,7 @@
     PCIDEV: "03:00.0"
     PCIDEV_INTR: "MSI-X"
     CONSOLE_OPTS: "console=com1 com1=115200,8n1"
+    SUT_ADDR: test-2.testnet
   artifacts:
     paths:
       - smoke.serial
@@ -263,6 +264,28 @@ adl-pvshim-x86-64-gcc-debug:
     - *x86-64-test-needs
     - alpine-3.18-gcc-debug
 
+adl-tools-tests-pv-x86-64-gcc-debug:
+  extends: .adl-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh tools-tests-pv 2>&1 | tee ${LOGFILE}
+  artifacts:
+    reports:
+      junit: tests-junit.xml
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc-debug
+
+adl-tools-tests-pvh-x86-64-gcc-debug:
+  extends: .adl-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh tools-tests-pvh 2>&1 | tee ${LOGFILE}
+  artifacts:
+    reports:
+      junit: tests-junit.xml
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc-debug
+
 zen3p-smoke-x86-64-gcc-debug:
   extends: .zen3p-x86-64
   script:
diff --git a/automation/scripts/build b/automation/scripts/build
index 952599cc25c2..522efe774ef3 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -109,5 +109,6 @@ else
     # even though dist/ contains everything, while some containers don't even
     # build Xen
     cp -r dist binaries/
+    cp -r tools/tests binaries/
     collect_xen_artefacts
 fi
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 7eb3ce1bf703..7c80e0c23318 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -10,6 +10,8 @@ set -ex
 #  - pci-pv         PV dom0,  PV domU + PCI Passthrough
 #  - pvshim         PV dom0,  PVSHIM domU
 #  - s3             PV dom0,  S3 suspend/resume
+#  - tools-tests-pv PV dom0, run tests from tools/tests/*
+#  - tools-tests-pvh PVH dom0, run tests from tools/tests/*
 test_variant=$1
 
 ### defaults
@@ -19,6 +21,7 @@ timeout=120
 domU_type="pvh"
 domU_vif="'bridge=xenbr0',"
 domU_extra_config=
+retrieve_xml=
 
 case "${test_variant}" in
     ### test: smoke test & smoke test PVH & smoke test HVM & smoke test PVSHIM
@@ -126,6 +129,21 @@ done
 "
         ;;
 
+    ### tests: tools-tests-pv, tools-tests-pvh
+    "tools-tests-pv"|"tools-tests-pvh")
+        retrieve_xml=1
+        passed="test passed"
+        domU_check=""
+        dom0_check="
+/tests/run-tools-tests /tests /tmp/tests-junit.xml && echo \"${passed}\"
+nc -l -p 8080 < /tmp/tests-junit.xml >/dev/null &
+"
+        if [ "${test_variant}" = "tools-tests-pvh" ]; then
+            extra_xen_opts="dom0=pvh"
+        fi
+
+        ;;
+
     *)
         echo "Unrecognised test_variant '${test_variant}'" >&2
         exit 1
@@ -178,6 +196,8 @@ mkdir srv
 mkdir sys
 rm var/run
 cp -ar ../binaries/dist/install/* .
+cp -ar ../binaries/tests .
+cp -a ../automation/scripts/run-tools-tests tests/
 
 echo "#!/bin/bash
 
@@ -192,6 +212,10 @@ ifconfig xenbr0 192.168.0.1
 
 " > etc/local.d/xen.start
 
+if [ -n "$retrieve_xml" ]; then
+    echo "timeout 30s udhcpc -i xenbr0" >> etc/local.d/xen.start
+fi
+
 if [ -n "$domU_check" ]; then
     echo "
 # get domU console content into test log
@@ -272,6 +296,10 @@ if [ $timeout -le 0 ]; then
     exit 1
 fi
 
+if [ -n "$retrieve_xml" ]; then
+    nc -w 10 "$SUT_ADDR" 8080 > tests-junit.xml </dev/null
+fi
+
 sleep 1
 
 (grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "${passed}" smoke.serial) || exit 1
diff --git a/automation/scripts/run-tools-tests b/automation/scripts/run-tools-tests
new file mode 100755
index 000000000000..770e97c3e943
--- /dev/null
+++ b/automation/scripts/run-tools-tests
@@ -0,0 +1,47 @@
+#!/bin/bash
+
+usage() {
+    echo "Usage: $0 tests-dir xml-out"
+}
+
+xml_out=$2
+if [ -z "$xml_out" ]; then
+  xml_out=/dev/null
+fi
+printf '<?xml version="1.0" encoding="UTF-8"?>\n' > "$xml_out"
+printf '<testsuites name="tools.tests">\n' >> "$xml_out"
+printf ' <testsuite name="tools.tests">\n' >> "$xml_out"
+failed=
+for dir in "$1"/*; do
+    [ -d "$dir" ] || continue
+    echo "Running test in $dir"
+    printf '  <testcase name="%s">\n' "$dir" >> "$xml_out"
+    ret=
+    for f in "$dir"/*; do
+        [ -f "$f" ] || continue
+        [ -x "$f" ] || continue
+        "$f" 2>&1 | tee /tmp/out
+        ret=$?
+        if [ "$ret" -ne 0 ]; then
+            echo "FAILED: $ret"
+            failed+=" $dir"
+            printf '   <failure type="failure" message="binary %s exited with code %d">\n' "$f" "$ret" >> "$xml_out"
+            # TODO: could use xml escaping... but current tests seems to
+            # produce sane output
+            cat /tmp/out >> "$xml_out"
+            printf '   </failure>\n' >> "$xml_out"
+        else
+            echo "PASSED"
+        fi
+    done
+    if [ -z "$ret" ]; then
+        printf '   <skipped type="skipped" message="no executable test found in %s"/>\n' "$dir" >> "$xml_out"
+    fi
+    printf '  </testcase>\n' >> "$xml_out"
+done
+printf ' </testsuite>\n' >> "$xml_out"
+printf '</testsuites>\n' >> "$xml_out"
+
+if [ -n "$failed" ]; then
+    exit 1
+fi
-- 
git-series 0.9.1

