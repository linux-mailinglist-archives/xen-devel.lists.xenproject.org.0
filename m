Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0BABAA4F6
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 20:33:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133151.1471352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Igs-0003RE-LE; Mon, 29 Sep 2025 18:33:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133151.1471352; Mon, 29 Sep 2025 18:33:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Igs-0003OG-HS; Mon, 29 Sep 2025 18:33:38 +0000
Received: by outflank-mailman (input) for mailman id 1133151;
 Mon, 29 Sep 2025 18:33:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BPw2=4I=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Igq-0001U2-Ij
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 18:33:36 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf51b038-9d62-11f0-9d14-b5c5bf9af7f9;
 Mon, 29 Sep 2025 20:33:36 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46e3cdc1a6aso27635575e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 11:33:36 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2a996c03sm236802335e9.3.2025.09.29.11.33.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 11:33:34 -0700 (PDT)
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
X-Inumbo-ID: cf51b038-9d62-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759170815; x=1759775615; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRsfrHQBMjnrXhlxfeiXrXfyISPq/9LUWh417J9QSAY=;
        b=Fmwo9CfvXaYB/hN0GcuL6pwB0lrzu5OgHkjy5Y/C+InDUhjdrM4/cxoEfYc/YP7XWJ
         dTkRTAEeqzY5sZCVVheJPeIwZUkcvgzD/ebY+9zmI/hnSl86dOhFwevkS6bHnpyy3slB
         Z9rmonKYH3sNQKsFmvyApYlEW2d18y4umIEFVY7RgK6A/oyx+odcnG91ZIPh0D/s++DU
         vzGcBEl6eSIdQt0MbPIGgrK0p+UxDvRSgVBBkEnTU+rlyUzGDj8nOn2ODK3HzYcHUNSg
         xxEybFBSz+I9ephHdp059eyHsikdiyB7NzucVqPLGHl5UGIV60D9b8OFDrtUd3MvNDZg
         IT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759170815; x=1759775615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRsfrHQBMjnrXhlxfeiXrXfyISPq/9LUWh417J9QSAY=;
        b=TaX9ry1Hr7DscG8ch24xkE4aAvMFJRS4r+GvnLhPeBzblZrbBHrQuYsv6d48WOo27U
         SlyHoW+nEsYoC49Ch6tg2UjKt/DlvA7dR5vjA8bCOHaCtHYPO4dDgpalGLmgzoFqKToD
         i84KyBWzKtdYu4EI8KBmEBhOr6WvEekkGtEKOXUIgFQHZ1CMO6Axgm+EBDZNbFnCzXhm
         GT8CsyWMpQ/xu9rwZOVXLV+hXTEKbOWhshqn0HNEyOec3rY5NrCzLyxXvvptPqfX4/Y6
         3LR3yHss0wngvPBSz3Uib1BF1rEehnA6sHMl4WckOzV860urd69jP89Ucehs2AQz39Pi
         3lDw==
X-Forwarded-Encrypted: i=1; AJvYcCVkYSs7YDIX/XXTIym2RMGD1FZgPVFeHgEiwEhTTWTI/vcJx67zDPYzbDF/FRaWDW01evEAV+cd6FI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDfyECbHg716dmgtrM592p5K4rGyWPyDEzg9WTPINHUhyN7AQU
	gLe7SoxioGaV/Wa91V7jss7wE/lFfSauEULIUlaXuoHw9qzXQj5YJt2sJunMcbKT3rs=
X-Gm-Gg: ASbGnct0DRyw9Eo2UVcLwLt9MzWtR86aTjJxwUhxqBJa1BQ/BxzKVvu4CgD4pdIxVjN
	N7YdEIGXBoInFsMX6MLmcr7Uf9uvvok4o50puaQ2RmiE3eMbX2y31kLrJlimptR3qG0uYsR6cor
	CBeCCEDF+XxSZ2B2Cb5Do9e5evJCeba0Y7wbrLOcPKGW4E6YSmSacJEmH5tjRu1G5Suzp0xE8gY
	Xv0JMOi/jptYcuuQ393DJJ4RJu7XYWD61PycYeWwkPJkiMsrOVcxE98jCt/sapxGl6X91EsAaP7
	sMyKDpUnEtunxyZppMbgwXufeBi9sn2g+L/rmPF7ySJyDxG6z+1X5vrejN8QO/LjYq+WcRrsmjF
	qsdizwIC43TrQ8pR5tb+UXnRND16azdEXhatNo24ZXlzsd+Ur+sCMiKASV+6LYmOfyaqR20lO7x
	y7MbX2+y8=
X-Google-Smtp-Source: AGHT+IHnK2dcf5REXjP75RtjLmG0FRF3SPCN5/ScyVADUNX4W97Ctb9XEl/zwwWPFNLidNab3G3GOQ==
X-Received: by 2002:a05:600c:8285:b0:46d:c045:d2bd with SMTP id 5b1f17b1804b1-46e58ac80f9mr17543845e9.8.1759170815433;
        Mon, 29 Sep 2025 11:33:35 -0700 (PDT)
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
Subject: [PATCH 07/15] target/s390x/mmu: Replace [cpu_physical_memory -> address_space]_rw()
Date: Mon, 29 Sep 2025 20:32:46 +0200
Message-ID: <20250929183254.85478-8-philmd@linaro.org>
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

We can then replace cpu_physical_memory_rw() by the semantically
equivalent address_space_rw() call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


