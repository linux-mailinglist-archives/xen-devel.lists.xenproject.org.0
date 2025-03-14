Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F19F9A61860
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:44:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915131.1320721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt94o-0004Ox-Nk; Fri, 14 Mar 2025 17:44:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915131.1320721; Fri, 14 Mar 2025 17:44:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt94o-0004MY-Kq; Fri, 14 Mar 2025 17:44:06 +0000
Received: by outflank-mailman (input) for mailman id 915131;
 Fri, 14 Mar 2025 17:44:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zh9v=WB=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tt8t7-0000xy-AP
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:32:01 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b329b2f-00fa-11f0-9899-31a8f345e629;
 Fri, 14 Mar 2025 18:31:59 +0100 (CET)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2254e0b4b79so61940125ad.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:31:59 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9cd03bsm2990529a12.8.2025.03.14.10.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:31:57 -0700 (PDT)
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
X-Inumbo-ID: 3b329b2f-00fa-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741973518; x=1742578318; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PABH8iZPN9WF+wJr72ZMp6Lm7i1C+9jWBJAvssLik90=;
        b=NMqmIYHkM3pA5Qs3eB7qIU2gRhelkCPgF18JXX95gDDTvD0wnpd9a3nktj1SaHa6QM
         lTa9TV27adarjnTtTZQxQJh3vUPJp33o6bb6GYmitQKaJySYX8rc7CcEgjq0iYtbfnPz
         OZbcuBxccsSS9oZnFnb4k8k3LVRfMJoEPp6Fx6wisEWCnuE3XMaqWCA6rcRlCBAzDFhT
         wr5HWloDIP02hkF6eWyJ9+9a/EV/7E/Q4wN3bfIz8TyoaoT8uqbv5AJDUxW5KUYgAItj
         b7bKSZijKxmY4/lUOyu9XAuxk+fTqznJAdEoYE8VNNppUNO535heFdnAbGIyCsQZNgA8
         g3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973518; x=1742578318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PABH8iZPN9WF+wJr72ZMp6Lm7i1C+9jWBJAvssLik90=;
        b=atwWgmvCTS/gHF4ue8cbzpPjs0fZgA3UgpaNxz37dmd5INfCAP6S7cbT6+mrmJELDs
         gPrb1tVwI+te/+fZuot4iNwDvXJ/RoS/tI5wyOnoCVJt8r6iUzYMpMLkEcCkgXU4VRtY
         gvfA2d2C1AycZFks0Wmw9EgLmB5NvrQIdkF/K3kK+KCHw4b6alER0p6O7C1SS2nfFhNF
         uUwkn3v4StTHNwg53FaA5X5Z08f1Xb5S48yVn+0yas3iIhZlyk0GvEtoKd/69c4dytXj
         tAbqDN6kPlauz9sXlTpx/MwXpIROuvG1REfA5EPjFiMgQ2BaOp1nfdjnVkGsX0cv9yI7
         Izxw==
X-Forwarded-Encrypted: i=1; AJvYcCXstVUMBQKw+V9dMonFdIowY8QjiJxZKkTcBOmZ2WkokUsqgzcqJYl3SRvUuKs2gghsYa4XYN5O0cg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy2PvaujFo2XcU6rSdEEdOolySUISu9mFfnM2k4XB4VSVmVJ5bL
	QidBgVNOMd9EL/cke+t7OfxTzMDK+ky4MvL7afLnKl4dCii8pAHsCOUW0Wes0z4=
X-Gm-Gg: ASbGncsSwV8PciItv9qGPrLtz0wFBFgkYwe0OjAth8ERt7fG4b31mGvGWjPn+nDq+JP
	8d8eB6GZ78o96fD8drQ3vW541s6b+BwOsBTwrobu+1VzmkY+LpTqJ1UKWUHXZyf8989YOlen1Hx
	AqnvDbBcgXGHa7YL7mcGK20nkuYOCfawgvybfmZT7Yg+c6XxR6lca4ne3hMpzBvydwKsn9BSKvF
	WDj5rtyVd2/CWp3Mx1Vq48Vv0fQYTXbK2DvfdWBe2GYsLw34pBwbS4j9uSCmQ8WiT2w4rLG5kPl
	pgan0QKs2lZy9GsG0xCgpvN/e9ALO51WUtAsZPPHmZBp
X-Google-Smtp-Source: AGHT+IGnTvSqXO1fzlE+2xVmojsF7Bo5wJQ+q4TppfmkSKTjR2FsyvyfU5Ot+87AVkRJkvXuDcvBmA==
X-Received: by 2002:a05:6a00:228e:b0:736:562b:9a9c with SMTP id d2e1a72fcca58-7372242d387mr4348766b3a.18.1741973517785;
        Fri, 14 Mar 2025 10:31:57 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Paul Durrant <paul@xen.org>,
	Peter Xu <peterx@redhat.com>,
	alex.bennee@linaro.org,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-riscv@nongnu.org,
	manos.pitsidianakis@linaro.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anthony PERARD <anthony@xenproject.org>,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 11/17] exec/ram_addr: call xen_hvm_modified_memory only if xen is enabled
Date: Fri, 14 Mar 2025 10:31:33 -0700
Message-Id: <20250314173139.2122904-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/ram_addr.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index f5d574261a3..92e8708af76 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -339,7 +339,9 @@ static inline void cpu_physical_memory_set_dirty_range(ram_addr_t start,
         }
     }
 
-    xen_hvm_modified_memory(start, length);
+    if (xen_enabled()) {
+        xen_hvm_modified_memory(start, length);
+    }
 }
 
 #if !defined(_WIN32)
@@ -415,7 +417,9 @@ uint64_t cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
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


