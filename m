Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 923FB9E173E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 10:22:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847540.1262661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIP72-0005tx-Ql; Tue, 03 Dec 2024 09:22:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847540.1262661; Tue, 03 Dec 2024 09:22:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIP72-0005s1-Lw; Tue, 03 Dec 2024 09:22:32 +0000
Received: by outflank-mailman (input) for mailman id 847540;
 Tue, 03 Dec 2024 09:22:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yzh2=S4=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tIP70-0003Be-Sp
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 09:22:30 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e7d1ce8-b158-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 10:22:30 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-53dd2fdcebcso6021936e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 01:22:30 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.146])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5998e6a1asm591445466b.98.2024.12.03.01.22.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 03 Dec 2024 01:22:29 -0800 (PST)
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
X-Inumbo-ID: 1e7d1ce8-b158-11ef-a0d3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733217750; x=1733822550; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKNytw/ebCVRIpsQ9YAUBfkaMh3JJAq/QjBPjtgiz7g=;
        b=tiZQhQEIPQIT8irrTmv4wfI8mWIq+3djWnxplVzAOg6zpBud4yyMRPlW8VTWdEaQaE
         xCluZ4uFXLW4psMqeUZZW66Xe0y/J6SGVULHoKxELhKH05WuQrdsnDhOxImuT4EhbU6P
         G3cOJLE6f9L7WpoR19Ts4urCvPSjDRTFtZAl9JXdskkwoejxaU5q1ay5Tq3bIploADoI
         BdouQylsettHVvRk0i4IfeuqYXY4MXKDUV6Zrv2L33JfydP5/M0Y+oWBsSFzgmpBxRZX
         60IquTZ4dxr4AL3s04AWovDSflkhoCZbvIyxTZ0zMnMBvOdqGw4zCja9ft6S3hfKZdHf
         cBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733217750; x=1733822550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKNytw/ebCVRIpsQ9YAUBfkaMh3JJAq/QjBPjtgiz7g=;
        b=G/CKNF6V6+LQ464yS3FeAv/aRCxwt5OvrpaNFyxCKb/0wUg3jPbfVE1SF/8/Rbrtq9
         S374FUriDeSruhe/0YOLASn0sM/DDXlcN3hd56TtQVScRnG44fUCacM8kUZiO0sOYACh
         N2L6/dqFeHrsSWafGt+gsMNW8two0wLjJ2tP7EWF7+lVOxs45fjTfrVYHrAdmGZL3zCb
         4ohvHHDq1cVVzdZSrKRHWA1KczDalfSXd6mjtoKiVshdVGJfBG3ne5wiIzGq2R+cJtsh
         28fDbarp1oYa/0qdmZK/bGDAWoljNIVgfPqva7qrUcRssusy84XX+iyb0QnHwBRqUFWU
         E85g==
X-Forwarded-Encrypted: i=1; AJvYcCWOCclv09JOl6jLAFaZLCm8xC5Ot2mXqn+pf8Rlqpuw4zu4XFw20Ah/O9pOJHmHO48pLY2plScs0rk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwfZPnS+i9dwmm06/hrtu7CAu7fxhZtb9solbK36+vNw2ZFGICx
	VLHEPYq4RF55KdhjJy+Vd25K0FAQiAk6K5NJPlWBn7VXaSVqwGoNpzMoDBeAEsTHi+WTPalzeR5
	WrJo=
X-Gm-Gg: ASbGncujykWLhJ7KdS1S6N+QVhnrNJDXAuMo70rFV/v9z1d/i+DflQEjPyVnhwxeVB6
	HJzdGLY1N9ieZr9Y7ItxHseoTDmXW7vf3rLlYpYEd9KKHKtTvbD5cliph8CIgIeqAitoVILhQkS
	RnG8VW8o1dGHVGdEI5L+bc1fsxmQgx1Dx9wG7d2tQMiLJupn5rePgXQ+O+iWCiIdPphFUhJREBJ
	GMrZ7GN5W9w4wHMRdSYVqmIb//sxGsvmASFhfN46R4Nu9aXqH8Gyb8bUE/qACITg2c/MU6k
X-Google-Smtp-Source: AGHT+IFcpj6QzfB53oly3i7BN3QSlvt4/aDJxnH7tiR3CcVRsSurQ5wh0JwIqkBOrHoycPMN8RfEuA==
X-Received: by 2002:a05:6512:3096:b0:53d:a273:7da6 with SMTP id 2adb3069b0e04-53e12a290b4mr863155e87.57.1733217749670;
        Tue, 03 Dec 2024 01:22:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	xen-devel@lists.xenproject.org,
	qemu-ppc@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 6/7] accel/kvm: Remove mentions of legacy '-machine foo,accel=bar'
Date: Tue,  3 Dec 2024 10:21:52 +0100
Message-ID: <20241203092153.60590-7-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241203092153.60590-1-philmd@linaro.org>
References: <20241203092153.60590-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit 6f6e1698a68 ("vl: configure accelerators from -accel
options") we prefer the '-accel bar' command line option.

Update the documentation when KVM is referred to.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/bypass-iommu.txt            | 3 ++-
 docs/nvdimm.txt                  | 2 +-
 docs/specs/tpm.rst               | 2 +-
 docs/system/arm/cpu-features.rst | 2 +-
 docs/system/cpu-hotplug.rst      | 2 +-
 docs/system/ppc/powernv.rst      | 2 +-
 docs/system/ppc/pseries.rst      | 4 ++--
 scripts/device-crash-test        | 2 +-
 8 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/docs/bypass-iommu.txt b/docs/bypass-iommu.txt
index e6677bddd32..2ef0e0f6a65 100644
--- a/docs/bypass-iommu.txt
+++ b/docs/bypass-iommu.txt
@@ -51,7 +51,8 @@ And we got:
 x86 architecture:
 
 qemu-system-x86_64 \
- -machine q35,accel=kvm,default_bus_bypass_iommu=true \
+ -accel kvm \
+ -machine q35,default_bus_bypass_iommu=true \
  -device pxb-pcie,bus_nr=0x10,id=pci.10,bus=pcie.0,addr=0x3 \
  -device pxb-pcie,bus_nr=0x20,id=pci.20,bus=pcie.0,addr=0x4,bypass_iommu=true \
  -device intel-iommu \
diff --git a/docs/nvdimm.txt b/docs/nvdimm.txt
index fd7773dc5ab..d589c3a9b77 100644
--- a/docs/nvdimm.txt
+++ b/docs/nvdimm.txt
@@ -228,7 +228,7 @@ which allows the platform to communicate what features it supports related to
 NVDIMM data persistence.  Users can provide a persistence value to a guest via
 the optional "nvdimm-persistence" machine command line option:
 
-    -machine pc,accel=kvm,nvdimm,nvdimm-persistence=cpu
+    -machine pc,nvdimm,nvdimm-persistence=cpu
 
 There are currently two valid values for this option:
 
diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
index 1ad36ad7099..c50bb1cec01 100644
--- a/docs/specs/tpm.rst
+++ b/docs/specs/tpm.rst
@@ -329,7 +329,7 @@ In case a pSeries machine is emulated, use the following command line:
 
 .. code-block:: console
 
-  qemu-system-ppc64 -display sdl -machine pseries,accel=kvm \
+  qemu-system-ppc64 -display sdl -accel kvm -machine pseries \
     -m 1024 -bios slof.bin -boot menu=on \
     -nodefaults -device VGA -device pci-ohci -device usb-kbd \
     -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index a5fb929243c..4aed91a987d 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -329,7 +329,7 @@ SVE CPU Property Examples
   3) When KVM is enabled, implicitly enable all host CPU supported vector
      lengths with the ``host`` CPU type::
 
-     $ qemu-system-aarch64 -M virt,accel=kvm -cpu host
+     $ qemu-system-aarch64 -M virt -accel kvm -cpu host
 
   4) Only enable the 128-bit vector length::
 
diff --git a/docs/system/cpu-hotplug.rst b/docs/system/cpu-hotplug.rst
index cc50937c36c..64314ccfd6f 100644
--- a/docs/system/cpu-hotplug.rst
+++ b/docs/system/cpu-hotplug.rst
@@ -12,7 +12,7 @@ vCPU hotplug
     allow vCPU hotplug)::
 
       $ qemu-system-x86_64 -display none -no-user-config -m 2048 \
-          -nodefaults -monitor stdio -machine pc,accel=kvm,usb=off \
+          -nodefaults -monitor stdio -accel kvm -machine pc,usb=off \
           -smp 1,maxcpus=2 -cpu IvyBridge-IBRS \
           -qmp unix:/tmp/qmp-sock,server=on,wait=off
 
diff --git a/docs/system/ppc/powernv.rst b/docs/system/ppc/powernv.rst
index de7a807ac76..689f9c81a02 100644
--- a/docs/system/ppc/powernv.rst
+++ b/docs/system/ppc/powernv.rst
@@ -63,7 +63,7 @@ powernv. kvm-pr in theory could be used as a valid accel option but
 this isn't supported by kvm-pr at this moment.
 
 To spare users from dealing with not so informative errors when attempting
-to use accel=kvm, the powernv machine will throw an error informing that
+to use '-accel kvm', the powernv machine will throw an error informing that
 KVM is not supported. This can be revisited in the future if kvm-pr (or
 any other KVM alternative) is usable as KVM accel for this machine.
 
diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
index bbc51aa7fcd..3b18d2ee1ef 100644
--- a/docs/system/ppc/pseries.rst
+++ b/docs/system/ppc/pseries.rst
@@ -164,9 +164,9 @@ Currently, there are two implementations of KVM on Power, ``kvm_hv.ko`` and
 If a host supports both KVM modes, and both KVM kernel modules are loaded, it is
 possible to switch between the two modes with the ``kvm-type`` parameter:
 
-* Use ``qemu-system-ppc64 -M pseries,accel=kvm,kvm-type=PR`` to use the
+* Use ``qemu-system-ppc64 -accel kvm -M pseries,kvm-type=PR`` to use the
   ``kvm_pr.ko`` kernel module.
-* Use ``qemu-system-ppc64 -M pseries,accel=kvm,kvm-type=HV`` to use ``kvm_hv.ko``
+* Use ``qemu-system-ppc64 -accel kvm -M pseries,kvm-type=HV`` to use ``kvm_hv.ko``
   instead.
 
 KVM-PR
diff --git a/scripts/device-crash-test b/scripts/device-crash-test
index 2b139e29ba0..2c6fd7c6f6e 100755
--- a/scripts/device-crash-test
+++ b/scripts/device-crash-test
@@ -147,7 +147,7 @@ ERROR_RULE_LIST = [
     # "spapr-cpu-core needs a pseries machine"
     {'machine':'(?!pseries).*', 'device':'.*-spapr-cpu-core', 'expected':True},
 
-    # KVM-specific devices shouldn't be tried without accel=kvm:
+    # KVM-specific devices shouldn't be tried without '-accel kvm':
     {'accel':'(?!kvm).*', 'device':'kvmclock', 'expected':True},
 
     # xen-specific machines and devices:
-- 
2.45.2


