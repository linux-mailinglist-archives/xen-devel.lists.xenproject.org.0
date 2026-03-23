Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNeUDLFqwWkVTAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 17:30:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D200C2F8355
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 17:30:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259438.1552755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4iAi-0005FP-Sk; Mon, 23 Mar 2026 16:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259438.1552755; Mon, 23 Mar 2026 16:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4iAi-0005EL-Np; Mon, 23 Mar 2026 16:30:32 +0000
Received: by outflank-mailman (input) for mailman id 1259438;
 Mon, 23 Mar 2026 16:30:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n/J7=BX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w4iAh-0005Bu-0d
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 16:30:31 +0000
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a50b212-26d5-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Mar 2026 17:30:28 +0100 (CET)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b982b0889d8so51035266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 09:30:28 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f8be14sm536248166b.17.2026.03.23.09.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 09:30:19 -0700 (PDT)
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
X-Inumbo-ID: 9a50b212-26d5-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774283428; x=1774888228; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3mjawTYIGyz+a/A4MWs03CayIMQKo5R8nTd3he3QdU=;
        b=ddARcxFXWI4/edkuYvzzxPzfeFuXPpfSNMNCb/whA0zH+jzmWESul/oUjkadqcuZIG
         wf6WhD9/E8T9eozwk2ojnvuWquVfmdFyoScrUUbrSdb4vdOjubD4K/hbUiNmll9KPTR3
         PN+LJJ866LDjW/x5N+e9zxUVjyyrQSR2Eha4SfD0/1iBPZcsvmgDj3sXSqZ008TCI8Fm
         fSDdqMkFBQo9/GXmLhiIUfT/jGjlRdr9WFZiG37AAcZhxDe2KuGlX7FNXd3tQx+4g26J
         pAEZklp+Sy3X6FlaTeJdFjL3uQdJGGK/p/IO+RE+eCUUYSl5R0RUYuN8/QQRGGym2aJj
         ScMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283428; x=1774888228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z3mjawTYIGyz+a/A4MWs03CayIMQKo5R8nTd3he3QdU=;
        b=MYNpYBY2YVmuSEyj2cJJaW5ogOTKs0fF2XrFV5DU/RqH2O7jygumGeEllP2OvjjjDR
         rmtj1BsIPzarzgdOjK2pyPs2Njm1mrpbXdFCMjhj5jKRaoRYAHon6nQBu207zXv3aKku
         EfpXhVKiXvqz6d+81sx4FHgMTTHDoUpr0LSdiUja9X0dAnVfb0WgEtzBpJW4kgh1V+tc
         jUR87uwlk8/8KHGHSDiouD7pv9Htn8yt/ERrvMfTEqFoUKORS975vXPT++8EmhbjWzH+
         BSRciWl/OZCY+lfSvzYmDzdS8bLAtffYZXgzowyNtmZKmJE1gIAU88IZwnRX/OAWrBUw
         yaCA==
X-Gm-Message-State: AOJu0YxK+7SNWQz4Tdyc6/Cd0zwChnR6TDVNyzUQTMpRx331JyTVSKO3
	xrrf3RxAEhTMW6mHdSXVAuOj7BfBW/RSlYtOdRSTKoXj64PJX5Xs7ss4igAUEg==
X-Gm-Gg: ATEYQzyfi6SUmzjJPixlR27IkFRtk2oxEvlQf6ocKy7E0QZ4zualTuFEEyJSUqEHtRe
	H9yedyy+/Q+KvmfLji78u0JgUnAhkS9l6AguoiTvMJYSHd59leLDzPAK3qu8D1slu3xB/Bnzypl
	4F8KERByAwG62OHN/pfruuPhwL0vR9gx/0AXxMuZ61XXGF6hzCUsJz3M3nUYfF58olB54SbpAVh
	WL2wfEcvHR3j2G6Z10HYf8XLQ0xcTAzyvhdzIjDMJbVpdGhpyilEb0SzewH3BRuhA/lkLOmko8G
	AMKJy3q9HEn7SGqjW5u7WTNOO67yZCxTaoQa85V4QqdMLxeQi/NYJ9lvz018WeoR7aUAr0tReOB
	fRbSz0VKZeYPusZc1WOULTI5JFNP/x231A1LIpeYoMtuo2TicJ2L+XkmQdqxx+sSykRxlnHbr/F
	sRz44wlK+r1zsGsdTMk7jHiIsqs7fmewVrZKSMOLEgtFg11q51jEAruve/MYawfwmN90Ztdm7AJ
	U07
X-Received: by 2002:a17:906:88f:b0:b97:eae9:d45e with SMTP id a640c23a62f3a-b982f398aacmr718179466b.50.1774283426156;
        Mon, 23 Mar 2026 09:30:26 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 02/11] xen: return proper type for guest access functions
Date: Mon, 23 Mar 2026 17:29:43 +0100
Message-ID: <d990acbfe642a8c5c8d892e9dd43381c086e8c81.1774281309.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774281309.git.oleksii.kurochko@gmail.com>
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com,raptorengineering.com,wdc.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D200C2F8355
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The copy_to_guest_phys_cb function pointer declaration was based on Arm
code. However, guest access functions use copy_guest(), which should
return an unsigned int as it returns either 0 or len which is unsigned int,
so it does not make sense to return unsigned long.

Update other functions that use copy_guest() to return unsigned int, to
match its return type.

Also update guest access functions for other architectures, as their
declarations/definitions are likely copied from the Arm implementation,
so update them as well to keep everything in sync.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
 xen/arch/arm/guestcopy.c                  | 24 +++++++++++------------
 xen/arch/arm/include/asm/guest_access.h   | 18 ++++++++---------
 xen/arch/ppc/include/asm/guest_access.h   | 10 +++++-----
 xen/arch/riscv/include/asm/guest_access.h |  6 +++---
 xen/arch/riscv/stubs.c                    |  8 ++++----
 xen/include/xen/fdt-domain-build.h        |  8 ++++----
 6 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/xen/arch/arm/guestcopy.c b/xen/arch/arm/guestcopy.c
index fdb06422b8e9..11ad80320f4c 100644
--- a/xen/arch/arm/guestcopy.c
+++ b/xen/arch/arm/guestcopy.c
@@ -53,8 +53,8 @@ static struct page_info *translate_get_page(copy_info_t info, uint64_t addr,
     return page;
 }
 
-static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
-                                copy_info_t info, unsigned int flags)
+static unsigned int copy_guest(void *buf, uint64_t addr, unsigned int len,
+                               copy_info_t info, unsigned int flags)
 {
     /* XXX needs to handle faults */
     unsigned int offset = addr & ~PAGE_MASK;
@@ -107,36 +107,36 @@ static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
     return 0;
 }
 
-unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
+unsigned int raw_copy_to_guest(void *to, const void *from, unsigned int len)
 {
     return copy_guest((void *)from, (vaddr_t)to, len,
                       GVA_INFO(current), COPY_to_guest | COPY_linear);
 }
 
-unsigned long raw_copy_to_guest_flush_dcache(void *to, const void *from,
-                                             unsigned int len)
+unsigned int raw_copy_to_guest_flush_dcache(void *to, const void *from,
+                                            unsigned int len)
 {
     return copy_guest((void *)from, (vaddr_t)to, len, GVA_INFO(current),
                       COPY_to_guest | COPY_flush_dcache | COPY_linear);
 }
 
-unsigned long raw_clear_guest(void *to, unsigned int len)
+unsigned int raw_clear_guest(void *to, unsigned int len)
 {
     return copy_guest(NULL, (vaddr_t)to, len, GVA_INFO(current),
                       COPY_to_guest | COPY_linear);
 }
 
-unsigned long raw_copy_from_guest(void *to, const void __user *from,
-                                  unsigned int len)
+unsigned int raw_copy_from_guest(void *to, const void __user *from,
+                                 unsigned int len)
 {
     return copy_guest(to, (vaddr_t)from, len, GVA_INFO(current),
                       COPY_from_guest | COPY_linear);
 }
 
-unsigned long copy_to_guest_phys_flush_dcache(struct domain *d,
-                                              paddr_t gpa,
-                                              void *buf,
-                                              unsigned int len)
+unsigned int copy_to_guest_phys_flush_dcache(struct domain *d,
+                                             paddr_t gpa,
+                                             void *buf,
+                                             unsigned int len)
 {
     return copy_guest(buf, gpa, len, GPA_INFO(d),
                       COPY_to_guest | COPY_ipa | COPY_flush_dcache);
diff --git a/xen/arch/arm/include/asm/guest_access.h b/xen/arch/arm/include/asm/guest_access.h
index 18c88b70d7ec..a1a4b1c36269 100644
--- a/xen/arch/arm/include/asm/guest_access.h
+++ b/xen/arch/arm/include/asm/guest_access.h
@@ -4,17 +4,17 @@
 #include <xen/errno.h>
 #include <xen/sched.h>
 
-unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len);
-unsigned long raw_copy_to_guest_flush_dcache(void *to, const void *from,
-                                             unsigned int len);
-unsigned long raw_copy_from_guest(void *to, const void *from, unsigned int len);
-unsigned long raw_clear_guest(void *to, unsigned int len);
+unsigned int raw_copy_to_guest(void *to, const void *from, unsigned int len);
+unsigned int raw_copy_to_guest_flush_dcache(void *to, const void *from,
+                                            unsigned int len);
+unsigned int raw_copy_from_guest(void *to, const void *from, unsigned int len);
+unsigned int raw_clear_guest(void *to, unsigned int len);
 
 /* Copy data to guest physical address, then clean the region. */
-unsigned long copy_to_guest_phys_flush_dcache(struct domain *d,
-                                              paddr_t gpa,
-                                              void *buf,
-                                              unsigned int len);
+unsigned int copy_to_guest_phys_flush_dcache(struct domain *d,
+                                             paddr_t gpa,
+                                             void *buf,
+                                             unsigned int len);
 
 int access_guest_memory_by_gpa(struct domain *d, paddr_t gpa, void *buf,
                                uint32_t size, bool is_write);
diff --git a/xen/arch/ppc/include/asm/guest_access.h b/xen/arch/ppc/include/asm/guest_access.h
index 654693191106..922848032604 100644
--- a/xen/arch/ppc/include/asm/guest_access.h
+++ b/xen/arch/ppc/include/asm/guest_access.h
@@ -6,34 +6,34 @@
 
 /* TODO */
 
-static inline unsigned long raw_copy_to_guest(
+static inline unsigned int raw_copy_to_guest(
     void *to,
     const void *from,
     unsigned int len)
 {
     BUG_ON("unimplemented");
 }
-static inline unsigned long raw_copy_to_guest_flush_dcache(
+static inline unsigned int raw_copy_to_guest_flush_dcache(
     void *to,
     const void *from,
     unsigned int len)
 {
     BUG_ON("unimplemented");
 }
-static inline unsigned long raw_copy_from_guest(
+static inline unsigned int raw_copy_from_guest(
     void *to,
     const void *from,
     unsigned int len)
 {
     BUG_ON("unimplemented");
 }
-static inline unsigned long raw_clear_guest(void *to, unsigned int len)
+static inline unsigned int raw_clear_guest(void *to, unsigned int len)
 {
     BUG_ON("unimplemented");
 }
 
 /* Copy data to guest physical address, then clean the region. */
-static inline unsigned long copy_to_guest_phys_flush_dcache(
+static inline unsigned int copy_to_guest_phys_flush_dcache(
     struct domain *d,
     paddr_t gpa,
     void *buf,
diff --git a/xen/arch/riscv/include/asm/guest_access.h b/xen/arch/riscv/include/asm/guest_access.h
index 7cd51fbbdead..3f4c68e4da20 100644
--- a/xen/arch/riscv/include/asm/guest_access.h
+++ b/xen/arch/riscv/include/asm/guest_access.h
@@ -2,9 +2,9 @@
 #ifndef ASM__RISCV__GUEST_ACCESS_H
 #define ASM__RISCV__GUEST_ACCESS_H
 
-unsigned long raw_copy_to_guest(void *to, const void *from, unsigned len);
-unsigned long raw_copy_from_guest(void *to, const void *from, unsigned len);
-unsigned long raw_clear_guest(void *to, unsigned int len);
+unsigned int raw_copy_to_guest(void *to, const void *from, unsigned len);
+unsigned int raw_copy_from_guest(void *to, const void *from, unsigned len);
+unsigned int raw_clear_guest(void *to, unsigned int len);
 
 #define __raw_copy_to_guest raw_copy_to_guest
 #define __raw_copy_from_guest raw_copy_from_guest
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index acbb5b9123ea..d1f78b7c59fa 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -201,13 +201,13 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
 
 /* guestcopy.c */
 
-unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
+unsigned int raw_copy_to_guest(void *to, const void *from, unsigned int len)
 {
     BUG_ON("unimplemented");
 }
 
-unsigned long raw_copy_from_guest(void *to, const void __user *from,
-                                  unsigned int len)
+unsigned int raw_copy_from_guest(void *to, const void __user *from,
+                                 unsigned int len)
 {
     BUG_ON("unimplemented");
 }
@@ -266,7 +266,7 @@ void udelay(unsigned long usecs)
 
 /* guest_access.h */
 
-static inline unsigned long raw_clear_guest(void *to, unsigned int len)
+static inline unsigned int raw_clear_guest(void *to, unsigned int len)
 {
     BUG_ON("unimplemented");
 }
diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
index 886a85381651..194d69303f56 100644
--- a/xen/include/xen/fdt-domain-build.h
+++ b/xen/include/xen/fdt-domain-build.h
@@ -44,10 +44,10 @@ static inline int get_allocation_size(paddr_t size)
     return get_order_from_bytes(size + 1) - 1;
 }
 
-typedef unsigned long (*copy_to_guest_phys_cb)(struct domain *d,
-                                               paddr_t gpa,
-                                               void *buf,
-                                               unsigned int len);
+typedef unsigned int (*copy_to_guest_phys_cb)(struct domain *d,
+                                              paddr_t gpa,
+                                              void *buf,
+                                              unsigned int len);
 
 void initrd_load(struct kernel_info *kinfo,
                  copy_to_guest_phys_cb cb);
-- 
2.53.0


