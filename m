Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0079DBABFED
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 10:22:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133841.1471929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3VcU-0000UT-7R; Tue, 30 Sep 2025 08:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133841.1471929; Tue, 30 Sep 2025 08:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3VcU-0000Qk-2Y; Tue, 30 Sep 2025 08:21:58 +0000
Received: by outflank-mailman (input) for mailman id 1133841;
 Tue, 30 Sep 2025 08:21:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3VcT-0007Nn-4t
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 08:21:57 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87494397-9dd6-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 10:21:56 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-46e2e6a708fso36248755e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 01:21:56 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e56f65290sm44620345e9.13.2025.09.30.01.21.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 30 Sep 2025 01:21:55 -0700 (PDT)
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
X-Inumbo-ID: 87494397-9dd6-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759220516; x=1759825316; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmN6KZRBDFIwLcWnEVDqbz1WHRvv8u+lRYP5Aq5aiQ8=;
        b=Ae14vR7/JPhbxTl8racrKMnzXpba7ajvr0ekXTb9hzMu4IctZDkBAOr6vRYPyBStn7
         47wbUiYVrPugbEaK4Qpc6m5MAJfwmnE/nOLyRpdG/3jFJOLS8LNTRIfsfC1Ou4aIYVtj
         sgwySGDNSYT3NMv2ZDQHoYasUiMflZ4X5GUe8thvEJP0SI6jk3wXDZ2FeT8BErCTRKJt
         KMb7Yzgze+sbJBjQj5HItt/Vm5Asb8tFfZFbbwH7M2xP8+e+QQvu2AewEg+FEFQw174C
         wVwZMVKcAcc6I0Fe8f/OMeDFKOn2mbWmDBMRTE8fFkPcMNLgjcRqyszD+uVD2i8B8+Ip
         MD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759220516; x=1759825316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TmN6KZRBDFIwLcWnEVDqbz1WHRvv8u+lRYP5Aq5aiQ8=;
        b=HurSdeEQGng3G27bjnGZcysbVyYcK4K1ToxuTWDzlQ6L/wQcj+1+rv6A9KAVMQGrtL
         e6/vF0a9mhh73xK/EtJIzQN3BefQ426/j/jL8ZShFWQ6fUh4EML6KcoPuUOq7RW8LXcd
         mUld6Ww2I3C1beUw19Mp5KHbwGuOhyruZKSdPikRo2rya3W81N4nwcHp8ij3xWyDPFwd
         +RSGECghc+kbqieVhf2ztb8ktzs1tNVRj5oEgHfc0R6d8YQ4FmNpEjkw1ODUOONeUejN
         yeIVoMUUloBRw1Ft2qtjhNFOrOW85ro6mnAM1o+GEFDY2KAMIELz2/6INuTFmtfzetWu
         ZJnA==
X-Forwarded-Encrypted: i=1; AJvYcCXef4yNFiHpnBikLdU9BIn5IF8jBRoE0gQ+rinmFIQW27L9+6bYgV14d9hdqZD+HzLHZCofcvaDF7E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzyje0AmrYxRaW5hX4G5S7I0E7ggomSn5tlm3H9zvu0zX24eiBc
	F3P+Z3v0aMG1qC2aa1Btbkchl/PqG/6fJgzPTmD10Og3qQ5RlxeO/ddGbus0704eTZ4=
X-Gm-Gg: ASbGncuqJbH7wkXq01IPPqCc5mqd1a3x4msKHq6ngeUo0OUClqdbc8DQ5LxTm3d9spR
	GWr05sMC9qbPpf39DxbPgNDdQIGMKWFm6A4VT1E8xayXu5SfUiykyWRZsB+GltYg8wmLh46HIs/
	702yhq9iPzhV8WLOrbV4larqQGsd/sJiCfzDZDHlmhmEnb8dvCVRyXTTyX1QFCpJyqo5Qr84IZM
	xwYoxKl/FJpvyiEnwA9tLRrd+m9Jlu3gq+0KWFQJp7B3aso9RKsaEOwa51J9Iq2HIaw9/JsAjEr
	8Cnj0wG5D7IJNde/WBf1ILDob7gAiCvVZmM/5vzMiLbNUBeZbjSsvsCRnPlflSHkdf4pD6o5iA3
	Apd8s+68XM6PxHvL+yd87WDkxDYjRXvgKeZjAXSciECbMYwVdfmmfyjrP/nNLxpSqBcUFQDY641
	g7VSAhkwt4Af/7uM608en7z9vQz7/Fcno=
X-Google-Smtp-Source: AGHT+IFRoVQqdg8pFriDfOKg6AJHeYajBA5OHZoOOnjeKEw77YQUzMpfQKsIByPubJl8mIXC2txRhQ==
X-Received: by 2002:a05:600c:8b16:b0:468:7f92:5a80 with SMTP id 5b1f17b1804b1-46e329fbd2bmr146354195e9.27.1759220516099;
        Tue, 30 Sep 2025 01:21:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	David Hildenbrand <david@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	kvm@vger.kernel.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org,
	Stefano Garzarella <sgarzare@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	qemu-s390x@nongnu.org,
	Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Jason Herne <jjherne@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Eric Farman <farman@linux.ibm.com>
Subject: [PATCH v3 05/18] hw/s390x/sclp: Use address_space_memory_is_io() in sclp_service_call()
Date: Tue, 30 Sep 2025 10:21:12 +0200
Message-ID: <20250930082126.28618-6-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930082126.28618-1-philmd@linaro.org>
References: <20250930082126.28618-1-philmd@linaro.org>
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
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


