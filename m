Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5617BAB517
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 06:16:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133509.1471677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Rmd-0003e5-MT; Tue, 30 Sep 2025 04:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133509.1471677; Tue, 30 Sep 2025 04:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Rmd-0003T3-3a; Tue, 30 Sep 2025 04:16:11 +0000
Received: by outflank-mailman (input) for mailman id 1133509;
 Tue, 30 Sep 2025 04:16:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Rl1-0006gD-2n
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 04:14:31 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5a3da19-9db3-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 06:14:29 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-46e3a50bc0fso35640445e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 21:14:29 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb89fb19fsm21119525f8f.21.2025.09.29.21.14.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 21:14:25 -0700 (PDT)
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
X-Inumbo-ID: f5a3da19-9db3-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759205669; x=1759810469; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbEYNZgIU6LqvkF49qge8kIj2C3i6K2S813tsyxbWwg=;
        b=izft0kXPG8+lY2AhHFMPIt8Un8AF4FWb78ynbnWcga3TWcqxss+VMu6KXARK5elnvc
         CGvKuKHGhD7QevC2ohhm8GzwaYLTtOpgzE1IcMnSQeiX8uuxNHq3JVBsHsap9Ux1ImA6
         zLkCo5i7X8KvGIVIX9aF50k71tlVudbmG9qMfNEMsPZDKKt8bhPCcTb9Y5CC7W9VkcWi
         AzVKa+X4vx/bjNY7OZXqE3mKOOdYewIaw9f4L0ArWHQoI8DVqI8kcHzmsN8H/sjlCVRP
         Mio/li2HeTgy1OP53GMMuQ+CwELTUaXfIksUShxndJceouF8goDE7kY6jSfX/spUYtDJ
         8Yig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759205669; x=1759810469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DbEYNZgIU6LqvkF49qge8kIj2C3i6K2S813tsyxbWwg=;
        b=XZi5/0OXeV2voQY1YRkhA3p7sBihHUyw8+L0bq658l8KOvwN89DjMw8Ew0+bdB5lPj
         PAkBZHySlvbf0SYPwAu6MpWwQTtsu8eU6cgnh0JrgciUAkU/OKUNBiv3cxVnmrCtpBoh
         LkgK097n/tKTxTgGw0hRKuaUoh0ks06Wl+h0wU0eDFjmet4i0AH84BSFORWz5qq1UXTS
         qTeyRYinBf06L39aZadGy1Ba9evR0BYqDz4phDll/yYcc7rRfxl8ezW5HogmqKazJ0fR
         zebmMSktTNPd3LA4bzJthX/evz+jlYj67zo3KDXWnwNHfJCSDDvy8CYCc50PMQdTYcak
         Rpmg==
X-Forwarded-Encrypted: i=1; AJvYcCXQWymrfQmF1eVy5Zo6rzxSgkK68RqjWdyFgzh1m2T7OFmS4wJa3QwQDU6i/nP2VJo6pqBDeUWcCyQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcRX743oKDLJJeRbEAep2L/UjasiufKGULKfKq1SfnFz8xVlni
	1q3OV6uTAizVPGExP2ib2kVlJpwQegbaL9HQjmv3Ch0ZLjspynb3Cm2kt+HkKvn2oeo=
X-Gm-Gg: ASbGncvG5iFFbuPZympcGasXPTPWK5ux1MLbVWEtAtkJ5JSkxTu5IHXwSU+ef/Wboj6
	Dp/Q+05r+o+75XPHizGTxbnrGQsqVUpjUK3n3+GYDPOA8skj25pO+q9PUcGxu0ypPINEtcGjZM1
	MzHRWOTV+Zjek4x/KMtS6fUJdcDskLuoLJNj4pA58BGW3vlisKD+KKu6CRsrHkcgl0kGycJJi1s
	R5uhYkphKGEnFNFmDisqqJqkJKhmFNSO1DzIiUU5Oyy134EAtLY/xqAvVUNsEuXTdUiGC+SKeza
	N6jiHCGZYrGcs54rgFGgOsO6/A6BU7C36i32AucItdFtCIYiAPdnLvh5uDGEmJW7donl51N0Sqc
	Qr5UW+2I2rRBwuKYMUCLtE5Y7bGdmgT75fXTRmYop6bLwcbfqlCNilI6PuJRcRVGmx0rGfv9drx
	3lD3MatbrXHEmWFMAHGmKAU+Ysa7mAnCw=
X-Google-Smtp-Source: AGHT+IGQV+zsO38iVKo0msrSbqnR/OPqPQnfcFKxd1s907Qhohb0/U7DrOdOWLv1d/ID8PieNnQk2g==
X-Received: by 2002:a05:600c:871a:b0:46e:477a:f3dd with SMTP id 5b1f17b1804b1-46e477af5c1mr75062075e9.36.1759205669015;
        Mon, 29 Sep 2025 21:14:29 -0700 (PDT)
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
Subject: [PATCH v2 10/17] target/i386/whpx: Replace legacy cpu_physical_memory_rw() call
Date: Tue, 30 Sep 2025 06:13:18 +0200
Message-ID: <20250930041326.6448-11-philmd@linaro.org>
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
 target/i386/whpx/whpx-all.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 2a85168ed51..82ba177c4a5 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -788,8 +788,11 @@ static HRESULT CALLBACK whpx_emu_mmio_callback(
     void *ctx,
     WHV_EMULATOR_MEMORY_ACCESS_INFO *ma)
 {
-    cpu_physical_memory_rw(ma->GpaAddress, ma->Data, ma->AccessSize,
-                           ma->Direction);
+    CPUState *cpu = (CPUState *)ctx;
+    AddressSpace *as = cpu_addressspace(cs, MEMTXATTRS_UNSPECIFIED);
+
+    address_space_rw(as, ma->GpaAddress, MEMTXATTRS_UNSPECIFIED,
+                     ma->Data, ma->AccessSize, ma->Direction);
     return S_OK;
 }
 
-- 
2.51.0


