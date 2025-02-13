Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D06CA334A9
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 02:28:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886997.1296586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiO1J-00030X-PB; Thu, 13 Feb 2025 01:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886997.1296586; Thu, 13 Feb 2025 01:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiO1J-0002ve-L0; Thu, 13 Feb 2025 01:28:01 +0000
Received: by outflank-mailman (input) for mailman id 886997;
 Thu, 13 Feb 2025 01:28:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZTDb=VE=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tiO1I-0002en-3t
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 01:28:00 +0000
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c18e9c8f-e9a9-11ef-b3ef-695165c68f79;
 Thu, 13 Feb 2025 02:27:58 +0100 (CET)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id 7388B1140115;
 Wed, 12 Feb 2025 20:27:57 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Wed, 12 Feb 2025 20:27:57 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Feb 2025 20:27:56 -0500 (EST)
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
X-Inumbo-ID: c18e9c8f-e9a9-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1739410077; x=1739496477; bh=2LmMWXubmX
	uwTO3Eqs6AeYprMTw7CSalB1/qW/l0z4k=; b=SxMX5OuVUmOiF1vlkTvRcKGhOM
	rWxWbeCFr6FeY0N/MENxBXdzRbQdLogvurCyKQDpCFdOO2u1wpFZpGxwh1cs/dW/
	zzHK2xUBcWlslJ8Qa79vfqQvVjXyWRGvJSghnWaTYgSTk5fKc0QS+0dd/0XVCzR8
	1V0YBqWXkUy7UyIUjENGcu+xKKa4Cbz+Od4H82uDmQY0D4fTP1sFiRPskSpU0R58
	Dg7+w/EtQ2WaVBRPy37jFn4t+aUSAiIbr3df6Z/wubhMB5lR7rVKQzVLoJGWOIeA
	o3t2EHRokzytxneu1piy03rfZqZ+odeR6lLPsaY+CHKjyhaX0i8QiCEx7MgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739410077; x=
	1739496477; bh=2LmMWXubmXuwTO3Eqs6AeYprMTw7CSalB1/qW/l0z4k=; b=e
	hibIwpCF/6N/UF1GbysxB3NY/fUnpTUaV5aDgge+sGoNA8F1+EIAAh28V0IrDvnm
	/WM0QcEZs0FHzXMN09MwdHJYDj7y3JnZubJyyV7IooiMu1W5nnyT3mJlBFfaId+L
	kdJ9R5E8pum9xwEMWX++v7pg2YcMFaRD8vcLhKN30jAi/o0/D6e+gSl0q1n7hifs
	JIKq0Abg7FGHf+RQUCNxktUrXR8qA8pT/+t7SVJ0hF2eiCkc4J5rV5RyubpeEQ5j
	QGhh1ifmmv8kMHwW6GcqCkjYKuHJnN5xWLKxe0ngWA+0qXd21ltW5s05gwfy1IE4
	weZWpvRDTVuptW6SKES9A==
X-ME-Sender: <xms:nUqtZ9CbGe5bhRDJm-Mhc3AOV3SEMMx83DfdBcgHmC4avyCY2mmBgg>
    <xme:nUqtZ7hTmq5evz5WFmPjojGfasJ9PQmtIpZxd1AP0-U4IrqGkpVytRjBGoEZHiPCU
    xzA4JWgMaSO0A>
X-ME-Received: <xmr:nUqtZ4lN7bMx7GGegyNG_9y5qbpjiK27OFgOjDnKNJ-r3OwE1uvbYNubHwsNmNCGxKxFZ_y7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegheeghecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:nUqtZ3yF4ly3We3yBufvtduQp6B2oA12hr4QN6q83r4ppvBGsB759g>
    <xmx:nUqtZyQC9OL6LC-3Q9shWLG9X7eFfOACHyb71f2WkciyDxN6X-DlXw>
    <xmx:nUqtZ6bd540hcVTy3CmDsg_qXL1Uj6qn6vghFny5QuhyCR3vl0-gTw>
    <xmx:nUqtZzQVgnhBUk24l1yHg0CfkHnhTD1RC9-KtXH6tnp82QcgTRhblQ>
    <xmx:nUqtZ4OWZQXO7NzEL9LRdLp7S_fOtEFsB2vZtN34YTHt1k6wgXOLN64F>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 2/3] automation: add jobs running tests from tools/tests/*
Date: Thu, 13 Feb 2025 02:23:55 +0100
Message-ID: <3fbb4c6be9d9190bb2bd6427ab0f0a933c95dde1.1739409822.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <cover.068c7421003863de7fca1cbe6aed2af000f061a7.1739409822.git-series.marmarek@invisiblethingslab.com>
References: <cover.068c7421003863de7fca1cbe6aed2af000f061a7.1739409822.git-series.marmarek@invisiblethingslab.com>
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
 automation/gitlab-ci/test.yaml     | 23 +++++++++++++++-
 automation/scripts/build           |  1 +-
 automation/scripts/qubes-x86-64.sh | 27 +++++++++++++++++-
 automation/scripts/run-tools-tests | 47 +++++++++++++++++++++++++++++++-
 4 files changed, 97 insertions(+), 1 deletion(-)
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
index 7eb3ce1bf703..81d239cc8b75 100755
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
 
@@ -188,7 +208,8 @@ brctl addbr xenbr0
 brctl addif xenbr0 eth0
 ifconfig eth0 up
 ifconfig xenbr0 up
-ifconfig xenbr0 192.168.0.1
+timeout 30s udhcpc -i xenbr0
+ip addr add dev xenbr0 192.168.0.1/24
 
 " > etc/local.d/xen.start
 
@@ -272,6 +293,10 @@ if [ $timeout -le 0 ]; then
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
index 000000000000..242a9edad941
--- /dev/null
+++ b/automation/scripts/run-tools-tests
@@ -0,0 +1,47 @@
+#!/bin/sh
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
+            echo "FAILED"
+            failed+=" $dir"
+            printf '   <failure type="failure" message="binary %s exited with code %d">\n' "$f" "$ret" >> "$xml_out"
+            # TODO: could use xml escaping... but current tests seems to
+            # produce sane output
+            cat /tmp/out >> "$xml_out"
+            printf '   </failure>\n' "$f" "$ret" >> "$xml_out"
+        else
+            echo "PASSED"
+        fi
+    done
+    if [ -z "$ret" ]; then
+        printf '   <skipped type="skipped" message="test not found"/>\n' >> "$xml_out"
+    fi
+    printf '  </testcase>\n' "$dir" >> "$xml_out"
+done
+printf ' </testsuite>\n' >> "$xml_out"
+printf '</testsuites>\n' >> "$xml_out"
+
+if [ -n "$failed" ]; then
+    exit 1
+fi
-- 
git-series 0.9.1

