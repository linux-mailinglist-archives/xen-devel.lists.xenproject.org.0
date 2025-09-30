Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A105ABAB50B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 06:16:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133506.1471662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Rmb-0003ED-Ro; Tue, 30 Sep 2025 04:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133506.1471662; Tue, 30 Sep 2025 04:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Rmb-00038l-Ch; Tue, 30 Sep 2025 04:16:09 +0000
Received: by outflank-mailman (input) for mailman id 1133506;
 Tue, 30 Sep 2025 04:16:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Rkt-0006gD-1o
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 04:14:23 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0d7c145-9db3-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 06:14:21 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3ee13baf2e1so4220066f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 21:14:21 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb74e46bcsm20884752f8f.8.2025.09.29.21.14.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 21:14:19 -0700 (PDT)
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
X-Inumbo-ID: f0d7c145-9db3-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759205661; x=1759810461; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRsfrHQBMjnrXhlxfeiXrXfyISPq/9LUWh417J9QSAY=;
        b=HmQDEgd0WLroLb9N28GnwNptCIEWEgi1qt+7DGtYwOs0AymCIuxDUB3KwrhmrW9Vq+
         L+Kwbw5MN+9fd3uHtxJr1hpIp7QmTkNRuLDLTLgZ3ywCl9gz9TZS/hQev0YInkWcDOIl
         BXwaSjXLJ9pRMI7FRVXZJ+zAUy+yA76DhNeEdhFKEm95OYL7+1JDRjR6zUfLq6HIPjJA
         kQcfJbQURI8sM8GkXrrjGr60P8fIkD8GHhIqP6gFtgbnzNuhuaicuS3N7RLJF2UlnwEd
         PYhDABqv1EeOWccjhZyfWWCxYQLwiyZE3EdNoEDnqlHlNTVdyYeqfkKw+1/cstIX30UR
         Xk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759205661; x=1759810461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRsfrHQBMjnrXhlxfeiXrXfyISPq/9LUWh417J9QSAY=;
        b=VpqKDAO7gIG+cOedTEefgOIuOxTmnHYDKiq+HMFlzPgQ7ArjJOnzuouKGz/sEhjzZA
         Yn5e+dYy1Ixh5HNbW6GJhDTGFkQCfz8rKvwX7+1XZ+6iC3Ux4FHtCZ88q5Y3qH8mJD8L
         buJ4XVUcT8oMIu28AbkmrD3SxHA4yPw2p86Ojlj6qlA7aEd34zDAPVEzcx18AKtAT9au
         INPzHsaLkMjBUo2p3yd6XOFeSqYPT+ebBjMNdF0ogP7RWIbmf+7fuZPia8p2IQz928Mm
         +4SkDFOEFO8cJgkqavRo7RL8E2YPblAaqC3/WgTDr3ejBhq+Vrq+6YoD1qlb9axutrTF
         AqpA==
X-Forwarded-Encrypted: i=1; AJvYcCVTdjiKXyym8DzfWx+cBqetmIkqFK4O0qyUVW0DNpDJ641YYRXWDWlUqFB+CsoDCrWYYj37DliEZ8E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWCuByY3ZzVNEvqq2GA46NEB0t6FjRn4na2p8gKd41ZrhkUxAa
	oNwjxJPbTWheE9nKQY4RszEnE+iLUfkIM7GEwaFIj6mqz/eJa/YONCW46o0eyjpYtJk=
X-Gm-Gg: ASbGncu66iWtkpyq60BMRlfdw9AwbRs1Qf7F320AkVNAvBrIHYIaqOzK+xSsMgKRLkU
	fb8J4Scj4PdpIX/xfSNXzoHcXZNbcT5KjGAsDJjP07t5xWtqMEtFAYAUJpnYDLu4y2TcGmUExL3
	DLpxR8KqECQj6Ody7h1L9iBggoQdUmacrXgLiWvB5PYbWIknKNd2U6V40JDG6ZO6BTpbT/KRVpQ
	TDMRVSejE4q65wvVpYjlhiHzvJBdncpy6SPa/Vpjl8Gofp5N5dtF4QAGXwOdvb2feWD7SDajxR+
	xZDcglIC0scs2TZZK1K8qbvCuLzel6GIYe0sdLuZsu7E6sre14HNCgiuEGuFGX1ZYOa+R24s3iR
	yiP4ZzARyl1b3Rn88+k+huStB9Xg3U30viRRJmeE/DuK3mw/RgXZ52beLTlO5X6uD38iakkkGBK
	xBzCrxpNf3nT47J82Y2dC6ruClKyDDjhY=
X-Google-Smtp-Source: AGHT+IEAmcRaAQ7y3JKYkZc+1B3lBRPGfbSyTbOeVCtcFaGQrh4be0IXziHu3DKBh/h2DslEMGPKwA==
X-Received: by 2002:a05:6000:2dc9:b0:3eb:c276:a362 with SMTP id ffacd0b85a97d-40e3d69c099mr16747038f8f.0.1759205660946;
        Mon, 29 Sep 2025 21:14:20 -0700 (PDT)
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
Subject: [PATCH v2 09/17] target/s390x/mmu: Replace [cpu_physical_memory -> address_space]_rw()
Date: Tue, 30 Sep 2025 06:13:17 +0200
Message-ID: <20250930041326.6448-10-philmd@linaro.org>
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


