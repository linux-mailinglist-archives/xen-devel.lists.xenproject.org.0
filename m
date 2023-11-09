Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8BF7E6E05
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 16:49:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629735.982126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r17Hh-0003Nc-Gl; Thu, 09 Nov 2023 15:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629735.982126; Thu, 09 Nov 2023 15:49:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r17Hh-0003Lm-Dk; Thu, 09 Nov 2023 15:49:33 +0000
Received: by outflank-mailman (input) for mailman id 629735;
 Thu, 09 Nov 2023 15:49:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r4x0=GW=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1r17Hf-0003Le-Ud
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 15:49:31 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 918e25fa-7f17-11ee-9b0e-b553b5be7939;
 Thu, 09 Nov 2023 16:49:29 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c50906f941so13609051fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Nov 2023 07:49:29 -0800 (PST)
Received: from l14.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c5-20020a05600c0a4500b004068de50c64sm2460966wmq.46.2023.11.09.07.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 07:49:28 -0800 (PST)
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
X-Inumbo-ID: 918e25fa-7f17-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699544969; x=1700149769; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dRJNhzLkLjjb96yCsISqW/q7J4bX4Bc7uEC20O5gnrM=;
        b=JIT02iCM77Fvw0oIxt0npS/2fYB63F62jpaxtp961TTh04SXKWbmVhvCOeYBrQS0ZV
         mwi2cx/Q1nK4UUln49Sc9Z0s6ne5/rVCY0kWWbO0/OFQ61P233dUAAgIF4QAhLsIBQrP
         2qyHUVY0eeqWztW/+7QpS5VAulPZ4p98Qvlx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699544969; x=1700149769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dRJNhzLkLjjb96yCsISqW/q7J4bX4Bc7uEC20O5gnrM=;
        b=wJZhaYVXNFSkjYJbCBlRRyODrB1VmfckadP9Rj1G/y99x9txjdNBFu7cc4HFOI9EOf
         elcOuP3kurXr8V4UONOyLSle+jV43CgGyOn/LS7n0jblBtBjfDNTeZplu4/Z/9tctAAq
         v9rsyI3L2IpTOLubP7swsDOxKGwlaBiItcToqD9uIl40Rwqu14eAtkY3r9ro/rvSY5fJ
         UmyY0DXNHnVw3bAsTQiK12c9b5+/cdmg1SPMHeQc/MVRh3ifffZHfeZNe1nq859dvAN1
         GryYn8UKMlo0uG8kXZdMBzmfiU/C3Z01ynDaCbv3mmY5MPVeb1hfp34+iN+ms/NU+h5w
         VmKQ==
X-Gm-Message-State: AOJu0YxnoKcljWjIaI8rogNvRB/FbxT2pywaK5GxBCKVfgS+xGw8Nf9j
	eC1EtRzjXjzN0NUL1ggbo9qn28bN8P8isWS/vUc=
X-Google-Smtp-Source: AGHT+IFMR938SiybZKIT0oJKrx+gvCMiEw+CEKwOvl4PJ4Dj/9ksQbauHGUfy7tld1fUTRFz3t0i3w==
X-Received: by 2002:a2e:330b:0:b0:2c0:2ef8:9716 with SMTP id d11-20020a2e330b000000b002c02ef89716mr4664997ljc.1.1699544968747;
        Thu, 09 Nov 2023 07:49:28 -0800 (PST)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] CI: Rework RISCV smoke test
Date: Thu,  9 Nov 2023 15:49:22 +0000
Message-Id: <20231109154922.49118-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the test rely on QEMU and Xen finishing the boot in under
two seconds. That's both very long and very short. Xen usually managed
to print "All set up" under a second. Unless for some reason we try to
run the test on a machine that's busy doing something else.

Rework the test to exit as soon as Xen is done.

There's two `tail -f`, the first one is there simply to monitor test
progress in GitLab console. The second one is used to detect the test
result as soon as QEMU add it to the file. Both `tail` exit as soon as
QEMU exit.

If QEMU fails at start, and exit early, both `tail` will simply exit,
resulting in a failure.

If the line we are looking for is never printed, the `timeout` on the
second `tail` will force the test to exit with an error.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    The "machine might be busy" bits refere to having a gitlab-runner
    running two jobs, one been a build with no restriction on CPU resource use.
    
    We could use "-daemonize" with "-pidfile" to more easly detect qemu's
    initialisation failure, but needs "-display none" instead of
    "-nographic"

 automation/scripts/qemu-smoke-riscv64.sh | 32 ++++++++++++++++++------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
index 4008191302..ba7b61db8b 100755
--- a/automation/scripts/qemu-smoke-riscv64.sh
+++ b/automation/scripts/qemu-smoke-riscv64.sh
@@ -2,19 +2,35 @@
 
 set -ex
 
-# Run the test
-rm -f smoke.serial
-set +e
+# Truncate or create serial output file
+echo -n > smoke.serial
 
-timeout -k 1 2 \
+# cleanup: kill QEMU when the script exit for any reason
+qemu_pid=
+cleanup() {
+    if [ "$qemu_pid" ]; then
+        kill -s SIGKILL "$qemu_pid"
+    fi
+}
+
+trap 'cleanup' EXIT
+
+# Run the test
 qemu-system-riscv64 \
     -M virt \
     -smp 1 \
     -nographic \
     -m 2g \
+    -monitor none \
+    -chardev file,id=serial-out,path=smoke.serial \
+    -serial chardev:serial-out \
     -kernel binaries/xen \
-    |& tee smoke.serial
+    &
+qemu_pid=$!
 
-set -e
-(grep -q "All set up" smoke.serial) || exit 1
-exit 0
+# Monitor test progression until QEMU exit
+tail --pid=$qemu_pid -f smoke.serial &
+
+# Check boot test result
+timeout 60 tail --pid=$qemu_pid -f smoke.serial | \
+    grep -a -q "All set up"
-- 
Anthony PERARD


