Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6411C3190DB
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 18:20:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84034.157493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAFdi-00051D-Jf; Thu, 11 Feb 2021 17:20:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84034.157493; Thu, 11 Feb 2021 17:20:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAFdi-00050a-Fj; Thu, 11 Feb 2021 17:20:26 +0000
Received: by outflank-mailman (input) for mailman id 84034;
 Thu, 11 Feb 2021 17:20:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kYUG=HN=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1lAFdg-0003q3-UV
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 17:20:24 +0000
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71906b6c-277f-4780-be41-9c7585268461;
 Thu, 11 Feb 2021 17:20:00 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id v14so4927494wro.7
 for <xen-devel@lists.xenproject.org>; Thu, 11 Feb 2021 09:20:00 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z15sm5496898wrs.25.2021.02.11.09.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 09:19:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E48451FF93;
 Thu, 11 Feb 2021 17:19:47 +0000 (GMT)
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
X-Inumbo-ID: 71906b6c-277f-4780-be41-9c7585268461
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=97euSTerjez5Tce8hHGcMNp4cX8yrwBdXJFrXOC2JXc=;
        b=xbD5H3NYhzAJ7qvapOjyovl4bg42BELbyrNRG6zw1q3UPUyzd8jX7jexxdcmxLVxTE
         rv1vIaa1IaulbpkTLDoYY+P8dN2ozs6OZq+itR/iusbN4d3LFziXoMfWzdnCH5SXEArn
         w5sulFaqxDBgw8+ZlxFQYCh/Vb9XFA7i04sms+qLj1NzzQu9wvKkWKWIgxDCpeO8yk5g
         s8F3Hs71+5tVvQvX8ionKzRg9bouu6aWKo9DXTGFQunviL69RSe57aiUtkXl/ZEaEw9C
         wzmpyMj337gzqdX8P9GcEhngmj3qSngmBF7Xzb+FfAJ87MCAWpjgWHrXO2WveLj3LAA+
         FMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=97euSTerjez5Tce8hHGcMNp4cX8yrwBdXJFrXOC2JXc=;
        b=hBO6qc8GP+c3Fc0MmSrprn6nY0ysqeJojTpMSLzjeSpqpeyJzL1c2IXWRtxIx4dTWT
         xJGXw1VQ4ZbUcQ/PPaAD/uFAJ9eTbabsS+X/DT6ZpAan0D3NNR3ESp5kl6BfoWrGxZV7
         o4v9lY5Q21E0md+iq2JU0kv68Dqlh5T0HAV2Yt8A2PRXtznyfwMrVSwygb3z1t7Hfnma
         TlMSJkPOKJgN1efIZoBe4a2KtCr6DVoyLur8SLPG9MFabf4Awta7q+XoWNdJUyD8K6gE
         mV30/TvB+XjJ18r+rRRFMqpEzKdeQZVeOdToLhFZcUmtX7Ite3U1jBPTGHqL9P6XxApy
         /dPw==
X-Gm-Message-State: AOAM530ajrKC4+PuL8FwLhhxuX0dvuPjNSZQVx+YueDmbHeS9CvWMWQI
	gYE32OYK23YUdr4QDi6ISV8K3Q==
X-Google-Smtp-Source: ABdhPJyzRo8kcYPUXSrP5mf6sQeEw14/2FdcWAVQ8gyif+dPFUJ6YCsxJGyHCsTfJsdULjTJavJKJw==
X-Received: by 2002:a5d:44cf:: with SMTP id z15mr1759324wrr.191.1613063999472;
        Thu, 11 Feb 2021 09:19:59 -0800 (PST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: julien@xen.org,
	stefano.stabellini@linaro.org,
	stefano.stabellini@xilinx.com,
	andre.przywara@arm.com,
	stratos-dev@op-lists.linaro.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH  v2 7/7] tests/avocado: add boot_xen tests
Date: Thu, 11 Feb 2021 17:19:45 +0000
Message-Id: <20210211171945.18313-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211171945.18313-1-alex.bennee@linaro.org>
References: <20210211171945.18313-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These tests make sure we can boot the Xen hypervisor with a Dom0
kernel using the guest-loader. We currently have to use a kernel I
built myself because there are issues using the Debian kernel images.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS                  |   1 +
 tests/acceptance/boot_xen.py | 117 +++++++++++++++++++++++++++++++++++
 2 files changed, 118 insertions(+)
 create mode 100644 tests/acceptance/boot_xen.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 853f174fcf..537ca7a6f3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1998,6 +1998,7 @@ M: Alex Bennée <alex.bennee@linaro.org>
 S: Maintained
 F: hw/core/guest-loader.c
 F: docs/system/guest-loader.rst
+F: tests/acceptance/boot_xen.py
 
 Intel Hexadecimal Object File Loader
 M: Su Hang <suhang16@mails.ucas.ac.cn>
diff --git a/tests/acceptance/boot_xen.py b/tests/acceptance/boot_xen.py
new file mode 100644
index 0000000000..8c7e091d40
--- /dev/null
+++ b/tests/acceptance/boot_xen.py
@@ -0,0 +1,117 @@
+# Functional test that boots a Xen hypervisor with a domU kernel and
+# checks the console output is vaguely sane .
+#
+# Copyright (c) 2020 Linaro
+#
+# Author:
+#  Alex Bennée <alex.bennee@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+import os
+
+from avocado import skipIf
+from avocado_qemu import wait_for_console_pattern
+from boot_linux_console import LinuxKernelTest
+
+
+class BootXenBase(LinuxKernelTest):
+    """
+    Boots a Xen hypervisor with a Linux DomU kernel.
+    """
+
+    timeout = 90
+    XEN_COMMON_COMMAND_LINE = 'dom0_mem=128M loglvl=all guest_loglvl=all'
+
+    def fetch_guest_kernel(self):
+        # Using my own built kernel - which works
+        kernel_url = ('https://fileserver.linaro.org/'
+                      's/JSsewXGZ6mqxPr5/download?path=%2F&files='
+                      'linux-5.9.9-arm64-ajb')
+        kernel_sha1 = '4f92bc4b9f88d5ab792fa7a43a68555d344e1b83'
+        kernel_path = self.fetch_asset(kernel_url,
+                                       asset_hash=kernel_sha1)
+
+        return kernel_path
+
+    def launch_xen(self, xen_path):
+        """
+        Launch Xen with a dom0 guest kernel
+        """
+        self.log.info("launch with xen_path: %s", xen_path)
+        kernel_path = self.fetch_guest_kernel()
+
+        self.vm.set_console()
+
+        xen_command_line = self.XEN_COMMON_COMMAND_LINE
+        self.vm.add_args('-machine', 'virtualization=on',
+                         '-cpu', 'cortex-a57',
+                         '-m', '768',
+                         '-kernel', xen_path,
+                         '-append', xen_command_line,
+                         '-device',
+                         "guest-loader,addr=0x47000000,kernel=%s,bootargs=console=hvc0"
+                         % (kernel_path))
+
+        self.vm.launch()
+
+        console_pattern = 'VFS: Cannot open root device'
+        wait_for_console_pattern(self, console_pattern, "Panic on CPU 0:")
+
+
+class BootXen(BootXenBase):
+
+    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
+    def test_arm64_xen_411_and_dom0(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=accel:tcg
+        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=machine:virt
+        """
+        xen_url = ('https://deb.debian.org/debian/'
+                   'pool/main/x/xen/'
+                   'xen-hypervisor-4.11-arm64_4.11.4+37-g3263f257ca-1_arm64.deb')
+        xen_sha1 = '034e634d4416adbad1212d59b62bccdcda63e62a'
+        xen_deb = self.fetch_asset(xen_url, asset_hash=xen_sha1)
+        xen_path = self.extract_from_deb(xen_deb, "/boot/xen-4.11-arm64")
+
+        self.launch_xen(xen_path)
+
+    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
+    def test_arm64_xen_414_and_dom0(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=accel:tcg
+        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=machine:virt
+        """
+        xen_url = ('https://deb.debian.org/debian/'
+                   'pool/main/x/xen/'
+                   'xen-hypervisor-4.14-arm64_4.14.0+80-gd101b417b7-1_arm64.deb')
+        xen_sha1 = 'b9d209dd689ed2b393e625303a225badefec1160'
+        xen_deb = self.fetch_asset(xen_url, asset_hash=xen_sha1)
+        xen_path = self.extract_from_deb(xen_deb, "/boot/xen-4.14-arm64")
+
+        self.launch_xen(xen_path)
+
+    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
+    def test_arm64_xen_415_and_dom0(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=accel:tcg
+        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=machine:virt
+        """
+
+        xen_url = ('https://fileserver.linaro.org/'
+                   's/JSsewXGZ6mqxPr5/download'
+                   '?path=%2F&files=xen-upstream-4.15-unstable.deb')
+        xen_sha1 = 'fc191172b85cf355abb95d275a24cc0f6d6579d8'
+        xen_deb = self.fetch_asset(xen_url, asset_hash=xen_sha1)
+        xen_path = self.extract_from_deb(xen_deb, "/boot/xen-4.15-unstable")
+
+        self.launch_xen(xen_path)
-- 
2.20.1


