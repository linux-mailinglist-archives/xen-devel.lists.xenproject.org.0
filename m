Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E525ABAB4AF
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 06:14:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133448.1471591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3RkV-0008RD-Jw; Tue, 30 Sep 2025 04:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133448.1471591; Tue, 30 Sep 2025 04:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3RkV-0008Lp-Fe; Tue, 30 Sep 2025 04:13:59 +0000
Received: by outflank-mailman (input) for mailman id 1133448;
 Tue, 30 Sep 2025 04:13:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3RkU-0006tq-0w
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 04:13:58 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2abb080-9db3-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 06:13:57 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3fa528f127fso4221194f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 21:13:57 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab31e97sm251610955e9.14.2025.09.29.21.13.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 21:13:56 -0700 (PDT)
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
X-Inumbo-ID: e2abb080-9db3-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759205637; x=1759810437; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsPYBf9Y41DYeMpdEdOkBi/mu9mpDrkpGT9A+u43FVY=;
        b=EOltNrgaoPb01blgoG8FhMbkMNs42aJp+3jl6NEtrplaKslDjHAwMKagldcrT0QbO6
         RlDv5ardTLkf/rjliK7D12I3wC2SS5Z+FZKFl6q9ybKoseD31QU47Pl0v3/Iz00bKQjq
         nsQji94mkLt8yN3wqimjvK0Q8uMXS/DZE5mVfrTbnbB51i4YMPGmZuHlayihkKaQzzg6
         3N/to+1Z4HbkxodoNlG+tZyI149VgTHHz6vlki25XMnXYe/XHk204mfg8fURq5l1m2kp
         dBN0Ibo/VZlPe3s1dGZnTNeu69eJ7Kk1omln7lF9P861PJz6Y6RIXNMRcwte4i+YYLFf
         wMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759205637; x=1759810437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UsPYBf9Y41DYeMpdEdOkBi/mu9mpDrkpGT9A+u43FVY=;
        b=CXf3xF8D7eY3mulRfhvSD9wKI5WB7aaf6Jph5qjT3vsyYQRDEvzlvG4p/y/XlEZtcy
         Y6F2TfYBZfeZLteWz79STyN5JBWtdT+iHgZQdROUmVMAQIfG5mhuR7xzVc+j9yFF8tAl
         urPqUTK4YXMD75QDN5u6IHSZovou02NwGTTUnFCf0YFOq6PkhXC3PlKlt/jVGwSoVxGi
         NFjYeau9PRM4hxx+8IFDa0pd3ukG4daGiHqAdKfz1Ia4vod4PR4KvBASkdof2pk7tx/i
         XN9t3isvzGjKGzuq4jHKjo2T6/dxHT6qNrGsyWTZCVRy4CLIpmNuKSICmm8JCd1Ufv8e
         7ITw==
X-Forwarded-Encrypted: i=1; AJvYcCVwtWr7/jFbO9S+tzx29xXGr+j9d0jpv2ZZlS7w/rbCtIeBp9TXkosZwGkHCUAGzylR/YHWVY5ymCo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKV+whCc3WbRuEMnEDkJGETeJNKcWHivzAlyChHLFUBf/4s3ay
	hd8uQQNb5eCSdp6J1sPBFM8jtTGZ8bsppJ2rdZ792ES7n1ljiy92A5S7FU3jMtZBYwc=
X-Gm-Gg: ASbGnctX+PhzVlUT6X/9Wq0UR0wqY0JHaL4fZtuWH+ZfXLjoG5faVUJmZOms16/28J3
	NRBEmAokvTeJYMnce8mfhrGiuRV8SsTnzd0/VxTrOHnOMCz6vb/U8CC/ZYdLle6IjtPH5w74WNK
	CHPQR7vwBP0hQsEo3d+nZPD9k4yM34qLXfgfEZK1B/ksy7WNASd2H3SqIDD75Imtq7OibQKyL8Z
	ywM8TH6Sg0hsUpRWFHkLF4t8G2Od1gZ58yb8vEoYSZ0oZgFDoqsLYpJ1jQ+G4MgxWxaniZMtFyM
	Jup+p0ie+LRdo53vTFnsAr2zcXWGfT7wKwdmwjh03c+gZPi3IV8jd6rugCuEkWgbpNuHnYuQLdo
	Oi5uKsKZI/c1OhsycwCwrnm4M9t2zFt9hxHQi7R7eQiFF++g7WkkgtA80ZwuegcNfdUEIi39TMm
	pWHUywHEBtSoW+7FeBwJKm
X-Google-Smtp-Source: AGHT+IH3He/bgDcAVA0O1uM4KAZUJWAOZ5pxrLV0agMvoc3nOriIeKi2nLWEPRWZf/BAWQ6cyeIFXA==
X-Received: by 2002:a05:6000:40c7:b0:407:d776:4434 with SMTP id ffacd0b85a97d-4241227789emr2285457f8f.30.1759205636900;
        Mon, 29 Sep 2025 21:13:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jason Herne <jjherne@linux.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Stefano Garzarella <sgarzare@redhat.com>,
	xen-devel@lists.xenproject.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	Eric Farman <farman@linux.ibm.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	kvm@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	qemu-s390x@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 05/17] hw/s390x/sclp: Use address_space_memory_is_io() in sclp_service_call()
Date: Tue, 30 Sep 2025 06:13:13 +0200
Message-ID: <20250930041326.6448-6-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930041326.6448-1-philmd@linaro.org>
References: <20250930041326.6448-1-philmd@linaro.org>
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
 hw/s390x/sclp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index 9718564fa42..f507b36cd91 100644
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
+    if (address_space_is_io(as, sccb)) {
         return -PGM_ADDRESSING;
     }
     if ((sccb & ~0x1fffUL) == 0 || (sccb & ~0x1fffUL) == env->psa
-- 
2.51.0


