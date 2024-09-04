Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF9D96C3C1
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 18:16:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790559.1200451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slsfs-000493-IC; Wed, 04 Sep 2024 16:16:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790559.1200451; Wed, 04 Sep 2024 16:16:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slsfs-00041M-As; Wed, 04 Sep 2024 16:16:04 +0000
Received: by outflank-mailman (input) for mailman id 790559;
 Wed, 04 Sep 2024 16:16:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ufny=QC=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1slsfq-0000I6-5u
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 16:16:02 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa4c4541-6ad8-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 18:16:01 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2f50966c448so78902591fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 09:16:01 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f66362f6ecsm321501fa.67.2024.09.04.09.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 09:15:59 -0700 (PDT)
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
X-Inumbo-ID: fa4c4541-6ad8-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725466561; x=1726071361; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdxPAmDEdUAtpsJzqv9PT9FKB3N+OoRAOYXGitcO7RQ=;
        b=mZqr1AUuprYV4st4YKuixFqCftbL1dRsHIQQrkRQijs37s4W3BZtl1/PGhsHlmnsJt
         Awb0QjNY/BT+KItiWrPYIEVVHXHLo/6oRkgV19IorctcEqkFk37ZnJN+TxmcLg7FdYc6
         t9fMTMe1YevdZp+TrWa4aLT1SfJHVlrI5Jm2l9S3fDmUcB08hzS2MpzlF3MIdjqr61jm
         V/jMbLJOiEp1SvqEKxP3jkSy02wWZjcJuKlpLhwRHEkF3ODkKZ0fEys1oZRbUvzRsP8l
         ZuIbIKLhSgVLUyFBgxGA6ryhoZ54OAYF6PSQqfS9ZGk60WIjgmu0HP1rBior9cBKds+B
         UPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725466561; x=1726071361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KdxPAmDEdUAtpsJzqv9PT9FKB3N+OoRAOYXGitcO7RQ=;
        b=IVEiYS8WximjzFeG+O87Hgap66H5YZVoIzngI+QiJpNzl5GeQ40qCS2thv+t3PW8FD
         93/etNC9nB5cz3TWcseWNtmeYMUWMycenr2qKWOy8kYBmsnqeyGiv7iLOGLvuXV04GgW
         +3TP6S7Jym5LM+oJ6APwaKTV0jJf1Zs26SlmvLCBvAUWoAth6L1TmyHG0nq8ZU50sikp
         8iEJuqZ7+AOiwPet0CvvwVq8Zx3KFJEEomfYBN6jBQYTjnGToHYkEF2Sg8MtLsrHnGQ2
         CK/ex8FNcXMmvTY2sfiaKqB3tMNRbbFrTm3knoEKOr6Tb69lx/URA7kOZ87ET4E4+EEX
         9PGA==
X-Forwarded-Encrypted: i=1; AJvYcCWVxNb1MhjU2dwz9/Wzd6fAVyEoUVkaFgJP4mOfZcXOP2sHWPOy93DloKFOy/MJJ6bEzxsmX3oQ0kM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZ0hAYw9AGlbT8R6pnfDpEJP9DDqGf4SZH0HXjG7iYS1CeAEsI
	iDug2fYBHNxsvrLDpNAy2x6UUEWqoHvpjGsMo7D+DZTuNYeRl0mQ
X-Google-Smtp-Source: AGHT+IFAdjefLP0GVVZKIUrpFKMNdvV3ASjqYkfelwsocfjh9WpkL3JieubicWsRTNAejwGyS1Ovnw==
X-Received: by 2002:a2e:460a:0:b0:2f6:4bed:9b44 with SMTP id 38308e7fff4ca-2f64bed9bf0mr27782561fa.47.1725466561028;
        Wed, 04 Sep 2024 09:16:01 -0700 (PDT)
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
Subject: [PULL v1 12/12] docs/system/i386: xenpvh: Add a basic description
Date: Wed,  4 Sep 2024 18:15:36 +0200
Message-ID: <20240904161537.664189-13-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904161537.664189-1-edgar.iglesias@gmail.com>
References: <20240904161537.664189-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 MAINTAINERS                 |  1 +
 docs/system/i386/xenpvh.rst | 49 +++++++++++++++++++++++++++++++++++++
 docs/system/target-i386.rst |  1 +
 3 files changed, 51 insertions(+)
 create mode 100644 docs/system/i386/xenpvh.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index c2fb0c2f42..c14ac014e2 100644
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


