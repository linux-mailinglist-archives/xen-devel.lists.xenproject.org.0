Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA08CA1C4CB
	for <lists+xen-devel@lfdr.de>; Sat, 25 Jan 2025 19:14:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877028.1287263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbkfk-0006nv-MM; Sat, 25 Jan 2025 18:14:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877028.1287263; Sat, 25 Jan 2025 18:14:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbkfk-0006ko-HJ; Sat, 25 Jan 2025 18:14:20 +0000
Received: by outflank-mailman (input) for mailman id 877028;
 Sat, 25 Jan 2025 18:14:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X0T4=UR=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tbkfj-000565-OA
 for xen-devel@lists.xenproject.org; Sat, 25 Jan 2025 18:14:19 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 310dec10-db48-11ef-99a4-01e77a169b0f;
 Sat, 25 Jan 2025 19:14:18 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43621d27adeso20827385e9.2
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jan 2025 10:14:18 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd54c066sm67839795e9.29.2025.01.25.10.14.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 25 Jan 2025 10:14:17 -0800 (PST)
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
X-Inumbo-ID: 310dec10-db48-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737828857; x=1738433657; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1nS9BzjJB0tn/0Fa9F2b1T3lbd2oKgl5iwd0JMSerQ=;
        b=eFBesdrMiTebZm1ezPYRTAvmBhUY8ufXa/xDBnjmUG+JoObKcl5SVBTtErKJ6Q5OZd
         NKGc7poeu4rMJZYvL8b9ZACIV/3jYYv4DNcXxlbTjg8bc8XPE6gIunmzXmetxMIxin1c
         P/gUe/7om8FeRyQ/uJV05QG+27iaZCWqSOztVXUFrvMVsQpYMTb2T0YogbLL/n8FUbef
         YEPOD71TZ4TyFgRVcg7LS8e8coqPPFoc8l7fi62dhwRLswqE12kUWhh+DkkRWdgESv2a
         ZxslaYQqLy4aNcvb0z/t7vaib6/loY40lhhfhf88MFcjhDDK/eOM3RetiBMfkZtut4na
         8WVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737828857; x=1738433657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w1nS9BzjJB0tn/0Fa9F2b1T3lbd2oKgl5iwd0JMSerQ=;
        b=nzR1nYkO0O5SN9fnno2gLb/ASD4Br/YOcBXpOz+Adki+lJiiOQ+okjdTF84S8xKb/X
         ouckhldsy/W3+Zbp7eIPKQMqj8OUqFX6Q/dUNMteB//synICe3wQ5WOstyFoAIRTnv3i
         D/Ke08WSShT6JP9ZbPOmtpapD4+ISTGHXDHllAZ1PgvopB40Xy2g6s0cAjjSdwxCLI62
         MfjHYhg4/H4H5tumrIs30QecZGkK5vVhmVjwwkFKDMIsYg8ibyDKv/24GgIqb+qvhIJz
         5g/7cQmRiMpvSPoWFfTYtjBoPkqFQaDdM4KTbtNcx7XDgxHwOE8jbqQHxQ+RsOzFliT+
         eqUw==
X-Forwarded-Encrypted: i=1; AJvYcCWWgYJjpyk+aRgpdi1x4VB6xsGZgxIg4HY8adbX84KhjQBWeof2GzfbatHzac9Uu8bZcNzfReTpGTs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztDwgM9J/NJHY4gzonZej7jMEUG8NxNuWcqIqoh9BC0OtmhClC
	3noXXPXuD8giH6AzzLn+zSxGdDJuKM9ESZdTUTeetho00IK6U2cq0m6sRgCwV9Q=
X-Gm-Gg: ASbGncs58a7Og6w6sxS8HupobpRQUF3PzFdwcpC9Aep1uEAW4mtBHMMqLZFdYEl/8es
	JOcKbLGOvZD/l62m+AYDOjZJAElqb+Sk4erUhaPM1pgPzQmPAAq+kjPUFvyA6HykrEgjmT3e9+G
	S24+1fiSHqa6lGyMwbf1xARLS9Lwcgwkxc25lLyUIblzDPapZbfvcjAyYnEIeTe0KnqFYqCPkMS
	VO+DjvKJN6C00t5yyEGDf74Fo1YG2ps7v0pyjelDtBREDv5EU9RHfYT0F4W3VmpXtixFxGMGq+d
	jQfGVU0trR4857vR9lnx66a/dG8iex8/7dKYRw/RpI4s4lQvFGaJr9ecMc26
X-Google-Smtp-Source: AGHT+IE5XUCSuHVVDMagGbiF8o/U1zOarBMIVGYFxMB07VQ6SArrPMMpgZuB4UE+b0bVMHzNNBLvMA==
X-Received: by 2002:a7b:cc8f:0:b0:438:a214:52f4 with SMTP id 5b1f17b1804b1-438a2145332mr233337725e9.25.1737828857490;
        Sat, 25 Jan 2025 10:14:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Yi Liu <yi.l.liu@intel.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Anthony PERARD <anthony@xenproject.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Jason Wang <jasowang@redhat.com>,
	qemu-ppc@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Bernhard Beschow <shentey@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Cl=C3=A9ment=20Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 6/9] hw/i386: Have X86_IOMMU devices inherit from DYNAMIC_SYS_BUS_DEVICE
Date: Sat, 25 Jan 2025 19:13:40 +0100
Message-ID: <20250125181343.59151-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250125181343.59151-1-philmd@linaro.org>
References: <20250125181343.59151-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Do not explain why _X86_IOMMU devices are user_creatable,
have them inherit TYPE_DYNAMIC_SYS_BUS_DEVICE, to explicit
they can optionally be plugged on TYPE_PLATFORM_BUS_DEVICE.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/amd_iommu.c   | 2 --
 hw/i386/intel_iommu.c | 2 --
 hw/i386/x86-iommu.c   | 2 +-
 3 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 6b13ce894b1..e8e084c7cf8 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1687,8 +1687,6 @@ static void amdvi_sysbus_class_init(ObjectClass *klass, void *data)
     dc->hotpluggable = false;
     dc_class->realize = amdvi_sysbus_realize;
     dc_class->int_remap = amdvi_int_remap;
-    /* Supported by the pc-q35-* machine types */
-    dc->user_creatable = true;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     dc->desc = "AMD IOMMU (AMD-Vi) DMA Remapping device";
     device_class_set_props(dc, amdvi_properties);
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index f366c223d0e..7fde0603bfe 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -4871,8 +4871,6 @@ static void vtd_class_init(ObjectClass *klass, void *data)
     dc->hotpluggable = false;
     x86_class->realize = vtd_realize;
     x86_class->int_remap = vtd_int_remap;
-    /* Supported by the pc-q35-* machine types */
-    dc->user_creatable = true;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     dc->desc = "Intel IOMMU (VT-d) DMA Remapping device";
 }
diff --git a/hw/i386/x86-iommu.c b/hw/i386/x86-iommu.c
index fed34b2fcfa..5cdd165af0d 100644
--- a/hw/i386/x86-iommu.c
+++ b/hw/i386/x86-iommu.c
@@ -146,7 +146,7 @@ bool x86_iommu_ir_supported(X86IOMMUState *s)
 
 static const TypeInfo x86_iommu_info = {
     .name          = TYPE_X86_IOMMU_DEVICE,
-    .parent        = TYPE_SYS_BUS_DEVICE,
+    .parent        = TYPE_DYNAMIC_SYS_BUS_DEVICE,
     .instance_size = sizeof(X86IOMMUState),
     .class_init    = x86_iommu_class_init,
     .class_size    = sizeof(X86IOMMUClass),
-- 
2.47.1


