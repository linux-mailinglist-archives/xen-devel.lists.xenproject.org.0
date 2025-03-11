Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0B7A5D01F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 20:58:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908973.1316061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5kB-0008Nu-Cb; Tue, 11 Mar 2025 19:58:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908973.1316061; Tue, 11 Mar 2025 19:58:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5kB-0008Lc-2C; Tue, 11 Mar 2025 19:58:27 +0000
Received: by outflank-mailman (input) for mailman id 908973;
 Tue, 11 Mar 2025 19:58:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1ts5k8-0007Uu-Iw
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 19:58:24 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c7bcf48-feb3-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 20:58:18 +0100 (CET)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-224341bbc1dso80069125ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 12:58:17 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736a6e5c13asm9646981b3a.157.2025.03.11.12.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:58:16 -0700 (PDT)
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
X-Inumbo-ID: 2c7bcf48-feb3-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741723096; x=1742327896; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wT5ohu0Ui7xrH+jgYqMJMpKemGPcZNvy7jzdyuAyzEs=;
        b=q+LietHmiMkGO68RvjWenF1AoXzdEsM7f64rE+0g5VtEW5issuYqNKsPwc9Udj4Apx
         Fgwhd43Upm106seMw99n1aqXkRaKfSylOMr5PuqlZatTkAvrZjobtzYABx6CGvNYl5yW
         w/3I6T3L0GlsikGOPLNmK0N5lTpstl+bxXuInTA9buaa3hyn04ZdKki0HSYmDJxprFki
         21FTMhS+A2GqaSExVzqMIK+JRi3e6UuH+a7P7p/PT+coBTTXZ+4XRwwRSOwAfU0eE9Th
         kp6Qn+CreF4XmXgyiTvx5o0440WOkGoGp4i1dsnr4L+HKXp/50vVAQKuJACb3BhSwj1t
         4Lhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741723096; x=1742327896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wT5ohu0Ui7xrH+jgYqMJMpKemGPcZNvy7jzdyuAyzEs=;
        b=sGAUCGQmNH+F/tdT551grvcmjJ3R8dWxay+O+9su0Zg8gExh3N3TReCJCPJIzoDft9
         e6VBETnHvXLh42V9ynb8+eqrTmlJQo3x8kIZ0RwPN5r/KcP3N2NPMLMv4iXRfgO4tlRk
         yB43KNHIPyWXWJ84Gv7cVq/15pQUXsLtTL3WRkUkmCLxu2emzB6MNsVF8nii2fZR3NVk
         efqkNGyH39hxXNenvQopZXG1WFxRAYhRhbmd0DHQL/cZxoCr/trRXBsGH/WzmQdGdhmS
         LFxebVfr2zz9coy6mDDzrh3SRsWzLGQcK1u8ePIzpnC0yBUVtivnDrsG0uTGkxOF1gFz
         F+Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUJdxEQiPZCEHJlIYfLTef7ckpUfAqwLjuREOcuCfDbqTugo8x+D+5vJ516ukMhs7A4WWwyb8H3bvc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz9CHoJrRkfRE0hsGB1GjPRq1W97AwSeZwgMqR5ZGtEXTphCjWC
	vKRoRv3CF2hFYxBWBwj2GpPtMGvv08Bus7uYZh9lyTAUGlgU2h/84cGPCHowanU=
X-Gm-Gg: ASbGncukUyqOoHNZAd8PIgTzn/ZJmz+avj1wEyt9NkD4iikleugz7Ha3oErOyeATCwz
	VLzLN8I300I1dxPnQ3Cqx+D+aPQ+zClZwAJNsrBeSASVKdWjixGUtENWVpMHIl+QUDnfaOCq6rm
	7Ctzo+TVPqKRY+T3ags88X2Vgh0jb2NqUik21xJOU2ZVGeQxeHjJg5h2Oez3gZ4y7N0lT6BRjGB
	yQUPSSN2R2dXnVBkXj02u/hZ46/FgWo2iKobchX/PqjvQgXz6zHKngw4Jg9Y7HuVvHeOU110o3B
	SYagOQEhlpmdz/WeIfMFB3Rrwfrju8lj7M8vwtZrrlcU
X-Google-Smtp-Source: AGHT+IFol9xcK9Mza8BcbJc/CzML1UZwkH32uaLlj+5vumcl06S67T5kaVFtBRtM8pv/UzBlFhWjBg==
X-Received: by 2002:a17:902:f691:b0:215:bc30:c952 with SMTP id d9443c01a7336-22592e2009cmr58302965ad.6.1741723096508;
        Tue, 11 Mar 2025 12:58:16 -0700 (PDT)
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
Subject: [PATCH v3 05/17] exec/memory.h: make devend_memop "target defines" agnostic
Date: Tue, 11 Mar 2025 12:57:51 -0700
Message-Id: <20250311195803.4115788-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
References: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Will allow to make system/memory.c common later.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/memory.h | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index da21e9150b5..069021ac3ff 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -3138,25 +3138,17 @@ address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
 MemTxResult address_space_set(AddressSpace *as, hwaddr addr,
                               uint8_t c, hwaddr len, MemTxAttrs attrs);
 
-#ifdef COMPILING_PER_TARGET
 /* enum device_endian to MemOp.  */
 static inline MemOp devend_memop(enum device_endian end)
 {
     QEMU_BUILD_BUG_ON(DEVICE_HOST_ENDIAN != DEVICE_LITTLE_ENDIAN &&
                       DEVICE_HOST_ENDIAN != DEVICE_BIG_ENDIAN);
 
-#if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
-    /* Swap if non-host endianness or native (target) endianness */
-    return (end == DEVICE_HOST_ENDIAN) ? 0 : MO_BSWAP;
-#else
-    const int non_host_endianness =
-        DEVICE_LITTLE_ENDIAN ^ DEVICE_BIG_ENDIAN ^ DEVICE_HOST_ENDIAN;
-
-    /* In this case, native (target) endianness needs no swap.  */
-    return (end == non_host_endianness) ? MO_BSWAP : 0;
-#endif
+    bool big_endian = (end == DEVICE_NATIVE_ENDIAN
+                       ? target_words_bigendian()
+                       : end == DEVICE_BIG_ENDIAN);
+    return big_endian ? MO_BE : MO_LE;
 }
-#endif /* COMPILING_PER_TARGET */
 
 /*
  * Inhibit technologies that require discarding of pages in RAM blocks, e.g.,
-- 
2.39.5


