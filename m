Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id M8UsIvX5FmqKzwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 16:04:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FA45E5896
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 16:04:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320492.1587776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSErm-0006Oo-KT; Wed, 27 May 2026 14:04:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320492.1587776; Wed, 27 May 2026 14:04:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSErm-0006N7-HO; Wed, 27 May 2026 14:04:14 +0000
Received: by outflank-mailman (input) for mailman id 1320492;
 Wed, 27 May 2026 14:04:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vishal.moola@gmail.com>) id 1wSErl-0005xO-6N
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 14:04:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSErk-00ExJg-Hn
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 16:04:12 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a16f9d1-2eae-0a2a0a5409dd-0a2a4509c408-40
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 16:04:12 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a16f9db-2497-0a2a45090019-d1558030ec61-3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 16:04:12 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-49056b9f04aso55003195e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 07:04:12 -0700 (PDT)
Received: from fedora (cpc92878-cmbg18-2-0-cust539.5-4.cable.virginm.net.
 [86.16.54.28]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-45edb558f52sm6693771f8f.14.2026.05.27.07.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 07:04:11 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779890651; x=1780495451; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03ZuRm/Jbp4iqH3ao4SMCilmZCLzKIEi1dSL1yhjeUw=;
        b=JeRb+rtnqDMTYvvL2CzbdmwEtiIbbyPkjx9hB9xZK9cXfKYKYexakuAa3eCM9XLovM
         uBvfhrve+KJshuP7gfKTq9rNIUxDNfUD81mczlIVtvIk4GgZJeLmxodp2/Eq1qa9lv5b
         GjIJHfPQt4imIn/YTaL2Y+x4PLksFElfO8eNa6PCZDiJwpw3ElR4VGH4ubD+YmCmSGUm
         LdG/R8uY5uSg5xzFW6ubCypQ5GLwsHTpG7qo4QrR2tN8Nv0hwikTZFUBlniZClYS1uuY
         UbFVN6F/JgzcknXPw7Esfeszl8DAAj7dwbAFzeRvMsoIR5YziRhg8tj/+l4PR60ffs1T
         LCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779890651; x=1780495451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=03ZuRm/Jbp4iqH3ao4SMCilmZCLzKIEi1dSL1yhjeUw=;
        b=lFibBIr2f9F+46fAegCMfr+0uJCsa/3Fc1ahuKujkb9C0Nxa2UtlN5llm7cnxdFEjD
         xOhBhbROYAz0KO5VXrLbNT1hURQBSOKCW3ZLLYCTcz2COXQOUe+A7QDJ+hn5BBrBagJX
         W9xf7nxyitlbmnr5GkZ5X5rmPxwOMcvep9R1ol80SgXFypy8Q8Q6WPC4Ds1O0ldagSl+
         AVM8F1A3BQv9O3ey2h4SiAKJdCl1VAAzD5VzC3P03tdGk+4Exd+Yv/+piHpZ9X6BYPZn
         rhcw3zXJAmcsNfobHvQlM2+ty7PFf0VMwitVchod3CaAjwfZvKSfCE/tmXZ15mqLe3NF
         LbOg==
X-Forwarded-Encrypted: i=1; AFNElJ9RyEEjDtyXNVVHjmoqKTx0kj920OO9h1guEEMo6q6via6dGuQfFtInjFtBt/sslI12HipdRJgYSxw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJbIxn9JLQWJ0abAd5C70Nz4bgdP6nseGlw1tetQ4shHpJ8ay3
	ENPfQpBFp4oYzQXoCuN1aNOS9f9gQW6PsCSZMFkKSSPFCvvrwLtwLHNb
X-Gm-Gg: Acq92OFc2oww7v8gp5g4KVvEjwWVW46qIxFk9kR0If0b0g7dQMERJ78ZBEwTCmIRPWn
	jkf68rPo/ik0dD98STSgldWRtro/PQoc44XboebIHHPZwhQxbkKL6k3d7I2GLIY09hfXpgrTs/Z
	bLCVclRdT/NzjquyjvXjrppo2PiafqsMsH4ZOtY/jNIEqsIme5kSLagESooqSl2EJJvoEqft1Tc
	F4asoCqe1Yw8lA6ZTm1Ba3icWqIjz3kz2Wik3LMUHArcDl9JkLVSxLsCztlohpSgtjvZYTtcw0V
	bxlOcroOXwY8kgfyHbPIto+yLlI6b6g2BtvCVL2eVPC4zB4AnwM+K14rxF5baGcaUGJrrlSNOiu
	ihWyMx6ZzaHp+VgGM3fhYEnBswhsq9ivCU5P2q84fvUTc+shC/+lQLL2hRPfRxErBO20JkcaYLM
	FCUml8n8Gwapls9ONhGqnnTJK1l/omyHxzJ6YPfnTkZtDuNSbo5zrlhuozghe1sbmjBayyR4KQs
	VfXZzACbGrXbLm7b+1c3foKl0ajvpsDiQ==
X-Received: by 2002:a05:600c:4ecc:b0:48a:56de:d62a with SMTP id 5b1f17b1804b1-490424b3c7fmr352223335e9.11.1779890651300;
        Wed, 27 May 2026 07:04:11 -0700 (PDT)
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
	Vishal Moola <vishal.moola@gmail.com>
Subject: [PATCH 2/9] x86/mm/pat: Convert __set_pmd_pte() to ptdescs
Date: Wed, 27 May 2026 15:03:09 +0100
Message-ID: <20260527140316.294621-3-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527140316.294621-1-vishal.moola@gmail.com>
References: <20260527140316.294621-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1779890652-8B193A53-D8C1918D/0/0
X-purgate-type: clean
X-purgate-size: 1093
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dave.hansen@intel.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:rppt@kernel.org,m:baolu.lu@linux.intel.com,m:xen-devel@lists.xenproject.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:vishal.moola@gmail.com,m:vishalmoola@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[vishalmoola@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,lists.xenproject.org,redhat.com,alien8.de,zytor.com,infradead.org,suse.com,oracle.com,gmail.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishalmoola@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.960];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 80FA45E5896
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert __set_pmd_pte() to ptdescs in preparation for the eventual
splitting of ptdescs from struct page.

Signed-off-by: Vishal Moola <vishal.moola@gmail.com>
---
 arch/x86/mm/pat/set_memory.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 3b9032a3f315..93cb71451ce2 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -890,15 +890,15 @@ static void __set_pmd_pte(pte_t *kpte, unsigned long address, pte_t pte)
 	set_pte_atomic(kpte, pte);
 
 	if (IS_ENABLED(CONFIG_X86_32)) {
-		struct page *page;
+		struct ptdesc *ptdesc;
 
-		list_for_each_entry(page, &pgd_list, lru) {
+		list_for_each_entry(ptdesc, &pgd_list, pt_list) {
 			pgd_t *pgd;
 			p4d_t *p4d;
 			pud_t *pud;
 			pmd_t *pmd;
 
-			pgd = (pgd_t *)page_address(page) + pgd_index(address);
+			pgd = (pgd_t *)ptdesc_address(ptdesc) + pgd_index(address);
 			p4d = p4d_offset(pgd, address);
 			pud = pud_offset(p4d, address);
 			pmd = pmd_offset(pud, address);
-- 
2.54.0


