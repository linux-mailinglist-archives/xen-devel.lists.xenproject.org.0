Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84698BAC06A
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 10:26:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133912.1472002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3VgV-0004RT-5g; Tue, 30 Sep 2025 08:26:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133912.1472002; Tue, 30 Sep 2025 08:26:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3VgU-0004Nw-Sg; Tue, 30 Sep 2025 08:26:06 +0000
Received: by outflank-mailman (input) for mailman id 1133912;
 Tue, 30 Sep 2025 08:26:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3VdN-0007Nm-71
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 08:22:53 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7f9bd95-9dd6-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 10:22:51 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3f0134ccc0cso3832225f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 01:22:51 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-41855fc661esm13882477f8f.45.2025.09.30.01.22.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 30 Sep 2025 01:22:50 -0700 (PDT)
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
X-Inumbo-ID: a7f9bd95-9dd6-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759220571; x=1759825371; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5u2B/lBOO+ZT0vBm0zXHtehU3SXYck4J+kjqZup+Gg=;
        b=awB4yGMJ8RK5hj/xpKCvMXzqVagZ1MtHZMipLtt/5JsP8xSjsr9+k2W+MseYj5UInP
         eMh+icZLHPvinrfDLEbYgXm4kiqH0EHBd69y5qdhXRQ7hZs2cMYrHeEMsEDQfikBcK4X
         TLstJSfCZEMz4j+oKeR45m1QMiY00h5n/bLKAwbiLyrLfaIYB/e5cYt21vDxOWW8NTDg
         Urqy65zYUYwBFJenM414YVoxUuDaEM99bDlmUzMM2lIPft0ELUGjr/IyQBtt5jap2Uxj
         /0woNtM/V2Od5+1rhZFfFvbi1ZzY1uI4vaeNcVsCybiqzC0osgQcnTjRrAblVxEgQbam
         swdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759220571; x=1759825371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5u2B/lBOO+ZT0vBm0zXHtehU3SXYck4J+kjqZup+Gg=;
        b=skmEL4flF0ahDTZo7IRsOHSYVF9GxkowOJaww1iFunUB0AMPuxhFpvDm4ODXkiS1yd
         /gc6cXxHPkoSvqfmkLfP5tW4i7nOHOgW093ONzsxnbn8LFkGFj4GzNs3BeTnYwx+5EEp
         uyur/TR0R2+0tF845plu0ljt1NTSq4eePsDzP4FIGj1nrKRYDZIg4HGw4KSvAA/naLuO
         oAHmZhcJscd2H+046Lp8UaviWe1krcYBJSbQ6cUdMKSrtHWNnmUdtuJBbQRZfD/GC81W
         jfU0uV20o5AFMaunaya3bWRUvzHxhNDAaY2i3Zbi9hCOEY9UBzwO1Z957ocS408d9M0B
         bKGg==
X-Forwarded-Encrypted: i=1; AJvYcCVsHXL3iq562iJKw6oLzTywBmrboo9ZElozBRGsP6XUSrRPzmuGPsC1QpwOzLHk022oBgIF1wgN23I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTaWdsca5kjAcku4cEb30yR/YmRf8ryKfL5T1Kk0aKTPERWi8g
	dLmV3cfiRibMP+uDmd/8S1wXc1c+NjP598l0bHpIeteMxbdCbaPJpngQ8kSHXZ4FX6o=
X-Gm-Gg: ASbGnct1DojOcN5YzNYCTty3RN7nJGEAkTqUjiBW5nNRlQgv31I4CHF4am1mKDN7wZR
	m0/boOmJLBSzIlmAoPZfIZNB2AAQVorkbZtNNYxfVs5iOLlLAD5O9Vkx9B1ZyY7A2INqhSwBzsx
	9B0rKX1gDfQjqmO/L7MvsMGpLYHA0Ql5tXGwHqM6uJuvt7ylxdLPAUeVrWa0Sc0PYso90AUoHjd
	tNgcGG2XqKWNcJiQ8pYgATh6LO+Imiblxv9QZ4Q3OKAsGZnjAh8gH4umx93vRKvPnaK/FNV8DNp
	cyLWBWB2zLnkVB4FLd0i2+M/tAsGxZ6K0QWfJxHqzLp0uZ3lWJjmnzQtQWBqPgw8McBToIzZqZu
	LHYPnD1lM4DpKHvZ6/XyIRD0Nw3fPpurOTrvpBgJJ9MewohOdGertlTAnKLczDuvob7rqq23oLt
	3WDa85FedEdEOiSqDSwfr6
X-Google-Smtp-Source: AGHT+IF27z6BNMVinFPf1IUIruLrE/uTdfyqnRZ7rQ19Ax6aGtKGHkRUD8xTP4t1vKCXsfORDSUoIQ==
X-Received: by 2002:a05:6000:2507:b0:403:e61e:82e6 with SMTP id ffacd0b85a97d-40e4b1a07admr17394709f8f.46.1759220571045;
        Tue, 30 Sep 2025 01:22:51 -0700 (PDT)
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
Subject: [PATCH v3 15/18] system/physmem: Avoid cpu_physical_memory_rw when is_write is constant
Date: Tue, 30 Sep 2025 10:21:22 +0200
Message-ID: <20250930082126.28618-16-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930082126.28618-1-philmd@linaro.org>
References: <20250930082126.28618-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Following the mechanical changes of commit adeefe01671 ("Avoid
cpu_physical_memory_rw() with a constant is_write argument"),
replace:

 - cpu_physical_memory_rw(, is_write=false) -> address_space_read()
 - cpu_physical_memory_rw(, is_write=true)  -> address_space_write()

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 scripts/coccinelle/exec_rw_const.cocci | 12 ------------
 system/physmem.c                       |  6 ++++--
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/scripts/coccinelle/exec_rw_const.cocci b/scripts/coccinelle/exec_rw_const.cocci
index 1a202969519..35ab79e6d74 100644
--- a/scripts/coccinelle/exec_rw_const.cocci
+++ b/scripts/coccinelle/exec_rw_const.cocci
@@ -62,18 +62,6 @@ symbol true, false;
 + address_space_write(E1, E2, E3, E4, E5)
 )
 
-// Avoid uses of cpu_physical_memory_rw() with a constant is_write argument.
-@@
-expression E1, E2, E3;
-@@
-(
-- cpu_physical_memory_rw(E1, E2, E3, false)
-+ cpu_physical_memory_read(E1, E2, E3)
-|
-- cpu_physical_memory_rw(E1, E2, E3, true)
-+ cpu_physical_memory_write(E1, E2, E3)
-)
-
 // Remove useless cast
 @@
 expression E1, E2, E3, E4, E5, E6;
diff --git a/system/physmem.c b/system/physmem.c
index 033285fe812..51abc4cae96 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -3191,12 +3191,14 @@ void cpu_physical_memory_rw(hwaddr addr, void *buf,
 
 void cpu_physical_memory_read(hwaddr addr, void *buf, hwaddr len)
 {
-    cpu_physical_memory_rw(addr, buf, len, false);
+    address_space_read(&address_space_memory, addr,
+                       MEMTXATTRS_UNSPECIFIED, buf, len);
 }
 
 void cpu_physical_memory_write(hwaddr addr, const void *buf, hwaddr len)
 {
-    cpu_physical_memory_rw(addr, (void *)buf, len, true);
+    address_space_write(&address_space_memory, addr,
+                        MEMTXATTRS_UNSPECIFIED, buf, len);
 }
 
 /* used for ROM loading : can write in RAM and ROM */
-- 
2.51.0


