Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 602F1A5FC2E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:41:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912990.1319196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslca-0001RU-SN; Thu, 13 Mar 2025 16:41:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912990.1319196; Thu, 13 Mar 2025 16:41:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslca-0001Oe-Pf; Thu, 13 Mar 2025 16:41:24 +0000
Received: by outflank-mailman (input) for mailman id 912990;
 Thu, 13 Mar 2025 16:41:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UNRr=WA=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tslaj-0000Wy-O7
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:39:29 +0000
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b902e856-0029-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 17:39:25 +0100 (CET)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2ff187f027fso2324090a91.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:39:25 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30119265938sm4020084a91.39.2025.03.13.09.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:39:23 -0700 (PDT)
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
X-Inumbo-ID: b902e856-0029-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741883964; x=1742488764; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PABH8iZPN9WF+wJr72ZMp6Lm7i1C+9jWBJAvssLik90=;
        b=WwL0SM+zfM+CQfmZ0rIQHnJcRd4/GwZpAy7f+ntnhhVWHKwUncoiyZbERjxJugxVRk
         xwKYXZgsci/8IQvx82+GMguhaBtsr0KJilWrWyV2y5gyODFDYIQBfeqk3UUD0QwYRGTH
         UUKER8oytQtYGIoLsA/RiBsZnmJKVXuqTHBl/0x2ysTK1XoS8oLXJ1SJfAaDrKpN6md6
         SbpnUH+FZjQemmVlD5Xd7v1oWzPkjTsoLojcnYqKqlQQcCVV6rIAFS3Nwuxkn2Jm6ciF
         /rQPGb0DKluE1aZy+mafHW7+/kTuohWyjjAXOvkXKTi5Inb+epYoqxx8N/7fdMLnxgKl
         4EUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883964; x=1742488764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PABH8iZPN9WF+wJr72ZMp6Lm7i1C+9jWBJAvssLik90=;
        b=kYA+kduwCM81V8AuBbrDngF0+o1++NS6YmEyL4y0ecYnDEG8ccNbVHzyRQQdVmEAIf
         TbBn0htvSxMls7oteP/5Zhn5L81lXgzQWJ2YIRM+IVlVGbI7RPAb9TUJ8NfQNjspmeUh
         U7ahF1ItiNQDA4Dap3DD4cIcm1e5OaMacvpHdjTQj57cWdq6c3az2AJR6udj5l17q+E2
         Rmaq2mjZ+OW0+EZiA1qvne3wbuwWvzbsTuhxZVdtIF8G99cCVeNFag1jQrnQR156wAwW
         wqXba5dfXLc4xU+kd3S5NtaXMmdv4UaMw5uqc9TfojfUWLY7ZX1cnI64STMHDvcVS9lX
         GI6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvRHXWo7UZJMg0e5cLa1v+8atzvvHbM2e95nF3tHPRNudtUCxZcbxCtNOCMNohVUrAL4rr+gBkjBQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw9TDUWn/G3lYuMvFLfvWUs2ZT2LAhjOe5POrP3iyP4V1WjZA6S
	mRVDqAE0+bpugiqy60wuRaZKMTwcoERvMLSvOF802lHcc/1JT3uCwil/nwZXg3c=
X-Gm-Gg: ASbGncv0tAGVSRM/WBo9TfjufsFcd/zj2WIXOoyHxrjg2/TFdC7nkEyEzcUWAtiQfm0
	VmpwbkhhT7/RhogsR8sWz4tqrgO5LEEHdFmREkuPdEHe8Oh6y4jWifH4IIoOPXA3JSN4NNw6poy
	/6VEJ8AmI5vas021ciXlvRa2a0G+ZYLgE9XqkCYxunFY9d70TszqSUkdtM9Lj22U5ttI6Htj4VI
	ZSZ9ltpbBMqPDq8PRWWpmLqEiM3W88PnmXnB0bIWtkoXg1WC+9cy7J8tm4uC0txgisr1XZoM46o
	HL/u8ua/IeQ1HGfc7wqScLi+6yEHEX21tiv34XmkFCgn80l8MArBYQU=
X-Google-Smtp-Source: AGHT+IFBCzdx2RE2XSuvFzfGvZFs1Ld7NKM4NGPSUQ/nU1Uh9fZ+kP54v1OAyBR0HlgDCGZ75ow8Ew==
X-Received: by 2002:a17:90b:2f0d:b0:2ee:9661:eafb with SMTP id 98e67ed59e1d1-30135ed493amr4421602a91.12.1741883964075;
        Thu, 13 Mar 2025 09:39:24 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org,
	Peter Xu <peterx@redhat.com>,
	alex.bennee@linaro.org,
	manos.pitsidianakis@linaro.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	kvm@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liwei1518@gmail.com>,
	qemu-riscv@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 11/17] exec/ram_addr: call xen_hvm_modified_memory only if xen is enabled
Date: Thu, 13 Mar 2025 09:38:57 -0700
Message-Id: <20250313163903.1738581-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
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


