Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F24BAB4FC
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 06:16:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133498.1471622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3RmX-0002Cu-GP; Tue, 30 Sep 2025 04:16:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133498.1471622; Tue, 30 Sep 2025 04:16:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3RmX-00029H-BY; Tue, 30 Sep 2025 04:16:05 +0000
Received: by outflank-mailman (input) for mailman id 1133498;
 Tue, 30 Sep 2025 04:16:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3RlV-0006gD-0L
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 04:15:01 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07673729-9db4-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 06:14:59 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3ee130237a8so3873594f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 21:14:59 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb72fbb27sm20526091f8f.4.2025.09.29.21.14.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 21:14:58 -0700 (PDT)
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
X-Inumbo-ID: 07673729-9db4-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759205699; x=1759810499; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwO23E8zQD3tYxR1qcdfXict3HnZqpkDFtM6ocAlj5I=;
        b=cex1n7YEdI9FmvQ4SFGyQSYpFRswclXa1UlL/IpK7MqsNv83X3hY7Adfpq0XlQ5ofn
         TAT/ZPIeJ6VYuqmztXd/P9VTbK6x6eVbGKM9FZAPNO8W5GlcTw6KFgjU0UFmRNwLCf25
         Cbwjms4PX3SqXKq6vjrSSjHVlMy73QRV2RMMNOQO8osyAB22qASTfzJN80D0WakTnU7T
         jWd4p/96ruQXH3V52xVhh7Tvadj0b1HTLwMyUE3n+LXnWoBs35OnNvutC8PG5UDdwATT
         QyZA3eTq1UI+NDjvh4IaIvArZVQE6iJkpURiZNCw1n4xK9e6GiIWDT1D4ZkNgX9djvxL
         hgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759205699; x=1759810499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FwO23E8zQD3tYxR1qcdfXict3HnZqpkDFtM6ocAlj5I=;
        b=AmkG8d/3cfWNeBQgNhwfkQuWN6f/BP6/pI4pVMnTXyuP9LpckgJgWtfy09xQGsqcUa
         eDEI0QjInj7zXdi7XL0QxVgxSUYfX9ITHXmflZ3jcbRdQoNa7ImdZ2o+u/8rvBA638fa
         0BOXqueqdNAkA+vEWuHJp12GbHII/ismTkAk85aGhp2g23EwutdS8C8LdgOdh6oH6sJV
         hAY4aUlrRTvuWmEdJ3bN6kSov7LSS1UzT4cZl7waUfer7nQl6R/gP8/09kj2VWX4jO1S
         UdnQLhUTTp2N9h26hyy4bJgAEHdTNM3/ysgRYeyUuj6gcUluVQ9ACjj4YAP/Q65uQQI1
         Oafg==
X-Forwarded-Encrypted: i=1; AJvYcCUu9fDF22VEVzy9JAwuUYGRD4kDosI3oKVCuwBNgg0utIUJWC5sFeiIZY/9mgDK2gtV0XQ5WjU2KGw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YweKjzqT+vEE4tIRfSO3PFHZZblSAJgxvyvWIc0urK1Ijg4djo7
	NGZPDCSpyQ+VcSWhrJ5j7+fb3Te+78ehO/AVYO6cLuXnhXgtgSzUsAjdgOw1EB8lYh8=
X-Gm-Gg: ASbGncslm7cCyuaJLmyi1xG+hgGkphcxM3vEGmqUf/f3VftG0zEV2z1H74ig7GDF7TO
	0AoSMoow+ezDDaGogkIKthByhgeVTaQphevTU9TxwDMGNJRVt9juYV8cxt0vD+a7kPhLywovd3g
	SnEDx5Ty5OFzJ/YYLpzZCHJ1SA1UT/XYhlKTIX67fFN0dNqIl+GOkGUfz544BuO/RoSjK/l0/uu
	NY0B2sTivf2LvyHxzdtbrYun5ZwXPZyEhGboKzTdKEJPJ6P9roVgzNPEPF+u+KK69ROSx6paHVx
	SUud15dTwQp1UHWNVNnKBm5O01GkvTQE+jTlvVm9/SWOOjWFaB06IS4DKsn9SYmFkYyRotbqCsa
	AJXk5LlFJwkIR9IhudVh9b7cDqxCquz1zL/9wB0GRJwIKled5wVEe3ZEMuJ9dsYaWd6SBb+TjSY
	HKlDCma26RS9nTo/UGzKeXcQOPKK7iTfgk3TF/FJz3JQ==
X-Google-Smtp-Source: AGHT+IHQUeMIWrPOvhxUlcXifIoWvE3/8AU9Ob5ucePyts2g6/ZGYEFjge5tsRgBwyw13Vrh3DLZdg==
X-Received: by 2002:a05:6000:430d:b0:3ed:a43d:e8c4 with SMTP id ffacd0b85a97d-40e458a9856mr16110543f8f.6.1759205698778;
        Mon, 29 Sep 2025 21:14:58 -0700 (PDT)
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
Subject: [PATCH v2 15/17] system/physmem: Inline cpu_physical_memory_rw() and remove it
Date: Tue, 30 Sep 2025 06:13:23 +0200
Message-ID: <20250930041326.6448-16-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930041326.6448-1-philmd@linaro.org>
References: <20250930041326.6448-1-philmd@linaro.org>
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
index 6d6bc449376..a654b2af2a3 100644
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


