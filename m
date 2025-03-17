Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 017CAA65D09
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 19:42:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917894.1322716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFQ7-0000Be-42; Mon, 17 Mar 2025 18:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917894.1322716; Mon, 17 Mar 2025 18:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFQ6-00005c-VZ; Mon, 17 Mar 2025 18:42:38 +0000
Received: by outflank-mailman (input) for mailman id 917894;
 Mon, 17 Mar 2025 18:42:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q3WP=WE=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tuFIX-0006uj-IM
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 18:34:49 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dfc8715-035e-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 19:34:43 +0100 (CET)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-225d66a4839so58053255ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 11:34:43 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:41 -0700 (PDT)
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
X-Inumbo-ID: 7dfc8715-035e-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742236482; x=1742841282; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vI16NHb2tKWbIxjnq/SoVUTdY/Lep770BkCc47k0Rc=;
        b=XoeRB8LFdko4XJWjZulPN/Nfb2lJmHIJDr5V8NHcounCWjYGf39KiKXumr3ps9JMB7
         uZspCxyQ+3vZjeXUxI48RhPkymPYQZF8YWHsi7PEb5Gc5DFEjCQcGouQ+gIdnBqDp9uz
         3F0PHexbHV3GZiQqXN3R+NK6hBYwKutOQNzGsvBqKZXguUl+/H1aYpzPZD/JWN49ao11
         0FmbyY6BFouIZNPekZcpvGeEMawCkxRpOLdEx14NQ+rKxugyPUVLpkoMAT17KNFSocH6
         k0eYygG/Vss2i8enCmmRRklplESLeaqMPJmCYeLXrisSgyUIcjpyUq806KxADJa9/tm3
         bAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742236482; x=1742841282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0vI16NHb2tKWbIxjnq/SoVUTdY/Lep770BkCc47k0Rc=;
        b=qNKzIDrggaz7xy9tfbeQfveQKQAdQ1AWCGixSSyLNpmoxC66W5nwgioYmuKfJE7oBR
         k9Uj7KjwzC5OT0Ao3eYzf3tGib7SKFEs5GHEDE/fr61Mxe5j2II4rd1IDE2VeasNLeki
         whRdXoydrxjnIovUVKpMf/aeRgQN6d+DD/08+gOyVgjH2QQmW11QmZYuTVfSt6qiMmHf
         ce7zbAlk3Nzd+qBQjMGup9g43DxJH98v6AgPBNGuREByZTaourW8baytHLBar2pBHtKs
         r+mlU7dxvLloWRPz/nfvQJ6DspMDEKfWNop6q2jHnXXW3WY19fxrE5wJJyy0OH3TTkXF
         Z4sg==
X-Forwarded-Encrypted: i=1; AJvYcCVXglKoC5XN2IYYMcI4HyXjXYtvlTKXc6+MkBqzi80Zy8We25Msq3qXfLV2YznM9TJGXPLC4xhMa48=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrAJWszR1AI+g3PgEH5Rh1DR3w5ebTQUngLK/3boAz2bKEVa9Y
	H9jNW7hkUz1lAZ3BjVaqJg6RdcBHnXD9hb+cE6KQJeS0/5m3jgM8wBcmZ+wi910=
X-Gm-Gg: ASbGncuPeaaXRI9tiBndF9DWpRfQ/SzzWFAq7JBQdunNASzIT55qWdSJYxr8yDOBKjU
	OrsTCyAnQDnHQJgDKf494p3aq0PQHLJnvO/XNmmxEnHig0bcA+JCnik6zhugx5AqcYZrE3gOxcN
	RvbtqCiUqJPrqM8JizJvG/SS8hQzOmqAnMXL4y0qvwLHxC25ZqiKPKr/vPnlnXwZeYZ9l7WJnwv
	U/8J4w1uls6UEj49QvcJW7SvA/uMDzFfNY6rjQDDHaOp6hBTHnbVvJGshNpht55T88GalA6AwC3
	/bV0g52DiJacuP8vEZVCeq2D5Wbil6uyclek56VFAXgeNrLW2dR2h9k=
X-Google-Smtp-Source: AGHT+IHLCVfoMXXafvmlUL+0Gr6I93fx5MjwwlixqoYIvnF6wjRbfJSSJwsXt8s9Rnrm35OOx0JfRQ==
X-Received: by 2002:a05:6a00:a15:b0:736:9f2e:1357 with SMTP id d2e1a72fcca58-737578016a8mr692906b3a.12.1742236481805;
        Mon, 17 Mar 2025 11:34:41 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	David Hildenbrand <david@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-riscv@nongnu.org,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	manos.pitsidianakis@linaro.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	kvm@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Xu <peterx@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Anthony PERARD <anthony@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 15/18] include/exec/memory: extract devend_big_endian from devend_memop
Date: Mon, 17 Mar 2025 11:34:14 -0700
Message-Id: <20250317183417.285700-16-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
References: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

we'll use it in system/memory.c.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/memory.h | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 069021ac3ff..70177304a92 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -3138,16 +3138,22 @@ address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
 MemTxResult address_space_set(AddressSpace *as, hwaddr addr,
                               uint8_t c, hwaddr len, MemTxAttrs attrs);
 
-/* enum device_endian to MemOp.  */
-static inline MemOp devend_memop(enum device_endian end)
+/* returns true if end is big endian. */
+static inline bool devend_big_endian(enum device_endian end)
 {
     QEMU_BUILD_BUG_ON(DEVICE_HOST_ENDIAN != DEVICE_LITTLE_ENDIAN &&
                       DEVICE_HOST_ENDIAN != DEVICE_BIG_ENDIAN);
 
-    bool big_endian = (end == DEVICE_NATIVE_ENDIAN
-                       ? target_words_bigendian()
-                       : end == DEVICE_BIG_ENDIAN);
-    return big_endian ? MO_BE : MO_LE;
+    if (end == DEVICE_NATIVE_ENDIAN) {
+        return target_words_bigendian();
+    }
+    return end == DEVICE_BIG_ENDIAN;
+}
+
+/* enum device_endian to MemOp.  */
+static inline MemOp devend_memop(enum device_endian end)
+{
+    return devend_big_endian(end) ? MO_BE : MO_LE;
 }
 
 /*
-- 
2.39.5


