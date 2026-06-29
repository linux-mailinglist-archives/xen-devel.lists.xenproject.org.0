Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O2IsGoHAQmoSAgoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 20:59:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FC36DE2C8
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 20:59:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rJi8Kbs6;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1348004.1605865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHCC-0001bY-Ni; Mon, 29 Jun 2026 18:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348004.1605865; Mon, 29 Jun 2026 18:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHCC-0001Zf-Jj; Mon, 29 Jun 2026 18:59:04 +0000
Received: by outflank-mailman (input) for mailman id 1348004;
 Mon, 29 Jun 2026 18:59:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vishal.moola@gmail.com>) id 1weHCB-0001OI-LK
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 18:59:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weHCB-005gAN-23
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 20:59:03 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a42c068-e002-0a2a0a5209dd-0a2a450cac46-18
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 20:59:03 +0200
Received: from [209.85.210.169] (helo=mail-pf1-f169.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a42c075-f399-0a2a450c0019-d155d2a9d102-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 20:59:02 +0200
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-8453427d3f4so1684764b3a.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 11:59:02 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net
 ([2601:644:937c:6c90:6d4e:7b2d:4a39:fb0c])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-8479ff8f959sm223955b3a.3.2026.06.29.11.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 11:59:00 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782759541; x=1783364341; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33MwGvLoP/1miTKHGEtP2qQNmfdum0WOqxZBRNP9hxM=;
        b=rJi8Kbs6otyK4QyzoEfEiYuybhAnD36aWC6ncAtIHz4Qzs8rJ2MKaO9V7ASwd7zsA4
         LOj7XL7AVJSX+gXMfAgI5wph5GLyJczj88gh8UmNDj47c7EB5vRjSou9NLyAdwC/Hc8M
         62glB8K9yLXd9cD4zeZzlCld4LPnYliX2B0/w7H1VPIVORNWO13m9nd05ECO5G2GBXBX
         mLpKGYkPZuQLeMB3uVvSeK0rL8JxEOd04rOdbmEZmqT/PXD1mFwW49/qnXZjrHa6bR43
         7Xv8ar/LrAwwKgAC/VuhZABHDAwb8V26JUw+gdB84zJdxGPYgiIIaWnWa7hd319/uoh1
         0ItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782759541; x=1783364341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=33MwGvLoP/1miTKHGEtP2qQNmfdum0WOqxZBRNP9hxM=;
        b=bVHNIrG5nprS8ZKdNJb0a44ayzE9j0AlZCcLHKbON3VIGUGgwG3RuN+c4x80JCUWwo
         yiBw3kW30M2qLcd/tlo0lpWc8yKToIgy17rRrfnm9NYahRNzjGV0efIfqMxV95qMHKXi
         WInjJe0vVQy8nGlToU5+G3M1TjFl8B6/Idsi7E1/oeUNstBOvSY+ovZtLjn+awPLXu3t
         LxZ2aBmvbU2llHoBZeoQj36wsf9foxNHJZ9TJw1uRRHyY7P6KpfpcEHrVorTfqmbpzgd
         KvrfPFzikrLoXuZr8S15SqAkWwK2lJ+SrrKXPBGNntPz+iXhYvivRNgJXEbCE4PPq8fr
         PHfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/CbOE2x2tfNZA0O0hAO6ERWvYNHgBCb8l/bce7BIcjIvPEBdIx3Zx7R71ICgOeBL7rE9CzUqpAn+w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yybr6UBxNQhqo1zYD0efysplE1Oty7fg3P1elSy4/8Vmx6AlE4t
	80MX0RIjmHqYja54R1mZ/hHxDquiFmUaD0dyo5eOD5vrCSsjW2PK7dK1
X-Gm-Gg: AfdE7ckFKu/PFvV5tgiuV6KbLj8RL6/ZHG4cvFtARQstLw/OB9T6aeRMUV4l5QzvGa4
	7IXJsjKMdVGWp0Tn8OWQyl8CTp33M1mnM31cl6AJfedE7AXZHoo/KZbDqETXGqcQgbMYlm4cny+
	uoC5OYRrj42DegdcBJLIsr6mBuvQP6ubcafkevh8cYf+U5stvTiKBAxFHxoeW4OKWbaDSABP3rZ
	koVJEIdbZpDsFIptvyNw30/7JRihMHdNCLI6njm+x8jnp2m8xs6RwhPNepOzk9vpHsq83J2xrfc
	NnMou1HeWGCTZhPXJ+BDPSDD+oVsysKGIWRpSy6Tf1neLYYv+M9e3hqdVZPryUJLw0KyU0uk2j+
	Tfi/zp0t8MTjJMq61vzz0tuJVWFKGCy++rnphchyBgD8oqrdI/khMebaAEdle354QAkwovKCjrF
	g0l1HJowyN0knrgG+k6RTb0cwf9qFNl9HwCvII1vEppdJXlKXCnGgXzR/HeGu893Hm7H8EvhY=
X-Received: by 2002:a05:6a00:3d55:b0:846:4d4c:23f8 with SMTP id d2e1a72fcca58-8479eed8099mr524689b3a.1.1782759541059;
        Mon, 29 Jun 2026 11:59:01 -0700 (PDT)
From: Vishal Moola <vishal.moola@gmail.com>
To: Dave Hansen <dave.hansen@intel.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Mike Rapoport <rppt@kernel.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	xen-devel@lists.xenproject.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Vishal Moola <vishal.moola@gmail.com>,
	William Kucharski <william.kucharski@linux.dev>
Subject: [PATCH v2 4/9] x86/mm: Convert arch_sync_kernel_mappings() to ptdescs
Date: Mon, 29 Jun 2026 11:57:37 -0700
Message-ID: <20260629185742.126987-5-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629185742.126987-1-vishal.moola@gmail.com>
References: <20260629185742.126987-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1782759543-90F2BD51-BAF8B81A/0/0
X-purgate-type: clean
X-purgate-size: 1435
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,lists.xenproject.org,redhat.com,alien8.de,zytor.com,infradead.org,suse.com,oracle.com,gmail.com,linux.dev];
	FORGED_SENDER(0.00)[vishalmoola@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dave.hansen@intel.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:rppt@kernel.org,m:baolu.lu@linux.intel.com,m:xen-devel@lists.xenproject.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:vishal.moola@gmail.com,m:william.kucharski@linux.dev,m:vishalmoola@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishalmoola@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1FC36DE2C8

Convert arch_sync_kernel_mappings() to ptdescs in preparation for
the eventual splitting of ptdescs from struct page.

Following this patch, we can successfully boot a 32-bit x86 kernel with
separately allocated ptdescs.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: William Kucharski <william.kucharski@linux.dev>
Signed-off-by: Vishal Moola <vishal.moola@gmail.com>
---
 arch/x86/mm/fault.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index 45b99c3b1442..c31ffeac0714 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -275,17 +275,17 @@ void arch_sync_kernel_mappings(unsigned long start, unsigned long end)
 	for (addr = start & PMD_MASK;
 	     addr >= TASK_SIZE_MAX && addr < VMALLOC_END;
 	     addr += PMD_SIZE) {
-		struct page *page;
+		struct ptdesc *ptdesc;
 
 		spin_lock(&pgd_lock);
-		list_for_each_entry(page, &pgd_list, lru) {
+		list_for_each_entry(ptdesc, &pgd_list, pt_list) {
 			spinlock_t *pgt_lock;
 
 			/* the pgt_lock only for Xen */
-			pgt_lock = &pgd_page_get_mm(page)->page_table_lock;
+			pgt_lock = &pgd_page_get_mm(ptdesc_page(ptdesc))->page_table_lock;
 
 			spin_lock(pgt_lock);
-			vmalloc_sync_one(page_address(page), addr);
+			vmalloc_sync_one(ptdesc_address(ptdesc), addr);
 			spin_unlock(pgt_lock);
 		}
 		spin_unlock(&pgd_lock);
-- 
2.54.0


