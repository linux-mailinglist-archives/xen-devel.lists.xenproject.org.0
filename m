Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q3osNYfAQmoXAgoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 20:59:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C979D6DE2DE
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 20:59:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=NkC5mqeb;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1348010.1605901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHCK-0002kn-8x; Mon, 29 Jun 2026 18:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348010.1605901; Mon, 29 Jun 2026 18:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHCK-0002hI-2z; Mon, 29 Jun 2026 18:59:12 +0000
Received: by outflank-mailman (input) for mailman id 1348010;
 Mon, 29 Jun 2026 18:59:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vishal.moola@gmail.com>) id 1weHCI-0002Q6-AI
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 18:59:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weHCH-00DrOt-NO
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 20:59:09 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a42c064-2eae-0a2a0a5409dd-0a2a4504d80a-46
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 20:59:09 +0200
Received: from [209.85.210.176] (helo=mail-pf1-f176.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a42c07c-a01d-0a2a45040019-d155d2b0f074-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 20:59:09 +0200
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-845c92bc464so2199622b3a.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 11:59:09 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net
 ([2601:644:937c:6c90:6d4e:7b2d:4a39:fb0c])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-8479ff8f959sm223955b3a.3.2026.06.29.11.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 11:59:06 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782759547; x=1783364347; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CqbRLQXqHRkpiVjsMMKe6YOb40PaFb2scBTkKxGJIlw=;
        b=NkC5mqebi2wIMBJOyMnHcnmJX9UciS9x6NkQwm5tvo4iUJI7fD/5JGRjbuTfkyQUah
         6IlrG2xkA08GynL9PWvmyzRc/6j9n5OI5+BT4BlhKgly0GT9o7/aWNkTp070HmE36jcH
         HlDRFieCzUa8ZgUap+FyVexRi+IPwpAQ64s2gmZRDibmnfve6j1BFJlP+kY3T+Ll9gLx
         RDiR+xpOfctg8zN5NZsKP6I6amuDqSMQNx0BqGdlTScu7tbI0pmK6ooW4WiAfPkDokhs
         0qHYnhuH3q7+nZAiVDRrN7v1u6GwopDudA0PnS5toznTRJu9UPCvqQsW7i/O2R/WH9xE
         5mQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782759547; x=1783364347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CqbRLQXqHRkpiVjsMMKe6YOb40PaFb2scBTkKxGJIlw=;
        b=WDoLAhqKoK5Nbyj1ZlRX/keCPrq2KRRR3O3xtXnqAEH4hDJY3PkHb55HwT1JakE7dF
         KwTlsusmYvOp5X9E/OSuVL7z/M0z3HJFiMejzP4u4p3NwNMMonBkwB4QODi5KQSlLqpi
         LEl6RdTkCugPLNYI2vRFRjV+YFWyykTZviv6mwf28Q8rTdjWOI+nTU3WHUBmSmA3AUD4
         QAD4/WLGI1m49y9RNUMYjFEGR7FQ+xNlRjQRp4WfLc2AwKJ52o4vPNRQqEO4iaHsggR+
         Bd+EnHsBUsxIVnMXDHXpbYc8C8SRwqxK0WHOAjuAjHxQRo/ZvZSgHj4krPja9bMe49Ld
         XLww==
X-Forwarded-Encrypted: i=1; AHgh+RpsXt5tBHRpfbXOVWyEa3JydmwI0VpX62rqxvP0mv2Qlt4GxU/joH6voIw9JEV/i4LafsrgeGkF+6A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzapgyEgJkUaVApxgCqDDGjSXEX4ICHuiDXEuPpW5cshu6jHEFK
	k1iarVCY6NjKjL1kd2ykTXj+z1ThbcQI2LTDzUMMIDqC1+ZIw4nMwxHF
X-Gm-Gg: AfdE7cmQrh0b+sSm3XGTp0ALWx0HVcMSzsYMzaWpMnH/7IzS5yWoeWIya5BZozj62Bw
	ZKOP3uD6hmjfYdVqfQya5Bu2FAEwh5TaGKjsp26cHcdvqyCbDeRXmrMGseaxu5eH+9z+NcCFZOU
	dERk3Pm7oJysTV7BUgRKO69jL9HemN3pBrpdIBSzWe5yfn2sjyNwTHccioYpplgzHBNbCtkRMuX
	lqauytPG/svFtz8uvD1phiAwBPeBnpGku9ZBTUmRTTyXSrNAIY4t0WEEf4bRIX/Cnq2yangEHGh
	Gq+stGHDFEZX9cEj1OWNSlcYZybYY1pMkXMOXcBrHSLk2hFKarsU0/8lZGWkBt52eXWPAO2iMGz
	kQpSTWamoslX4ABS6aLr94ZsdZe9oXO6ImEjtaxmOvoCaT7BpmGwteBW5Fgh3hy43KVBstl836k
	1H3B7G/UubrC4FXOyBE54HQwUa9kFeVUbarsy40NT5DJznxkwWkxZdusuQ4aJfKl0k4yYQQno=
X-Received: by 2002:a05:6a00:2913:b0:845:d729:4477 with SMTP id d2e1a72fcca58-8479f146866mr478498b3a.27.1782759547578;
        Mon, 29 Jun 2026 11:59:07 -0700 (PDT)
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
Subject: [PATCH v2 8/9] x86/xen: Convert xen_mm_pin_all() to ptdescs
Date: Mon, 29 Jun 2026 11:57:41 -0700
Message-ID: <20260629185742.126987-9-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629185742.126987-1-vishal.moola@gmail.com>
References: <20260629185742.126987-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1782759549-ACD3C1CC-D709F6D2/0/0
X-purgate-type: clean
X-purgate-size: 1324
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email];
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
X-Rspamd-Queue-Id: C979D6DE2DE

Convert xen_mm_pin_all() to ptdescs in preparation for the eventual
splitting of ptdescs from struct page. Continue checking PagePinned
through the underlying page as we do not have a per-memdesc api for
page flags yet.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: William Kucharski <william.kucharski@linux.dev>
Reviewed-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Vishal Moola <vishal.moola@gmail.com>
---
 arch/x86/xen/mmu_pv.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index aab5f70d407c..7b23a34db8ff 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -836,15 +836,15 @@ static void xen_pgd_pin(struct mm_struct *mm)
  */
 void xen_mm_pin_all(void)
 {
-	struct page *page;
+	struct ptdesc *ptdesc;
 
 	spin_lock(&init_mm.page_table_lock);
 	spin_lock(&pgd_lock);
 
-	list_for_each_entry(page, &pgd_list, lru) {
-		if (!PagePinned(page)) {
-			__xen_pgd_pin(&init_mm, (pgd_t *)page_address(page));
-			SetPageSavePinned(page);
+	list_for_each_entry(ptdesc, &pgd_list, pt_list) {
+		if (!PagePinned(ptdesc_page(ptdesc))) {
+			__xen_pgd_pin(&init_mm, (pgd_t *)ptdesc_address(ptdesc));
+			SetPageSavePinned(ptdesc_page(ptdesc));
 		}
 	}
 
-- 
2.54.0


