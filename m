Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 139C9BAC073
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 10:26:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133930.1472036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Vgc-0005sY-8n; Tue, 30 Sep 2025 08:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133930.1472036; Tue, 30 Sep 2025 08:26:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Vgc-0005pc-1I; Tue, 30 Sep 2025 08:26:14 +0000
Received: by outflank-mailman (input) for mailman id 1133930;
 Tue, 30 Sep 2025 08:26:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3VdB-0007Nn-Kt
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 08:22:41 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1971d11-9dd6-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 10:22:40 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3ecde0be34eso3285326f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 01:22:40 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab4897bsm257449245e9.17.2025.09.30.01.22.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 30 Sep 2025 01:22:39 -0700 (PDT)
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
X-Inumbo-ID: a1971d11-9dd6-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759220560; x=1759825360; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9bErLRqv9kjbdzs2kwz9FzL8C8SAPMQ12Esuz3D9Fo=;
        b=EEHPjFd5YP/c1It0p0gAQmYOFqqn6Yici7VxcUYzqFhfKEn2b5XrzE952uEr8fk/lU
         wvznNQJcxYgiVbM/2nDu5jMyLmjuHxS20DA1JEy8/L02IWvmlSkmvrPrAFuGDt3F5W3B
         Pm6sYbmCg2GFNqIV6+Wy02uDGrEB/y8Vlq+LnUNhR6B7+ojbpPmYrbZbRSQDA/kKQHCz
         5vjrQy0xFhQJTihxk7Mh4cwVATDiGxLtEnp4k931QkmYEu0LkaGRn53oD5AeDa+k7XGu
         Qf3GD99p3oRVo56QI9GoU+humhq9yqcs8I3OUfHMRWY+88k1cpnj574MFdxDW5Ci0MNx
         EsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759220560; x=1759825360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9bErLRqv9kjbdzs2kwz9FzL8C8SAPMQ12Esuz3D9Fo=;
        b=f31LaguS1YrW957NZGHZ4s1BwYROyP7456b+xKif3Estb/rINHDzDV3BvohB0ifby1
         jfaf7iNcsEyskcvy+V9tLXtfld8T6RwB3PkMucDu7HJ2n4dCGfenAvgtaO2gBebrpcrs
         ZNQabtjTgRwa+DFSHuZwfPD71c0MFKKBoztxTI44RI6pUlqVnqi6gjDWEi6panPPJKpw
         Z55XqfxfvJzN+Cy0Tdn+6VnjHZOaKmL8D7SmrUTt1JPb5ghGu8LWH35r14fB3JPRqhYT
         tAnlOr13KeTU4llxhrBO4vwCAnPnOmCmmGYckT9ULVYxi1h+HbioJUWCBXEldUu2qKpa
         6Yxw==
X-Forwarded-Encrypted: i=1; AJvYcCXKT8hUgDoOySATjQT5V2VgE89UaB8tqDkb+rclN18Kd5AI6/AzJpDz4vxmtWaXNeXkaeyAZuNeI/A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxs2iCm8TZ0rzJ//eCgWl7u+JMivATe2ukEFuGas6EATe1XczI0
	ITIW+mpjoI2FzYaXrve4pEOuCpMFEi40HlRzXqFhAyzBfQBVu1GW65/6iCz+CbSdISQ=
X-Gm-Gg: ASbGncu1kOT6UbXMo6wZW8PjYSZQPJF7vc0xteJEf3x/a7cHVRJgDYbXi2l7nt8Ioe5
	eb1/b4V6zFNmO+Yfgd7MZmPWVEjRXqlO6Y08mxv9cgfO/viYf8ZIZP6vHmF+VOOM0SvLvP6nLp6
	xy0TxM5MFzgS9Sz/ad0qAAAXVNs138UW2Le8abTtoObs5N5oS5do5FhfQBSAK4tk8/gIUonERV5
	251Yrhep/6gEmhjTXWH9HSAqNl/ZFZS4goq/5AEAL1mXOIhVkUKmhnbnlR/wK749zQPbVpzHbL4
	coGy7scQjlnBvxsuU1Z+ImoYMWjsYTy7IFudNuvqekP+6agrSXglVhiPGPccjc5pXKXaDJKRHy6
	/hpmvSt4WQn3U1SVg/v2VqLSUHZekka/ctu0xHtGwUYajtjODLY2W6GgTbnmVWq3AhxGszubMw3
	ebOUa6WiqwfkmUMSt1NX1oZAzqUT+YuLc=
X-Google-Smtp-Source: AGHT+IFKquQgcsAUg0Wckpi3Q1uVvpKK2LWW0oi9N9Q9t0bhLrHk1BTizML0eTatl5XEnZE1L5+HFQ==
X-Received: by 2002:a05:6000:40c7:b0:407:d776:4434 with SMTP id ffacd0b85a97d-4241227789emr2953961f8f.30.1759220560163;
        Tue, 30 Sep 2025 01:22:40 -0700 (PDT)
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
Subject: [PATCH v3 13/18] hw/xen/hvm: Inline cpu_physical_memory_rw() in rw_phys_req_item()
Date: Tue, 30 Sep 2025 10:21:20 +0200
Message-ID: <20250930082126.28618-14-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930082126.28618-1-philmd@linaro.org>
References: <20250930082126.28618-1-philmd@linaro.org>
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


