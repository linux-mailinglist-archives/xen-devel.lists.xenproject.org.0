Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPIVCPT5FmqEzwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 16:04:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE225E5886
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 16:04:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320496.1587812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSErs-0007J2-U9; Wed, 27 May 2026 14:04:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320496.1587812; Wed, 27 May 2026 14:04:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSErs-0007H6-Nz; Wed, 27 May 2026 14:04:20 +0000
Received: by outflank-mailman (input) for mailman id 1320496;
 Wed, 27 May 2026 14:04:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vishal.moola@gmail.com>) id 1wSErr-0006rS-5X
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 14:04:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSErq-007NXm-Hg
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 16:04:18 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a16f9de-e002-0a2a0a5209dd-0a2a4509cc72-24
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 16:04:18 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a16f9e2-2497-0a2a45090019-d155802ef19e-3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 16:04:18 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-49050bfe053so22221805e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 07:04:18 -0700 (PDT)
Received: from fedora (cpc92878-cmbg18-2-0-cust539.5-4.cable.virginm.net.
 [86.16.54.28]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-45edb558f52sm6693771f8f.14.2026.05.27.07.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 07:04:17 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779890658; x=1780495458; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2LXP0rk0yvbCFBliNg/BHdi3EXRn2M/q6qufOUbEAs=;
        b=WYybxjT5baaCAvYRRqpuFfyXorjtlexHbH5skaDJb75JhawTOmvhfwcNINT9KL7SN7
         9zzYBWxvODPeAKaADOrOqQpsmK556CA9NvbHuHBe+Y3g1wB6WZKbq0bYdgkI1sdSQsYM
         7kKoIkK+3o8hzYxjYZ/9PIHltWXN6nopRR6dkEcMgSchzyR7SbvSGd4TY0cgxuRkd/3q
         j1k1XmgkYRHxDgfcedu81yavJoKDOpiBkh+h+uWi0t9BeLmYvQmIl1JW2yJl4bbJXgdJ
         8WMGnrNVNbUk5EX9P4AWVXt+eb3KmBpfBm8nqWjPrlPqzxYif/aw+E08yHM5TXhvJPhx
         jaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779890658; x=1780495458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c2LXP0rk0yvbCFBliNg/BHdi3EXRn2M/q6qufOUbEAs=;
        b=kCtgbcU9uVXXa1lG8DqLVTbQ8e44xwIACY9bwb/Z9ZUnYxkRtM1RexvHVxMRru0mSl
         etv+bqEpQDTH+ZJuiMeOlNi5gTV2xWA9lEraNV/M0B3/KdNbJ2jPIUYyEGu1ZLPLFpBP
         y0AFM5Okh8FF+oQRFzHZloC2rnMsQPduRu1Wu2cFBslydzD1Afin/hU9WRUmiUbDGR4O
         1aguZCrISJQROvyRTSFr8JJY0om1i2KU+YJtY4cZdJPdWzlkueN2jT0sMojBtuCziF99
         cn0vfge3QaqCDFT62MZCbUZFSyfyiGPVzBYPEnvS3QY6f6i5VdPtg4UVt6+6+xWT+nBQ
         BNYQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ZjU2T6lN7jaIHkhbmOD5QsHglF4Mq3uAnN5T6vX9mmy8/mAiwKPcvz8jzt8R2t67cj+gmoyXfGmk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw88A97UGr4595Y9EZQEQYysyXvqHPweIorOCiK/A+PVoeszpSE
	ZpbUcaG5dTrS1p7rmF2TG+r3mH5FoMXTliJhhFsXi1aiX/kxwfAR+23J
X-Gm-Gg: Acq92OFpkGO/1pT0qGQtWCr5GBiMV4FGKF0XZHLNRXnxTvqvcp0xspbd9vCVcDTaFa6
	Vj9WJedgqSsUz2AvkXa3zWY2KVN2C6HVCHxEooS4NldHJUCajUHmQ3W7w0JnP8H11m8lrstwqSO
	V81WbtzMI1g7GiGeoUVOU0PVJAE2ryP0OuAxPabqkjpEFYISp5hV6vruB1ATMy4ZV/Mrl+08DJo
	0BDK2Ax6823mMXpOIRMqYIY5LPjtHngovL/EQGpReu5FNMuplFAdcNmdzic2yk5JqEAO1rwndv8
	QGtRAkkGdueAPIptpAGhcJftEoZoorCRXB0bA1oe5AVbpl8SQg7TSP3dchfu288VpZy3/c87ESV
	y/v+imUIbyFJ/He0Kzm2gezp4/pFJ+kmrxzZvZGp6Y6gLgTaq8D9niCthDBE6hInNpM2wuPdiUN
	5HIhGiv+61AnoysN/trneiIOv9Ni2Yf3iWwfEZYb6umZh3AxdjYxjnkSVR5ap0QAP1REfO1cMiN
	Tvpus/hMsLwh8S2DgO4cljYw2KIlGZiS6obUJ1PxlUb
X-Received: by 2002:a05:600c:1553:b0:490:53b0:9e53 with SMTP id 5b1f17b1804b1-49053b0a086mr320397125e9.1.1779890657764;
        Wed, 27 May 2026 07:04:17 -0700 (PDT)
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
Subject: [PATCH 6/9] x86/mm: Convert sync_global_pgds_l4() to ptdescs
Date: Wed, 27 May 2026 15:03:13 +0100
Message-ID: <20260527140316.294621-7-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527140316.294621-1-vishal.moola@gmail.com>
References: <20260527140316.294621-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1779890658-37F7EA53-6C38714A/0/0
X-purgate-type: clean
X-purgate-size: 1497
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
X-Rspamd-Queue-Id: CAE225E5886
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert sync_global_pgds_l4() to ptdescs in preparation for the
eventual splitting of ptdescs from struct page.

Signed-off-by: Vishal Moola <vishal.moola@gmail.com>
---
 arch/x86/mm/init_64.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index e89b51aea2cf..a6ccb83f2d26 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -174,7 +174,7 @@ static void sync_global_pgds_l4(unsigned long start, unsigned long end)
 	for (addr = start; addr <= end; addr = ALIGN(addr + 1, PGDIR_SIZE)) {
 		pgd_t *pgd_ref = pgd_offset_k(addr);
 		const p4d_t *p4d_ref;
-		struct page *page;
+		struct ptdesc *ptdesc;
 
 		/*
 		 * With folded p4d, pgd_none() is always false, we need to
@@ -187,15 +187,15 @@ static void sync_global_pgds_l4(unsigned long start, unsigned long end)
 			continue;
 
 		spin_lock(&pgd_lock);
-		list_for_each_entry(page, &pgd_list, lru) {
+		list_for_each_entry(ptdesc, &pgd_list, pt_list) {
 			pgd_t *pgd;
 			p4d_t *p4d;
 			spinlock_t *pgt_lock;
 
-			pgd = (pgd_t *)page_address(page) + pgd_index(addr);
+			pgd = (pgd_t *)ptdesc_address(ptdesc) + pgd_index(addr);
 			p4d = p4d_offset(pgd, addr);
 			/* the pgt_lock only for Xen */
-			pgt_lock = &pgd_page_get_mm(page)->page_table_lock;
+			pgt_lock = &pgd_page_get_mm(ptdesc_page(ptdesc))->page_table_lock;
 			spin_lock(pgt_lock);
 
 			if (!p4d_none(*p4d_ref) && !p4d_none(*p4d))
-- 
2.54.0


