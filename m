Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2665EBAC079
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 10:26:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133941.1472048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Vge-0006O7-Ra; Tue, 30 Sep 2025 08:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133941.1472048; Tue, 30 Sep 2025 08:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Vge-0006Ho-LJ; Tue, 30 Sep 2025 08:26:16 +0000
Received: by outflank-mailman (input) for mailman id 1133941;
 Tue, 30 Sep 2025 08:26:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Vcr-0007Nm-4e
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 08:22:21 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94701ed8-9dd6-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 10:22:18 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-46e4f2696bdso31581035e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 01:22:18 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb871c811sm21599810f8f.15.2025.09.30.01.22.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 30 Sep 2025 01:22:17 -0700 (PDT)
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
X-Inumbo-ID: 94701ed8-9dd6-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759220538; x=1759825338; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2kEeDKj/VliAI89NHWLpYrYcoI7vlOg/a8aX+CJnHKA=;
        b=lfW1GHFZ4K9+Z1nAe/QhLaTxvPBOdoWoMTno6KJZ856BGI7l6BZN4JFDNMm5OQMmWX
         txsEpl9yGsmbUzNFLq+6XwgnHH2UsmxIZabAbMD5kIC0SelSJA3fNtri1KJhiYqnKnEi
         +QCga/eDtKe3ePKGNFGSK99/3xCzI8SqkcfJJxx1DiJItfaxT2Xl0LMoB3deOImNdeft
         /xOe9JzDppZO2p/z3DHZ+TR71hXV1HFDR2uFWV1BAo1pR7Obgh6zHy4yjkFx715Le8mH
         1SbU7Xe5uelKS2ca7jlp2txHW4gKCzjfxCGR2gzzUHDTAqt1JpjdlyzSIVrZs/BN87/J
         PTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759220538; x=1759825338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2kEeDKj/VliAI89NHWLpYrYcoI7vlOg/a8aX+CJnHKA=;
        b=iPgrQ0UCminCcA1C+hxRd8fEtCB/JU7OghTy0sk4r+gO2Gx+AkRhsv6hW2It8mEVpt
         0iJ+P6lb/ywrO80O+jkbSwbno8HlXsjeOm9XXFN3TCmbc/MX0pEQpqXZVP0TySCy7X2B
         D2pnrWdSgJEWg/A/+TDirJINpBHruK+oJYyuKwVuq1sd2z9N6gaWjKU0HXmPZNlGLe1S
         Zt06jffrFSGDH0EpB6DikmrONPzo0TV4IWai0W8BABoCyGyapO4mBpFG6HYoahlA/npc
         qPF8wR1DrwD/2bFeTHv8PxrqxS4XPvvXFBISD1Je44OneqdMHOeYbukRhZJi5b0/fv6w
         9QQA==
X-Forwarded-Encrypted: i=1; AJvYcCUj7/JpQhjpBOkDY/wW9V9kRgxaHx5l/P2ZVvs73VsMLjgBbGqnJ+ltitLyEBRPoCmaY3C5xzEz4mE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQ1PiERUF82uNfuX6WqQOsvUHXshWtCNgNwkFohWs7OeINB/Bk
	mpK5n+X/Ucw8ktGz+jbJ7ZSUNinAFZYwhQHE1RQm0nHHpj7X77LffNmNuPGvZqjeXfE=
X-Gm-Gg: ASbGncvP0t24frZENPnJaDaSwwxuCifqjmDjWzpZSD9GQwEF0kA/R6e+lT82t7ZG9mZ
	rLnX7KnWUm62YzG1xcTqHEQg+BNSLf+6Un9bWeHfI4KCrCC+C4Cpl3FazCDBm4TGRKfMC8x2GyP
	7X4fvkGnkdTtgmeQttJuJfGk2fNO/CHzZeuHte8YZyAQrcWJHOLNUnl1NZIqFXn2RYSG6jSakSO
	D7n4P4bAT1dkxn64PR8F9LjUWlL6rztiWyYdL6FsaiOnE1QLZi1KsAEmf+6lh53PFKQX1icsihx
	q0jk9fPcFkZt+MDuQwJQUvZLXvl7rlYOvwtECyMxXfebHmudxR6G9/tOiK3Fa51qC2SmI6I7tA7
	amn/8+oM5c6K9uksinxPNaQUU7k3dqt6/IQuAl2u5gcC2Uhe0+6Fn07pwmt3lxaZjEuh/PjqBUs
	uExphBK835+IZ74D9HI0qECu5xQnlV0PQ=
X-Google-Smtp-Source: AGHT+IE8kOnIri7d9kIT89vkssg0QjxuyhNQyNkBu4zqQAFaAaCY/pGZVE1XfJtvAVhQrg/vBoJaIA==
X-Received: by 2002:a05:600c:1386:b0:46e:1b89:77f1 with SMTP id 5b1f17b1804b1-46e329e28f8mr169270875e9.9.1759220538270;
        Tue, 30 Sep 2025 01:22:18 -0700 (PDT)
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
Subject: [PATCH v3 09/18] target/s390x/mmu: Replace [cpu_physical_memory -> address_space]_rw()
Date: Tue, 30 Sep 2025 10:21:16 +0200
Message-ID: <20250930082126.28618-10-philmd@linaro.org>
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

We can then replace cpu_physical_memory_rw() by the semantically
equivalent address_space_rw() call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/mmu_helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index 00946e9c0fe..4e2f31dc763 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -23,6 +23,7 @@
 #include "kvm/kvm_s390x.h"
 #include "system/kvm.h"
 #include "system/tcg.h"
+#include "system/memory.h"
 #include "exec/page-protection.h"
 #include "exec/target_page.h"
 #include "hw/hw.h"
@@ -522,6 +523,7 @@ int s390_cpu_pv_mem_rw(S390CPU *cpu, unsigned int offset, void *hostbuf,
 int s390_cpu_virt_mem_rw(S390CPU *cpu, vaddr laddr, uint8_t ar, void *hostbuf,
                          int len, bool is_write)
 {
+    AddressSpace *as = cpu_get_address_space(CPU(cpu), 0);
     int currlen, nr_pages, i;
     target_ulong *pages;
     uint64_t tec;
@@ -545,8 +547,8 @@ int s390_cpu_virt_mem_rw(S390CPU *cpu, vaddr laddr, uint8_t ar, void *hostbuf,
         /* Copy data by stepping through the area page by page */
         for (i = 0; i < nr_pages; i++) {
             currlen = MIN(len, TARGET_PAGE_SIZE - (laddr % TARGET_PAGE_SIZE));
-            cpu_physical_memory_rw(pages[i] | (laddr & ~TARGET_PAGE_MASK),
-                                   hostbuf, currlen, is_write);
+            address_space_rw(as, pages[i] | (laddr & ~TARGET_PAGE_MASK),
+                             MEMTXATTRS_UNSPECIFIED, hostbuf, currlen, is_write);
             laddr += currlen;
             hostbuf += currlen;
             len -= currlen;
-- 
2.51.0


