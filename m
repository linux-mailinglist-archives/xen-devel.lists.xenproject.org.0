Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5018FB053B2
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 09:51:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043651.1413650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaRo-0007s0-RF; Tue, 15 Jul 2025 07:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043651.1413650; Tue, 15 Jul 2025 07:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaRo-0007qS-Nm; Tue, 15 Jul 2025 07:51:32 +0000
Received: by outflank-mailman (input) for mailman id 1043651;
 Tue, 15 Jul 2025 07:51:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1tvk=Z4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ubaNH-0003TX-44
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 07:46:51 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd84e609-614f-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 09:46:49 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4560add6cd2so19291995e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 00:46:49 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b5e8dc3a62sm14241523f8f.40.2025.07.15.00.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 00:46:48 -0700 (PDT)
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
X-Inumbo-ID: dd84e609-614f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752565608; x=1753170408; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2u/mTpjY75q/4fRak1rYYFNSLDDKWWpemS53s4G/FNQ=;
        b=ernwfpa7g03Y/rxfjbxxM4p/M3H+AJQFCdqGeOToEEONDm1ZZyia5fshQ5sChCxmC/
         wuCNC9oyWNoo9wDk9nWc+dLkpRDhinvfqFj8JJONMcXA/QDkb0j1u0IDbDLm6CR4U9+7
         mn8vnVSxKdROyndiBCMYQa7EaJy3Cm/EArNaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752565608; x=1753170408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2u/mTpjY75q/4fRak1rYYFNSLDDKWWpemS53s4G/FNQ=;
        b=p3TEleTihLje8nVhuBCro3J6OCiKr+VnTgphTIgV6LqpWc6u/GO8Dcm0d2umKuS37C
         wae1tUPKnBBKAi/7v0OZZOgcttKQF7oIjrwKPUPZkAsxY/WizxkpwKRcrDMKyEcNLVsR
         cUyM83NsRJvBbqw+y2H4n0NSMXOCQzyoEnqSlxDf81JjR62E3AsB7p44ncyx/mrBRZYf
         RuySVPHhKZkjqbzmSkzUfwZNHWosRTD+OKa8a9NOYoG5Sq9rfQD1CsZiRTbs+qNPv1mb
         fJONdiTfLWdqpXaQLSUIu6zwgnDhbBNmgrir0VloI+qmQHbm7H0NUKVa4E9exTJXKNWW
         D7Zw==
X-Gm-Message-State: AOJu0Ywx4XuTFdxAufvIhn1zBnO17T/1OdZ9I7O+Unq9W8r42uxdtSKV
	FFmy0BJnASr51LkPmAgPfZGwZ84hn5ukbJpMXjOJ1HcJyKHHXHliOKFJEvtu6hxfJyZf8SSQtPy
	xUylj
X-Gm-Gg: ASbGncsHfPkrm7V0k2DzgSphM3r0ZQ/5SCE9o71wrV/LDPTcmc429b74SlV/Z67exKY
	xJccMVCCcuxeztjZo+KydMntaGSz5jo4ejFUGhVAPTxs0g5+6P/UKmJjSVYiWl+Bzxv6d4TOJM7
	tKJZs4iByS212SQxg0WAHuEJ5Z/s+c1AJs85fL4S151UE0OpmZn8dsYoou1LvMg9hni2ruA+9Zj
	ggVwNbRJ7+jf2QkL68Z/ClIsyso72OIEDZyf00q6ssM9mF3kZ/8OXGgdAyMFelp24kpHPMQU2Qp
	P8v9UlDZhQNJwseOQSr694OB1Q6dQg5tpyu//H3aCgdlrmGoyuc08B9/sUCtJ0Jn1TmSfHBSfRq
	umpyL7tSwWxp36gASr+NZYPzvqCSgp8g+xjZYFWvCe3HOq8y7T8s8E7lgRmVZ+T6SeA==
X-Google-Smtp-Source: AGHT+IGhgg6FKJgWsfptZtrH80eiTMt8XY75N/F3nOIkkpS6JIKXUi1qUtOg2v6phR0MRk3KuxjDYA==
X-Received: by 2002:a05:600c:1f0d:b0:453:6c45:ce14 with SMTP id 5b1f17b1804b1-45625e33fc9mr22038965e9.4.1752565608516;
        Tue, 15 Jul 2025 00:46:48 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 2/2] x86/ept: batch PML p2m type-changes into single locked region
Date: Tue, 15 Jul 2025 09:45:59 +0200
Message-ID: <20250715074559.73197-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250715074559.73197-1-roger.pau@citrix.com>
References: <20250715074559.73197-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current p2m type-change loop in ept_vcpu_flush_pml_buffer() relies on
each call to p2m_change_type_one() taking the p2m lock, doing the change
and then dropping the lock and flushing the p2m.  Instead take the p2m lock
outside of the loop, so that calls to gfn_{,un}lock() inside
p2m_change_type_one() just take the p2m lock recursively, and more
importantly, the flush is deferred until the p2m is unlocked in
ept_vcpu_flush_pml_buffer().

No functional change intended in the end result of
ept_vcpu_flush_pml_buffer(), however a possibly noticeable performance
improvement is expected.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/mm/p2m-ept.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index 015911ba6c80..62fc8e50689f 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -1375,6 +1375,8 @@ static void cf_check ept_flush_pml_buffers(struct p2m_domain *p2m)
 
 void ept_vcpu_flush_pml_buffer(struct vcpu *v)
 {
+    struct domain *d = v->domain;
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
     uint64_t *pml_buf;
     unsigned long pml_idx;
 
@@ -1401,6 +1403,12 @@ void ept_vcpu_flush_pml_buffer(struct vcpu *v)
     else
         pml_idx++;
 
+    /*
+     * Take the lock outside of the loop, so all the type changes are done
+     * inside of the same locked region and the EPT flush is deferred until the
+     * end of the loop.
+     */
+    p2m_lock(p2m);
     for ( ; pml_idx < NR_PML_ENTRIES; pml_idx++ )
     {
         unsigned long gfn = pml_buf[pml_idx] >> PAGE_SHIFT;
@@ -1413,11 +1421,12 @@ void ept_vcpu_flush_pml_buffer(struct vcpu *v)
          * are very rare, and additional cost is negligible, but a missing mark
          * is extremely difficult to debug.
          */
-        p2m_change_type_one(v->domain, gfn, p2m_ram_logdirty, p2m_ram_rw);
+        p2m_change_type_one(d, gfn, p2m_ram_logdirty, p2m_ram_rw);
 
         /* HVM guest: pfn == gfn */
-        paging_mark_pfn_dirty(v->domain, _pfn(gfn));
+        paging_mark_pfn_dirty(d, _pfn(gfn));
     }
+    p2m_unlock(p2m);
 
     unmap_domain_page(pml_buf);
 
-- 
2.49.0


