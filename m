Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNqsIPL5FmpizwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 16:04:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A2A5E5871
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 16:04:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320502.1587839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSErx-0008Cm-VR; Wed, 27 May 2026 14:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320502.1587839; Wed, 27 May 2026 14:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSErx-0008AZ-QS; Wed, 27 May 2026 14:04:25 +0000
Received: by outflank-mailman (input) for mailman id 1320502;
 Wed, 27 May 2026 14:04:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vishal.moola@gmail.com>) id 1wSErv-0007sq-QI
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 14:04:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSErv-007NdR-6K
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 16:04:23 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a16f9dc-e002-0a2a0a5209dd-0a2a450c88dc-38
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 16:04:23 +0200
Received: from [209.85.208.54] (helo=mail-ed1-f54.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a16f9e7-62f1-0a2a450c0019-d155d036a8e9-3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 16:04:23 +0200
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-6763cc8775cso21320353a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 07:04:23 -0700 (PDT)
Received: from fedora (cpc92878-cmbg18-2-0-cust539.5-4.cable.virginm.net.
 [86.16.54.28]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-45edb558f52sm6693771f8f.14.2026.05.27.07.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 07:04:21 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779890663; x=1780495463; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+w3iXXiIbm9QTHlEZJbBBJGqtECrTHGYD283Ga9Jpbg=;
        b=YmyPSQ5i0BXsib6nWDazrCHeehNDs2D1TpJNan3aOGelNR7gFYTmT8e/VZ4JV3ohKZ
         kaBurS6R8vdPh7lBmfLdHtPCp/fgKw4eLkerawuy+SH6sd6PmIFJvn77JeE2sVD/ItXc
         kPE0Fik86ukgYQnM/lgPr+HSudmiZI+BICZX3v3GGes35cg/+2Lp2cPJcZtRh/HwZZto
         nvmpxhE0sDsc3C/xYp1sdEWdg0IBKu7+/y+qhjPgRraprGoh8+XCL/otzaTdxTzIrarg
         Qw1TzxHM4LDfH5Dxe4SOedTvgW/XXCsTVxGdv8t1CPokZC6/ZvnyZkRdgPeOpGkI02bg
         KAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779890663; x=1780495463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+w3iXXiIbm9QTHlEZJbBBJGqtECrTHGYD283Ga9Jpbg=;
        b=qnio1+My1y2w2om07CP91KFlvZbFmgMHkcQAH1p4psdgyDYewkDA4+J6lBDcRLA8zy
         KgfMGfU81/tnhICTTWaKACwynHrIkCA6inz9AhCDGB0UsW8e0da0H4fnjvoCgIPrqeYc
         QYqQ+P4Yc1OjQPnlwj/iROTkkTBSHXWkoD+qudnHyCr8er8U5VPIUL/reBcf8P9KTnEK
         nuP6XSa7XIq1aOMcA1vBizDQ3KZ/WgSE8A6Rv5xdMa56E/k2fXl3Jd725aZH/VhBHOpb
         pXgwKvFrrrUEr3zwiPlsUO9MUzu/dRsl1XDkztABfpmC6gSmM7ZMVhCMRWdjC8rIAbKi
         tEfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ukhsyHL0zckK+nCDMTz8uH9c3ou3E5V0VoHuoIYNKrKB6mBpmOcITXo4pQJ14NjZYqSl2rjO1LjI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQcSW9I2OOEiR7hE1imzKHOF+XRtex/pzaExRYwLbP9W/e5mnk
	AQMn0BKhq2BBk7N5u7Zu2uWTdlRwNv5na6yiTw+FLk9pzVfZKZ1UmmBO
X-Gm-Gg: Acq92OE4nUMQ8xe2v2Gq7WH6KfXcBMBZhsafSXMJ5hI4DvJIfZqXND83oWEvv+Na78k
	kbahSXb++Qg+p4lxPWf+X7GhcDZKUHK4LSpCzuhgysM9JDt1QJfKu5cQz0tcrHJgcFZUuo3wSYr
	6WWqAOS/s8Ov6BxRiaQGkT3N8flENSIhNGKgIEFBdIiBpXfLDSqmbG2x5WjU+zStZT6mWdMaW6E
	JsDUBVPt5Yjh1sZwKE7aHMvHA7DyRXFeu29KD2XUTKcLodDt9IFGzJI2oIfGkuvtrSkbDv/0csx
	3p6aXt5idq0IWtabqNsaZeWrxoFPHjAfzKErxGMC4BXpoMDEkPssNxIBKdU/W3w6dHy/62hofJl
	D1WDsSKbUYPLNQpFz3pY+roKQ6cSPzfa/X0UMOhwtZLW3GReq27cl4wEmuKKQftBLyLI++StHpg
	JImaUFh73OhM/1Dmf4DvRTUF3fKjjSOHjm5CZcTiLPvGnZe7GUW4HnjuyJhx1kmliKWbRLwscZF
	Oyez8QsQtSioLqG8+fzudW775uogWaOrie8pVyGy0qc
X-Received: by 2002:a17:907:970e:b0:bd8:f7f0:d740 with SMTP id a640c23a62f3a-bdbfcbcc4efmr1446753266b.0.1779890662461;
        Wed, 27 May 2026 07:04:22 -0700 (PDT)
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
Subject: [PATCH 9/9] x86/xen: Convert xen_mm_unpin_all() to ptdescs
Date: Wed, 27 May 2026 15:03:16 +0100
Message-ID: <20260527140316.294621-10-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527140316.294621-1-vishal.moola@gmail.com>
References: <20260527140316.294621-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1779890663-E397DCF5-961EF6F7/0/0
X-purgate-type: clean
X-purgate-size: 1246
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,lists.xenproject.org,redhat.com,alien8.de,zytor.com,infradead.org,suse.com,oracle.com,gmail.com];
	FORGED_SENDER(0.00)[vishalmoola@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishalmoola@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.953];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 37A2A5E5871
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert xen_mm_unpin_all() to ptdescs in preparation for the eventual
splitting of ptdescs from struct page. Continue checking PagePinned
through the underlying page as we do not have a per-memdesc api yet.

Signed-off-by: Vishal Moola <vishal.moola@gmail.com>
---
 arch/x86/xen/mmu_pv.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index b2f6e7b7c545..c4731c1e842d 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -939,16 +939,16 @@ static void xen_pgd_unpin(struct mm_struct *mm)
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


