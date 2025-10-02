Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DA4BB33CB
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 10:42:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135414.1472561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Etb-0001lA-MD; Thu, 02 Oct 2025 08:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135414.1472561; Thu, 02 Oct 2025 08:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Etb-0001gw-IE; Thu, 02 Oct 2025 08:42:39 +0000
Received: by outflank-mailman (input) for mailman id 1135414;
 Thu, 02 Oct 2025 08:42:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9sj0=4L=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v4Eta-00006C-4U
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 08:42:38 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bac68477-9f6b-11f0-9809-7dc792cee155;
 Thu, 02 Oct 2025 10:42:29 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-46e42deffa8so7640465e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Oct 2025 01:42:29 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e6917a73csm25459055e9.2.2025.10.02.01.42.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Oct 2025 01:42:28 -0700 (PDT)
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
X-Inumbo-ID: bac68477-9f6b-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759394549; x=1759999349; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpGUqjX5M0j82QXVYXw9oJFFwSK+I6Ya0azNIIXD0n4=;
        b=hgfPwNutior5kyVPDm+mroxuFc9q0bWflim/zloKmtn3DOy+nAALa08rj3eoVNob81
         qi+n9NPMCO5f7MjD7aWt2d/cNaPBJ3uY+uGUJ4g/3PUDIVJzB38oLQwnRCgA0YmC4jOe
         7THba++Mku7mU/hr6HTHbOHgeGTZflt6AV8zS8iUBnpjh+UjBNcglMiGSV5wIHuTtK8l
         c+dZuvj8j6FB97W5cVfoWau74WLquy1NRDlVrvauBTlv8vY0PrXWojgpkrCXjg2sCFTX
         RMHFo+lhVFU2IIb2KDMFG1ODe7cz2EBUZ1qhoLzf1I6mFavoTgB+7OJaR52nyk5trc5s
         3ZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759394549; x=1759999349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SpGUqjX5M0j82QXVYXw9oJFFwSK+I6Ya0azNIIXD0n4=;
        b=vG3h49RbU8zuBX0s8BPQ04ZG33/PO4j/5dC14YB1zK1p9xv+4SNoYBLL2v+al4KzjW
         AlmG7X3UaaC37vQL3RUF8HWzSCpQzf9fo8qaINMBP7hawkE4wot+HfRtyWctqH/cmWpn
         MP+zRqLhEIORegi1X+Dp+nrByUPnrQ7K80CoCmuLXwnsOLMONDOWI6SnnPGeIz6svZ2/
         D47D6NF/358KPjt79sI0RtktENNbtff3Zf+YfkXxNlQdFoYJVtVSnPR/grZ4N206F+x9
         Y/FNOc8xktEqPGDwp2Hi1buP0Ryw5O1Ssz5/Zc6l+eCXjmSVv+so6sS6g0UJthnh+Ndq
         9f9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVzge1vTUIs/V80eDwhDp5zWCtv7rYwxv6o1QV7bMp2ZANwNa8pm2du2jBNAPbkPiERPUXLdq65d1M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzX17RVjpFFUArgZSBzKOPl0SnJ+uvPCMRgq999j/79JyzGPw1K
	rU+pEcIqqpnWxD2udwzDcxJqZxuumyzZfMOHXqr514zop+qW7Lzxm54hH7uNqcwPj/I=
X-Gm-Gg: ASbGncu+a6A+y1JVrVWAUAQbI5MVoENV0bQhQmH7k8NTb85JcI7XCl0UqYXJj9unE4o
	H1UE6A9roHqhnhA8PGBdLlgQ+n5q9F/mJhPEqT35/nq3BZNYzbh9P/qhmxz+Cy5fUxnHAAOfJyz
	3hrdi+RCytAfcZVQm05Z/iICn49sHNvG9rXMP+k0Sx8SEpAG3xIxE1autoKmrOuXaplu5BzYeEy
	Gry7UkV1SnGoRgT57flhlNZnpP3IA2yVazvlWdJA8lcy6hKr1pCn6ywY/ePm+OmTpFZoK+J2Nsl
	RxME9hZQYVMujn8uQ9fQcEOO7Isr01lig6u11WV13/ITHiFATF7/Dnq1gxcwrYuysS25t75X4kU
	MhJlP+KQrWF8+Vsy6HKMGkV5fNhYRJnBCKArbMABuccTU21JpKw2zE5PRJwqwFhw2ud5UpBGDQs
	NY5MEy0O9uiXoXQ5XHiPBFNmKOwGy9yg==
X-Google-Smtp-Source: AGHT+IHnMMvrULFyoGLvyWEYNdN7opPAO0EOueQAPseRRuabHvxN0jtL5dWb3pgTDAuMakOX0VTtNw==
X-Received: by 2002:a5d:588f:0:b0:3e2:4a3e:d3e5 with SMTP id ffacd0b85a97d-425577f362dmr4449090f8f.22.1759394548791;
        Thu, 02 Oct 2025 01:42:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v4 05/17] system/physmem: Remove cpu_physical_memory_is_io()
Date: Thu,  2 Oct 2025 10:41:50 +0200
Message-ID: <20251002084203.63899-6-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002084203.63899-1-philmd@linaro.org>
References: <20251002084203.63899-1-philmd@linaro.org>
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
index c2829ab407a..4745aaacd8f 100644
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


