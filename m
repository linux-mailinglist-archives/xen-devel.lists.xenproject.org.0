Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8DA9BF591
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 19:47:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831301.1246524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8l2w-0001ww-Vi; Wed, 06 Nov 2024 18:46:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831301.1246524; Wed, 06 Nov 2024 18:46:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8l2w-0001uL-ST; Wed, 06 Nov 2024 18:46:26 +0000
Received: by outflank-mailman (input) for mailman id 831301;
 Wed, 06 Nov 2024 18:46:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aqLR=SB=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1t8l2u-0001q9-TX
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 18:46:24 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a65c4e5-9c6f-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 19:46:21 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c937b5169cso297591a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 10:46:21 -0800 (PST)
Received: from localhost.localdomain ([154.14.63.34])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6b0fc4dsm3129846a12.84.2024.11.06.10.46.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 06 Nov 2024 10:46:20 -0800 (PST)
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
X-Inumbo-ID: 6a65c4e5-9c6f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmUiLCJoZWxvIjoibWFpbC1lZDEteDUyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjZhNjVjNGU1LTljNmYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTE4NzgxLjM3NDM5Miwic2VuZGVyIjoicGhpbG1kQGxpbmFyby5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730918781; x=1731523581; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JkT1yg2VZs3DMTFUZrgUQwWp62WZ2rdU+E0+QzLt/pA=;
        b=yZK4pvOHyx0FRptNpygrQTSHqtVeYHcV12nKz3s7TzDbiuCYeLfatVfGlFP7sbTZIh
         vfamdS8af1za08SVbwueT/sHtLmcwM7oowXHPDt1rXGX1vhsVqH/SZ86xqED4IyrG97R
         Ue3wIVy4pBfMZKoMOE2H1Es+MPx2G/a7WGI9SgHCR/+KtXnTqIJprDKXzDxeAgdE2nBA
         pJx7udqm3OpzMNkgh02GF+hQakY/6KlHKiu62+ZNTa9Z/PmqWUX0V0v7voHAk6r0SigD
         RoY9MRiAJDXFuzCLsd30Qr0DAL9bIjTGHhNKe8ZpzQOvkolxSXgHpLLf+hm0I3qEG1wp
         3QEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730918781; x=1731523581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JkT1yg2VZs3DMTFUZrgUQwWp62WZ2rdU+E0+QzLt/pA=;
        b=ZsirUvqKwmqNvBW/1TREUnkLPJXax2GgGtdyHcJeVaDi7Kj3vonZ+vNxGbB0kI98t4
         s/t8cE4M6sEMV/XWexX2AdPBHoE7kH4XovZ6JwTGm4Udklaig9LsILOqJnLdTLN9CDlS
         sZtF7j6lFJFZBr0ruPwAZ9OlxWF/Vg6qryvtIwiaAhm7EZta2GtioeOdB2lHvrCAdWgX
         2TNSCJIInwxp8JIC3ad/iH6MoJdJwJKoKDHrHTa/1/Z2/jDCChpzVHF5osa5Yllg84ad
         hTBk2EI4Rx3rc2iuKEWjsWH5sE5o8mcmTF729VGKVOV+gj52sXJaGjtg4P7d9XoNmp+o
         oaZw==
X-Forwarded-Encrypted: i=1; AJvYcCXr4NmMwC5qgwJleOoY03H6ZHo9DcYSh40qyj3+hX69g9IfISY1p5cPa/ESDKNqDnzQa2W1+czm0aA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyd0GsesqyAXXD5rSRPDmbsrrtdDy0RDj2jhx9bZn/PNttwyhh3
	cK+qWFfHQSStKWaG1ZQQzZHTEa/LUoTfLW35LfoE5iRqKYvEKDskI/S48L5WLtM=
X-Google-Smtp-Source: AGHT+IFRztwwFzuqDMLCKe1HJL0VyN7UZW2IThAYmIBOBL/vYMjon6/glkSd1siXs1SQu1MAzFb96Q==
X-Received: by 2002:a05:6402:26c8:b0:5ce:e5be:d042 with SMTP id 4fb4d7f45d1cf-5cefc66ec4amr296655a12.5.1730918780697;
        Wed, 06 Nov 2024 10:46:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Artyom Tarasenko <atar4qemu@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Anthony PERARD <anthony@xenproject.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Thomas Huth <huth@tuxfamily.org>,
	Jia Liu <proljc@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Paul Durrant <paul@xen.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/5] hw/i386: Mark devices as little-endian
Date: Wed,  6 Nov 2024 18:46:08 +0000
Message-ID: <20241106184612.71897-2-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241106184612.71897-1-philmd@linaro.org>
References: <20241106184612.71897-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These devices are only used by the X86 targets, which are only
built as little-endian. Therefore the DEVICE_NATIVE_ENDIAN
definition expand to DEVICE_LITTLE_ENDIAN (besides, the
DEVICE_BIG_ENDIAN case isn't tested). Simplify directly using
DEVICE_LITTLE_ENDIAN.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/kvm/apic.c         | 2 +-
 hw/i386/pc.c               | 4 ++--
 hw/i386/vapic.c            | 2 +-
 hw/i386/xen/xen_apic.c     | 2 +-
 hw/i386/xen/xen_platform.c | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/i386/kvm/apic.c b/hw/i386/kvm/apic.c
index a72c28e8a7..3a5d69e8d0 100644
--- a/hw/i386/kvm/apic.c
+++ b/hw/i386/kvm/apic.c
@@ -214,7 +214,7 @@ static void kvm_apic_mem_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps kvm_apic_io_ops = {
     .read = kvm_apic_mem_read,
     .write = kvm_apic_mem_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void kvm_apic_reset(APICCommonState *s)
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 830614d930..2259589e0d 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1064,7 +1064,7 @@ DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus)
 static const MemoryRegionOps ioport80_io_ops = {
     .write = ioport80_write,
     .read = ioport80_read,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
     .impl = {
         .min_access_size = 1,
         .max_access_size = 1,
@@ -1074,7 +1074,7 @@ static const MemoryRegionOps ioport80_io_ops = {
 static const MemoryRegionOps ioportF0_io_ops = {
     .write = ioportF0_write,
     .read = ioportF0_read,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
     .impl = {
         .min_access_size = 1,
         .max_access_size = 1,
diff --git a/hw/i386/vapic.c b/hw/i386/vapic.c
index ef7f8b967f..fd906fdf78 100644
--- a/hw/i386/vapic.c
+++ b/hw/i386/vapic.c
@@ -718,7 +718,7 @@ static uint64_t vapic_read(void *opaque, hwaddr addr, unsigned size)
 static const MemoryRegionOps vapic_ops = {
     .write = vapic_write,
     .read = vapic_read,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void vapic_realize(DeviceState *dev, Error **errp)
diff --git a/hw/i386/xen/xen_apic.c b/hw/i386/xen/xen_apic.c
index 101e16a766..a94e9005cb 100644
--- a/hw/i386/xen/xen_apic.c
+++ b/hw/i386/xen/xen_apic.c
@@ -36,7 +36,7 @@ static void xen_apic_mem_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps xen_apic_io_ops = {
     .read = xen_apic_mem_read,
     .write = xen_apic_mem_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void xen_apic_realize(DeviceState *dev, Error **errp)
diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index ec0e536e85..3b3e745822 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -514,7 +514,7 @@ static void platform_mmio_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps platform_mmio_handler = {
     .read = &platform_mmio_read,
     .write = &platform_mmio_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void platform_mmio_setup(PCIXenPlatformState *d)
-- 
2.45.2


