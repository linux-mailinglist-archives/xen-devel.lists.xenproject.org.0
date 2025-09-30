Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3064ABAC064
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 10:26:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133906.1471974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3VgS-0003p4-TP; Tue, 30 Sep 2025 08:26:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133906.1471974; Tue, 30 Sep 2025 08:26:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3VgS-0003ml-PM; Tue, 30 Sep 2025 08:26:04 +0000
Received: by outflank-mailman (input) for mailman id 1133906;
 Tue, 30 Sep 2025 08:26:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3VdR-0007Nn-Lv
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 08:22:57 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab487156-9dd6-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 10:22:57 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46e3ea0445fso21834835e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 01:22:57 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab31f1dsm257299105e9.13.2025.09.30.01.22.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 30 Sep 2025 01:22:55 -0700 (PDT)
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
X-Inumbo-ID: ab487156-9dd6-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759220576; x=1759825376; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+NTzU/IHsRou1TdenwZChnEmNZiK1YgxaNrzj3kN60=;
        b=BewCbPvddGEl84F+zw1T1AFIzSZbcz8oWJzP+5sAYRrVApHPAZGlAa+MHeu+tl5no2
         DSeWPgAjTDbUJCNZakYhkl32EFM6YRc5i95Q8VzpmHlBjCoBy5YFkuMt1wbZNJNPS22y
         xB3BGwy6n2gSbSerL1rueG0f9fvrDfFbnqKddejp3ARpVTrb2BalGsG28uU2VmNCztbm
         NZXpl95qSRNM9SvQ0zAKIN/wKlgZy8aOUZfwPwo8Wp8sCh0UUgXiQ3khTTb69OYLM0FF
         ceCiCWPYdiHeu+ibASkDf/4ocs3KVxpF+LKSWH43DcUS9zX4uo6ueZlfxvjKmJXVwWpc
         9aRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759220576; x=1759825376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+NTzU/IHsRou1TdenwZChnEmNZiK1YgxaNrzj3kN60=;
        b=PrfUaLVvWnoWdoVq3qmFSHuTKNn6S0ZUvaIsRUvy7S0B9TbS8sa+HqLBTBfBdvfcQr
         8ohMC5ZqczvEESU3v5C2QEKcqnRihPEg5AImcxKVapjmMnfwd0mM2MzQifn6qvE6eHDH
         G3wWKvgncHxNogaRYKFj6dPSY6In/S/GlvpQqBXYH7SNofPGUxN+X+DZOjA5L2X0ZbLp
         2P2haWjagReZUcsF8/VmsMU3MoDRKNVs34XNFDcUjflWRCyfi2pF2a6zRjKngTwIcjP0
         wHNH39H4yLba9bksOcsdY4U+YRPNCT19VCCXCqnHWAkxLUfMPC8c+AbsC5ik/5CqjkCF
         xAPw==
X-Forwarded-Encrypted: i=1; AJvYcCVFWiVPffj+6ex32mGqalTDoVwntB45YZasCkErjgKmZOZo7ds9DG8RRFYJCPvxQPzFN0UatcwwJ7c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcLPNFhhcCDbkXZ/Fj0g9XLpsMVLabGaG9W3C2dcHObjqMb4ZE
	1C6SXdFIdC6qo0EZge42/xJ4SWdqvM/K1EDY5PxjBOYTgoQxtHWtRWy1nXbk4y/ah5E=
X-Gm-Gg: ASbGnct0ICyd8geCS5W5ROKnqGzxdiuVzvAqvbtHGmts6lKxrxdjw3G85IBSmyRqBR1
	7UQTyWwCyJavkQbchhXLQ6y5srcnO5ryc2RDGnIEa5T0h0OKP2ZA5DLxu6ALlHe1YvF42Y+zKP/
	vEPJQ6QXNbW3QwJr6jw4yFib1k9zHsE8TBd0bsxZeboOPwjGrdkovU5gkTZTWbediTDh00IPSyc
	AP27pfr55iHvJuymxSAWgCrSnB3GEIl6sXAPs/Cd3o15CMkRdkfw09W6S8hJ7XwDZbojOtKZ++0
	V2C+8tz0yEtMJEzq1ZyMwpzJOuQCrr0HJkSvnliGhKS5kUFy+WidK2oIXIgQsCgJQgU/TzuAmFH
	9wbCJh6JGb4rnH8f50Xpt28J1Mwsut1vdU8bdG8A1vANbMULgo5BXJuphUxUljHOFpJadT/ZTXK
	9p9/S9sJWp1aVNuvMv6XiO
X-Google-Smtp-Source: AGHT+IF6MOWO4c82B+adWYsw2taxPQCQZ7xaYbsT9FR7waxJpKF5wSL8PK2fRqDT9d11Kh1Y1Hd+uw==
X-Received: by 2002:a05:6000:2509:b0:40d:86d8:a180 with SMTP id ffacd0b85a97d-40e4a71159emr18168445f8f.20.1759220576446;
        Tue, 30 Sep 2025 01:22:56 -0700 (PDT)
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
Subject: [PATCH v3 16/18] system/physmem: Remove legacy cpu_physical_memory_rw()
Date: Tue, 30 Sep 2025 10:21:23 +0200
Message-ID: <20250930082126.28618-17-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930082126.28618-1-philmd@linaro.org>
References: <20250930082126.28618-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The legacy cpu_physical_memory_rw() method is no more used,
remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/devel/loads-stores.rst            |  4 +---
 scripts/coccinelle/exec_rw_const.cocci | 10 ----------
 include/exec/cpu-common.h              |  2 --
 system/physmem.c                       |  7 -------
 4 files changed, 1 insertion(+), 22 deletions(-)

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
index 35ab79e6d74..4c02c94e04e 100644
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
@@ -81,9 +74,6 @@ type T;
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
index 51abc4cae96..000bde90c2e 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -3182,13 +3182,6 @@ MemTxResult address_space_set(AddressSpace *as, hwaddr addr,
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
     address_space_read(&address_space_memory, addr,
-- 
2.51.0


