Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4414396CA9C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 00:55:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790821.1200619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slyud-00029r-BI; Wed, 04 Sep 2024 22:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790821.1200619; Wed, 04 Sep 2024 22:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slyud-00022u-5G; Wed, 04 Sep 2024 22:55:43 +0000
Received: by outflank-mailman (input) for mailman id 790821;
 Wed, 04 Sep 2024 22:55:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFI/=QC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slyua-0001n3-Uu
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 22:55:40 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce6dc6df-6b10-11ef-a0b3-8be0dac302b0;
 Thu, 05 Sep 2024 00:55:40 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a7a81bd549eso23212466b.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 15:55:40 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a679755b3sm21546166b.146.2024.09.04.15.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 15:55:38 -0700 (PDT)
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
X-Inumbo-ID: ce6dc6df-6b10-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725490538; x=1726095338; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+a9rZjwjT4T/KMzHim0E6pRI1Xb37U68VQt9wRm391Y=;
        b=MQUYXEfYQbuzLGQH6SCOLk4qzBCEdFl9uyS3JF9liRplrNasytPSM2us+iddx1g7Hi
         uu7tRAigX4obLs2MwYLJIJ3qBo3i+xppCWHiGzf4cC/Oxo/HQ3OskSLkfk8qdWrbkFit
         ess5uqd4E+33c525yyELNB4IgHOftpcTDdrF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725490538; x=1726095338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+a9rZjwjT4T/KMzHim0E6pRI1Xb37U68VQt9wRm391Y=;
        b=AW78r1d8EL1hiof8rFxdfjmd3B3f0Rzh9d3zoxrOOgExvLz0SDcgZKKCSNL7uoR5o6
         rbe/prJsMzKLIyLTu4LrwO9GoXDB98IQascykt2VN7s4mttNKJAxVED8UjxDT+ilmoJU
         9C6Fz+6Pil6124Yawx0AYSuPEhjFhWG2Cgv5+b+MTSA51JxVcTlmiR0A2y4zcKuLreBg
         wJBOGn9GtTb0SKwiqhR9CZLFuKwqDNd7LTxjDdAi91v9iyOVxPUjrdqAxyP+edPnZxhX
         0ZVwJxT4IEdAmPL+8bRcMiCOV6vIQE0aHGLfsfmB+Hq3Ao9mvOH3RjZp1UdCQvg78LPV
         H1zA==
X-Gm-Message-State: AOJu0Yxr7sOu0lkE1k9sYOV1ZrFBbBmLQcGWv4T2VtFXLdJB5CHVaTeR
	/wC16MnjHoaalGZWVfpldHXtcD8gXGfegxxdG39X/DC5CAleStUm6Owlw8CtLFUbjs4QH5b9HwZ
	+
X-Google-Smtp-Source: AGHT+IG+Y7IPRGGgu1K+j4/cT54zyPqU0Sl4llXZ8+j9vxCozoA3aNlcQm4snkZPegSrROF+RnOVjQ==
X-Received: by 2002:a17:906:c14a:b0:a7a:9ece:ea67 with SMTP id a640c23a62f3a-a8a1d29b713mr736725766b.9.1725490538440;
        Wed, 04 Sep 2024 15:55:38 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v3 3/5] xen/bitops: Implement hweight32() in terms of hweightl()
Date: Wed,  4 Sep 2024 23:55:28 +0100
Message-Id: <20240904225530.3888315-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240904225530.3888315-1-andrew.cooper3@citrix.com>
References: <20240904225530.3888315-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... and drop generic_hweight32().

As noted previously, the only two users of hweight32() are in __init paths.

The int-optimised form of generic_hweight() is only two instructions shorter
than the long-optimised form, and even then only on architectures which lack
fast multiplication, so there's no point providing an int-optimised form.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>

v2:
 * Reorder with respect to the hweight64() patch
 * Rerwrite the commit message
 * s/__pure/attr_const/
---
 xen/arch/arm/include/asm/bitops.h | 1 -
 xen/arch/ppc/include/asm/bitops.h | 1 -
 xen/arch/x86/include/asm/bitops.h | 1 -
 xen/include/xen/bitops.h          | 5 +++++
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
index 91cd167b6bbb..b28c25b3d52d 100644
--- a/xen/arch/arm/include/asm/bitops.h
+++ b/xen/arch/arm/include/asm/bitops.h
@@ -85,7 +85,6 @@ bool clear_mask16_timeout(uint16_t mask, volatile void *p,
  * The Hamming Weight of a number is the total number of bits set in it.
  */
 #define hweight64(x) generic_hweight64(x)
-#define hweight32(x) generic_hweight32(x)
 
 #endif /* _ARM_BITOPS_H */
 /*
diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
index 64512e949530..f488a7c03425 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -133,6 +133,5 @@ static inline int test_and_set_bit(unsigned int nr, volatile void *addr)
  * The Hamming Weight of a number is the total number of bits set in it.
  */
 #define hweight64(x) __builtin_popcountll(x)
-#define hweight32(x) __builtin_popcount(x)
 
 #endif /* _ASM_PPC_BITOPS_H */
diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 4c5b21907a64..507b043b8a86 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -482,6 +482,5 @@ static always_inline unsigned int arch_flsl(unsigned long x)
  * The Hamming Weight of a number is the total number of bits set in it.
  */
 #define hweight64(x) generic_hweight64(x)
-#define hweight32(x) generic_hweight32(x)
 
 #endif /* _X86_BITOPS_H */
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index 58c600155f7e..a462c3065158 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -326,6 +326,11 @@ static always_inline attr_const unsigned int hweightl(unsigned long x)
 #endif
 }
 
+static always_inline attr_const unsigned int hweight32(uint32_t x)
+{
+    return hweightl(x);
+}
+
 /* --------------------- Please tidy below here --------------------- */
 
 #ifndef find_next_bit
-- 
2.39.2


