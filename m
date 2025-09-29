Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21249BAA4E4
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 20:33:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133123.1471323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Igc-0001xc-Jn; Mon, 29 Sep 2025 18:33:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133123.1471323; Mon, 29 Sep 2025 18:33:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Igc-0001ua-FS; Mon, 29 Sep 2025 18:33:22 +0000
Received: by outflank-mailman (input) for mailman id 1133123;
 Mon, 29 Sep 2025 18:33:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BPw2=4I=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Igb-0000iD-2V
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 18:33:21 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c56bb365-9d62-11f0-9809-7dc792cee155;
 Mon, 29 Sep 2025 20:33:19 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-46e3af7889fso27784855e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 11:33:19 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc7d3780asm19281036f8f.52.2025.09.29.11.33.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 11:33:18 -0700 (PDT)
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
X-Inumbo-ID: c56bb365-9d62-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759170799; x=1759775599; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3WGf5UHYCyuY+qdMKaaLuq+dGZ/nmDgi/rxgNJ1Ah4=;
        b=waulXQMdrAHfziQiNraoPlDiPYlPE+ca1viRcMdcCLNPu3uuTZJmJE/dPfRD27NNE/
         4fiKCDPPTZMZO15KbLiz/XaLHg+lquvPvv6JxpXVst3j1Enjg/b8cuhx0k8n8JiqjNik
         o8VmPyAsIwc2qY6O+WipTcImxtaqcV47/r7TrUE+fx8qaiYGU0mc/7IeyxwBRKtQqHvG
         BmdAGree7df165emhsz/rz2wdmtqasgl/6ozl1ieO3es5BHodgk/S6dLII32qP2K0+1W
         orapiO2Wswuh07BCtRZXLePnLt6VEVsOanopkhFkELMH8yCgtNl/sCYBhIxKcdKOg95x
         LABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759170799; x=1759775599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3WGf5UHYCyuY+qdMKaaLuq+dGZ/nmDgi/rxgNJ1Ah4=;
        b=V0oEl12WBXbT93nEnKK0Kcs4SY3rjF2a+RU8kmhfHIbNRqW3XoYGJtKopWIKQ8hQqt
         rXLEuWHp778cINV7waBNa+weLMi68Q0Vd40lB/YKywtDkrK6M1Fqxvs4YpZgW3JxvqBc
         oTjnCTKRp9igboC9nqiNAbt0f7v8Grjd0t1K00ZO0jr3xvTYyqbtbpmyXihofLAYLWLi
         eQYwZv0ZttB9Zl2ixB+54hccDK9tDgu5ytFCarIHd1JbUCQCD+4yMuUyS+65xW2SHVIa
         K5GHWmklNPDRQl32UWb1nkcnd4k763nt6g7elrW8BFYbXUcthg5PTNIPXZPSO65Q4Prr
         oqwA==
X-Forwarded-Encrypted: i=1; AJvYcCXQc3M8kGW1UtZupfoYrHzlXQ1xAmYFg6oK1e+vM0chWKxqImdQ121x8YzxRcqlihnrUnybvkEgVtA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJvsjSUJ0u3PL5qPbQhjUi83y7+MqKAWF/hARF4oac0YH1aslt
	10erhcbFa7YPqcWkTMKZgTGwFYmZ9QPauFXtUiH4RALw/81KujMudVn5jf4RoQNE26U=
X-Gm-Gg: ASbGncunfwbHoQDV+dOoSEBz5EKdEs4LIVvY8RqkxV4gtWAwpBhROWU25fNqpaBqtb2
	MVseAlp9WqTkSx0w1Y6BazadDeIEhj9HBxEzxC2kXO4Jm8Kp+2kDZ+5uVew0TaMokg5aAht2ftT
	UKWchTTWJzgf+oQ95y7J6BfZmiZomlPZ2LNOf2NRmmyPya01+GXyANNQ8m4ItHAGuJP3sJGH1jU
	SSzKZenpjjHSBHXJhFDD8+rveED5HJaNGPCQlOzlaAc0quHyUz1uEv99xgKehUqkQ/JsJVEk/gg
	wSPZ9vtRGEXTlRpeRQjSRW0u2PWvQa6tjXaImN/IpSf736kgdy2grC2PKAoTafg4s1y3EdFwtqj
	oXe9+B9zMoUi9GB45xO5PYSStAAdityYZpwgRFciFnRYgITsWqt3hlvC+o38mZlw7joK1QwgbHb
	hp5SWRQbsejSUFcjkg7Q==
X-Google-Smtp-Source: AGHT+IECk0pxJcrABdWnp0wBblgE/rUdgkYk2QyHdrh6Fg0EQMQZuDnjhZ/xllYj8G986Z96HgDgnA==
X-Received: by 2002:a05:600c:1c01:b0:46e:5208:ded3 with SMTP id 5b1f17b1804b1-46e5208e228mr55680385e9.15.1759170798830;
        Mon, 29 Sep 2025 11:33:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	David Hildenbrand <david@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	kvm@vger.kernel.org,
	Eric Farman <farman@linux.ibm.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	xen-devel@lists.xenproject.org,
	Paul Durrant <paul@xen.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Jason Herne <jjherne@linux.ibm.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Anthony PERARD <anthony@xenproject.org>,
	qemu-s390x@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PATCH 04/15] hw/s390x/sclp: Use address_space_memory_is_io() in sclp_service_call()
Date: Mon, 29 Sep 2025 20:32:43 +0200
Message-ID: <20250929183254.85478-5-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929183254.85478-1-philmd@linaro.org>
References: <20250929183254.85478-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When cpu_address_space_init() isn't called during vCPU creation,
its single address space is the global &address_space_memory.

As s390x boards don't call cpu_address_space_init(),
cpu_get_address_space(CPU(cpu), 0) returns &address_space_memory.

We can then replace cpu_physical_memory_is_io() by the semantically
equivalent address_space_memory_is_io() call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/s390x/sclp.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index 9718564fa42..c0d8c335b44 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -16,6 +16,7 @@
 #include "qemu/units.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
+#include "system/memory.h"
 #include "hw/s390x/sclp.h"
 #include "hw/s390x/event-facility.h"
 #include "hw/s390x/s390-pci-bus.h"
@@ -301,6 +302,7 @@ int sclp_service_call(S390CPU *cpu, uint64_t sccb, uint32_t code)
     CPUS390XState *env = &cpu->env;
     SCLPDevice *sclp = get_sclp_device();
     SCLPDeviceClass *sclp_c = SCLP_GET_CLASS(sclp);
+    AddressSpace *as = cpu_get_address_space(CPU(cpu), 0);
     SCCBHeader header;
     g_autofree SCCB *work_sccb = NULL;
 
@@ -308,7 +310,7 @@ int sclp_service_call(S390CPU *cpu, uint64_t sccb, uint32_t code)
     if (env->psw.mask & PSW_MASK_PSTATE) {
         return -PGM_PRIVILEGED;
     }
-    if (cpu_physical_memory_is_io(sccb)) {
+    if (address_space_memory_is_io(as, sccb, 1)) {
         return -PGM_ADDRESSING;
     }
     if ((sccb & ~0x1fffUL) == 0 || (sccb & ~0x1fffUL) == env->psa
@@ -317,7 +319,8 @@ int sclp_service_call(S390CPU *cpu, uint64_t sccb, uint32_t code)
     }
 
     /* the header contains the actual length of the sccb */
-    cpu_physical_memory_read(sccb, &header, sizeof(SCCBHeader));
+    address_space_read(as, sccb, MEMTXATTRS_UNSPECIFIED,
+                       &header, sizeof(SCCBHeader));
 
     /* Valid sccb sizes */
     if (be16_to_cpu(header.length) < sizeof(SCCBHeader)) {
@@ -330,7 +333,8 @@ int sclp_service_call(S390CPU *cpu, uint64_t sccb, uint32_t code)
      * the host has checked the values
      */
     work_sccb = g_malloc0(be16_to_cpu(header.length));
-    cpu_physical_memory_read(sccb, work_sccb, be16_to_cpu(header.length));
+    address_space_read(as, sccb, MEMTXATTRS_UNSPECIFIED,
+                       work_sccb, be16_to_cpu(header.length));
 
     if (!sclp_command_code_valid(code)) {
         work_sccb->h.response_code = cpu_to_be16(SCLP_RC_INVALID_SCLP_COMMAND);
@@ -344,8 +348,8 @@ int sclp_service_call(S390CPU *cpu, uint64_t sccb, uint32_t code)
 
     sclp_c->execute(sclp, work_sccb, code);
 out_write:
-    cpu_physical_memory_write(sccb, work_sccb,
-                              be16_to_cpu(work_sccb->h.length));
+    address_space_write(as, sccb, MEMTXATTRS_UNSPECIFIED,
+                        work_sccb, be16_to_cpu(header.length));
 
     sclp_c->service_interrupt(sclp, sccb);
 
-- 
2.51.0


