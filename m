Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCAAA3AFD9
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 03:58:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892313.1301307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkaHL-0002HK-O7; Wed, 19 Feb 2025 02:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892313.1301307; Wed, 19 Feb 2025 02:57:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkaHL-0002Ef-Kw; Wed, 19 Feb 2025 02:57:39 +0000
Received: by outflank-mailman (input) for mailman id 892313;
 Wed, 19 Feb 2025 02:57:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rZvE=VK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tkaHJ-00020f-UD
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 02:57:37 +0000
Received: from fhigh-a7-smtp.messagingengine.com
 (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45a48c60-ee6d-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 03:57:36 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id C2D751140205;
 Tue, 18 Feb 2025 21:57:35 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Tue, 18 Feb 2025 21:57:35 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Feb 2025 21:57:34 -0500 (EST)
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
X-Inumbo-ID: 45a48c60-ee6d-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1739933855; x=1740020255; bh=LUXos0tsU/
	JpuEC8+amcvqWBF/7Zdjgw4pz1/9FJXNQ=; b=Rwz4Qw4HNo4/AMHnZAt9X9JpK/
	ceUBIU6heSf5+LbsNkYfZLIUJdMp34Oz7Ly4LHbpCekICZnqibjjUO5jtBctgxiN
	Mp4hpqDh2ROs1iH3SKHC9TDiWSLpOvwvz2UlImN4uYTiO1NettsjQPIbMJB1V/NW
	JWY6QLHAtYMlyQim3Xmm3gx34ceA7XR1+6z8Z8RfU7PljoQCh/EPmbre4UGbbEML
	BEQ6oh2EOfPAb3P0hWosJtjnS9pJrMl3yA+2KW4CKqQOc2seEr/fFkANCJyUNU35
	L6bQbLc4Va+0lL3f++aQEOnHfDyBuSfAP1ja3dRMrBJtsCPcTKI56gtkmnXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739933855; x=
	1740020255; bh=LUXos0tsU/JpuEC8+amcvqWBF/7Zdjgw4pz1/9FJXNQ=; b=J
	QhAFs2dgayRH1Q0mga+awcMwzkeZnKsdlucQsPEVxT5i46Jxl4pYmt9RituWIgAY
	XiFQaTlg8ZxUXe3OgbfW2nzZEAd2hI5t/bgUEwkrTQ4Z25fHkXhMoeHWPzQ/0ups
	m28ZgzUE0Cqzh+jAufBYA2SgqN4RmAk1gMiNXN10WI8DEDPM8id1hRVxec39pK8t
	BvGaj8X9KEDhVwFLj+Eym36UGTEc/foNaH57DIFZFbObjTF8nTyXOwhD8a3M1hsz
	RY7WA/7reEb4NX5ULQBm3TwSat1dRt+Ge48sADE3WnCpkJXBlVPMYe1a9ne9JosK
	3INX1hIMhIiiQPhBNk56w==
X-ME-Sender: <xms:n0i1Z7C4z2DFGCmpc-tGeT88hfeQTIzVNLezoczYMzi1-Bi1TQX04g>
    <xme:n0i1ZxjflQK5DvDXuZco_j47uQ4epksHPcr3EAKE2adG8ddBPmvNLqcMNi7Ls3Pyg
    041MJAnXcRRjA>
X-ME-Received: <xmr:n0i1Z2nlvzFQMRago_sigEX1MD5jCVzemT1pS99R_6EU9HiuydT6bJYHWATex25O4j_I0tWMIKVs1WYthV3FGU7eJ4BuZ7VR1Nwr4yiZEDNLOwrGE_U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeifedtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfeuudehgfdvfeehhedujeehfeduveeugefhkefhheelgeevud
    etueeiudfggfffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgigv
    nhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoh
    eprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehm
    rghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghpth
    htohepshhtvghfrghnohdrshhtrggsvghllhhinhhisegrmhgurdgtohhmpdhrtghpthht
    oheptggrrhguohgvsegtrghrughovgdrtghomhdprhgtphhtthhopehsshhtrggsvghllh
    hinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:n0i1Z9xvgGZJNdZ5acondaDVfJB1NHfqA6Lqj8hEf65fcV9AasA0pA>
    <xmx:n0i1ZwQNQyz7m2VxI8i8rLD2MPabTEO1jV_JJitahRYvhcWwZbJAbA>
    <xmx:n0i1Zwa_1A5uRUlPz4wioox9T8xJYV8PXWtC0j1VZn4YXZON4yJtDA>
    <xmx:n0i1ZxRLWjQ6cnhDTPTRV-esUuTA_8cyuPjgxvBfr04LAkY_IhB_Ww>
    <xmx:n0i1Z_GpXI9zQ_8b69Tck2i3glc6eBWUEoLa0UhcYkis7LkxlWuHorPa>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 2/5] automation: add jobs running tests from tools/tests/*
Date: Wed, 19 Feb 2025 03:56:52 +0100
Message-ID: <435767bb15b40d84d919296f3202133fe7d128c5.1739933790.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <cover.0fd3c8fb7cf6db337edfd5c5d6ea18bcc44bdef3.1739933790.git-series.marmarek@invisiblethingslab.com>
References: <cover.0fd3c8fb7cf6db337edfd5c5d6ea18bcc44bdef3.1739933790.git-series.marmarek@invisiblethingslab.com>
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
Reviewed-by: Stefano Stabellini <stefano.stabellini@amd.com>
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

