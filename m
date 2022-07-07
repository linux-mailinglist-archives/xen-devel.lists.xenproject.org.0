Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C581256ACD8
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 22:38:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363126.593513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9YGb-0005sv-EN; Thu, 07 Jul 2022 20:38:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363126.593513; Thu, 07 Jul 2022 20:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9YGb-0005qf-AL; Thu, 07 Jul 2022 20:38:29 +0000
Received: by outflank-mailman (input) for mailman id 363126;
 Thu, 07 Jul 2022 20:38:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S5Xm=XM=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o9YGZ-0005FX-Sw
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 20:38:28 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c08297b8-fe34-11ec-bd2d-47488cf2e6aa;
 Thu, 07 Jul 2022 22:38:26 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id r21so5625640eju.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Jul 2022 13:38:27 -0700 (PDT)
Received: from uni.. (adsl-142.37.6.26.tellas.gr. [37.6.26.142])
 by smtp.googlemail.com with ESMTPSA id
 s17-20020a1709060c1100b00722e52d043dsm19344858ejf.114.2022.07.07.13.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 13:38:25 -0700 (PDT)
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
X-Inumbo-ID: c08297b8-fe34-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vpI0Eg9KfzwGX1e9i4YH3hbJD+D1xrKH9eSxJgwZEeo=;
        b=WxNh2FmivGG996dANC5w8c6Rv5bY/hKuttQb9oEjJjOKVwIKJOWKkZxBWF365PTGk2
         5q57Rto6GNdfFzRjSqSbZbOAZx91EbDMCHGEV7VAcjFRgzWfv6a4P9ApSL9B4Ibwl6r9
         kA0IuGH2nBdu57t5aRMmpOnZ//QNpf0jE5MIjhxPiRnagRxhcCp8qyUYD7NKxjNQAxqR
         RO/YynBg+mk+Q5crOgQ4NiHUDPGET62YFsk3fZnFh2VPTHcIdtVdob3kaiXYJ0GY+sLU
         NO9X8I136iFY4whMMksAqhiGqCuMkjoVB6bmCkeMFhbL6Yv7qQ28vUqIWreKL19HpRWU
         PTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vpI0Eg9KfzwGX1e9i4YH3hbJD+D1xrKH9eSxJgwZEeo=;
        b=f6CkNry7mbtbuGK8Du/4st4nI6dE2CueUIz00Kba3CT+S81SyImsEb9kmRMf448sVH
         ERUl8PinWa+98Os4NEUK3BByiAlWX4UCGHv6GlNHoLLa0YigngrYmnrOxDush7BMMAGa
         L1aJ+ehX3C04POOFVopbtGm/YEgyve0CNUkCwA8Hg6Uz0p90lXxMCiaKTRwtbaWSCKuW
         28m+rso06GgILwh1ht8SbCuB1L04dEpK9BrpP94sAH7lZu5YzUR7qCxIAuretgEMyMH9
         6XZLt4b/hFyMRA/W59y1+5eg4DyC955zvPBGeHX08Ud4hhQYpAdBrO+rJBsQ9kFHiwhP
         ZFSg==
X-Gm-Message-State: AJIora+96cbRK/F+7Je+d4TCgHEko42j95G0NyS0u91lTTSYfVFNjuhG
	UqrRSSFywVkHLO5XYFVpF4jjDHiro4A=
X-Google-Smtp-Source: AGRyM1umJab1NL2O2IU6i1UNh78+R1b4ihs9PuE1i/OvJKkN9EfPjVSVGqdQIvDG00ygXXZZp/B9rA==
X-Received: by 2002:a17:907:3e86:b0:6f5:917:10cc with SMTP id hs6-20020a1709073e8600b006f5091710ccmr46875855ejc.53.1657226306309;
        Thu, 07 Jul 2022 13:38:26 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] automation: arm64: Create a test job for testing static allocation on qemu
Date: Thu,  7 Jul 2022 23:38:03 +0300
Message-Id: <20220707203803.798317-3-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220707203803.798317-1-burzalodowa@gmail.com>
References: <20220707203803.798317-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an arm subdirectory under automation/configs for the arm specific configs
and add a config that enables static allocation.

Modify the build script to search for configs also in this subdirectory and to
keep the generated xen binary, suffixed with the config file name, as artifact.

Create a test job that
- boots xen on qemu with a single direct mapped dom0less guest configured with
statically allocated memory
- verifies that the memory ranges reported in the guest's logs are the same
with the provided static memory regions

For guest kernel, use the 5.9.9 kernel from the tests-artifacts containers.
Use busybox-static package, to create the guest ramdisk.
To generate the u-boot script, use ImageBuilder.
Use the qemu from the tests-artifacts containers.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 automation/configs/arm/static_mem          |   3 +
 automation/gitlab-ci/test.yaml             |  24 +++++
 automation/scripts/build                   |   4 +
 automation/scripts/qemu-staticmem-arm64.sh | 114 +++++++++++++++++++++
 4 files changed, 145 insertions(+)
 create mode 100644 automation/configs/arm/static_mem
 create mode 100755 automation/scripts/qemu-staticmem-arm64.sh

diff --git a/automation/configs/arm/static_mem b/automation/configs/arm/static_mem
new file mode 100644
index 0000000000..84675ddf4e
--- /dev/null
+++ b/automation/configs/arm/static_mem
@@ -0,0 +1,3 @@
+CONFIG_EXPERT=y
+CONFIG_UNSUPPORTED=y
+CONFIG_STATIC_MEMORY=y
\ No newline at end of file
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 42cd725a12..dc181f3777 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -205,3 +205,27 @@ qemu-smoke-x86-64-clang-pvh:
     - smoke
     - /^coverity-tested\/.*/
     - /^stable-.*/
+
+qemu-staticmem-arm64-gcc:
+  stage: test
+  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  variables:
+    CONTAINER: debian:unstable-arm64v8
+  script:
+    - ./automation/scripts/qemu-staticmem-arm64.sh 2>&1 | tee qemu-staticmem-arm64.log
+  dependencies:
+    - debian-unstable-gcc-arm64
+    - kernel-5.9.9-arm64-export
+    - qemu-system-aarch64-6.0.0-arm64-export
+  artifacts:
+    paths:
+      - qemu-staticmem.serial
+      - '*.log'
+    when: always
+  tags:
+    - arm64
+  except:
+    - master
+    - smoke
+    - /^coverity-tested\/.*/
+    - /^stable-.*/
diff --git a/automation/scripts/build b/automation/scripts/build
index 21b3bc57c8..9c6196d9bd 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -83,6 +83,7 @@ fi
 # Build all the configs we care about
 case ${XEN_TARGET_ARCH} in
     x86_64) arch=x86 ;;
+    arm64) arch=arm ;;
     *) exit 0 ;;
 esac
 
@@ -93,4 +94,7 @@ for cfg in `ls ${cfg_dir}`; do
     rm -f xen/.config
     make -C xen KBUILD_DEFCONFIG=../../../../${cfg_dir}/${cfg} defconfig
     make -j$(nproc) -C xen
+    if [[ ${arch} == "arm" ]]; then
+        cp xen/xen binaries/xen-${cfg}
+    fi
 done
diff --git a/automation/scripts/qemu-staticmem-arm64.sh b/automation/scripts/qemu-staticmem-arm64.sh
new file mode 100755
index 0000000000..5b89a151aa
--- /dev/null
+++ b/automation/scripts/qemu-staticmem-arm64.sh
@@ -0,0 +1,114 @@
+#!/bin/bash
+
+base=(0x50000000 0x100000000)
+size=(0x10000000 0x10000000)
+
+set -ex
+
+apt-get -qy update
+apt-get -qy install --no-install-recommends u-boot-qemu \
+                                            u-boot-tools \
+                                            device-tree-compiler \
+                                            cpio \
+                                            curl \
+                                            busybox-static
+
+# DomU Busybox
+cd binaries
+mkdir -p initrd
+mkdir -p initrd/bin
+mkdir -p initrd/sbin
+mkdir -p initrd/etc
+mkdir -p initrd/dev
+mkdir -p initrd/proc
+mkdir -p initrd/sys
+mkdir -p initrd/lib
+mkdir -p initrd/var
+mkdir -p initrd/mnt
+cp /bin/busybox initrd/bin/busybox
+initrd/bin/busybox --install initrd/bin
+echo "#!/bin/sh
+
+mount -t proc proc /proc
+mount -t sysfs sysfs /sys
+mount -t devtmpfs devtmpfs /dev
+/bin/sh" > initrd/init
+chmod +x initrd/init
+cd initrd
+find . | cpio --create --format='newc' | gzip > ../initrd.cpio.gz
+cd ../..
+
+# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
+curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
+
+./binaries/qemu-system-aarch64 -nographic \
+    -M virtualization=true \
+    -M virt \
+    -M virt,gic-version=2 \
+    -cpu cortex-a57 \
+    -smp 2 \
+    -m 8G \
+    -M dumpdtb=binaries/virt-gicv2.dtb
+
+#dtc -I dtb -O dts binaries/virt-gicv2.dtb > binaries/virt-gicv2.dts
+
+# ImageBuilder
+rm -rf imagebuilder
+git clone https://gitlab.com/ViryaOS/imagebuilder
+
+echo "MEMORY_START=\"0x40000000\"
+MEMORY_END=\"0x0200000000\"
+
+DEVICE_TREE=\"virt-gicv2.dtb\"
+
+XEN=\"xen-static_mem\"
+XEN_CMD=\"console=dtuart earlyprintk xsm=dummy\"
+
+NUM_DOMUS=1
+DOMU_MEM[0]=512
+DOMU_VCPUS[0]=1
+DOMU_KERNEL[0]=\"Image\"
+DOMU_RAMDISK[0]=\"initrd.cpio.gz\"
+DOMU_CMD[0]=\"earlyprintk console=ttyAMA0\"
+DOMU_STATIC_MEM[0]=\"${base[0]} ${size[0]} ${base[1]} ${size[1]}\"
+
+UBOOT_SOURCE=\"boot.source\"
+UBOOT_SCRIPT=\"boot.scr\"" > binaries/imagebuilder_config
+
+bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/imagebuilder_config
+
+# Run the test
+rm -f qemu-staticmem.serial
+set +e
+echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
+timeout -k 1 60 ./binaries/qemu-system-aarch64 -nographic \
+    -M virtualization=true \
+    -M virt \
+    -M virt,gic-version=2 \
+    -cpu cortex-a57 \
+    -smp 2 \
+    -m 8G \
+    -no-reboot \
+    -device virtio-net-pci,netdev=vnet0 -netdev user,id=vnet0,tftp=binaries \
+    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin \
+    -dtb ./binaries/virt-gicv2.dtb \
+    |& tee qemu-staticmem.serial
+
+set -e
+
+(grep -q "Xen dom0less mode detected" qemu-staticmem.serial) || exit 1
+
+for ((i=0; i<${#base[@]}; i++))
+do
+    start="$(printf "0x%016x" ${base[$i]})"
+    end="$(printf "0x%016x" $((${base[$i]} + ${size[$i]} - 1)))"
+    grep -q "node   0: \[mem ${start}-${end}\]" qemu-staticmem.serial
+    if test $? -eq 1
+    then
+        exit 1
+    fi
+done
+
+(grep -q "BusyBox" qemu-staticmem.serial) || exit 1
+
+exit 0
-- 
2.34.1


