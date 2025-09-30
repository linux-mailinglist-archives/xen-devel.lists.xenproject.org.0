Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6C7BAB4BD
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 06:14:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133444.1471581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3RkQ-0007w7-9s; Tue, 30 Sep 2025 04:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133444.1471581; Tue, 30 Sep 2025 04:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3RkQ-0007tg-6K; Tue, 30 Sep 2025 04:13:54 +0000
Received: by outflank-mailman (input) for mailman id 1133444;
 Tue, 30 Sep 2025 04:13:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3RkO-0006tq-Kt
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 04:13:52 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df7203a1-9db3-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 06:13:52 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-46e501a9034so12889255e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 21:13:52 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e56f536a3sm43891685e9.8.2025.09.29.21.13.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 21:13:51 -0700 (PDT)
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
X-Inumbo-ID: df7203a1-9db3-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759205631; x=1759810431; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPaFfZE+Vm6W3t7QC31lKwf41cuqTfJ0BWTKMrsHvkU=;
        b=HObH+LjFWxfJ1mUOovyD9dRFY7WD4DrvU/RJf8vy7lFXUQsx0pKT2O27/S8ob+dR7Z
         uJ4shdhhO/fyE3Y9dX25HB/mT/2Ll4uaiEFeuYn6To7p5Jk/4HHLhpbR/maJOC3sCq3a
         9bp6ajSqKrN1789iyCVDR9PEzHdE5tpXiP7Pfe/iv/THrLxh5kGIWRyJzw9M0wfKXPWy
         pqRVIc2Km2BK3XInz2FxhJd47O6BywmjDYsi5XeRwlrnvSgEtWnBrpzK9aVYmVNQyy4n
         nA1dIKYA8RfIYmFpw56tURMzyt9Y/VsM7z9zpZYShfH8kanzH530TOePI/wvJo+0RYU4
         uOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759205631; x=1759810431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPaFfZE+Vm6W3t7QC31lKwf41cuqTfJ0BWTKMrsHvkU=;
        b=kagyI9n3BJH2S0+hav5TT7E2ZEeJ9nYiCpbuuYM6lUCx38UalrLE0j3ku4z65oZT+z
         Xcg0nje7Xll/fjXEVlOkZyDCzktgnwg6YT4D2KVbzZOktRpyCPCD/VSUMuDZ8hTji7FW
         vJr47RLyhPNhMVnXKLksrrkGqVJRkiuu+5Yl8JvFZZ4FB9908aZi3qvb5gIKosWur6Gc
         Dw1rvRcsLpC1sZlPNQe223WhHvbCXK7HfErE/haolXfVoAcF/859S4WN3RrOzGZORa1B
         L+CFM71+o8O2bM/FKCb4x+SRS0A9zgqW5HrB155903xtjyXYFWv4rYChZswPH/2Dd2ow
         14CA==
X-Forwarded-Encrypted: i=1; AJvYcCXHhSzu3THq4EZlg/qHWz4ndcLmVN71I+nhLsS7mfYGWJEmZ6QwQeRZ2I29IGULVinfeq4onyDxTBw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWH2BcWmHSVr9zHf3+E1BtZ0wbf26k46h+FUoYOFWUbd6lCnep
	EYjBdUYTeL5qqnE0byZ95S0jGQvdhXzLNy1YpJmITOlkbEfoqzL+7sX30jskvy+q19M=
X-Gm-Gg: ASbGncuxxFlH2EKhhbe2u/40OHL++oLsifBaDeRvTv1rp7i6QSl9qSvrhKwoivKeU3w
	gbIzJNkP1zJW9ToKZuI9krMrfR0tQKtX112Hf63Zq0jUwEhF8lYu926YvVGpf5UYkV2BYEF+0lW
	orPw0G+4CBdPgwqZRU15k214pXHM5QTYKifC64YwJaV+t5hcjJv5fFb2Dd7MKR18EbjU9S1iZEi
	s++Ay6gV633JR3AWie9T0iwujJB1dNJdOhK47hWbTJZYJSh71yMb0abZ2BUymLMVvhQ7HuYimLb
	eGFyazl8Or8EkuEBOBihYME/Y8Kg7MigEeCSfzipn4xtj4Cy74VwfKr0jxH3g1plGy10aWAjUH8
	LIX5RSofS2L6to+9a02ANs4YF7C+U0cOiA4i7YdyNuZU1f887adGvhQZc77t2eZZT4/jmwhR7FQ
	pm47xwsGZE6i3PCZBnHfYybdXDyETGgQ0=
X-Google-Smtp-Source: AGHT+IGcac+YiZIcZSnCrqiaQ5DwkBXJUwHzOeJuSpEQu46EHairXFh+p7pa80eZkns9YIhZ38oTxg==
X-Received: by 2002:a05:600c:444d:b0:45f:2cd5:5086 with SMTP id 5b1f17b1804b1-46e3299f4f3mr172171215e9.3.1759205631445;
        Mon, 29 Sep 2025 21:13:51 -0700 (PDT)
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
Subject: [PATCH v2 04/17] target/i386/arch_memory_mapping: Use address_space_memory_is_io()
Date: Tue, 30 Sep 2025 06:13:12 +0200
Message-ID: <20250930041326.6448-5-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930041326.6448-1-philmd@linaro.org>
References: <20250930041326.6448-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since all functions have an address space argument, it is
trivial to replace cpu_physical_memory_is_io() by
address_space_memory_is_io().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/arch_memory_mapping.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/arch_memory_mapping.c b/target/i386/arch_memory_mapping.c
index a2398c21732..560f4689abc 100644
--- a/target/i386/arch_memory_mapping.c
+++ b/target/i386/arch_memory_mapping.c
@@ -35,7 +35,7 @@ static void walk_pte(MemoryMappingList *list, AddressSpace *as,
         }
 
         start_paddr = (pte & ~0xfff) & ~(0x1ULL << 63);
-        if (cpu_physical_memory_is_io(start_paddr)) {
+        if (address_space_is_io(as, start_paddr)) {
             /* I/O region */
             continue;
         }
@@ -65,7 +65,7 @@ static void walk_pte2(MemoryMappingList *list, AddressSpace *as,
         }
 
         start_paddr = pte & ~0xfff;
-        if (cpu_physical_memory_is_io(start_paddr)) {
+        if (address_space_is_io(as, start_paddr)) {
             /* I/O region */
             continue;
         }
@@ -100,7 +100,7 @@ static void walk_pde(MemoryMappingList *list, AddressSpace *as,
         if (pde & PG_PSE_MASK) {
             /* 2 MB page */
             start_paddr = (pde & ~0x1fffff) & ~(0x1ULL << 63);
-            if (cpu_physical_memory_is_io(start_paddr)) {
+            if (address_space_is_io(as, start_paddr)) {
                 /* I/O region */
                 continue;
             }
@@ -142,7 +142,7 @@ static void walk_pde2(MemoryMappingList *list, AddressSpace *as,
              */
             high_paddr = ((hwaddr)(pde & 0x1fe000) << 19);
             start_paddr = (pde & ~0x3fffff) | high_paddr;
-            if (cpu_physical_memory_is_io(start_paddr)) {
+            if (address_space_is_io(as, start_paddr)) {
                 /* I/O region */
                 continue;
             }
@@ -203,7 +203,7 @@ static void walk_pdpe(MemoryMappingList *list, AddressSpace *as,
         if (pdpe & PG_PSE_MASK) {
             /* 1 GB page */
             start_paddr = (pdpe & ~0x3fffffff) & ~(0x1ULL << 63);
-            if (cpu_physical_memory_is_io(start_paddr)) {
+            if (address_space_is_io(as, start_paddr)) {
                 /* I/O region */
                 continue;
             }
-- 
2.51.0


