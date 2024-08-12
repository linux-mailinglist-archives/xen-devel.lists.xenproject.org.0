Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB51794EDB4
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 15:06:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775505.1185796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdUkv-00027N-3N; Mon, 12 Aug 2024 13:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775505.1185796; Mon, 12 Aug 2024 13:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdUku-00021j-Tw; Mon, 12 Aug 2024 13:06:36 +0000
Received: by outflank-mailman (input) for mailman id 775505;
 Mon, 12 Aug 2024 13:06:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FAji=PL=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sdUks-00074b-Ke
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 13:06:34 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b31e9298-58ab-11ef-bc05-fd08da9f4363;
 Mon, 12 Aug 2024 15:06:34 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ef2c56d9dcso49208671fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Aug 2024 06:06:34 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f29203d7ebsm8631921fa.83.2024.08.12.06.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 06:06:31 -0700 (PDT)
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
X-Inumbo-ID: b31e9298-58ab-11ef-bc05-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723467993; x=1724072793; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKBi8KqYhGDFlqsXHx9Zw2bI17GecQkQjZL9UWM7DqA=;
        b=kuUQm91TepPzeX6i4z1QYb7s6hZ1cgAqABPCKGKu3MpvVpr3auZGk9Gu5Y8GxOXU4R
         dG3+QI60Hkt+HGY+sZQDjC4yNd+sMiyIKGQMUjYKxmKzqBaGYQYpOJxQbprVWIVV/aQi
         jC2hLBR+8Um+vX2yrQJ4GakXk0U0xzC/VDyUCLU7WPyKeXGoy/DUSJUZzG+EGibEYKCb
         u75k7Qf1pWuU1Wxa3ceInxEL8pMjSpZRMLiN2FEvkhudXPRxBjnRk0ki7ETHBU1NcHki
         EDA1UllcrgHGNDuqy+S+vAGtg3J3c8zWNJFOw8Cj+kzqYhxIoEoS/S0Bbqa6X5uVB8ZZ
         ZsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723467993; x=1724072793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKBi8KqYhGDFlqsXHx9Zw2bI17GecQkQjZL9UWM7DqA=;
        b=fxz+z/kKGCW5Z6RBh2uWQwGoM3CjRqjUVpn8ZpYhisgSP7AxxYEgYTL9rUx1/0C1WK
         sxZb674F2cc7xYkph6pfwQOPgi46nJxJ0e0RAYTZtYIL3/0NlbM4XOTRK4u3hAUD8glD
         NUny34tMO//VFuGBsnTwOpkxij+EImTo8XWvArrqUe12YBWhqQY4UEil/N0d6boKQwH/
         kgSrbOWBNKDWkCbK5C24Ny1wzu4rPvFFlYXFz1TfjdyB9AS4Lo7HqFP5GbRSILQM5xTX
         fuTGVQgMYGr6NoOuXkN5al9rmLwRdtnvx03CepD6KaOIsKVcmUAK9BAaXcDhDA3LjtSU
         nIZg==
X-Forwarded-Encrypted: i=1; AJvYcCV0koXZNFNYmnG5EMsSZtW1eAK7qvoedo/fT/NoyxueC9hFnUBzbsVAhmxhF5sjpazxjeEA8PBediNHERlEo0W+1MunBLUjRupfgHIgf2A=
X-Gm-Message-State: AOJu0Yz0fDrc6uOH/anVEM4WeSah0Jq8eCv2diY48k9ndNU4Jbi2yl4r
	mnQbh1edhGPOcfUMrLgzq6GpcfOgYweyfFb4FrnBG4c0mEJv5B2+
X-Google-Smtp-Source: AGHT+IFc8uBG8fAqe8QiFu7qL5vOSuGxpFRzQNhkfUh2olLgNFB3zwVq8FCW9cJURrXcMaKyPvPWuQ==
X-Received: by 2002:a2e:9c10:0:b0:2ef:22bc:6fb0 with SMTP id 38308e7fff4ca-2f2b7179ecbmr1400471fa.34.1723467992891;
        Mon, 12 Aug 2024 06:06:32 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	xenia.ragiadakou@amd.com,
	jason.andryuk@amd.com,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v1 10/10] docs/system/i386: xenpvh: Add a basic description
Date: Mon, 12 Aug 2024 15:06:05 +0200
Message-ID: <20240812130606.90410-11-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812130606.90410-1-edgar.iglesias@gmail.com>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 MAINTAINERS                 |  1 +
 docs/system/i386/xenpvh.rst | 49 +++++++++++++++++++++++++++++++++++++
 docs/system/target-i386.rst |  1 +
 3 files changed, 51 insertions(+)
 create mode 100644 docs/system/i386/xenpvh.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index a24c2e14d9..da4c9d4d46 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -560,6 +560,7 @@ F: include/sysemu/xen.h
 F: include/sysemu/xen-mapcache.h
 F: stubs/xen-hw-stub.c
 F: docs/system/arm/xenpvh.rst
+F: docs/system/i386/xenpvh.rst
 
 Guest CPU Cores (NVMM)
 ----------------------
diff --git a/docs/system/i386/xenpvh.rst b/docs/system/i386/xenpvh.rst
new file mode 100644
index 0000000000..354250f073
--- /dev/null
+++ b/docs/system/i386/xenpvh.rst
@@ -0,0 +1,49 @@
+Xen PVH machine (``xenpvh``)
+=========================================
+
+Xen supports a spectrum of types of guests that vary in how they depend
+on HW virtualization features, emulation models and paravirtualization.
+PVH is a mode that uses HW virtualization features (like HVM) but tries
+to avoid emulation models and instead use passthrough or
+paravirtualized devices.
+
+QEMU can be used to provide PV virtio devices on an emulated PCIe controller.
+That is the purpose of this minimal machine.
+
+Supported devices
+-----------------
+
+The x86 Xen PVH QEMU machine provide the following devices:
+
+- RAM
+- GPEX host bridge
+- virtio-pci devices
+
+The idea is to only connect virtio-pci devices but in theory any compatible
+PCI device model will work depending on Xen and guest support.
+
+Running
+-------
+
+The Xen tools will typically construct a command-line and launch QEMU
+for you when needed. But here's an example of what it can look like in
+case you need to construct one manually:
+
+.. code-block:: console
+
+    qemu-system-i386 -xen-domid 3 -no-shutdown        \
+      -chardev socket,id=libxl-cmd,path=/var/run/xen/qmp-libxl-3,server=on,wait=off \
+      -mon chardev=libxl-cmd,mode=control             \
+      -chardev socket,id=libxenstat-cmd,path=/var/run/xen/qmp-libxenstat-3,server=on,wait=off \
+      -mon chardev=libxenstat-cmd,mode=control        \
+      -nodefaults                                     \
+      -no-user-config                                 \
+      -xen-attach -name g0                            \
+      -vnc none                                       \
+      -display none                                   \
+      -device virtio-net-pci,id=nic0,netdev=net0,mac=00:16:3e:5c:81:78 \
+      -netdev type=tap,id=net0,ifname=vif3.0-emu,br=xenbr0,script=no,downscript=no \
+      -smp 4,maxcpus=4                                \
+      -nographic                                      \
+      -machine xenpvh,ram-low-base=0,ram-low-size=2147483648,ram-high-base=4294967296,ram-high-size=2147483648,pci-ecam-base=824633720832,pci-ecam-size=268435456,pci-mmio-base=4026531840,pci-mmio-size=33554432,pci-mmio-high-base=824902156288,pci-mmio-high-size=68719476736 \
+      -m 4096
diff --git a/docs/system/target-i386.rst b/docs/system/target-i386.rst
index 1b8a1f248a..23e84e3ba7 100644
--- a/docs/system/target-i386.rst
+++ b/docs/system/target-i386.rst
@@ -26,6 +26,7 @@ Architectural features
    i386/cpu
    i386/hyperv
    i386/xen
+   i386/xenpvh
    i386/kvm-pv
    i386/sgx
    i386/amd-memory-encryption
-- 
2.43.0


