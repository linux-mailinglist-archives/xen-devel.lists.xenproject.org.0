Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95846BAB4BA
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 06:14:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133460.1471600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Rkc-0000Uh-T7; Tue, 30 Sep 2025 04:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133460.1471600; Tue, 30 Sep 2025 04:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Rkc-0000Rz-OT; Tue, 30 Sep 2025 04:14:06 +0000
Received: by outflank-mailman (input) for mailman id 1133460;
 Tue, 30 Sep 2025 04:14:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Rkb-0006gD-AN
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 04:14:05 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e638c73c-9db3-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 06:14:03 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-46e2e363118so52025545e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 21:14:03 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc6cf3835sm20954191f8f.46.2025.09.29.21.14.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 21:14:01 -0700 (PDT)
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
X-Inumbo-ID: e638c73c-9db3-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759205643; x=1759810443; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJHuzj8i65yKq7/CrLnIUXqdpZj8DIZ6OJzdCMb/6CI=;
        b=NgSRl0JJURpI02GiMygQU/1oYHxfu4MuU5AaAdfcfOb51gVpkYej74DwRgjlygjoyh
         nu5ccUqc6sKCsNhQdAHkqcmyLiVghEhcI7RJwDLBWsoMAGEt4H7JMLmLnVEs8nAfgSm6
         vjLOW3GWEJHaQLeBiB7vaXg9TwwqFDwLrLJzDOzPvJOfQYASBKOQx1SSy3YahPBby4yJ
         pZEPM4pOCeTsGx+gksflyCBsPOBSC0+OAfNbIn6GMak8NmTUBptWxl4QAFcg3ozjjT9V
         L0XP9X9djr9gVmz1QCXu2Hr7eiYapKRKO7MPuk5aV8trmnYD2LK+2ykRW0phQbXJHy08
         Bx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759205643; x=1759810443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GJHuzj8i65yKq7/CrLnIUXqdpZj8DIZ6OJzdCMb/6CI=;
        b=mjH3AVPmDzWq05RS0cVbaptBwZNxYob8Y/N7F3KoJPf/x5H3Pfq3vEMR/Koix5UAQR
         LFOyy3lmQSUDpCZkn0utcwojJUXKef3bqkVO1//dvAP5xc8CxpGVI0KHiGsroNUzzhoW
         j6oyP2A0TIpznT4PjSAPBjpBF9oXwJLQKs/bhJkf5acX3JjQXJ7RT4uNR4XnJvldQoJb
         E1RerPIV+iVsZlJIrkJooq04OmwG9nOECygKvl3rknu+ZK+Ib5WyUrrtsYDqaDVwbGka
         Pu0ZeGFhbr49qUPYPnsPXn96i7Y+ETn4wciGFuE6zh2+uhNcAMZqCVwVwuusKFzLkn1B
         JZvg==
X-Forwarded-Encrypted: i=1; AJvYcCWd74C/FrkDJtFjJT9DgVFfaevS3We31qw6bKVbp93zSI7Q5fBoKsMZ4lkaDoen9GQC6zc9rWz49Pk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEscXEb9uwFRCzns7MAe8pPxn2nyzi7QIx/4ktI9DYvYDgZjrW
	0VN5uMGL3Pw4HBVTOuiqztRWXOvf6pAPeKe6AQGqIAl53QRO+m/1tEsJYEBirJ6zxGg=
X-Gm-Gg: ASbGncvcpG5XTzatR+ItKTI1B9HReDG+MFScqHhcT9Ub9hNIh9zfC+s1qg6cGF/K2jH
	C4iYGQggB2IJVPNnakKBple5hyi6HKi7XPDWGRND6kxTSfuOhAS7zVsHCGw3c7hcBaBEpyp/ZId
	0+2kF3CukrkLPIlNxS+oGPAD7YF2hIyXssPSXo94XMoN8FmBJpwoBEchcTRNfedg1y0W9Zp38Ui
	Yn+khahYwvda/fHAsmkAqRsktWZciNS1QKywmM8iKZzLNQMG6cSiC8G4iSId9JAPpiqWOysAeqC
	VDM5uD2Ii9AJdbHgqOj9sPW001fciuk80mDv0JqmTa/qqOWJX7htq28EPbs6FVNaX1yAK7i3e4H
	fRLird6ycOMs8+gYdLTzYkUsxRL+r1r3178l3Dcz4+Hiydal8QjCByt52ZKeeuLBRJ/DdpVhw2U
	vje9h71j6oblT16170I2fEY0P5F7F72D0=
X-Google-Smtp-Source: AGHT+IFzoydC/PtH1+zccfqdIbgaSIsqjwZE3Y6j7iXWudBl2KZiSFlGWhLtg5m0yJ4ctRkRXODKlQ==
X-Received: by 2002:a5d:588c:0:b0:3f9:fd59:7a5f with SMTP id ffacd0b85a97d-40e4a05bf52mr18187688f8f.33.1759205643111;
        Mon, 29 Sep 2025 21:14:03 -0700 (PDT)
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
Subject: [PATCH v2 06/17] system/physmem: Remove cpu_physical_memory_is_io()
Date: Tue, 30 Sep 2025 06:13:14 +0200
Message-ID: <20250930041326.6448-7-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930041326.6448-1-philmd@linaro.org>
References: <20250930041326.6448-1-philmd@linaro.org>
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
index be8e66dfe02..573e5bb1adc 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -3763,11 +3763,6 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
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


