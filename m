Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A08DBAC076
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 10:26:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133927.1472029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Vga-0005ZW-Vl; Tue, 30 Sep 2025 08:26:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133927.1472029; Tue, 30 Sep 2025 08:26:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Vga-0005XX-Mg; Tue, 30 Sep 2025 08:26:12 +0000
Received: by outflank-mailman (input) for mailman id 1133927;
 Tue, 30 Sep 2025 08:26:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Vd0-0007Nn-3c
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 08:22:30 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9af227d8-9dd6-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 10:22:29 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-414f48bd785so3014676f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 01:22:29 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e572683ccsm47008715e9.22.2025.09.30.01.22.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 30 Sep 2025 01:22:28 -0700 (PDT)
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
X-Inumbo-ID: 9af227d8-9dd6-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759220549; x=1759825349; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onCfEhinWarPReSMP2g+nvBYz1NYywUR3fuXcFIYVYM=;
        b=RxVpL7qLL8PYghUwO/br8zSWEQWLfhI7d4h5YPZIRCeqwON/I7XR118p31OjUKY7pu
         frcU/IQXQM5ZnGdADBh08rET3vKBZkfEExeXD84/fwQh5241Ld6QgQSDcxioq/YNSNSS
         Hmys58SlzN2lao3ltj132CUAstK/cb1p6iijO4/MgZrJ2vH98Lks5CQ+IghHu/GEEEjf
         yagr0sx2YWdWgHmr8h3T1sZIBogJeQgT0XCYJ/O+JCrsJ57XBXykExtf/nXRsZPwxITu
         AZMeRe6OCNONQKl2G9c2r2RzmPubEjWkh8NW2B7QvIgR+iLImKbbOp0xjv0aEnajp/YJ
         BmTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759220549; x=1759825349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onCfEhinWarPReSMP2g+nvBYz1NYywUR3fuXcFIYVYM=;
        b=GrcpUapFCJiyGy/Si2qgpyRh0IlFFtPoDTR6WeAIbhPJTBk05r0w96840ChG9a5DoM
         wajvSaLzWj2KbNLTObgTns3SRHhiXJuWNQNd+HIT5sgKUpwDjXoJI83fWgZyWGb+j8F+
         CjLodZ8CNYKK+Buvfw6BWI7xvWVrU07WQhkbjADH4Blub0jrjw+YyZwDehY6nS0OYc5j
         pN9LTRFRRzNggmUC3L5msE5NzMOPAjWQkk4ZjQoplYtz2H5uvsl64iOteHK006FRoyTe
         rjOJdDbLjLGrD5AY34ETPxIFm0tOegI6Ln0EbitagGmdu8pjG8KjAohRoBUmPUjvHAQF
         p4iw==
X-Forwarded-Encrypted: i=1; AJvYcCW5smS2CyxhdhLWSStz2u60+TLtyQfjQx9SJYnKctKMPqAKME0ufG3yX3pOR/3CCu8hxxfUZdhwPNY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLiSPaYAemMkzdcxakYPC4R33y4yx5fdxKLES55/aFXsZt21CT
	hszW+9hqV5ykAaQz4k/dp9qp/CLyNvdABgl6/IU4TNBDpqS2tE62Cw0jsvYut+TBEzA=
X-Gm-Gg: ASbGncuUom1knNDIzNEuxuDE6OYNwBNsCpM+mpnjl25kA5JDjdWFWzVJ8Go/aVhTJ30
	v3BtX3CvF5puCqQ2jEF/vPNErvnvJk1JEknYZs2hPs/IMHwBgv46B+Pz4dylx7bapP+oVOcZbnU
	ZwI9QYozDuOEss3KZ+0VAMd1UhTg3JUR/xlZn+kTgNM/I9DkF+QpC2u9nY+pFKrdEqLbFBe1ghZ
	HTcSmunNi4ulqHW4rdTwivrzmuasDWFxuvuq6vRgg6YTrkYPpuUKgp+wuuHqO4aJUzfXviSRtD3
	ibmhOhNTfYpCfEkVCgvLpfX/HkKW+RmxksKo0Zt4xGbE7CbCmIuvrAJrvLPRw8x3ts72b4gI+wL
	IkxstfEL9acdvvdaDH8X0tBOPnn/yiSyAb9ryRCeUWwMhsCE2a3jmBDpFk+OhFP3eimHBw30W32
	43S9EYdkcAYpEphtODOqBKeV2OrNBbfTA=
X-Google-Smtp-Source: AGHT+IGEB7zt4QY7wj3rTZFjv9pmOMXqLorCZDEnNJaXiQGRhxTkEhGFSRSSrKDdM5xt6JNSxZxslA==
X-Received: by 2002:a05:6000:18a7:b0:3e9:d0a5:e436 with SMTP id ffacd0b85a97d-40e437371acmr19690967f8f.23.1759220549024;
        Tue, 30 Sep 2025 01:22:29 -0700 (PDT)
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
Subject: [PATCH v3 11/18] target/i386/kvm: Replace legacy cpu_physical_memory_rw() call
Date: Tue, 30 Sep 2025 10:21:18 +0200
Message-ID: <20250930082126.28618-12-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930082126.28618-1-philmd@linaro.org>
References: <20250930082126.28618-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Get the vCPU address space and convert the legacy
cpu_physical_memory_rw() by address_space_rw().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/kvm/xen-emu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 284c5ef6f68..52de0198343 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -21,6 +21,7 @@
 #include "system/address-spaces.h"
 #include "xen-emu.h"
 #include "trace.h"
+#include "system/memory.h"
 #include "system/runstate.h"
 
 #include "hw/pci/msi.h"
@@ -75,6 +76,7 @@ static bool kvm_gva_to_gpa(CPUState *cs, uint64_t gva, uint64_t *gpa,
 static int kvm_gva_rw(CPUState *cs, uint64_t gva, void *_buf, size_t sz,
                       bool is_write)
 {
+    AddressSpace *as = cpu_addressspace(cs, MEMTXATTRS_UNSPECIFIED);
     uint8_t *buf = (uint8_t *)_buf;
     uint64_t gpa;
     size_t len;
@@ -87,7 +89,7 @@ static int kvm_gva_rw(CPUState *cs, uint64_t gva, void *_buf, size_t sz,
             len = sz;
         }
 
-        cpu_physical_memory_rw(gpa, buf, len, is_write);
+        address_space_rw(as, gpa, MEMTXATTRS_UNSPECIFIED, buf, len, is_write);
 
         buf += len;
         sz -= len;
-- 
2.51.0


