Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C22BB33DD
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 10:42:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135423.1472571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Eti-0002Bo-Ty; Thu, 02 Oct 2025 08:42:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135423.1472571; Thu, 02 Oct 2025 08:42:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Eti-00029p-Pl; Thu, 02 Oct 2025 08:42:46 +0000
Received: by outflank-mailman (input) for mailman id 1135423;
 Thu, 02 Oct 2025 08:42:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9sj0=4L=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v4Etg-000821-Mm
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 08:42:44 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3907010-9f6b-11f0-9d14-b5c5bf9af7f9;
 Thu, 02 Oct 2025 10:42:44 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46e34bd8eb2so7584335e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Oct 2025 01:42:44 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e6b23d4c5sm17135895e9.17.2025.10.02.01.42.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Oct 2025 01:42:42 -0700 (PDT)
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
X-Inumbo-ID: c3907010-9f6b-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759394563; x=1759999363; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/V6bK/dS4q8NfIVc1IYGAX2Y2n9tYdVPl2PhRG623tw=;
        b=wjIMPQyHxlPceyp90fAWmX382DiFtaVI3OHiK/b546ZFiWCBz4qSYiT44mKyYUHXRT
         UOt+qthBSQgg9wNngP1ShbhsVbopR4g4cWto6lKhrdvLvoDuvq3sIcqAJGu2yXUb8p9r
         QZGuP7WHe1VNgyG859ph2RzLj3pTlVMdHOicxZDGDkNNTsl7UOoz9+kzmL2cn/hDQISr
         kfxFqQUgL3xw0lokQOvt8v7hAd/pfqiay9cnx0aCpS9tBpRK+l7frNpnVjz4hShCPps5
         wYA/ge3r+ienoB+TlmbYJlnMHOz0wQFauYdV8cppAx6YsfJTUZkYvQxz7aY/X5jebtqX
         J/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759394563; x=1759999363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/V6bK/dS4q8NfIVc1IYGAX2Y2n9tYdVPl2PhRG623tw=;
        b=UnBli8QratGzc4HCgchGrbSKHZRPUnESD8SoF6XgCCEE5B2dmf6U1zhmuwgSsWYeUG
         8mM69CGDw6ObTaXX9MaDoRwzJgGl4o8imLTr/9363hrNF477fO0XhLaI4Kd+EMg07bnm
         CfvKEgIxerkhEN8n8IvCpJ6POYZ2i/4w/W5kaLaJym+CxN9FyRr4/uMKCg4kzBc60FPT
         rkiNkblTlYmxS5UjRQNS5v58zLeot0GVBGWzj36+ED9bpL5k+7eoZFot+GtHBIQR6/KT
         g6arTw1IQNWWEJRZh9fcyyuEWp/aDrBAbmw33qGLB3UalaqPGtR59Nm/Dj9b9LqYKLOg
         19yw==
X-Forwarded-Encrypted: i=1; AJvYcCXEJqpRVadDKHDSS4sowvhkEIRDjSEM25p57iho9pJ4AMt8bwdB8WbYQyR6ST3y0tfybNwIDAQvr6Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxdGWbfusGscSPEFqh5zq5zq01Z7YhBt64JX03yKoEbu3Fu8JCx
	h/vIDp84Z9EWeRwDAJKaxrMUPiZTeTRuP04CsBAJ+cewhpJsOSqxVfr4k9zRjYI0lbdhAqW1byw
	ae7vi6scW4A==
X-Gm-Gg: ASbGnctwlykpHWnNkPxb4eA2hS8CuFStSYnFB7mcRlrZgwUuRcg/Csr8QjeHFJKTcEP
	RP0mhsvqaXuy8X2WYo5leSHOYN/0Te7DD5n4WT0u6+kZdGaT5ZbrzqJaKOBKrMIfnjjEvKlZjbS
	u0e4vKKtFfGOtdqWhp6fc4E11g97ql6LnA+9fpnOfz5czEhMB1wjo1rwBxEOkFj1NVueIxB5Pet
	tVZ/WX/vLfhyUXZ+dad+bM6uN+I6TIiBK1ytnCeFayhf9M5eMr8ywpNGPyjFumDC5s4St7OpsdB
	znbp6xzu0pwQKQGLt/Iz7whZ80yOZywrjlsupuy2pDt+6fQTiG20JD4G6ms67MHRyI9NO5GkdrE
	/Gm4i6fjt70L84ElWOUsBwrodW66g/ojECv7t1QLaggnRKSm9NZZjtl53MxYMSFB/sP7GbxdO3q
	HtqY+Ovd5okCxTK7GvIWA4NzrBROEZvA==
X-Google-Smtp-Source: AGHT+IFyxE2f+paPHZWS7atlHQE5YorXbC8H3ZNAWMF66wQjW+bist3zGSpvkgOszGdSmrRhuBdazg==
X-Received: by 2002:a05:600c:1d15:b0:46e:46c7:b79a with SMTP id 5b1f17b1804b1-46e6125d269mr48068925e9.2.1759394563460;
        Thu, 02 Oct 2025 01:42:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 08/17] target/s390x/mmu: Replace [cpu_physical_memory -> address_space]_rw()
Date: Thu,  2 Oct 2025 10:41:53 +0200
Message-ID: <20251002084203.63899-9-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002084203.63899-1-philmd@linaro.org>
References: <20251002084203.63899-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When cpu_address_space_init() isn't called during vCPU creation,
its single address space is the global &address_space_memory.

As s390x boards don't call cpu_address_space_init(), cpu->as
points to &address_space_memory.

We can then replace cpu_physical_memory_rw() by the semantically
equivalent address_space_rw() call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/mmu_helper.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index 00946e9c0fe..7bcf1810bca 100644
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
@@ -542,11 +543,13 @@ int s390_cpu_virt_mem_rw(S390CPU *cpu, vaddr laddr, uint8_t ar, void *hostbuf,
     if (ret) {
         trigger_access_exception(&cpu->env, ret, tec);
     } else if (hostbuf != NULL) {
+        AddressSpace *as = CPU(cpu)->as;
+
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


