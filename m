Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6A2BB3497
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 10:46:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135482.1472660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Ex5-0006HL-0J; Thu, 02 Oct 2025 08:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135482.1472660; Thu, 02 Oct 2025 08:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Ex4-0006Bx-PQ; Thu, 02 Oct 2025 08:46:14 +0000
Received: by outflank-mailman (input) for mailman id 1135482;
 Thu, 02 Oct 2025 08:46:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9sj0=4L=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v4Etr-00006C-Jy
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 08:42:55 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9522fc4-9f6b-11f0-9809-7dc792cee155;
 Thu, 02 Oct 2025 10:42:53 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3f0ae439b56so420629f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Oct 2025 01:42:53 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f4ccesm2549112f8f.59.2025.10.02.01.42.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Oct 2025 01:42:52 -0700 (PDT)
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
X-Inumbo-ID: c9522fc4-9f6b-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759394573; x=1759999373; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2a+b3m6nNjsik0uExia3oDVD3UfHkSBuHgsktxpBbI=;
        b=xDibLJZyekyTWOWocExJygtlGqR56x29PmYu4aaPkDstiv1NmLeh/Sf8Xbw83HuAZN
         evyJXBvZ8SE2FN9t3wkV4yJZpRFsstzVCD3TtvVt6F/IviE2zrhJ8gDjDssvJitKh0gJ
         28F/d84tJ82WcNxQ/fpy2DJi3gONz5vJBSMBumLnHjeQC/SEORYSrEqgirmDe5Ghqx4Q
         XF3hLsQEKlHPglGbR1zZX7VpMb3u9mlCBrn5hh5/iNrnAu6W4gkxDUchkqizHmoepT+k
         l+btBznonJ7TVQLc0zTsxE6B23Rp+MgwaquDf8TbtyqE/2uqYkYxuIr9Qduhol6j5lJN
         MIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759394573; x=1759999373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2a+b3m6nNjsik0uExia3oDVD3UfHkSBuHgsktxpBbI=;
        b=csEn6QOGyGeLuxyKuFioxDBdJkmrKfqWSZo9DlAdCoN1maw7rl/CEASylsqJqHuf+N
         JVe6/0cGEXp4M2/X+p6fsgiD8IiBOSpNQTl/Xp/NNnp60KdbS4f3Nkpi13+4pLBrrscM
         kH/N+Zn/XaPQRp+5Ni2EpYM/4dSUU+XElY03XpgdBgInjRoC081l88RWO18nBEgtnGbU
         gXN6ElTfGDdS1NAwYy7IMuUozhXI549OhT6ZdA4GCunRIsi6lOCfzpSCymYBtiA3c4EF
         +jLR0gQ/tvKtDWK3RSUse/4ru0sHljSACL+vTm8/rug5ffM+uPegM3rwrL0YAN/DnUcz
         Sw3g==
X-Forwarded-Encrypted: i=1; AJvYcCXSmRdw2h5hN7qWH7rxsqgCgz38xmUYomvDC07Cyq+LvWLDvjGN522FIH0L8DrNjOWY28faihkpbqE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9M6HcU0cV5sy/KovJ7alP+WxasFfZgxTPlNwP33/1WQfF1ood
	mcsuXnWxgvIWx48aU62EAOrjynyfiiSOVp8+jPv8oZrzjR+kaZAgX3+hV+EKwAgNa2g=
X-Gm-Gg: ASbGncvWS3JtdH8EjjBO3vpZWoOFkGgELV3IDLyopiE59GaFWagcAwZP4daC+VfjfSF
	ILeE4ydTWNZoeAyOdGWrrO70oerdOpjzpaNfTK8N+MRI/0Q0oWSXjpE1LIpWHZzGp1p0kZHinYw
	zj3wfpLHRsYXzXCNWO2lYYbku/E3m6Njip972O1nrmYnZqrSW4Cy4amBWA6GT5XEWswzJlfW+fl
	1Lm2EA4kx6kq5zYKJ3C+Bih9sOTa6b8W2mieSzDv2q6Q3TkXu2WZy9BJCWOzBR8MUcsueYhKRIu
	7imtiL37F1rNQhyutq9fzRIwvCr45ePcz7i/v9zQFMrCT3jlTsJIAuRXqewUaA4Vixg8O8Tr3jm
	MDGJ1oG1uckECXC0tGExIajUib4jCxMTFc/TqjclzyC5teRB/B4wja8WI22OUuqD0dMUbZhs7Ec
	+S+d0OKPm/1S4yvLA5DKbk/MMJdOeRUg==
X-Google-Smtp-Source: AGHT+IESawsv8TF9fv7ok0vuTUFPZED2UOH0cc0J9xvSMsVxP3h1RuI1snQ8dRbG23dqFBECTN2WSg==
X-Received: by 2002:a05:6000:288a:b0:3fb:ddb3:f121 with SMTP id ffacd0b85a97d-425578191afmr4750845f8f.45.1759394573033;
        Thu, 02 Oct 2025 01:42:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>
Subject: [PATCH v4 10/17] target/i386/kvm: Replace legacy cpu_physical_memory_rw() call
Date: Thu,  2 Oct 2025 10:41:55 +0200
Message-ID: <20251002084203.63899-11-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002084203.63899-1-philmd@linaro.org>
References: <20251002084203.63899-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Get the vCPU address space and convert the legacy
cpu_physical_memory_rw() by address_space_rw().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


