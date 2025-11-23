Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17747C7E5FF
	for <lists+xen-devel@lfdr.de>; Sun, 23 Nov 2025 20:00:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170095.1495191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNFIG-0002c7-9D; Sun, 23 Nov 2025 18:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170095.1495191; Sun, 23 Nov 2025 18:58:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNFIG-0002Zg-2B; Sun, 23 Nov 2025 18:58:40 +0000
Received: by outflank-mailman (input) for mailman id 1170095;
 Sun, 23 Nov 2025 18:58:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M+x5=57=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vNFIE-0002ZX-FK
 for xen-devel@lists.xenproject.org; Sun, 23 Nov 2025 18:58:38 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69b4137d-c89e-11f0-980a-7dc792cee155;
 Sun, 23 Nov 2025 19:58:35 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so30809745e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 23 Nov 2025 10:58:35 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf3b4eb2sm154328725e9.12.2025.11.23.10.58.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 23 Nov 2025 10:58:34 -0800 (PST)
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
X-Inumbo-ID: 69b4137d-c89e-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763924315; x=1764529115; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CZs7gYynycdv4EGKIYDGcUMCMGhmj2RagHDsP9q/nKQ=;
        b=wSFl6GYXKs0nqVhybemB2FRXYdbzNqnkgQAj91LfVNUVMpHlrbIf7ahbBHN8n58CTO
         hL6z/8T6N+IIiCtHJzzMmFZYSApP04uZA6xiLQtyeUW9N/sxztGykRWyrDXo/8PZ8ner
         v4JIcgqrerzsR+1j7dyJZVQF7f1TF0VTa45+jRAgp4UP1rJVKErkz3N9yztaZJoZtcOg
         yWto5+cMwF8qIeXKJv5NSQwxef2QflSRPTjNLoscZwp/KDAd3qKL90G5OCPxBbPhx+Pj
         bMSazjwLD751O069myVj8aXrKgrHlXdt3PElt5QihDRteUp/SI7gxRr5bMjiPFnsk16x
         wUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763924315; x=1764529115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZs7gYynycdv4EGKIYDGcUMCMGhmj2RagHDsP9q/nKQ=;
        b=pEBQ3r6BWpMhBV8QOaagF4r0pTP4lrcptcsk2g9PvDIQJAyjo9Mn/t1UZ39rQ4mTEw
         X6ZUNVC84+BjEla3xUI5m168Pseurwm7gFafkjZeNzmm93dIJ3JwA15qmmD7x5TOarCF
         saUJEGotCdg5TwZ90fNYB8fwk6z+ilMYUC6mY2DbeW8CtwUvHom0112Ee218mLViYWdL
         AGfZ7QiomcpalkJnKJHcUovR+t87UieO3+W1u1rMWyejA7X/DJ3kJkObrKYItgBmJ4+F
         iMG98WITPoIKc0Deg6Dli0YMbFx+dAEeNIgnaDQftTqoPl/PQll/JCSmg4ElhbT2XBis
         H9Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWTgPMMEbUOUJ+G2+ttN+KK9vEGRTlfdFGQrHdEZH2aJrxgBHMIIOJgla5wLksiV5AkHQkcLJW7bl8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxf672AGdY0JpuiicIstV7O5XLzbUlUtOHRpuLtn+VBSLNhIHhh
	YxdZ6eAWuqB8Nelhjr4xN0MYEu/dyOa1kuj5p96Z8oPYoJaiLZfMVqYl0Sebaw9m3j8=
X-Gm-Gg: ASbGncvnWiBqLi+bpmfos/8kcbmMws0vggmwmoXz9AoSWArF1cFxLQW4caJ0F0uQydO
	cZ2SzB/FMDBnxuc06BM2XURQllRKwlnLLhqe4dQd9q8fyx2y2kTsYJmuUGCL41QftFaxs9bsPLh
	WsYw6cZXDRExJT6toiOUCWnLE3gRro/dqZPodq6pBowU879r+xBJzFNiiWY8iDVtQ1rCeojVhwk
	KNoxbLpyI/cFUGY8TOOClx90TzEUDUcqXqNmtPuDr87BhVGpJw5UAUWzNdoDqkF7soM+b+z4lzN
	s1o6VEk5O/ixxV8PgdiZx2Llmauv7QTbX/Sggg6bGLjAoNVG2lZTuTvuuZYlnqZ7oQQjoB28Rnu
	Z8/JNR3TvZwCr5bRctPt0lDFVb55h1NKMAm3q7j4kRmk59Vp9vE9K1pxvoXxroQpjMNYW36jOWo
	GLAiLKHqkTX3D6mdCRMbtwNT25g9dNxkDXPGSQ1m+vSGoWonhQctc0r/f6q4dtP/bnnHyTtAo=
X-Google-Smtp-Source: AGHT+IHzO3TzKM0byiy0d9QAboT5h5wHvIrU67sA5M2DR4+xrurNsc+4Y6ORWQbdadWWIQty08DYhA==
X-Received: by 2002:a05:600c:b93:b0:477:557b:6917 with SMTP id 5b1f17b1804b1-477c01be404mr91728135e9.18.1763924314742;
        Sun, 23 Nov 2025 10:58:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Paul Durrant <paul@xen.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.caveayland@nutanix.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/i386/isapc: Remove dead Xen code
Date: Sun, 23 Nov 2025 19:58:32 +0100
Message-ID: <20251123185832.53802-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We don't use Xen on the isapc machine: let's remove
pointless code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/isapc.c | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/hw/i386/isapc.c b/hw/i386/isapc.c
index 1ba9ae22cc3..1e13a30c505 100644
--- a/hw/i386/isapc.c
+++ b/hw/i386/isapc.c
@@ -17,8 +17,6 @@
 #include "hw/ide/ide-bus.h"
 #include "system/kvm.h"
 #include "hw/i386/kvm/clock.h"
-#include "hw/xen/xen-x86.h"
-#include "system/xen.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "target/i386/cpu.h"
 
@@ -37,7 +35,6 @@ static void pc_init_isa(MachineState *machine)
     ISABus *isa_bus;
     uint32_t irq;
     GSIState *gsi_state;
-    MemoryRegion *ram_memory;
     DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
     int i;
 
@@ -77,15 +74,9 @@ static void pc_init_isa(MachineState *machine)
     /*
      * There is no RAM split for the isapc machine
      */
-    if (xen_enabled()) {
-        xen_hvm_init_pc(pcms, &ram_memory);
-    } else {
-        ram_memory = machine->ram;
-
-        pcms->max_ram_below_4g = 3.5 * GiB;
-        x86ms->above_4g_mem_size = 0;
-        x86ms->below_4g_mem_size = machine->ram_size;
-    }
+    pcms->max_ram_below_4g = 3.5 * GiB;
+    x86ms->above_4g_mem_size = 0;
+    x86ms->below_4g_mem_size = machine->ram_size;
 
     x86_cpus_init(x86ms, pcmc->default_cpu_version);
 
@@ -94,17 +85,7 @@ static void pc_init_isa(MachineState *machine)
     }
 
     /* allocate ram and load rom/bios */
-    if (!xen_enabled()) {
-        pc_memory_init(pcms, system_memory, system_memory, 0);
-    } else {
-        assert(machine->ram_size == x86ms->below_4g_mem_size +
-                                    x86ms->above_4g_mem_size);
-
-        if (machine->kernel_filename != NULL) {
-            /* For xen HVM direct kernel boot, load linux here */
-            xen_load_linux(pcms);
-        }
-    }
+    pc_memory_init(pcms, system_memory, system_memory, 0);
 
     gsi_state = pc_gsi_create(&x86ms->gsi, false);
 
-- 
2.51.0


