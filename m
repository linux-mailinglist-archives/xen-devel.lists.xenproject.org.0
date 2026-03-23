Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dGJaOqdqwWkVTAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 17:30:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDEF2F8322
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 17:30:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259434.1552747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4iAX-0004wS-LB; Mon, 23 Mar 2026 16:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259434.1552747; Mon, 23 Mar 2026 16:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4iAX-0004ts-HZ; Mon, 23 Mar 2026 16:30:21 +0000
Received: by outflank-mailman (input) for mailman id 1259434;
 Mon, 23 Mar 2026 16:30:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <oleksii.kurochko@gmail.com>) id 1w4iAV-0004tJ-M3
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 16:30:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4iAV-009kq3-1e
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 17:30:19 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69c16a97-bab6-0a2a0a5309dd-0a2a4503b4ec-6
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 17:30:19 +0100
Received: from [209.85.218.51] (helo=mail-ej1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69c16a9a-1947-0a2a45030019-d155da33b922-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 17:30:18 +0100
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b936331786dso483276166b.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 09:30:18 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f8be14sm536248166b.17.2026.03.23.09.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 09:30:09 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20230601 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774283418; x=1774888218; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LuRVqlpFi1rpvJNwjCUxIjgt4P93RXegQDELQdKOhc=;
        b=P+/egHRbfmt6nU4zj+dn97cFhaE4jKP/Ca4zPCD+RUKBbeneJeFBCVy+qoTESBGMSJ
         auf0VJTSte8coVX0LFmk0M2GwbCSE0pKWjpIfZudcEsfkvJwtq7e+vvKHPYRGPdQGCPw
         6s9MGBA1anak9WuljlKAGOkO9+RjMvdJ5VmY1M+FSZxeYCK2ALYqu9mz0jJdkIT254gq
         UFhiMtgn0O/8M1ZkolAtJasc0xHVg+dHS4zfTz2CLuP5M9lfW2ztKVQFpzp54HjxhRPu
         VGbJTaUzRyJoZQ4eGsQhAbGfO0Ty5gAuyopC7z8XsfRrWG5+VbgmijLBwvllAREMUCQv
         MZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283418; x=1774888218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4LuRVqlpFi1rpvJNwjCUxIjgt4P93RXegQDELQdKOhc=;
        b=hCN3KJcCXUKl3fzBpRMbkfQAPFWZEcQuXx8ifXPxtRX31dphJs+7oXUmz2Nu8bTd+/
         Jucp5rxp64l/b6BvjrOehdQKQeEWezPgJ+0mk3TeJ3DDg7ktOiFCaJU2eIXAst9oQ/SP
         feotIp+vaM6/sdAN+ZGqLojkinAQMbdivz8fmTC9EbF5pHXuUG+ngEbDr7GHmQ9Ds/m8
         U1hgaxU1gwVEV5fONgdGsKpoannKkKdpJXZRPzBbFwWex5ltQMMuIxt6zTTtDS5zK0lG
         kSatX36UYnOQEWhKwWrre5mPhqqPNdgT78REmR5P6dqT2k52ZcDqlu8OWhv08rJtvzbc
         mKNw==
X-Gm-Message-State: AOJu0YzBfUdYk8Ye5HqRFomeRc3x+yPPfKd/sGuFyU4+ILd+EnEixi3n
	0rRTl8aaMn5HGsCFHwnfzhaVGK3kZvko+I9PX0ybHYrN2rbw2DvTI0cywdM6kA==
X-Gm-Gg: ATEYQzzxd3lypRXP5gVTI7zItD0V586+zulx6g9/XJexak5gb7p18D7Efd11gtGxNDM
	dKIgrnMbaCYsAToiGT3P2Sk1Jz2xbZDFP7ZNdrHwOGnClL4HjV+fwXmMHJRTKxlwQDdbupwawvY
	vUgF4iR0KpTvUH2Foq8pWdtT2cxd6g3Ceb1/yvvL0KOGiaWWmhCIyChNBpXlKOauJzaYCaTE8Ts
	gvlCfIgaQJBATFkMI2fbi3/AzVdNh68Vym84AWmEcvysT4auHXOX3jIAnCZneADA/WZbN8rD7CN
	L5YZfuP4sH+AlXhOsQcCeYZa5qrnPYY0N3HcLZWz4EFZcv2y3DrQG1JrjQEX6uK6uCmH7boNama
	Dwfr1eBRsxsVHGiTMWEYxlKj12UEM2otwiYWDyT+eT2Yj0J2+iKFraSw+NNRDyAL8R/tpPJWOIg
	kZi3/vujRv7JiHa7eUxLYH/24cZNcwYW/YHUoh5gePevGyNGtXmG9LRPmykelsr6k60Q==
X-Received: by 2002:a17:907:1c1f:b0:b98:3d79:40c0 with SMTP id a640c23a62f3a-b983d794e9cmr811089066b.12.1774283417745;
        Mon, 23 Mar 2026 09:30:17 -0700 (PDT)
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
Subject: [PATCH v2 01/11] xen/riscv: implement get_page_from_gfn()
Date: Mon, 23 Mar 2026 17:29:42 +0100
Message-ID: <ba0ea599c4ced7fca0b8f5dd66bb7ffb277f3a4f.1774281309.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774281309.git.oleksii.kurochko@gmail.com>
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1774283419-4A05C72C-5C73FF64/0/0
X-purgate-type: clean
X-purgate-size: 3842
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3BDEF2F8322
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Changes in v2:
 - Align implemntation with Arm's get_page_from_gfn().
 - Update the first comment about DOMID_XEN to mention that isn't "normal"
   domain instead of no-autotranslated.
 - Drop footer after commit message.
---
 xen/arch/riscv/include/asm/p2m.h |  8 ++------
 xen/arch/riscv/p2m.c             | 29 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 60f27f9b347e..54ea67990f06 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -164,12 +164,8 @@ typedef unsigned int p2m_query_t;
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
index 89e5db606fc8..11beaeead5ac 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -1534,3 +1534,32 @@ void p2m_handle_vmenter(void)
      * won't be reused until need_flush is set to true.
      */
 }
+
+struct page_info *get_page_from_gfn(struct domain *d, unsigned long gfn,
+                                    p2m_type_t *t, p2m_query_t q)
+{
+    struct page_info *page;
+    p2m_type_t p2mt;
+
+    /* Special case for DOMID_XEN as it isn't "normal" domain */
+    if ( likely(d != dom_xen) )
+        return p2m_get_page_from_gfn(p2m_get_hostp2m(d), _gfn(gfn), t);
+
+    if ( !t )
+        t = &p2mt;
+
+    *t = p2m_invalid;
+
+    /* DOMID_XEN sees 1-1 RAM. The p2m_type is based on the type of the page */
+    page = mfn_to_page(_mfn(gfn));
+
+    if ( !mfn_valid(_mfn(gfn)) || !get_page(page, d) )
+        return NULL;
+
+    if ( page->u.inuse.type_info & PGT_writable_page )
+        *t = p2m_ram_rw;
+    else
+        BUG_ON("unimplemented. p2m_ram_ro hasn't been introduced yet");
+
+    return page;
+}
-- 
2.53.0


