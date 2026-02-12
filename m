Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yL5NEgj+jWm0+AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:21:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F116B12F4E6
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:21:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229474.1535430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZRR-0006Kw-Bn; Thu, 12 Feb 2026 16:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229474.1535430; Thu, 12 Feb 2026 16:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZRR-0006Gx-4R; Thu, 12 Feb 2026 16:21:21 +0000
Received: by outflank-mailman (input) for mailman id 1229474;
 Thu, 12 Feb 2026 16:21:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XV9D=AQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqZRP-0006Fi-Dy
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 16:21:19 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbe61651-082e-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 17:21:17 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4359108fd24so27355f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 08:21:17 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783e5c635sm13938426f8f.37.2026.02.12.08.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Feb 2026 08:21:16 -0800 (PST)
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
X-Inumbo-ID: dbe61651-082e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770913277; x=1771518077; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=756p0sgqElUf/O7m5v8k7wVt+/PfhKAVifuQ4bDjN4Q=;
        b=kyw34+E7slAVZfUbtJhcKV+vlYckGky3hgXGk2+r+fa15vnfFxxoUl6VdeUNGqrii7
         XVmVl/nWvrjEkObDUjimkpaawuEBtrMSyEVuln09OGMH8ENlBMsny/DRIr4UOejFmC8U
         +Mnn6GAppPExM4RAZXZbE3/6kiGvPGIQ9DaeJcuzslRarpvqFUY25MeCd1qPc6s9dmva
         L6nGXctZqNZxTLyxfqfU+/3GL8VTcaTIjbnyJgeIB8QNz+292PfW2rWeqwHceY/zj9Iq
         OYsMORPKiD4+vTBqjf+qWkEJE17D+tpj62AB2FE/M+1COnIIY9T4dKsOICDOefyHmu7J
         +bOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770913277; x=1771518077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=756p0sgqElUf/O7m5v8k7wVt+/PfhKAVifuQ4bDjN4Q=;
        b=cJPcuKFBnEqtZnKLmr8R2v2G8d/4AG6De4twy7uL29w3Clg9Xefl/ZWMSULJ6IyVZc
         VXEDSQoiEZ4dSN5Ot6WVVwRCofwSNTnY92R4DVgLdmApSyEkCBXLAv4zhz7bghpXeFY3
         6J0bnvGrkkV63M2FO7HblZqMmvqU4YCJF5Mq8fWA7OUa7xjKbANn6Xdzm4MZ3UjWxwtW
         zF/rsVmJDGELOjW445w4aH6/R1yDrx4pU0HYC/m7NEMMc/oSM7fcURq+j8B4n13J/JB8
         TixyqUzqsgmTrs6a1Y6jJB5TH/P/kXvrJT8WFYp1cKRFQr0A/frZadPvehT/vd96uR0Q
         AwMQ==
X-Gm-Message-State: AOJu0YyWUsIZTcroBztzcIrbuXABGp8+gWMZwWt9ISd9W6U1C2uCvnj+
	oeb5V1kQtQAnsogVx5OmHkd07TcW4aa1YtnagkZe/wOZT+mFwh64P9E9P6nACDWW
X-Gm-Gg: AZuq6aKMkIlVn1fLdHrq9ZLmUXZC2u1lCktekrkchfrXd0ddE+s3YHE6KSIZDIBoq14
	g8KavzYmEuGGGk3uLpg9vg0wblmsLLkel3E/JcW0UUMSxXLy4N9jmZhhFeJw2f4CF93c8BHnUyV
	a4ZHV6nNtY7fIGB9pG3aYJfgXxPSJnF3Li5cHgJrl2CHVzaDMKzbpAyS7SF3L/RumAb2V0VzqdM
	tHwIZSWZFoOJl78HQJNFTZX0sRicyuAVxiUzMfDwx5aMz7zMW4Z5rkqGJccocjgiAudJQFzF42p
	uXFdmb4AGhGAPDHhbBP471lsFAK/3HbvIPVBC2FgKrk9aerYlWM9bs4HxfM0OYg0/RSS/w39Ndi
	oqFyIhTBs+lb8bx06QZKg6a6FYV1f+f2L5WpbRuulsQS+RZlhDtjFrMcNnSbRxbJdw+aMScgFgI
	zgPuA/mKhVWpBoB3lt5lSEWvaS+i5d9krfpMm6d5bKYvM7CsOTDppUofhqYsO1xvYnAiBHfTWrH
	J6hKE3b
X-Received: by 2002:a5d:5f55:0:b0:437:712a:fac9 with SMTP id ffacd0b85a97d-4378aa04146mr6020186f8f.23.1770913276791;
        Thu, 12 Feb 2026 08:21:16 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 1/6] xen/riscv: implement get_page_from_gfn()
Date: Thu, 12 Feb 2026 17:21:02 +0100
Message-ID: <04eee3ae5e8aadf8c7f0b873ba24ce38220e8fa2.1770821989.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770821989.git.oleksii.kurochko@gmail.com>
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: F116B12F4E6
X-Rspamd-Action: no action

Provide a RISC-V implementation of get_page_from_gfn(), matching the
semantics used by other architectures.

For translated guests, this is implemented as a wrapper around
p2m_get_page_from_gfn(). For DOMID_XEN, which is not auto-translated,
provide a 1:1 RAM/MMIO mapping and perform the required validation and
reference counting.

The function is implemented out-of-line rather than as a static inline,
to avoid header ordering issues where struct domain is incomplete when
asm/p2m.h is included, leading to build failures:
  In file included from ./arch/riscv/include/asm/domain.h:10,
                   from ./include/xen/domain.h:16,
                   from ./include/xen/sched.h:11,
                   from ./include/xen/event.h:12,
                   from common/cpu.c:3:
  ./arch/riscv/include/asm/p2m.h: In function 'get_page_from_gfn':
  ./arch/riscv/include/asm/p2m.h:50:33: error: invalid use of undefined type 'struct domain'
     50 | #define p2m_get_hostp2m(d) (&(d)->arch.p2m)
        |                                 ^~
  ./arch/riscv/include/asm/p2m.h:180:38: note: in expansion of macro 'p2m_get_hostp2m'
    180 |         return p2m_get_page_from_gfn(p2m_get_hostp2m(d), _gfn(gfn), t);
        |                                      ^~~~~~~~~~~~~~~
  make[2]: *** [Rules.mk:253: common/cpu.o] Error 1
  make[1]: *** [build.mk:72: common] Error 2
  make: *** [Makefile:623: xen] Error 2

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Does it make sense to make this function almost fully generic?

It looks like most of the logic here is architecture-independent and identical
across architectures, except for the following points:

1. ```
   if ( likely(d != dom_xen) )
   ```

   This could be made generic by introducing paging_mode_translate() for ARM
   and defining it as `(d != dom_xen)` there.

2. ```
   if ( t )
       *t = likely(d != dom_io) ? p2m_ram_rw : p2m_mmio_direct_io;
   ```

   Here, only `p2m_mmio_direct_io` appears to be architecture-specific. This
   could be abstracted via a helper such as `dom_io_p2m_type()` and used here
   instead.
---
---
 xen/arch/riscv/include/asm/p2m.h |  8 ++------
 xen/arch/riscv/p2m.c             | 28 ++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 0cdd3dc44683..c68494593fd9 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -171,12 +171,8 @@ typedef unsigned int p2m_query_t;
 #define P2M_ALLOC    (1u<<0)   /* Populate PoD and paged-out entries */
 #define P2M_UNSHARE  (1u<<1)   /* Break CoW sharing */
 
-static inline struct page_info *get_page_from_gfn(
-    struct domain *d, unsigned long gfn, p2m_type_t *t, p2m_query_t q)
-{
-    BUG_ON("unimplemented");
-    return NULL;
-}
+struct page_info *get_page_from_gfn(struct domain *d, unsigned long gfn,
+                                    p2m_type_t *t, p2m_query_t q);
 
 static inline void memory_type_changed(struct domain *d)
 {
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 275c38020ae2..f5b03e1e3264 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -1557,3 +1557,31 @@ void p2m_handle_vmenter(void)
         flush_tlb_guest_local();
     }
 }
+
+struct page_info *get_page_from_gfn(struct domain *d, unsigned long gfn,
+                                    p2m_type_t *t, p2m_query_t q)
+{
+    struct page_info *page;
+
+    /*
+     * Special case for DOMID_XEN as it is the only domain so far that is
+     * not auto-translated.
+     */
+    if ( likely(d != dom_xen) )
+        return p2m_get_page_from_gfn(p2m_get_hostp2m(d), _gfn(gfn), t);
+
+    /* Non-translated guests see 1-1 RAM / MMIO mappings everywhere */
+
+    if ( t )
+        *t = p2m_invalid;
+
+    page = mfn_to_page(_mfn(gfn));
+
+    if ( !mfn_valid(_mfn(gfn)) || !get_page(page, d) )
+        return NULL;
+
+    if ( t )
+        *t = likely(d != dom_io) ? p2m_ram_rw : p2m_mmio_direct_io;
+
+    return page;
+}
-- 
2.52.0


