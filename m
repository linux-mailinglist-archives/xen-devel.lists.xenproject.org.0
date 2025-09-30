Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE35BABFE6
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 10:22:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133853.1471938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Vcb-0001AA-KU; Tue, 30 Sep 2025 08:22:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133853.1471938; Tue, 30 Sep 2025 08:22:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Vcb-000171-FP; Tue, 30 Sep 2025 08:22:05 +0000
Received: by outflank-mailman (input) for mailman id 1133853;
 Tue, 30 Sep 2025 08:22:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3VcZ-0007Nm-OK
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 08:22:03 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a696d84-9dd6-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 10:22:02 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3f0ae439b56so3302790f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 01:22:02 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fac4a5e41sm22972926f8f.0.2025.09.30.01.22.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 30 Sep 2025 01:22:01 -0700 (PDT)
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
X-Inumbo-ID: 8a696d84-9dd6-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759220521; x=1759825321; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlQqoXg6at6m3NCWUmLz6YxBYJSCTlYqTL2bdBtbhz0=;
        b=aCqALJArECxjIi6VpSWLtjAGn5iXR3I1ZRNnK1fFpf4L45np3+8XqigkkzuUHn3hW0
         zA8J9tOT+IHFBf8DN9ynl5hjEaYTypeu7lywEKt+vqH+/HnTfloKIa2oLa+3nfH2qPbB
         ynL5Ejl7A/sfvAWbFWimwzqwBkEfq7XzMp9WVUdZzwHGgebT8MzqS8EK6xpAsFvb5bBz
         elGwurk2TQOvsnMGhCFJVPgJSTvWsyS7+ABbCV9lCxA83oLvf85+EbGJPCfdBqjCz5Tw
         Y1gulr6LmnctvlTOkAY5XvyBxt4f0mFZPIy9PKMM6O32Q+BtWXsqFzrgKNSU52QoepU3
         33bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759220521; x=1759825321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlQqoXg6at6m3NCWUmLz6YxBYJSCTlYqTL2bdBtbhz0=;
        b=JX+1vkdiYpbHAcYpTr9XxetBjG/h9Ftoci3IXN3PABs263H1iOBpWlP9VlQ8xk/EBy
         lpofyhzb3tNGueeeL1k6K5e8rj9/tX0MqpKgsBNjqfciQ9WtzY0XgDngUSdojiOa2hlL
         rE4azQxYXLVTMSgMCTF9q9LAqqOnVud4r5ICcyhAKkF6MEAq0YVO9OgwkU5T4jXz5eJz
         MI4UnrUfIfk2qrdRHf6A4VGj+gDPlNXNW07XI01SRPTWvSAIV2yLwdi5CbnhATrN480Q
         4wHwJMPQy4Z/i2huxMyl1Yhmx7KIyZz+wx+FrV1g3bTyygvSv+nRe6IGIAYRXbbf+kwt
         IY/A==
X-Forwarded-Encrypted: i=1; AJvYcCWGCDgmZ5XzgRYzmvdrJNypjS1awIOJon68Ary30c4+EpCFwqXuiPi0JSmz912HEkO+u96vTg8bho0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxl+Xu7+K05/5Egxq2Ut+0J7WHl9ZzaCtu2jNv+wUCtFU8x+1mP
	7soNy80xuLrYU9Fn9kMe8Vku8XBfsIuEw3iHxh7bUokb5qMip3d6nDgyNbk22U5hBr0=
X-Gm-Gg: ASbGncvSc5AkQqtWNdvYprZarT4PWP2qp/OZXOfomd1aMIFysQVJNqT+moiAinqVfJG
	e++i48BwVUK+n6go5C73r69rxKOXnTC6eyi81Wk/gS0IdzkHvdnmUMEigbjn3FM9rd0jQe8xE1j
	o8+H1PCP2/3z5a2OYASTe3TDMWrZUzlyTM9rsJygpY8XcWGLd0ZSh1U375f3CPxN8hh5faoSE/U
	/uTK/sJo45+tWhM55NmI1/FDCJXtOvcgbp3WJ7GqVVfRjBC6aurdyl6pHnu0q7DeiXABbQo4a5/
	yKGz0AnWwaKMw29otjRhY+LkkbnxfWA0jZxIY+xj1aZFJswIXnIO/WPUU7OyOT4cSS6+Hw8TWlM
	SxYk2qFQnprXA1u3p7+/q08jD4eU3cv/2mBE67PrIikThWD2CPL7G2lTK2lDztADp/twrlLmui3
	EIRHTguzGXZurpBcKFE+9A8V1MhDmJ72Y=
X-Google-Smtp-Source: AGHT+IGxp9mmy7B4YaVXtK8axEEppjEFlOJUhOlUxG1XXBFZ2PBviuJyAi3OzbI29QHLpWomSM6JGg==
X-Received: by 2002:a05:6000:22c2:b0:3e7:ff32:1ab with SMTP id ffacd0b85a97d-40e4b294f33mr14571301f8f.50.1759220521460;
        Tue, 30 Sep 2025 01:22:01 -0700 (PDT)
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
Subject: [PATCH v3 06/18] system/physmem: Remove cpu_physical_memory_is_io()
Date: Tue, 30 Sep 2025 10:21:13 +0200
Message-ID: <20250930082126.28618-7-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930082126.28618-1-philmd@linaro.org>
References: <20250930082126.28618-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are no more uses of the legacy cpu_physical_memory_is_io()
method. Remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-common.h | 2 --
 system/physmem.c          | 5 -----
 2 files changed, 7 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index e413d8b3079..a73463a7038 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -149,8 +149,6 @@ void *cpu_physical_memory_map(hwaddr addr,
 void cpu_physical_memory_unmap(void *buffer, hwaddr len,
                                bool is_write, hwaddr access_len);
 
-bool cpu_physical_memory_is_io(hwaddr phys_addr);
-
 /* Coalesced MMIO regions are areas where write operations can be reordered.
  * This usually implies that write operations are side-effect free.  This allows
  * batching which can make a major impact on performance when using
diff --git a/system/physmem.c b/system/physmem.c
index 84d7754ccab..dff8bd5bab7 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -3764,11 +3764,6 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
     return 0;
 }
 
-bool cpu_physical_memory_is_io(hwaddr phys_addr)
-{
-    return address_space_is_io(&address_space_memory, phys_addr);
-}
-
 int qemu_ram_foreach_block(RAMBlockIterFunc func, void *opaque)
 {
     RAMBlock *block;
-- 
2.51.0


