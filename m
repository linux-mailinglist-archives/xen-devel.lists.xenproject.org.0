Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BA7A58C3A
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 07:43:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905973.1313503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqv-0002wX-8t; Mon, 10 Mar 2025 06:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905973.1313503; Mon, 10 Mar 2025 06:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqu-0002h8-PU; Mon, 10 Mar 2025 06:43:04 +0000
Received: by outflank-mailman (input) for mailman id 905973;
 Mon, 10 Mar 2025 04:59:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fu2G=V5=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trVEK-00070S-Ls
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 04:59:08 +0000
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6414b0be-fd6c-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 05:59:05 +0100 (CET)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2240b4de12bso56093115ad.2
 for <xen-devel@lists.xenproject.org>; Sun, 09 Mar 2025 21:59:05 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736d2ae318csm1708308b3a.53.2025.03.09.21.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 21:59:03 -0700 (PDT)
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
X-Inumbo-ID: 6414b0be-fd6c-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741582744; x=1742187544; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+faf/Iypy1sVhFNFInOCPAbXVKj8STEbMMwCdFMyRw=;
        b=b4uYIVhQNuu/Rev+NnYln+CiLyYUH+JzVeZNWyrO32z/tJ+0iSe2YsX4PFjOi+KibN
         p+gv7/i7EGtzuXbsy881Gp9hl/1WCEcosyPcyBgpAbLyjFbIbiIuwGDoLkSwtooT32F2
         8R3HKsNy+FRCotzGsvJDLV1RYpICrvjz1cTk5bswkPf2W/dfgO04uaAueJaIcBq9ZwCM
         D1eISl1r+Nkcq1SaJ4SgEpVhNFruWJfSqFu5qZBGvRxXuzfjVad6JPAMNaX3diPf8q4J
         eV87u27iIBtw5D8nrNQKviep68zGejf83NJOQGcMO6pV1Cdp5hz3epsUrbl2u9SAE6Yr
         8VcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741582744; x=1742187544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+faf/Iypy1sVhFNFInOCPAbXVKj8STEbMMwCdFMyRw=;
        b=t1JpkJjJiDtFOFPW0wYkr/Ayg4PU7s34DfX1i7qYn/6Ozqep4Abt91IbvNMVp7DTT5
         4T27lQxjoqrImAltI0ygfW/J15ynH0a9gvXXjT7Y01wFriUc8jnQ3oTBca9F2mFKUkgZ
         3e8hsaRf14ZjJO1PQOHEEi4/uZmV8Ld0uJ4m8lv+Kh4BLzupwDE0nS9OaKrtfvFvnWPb
         ii874e81nwnL4Ott6tNrrKIG7pcSTv/w/fWZW0fGVChLJZl5GM99LGma4jqU72qrVhL3
         xWrLMLfHvfVrPPFuqhuAmqH2USKAjeI7OhwTG5V4IJuZ2mdtQ5TpQhkTtH+9dUt9gyy0
         vdLw==
X-Forwarded-Encrypted: i=1; AJvYcCU5wsDALsCt/r53/OuzGluzr4SHUAHmmhXNJ7haXu38/J+5L4j+Ttw3OiCqmpFQR4/kfXBGiBwlk5A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3xlHjlZ1COEbP7rUPa8lRQogF9BhmQtaPVGKRIanWbExU+9M5
	U43Jjj1vb4dVmx6adrN0UkOV22Tjr6UC3jfHoLGJZxZbdfVW2wIOh/WriTAYSow=
X-Gm-Gg: ASbGncv2wYW1iDDXzu2hmCKBdYw2bOJCzG3iTJfmSjY1izX5+LUbmoPO/8cTyicrsH2
	WV4oZPk6UOCorWvndocTO3DjDoRV4MgfjBdo2VTg9GSeJkWpLLZFANbVA4ldMgjYmz6mI7qavMo
	Dze+NHt7UN6oI712pgpO1HTyshtR0Rr2CCxMSBV8Yqcwb/mDpD8PyI1jlZgWq8NNB7TPzOfgXDt
	WsIFGh5ZEhzGYdWCgI5q9b6NQdHM0VBiqERxJVEYYQVyfqAQv+cxikOItGrjxFodZkurmbAZmY8
	TpPPzdcIxFWc1I8TlTHMN+zj7p4sdr4sRt66EFLJqB1Aoes3F3uKgJk=
X-Google-Smtp-Source: AGHT+IHvC7npbpjr3DTdxoZwzYb1dM7G7lfM3pxuLeNMzVZpdYuqkJ12UM6z/Bptz/oCAInuSIhPSQ==
X-Received: by 2002:a05:6a20:a11f:b0:1f3:2d62:3151 with SMTP id adf61e73a8af0-1f544acc6camr22843444637.7.1741582744338;
        Sun, 09 Mar 2025 21:59:04 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	kvm@vger.kernel.org,
	Peter Xu <peterx@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	manos.pitsidianakis@linaro.org,
	qemu-riscv@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 12/16] exec/ram_addr: call xen_hvm_modified_memory only if xen is enabled
Date: Sun,  9 Mar 2025 21:58:38 -0700
Message-Id: <20250310045842.2650784-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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


