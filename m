Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C6AA5D026
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 20:58:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908982.1316087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5kF-0000lf-C4; Tue, 11 Mar 2025 19:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908982.1316087; Tue, 11 Mar 2025 19:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5kE-0000fj-Jx; Tue, 11 Mar 2025 19:58:30 +0000
Received: by outflank-mailman (input) for mailman id 908982;
 Tue, 11 Mar 2025 19:58:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1ts5kC-0006Vp-QM
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 19:58:28 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3297a346-feb3-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 20:58:28 +0100 (CET)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-223fd89d036so116505725ad.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 12:58:28 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736a6e5c13asm9646981b3a.157.2025.03.11.12.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:58:26 -0700 (PDT)
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
X-Inumbo-ID: 3297a346-feb3-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741723107; x=1742327907; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vI16NHb2tKWbIxjnq/SoVUTdY/Lep770BkCc47k0Rc=;
        b=zsJToNs+z8zlYUDRNaYdG93Aoahs67Nvz/bwYb3gP72C/faXRwSnY6OeKAyF7lx9m3
         vPG2q4AjbL14H503k2MwfHUZUtMdgstFmHGMbzpBommdfvUgdXy3sMJbuhxDEYmx3lRN
         NUAWXjWF1ImEDyRH5gU1CIU5U1J6DizxCgDsT2lfitDAzqQvbyecP+fth20Oc7BWNnVZ
         5Ukgv4auv37S/FHKFovwJOtPlaTCuS50ifENeOOn04/zaS9+gvSq/9uGQMqt4XpUqApl
         DvddAAcVjqQSB3EjBJy67foROUSY1eWmXrPl7DvCpBjgikIJU9z/nynHdcfsVzWMH4un
         2Uvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741723107; x=1742327907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0vI16NHb2tKWbIxjnq/SoVUTdY/Lep770BkCc47k0Rc=;
        b=Zhyw7t8yDNsegUC73d7aVtVa+cEQ2fySJ3OU2vcRjpf1RsbdrzIVykYEEj23p6XCj5
         ODxPFOWhh6kjFgd6qjipdxvyK68z1PjeE/eM+zpK+TcGA1/jQU3ERNON6FycAAWDFR3s
         LnCTjbv67ArpsJ+Pdo86Gl9WhOp6kjdsx8s06F6yW18v8JOJo5NcE+ODcJ1yB5p4Iex0
         ODYMATJqVuswEaA85ExpVK74HjlsMD4jYLsBz6GTkdjra7NAx7Vz6NSh11fQEAhVQPdQ
         R6hlnq7D+xYwQcsShx4JA8bTFVxEcil20iGutjxZxOqmeJyNIG8HOHU7UJC2lP8kA4ub
         ht+A==
X-Forwarded-Encrypted: i=1; AJvYcCUNNVjRcUS7IpNqqa35YwrU2e8ULCBw0hkKN/DmD6U2b8BDeunrvlHr+UERYi2MT3hmfTm41Y7vZdk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYP13sOXM437kpkdXVcTORVwxFdlKgJMsME5c1sP/T9i+I+djn
	swL/Z2Uwi9jdkmlCYyniRJYQ0zjOGj29mnUqL9LIamBzHHFgar+Bzjgt3Z+zY1M=
X-Gm-Gg: ASbGncvvzDmkpXRKcL6cb+lBdNntgTNZwKQzWWVTr9IsOulGnsVmmMiFKQiu+4YxRRX
	Q62lEE3pr2YCrfBqsTz236W7ISpZuDo7xJOjWEsxN2SUH8U3fxFzjARyoPAWEUonbKPpl/R2EDw
	ymBCBwXfrciPCIC54NByBipzchTmTa2mWZgjOdpp6uuBjpdKx3+zoOHgJ50uVxXs+c6aBPylsw5
	76Equ0xm1l3sItxON7m6mcuonYC/bDibMEFOXj68fa31/NIyKq8hBwK9nKRfr85pjrdtLk2zTJI
	iAAGSBX1gmmBzX9XY8Fq9bVSgxX1S3tQE6VSIDm5bFzo
X-Google-Smtp-Source: AGHT+IH4DZQtwoxJlYICmsHBrM9aJbv4mOOcZipSBsnLFw41tHWuGL9LYWyAZtn5lP/0QysRh7Mo8Q==
X-Received: by 2002:a05:6a00:928b:b0:736:5dc6:a14b with SMTP id d2e1a72fcca58-736aaa1ace3mr27769096b3a.13.1741723106807;
        Tue, 11 Mar 2025 12:58:26 -0700 (PDT)
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
Subject: [PATCH v3 14/17] include/exec/memory: extract devend_big_endian from devend_memop
Date: Tue, 11 Mar 2025 12:58:00 -0700
Message-Id: <20250311195803.4115788-15-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
References: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
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


