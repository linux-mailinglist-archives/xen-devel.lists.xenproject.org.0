Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A89DCCB0CC2
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 19:09:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182103.1505037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT27x-0007Yi-IH; Tue, 09 Dec 2025 18:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182103.1505037; Tue, 09 Dec 2025 18:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT27x-0007Vu-EX; Tue, 09 Dec 2025 18:07:57 +0000
Received: by outflank-mailman (input) for mailman id 1182103;
 Tue, 09 Dec 2025 18:07:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T3Df=6P=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vT27v-0007Ud-PH
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 18:07:55 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb8e85dc-d529-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 19:07:54 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-477aa218f20so40024095e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 10:07:54 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a7d99ede7sm23307325e9.4.2025.12.09.10.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Dec 2025 10:07:52 -0800 (PST)
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
X-Inumbo-ID: fb8e85dc-d529-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765303673; x=1765908473; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FCnAMLT3L0ZNCi75nLm7gFLzx+WgVtvN3eDexyByS7w=;
        b=oEP4kW/3iIRJ0OpstWEdl3ZFRjx36QQrMJqP2fEU5IPMUk6OJjNZsJoncaHADg1v3w
         uYL7C6ASRoJVQslZ9gNhWZNVzCelYTcdD0LF2aH4fq4U1pFF7GW5e36O7IKxjSKMC18b
         HuxZ5sEOyqOiAHshP3d3QDU203fdHCWHeJtAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765303673; x=1765908473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCnAMLT3L0ZNCi75nLm7gFLzx+WgVtvN3eDexyByS7w=;
        b=blwm2mEphsJNMXWF567KafDglplq3J79Pp5z5JHJjAEfPbrYgO/SiDlmRjgyWC8D++
         Nnc3ZzSVefmUt5OTy7Ll77gF4KnU3+SWWtVUivq+PxS6Ca+i/cT+PJB0Js9pyxqJ7fHH
         sGcVlnF60m4R7bj8Bf4hNpXZQb9ZiRhyHYuoXGpG2/DhDDnF+6t+NIoZW7jm63cvAcoU
         6TvXv44ztJK3G1QAdq2L9OqgcQ8qbHbKTphJSj0Ush5gl3I5097DASJ81WpThwu1RM8Q
         eDUGQFbKJ9gJjAZo+qMsFfebFgpaJivYVxqOV+RyiYJiSUy1bLwom7mPAbZoxN1c8h8Q
         z5KA==
X-Gm-Message-State: AOJu0Yxb/lgY7az+fCnktlY4rmBOHPc93oh3or9Tv60qjEWBAn2OqzgQ
	WfOjk57H/WBhB64XUxoc+muzSUJ/qQ2aWHnVt6bLGJ4HvHPFDuXWw7ovYeY8Ik6tkcaJ/uD/ALB
	SLjQh
X-Gm-Gg: ASbGncvV6RUW/XrYB9/y5THlg0OvquyG6kSMIPMbOXO93Es7cWAf+uZxyLcVEwxF6Yr
	/RWiOgv63ordG78AvUzjXnhJyhzO7cpI5qd4GE/+yQYakt4WU1rG5cpw5vBRddhKZTMeRheQWr5
	HkEI7foJNHtfrJrTa8rLkO99llzfk0vc10KOvMdSNsaKq+/PVJWQye1LcYrqvvlNAE3RhTHCiKe
	MbiUNu6WOXCzJNEu5RQytE62exII4qCf9xZVFn/4nsJiCrXDiVp43y6wxVELKGSz5gyz9q/ACBq
	4XxO1lzcQzgT9g5J9UXVmliAsONYWA/enk2Nu74tzITVajzxendxFScjFKn3KonNcSZUl5fMX6J
	adyhIvdOQj5HJPuD99O5ub33njAL3TBTEFzNNO85pdY8Br6KjSZ47gNeB+KbGu6YluHJ08Imti3
	RAB6cnd80qCG9Tpel8DwDegV2qww4O9AnBPA7pP0W18L8nmYL/S25QNSWHVhyVNg==
X-Google-Smtp-Source: AGHT+IE1x6QGfrVhzRyYIFiRU9A+KGW8sJZxobPw5EEF7+Y7BEFRpoTzq+Y0p4B03LahgORzJV/ZPQ==
X-Received: by 2002:a05:600c:a43:b0:47a:75b6:32c with SMTP id 5b1f17b1804b1-47a7b17cfdfmr44385185e9.2.1765303673189;
        Tue, 09 Dec 2025 10:07:53 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/pv: Inline domain_set_alloc_bitsize() into it's single caller
Date: Tue,  9 Dec 2025 18:07:50 +0000
Message-Id: <20251209180750.2145364-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Prior to commit 02e78311cdc6 ("x86/domctl: Make XEN_DOMCTL_set_address_size
singleshot") (Xen 4.9, 2016), it was possible for domains to switch to being
compat, and back again.  Since then however, becoming compat is a singleton
action that can't be undone.

From the context it's clear to see the is_pv_32bit_domain() check is
redundant, and from the singleton nature being the only place setting
physaddr_bitsize, there's no need to check it for being 0.

No functional change.

Co-developed-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Grygorii Strashko <grygorii_strashko@epam.com>

Split out of series to simplify things.

bloat-o-meter reports:

  add/remove: 0/1 grow/shrink: 1/0 up/down: 25/-96 (-71)
  Function                                     old     new   delta
  switch_compat                                447     472     +25
  domain_set_alloc_bitsize                      96       -     -96

which will mostly be the LFENCEs embedded in is_pv_32bit_domain().
---
 xen/arch/x86/include/asm/mm.h |  1 -
 xen/arch/x86/pv/domain.c      |  6 +++++-
 xen/arch/x86/x86_64/mm.c      | 13 -------------
 3 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 17ca6666a34e..9438f5ea0119 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -619,7 +619,6 @@ void __iomem *ioremap_wc(paddr_t pa, size_t len);
 
 extern int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm);
 
-void domain_set_alloc_bitsize(struct domain *d);
 unsigned int domain_clamp_alloc_bitsize(struct domain *d, unsigned int bits);
 #define domain_clamp_alloc_bitsize(d, bits) domain_clamp_alloc_bitsize(d, bits)
 
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 9c4785c187dd..11db6a6d8396 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -254,7 +254,11 @@ int switch_compat(struct domain *d)
             goto undo_and_fail;
     }
 
-    domain_set_alloc_bitsize(d);
+    if ( MACH2PHYS_COMPAT_NR_ENTRIES(d) < max_page )
+        d->arch.physaddr_bitsize =
+            /* 2^n entries can be contained in guest's p2m mapping space */
+            fls(MACH2PHYS_COMPAT_NR_ENTRIES(d)) - 1 + PAGE_SHIFT;
+
     recalculate_cpuid_policy(d);
 
     d->arch.x87_fip_width = 4;
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index d4e6a9c0a2e0..42fd4fe4e9b5 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1119,19 +1119,6 @@ int handle_memadd_fault(unsigned long addr, struct cpu_user_regs *regs)
     return ret;
 }
 
-void domain_set_alloc_bitsize(struct domain *d)
-{
-    if ( !is_pv_32bit_domain(d) ||
-         (MACH2PHYS_COMPAT_NR_ENTRIES(d) >= max_page) ||
-         d->arch.physaddr_bitsize > 0 )
-        return;
-    d->arch.physaddr_bitsize =
-        /* 2^n entries can be contained in guest's p2m mapping space */
-        fls(MACH2PHYS_COMPAT_NR_ENTRIES(d)) - 1
-        /* 2^n pages -> 2^(n+PAGE_SHIFT) bits */
-        + PAGE_SHIFT;
-}
-
 unsigned int domain_clamp_alloc_bitsize(struct domain *d, unsigned int bits)
 {
     if ( (d == NULL) || (d->arch.physaddr_bitsize == 0) )
-- 
2.39.5


