Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C2JrHofAQmoWAgoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 20:59:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3946DE2D9
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 20:59:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Hqs6jjtj;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1348012.1605909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHCL-00031N-JX; Mon, 29 Jun 2026 18:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348012.1605909; Mon, 29 Jun 2026 18:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHCL-0002xY-Dw; Mon, 29 Jun 2026 18:59:13 +0000
Received: by outflank-mailman (input) for mailman id 1348012;
 Mon, 29 Jun 2026 18:59:11 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vishal.moola@gmail.com>) id 1weHCJ-0002gX-Ox
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 18:59:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weHCJ-005gAN-5s
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 20:59:11 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a42c068-e002-0a2a0a5209dd-0a2a450cac46-28
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 20:59:11 +0200
Received: from [209.85.210.172] (helo=mail-pf1-f172.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a42c07d-f399-0a2a450c0019-d155d2acb837-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 20:59:10 +0200
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-845b733e82cso2323170b3a.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 11:59:10 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net
 ([2601:644:937c:6c90:6d4e:7b2d:4a39:fb0c])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-8479ff8f959sm223955b3a.3.2026.06.29.11.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 11:59:08 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782759549; x=1783364349; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzFzFTeSRsUwmgBU8TSW+xSkFmk/uW2c+RWIXDiDEHM=;
        b=Hqs6jjtjoifccjkwMslbGWG5RhYBbwXX1cwkm7i1Vp97gRUuS1Q/GL63VM3CoJe7BR
         V6JYyVZ+GoZVKcJFGEWrnnRiIe35xutBQ8426cBDNrV8l/yJA6+YX9ih0hw8cYZI9b90
         uaehQlElOwwFZyZr5F73sKbOVFWdRnutdLEnPbKAeQcQfX/YuEzbFF4on9HeA5JIh7UP
         Kxaje+AzwBUr3KOdUj5nKESuv5KZcbS8si9dOeads7s8D0GFcelfy7S45afHzjtGxGk3
         7Tt/9srjOa6GoWvpozcqT+n4PyAqJUhPs7X3orhjfdYAYXSTE8n3DFbo4yxRfqRy76el
         S4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782759549; x=1783364349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lzFzFTeSRsUwmgBU8TSW+xSkFmk/uW2c+RWIXDiDEHM=;
        b=Eq4aDtXxDdYTC0UFH4290zcniCtDGoNx5rtXXJy+J/vs8eSWePMl/EmrA2zjxJtI/W
         W56NWxs9/bZ1w0mT6QQGzT3ZZP/PlFboIqkR1iNPCGyG7JyDu08IrFE5b+BMbhB1Ja9N
         viJQ8NxDi46P104o6Y/yIm2E506SIJh6BzRmcnf+cVk4F9hp1ygkuqAGfBLq6efTaMsx
         UXo36EbredzCmaDLu0HpbOEEX9mdDiThKhgyrKvGcdc9ZnJkr2EyNwl3mWfNyyE4+Cgq
         FMketPKqCs/hS/YafoapxYUsLq3ngM1JKvWDVxDjYJFT2Uug/GF1D5ElQ9sz+GWWbj/X
         Qg7A==
X-Forwarded-Encrypted: i=1; AFNElJ+P4kEemlotZg5Ciuo4Fu/u8KRXXB6jNkjJHPSS48OwkUQZDS9M83BwCI/brbp0+b5ir0Xk6Mp2oYs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzu+jRdzbaHtsj7DBFSF7yycTKnMhm/rVlqyZbJF6SKXAOmB/Bm
	z0wCPFm0N6kzuu7AAORqW5nbHFk0kzAnxtxG+/4MVJx4oXSm1C+JtHlR
X-Gm-Gg: AfdE7ckT8M05V+kxSCm+0VYmr1fwyV4WnhTpA5BBdhTU9hX52njw/+jdRaXERLolqYJ
	9Fgl8OCKjwd6utZpidBr1jv+OJYFdGGigS3XQFyXEdlmhpVjYAQJLg/cpp1Vg82cNdqboJOB3uu
	ifVV71Lc6cL7XD4aiuehJFQNtq/eVoc6w7gmJPoutRYhU0SntKDcnvBZK+9YBa01n7kUhAK7V6g
	YacBPrGbr8eCO/SE/PqhWZKyJ4ROffNkedepF5mp1GD/m+i7H1Y1jMAB7Lk5jD2n0rgQa1ozCfg
	NcNclTq+seoalV/CmKMxvPRb0IP9wntRkaeWiji2yvcIT6v9O0SFsVwMXzpbMhunTHnwLaD51dP
	nm66g/U40kkRNbyFqgyyudbrUpWBZuHeXxpzxvLkNgqat62cU+7ssifghu7a6cNoUsjJHy9tPP9
	4oKi5frkJBaVKphWQ1ovBnuT46P7TrFKUZKrof+ehef/kBWxNNjUO3MFE94wsUVBU6vfLxC8c=
X-Received: by 2002:a05:6a00:c8a:b0:842:688f:3089 with SMTP id d2e1a72fcca58-8479f1c5ec7mr506886b3a.30.1782759549114;
        Mon, 29 Jun 2026 11:59:09 -0700 (PDT)
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
Subject: [PATCH v2 9/9] x86/xen: Convert xen_mm_unpin_all() to ptdescs
Date: Mon, 29 Jun 2026 11:57:42 -0700
Message-ID: <20260629185742.126987-10-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629185742.126987-1-vishal.moola@gmail.com>
References: <20260629185742.126987-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1782759551-0D128D51-CF4105BB/0/0
X-purgate-type: clean
X-purgate-size: 1409
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
X-Rspamd-Queue-Id: 4F3946DE2D9

Convert xen_mm_unpin_all() to ptdescs in preparation for the eventual
splitting of ptdescs from struct page. Continue checking PagePinned
through the underlying page as we do not have a per-memdesc api yet.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: William Kucharski <william.kucharski@linux.dev>
Reviewed-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Vishal Moola <vishal.moola@gmail.com>
---
 arch/x86/xen/mmu_pv.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 7b23a34db8ff..6ff5a7130e53 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -947,16 +947,16 @@ static void xen_pgd_unpin(struct mm_struct *mm)
  */
 void xen_mm_unpin_all(void)
 {
-	struct page *page;
+	struct ptdesc *ptdesc;
 
 	spin_lock(&init_mm.page_table_lock);
 	spin_lock(&pgd_lock);
 
-	list_for_each_entry(page, &pgd_list, lru) {
-		if (PageSavePinned(page)) {
-			BUG_ON(!PagePinned(page));
-			__xen_pgd_unpin(&init_mm, (pgd_t *)page_address(page));
-			ClearPageSavePinned(page);
+	list_for_each_entry(ptdesc, &pgd_list, pt_list) {
+		if (PageSavePinned(ptdesc_page(ptdesc))) {
+			BUG_ON(!PagePinned(ptdesc_page(ptdesc)));
+			__xen_pgd_unpin(&init_mm, (pgd_t *)ptdesc_address(ptdesc));
+			ClearPageSavePinned(ptdesc_page(ptdesc));
 		}
 	}
 
-- 
2.54.0


