Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E905BAA55A
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 20:36:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133183.1471377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IjG-0005T1-HH; Mon, 29 Sep 2025 18:36:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133183.1471377; Mon, 29 Sep 2025 18:36:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IjG-0005Pi-An; Mon, 29 Sep 2025 18:36:06 +0000
Received: by outflank-mailman (input) for mailman id 1133183;
 Mon, 29 Sep 2025 18:36:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BPw2=4I=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3IhC-0001U2-6k
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 18:33:58 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc36c137-9d62-11f0-9d14-b5c5bf9af7f9;
 Mon, 29 Sep 2025 20:33:57 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-46e384dfde0so51429035e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 11:33:57 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb9e1bd14sm20127006f8f.28.2025.09.29.11.33.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 11:33:56 -0700 (PDT)
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
X-Inumbo-ID: dc36c137-9d62-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759170837; x=1759775637; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9bErLRqv9kjbdzs2kwz9FzL8C8SAPMQ12Esuz3D9Fo=;
        b=gnvR+fdIZooHKgj7wLHK+6Bi6IpBiDx3+6WxyqhRU0GrezC5Z3bk8R07XrqirNWSMs
         LC5IpCxvMh23eSoM3py0Bd52Hz/d6cQjulxcVCvMZa6boTQZWaumgm8yV2Bj39qBVYIv
         +CmFRd17tTA3V11BpZXdvmEJNiGh4TKiQrBjuA0i/aOYP23NTookydPe36r4n4lOMzH/
         d8AMZxwmgi0PequktmEH9usP21D8S0VKOhWw7ns029OTAUbyJoFSDRYyBcXyt49uRsF3
         Zkd/+D+VuKiJZMnCuK4fn5A0Tgu71mVVxlmDDWmhpSKyxN2vubuFBPFC5TEMH7sgYMx1
         PxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759170837; x=1759775637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9bErLRqv9kjbdzs2kwz9FzL8C8SAPMQ12Esuz3D9Fo=;
        b=nL6QrLpUyt5hKVBWyTuMxBqcAZsV6QNm3/1PXnZ0saVhIO9e6pqM36JJL81nBkehOz
         Oq+F6XLykYI/N8fDu+mJMF5GBuEYQEnAVjFp0tSk3WXHUzlCgwbH253BVFhnjwPyZsPe
         mkT+R6GJphiM1MuLqSBDcvDm6YPRle3nTh4W2TgfeD00NXp40dLLnt2pPt7NwPrqk5//
         OwOiBOvj70F8Aey2rRWSHdyOXshvHGb7Jr7l/lTjBBcQjDvN7iEcoXoTYqDMj3VtxmY/
         bVTJPRyo1Wr/6zZWsavdJEP+fIL1qkSkldckaz0ld7fzXG8QvKi1M39iGwQPT+jOy7Cy
         681A==
X-Forwarded-Encrypted: i=1; AJvYcCXZZN60bgHwbVn2PCSY0pEdF/NHdJFySxG2eOwIJblQtS72mkgb3/zM2Rxp6+H5wK+dQa0yuyHdjhM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZnbTUhCcduYxXvNNrQrUAE3eGH8qP7KRZoacrsibvWvk5MvET
	q3lae2K7vBIBX5z7ZkfM3SJD78mvy3UlLNjf+INNuqienl59jZHHk8aNFLqXAjC/DMs=
X-Gm-Gg: ASbGncte2lY0gAqumM7a/ooewSp7FBZxf3lJ3T0bmDz2u9x7v+J8e3ia8QucdZqeMTu
	98qoLMjI8MJQe4tmLcX9uK5+Z/ZWhCdZY47zUAJtu9quHhw/lM1lfk4g8fBJ6jHNw47rykpJ5Fh
	/z9qGzUSi77TSUfLat/MP0qjYUxil/g+nF46QhDnb8DfhmS+0Q5eOmJIwlsznN7Znm2ltlEq3gP
	ufqdW7x3E3HUNUjo9R+RemJyE96tR6ZdlufswrEC8AP7/d/gtUwQChArnhwrQm9tW7mBsSB03xD
	VAuFaoemvBcyjRMV+u8SjORY8iKiHG8UVFbFBr6Opk3chSr1rB4NkbyJ4CSZvmIcSgJ57u4zIQs
	3cM+H0xDavFEFZmvembsfGLYnkmC6cgpJ/BnWEus1uENTKcPJ/y+a5tkUMa+uNJEd4GavT9DwMp
	zO2Z7J2BU=
X-Google-Smtp-Source: AGHT+IFV+pWpl9RpYQY3/vKNUQDjfsPx6DQqux2wn16tRZPr0u8FrK0pJwBF+V9pyB/rSvhEdc2qCg==
X-Received: by 2002:a05:600c:4b16:b0:46e:326e:4501 with SMTP id 5b1f17b1804b1-46e329ba996mr129660275e9.10.1759170837108;
        Mon, 29 Sep 2025 11:33:57 -0700 (PDT)
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
Subject: [PATCH 11/15] hw/xen/hvm: Inline cpu_physical_memory_rw() in rw_phys_req_item()
Date: Mon, 29 Sep 2025 20:32:50 +0200
Message-ID: <20250929183254.85478-12-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929183254.85478-1-philmd@linaro.org>
References: <20250929183254.85478-1-philmd@linaro.org>
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


