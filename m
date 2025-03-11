Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1CCA5D027
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 20:58:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908984.1316107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5kH-0001VZ-UE; Tue, 11 Mar 2025 19:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908984.1316107; Tue, 11 Mar 2025 19:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5kH-0001NR-I8; Tue, 11 Mar 2025 19:58:33 +0000
Received: by outflank-mailman (input) for mailman id 908984;
 Tue, 11 Mar 2025 19:58:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1ts5kE-0007Uu-K4
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 19:58:30 +0000
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [2607:f8b0:4864:20::102c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30851c3e-feb3-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 20:58:24 +0100 (CET)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2feae794508so8962748a91.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 12:58:24 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736a6e5c13asm9646981b3a.157.2025.03.11.12.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:58:22 -0700 (PDT)
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
X-Inumbo-ID: 30851c3e-feb3-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741723103; x=1742327903; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9PU2mUUZXceFgFF8NURkIZqXSTxuLUTW3yG3F37dHQ=;
        b=ySlCDSlw4C2jJRBJVMlBfDoaYGpEn5JPYzGeJv7wwcI/8GCULmhksm7AnZbbXZRp78
         RL3VfSN1R6Pbtjj/p4oelMSIHRDWuhRa11Up2c/VFV/pzJ8MQnEnfUOo6HU5FarJ9uaD
         2AtB9Zw/5qWnJC1xnJT+9MNxZwMHKT9P8nu2TZ4sh1Ehd+eocmrF1R9Ldc6yEfIOCxX3
         QAzdFM0ioBiVY6a6qIFN0v5fah9oaUFccQoeLtu4PzlQBQJTYCeWNCTan5nqsPk3XGda
         3CONSYKbW3GxOVwBN99AQ1soKR/N+23s2yU9DbDmVcDgJcjId1UxT3vEhHvG1pAma/hU
         480w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741723103; x=1742327903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9PU2mUUZXceFgFF8NURkIZqXSTxuLUTW3yG3F37dHQ=;
        b=cdIoP2s1Cm2TRi0UoZ4N7FBxBq1O2JVFznx3IQZfuzckGW3IlbnFnodBQWfUBBnQLM
         W+BENAhexDEtjuPHcQ3TNsejY4J76xb7R5GmxpdkKd2+IB3WyEyDimDhmVV6wBR+1sd2
         A4JRAOPTSf5fSDZbSAhI/fpUqJzQR0OFTYpTKjWGBiIW1ycEQffTnYxHtSqv/aIYTr/p
         0yOI4AV0sjTrht0kZUtjyweKFuvDu+UtwcOIQEe/cEKGo1sHvGA5dj2YPnFK5L8mCxiE
         60kAv647N63wLr2e7mDChILRVx9ILHQk463tbqbGyAtXBuQozl1h2FKsftFWkEuWMcnf
         U/Mw==
X-Forwarded-Encrypted: i=1; AJvYcCXQIZDIW1QZ379nKMFg2ogGNztydx1+lbDB070DPc+pEL8NORmVIKnAXRO1YUjpCfJg8B7C4/ZAwJc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxdhkamp6zm1dPKxNu4T0AFkJ5mqeFjZCdyznXTjO1EDsVDTIqV
	DVBoVCmdww59eWbCxV53C2BYWpwAY3cjmJABSnVuqnHd3lVtQZ5eKZ4vUPa5IpM=
X-Gm-Gg: ASbGncuehiAP7nycboJZHcfTLMFWIcnBphw2tszUTK71vi48Xe+I0078FxV3n4x6fa7
	uRwTqujhmwpWCZH6oG5ulqqZhnfKiZ1AslnYqNXBbeSCCSeqNDhBpFxNMoSH6YneVggRDiboAhf
	W7ueTe0na1jKh6KTOzOPTuspd4XTnysm5WyJrnHTgWSbfD8hBRB2TaYtKRgH+oALDaHJ9lledug
	PIZSM5vTTRKQhlM6f2d4qT66X6etERENp/Rtuyx4FTE/odgU2xsuwaYF+J93xqxcRCjwvH3Y4wk
	OBbQCZzmI49YMdM5x8jh3dJ1KAkjJe9qZB7Vi4FoPew2tvvu8Gnw8a0=
X-Google-Smtp-Source: AGHT+IGg+aQTZ2xq9SQi3eRnsIeXjPhQ74pTHWyL4E+moWnFDewPnn2zGKzm8djm9QcS5fi3hNfHgA==
X-Received: by 2002:a05:6a00:c8f:b0:736:34ff:bfc with SMTP id d2e1a72fcca58-736aaab7d8fmr24949384b3a.19.1741723103280;
        Tue, 11 Mar 2025 12:58:23 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	kvm@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	manos.pitsidianakis@linaro.org,
	Peter Xu <peterx@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	alex.bennee@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 11/17] exec/ram_addr: call xen_hvm_modified_memory only if xen is enabled
Date: Tue, 11 Mar 2025 12:57:57 -0700
Message-Id: <20250311195803.4115788-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
References: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/ram_addr.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 7c011fadd11..098fccb5835 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -342,7 +342,9 @@ static inline void cpu_physical_memory_set_dirty_range(ram_addr_t start,
         }
     }
 
-    xen_hvm_modified_memory(start, length);
+    if (xen_enabled()) {
+        xen_hvm_modified_memory(start, length);
+    }
 }
 
 #if !defined(_WIN32)
@@ -418,7 +420,9 @@ uint64_t cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
             }
         }
 
-        xen_hvm_modified_memory(start, pages << TARGET_PAGE_BITS);
+        if (xen_enabled()) {
+            xen_hvm_modified_memory(start, pages << TARGET_PAGE_BITS);
+        }
     } else {
         uint8_t clients = tcg_enabled() ? DIRTY_CLIENTS_ALL : DIRTY_CLIENTS_NOCODE;
 
-- 
2.39.5


