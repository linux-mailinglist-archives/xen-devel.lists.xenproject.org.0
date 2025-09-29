Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4D9BAA581
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 20:36:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133220.1471433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IjV-0007jw-R4; Mon, 29 Sep 2025 18:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133220.1471433; Mon, 29 Sep 2025 18:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IjV-0007f2-LD; Mon, 29 Sep 2025 18:36:21 +0000
Received: by outflank-mailman (input) for mailman id 1133220;
 Mon, 29 Sep 2025 18:36:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BPw2=4I=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Ih1-0001U2-95
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 18:33:47 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5b891ee-9d62-11f0-9d14-b5c5bf9af7f9;
 Mon, 29 Sep 2025 20:33:46 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-46e42deffa8so40586345e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 11:33:46 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab48c28sm234491505e9.18.2025.09.29.11.33.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 11:33:45 -0700 (PDT)
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
X-Inumbo-ID: d5b891ee-9d62-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759170826; x=1759775626; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onCfEhinWarPReSMP2g+nvBYz1NYywUR3fuXcFIYVYM=;
        b=T72BL611RshT3+AuRgAhGKtatD4dP8JlCUuT7U4KADuQ89zb45T3x6jgsSuTuLjnRB
         L6/OVBaAqR7BdycTxi4XhMzzwKSP5F0N5gMpqUXsA++PaDJujZGRqgeCMAHKuvjvmKfg
         u9fUleJfidSaUiVmaDBg+xIAGnr5f0yP5tSgQdoluWnuW4ABgruT7hPtBwEwlsea8cYn
         bYIvUSthyE3JzD/fAIbIj7G7mehg6qP1yX4NJdQz3q+2oHseIWEreQU6jcxfMqrnxrfq
         ojuw9hKG4MxlAEtyp9HStJAyRg9CNwvAB602DcNFek/Vka4ZRMi08nltGqV8No4LJyZw
         0geg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759170826; x=1759775626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onCfEhinWarPReSMP2g+nvBYz1NYywUR3fuXcFIYVYM=;
        b=viuT0hCRXbnPJcU2iOjMsLJhnQxerMB9sG+lqYowLqDTQD2Bv03JLZmKpYy6xY52i3
         Gn3fdkmjvrVnKGH94eVoMjKIJBaNX/qAf9H6QNXOE1VMNY2JYnXqyOEfuj1ep0LFKorj
         ldYAjXUms4f9MzR0ZT9vYBQvXs1kGlzQTjhOv2r+RozAqQffeYob9XCZ3/1ViYDZpUGL
         TCF//h2kjAJU8Fc++FAVCsgls8hVGGjO2JyCF9BAjpRp82vvmEC/8GhFzxwEvQrElCJW
         dp3fcQg0YdnCfo+6QgHWYKJ449dxo0pGHz4t/x69WRPX+xePeIKzdLyt0RaEDXbMXqhU
         Ib0A==
X-Forwarded-Encrypted: i=1; AJvYcCVY+p+XyDXLhYtFRqyfKM3fXewW441csFoKC6nWzVFqbhQnvLOko6m/F0CMJsVg9KLsX8O/oAp6tRc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyS7xUf3eMRjLAdTnU4Eo/Fx/INawMBF4xWY9Tn5ONZBXJ0dVr6
	B6lbpi83r1XT0r1ngNpsrfmdrVbT5WummpozxLXWG33frVfbMk158QSbegI9PSL+apY=
X-Gm-Gg: ASbGnctdglo6+f9gl9CiznW2YkiGVYe713xjkEeaYxQofqtUeU6ZB+rVBEnRE49Gey9
	enfB5zHGgWIfkGLBxbQKzTMKlQJBEmQN2idKy3kdIqGacbUwr1LEz030z/H0l3jJ1YZPTPUPQdS
	spt+wzWD3XNEKvt/NUXfJmRWB7h5ljBEefvxx3MwfbOoOsvGHg6dTeIdSRGsxm4zgDZNI4VMLaQ
	KUOpUXlDNgClD7vYStVlz8ZmUm1/+2OgIUq1k2hYiUhTx0P0owflOuFhQEyJonemoDt3MGW3jz/
	BtjSP5MxLq60JawzsQ0I1ABLQgBwlqhiyV99qSUplGOEVisIE+SbiDtO+2bKGpeQ2UKrT8/EkxY
	ueiArfuKQB6uD1HYuZ3bZ1CAdsIINkktaS0n2hf1LrBHNDzaGTPQKsE2kw3QPsS1fWrJqrGRb
X-Google-Smtp-Source: AGHT+IGY3Rr3VyTE3S7oem5ZxfcOaYJ6i/vEMLPbvgnpiGprZwacrZ9bUpREdcpvLgXehTAMtkJc6Q==
X-Received: by 2002:a05:600c:348f:b0:46e:447d:858e with SMTP id 5b1f17b1804b1-46e447d8828mr94281545e9.28.1759170826202;
        Mon, 29 Sep 2025 11:33:46 -0700 (PDT)
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
Subject: [PATCH 09/15] target/i386/kvm: Replace legacy cpu_physical_memory_rw() call
Date: Mon, 29 Sep 2025 20:32:48 +0200
Message-ID: <20250929183254.85478-10-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929183254.85478-1-philmd@linaro.org>
References: <20250929183254.85478-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Get the vCPU address space and convert the legacy
cpu_physical_memory_rw() by address_space_rw().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/kvm/xen-emu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 284c5ef6f68..52de0198343 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -21,6 +21,7 @@
 #include "system/address-spaces.h"
 #include "xen-emu.h"
 #include "trace.h"
+#include "system/memory.h"
 #include "system/runstate.h"
 
 #include "hw/pci/msi.h"
@@ -75,6 +76,7 @@ static bool kvm_gva_to_gpa(CPUState *cs, uint64_t gva, uint64_t *gpa,
 static int kvm_gva_rw(CPUState *cs, uint64_t gva, void *_buf, size_t sz,
                       bool is_write)
 {
+    AddressSpace *as = cpu_addressspace(cs, MEMTXATTRS_UNSPECIFIED);
     uint8_t *buf = (uint8_t *)_buf;
     uint64_t gpa;
     size_t len;
@@ -87,7 +89,7 @@ static int kvm_gva_rw(CPUState *cs, uint64_t gva, void *_buf, size_t sz,
             len = sz;
         }
 
-        cpu_physical_memory_rw(gpa, buf, len, is_write);
+        address_space_rw(as, gpa, MEMTXATTRS_UNSPECIFIED, buf, len, is_write);
 
         buf += len;
         sz -= len;
-- 
2.51.0


