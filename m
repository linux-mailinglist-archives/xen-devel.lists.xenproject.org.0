Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 47IqC4LAQmoTAgoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 20:59:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBAC6DE2CD
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 20:59:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gj9669pz;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1348005.1605874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHCF-0001tu-0o; Mon, 29 Jun 2026 18:59:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348005.1605874; Mon, 29 Jun 2026 18:59:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHCE-0001qW-RR; Mon, 29 Jun 2026 18:59:06 +0000
Received: by outflank-mailman (input) for mailman id 1348005;
 Mon, 29 Jun 2026 18:59:05 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vishal.moola@gmail.com>) id 1weHCD-0001in-AK
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 18:59:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weHCC-004Xi0-NU
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 20:59:04 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a42c068-5cb7-0a2a0a5109dd-0a2a45038812-26
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 20:59:04 +0200
Received: from [209.85.210.176] (helo=mail-pf1-f176.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a42c077-ec1a-0a2a45030019-d155d2b0bdf1-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 20:59:04 +0200
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-845e363246aso1633938b3a.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 11:59:04 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net
 ([2601:644:937c:6c90:6d4e:7b2d:4a39:fb0c])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-8479ff8f959sm223955b3a.3.2026.06.29.11.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 11:59:02 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782759543; x=1783364343; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2T/pMX6h7HjGEpjcwH/mP3eLvrxdsYJ5WpoUpvOL0D0=;
        b=gj9669pzP99erGDk3+tru/AzXzRccMuBa8gaBgJSrKTgmPs81Nr6APZxKwp5VWxL4A
         6OKUm6XRs69F/hqRCA3dqAHlGb64T2dkoZc4v4KaU88woHKHIIleuv1h0TltYJC2EOwY
         uOWvNhjTssSI/tvo3s2dP0Td4mLNEkYcS8foLWa2aF2FiEfHufCU4EEJ98ainzXIQbAw
         ZcORoU/mwPBlQ7qlLmLLJkmmPUvaNf4vp8Zi/orzs4p+wzKg6kxJnEfKT+jrU927xG6D
         KwWYlbZqWkVOJHO7DHv9IIkPHX9jvNuepeXeaqGEpqSa7ItfC9qmcP8DBRbI24Z/IeQ3
         ZLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782759543; x=1783364343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2T/pMX6h7HjGEpjcwH/mP3eLvrxdsYJ5WpoUpvOL0D0=;
        b=B9TDtG1NqO6+yt11yXjFMrHz9UIjDsStIvHKqrTzauHImChfDc5mhLWJFaidFMtFCm
         fefNLAKQUoooMgV6KSuBa4dzxZevmRhkfRnL0XSIIPjzeX/dKKKBDJvMowVMOE5Jj3W1
         y/41yG+6089NPHN0iKqMEq9N4MmjOw0TiupaCqGWorI78INCmqiY/Fj6ZlceCVfzm2b4
         DVg5Gd65maA6OQAQAm5oAbWVlxhvWjTwppajH6EYxwf697tV9QU/42QEbR9uX2ykq0as
         UzLC+bng9S53MBrywkqYVIaFVxvjy10bmWiDu13MCxesEb2CXNKs8yjOr7i/6Zp7A6SM
         bGSA==
X-Forwarded-Encrypted: i=1; AFNElJ+whWPDp6NdUwNQZFyYuejLPmYmFNYtUAm9xgsallQ1DVuD5FECBN/uyGmin/ol6oZAm135W3qvTyQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzhIjgEdnPjsY3ESKJYgeyjPl9n5PvHrCPh9VOX2meAKftwWHAQ
	RaQBFZaKeqbuYi59kjFzPAZfR9jSNZq4jSk0qWpgT5pmt9ZaLBXFWBeR
X-Gm-Gg: AfdE7ck8pkpN5kFTVdBR0WnsuIWQS7EcqplgrJOwHQ0MU6biSyGK2GUCdGANBBbpI7k
	nrzK65xWkycQEKW2TMycmAqlepsp6LIW8mEpfcYBiDqFLOBNqXa0XBgXVaU3Z3ZaqkkRy/uRo5k
	dnb+3TfRE4WlUSuQ2JvXVkZcCsmoCG3grpvL6xn+0zgdGXGKGrQ8tVo2+oNsH3v2i8uuBEX8eQ5
	ZSKxtMe7VlcK8uSlJyFqWWV4mkwV7yf34lRxZlhfFlXIEn7DDoWqN9TtIMgz3L8olYhrA/Y6BZh
	AbLq8r8KuE7C+zuiL5cLbPeteHdGnfRHlOHUmcOYE5gs/P2jnvqQOQ5669qawmxl1YTexkoGIMP
	dR9sG3dI4VDXG58kAsGtcaSu6N/Vh0KgIYXoVwFzFxoQOrzifGH+omv4K9yIx/T01K5asJdCEU+
	vB4OCge+RF87y5moJSAX7G2GXXibsfnTCqfXEcjZKPLoJTFiGr+3MoYNzNIO4dvwxEVG+c2rs=
X-Received: by 2002:a05:6a00:23c4:b0:845:3fea:96c with SMTP id d2e1a72fcca58-8479f145d69mr553340b3a.21.1782759542633;
        Mon, 29 Jun 2026 11:59:02 -0700 (PDT)
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
Subject: [PATCH v2 5/9] x86/mm: Convert sync_global_pgds_l5() to ptdescs
Date: Mon, 29 Jun 2026 11:57:38 -0700
Message-ID: <20260629185742.126987-6-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629185742.126987-1-vishal.moola@gmail.com>
References: <20260629185742.126987-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1782759544-B71295D1-F729429A/0/0
X-purgate-type: clean
X-purgate-size: 1527
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
X-Rspamd-Queue-Id: CCBAC6DE2CD

Convert sync_global_pgds_l5() to ptdescs in preparation for the
eventual splitting of ptdescs from struct page.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: William Kucharski <william.kucharski@linux.dev>
Signed-off-by: Vishal Moola <vishal.moola@gmail.com>
---
 arch/x86/mm/init_64.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index df27379d4bb4..e89b51aea2cf 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -136,7 +136,7 @@ static void sync_global_pgds_l5(unsigned long start, unsigned long end)
 
 	for (addr = start; addr <= end; addr = ALIGN(addr + 1, PGDIR_SIZE)) {
 		const pgd_t *pgd_ref = pgd_offset_k(addr);
-		struct page *page;
+		struct ptdesc *ptdesc;
 
 		/* Check for overflow */
 		if (addr < start)
@@ -146,13 +146,13 @@ static void sync_global_pgds_l5(unsigned long start, unsigned long end)
 			continue;
 
 		spin_lock(&pgd_lock);
-		list_for_each_entry(page, &pgd_list, lru) {
+		list_for_each_entry(ptdesc, &pgd_list, pt_list) {
 			pgd_t *pgd;
 			spinlock_t *pgt_lock;
 
-			pgd = (pgd_t *)page_address(page) + pgd_index(addr);
+			pgd = (pgd_t *)ptdesc_address(ptdesc) + pgd_index(addr);
 			/* the pgt_lock only for Xen */
-			pgt_lock = &pgd_page_get_mm(page)->page_table_lock;
+			pgt_lock = &pgd_page_get_mm(ptdesc_page(ptdesc))->page_table_lock;
 			spin_lock(pgt_lock);
 
 			if (!pgd_none(*pgd_ref) && !pgd_none(*pgd))
-- 
2.54.0


