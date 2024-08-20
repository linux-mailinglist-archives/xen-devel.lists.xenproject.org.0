Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AECC958950
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 16:30:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780546.1190268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPsI-0004wb-1W; Tue, 20 Aug 2024 14:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780546.1190268; Tue, 20 Aug 2024 14:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPsH-0004nI-MR; Tue, 20 Aug 2024 14:30:17 +0000
Received: by outflank-mailman (input) for mailman id 780546;
 Tue, 20 Aug 2024 14:30:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=prYO=PT=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sgPsF-0000m9-NU
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 14:30:15 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7471464-5f00-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 16:30:15 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2f3b8eb3df5so56463381fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 07:30:15 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5330d41ec8bsm1774535e87.217.2024.08.20.07.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 07:30:13 -0700 (PDT)
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
X-Inumbo-ID: b7471464-5f00-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724164215; x=1724769015; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdxPAmDEdUAtpsJzqv9PT9FKB3N+OoRAOYXGitcO7RQ=;
        b=g8Jdsy4MGpXTpFcHubkj5du1GIXuzn9nL6875ttmnqv61vHVO1JFBkLA5KvyBdsFgl
         emoeJFapBRz4p8EWc5D6fNZbIlaSAkFutd3wyKeDYQtLwBPjnhjzfxxvWcHmcyfvrmfH
         Z+GZ3q20MBefnORRu0lZKS/CwYT2a83p45qO5TxyQXJBf1zQxEMReFYRLVx8YWtP4NeS
         kIbwsO2CS2P3+K5CPex+LkZ3NYv7IVdYwjWW4WygVqj2zdZNVVwnyYcOIth8TCFXBQji
         ufmT0hHHkmYu9iVg6WAo2gqH1lS7rgmFoQDtYUY86EhXOfGrkapfYgj93TeZagOehwYv
         8yog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724164215; x=1724769015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KdxPAmDEdUAtpsJzqv9PT9FKB3N+OoRAOYXGitcO7RQ=;
        b=daXCqnafLLpOKFjnX+E7P4NLHwADTKs1DF6XULE6ZJXhQ3DNMSLhC1U05vY/ghXbtS
         nq0pq95lgHQaApQERlz819zGnu84N0aUMzgQxoOUN444lgBPTgCPBVV5UkDIhms9Tags
         vHhT49P1ij4QgCFBL8BfuI7OziVNwaj/Q/SzchX+yxPYxsinxgFe6rodYRw4e+FLluyg
         elb9VNYO99LmD6L891OWQQM04UI6H2cyXwB+gImc1t/eZHUq/T7+6nscFO+vG+X8v5jF
         f1mLdIMiW/JjPWjdjhxaB6/kNJBMJGlaeApn5L7JouRswc9IelDDhFmXTx3ldHEI+Gc8
         lZLA==
X-Forwarded-Encrypted: i=1; AJvYcCWGss+yL5j3PngGW905udKFc7MwO7r5eMZ7uvyM+Fp3hP27s86P8M/r/gGPE/b1mt9A7cMYAK62YSniub3/osRdLkzSu+Mq6/dHVSpz2JE=
X-Gm-Message-State: AOJu0Yw8EaENEhR2x70G/qwbWiQp97hdof3hYlE6ygDJLlUt/gMqbWdt
	eGb4+tJr5fp3mHI31w/5ciUHpPr/sln4bvxAOo/51bMZAzl+S+4ySduLNOK1
X-Google-Smtp-Source: AGHT+IH2aSjaMdTU2w0L6jdfmyJXJpGAlgjDdskYkq7lMNexOEvEkzPUF5ILk79x6nw61ZRcBw/gvA==
X-Received: by 2002:a05:6512:3195:b0:530:d088:233f with SMTP id 2adb3069b0e04-5331c6d99c0mr9799180e87.40.1724164213973;
        Tue, 20 Aug 2024 07:30:13 -0700 (PDT)
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
Subject: [PATCH v2 12/12] docs/system/i386: xenpvh: Add a basic description
Date: Tue, 20 Aug 2024 16:29:49 +0200
Message-ID: <20240820142949.533381-13-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820142949.533381-1-edgar.iglesias@gmail.com>
References: <20240820142949.533381-1-edgar.iglesias@gmail.com>
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


