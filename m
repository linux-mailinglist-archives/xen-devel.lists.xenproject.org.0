Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC868BAB50C
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 06:16:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133503.1471650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Rma-00030Q-P9; Tue, 30 Sep 2025 04:16:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133503.1471650; Tue, 30 Sep 2025 04:16:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Rma-0002v7-Cm; Tue, 30 Sep 2025 04:16:08 +0000
Received: by outflank-mailman (input) for mailman id 1133503;
 Tue, 30 Sep 2025 04:16:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Rl7-0006tq-3c
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 04:14:37 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9eac94d-9db3-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 06:14:36 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-421b93ee372so863903f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 21:14:36 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc72b0aeesm21288982f8f.49.2025.09.29.21.14.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 21:14:34 -0700 (PDT)
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
X-Inumbo-ID: f9eac94d-9db3-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759205676; x=1759810476; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onCfEhinWarPReSMP2g+nvBYz1NYywUR3fuXcFIYVYM=;
        b=qUMVFovuwwEM0MouPOZLAmN8/fXpO51T6uDuWnFsUn9Rd5EaopI0zTwzslaimDS/XI
         fs780cVFN/rvWKwI9lMi8GaWeERy5Ln6qHA9i+mDLF1a6xglCTBCsvM1AizId9yXkXLc
         qc1WtWmmARzoTXteSf1rKe+GSzOEVCTbz5fvUZnas6rAggCDTDg4kUcrpNC3NSDQ5Koa
         U3o71jrYPDLoXz7w0PAcWYEi52d8iKQoT1zouX/bEY9z4MBMktOqTB0Mx4inkTbDubtS
         PHttfarWMkO0fGgr4hhu7oFjKoWG/P1En/yv/g9njv3Bn+Jdg/gkGuwUHtRM9kdkQILz
         MlUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759205676; x=1759810476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onCfEhinWarPReSMP2g+nvBYz1NYywUR3fuXcFIYVYM=;
        b=vBVrpScJR8t8vA5yXCENu+ikKXkcPGm8ELkl4RQAfDL0cpfDJxx9UvgTogfYXiT262
         puLzsLMBIsEqXCN6XEt7rMBXd2aN/8+pxsVALvWF1TZOHYspyEhHsEQi6o5sq5RZfHNV
         me8kK6Ceye0y9t2XGaLMppF/UTqL2qYNaAf3/zcsco6lvtnzOGmQMYadsIOffpShd0Y7
         /LA1tjuzjdJPOjw5UzjRNnXXKoJmEEwb4RnmPiVqxO9QX1eUNhBbQA0GVgZbg61POo7f
         DEf5JwOwqmCc1iBYA5jhoQ2K0Z28i/GqgCkJCxoysletvYHOtf7Ecjlq12RNp1JTRnoK
         ok+g==
X-Forwarded-Encrypted: i=1; AJvYcCVcIlS7h9s4IGvMzVDmSsnPpOzSmr7WUGiQAgh8/fJgzrfL5t/UQpXNvad1yEabfHUBEcft/f3f44U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0Xlu39DPqX2VWL3VC/CDNUBqU3cADn/srUNKUEGHG4dKc1Iig
	KLn3FwzOqonCD7CVXa4d4DPoAL5lTtyt+pr9cFujcnTImmMQQT/+KwIuijXbdZTvfbQ=
X-Gm-Gg: ASbGncsPz+exIPkBSEA3wOlHha1uzYb0KgtsyRPE9OL+4DZmW5K0cJnOlh7c7H4No2h
	ZVoeGLUYR7WamgrUTimieA3NQNEDMsTzczpGx835GP8gZHfjWLWbfFJte/qqupp4gifkC3YWvhj
	m5Eqpiv18ISyytdLK4tqj93bCjJG2lHCG3wKnBXnrqW7kDio8AiA1KOEU9Gpq29qryJtedQjKjB
	pc0vSAeNNFjf5qO60XEOwDRuHiIjw3+DLAXtN0KtASLqBCL+inRp31fx9XqWPvh5/J0bHzWKGXH
	oiZ/RhKI3V0NfpbF+1f0WTq3/VF2HPMlCj56Rp+w2HFR/G9n30BZE1GKiYzJku6+jZ4xjs7T5Lm
	SPKizbbNPamcdfqzVMrkjLhjBr/KJv5KQ4sU9asao22aD80VSUurqG2hzsiPIXXqk58hTmfVoc6
	ssl+Wrp/GSxK8Zm2sriiCVUJ9c48uPz2lHZxTHmb+F/A==
X-Google-Smtp-Source: AGHT+IHXSt4CkpBPH+1BT7FZNZBNpbDyORtYFCRXPSlc1PSaGA5no80rsQKq3Agt1aNkmXQ30vgX3Q==
X-Received: by 2002:a05:6000:2689:b0:424:2158:c1a7 with SMTP id ffacd0b85a97d-4242158c3cbmr1203705f8f.34.1759205675919;
        Mon, 29 Sep 2025 21:14:35 -0700 (PDT)
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
Subject: [PATCH v2 11/17] target/i386/kvm: Replace legacy cpu_physical_memory_rw() call
Date: Tue, 30 Sep 2025 06:13:19 +0200
Message-ID: <20250930041326.6448-12-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930041326.6448-1-philmd@linaro.org>
References: <20250930041326.6448-1-philmd@linaro.org>
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


