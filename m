Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9AABAA563
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 20:36:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133182.1471373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IjG-0005PV-7j; Mon, 29 Sep 2025 18:36:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133182.1471373; Mon, 29 Sep 2025 18:36:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IjG-0005NZ-3v; Mon, 29 Sep 2025 18:36:06 +0000
Received: by outflank-mailman (input) for mailman id 1133182;
 Mon, 29 Sep 2025 18:36:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BPw2=4I=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3IhN-0001U2-GB
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 18:34:09 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2e7109f-9d62-11f0-9d14-b5c5bf9af7f9;
 Mon, 29 Sep 2025 20:34:08 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-414f48bd785so2659460f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 11:34:08 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab4897bsm234657245e9.17.2025.09.29.11.34.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 11:34:07 -0700 (PDT)
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
X-Inumbo-ID: e2e7109f-9d62-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759170848; x=1759775648; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8IprTsHK83+//o00MiFkngA2W2onv/YPnwzWQKra2w8=;
        b=B1qC8Pa65WojuPUH9YkoSCzr47EcA0CzK9i9qnLsU34vd6+4Y8RpwaK0L1nvzNFjbZ
         h2d8ESpnFW4CMh0ElPv/4N/wK4TsJFhuxUB/jNRgWQTR4JVVshZqTbwV/C/Gi8V5j9sZ
         WQqFhtpW9ww6S8hWWGtCIIlpZstvvp3Rs7Q0KOLrn5Op9T0VzFPC/E1bD5FlS3Liiv6d
         7dbt60E/utGNmn/5OxbbLD9egCWTGv4VtEIZDkNQyAJSCPDI+oJZdquk9JGPXLdjE3tm
         LuMndkin7uBOAW9/tEDHvyYPvrZziIuT6e09vZOAGcIVEUwN0NS54OokkJpndHpkPqi7
         eD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759170848; x=1759775648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8IprTsHK83+//o00MiFkngA2W2onv/YPnwzWQKra2w8=;
        b=naORXrUOOZZIH60btQzZq5cajyCLYaRk1+tk+5ja2ZU5XRXjfIAmNgcfEzBb7oMmhF
         DsTFceoNrmo3yBVy4WrS7u0aR3WEgR9jFbzyLFwZ8yuuEIs2sYGrAo4wMyfzGxKUPAyg
         YBMbY0vXX+JshWI9uudh0Qy+gs1t7Ux2mGG+2Bt3a6ny0B15shm762VSZp3WBvkBYXWd
         TW1XbNeFz7VV2TSUfXXIPu+kV7qkljQdYuqofSaQ4+p2Ce9GgnAqnL2K5wW0+5LciX4s
         XV6jtlWiNS4Hzs9w/3GujpUd/TdWnwCze4hx/j6e1hP4OBz5gnQ258nZkWu0SRz+dxIp
         2Rxg==
X-Forwarded-Encrypted: i=1; AJvYcCVevjMw1OM0Tryla8JhSOp+ro+1pnN/8wt80mpnfdkaX2nQNy9tv+GsX4/Chn/iw+QzxmRxy0hsImo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw2iQv9UG5B+8+Z2hvLsVET6mVw3pAhWVkcE5QoBj4zSo9PMjm9
	2tdI1Y9FtZBYfMU+8sVH+/pfNUazebcr4YQeio9buLsl41zHlVfJ/rRm9WHTwqlD7lo=
X-Gm-Gg: ASbGncvAP2rIFb86RejimQnmeuJ2WsKr3txEOKK3N2CTmqw41Tu4jUQ0INf8acJgKhm
	/3RM/sQf35JaCM8mhDheUwPUu2tWJRseLO5uZjvDUW6AVtgtU8qP/6xheY3QHq6nDFL0v7xfNX9
	AIakgsLSo6asaGastOMRRtZnjoW0lgrq2ua9714sm0pwaKLt8ApWHS5lQjCmZXmbvQX9TB/aMQb
	NlaSdX8lNTI3jvF7jnMfTabivnaz9seMc8lHLOBK+vrRmOdSn3Xzgc0YM7xgpkItA//Blb8X3rn
	PQnDtFStoAqLGUwXVxoxQfwiP0KPcVcT9V3p6WcY4Bh9H3i4J7Jzhxxm8a3O8oE9i2dW3JwzqJb
	hekAoTOXy9rUpv+qGR6guCxtmM6yJ0Mf8z9p7mGHrcHphniGGXvq13PqJPkQ3Kd+s2zgymh9u
X-Google-Smtp-Source: AGHT+IF/C6oWT8UwF1sEc7lk12OQ3847JVrL7Xi1bCnoAAIGAt33I27+pHrZ0wCfK5j980LBTwOBoA==
X-Received: by 2002:a05:6000:1846:b0:3ee:15b4:846c with SMTP id ffacd0b85a97d-40e44682b8dmr16577132f8f.28.1759170848080;
        Mon, 29 Sep 2025 11:34:08 -0700 (PDT)
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
Subject: [PATCH 13/15] system/physmem: Inline cpu_physical_memory_rw() and remove it
Date: Mon, 29 Sep 2025 20:32:52 +0200
Message-ID: <20250929183254.85478-14-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929183254.85478-1-philmd@linaro.org>
References: <20250929183254.85478-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

After inlining the legacy cpu_physical_memory_rw() in the 2 functions
using it (cpu_physical_memory_read and cpu_physical_memory_write), we
removed all its use: remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/devel/loads-stores.rst            |  4 +---
 scripts/coccinelle/exec_rw_const.cocci | 22 ----------------------
 include/exec/cpu-common.h              |  2 --
 system/physmem.c                       | 13 ++++---------
 4 files changed, 5 insertions(+), 36 deletions(-)

diff --git a/docs/devel/loads-stores.rst b/docs/devel/loads-stores.rst
index f9b565da57a..c906c6509ee 100644
--- a/docs/devel/loads-stores.rst
+++ b/docs/devel/loads-stores.rst
@@ -460,10 +460,8 @@ For new code they are better avoided:
 
 ``cpu_physical_memory_write``
 
-``cpu_physical_memory_rw``
-
 Regexes for git grep:
- - ``\<cpu_physical_memory_\(read\|write\|rw\)\>``
+ - ``\<cpu_physical_memory_\(read\|write\)\>``
 
 ``cpu_memory_rw_debug``
 ~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/scripts/coccinelle/exec_rw_const.cocci b/scripts/coccinelle/exec_rw_const.cocci
index 1a202969519..4c02c94e04e 100644
--- a/scripts/coccinelle/exec_rw_const.cocci
+++ b/scripts/coccinelle/exec_rw_const.cocci
@@ -21,13 +21,6 @@ expression E1, E2, E3, E4, E5;
 + address_space_rw(E1, E2, E3, E4, E5, true)
 |
 
-- cpu_physical_memory_rw(E1, E2, E3, 0)
-+ cpu_physical_memory_rw(E1, E2, E3, false)
-|
-- cpu_physical_memory_rw(E1, E2, E3, 1)
-+ cpu_physical_memory_rw(E1, E2, E3, true)
-|
-
 - cpu_physical_memory_map(E1, E2, 0)
 + cpu_physical_memory_map(E1, E2, false)
 |
@@ -62,18 +55,6 @@ symbol true, false;
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
@@ -93,9 +74,6 @@ type T;
 + address_space_write_rom(E1, E2, E3, E4, E5)
 |
 
-- cpu_physical_memory_rw(E1, (T *)(E2), E3, E4)
-+ cpu_physical_memory_rw(E1, E2, E3, E4)
-|
 - cpu_physical_memory_read(E1, (T *)(E2), E3)
 + cpu_physical_memory_read(E1, E2, E3)
 |
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 6e8cb530f6e..910e1c2afb9 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -131,8 +131,6 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
  */
 void cpu_address_space_destroy(CPUState *cpu, int asidx);
 
-void cpu_physical_memory_rw(hwaddr addr, void *buf,
-                            hwaddr len, bool is_write);
 void cpu_physical_memory_read(hwaddr addr, void *buf, hwaddr len);
 void cpu_physical_memory_write(hwaddr addr, const void *buf, hwaddr len);
 void *cpu_physical_memory_map(hwaddr addr,
diff --git a/system/physmem.c b/system/physmem.c
index 5a0ee3b8e58..93e9550338f 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -3181,21 +3181,16 @@ MemTxResult address_space_set(AddressSpace *as, hwaddr addr,
     return error;
 }
 
-void cpu_physical_memory_rw(hwaddr addr, void *buf,
-                            hwaddr len, bool is_write)
-{
-    address_space_rw(&address_space_memory, addr, MEMTXATTRS_UNSPECIFIED,
-                     buf, len, is_write);
-}
-
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


