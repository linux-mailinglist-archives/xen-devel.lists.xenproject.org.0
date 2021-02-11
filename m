Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC863190D6
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 18:20:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84033.157482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAFdd-0004v3-99; Thu, 11 Feb 2021 17:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84033.157482; Thu, 11 Feb 2021 17:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAFdd-0004uE-4E; Thu, 11 Feb 2021 17:20:21 +0000
Received: by outflank-mailman (input) for mailman id 84033;
 Thu, 11 Feb 2021 17:20:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kYUG=HN=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1lAFdb-0003q3-UD
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 17:20:19 +0000
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5a878be-3f47-4681-9632-3f33215129f3;
 Thu, 11 Feb 2021 17:19:58 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id r21so4918949wrr.9
 for <xen-devel@lists.xenproject.org>; Thu, 11 Feb 2021 09:19:58 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b19sm10182925wmj.22.2021.02.11.09.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 09:19:50 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 82A141FF91;
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
X-Inumbo-ID: e5a878be-3f47-4681-9632-3f33215129f3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mkOxD0K1nZ+fuOlse/PqHe9yZcMohC/Q3ekJsWwmjy4=;
        b=w8LhT4kIP365H63ZCZMUq9dei6vNCOnWNhpYq0chQl/sZTf3C8XFZ22WERgUcdpne6
         75slk0xUqUmSFNQRUgspnf1CdWev7Ci9B+HaSnRszTlUCjzBqRrJyrDajMnbZWqL6mGf
         YXKMe9U31rUSH/40au+pdVa39lmLB7UtUIc0ghB4NyMDi1hklqKqIWs5mTXUeRAubjr+
         9qvHINBtb6D9chDVWxBjexqf2hrKJ0/SlrUiBN0pr6mHCrVgjBQM5ytf7GYEVovJkAot
         6o1/RySMxNB7/73XxQMyz4ez26GQXtmsRC7QP/9FAMXRme+bBojQjJPxGldXt4yPngbj
         X8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mkOxD0K1nZ+fuOlse/PqHe9yZcMohC/Q3ekJsWwmjy4=;
        b=jIQRvl5+sgrgEnV/8cCI9Ncm0kr4UCVT0529+BjCD/VZyqzp5248tJfppbPPI3k5Dz
         o75QEqsEPZCnbo3VeFvDhlwUj9BkusyQHNb8Xu5SKzxtv8XwXvJzsZ/FvDskbuDPNmBI
         FXLGyI8lpbY3FvJiZzjirOcA7a1EX4Mx/p6dLcHC7DeOqXnK54bxCVjifv3bIQXmBDZV
         hs/fBa/JykpJLSAYNYPu+OR2xHbDR+aeD/ZY4ppqYWDLXK8eU7HfVyCXlTOoxEpSl9u0
         lpr5vOG6gJnbHiTegRFEyCA2/j2sv3+q2Iau7P57nJ+lfl3L4gxzFGxmhKp18yPMoSqo
         tDQA==
X-Gm-Message-State: AOAM532E0DvENbkBK9K8xUb1lqGBKeugoRkW6e1mESN+YVWpAzs1MgKd
	i4AP5F5QAM0mng1SJFBdjJmOXPmsPFaHfLr7
X-Google-Smtp-Source: ABdhPJxGNE7xMzp72HGLUrXAgZu+lpGvk+gFxLvTaNvHrXzzraCXUBXJuwLIu8CbSY0xOmMelNvRYw==
X-Received: by 2002:adf:f6d0:: with SMTP id y16mr6751776wrp.351.1613063997176;
        Thu, 11 Feb 2021 09:19:57 -0800 (PST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: julien@xen.org,
	stefano.stabellini@linaro.org,
	stefano.stabellini@xilinx.com,
	andre.przywara@arm.com,
	stratos-dev@op-lists.linaro.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <alistair@alistair23.me>
Subject: [PATCH  v2 5/7] docs: move generic-loader documentation into the main manual
Date: Thu, 11 Feb 2021 17:19:43 +0000
Message-Id: <20210211171945.18313-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211171945.18313-1-alex.bennee@linaro.org>
References: <20210211171945.18313-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We might as well surface this useful information in the manual so
users can find it easily. It is a fairly simple conversion to rst with
the only textual fixes being QemuOps to QemuOpts.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20201105175153.30489-6-alex.bennee@linaro.org>

---
v2
  - fix whitespace
  - update MAINTAINERS
---
 docs/generic-loader.txt        |  92 --------------------------
 docs/system/generic-loader.rst | 117 +++++++++++++++++++++++++++++++++
 docs/system/index.rst          |   1 +
 MAINTAINERS                    |   2 +-
 4 files changed, 119 insertions(+), 93 deletions(-)
 delete mode 100644 docs/generic-loader.txt
 create mode 100644 docs/system/generic-loader.rst

diff --git a/docs/generic-loader.txt b/docs/generic-loader.txt
deleted file mode 100644
index a9603a2af7..0000000000
--- a/docs/generic-loader.txt
+++ /dev/null
@@ -1,92 +0,0 @@
-Copyright (c) 2016 Xilinx Inc.
-
-This work is licensed under the terms of the GNU GPL, version 2 or later.  See
-the COPYING file in the top-level directory.
-
-
-The 'loader' device allows the user to load multiple images or values into
-QEMU at startup.
-
-Loading Data into Memory Values
--------------------------------
-The loader device allows memory values to be set from the command line. This
-can be done by following the syntax below:
-
-     -device loader,addr=<addr>,data=<data>,data-len=<data-len>
-                   [,data-be=<data-be>][,cpu-num=<cpu-num>]
-
-    <addr>      - The address to store the data in.
-    <data>      - The value to be written to the address. The maximum size of
-                  the data is 8 bytes.
-    <data-len>  - The length of the data in bytes. This argument must be
-                  included if the data argument is.
-    <data-be>   - Set to true if the data to be stored on the guest should be
-                  written as big endian data. The default is to write little
-                  endian data.
-    <cpu-num>   - The number of the CPU's address space where the data should
-                  be loaded. If not specified the address space of the first
-                  CPU is used.
-
-All values are parsed using the standard QemuOps parsing. This allows the user
-to specify any values in any format supported. By default the values
-will be parsed as decimal. To use hex values the user should prefix the number
-with a '0x'.
-
-An example of loading value 0x8000000e to address 0xfd1a0104 is:
-    -device loader,addr=0xfd1a0104,data=0x8000000e,data-len=4
-
-Setting a CPU's Program Counter
--------------------------------
-The loader device allows the CPU's PC to be set from the command line. This
-can be done by following the syntax below:
-
-     -device loader,addr=<addr>,cpu-num=<cpu-num>
-
-    <addr>      - The value to use as the CPU's PC.
-    <cpu-num>   - The number of the CPU whose PC should be set to the
-                  specified value.
-
-All values are parsed using the standard QemuOps parsing. This allows the user
-to specify any values in any format supported. By default the values
-will be parsed as decimal. To use hex values the user should prefix the number
-with a '0x'.
-
-An example of setting CPU 0's PC to 0x8000 is:
-    -device loader,addr=0x8000,cpu-num=0
-
-Loading Files
--------------
-The loader device also allows files to be loaded into memory. It can load ELF,
-U-Boot, and Intel HEX executable formats as well as raw images.  The syntax is
-shown below:
-
-    -device loader,file=<file>[,addr=<addr>][,cpu-num=<cpu-num>][,force-raw=<raw>]
-
-    <file>      - A file to be loaded into memory
-    <addr>      - The memory address where the file should be loaded. This is
-                  required for raw images and ignored for non-raw files.
-    <cpu-num>   - This specifies the CPU that should be used. This is an
-                  optional argument and will cause the CPU's PC to be set to
-                  the memory address where the raw file is loaded or the entry
-                  point specified in the executable format header. This option
-                  should only be used for the boot image.
-                  This will also cause the image to be written to the specified
-                  CPU's address space. If not specified, the default is CPU 0.
-    <force-raw> - Setting force-raw=on forces the file to be treated as a raw
-                  image.  This can be used to load supported executable formats
-                  as if they were raw.
-
-All values are parsed using the standard QemuOps parsing. This allows the user
-to specify any values in any format supported. By default the values
-will be parsed as decimal. To use hex values the user should prefix the number
-with a '0x'.
-
-An example of loading an ELF file which CPU0 will boot is shown below:
-    -device loader,file=./images/boot.elf,cpu-num=0
-
-Restrictions and ToDos
-----------------------
- - At the moment it is just assumed that if you specify a cpu-num then you
-   want to set the PC as well. This might not always be the case. In future
-   the internal state 'set_pc' (which exists in the generic loader now) should
-   be exposed to the user so that they can choose if the PC is set or not.
diff --git a/docs/system/generic-loader.rst b/docs/system/generic-loader.rst
new file mode 100644
index 0000000000..6bf8a4eb48
--- /dev/null
+++ b/docs/system/generic-loader.rst
@@ -0,0 +1,117 @@
+..
+   Copyright (c) 2016, Xilinx Inc.
+
+This work is licensed under the terms of the GNU GPL, version 2 or later.  See
+the COPYING file in the top-level directory.
+
+Generic Loader
+--------------
+
+The 'loader' device allows the user to load multiple images or values into
+QEMU at startup.
+
+Loading Data into Memory Values
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+The loader device allows memory values to be set from the command line. This
+can be done by following the syntax below::
+
+   -device loader,addr=<addr>,data=<data>,data-len=<data-len> \
+                   [,data-be=<data-be>][,cpu-num=<cpu-num>]
+
+``<addr>``
+  The address to store the data in.
+
+``<data>``
+  The value to be written to the address. The maximum size of the data
+  is 8 bytes.
+
+``<data-len>``
+  The length of the data in bytes. This argument must be included if
+  the data argument is.
+
+``<data-be>``
+  Set to true if the data to be stored on the guest should be written
+  as big endian data. The default is to write little endian data.
+
+``<cpu-num>``
+  The number of the CPU's address space where the data should be
+  loaded. If not specified the address space of the first CPU is used.
+
+All values are parsed using the standard QemuOps parsing. This allows the user
+to specify any values in any format supported. By default the values
+will be parsed as decimal. To use hex values the user should prefix the number
+with a '0x'.
+
+An example of loading value 0x8000000e to address 0xfd1a0104 is::
+
+    -device loader,addr=0xfd1a0104,data=0x8000000e,data-len=4
+
+Setting a CPU's Program Counter
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The loader device allows the CPU's PC to be set from the command line. This
+can be done by following the syntax below::
+
+     -device loader,addr=<addr>,cpu-num=<cpu-num>
+
+``<addr>``
+  The value to use as the CPU's PC.
+
+``<cpu-num>``
+  The number of the CPU whose PC should be set to the specified value.
+
+All values are parsed using the standard QemuOpts parsing. This allows the user
+to specify any values in any format supported. By default the values
+will be parsed as decimal. To use hex values the user should prefix the number
+with a '0x'.
+
+An example of setting CPU 0's PC to 0x8000 is::
+
+    -device loader,addr=0x8000,cpu-num=0
+
+Loading Files
+^^^^^^^^^^^^^
+
+The loader device also allows files to be loaded into memory. It can load ELF,
+U-Boot, and Intel HEX executable formats as well as raw images.  The syntax is
+shown below:
+
+    -device loader,file=<file>[,addr=<addr>][,cpu-num=<cpu-num>][,force-raw=<raw>]
+
+``<file>``
+  A file to be loaded into memory
+
+``<addr>``
+  The memory address where the file should be loaded. This is required
+  for raw images and ignored for non-raw files.
+
+``<cpu-num>``
+  This specifies the CPU that should be used. This is an
+  optional argument and will cause the CPU's PC to be set to the
+  memory address where the raw file is loaded or the entry point
+  specified in the executable format header. This option should only
+  be used for the boot image. This will also cause the image to be
+  written to the specified CPU's address space. If not specified, the
+  default is CPU 0. <force-raw> - Setting force-raw=on forces the file
+  to be treated as a raw image. This can be used to load supported
+  executable formats as if they were raw.
+
+All values are parsed using the standard QemuOpts parsing. This allows the user
+to specify any values in any format supported. By default the values
+will be parsed as decimal. To use hex values the user should prefix the number
+with a '0x'.
+
+An example of loading an ELF file which CPU0 will boot is shown below::
+
+    -device loader,file=./images/boot.elf,cpu-num=0
+
+Restrictions and ToDos
+^^^^^^^^^^^^^^^^^^^^^^
+
+At the moment it is just assumed that if you specify a cpu-num then
+you want to set the PC as well. This might not always be the case. In
+future the internal state 'set_pc' (which exists in the generic loader
+now) should be exposed to the user so that they can choose if the PC
+is set or not.
+
+
diff --git a/docs/system/index.rst b/docs/system/index.rst
index 625b494372..cee1c83540 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -25,6 +25,7 @@ Contents:
    usb
    ivshmem
    linuxboot
+   generic-loader
    vnc-security
    tls
    gdb
diff --git a/MAINTAINERS b/MAINTAINERS
index ab6877dae6..774b3ca7a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1991,7 +1991,7 @@ M: Alistair Francis <alistair@alistair23.me>
 S: Maintained
 F: hw/core/generic-loader.c
 F: include/hw/core/generic-loader.h
-F: docs/generic-loader.txt
+F: docs/system/generic-loader.rst
 
 Guest Loader
 M: Alex Bennée <alex.bennee@linaro.org>
-- 
2.20.1


