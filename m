Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99857BAA56F
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 20:36:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133200.1471402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IjP-0006SP-8g; Mon, 29 Sep 2025 18:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133200.1471402; Mon, 29 Sep 2025 18:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IjP-0006Ng-3V; Mon, 29 Sep 2025 18:36:15 +0000
Received: by outflank-mailman (input) for mailman id 1133200;
 Mon, 29 Sep 2025 18:36:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BPw2=4I=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Ih7-0001U2-9k
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 18:33:53 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d904bbf2-9d62-11f0-9d14-b5c5bf9af7f9;
 Mon, 29 Sep 2025 20:33:52 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46e326e4e99so26057545e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 11:33:52 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e59af1975sm3031215e9.3.2025.09.29.11.33.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 11:33:51 -0700 (PDT)
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
X-Inumbo-ID: d904bbf2-9d62-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759170832; x=1759775632; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtU1C0M8U0OTbHcI2E95ZD2Zrsmz5/OESKETD6NudSM=;
        b=nNTJeVA4KhFLgMwncIWleSYFYtyXR/SZ4APubPoFRihPFYCWhgXGDJ9n1IIXqm9qDu
         WaLmaIScVm/fF/4/CVo0Ukiggcm1Mc1dMlI5J3beWMD9BdVgrC/FecxZ8xhEp9TTH/Mp
         tkhA0jTHjRnY4SpFubFhSpIoY897b+kEHRotFNct5I/gvMyiAlcEdEUIiSlBvucdKst4
         Rn2Ux82WoEr3yAlia4Vgb4LgdSSEHZgPLGT4wjiwn7e7PAf/4xUCYIWbn/nPu153FDi2
         3vRWyNpE+OL3XOfgQXb+oSwucV01Asl7k6vGvuOs2+LyJTXBTC9csYdugqU4eYWtGEFi
         iTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759170832; x=1759775632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QtU1C0M8U0OTbHcI2E95ZD2Zrsmz5/OESKETD6NudSM=;
        b=GOorQGZO4Dp5ieemCOuM2Q9tTX0YWPVG3rIdtA7UGty4k8t2jPS5foTG791/ixmlEm
         eDzaYJDkOgO3z+lPH2zZpO5Ohx4890OAObsc3f4Hx5hmd80fhp43y8vX/gciwNrTYAz3
         kkg4PHbZ3Ix37PDUOLDgvCbZnnBFJgP6rzHddTxmjxxorM5IjCKwKO7w/mQneZ4zWciZ
         1ql6DpS9wMWfSShJm/4SrZB6/mgcauhpIH3VIevlg5fOi7LmDw3Oa57nz32yrlMzTmfG
         f5K6lCBLL1eWpM4yEzZyK5um/R+brzr4XaAuyhAL9b66ujZVM+8Fl44cRhpCuinLFnZD
         Ao3g==
X-Forwarded-Encrypted: i=1; AJvYcCXx3EgzGjYugW3NBeFjXt5MLd34oCsXu0Ga4YvYWV6fqfvMrcV68aw7GfbQv499y/Cll+USuKjBsJk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0iVp0v09rD/xa5I7KreLhIc4EFlbVAFDJi9Ypvrs3eDU+740Q
	grji2mAEdgyF80WmOjnqKsBqEyaam2spX7d5LlJUDn/VZa9pdutB7/Dtp25wNnjobvI=
X-Gm-Gg: ASbGncuJBIHELD4QmVm7m/W/XmhdrSezezA+Lh936emm7/7Ao6WgvOPppiOSWIYPKcc
	XxWt2Cdfrw0Uy0kE3+9o2pvSjYTHdwARr5u0CQkUws4uA3tZG97l4ZdUJdyW1yoT3Ar1NmTWGLe
	jbpQY8N2QUIL4MYsT3Ljirw8mVPuNUcbIzKO8Uh42PGcMtbULh55YCFKAK5X2l2k8Cz4gZ70hKv
	QmRZ38yDcycp81J38xA4B+05D8nYsxsmkQBqKPUbf2QF7qWVQudF2D3jI3FunoPzXJFYxA1fQxK
	WQhsLXuN0ehjEaii26gOx2a1nHkkdIY+RxlRT/psglEgivoC5fUlMg5NBX2Mnnl0PcLRdvxPouy
	Jcd29bOLro1FG0z+gRnXDqKZhilduYIuhiD8ZnArmPTxJ6FFrzw03nXj6Q4smco2my+t2VHPV
X-Google-Smtp-Source: AGHT+IGjnZG6/qjEBZy5PcjHjXj9r7KBUUors89ckyudEmcNpuheEZ9krTQTynjT1eMge8vskVxhUA==
X-Received: by 2002:a5d:5f83:0:b0:3ea:fb3d:c4d1 with SMTP id ffacd0b85a97d-4241111f6d1mr1595433f8f.18.1759170831738;
        Mon, 29 Sep 2025 11:33:51 -0700 (PDT)
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
Subject: [PATCH 10/15] target/i386/nvmm: Inline cpu_physical_memory_rw() in nvmm_mem_callback
Date: Mon, 29 Sep 2025 20:32:49 +0200
Message-ID: <20250929183254.85478-11-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929183254.85478-1-philmd@linaro.org>
References: <20250929183254.85478-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/nvmm/nvmm-all.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index ed424251673..2e442baf4b7 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -15,6 +15,7 @@
 #include "accel/accel-ops.h"
 #include "system/nvmm.h"
 #include "system/cpus.h"
+#include "system/memory.h"
 #include "system/runstate.h"
 #include "qemu/main-loop.h"
 #include "qemu/error-report.h"
@@ -516,7 +517,9 @@ nvmm_io_callback(struct nvmm_io *io)
 static void
 nvmm_mem_callback(struct nvmm_mem *mem)
 {
-    cpu_physical_memory_rw(mem->gpa, mem->data, mem->size, mem->write);
+    /* TODO: Get CPUState via mem->vcpu? */
+    address_space_rw(&address_space_memory, mem->gpa, MEMTXATTRS_UNSPECIFIED,
+                     mem->data, mem->size, mem->write);
 
     /* Needed, otherwise infinite loop. */
     current_cpu->vcpu_dirty = false;
-- 
2.51.0


