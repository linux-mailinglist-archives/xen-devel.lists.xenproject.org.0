Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B35432B9B4
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 19:09:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92934.175336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHVQz-0000BE-CN; Wed, 03 Mar 2021 17:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92934.175336; Wed, 03 Mar 2021 17:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHVQz-0000AJ-6e; Wed, 03 Mar 2021 17:37:17 +0000
Received: by outflank-mailman (input) for mailman id 92934;
 Wed, 03 Mar 2021 17:37:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Voz6=IB=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1lHVQx-0008CL-Sv
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 17:37:15 +0000
Received: from mail-wr1-x42b.google.com (unknown [2a00:1450:4864:20::42b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06c96479-fabf-424f-9418-338e290f6d7d;
 Wed, 03 Mar 2021 17:36:53 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d15so9372821wrv.5
 for <xen-devel@lists.xenproject.org>; Wed, 03 Mar 2021 09:36:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v13sm7752139wrt.45.2021.03.03.09.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 09:36:48 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E80CC1FF92;
 Wed,  3 Mar 2021 17:36:42 +0000 (GMT)
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
X-Inumbo-ID: 06c96479-fabf-424f-9418-338e290f6d7d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PmQ9WuVuI0VGnZuuNn7EAfs0gdyLaSensm8NVod8pVg=;
        b=HWZI308TJukFvtbSn2loLICxIM06pNa74CZg42QaWzfoaKYQ+genJTnkvoaM9IXVld
         2b5hR4qm8XIP6VW1wuB58ITdyIHJcPuUHPgK3wlq8wIp2EQ7D6pw1V+0IqAQpBYPei1H
         XHZlOovl9TlWKnnfs2/wmowMAPi/7bUooNTs0ZOeaj7ae6gtczIbKANrUMoIhlQTGM9G
         m7uy34F/TPNZ799fsSXEIkNJCTpcGFfzfPAMNK5QlQcpb6zzq10ipWQbf7AoV8ympQIi
         bFAciZJCUY8q0/wiDDBOf9JD1ofxx+H2TA5cxGqlbidXkHQtuNAP3UJeQRTuRhqxVC4I
         zEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PmQ9WuVuI0VGnZuuNn7EAfs0gdyLaSensm8NVod8pVg=;
        b=WPkXNDIvW6lHRm1DLg6PsV8lNO6owfMopxqns3VHGRCO4OCV8mXwvTEqChaF15RaGi
         b7EIpGKZl/YBcjoGFbHxPs/mrGgbN4xC7PwtoYN7Ub4pcH7pi36j6FOxAXB5lxOJ6TX5
         Oy4Htj4jV1tNLQwWDm3Q2sxDgaJefu7+cRHXE6xM6I1kT6AljP/IEim28jnhjFD+M+Ls
         Py8c4UHabXNSTLnuI1OMogiARQfgX+Q0USY8z5WlkfsBScahr/tDoJPqbocBdZPLRbmt
         RI9wfCz34RyEqINwaCTCjPy1yZPJ2Eub0tq3/nCO3KDGdEf3cSewSmid77/nG9B5v1P6
         3d0g==
X-Gm-Message-State: AOAM530PO+hYJcYo9C+S0fugSdYE9JWq2nIyg/X/fP0qR10eb5nMdpWH
	ZDZ8Q2Fl+rRk9e6rCqqXSHUz1Q==
X-Google-Smtp-Source: ABdhPJy26X6i0Wu/nkBtfpoLZsbBTaHgfgWyBsKvtkLCsqrS9ybg7BnEbcUgmQFGAk8CrTvbGndY9Q==
X-Received: by 2002:adf:ea0e:: with SMTP id q14mr9538076wrm.389.1614793012908;
        Wed, 03 Mar 2021 09:36:52 -0800 (PST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: julien@xen.org,
	stefano.stabellini@linaro.org,
	stefano.stabellini@xilinx.com,
	andre.przywara@arm.com,
	stratos-dev@op-lists.linaro.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH  v3 6/7] docs: add some documentation for the guest-loader
Date: Wed,  3 Mar 2021 17:36:41 +0000
Message-Id: <20210303173642.3805-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210303173642.3805-1-alex.bennee@linaro.org>
References: <20210303173642.3805-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20201105175153.30489-7-alex.bennee@linaro.org>
Message-Id: <20210211171945.18313-7-alex.bennee@linaro.org>
---
 docs/system/guest-loader.rst | 54 ++++++++++++++++++++++++++++++++++++
 docs/system/index.rst        |  1 +
 MAINTAINERS                  |  1 +
 3 files changed, 56 insertions(+)
 create mode 100644 docs/system/guest-loader.rst

diff --git a/docs/system/guest-loader.rst b/docs/system/guest-loader.rst
new file mode 100644
index 0000000000..37d03cbd89
--- /dev/null
+++ b/docs/system/guest-loader.rst
@@ -0,0 +1,54 @@
+..
+   Copyright (c) 2020, Linaro
+
+Guest Loader
+------------
+
+The guest loader is similar to the `generic-loader` although it is
+aimed at a particular use case of loading hypervisor guests. This is
+useful for debugging hypervisors without having to jump through the
+hoops of firmware and boot-loaders.
+
+The guest loader does two things:
+
+  - load blobs (kernels and initial ram disks) into memory
+  - sets platform FDT data so hypervisors can find and boot them
+
+This is what is typically done by a boot-loader like grub using it's
+multi-boot capability. A typical example would look like:
+
+.. parsed-literal::
+
+  |qemu_system| -kernel ~/xen.git/xen/xen \
+    -append "dom0_mem=1G,max:1G loglvl=all guest_loglvl=all" \
+    -device guest-loader,addr=0x42000000,kernel=Image,bootargs="root=/dev/sda2 ro console=hvc0 earlyprintk=xen" \
+    -device guest-loader,addr=0x47000000,initrd=rootfs.cpio
+
+In the above example the Xen hypervisor is loaded by the -kernel
+parameter and passed it's boot arguments via -append. The Dom0 guest
+is loaded into the areas of memory. Each blob will get
+`/chosen/module@<addr>` entry in the FDT to indicate it's location and
+size. Additional information can be passed with by using additional
+arguments.
+
+Currently the only supported machines which use FDT data to boot are
+the ARM and RiscV `virt` machines.
+
+Arguments
+^^^^^^^^^
+
+The full syntax of the guest-loader is::
+
+  -device guest-loader,addr=<addr>[,kernel=<file>,[bootargs=<args>]][,initrd=<file>]
+
+``addr=<addr>``
+  This is mandatory and indicates the start address of the blob.
+
+``kernel|initrd=<file>``
+  Indicates the filename of the kernel or initrd blob. Both blobs will
+  have the "multiboot,module" compatibility string as well as
+  "multiboot,kernel" or "multiboot,ramdisk" as appropriate.
+
+``bootargs=<args>``
+  This is an optional field for kernel blobs which will pass command
+  like via the `/chosen/module@<addr>/bootargs` node.
diff --git a/docs/system/index.rst b/docs/system/index.rst
index cee1c83540..6ad9c93806 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -26,6 +26,7 @@ Contents:
    ivshmem
    linuxboot
    generic-loader
+   guest-loader
    vnc-security
    tls
    gdb
diff --git a/MAINTAINERS b/MAINTAINERS
index 34cdd20672..8ec6fbc259 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2011,6 +2011,7 @@ Guest Loader
 M: Alex Bennée <alex.bennee@linaro.org>
 S: Maintained
 F: hw/core/guest-loader.c
+F: docs/system/guest-loader.rst
 
 Intel Hexadecimal Object File Loader
 M: Su Hang <suhang16@mails.ucas.ac.cn>
-- 
2.20.1


