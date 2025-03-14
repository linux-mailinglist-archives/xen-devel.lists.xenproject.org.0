Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D65A617AA
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:31:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914967.1320608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8sz-00038z-79; Fri, 14 Mar 2025 17:31:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914967.1320608; Fri, 14 Mar 2025 17:31:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8sz-00030r-2V; Fri, 14 Mar 2025 17:31:53 +0000
Received: by outflank-mailman (input) for mailman id 914967;
 Fri, 14 Mar 2025 17:31:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zh9v=WB=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tt8sy-0000xy-0W
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:31:52 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34227646-00fa-11f0-9899-31a8f345e629;
 Fri, 14 Mar 2025 18:31:47 +0100 (CET)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-22355618fd9so48786925ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:31:47 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9cd03bsm2990529a12.8.2025.03.14.10.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:31:45 -0700 (PDT)
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
X-Inumbo-ID: 34227646-00fa-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741973506; x=1742578306; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=949DeBQijWmgHqYCdDdupcSTn3rDdND8nLqwkILEwEI=;
        b=KBnjvRvhagUil1NbY5Wp+4g1yfeD+sXYIOueppDRSbnhehO/S9YwsIHISLPhjtWNCz
         zp62Ev1zE8gM6WN2FLMk4avgeV8Dj2dNn+9FJwg11+QM2a6nMxiLrwKMi3C1PLfVlCNH
         uvN08ou5A0gvo1Y7GcUJUBk1VfHWTsInu2otRRGmKW2LavK5xtVado9whASiggAuOLmi
         U5p7h4i3ZwgxVgmJQ2BctwpXSEHTzh9efr993gP1xOUmTavdn2q/okVnvOVSdYQf/Nkj
         ySrsFCJN316u7Iv4ebc/a6ol6n74z/83BZh37hJL/94eSci/lomHBgw5mKUvCUnmFjjL
         HhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973506; x=1742578306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=949DeBQijWmgHqYCdDdupcSTn3rDdND8nLqwkILEwEI=;
        b=XpvVdXeYtRS2nhTHTAjwTNHYYP2d/7ewCRAk8M2hCnFW8d1vCcRAoJfk8U8YI1s532
         aKdwGP6lNredE/AnawIGfpQ6U7t/lymTqeBf6orNK4Z6uFRY9uz6TIrA9CN7OqOioqkO
         1PD8e8wOkI8vbqZj+L48/EPK+D38tAQ2S394QQPrwKWZgrA0YpqbXQPNehhGgIlOC2cf
         NXptj+JMhnb9An5vuDCGdUnttftV1aPq14avtQqqjAII9kv4F+g0rIVUy89eFOxGgFOG
         GANOzo6G06Rstu2qY6DsgftFvEar+7SFDMwi+5p0nb6JT9EJ/6C4ZtcizOsDTq34nFuJ
         eGZg==
X-Forwarded-Encrypted: i=1; AJvYcCU2Ky5Mu5ckK0MxufRecUmrfAYjk4nYUbr2XGW08pUO0D3B7OpZPUvQIqDCOwYiahl/tMhQUWlF46o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzsoexX+YoB3KsREJIFYTaHCQG+03CrSj4aHh5iukhrLprBsCmP
	Id+40VRTNxP9hlcfvPQDIWlMXfRGwRYw8DM0/3BcnQsqGZZyBW4gXZuM3yIcZ9E=
X-Gm-Gg: ASbGncukhdxRL7/SR+0NZJ1zzmsO20fwQeHeVJJvmk8nN+jfqTkp8msekK2jULOE7w0
	CpgV/YGtcTTAQ88oc9ovENnHCWHpeEvn9hf5j63/2C+K/ZZsCulbHxf8vK7qKPArhTJCP0Gc/Cz
	NltCuCGmsn4/rE8sPbA0tBhFxjVHVPOwgPXaeai3+Eqg+u3q8ljP1gnz/GqISKHveBz+kHX0ldn
	RL+oUAI2WQvT8t4Hjzu9vItCMcGgZatDfd/spT9CmB1lNRd//UGHaBzz+mdqpJ4FFMS4+0CGhJW
	XlJKC1zg+cqWg0MJADQr8+W6SvDVGaDcmi+WchWQnl6C
X-Google-Smtp-Source: AGHT+IEjELEcHkUSgYSyUpOQLSDQBfR3q2soKgt+mWzeI9X+HyRoUAOICNrXniu51BG9jWIge0MJZQ==
X-Received: by 2002:a05:6a21:168e:b0:1f5:7f2e:5c3c with SMTP id adf61e73a8af0-1f5c113795cmr4514154637.1.1741973505987;
        Fri, 14 Mar 2025 10:31:45 -0700 (PDT)
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
Subject: [PATCH v5 01/17] exec/tswap: target code can use TARGET_BIG_ENDIAN instead of target_words_bigendian()
Date: Fri, 14 Mar 2025 10:31:23 -0700
Message-Id: <20250314173139.2122904-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/tswap.h | 11 ++++++-----
 cpu-target.c         |  1 +
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/exec/tswap.h b/include/exec/tswap.h
index ecd4faef015..2683da0adb7 100644
--- a/include/exec/tswap.h
+++ b/include/exec/tswap.h
@@ -13,13 +13,14 @@
 /**
  * target_words_bigendian:
  * Returns true if the (default) endianness of the target is big endian,
- * false otherwise. Note that in target-specific code, you can use
- * TARGET_BIG_ENDIAN directly instead. On the other hand, common
- * code should normally never need to know about the endianness of the
- * target, so please do *not* use this function unless you know very well
- * what you are doing!
+ * false otherwise. Common code should normally never need to know about the
+ * endianness of the target, so please do *not* use this function unless you
+ * know very well what you are doing!
  */
 bool target_words_bigendian(void);
+#ifdef COMPILING_PER_TARGET
+#define target_words_bigendian()  TARGET_BIG_ENDIAN
+#endif
 
 /*
  * If we're in target-specific code, we can hard-code the swapping
diff --git a/cpu-target.c b/cpu-target.c
index cae77374b38..519b0f89005 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -155,6 +155,7 @@ void cpu_abort(CPUState *cpu, const char *fmt, ...)
     abort();
 }
 
+#undef target_words_bigendian
 bool target_words_bigendian(void)
 {
     return TARGET_BIG_ENDIAN;
-- 
2.39.5


