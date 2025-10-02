Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D8FBB3488
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 10:46:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135467.1472611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Ewy-0004dq-6D; Thu, 02 Oct 2025 08:46:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135467.1472611; Thu, 02 Oct 2025 08:46:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Ewx-0004RX-V7; Thu, 02 Oct 2025 08:46:07 +0000
Received: by outflank-mailman (input) for mailman id 1135467;
 Thu, 02 Oct 2025 08:46:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9sj0=4L=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v4Etv-000821-7b
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 08:42:59 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc19fdd3-9f6b-11f0-9d14-b5c5bf9af7f9;
 Thu, 02 Oct 2025 10:42:58 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e37d6c21eso4996385e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Oct 2025 01:42:58 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e61a029a0sm71252835e9.13.2025.10.02.01.42.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Oct 2025 01:42:57 -0700 (PDT)
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
X-Inumbo-ID: cc19fdd3-9f6b-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759394578; x=1759999378; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W71XKN8BDb9kJ6RH2tt1PLzXlP9jppatkbhtyR1OYg0=;
        b=mEEwC0Ytg3RNjH8coCMIR2KbDTCy+Q/SbrY/VwbVNg+hiB/FgAsM6UhCa7gCu0kpqf
         O3rPz/DG/5N4/gtdG0IuQr7O8jjrr4b9vsdVjYVuOUYpHnaeLnZwrhD5FcmogPuVHRgT
         I5duiYkSKfEUb+rGEtELNypYw/WM6gBRFYhjOzkq1Pmt7/TiM7AwyR3SzCyQZucveltv
         PYnyh2OegafQMB5YYmB0O5r2P+B2I8VrwDMkzvBlCsIekTn6C2ejcHGOr4yyCShjGt16
         Zt6gnRyii6XFcUSkiWu+bbbTSxSqltnC9HBDt90xIlVN0YyvVw5fRuzRRW0+QdyVrAtL
         lICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759394578; x=1759999378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W71XKN8BDb9kJ6RH2tt1PLzXlP9jppatkbhtyR1OYg0=;
        b=iMuwJqw+8ExbGqQC+rS377521MtvSmx1QBLjDrKPUPeEK5GxCiyC3/0oBaynOkDnfx
         NZJZsjAiHiNcty0X4CvZ0QQMMpOIzHLkCOgaxr8lQdZneRdS0qo2YTk0KUv33bGDA2Tr
         qqk7MQBd2HjpTFukP729raLAnJJDTV9LzuU351gp10ZxssI0itt7U1DYEU08tggrGQH5
         7xgw8YzIeUqLFsGFuMKGVydajTsnLkb8BUAHJVq1B8bAwn2uBLPU4bjm6kil5YHB+9/z
         fk1kgEn7PaCnAENzZL7pdg7zfzEkc78Xffk3VZKD++8cNh7fTy1wQ5CRpDFYT0BMH2Fj
         TbLw==
X-Forwarded-Encrypted: i=1; AJvYcCWRpo45MCBWU/nH2mGH2U86WXuAErrFmQlh3U0keWwjsVy7y9i67ew6xm/Cty8uWv9E3XmBBKlO88o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyvsdoTmO99ekC2HP4uAPF0aw1QqFDIZMZ/RLLwDpzzyA2Bgi1M
	iaL/HUqioy5m4d66cgLecwXLxXImcJNqi/FiQGRWJoH+qQiIJwWZcjsDH7Ni4rQLHTs=
X-Gm-Gg: ASbGncsLnmN329QHuK9Q8asFEJdgo6tDJ0jySjZ1UO2rPLJGmmGqqt9xWniigRq2tVv
	DLak5d2tnUaOl0jUumL8BXVLQCOmUNZPMz2VQCeEuGoyO/eqCu+i0TPSxosR1zop2h8ltyWklEw
	AAqIhVBPJefL7u8LKsR3rAuF1Uxnr1330PPjkkoeAj2c+a0/jYjriTPVjZaCji+wBbzfwTz7cs8
	JjkgOeUpteCCl078STrf2UxQG4TjfA4hupWRKoUM76o3+NugLHeIrQCWWnHsqHjjEVdtPvUQamc
	vDjt5w6IA1ut2MDDVKmJkWvU9DE+vu7rSb9ykLIklynWGxniRfIb07B6Y1e0mHBcocS1DbMjw5n
	NBOqDDCVZg5RKTCHU0Btj7dCnjbuK/hXN1W5SFg3BhzgFQkaSkqTVmu5BXtT1pJcUQotdJJDQ7K
	fAi7LxJJQNYjTmR+UVngsd7L3ZTF32FQ==
X-Google-Smtp-Source: AGHT+IF+vQnTZyjnghBewujCyKQZ3vteqHFK+eM/Ja5h6DC+kmKBchs84xyaNt6pAje4wwu2ECUb3w==
X-Received: by 2002:a05:600c:37c4:b0:46e:3d41:5fed with SMTP id 5b1f17b1804b1-46e6127cf3cmr49323625e9.11.1759394577925;
        Thu, 02 Oct 2025 01:42:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Reinoud Zandijk <reinoud@netbsd.org>
Subject: [PATCH v4 11/17] target/i386/nvmm: Inline cpu_physical_memory_rw() in nvmm_mem_callback
Date: Thu,  2 Oct 2025 10:41:56 +0200
Message-ID: <20251002084203.63899-12-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002084203.63899-1-philmd@linaro.org>
References: <20251002084203.63899-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


