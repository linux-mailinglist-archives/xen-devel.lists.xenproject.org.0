Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKOPGm7F8GkpYgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:34:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2E94870FB
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:34:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296328.1572753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjVY-0005UK-JA; Tue, 28 Apr 2026 14:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296328.1572753; Tue, 28 Apr 2026 14:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjVY-0005RW-GI; Tue, 28 Apr 2026 14:33:52 +0000
Received: by outflank-mailman (input) for mailman id 1296328;
 Tue, 28 Apr 2026 14:33:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wHjVX-0005Hz-Hc
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 14:33:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHjVV-00H4ZK-Bv
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 16:33:50 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69f0c541-5cb7-0a2a0a5109dd-0a2a45029a8e-46
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:33:50 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69f0c54e-af86-0a2a45020019-d1558033ed58-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:33:50 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso127801705e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 07:33:50 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a774b6300sm19302145e9.16.2026.04.28.07.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 07:33:49 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777386830; x=1777991630; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W36qV0SA1npKJlsQHzH0mfE/cYCMTL3Qqk5/oPvpTxk=;
        b=VNh849KylgCiDivitlJHGeNTbHsB/Bjw2xCWB1kn86dqIjjLj+EjxwAwlUaoKbk2eI
         Lv+UiMIBi3K4DbTbX5b9Bc7vUw7XAX1JvCd8cgMjg1byX8q0NvIuE4GtkcjM7R01elnI
         d38SLZL4IZHYoXCVV1TrH3XsCFtRuu+aglO16iEN0RsFfPKG35vlbl9h1sHkzslv1onl
         OUPiJ4Lrn+OZMhvNFKL+sRlWmISSyIv0n3KxaiMmpF3PHd3DPNRl9Fl8lW2GCKJ/XxGo
         q+ATbDPg2n7L7IiFz+dMsCEyj127DlR3cJ9GLewtY8L/RuX06xcz2/mUBezI2h7MyXWq
         LTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386830; x=1777991630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W36qV0SA1npKJlsQHzH0mfE/cYCMTL3Qqk5/oPvpTxk=;
        b=f+Q++6e7rE1p8OeiVkRVlVrNo5JAMhd01znanWGZPNErOjstAzS5aSWWqNWXpe7wfB
         98IVpPjV9rNjb+i8qlWtYezjLhbC6O6y4uFRtntgmf4dZenERfOC1W8e5WBog45AqQ6I
         5Q1YSbEcSHzXBFox89eCAq79pau+RNhj7GpC0cC2KTMwRAm73a4fySiBVsK6AAExuhaE
         eP8bOv8u2GN2NUx4ChzfmrtGqKQ7Kh1N1aa68b0XoVDNPTzzl1TxO40tkiq5B9ciq1TJ
         1NnfqtWRaIFBgvg0poG0/3MfkUp0CF4OYbSjE5pqlLAi0EHO9i6Cz46F0JDJlLDAEYD/
         uWhQ==
X-Gm-Message-State: AOJu0Yw8ynlV/tJ8IMvYaQLH3sG9OM6y21zdfzDalZVilExJdFQQX0uV
	nYsvPyT/LLeHsAZoEATwvaKem14vgRHxPHKffqYR711ACSrDIEWY4rFVAunOVg==
X-Gm-Gg: AeBDieuO5k107UZqWdKgOdRUzIi0KR6O3tfuaVeCL4J8jWhGx15qT301y+HbAycL5vQ
	9+CWRZokhC/jf0W/9qYgwfu2OS7Zxkf3qKR1S1WBo84/pq82UPpAyluOiPkustLRJsi1eyenYcL
	vgdt+BXToJ3tO9G9R7WhHCeezDfD+DXgTNXk1LaI7SWpuKZMeGwbOEZ1jO0rBiQwjD3jE0kSsE9
	9KaH2uDL6qNHlZAOuDAqOKkcTwYTqVdXUEm6MpWoUfjxM+7nk1p7eapshy0JxcLg7GKmDYKITes
	8eq3RlcY+7bRTO/gxi+23kXibNP5DqNYwavMGVjcDsW+PmPJqYka1Zl9trcP5Ax8YCIN+WQwyvI
	9bsWy2e09GvauwXF224OkieovIXXrr14W9rL7Dl4sdBqotbI37htauwvo18a0OpMkTtA/1rcK3j
	rRLV9ZFAlAV00QTXelPxEOh/j7LG/hPFRS/0boaE/ve0Nnj4TLwJXlBPjDudQebgv511oGCyW4X
	RIw
X-Received: by 2002:a05:600c:840f:b0:483:7903:c3b1 with SMTP id 5b1f17b1804b1-48a77b21749mr52038275e9.20.1777386829946;
        Tue, 28 Apr 2026 07:33:49 -0700 (PDT)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 01/11] xen: arm: fix len type for guest copy functions
Date: Tue, 28 Apr 2026 16:33:30 +0200
Message-ID: <e29e6176063f8e7c612a4bfa44ac072d7a686b81.1777303844.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777303844.git.oleksii.kurochko@gmail.com>
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1777386830-82D6F161-7B11A211/10/73395122804
X-purgate-type: spam
X-purgate-size: 5388
X-Rspamd-Queue-Id: 1B2E94870FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.596];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

Widen the len argument of copy_to_guest_phys_flush_dcache() and the
copy_to_guest_phys_cb typedef from unsigned int to unsigned long, as
the function can be used to copy large blobs such as the initrd which
may exceed 4GB. Update the internal copy_guest() len argument to
unsigned long accordingly.

Change the type for local variable size in copy_guest() to avoid
compilation error because of type mismatch.

raw_* wrappers above copy_guest() keep returning unsigned long to
avoid type narrowing; it is not an issue for raw_*'s len argument
to remain 'unsigned int' since the assignment to copy_guest()'s wider
unsigned long parameter is safe and there is no raw_* users who
are using a value bigger than what can fit into 'unsigned int'.

Fixes: 2986481b3d9e6 ("xen/arm: guest_copy: Extend the prototype to pass the vCPU")
Fixes: 5302bd490bea7 ("xen/arm: Introduce copy_to_guest_phys_flush_dcache")
Fixes: d07b7369aa65b ("xen/common: dom0less: introduce common domain-build.c")
Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4:
- Add Fixes: tags.
- Add "arm:" prefix to commit subject.
- Add Reviewed-by: Jan Beulich <jbeulich@suse.com>.
- Avoid using of min_t.
---
Changes in v3:
 - Correct the declaration of copy_to_guest_phys_cb() instead of return
   'unsigned int' to be in sync with len argument, the type of len argument
   is changed on 'unsigned long' as initrd could be pretty big and also its
   size is stroed in 'paddr_t' which is 'unsigned long'.
 - Update copy_guest() prototype to avoid trancation bug for len argument.
 - Revert prototype changes for raw_* wrappers above copy_guest() as they
   should keep returning unsigned long to avoid type narrowing; it is not
   an issue for raw_*'s len argument to remain 'unsigned int' since the
   assignment to copy_guest()'s wider unsigned long parameter is safe.
 - Change the type for local variable size in copy_guest() to avoid
   compilation error because of type mismatch.
 - Add Reported-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v2:
 - New patch.
---
---
 xen/arch/arm/guestcopy.c                | 6 +++---
 xen/arch/arm/include/asm/guest_access.h | 2 +-
 xen/include/xen/fdt-domain-build.h      | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/guestcopy.c b/xen/arch/arm/guestcopy.c
index fdb06422b8e9..86f1c9d0e318 100644
--- a/xen/arch/arm/guestcopy.c
+++ b/xen/arch/arm/guestcopy.c
@@ -53,7 +53,7 @@ static struct page_info *translate_get_page(copy_info_t info, uint64_t addr,
     return page;
 }
 
-static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
+static unsigned long copy_guest(void *buf, uint64_t addr, unsigned long len,
                                 copy_info_t info, unsigned int flags)
 {
     /* XXX needs to handle faults */
@@ -65,7 +65,7 @@ static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
     while ( len )
     {
         void *p;
-        unsigned int size = min(len, (unsigned int)PAGE_SIZE - offset);
+        unsigned long size = min(len, PAGE_SIZE + 0UL - offset);
         struct page_info *page;
 
         page = translate_get_page(info, addr, flags & COPY_linear,
@@ -136,7 +136,7 @@ unsigned long raw_copy_from_guest(void *to, const void __user *from,
 unsigned long copy_to_guest_phys_flush_dcache(struct domain *d,
                                               paddr_t gpa,
                                               void *buf,
-                                              unsigned int len)
+                                              unsigned long len)
 {
     return copy_guest(buf, gpa, len, GPA_INFO(d),
                       COPY_to_guest | COPY_ipa | COPY_flush_dcache);
diff --git a/xen/arch/arm/include/asm/guest_access.h b/xen/arch/arm/include/asm/guest_access.h
index 18c88b70d7ec..c13cbec55b65 100644
--- a/xen/arch/arm/include/asm/guest_access.h
+++ b/xen/arch/arm/include/asm/guest_access.h
@@ -14,7 +14,7 @@ unsigned long raw_clear_guest(void *to, unsigned int len);
 unsigned long copy_to_guest_phys_flush_dcache(struct domain *d,
                                               paddr_t gpa,
                                               void *buf,
-                                              unsigned int len);
+                                              unsigned long len);
 
 int access_guest_memory_by_gpa(struct domain *d, paddr_t gpa, void *buf,
                                uint32_t size, bool is_write);
diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
index bc7744270c8f..6ad9e8fd1642 100644
--- a/xen/include/xen/fdt-domain-build.h
+++ b/xen/include/xen/fdt-domain-build.h
@@ -48,7 +48,7 @@ static inline int get_allocation_size(paddr_t size)
 typedef unsigned long (*copy_to_guest_phys_cb)(struct domain *d,
                                                paddr_t gpa,
                                                void *buf,
-                                               unsigned int len);
+                                               unsigned long len);
 
 void initrd_load(struct kernel_info *kinfo,
                  copy_to_guest_phys_cb cb);
-- 
2.53.0


