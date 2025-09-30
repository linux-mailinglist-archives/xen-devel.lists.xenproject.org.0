Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DB7BAB4F9
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 06:16:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133490.1471611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3RmW-0001tT-7B; Tue, 30 Sep 2025 04:16:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133490.1471611; Tue, 30 Sep 2025 04:16:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3RmW-0001sF-30; Tue, 30 Sep 2025 04:16:04 +0000
Received: by outflank-mailman (input) for mailman id 1133490;
 Tue, 30 Sep 2025 04:16:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3RlH-0006tq-Lv
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 04:14:47 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 004b39ac-9db4-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 06:14:47 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46e2562e8cbso41430165e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 21:14:47 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2a9ac5basm284686015e9.7.2025.09.29.21.14.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 21:14:46 -0700 (PDT)
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
X-Inumbo-ID: 004b39ac-9db4-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759205687; x=1759810487; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9bErLRqv9kjbdzs2kwz9FzL8C8SAPMQ12Esuz3D9Fo=;
        b=SvzTjNGjToxYRmnX1XsGif8m5i+Rmippesloev6S3qUHzuPYLC6f649MhBanCuGbfH
         Q73cAHfOEE5BQ23PdenGtwqMJal1FPU5mhq4As7PyAHpsN9rgIDwXJdR0TALVgoO5ET6
         E2rt14cPlZTrECszG9vPzdUXnH096zUTYTpkeUgoJSZScP62DIUCKVbUoz9YrtwWsuaR
         lY1G+vZm4+Uoecf4o6TN1qU5rOud4Sor0NrJDdHxwgWdnKYwJVbYvmWFJkRgdDHe6dwf
         1mEtJuEeGEwkTSxkGTcOyGyexlv8hDP1aH0VE5r5aQ5eJV4X3JMFoRI66vQA389RI0nQ
         23CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759205687; x=1759810487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9bErLRqv9kjbdzs2kwz9FzL8C8SAPMQ12Esuz3D9Fo=;
        b=CLre+0tXs3pO2MuCbC4EVyt+0ptnP7JKhGfREaCjwcIzt6k/rFsHjl8F/MiKDW1gYP
         WYDEXGPK4r7FM8uR+GdAYI4iVQoh57+r2GEHeZfU5L1JXw6salE4ZaCk95HL7KmVg1h0
         12N95K+8viqb5Ltp3T8YHnXYQEI4KuG8Dm611qhLZiOZTDtb3PNInUZ4n8WnCpE2Z+6B
         gXJBfrWeNT58o/+vYIVpSQ0bgnyoZZb8ObhtMIphtow2P9HEM7TWOs7Z48qkdFOUe0nR
         ZGbWwdTDzaAuA9xZzwA/DeiHZVsQ++H58VckoF5Yged/pE9NafrT/8HOzuQiHKjfHYjW
         IocA==
X-Forwarded-Encrypted: i=1; AJvYcCW72ITtAXA00UEM8EIlWc9H0elMfPRYEZLWne/QDaokQVA0hXyln4/2pQ+A1jrUOfDAdMTyfV0aQ7o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3sDk8ZrB6yeFxjnwVhcJfNA+9CRXSXyIFY/i0qRRmU8ST633J
	i7i5LPJmW+rP45Fkh+e+T0r27DtgIABn8Kk7Eiw1M59q0Pb+qkGa9+dbwVMZV8tWw88=
X-Gm-Gg: ASbGncuRvWFg0QuymycVS3rXDRsXf7BRquW4uISIoCjwcDtOzlpMyAUEigzC8d1Kd/L
	7U1PjQrMgyLp4Xge9Xt2UxnOIeZHuxV4I5SXnPGryHEsfgaKS9C2v53CzgLjMjnvyqN93AnFsTH
	I14bxB50QEgNV+2HYatvWeytqSLZjJVVJjZCyOEDNaMVonb603mOadjtUeDBPUOw2HejkGRyCYr
	KLc12ZsKz2oZ+IXfFNsfWhNFY/pwaIFjVljzWA2IEo5SPHK9DQOGiYdoCjN7gTDq4pFoYhX78M1
	U5YMxCidV1pd5Rt3th75m/89mRgXOXb4EgjzRgFNqnHWg3i3xGnTyQfca4fBZTZrP/TQQBwelyH
	qoDLRX/ZbWq38knEmjKQwwAb3sTbF8VY7r/d0jA0Mc0SUbFH7ndrFV5WCLGjtIwx57+MoyJBhqM
	VMWgfMul+jNvcY3jhEjXvx
X-Google-Smtp-Source: AGHT+IGyKmmQIMqQURGJv7gP62rq5JnP7SAE6q2ubqy946YRUlo5uVTz66eDWtBwE0h2GgBG2/uY2w==
X-Received: by 2002:a05:600c:4e43:b0:46e:3f6f:a8ee with SMTP id 5b1f17b1804b1-46e3f6faa76mr119745615e9.13.1759205686721;
        Mon, 29 Sep 2025 21:14:46 -0700 (PDT)
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
Subject: [PATCH v2 13/17] hw/xen/hvm: Inline cpu_physical_memory_rw() in rw_phys_req_item()
Date: Tue, 30 Sep 2025 06:13:21 +0200
Message-ID: <20250930041326.6448-14-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930041326.6448-1-philmd@linaro.org>
References: <20250930041326.6448-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cpu_physical_memory_rw() is legacy, replace by address_space_rw().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/xen/xen-hvm-common.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 78e0bc8f644..52e2cce397a 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -12,6 +12,7 @@
 #include "hw/xen/xen-bus.h"
 #include "hw/boards.h"
 #include "hw/xen/arch_hvm.h"
+#include "system/memory.h"
 #include "system/runstate.h"
 #include "system/system.h"
 #include "system/xen.h"
@@ -279,8 +280,8 @@ static void do_outp(uint32_t addr,
  * memory, as part of the implementation of an ioreq.
  *
  * Equivalent to
- *   cpu_physical_memory_rw(addr + (req->df ? -1 : +1) * req->size * i,
- *                          val, req->size, 0/1)
+ *   address_space_rw(as, addr + (req->df ? -1 : +1) * req->size * i,
+ *                    attrs, val, req->size, 0/1)
  * except without the integer overflow problems.
  */
 static void rw_phys_req_item(hwaddr addr,
@@ -295,7 +296,8 @@ static void rw_phys_req_item(hwaddr addr,
     } else {
         addr += offset;
     }
-    cpu_physical_memory_rw(addr, val, req->size, rw);
+    address_space_rw(&address_space_memory, addr, MEMTXATTRS_UNSPECIFIED,
+                     val, req->size, rw);
 }
 
 static inline void read_phys_req_item(hwaddr addr,
-- 
2.51.0


