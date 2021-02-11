Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4353190D9
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 18:20:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84032.157469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAFdY-0004pn-RZ; Thu, 11 Feb 2021 17:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84032.157469; Thu, 11 Feb 2021 17:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAFdY-0004pD-L2; Thu, 11 Feb 2021 17:20:16 +0000
Received: by outflank-mailman (input) for mailman id 84032;
 Thu, 11 Feb 2021 17:20:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kYUG=HN=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1lAFdW-0003q3-Tv
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 17:20:14 +0000
Received: from mail-wm1-x32e.google.com (unknown [2a00:1450:4864:20::32e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ba1dfdb-01d5-4529-a047-c4b4dec59cac;
 Thu, 11 Feb 2021 17:19:57 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id u14so6515498wmq.4
 for <xen-devel@lists.xenproject.org>; Thu, 11 Feb 2021 09:19:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t2sm6150461wru.53.2021.02.11.09.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 09:19:50 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B7B281FF92;
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
X-Inumbo-ID: 7ba1dfdb-01d5-4529-a047-c4b4dec59cac
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uM4w7EGKPDq+ZH1NX/u4HRpRj7Wv3jOo9v6vSIC9Mdc=;
        b=vHLzZeY8yAlnzz3oPqOA73YhmPGd2nzHr7sXDHSuuhg8QK/Np6A21wjmNHmiYg/QC4
         hVuUw+OWoYaCJciF551k0XP7YWaD+JmYjDQ7DS0bRiLpJStdrxMJqdihp14lpTqvV3Mj
         jx4mj2E/FibSVPt+QgZM5WKATDnj8YWTzayC8fN37Dcs6Pm6NXwlVc9HG5gLe1OuqNuP
         +4LW89pCv8R8j8Oj+oxniURRjmuW6K/gnUcM3p5eIV4ldo1YNe5Q/ghbQGH4LvavOI7M
         aujY8A9uT460jUB3xa7cq7hTf8XonUWO3NBTiPHkyIpFo0Wh/2PHkcupgJleiiFHiHpU
         V2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uM4w7EGKPDq+ZH1NX/u4HRpRj7Wv3jOo9v6vSIC9Mdc=;
        b=NCSbXOIfVkLyOOAPouH/+hIRW6S3JsgErf+gW8kJHtuDnGWWshImHfiJj4s5ElYS0w
         xp9vrKWg9G2jv7SxNz2EJu9i7n3e5RgpJiWilDBTDSo6ZEdoDB8WirJEWprU0uzNK8PC
         LkHsH/EvyCIU8GGo9tfIHELcYAbsDG/GXAJvI//A2hyypsyJa/VJ7dTfJLdWYFyOM6Fo
         3L2UuLn2AXmlUI9+ROalILT34P9mtetHFuWHVdr4TU+M05LTBQrDMOJuHvDjvG152c3E
         +GFOpqpFxn3mCLDEeotDaYw2hpIne4ySCigyxUokpVJyq2Gf2s514mo+ETX4aoCE3ZE4
         FoSg==
X-Gm-Message-State: AOAM5331nKSJmeozBYwh60zF/19dspx3fmq110JHoiIEP+kxQrxI8xqI
	EHDDXJ8P2cEfwkKwz+HShgRGQw==
X-Google-Smtp-Source: ABdhPJxzExjbkoFfYqwsuLpSdRjf+qkuuNTtEVUPGY9I1u8td6zf8I21bZRLpAq+wV1D9X5W43+cbQ==
X-Received: by 2002:a05:600c:4894:: with SMTP id j20mr6335347wmp.152.1613063996346;
        Thu, 11 Feb 2021 09:19:56 -0800 (PST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: julien@xen.org,
	stefano.stabellini@linaro.org,
	stefano.stabellini@xilinx.com,
	andre.przywara@arm.com,
	stratos-dev@op-lists.linaro.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 6/7] docs: add some documentation for the guest-loader
Date: Thu, 11 Feb 2021 17:19:44 +0000
Message-Id: <20210211171945.18313-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211171945.18313-1-alex.bennee@linaro.org>
References: <20210211171945.18313-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20201105175153.30489-7-alex.bennee@linaro.org>

---
v2
  - add docs and MAINTAINERS
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
index 774b3ca7a5..853f174fcf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1997,6 +1997,7 @@ Guest Loader
 M: Alex Bennée <alex.bennee@linaro.org>
 S: Maintained
 F: hw/core/guest-loader.c
+F: docs/system/guest-loader.rst
 
 Intel Hexadecimal Object File Loader
 M: Su Hang <suhang16@mails.ucas.ac.cn>
-- 
2.20.1


