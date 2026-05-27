Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIZFKPP5FmpizwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 16:04:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 610695E5873
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 16:04:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320494.1587796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSErr-0006uq-F1; Wed, 27 May 2026 14:04:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320494.1587796; Wed, 27 May 2026 14:04:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSErr-0006rT-8n; Wed, 27 May 2026 14:04:19 +0000
Received: by outflank-mailman (input) for mailman id 1320494;
 Wed, 27 May 2026 14:04:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vishal.moola@gmail.com>) id 1wSErp-0006c2-I9
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 14:04:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSEro-00ExNd-UN
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 16:04:16 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a16f9db-2eae-0a2a0a5409dd-0a2a4506a2cc-30
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 16:04:16 +0200
Received: from [209.85.167.49] (helo=mail-lf1-f49.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a16f9e0-7371-0a2a45060019-d155a731e16b-3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 16:04:16 +0200
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5aa4bb157c6so830371e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 07:04:16 -0700 (PDT)
Received: from fedora (cpc92878-cmbg18-2-0-cust539.5-4.cable.virginm.net.
 [86.16.54.28]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-45edb558f52sm6693771f8f.14.2026.05.27.07.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 07:04:15 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779890656; x=1780495456; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rv/V9Guf/VmqLyIW7ddquGjxWE57lh1X75zHlzPy+Ls=;
        b=O1FOKMG2ODrQjpjKqj0YEQa5hQ8+j4YwvHnFxysH/tq3gT/v8z0uK8akhuassHwcLM
         /uw+HzV4POaqTCnyVb4M7A4QH6OsRnRXZc39+uzv4k6HXU+wUyIWhU0YOJK3onUK5UMg
         wAQwShV/pOJFuog+pQTjaRyKwaxk9h3DvbZ0O/EgqbeAQwUhXauQ516RNEmZOeGkl85n
         vKjiCtgnB/D8PGvJcfeccckRIxqYggMYXSIpoO1wyeXZ6zQND5PFoL052iyW7fWVs7cE
         PX4DLndwDubt7BmaFYXZjdOhYVVmdcHeXdh6L7XgCcMezw1A2Stw8nhmFqg70ZEyQeWk
         IWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779890656; x=1780495456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rv/V9Guf/VmqLyIW7ddquGjxWE57lh1X75zHlzPy+Ls=;
        b=fUUtrz467MDLX6XNGgoJPlOhHVj6oW5t39DPKYdq5xsBBsICgFLKIm34+2gCgdq8Td
         PrdR1ig1z/2COhsHiIFY3MMp14NuVCfPVnTCO3FmM6PS2bF7DxMZI8oSklezaR3BvC0l
         vUMMhfwJvRg7GPEIChoL2weHTpTgcP0l7871GgSMcI/rXtKT2W3eiFmyaAO9DzrE+OXw
         4/qxAJf2Xl511ssWIoNrVzpN4A+ahDWDlcsYFlRgoR6rwF47mnab2GhFLfEHwF7L8eEq
         1J2hsHlm9fQ8ZsDEus9ZKpudG8xdKJc4USUaI0GpBjV4YWNF2MiLdR2yWbKwBDYSMhKb
         UzTg==
X-Forwarded-Encrypted: i=1; AFNElJ8C7BO2flBNMLuNi26ah6i/vjxzxSjSGdgpoXVW/oJpBTvzCbpMRsJoK08BVyVnGEqEvTI8ZT81dV8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzx6BwQKx9IJ9/6RJgmcZwrVeYwI+dYVGQWj2KhUJlgIf4nV6cF
	ul5tATJ0+VqlqDNZxs6B84IXeIY2V02FGhAVahLyvW+gCEFNi19cTwbX
X-Gm-Gg: Acq92OHtN7IJyCYVC8l6HAj81wVzm8J55r6usYD5P720+E9OCyejm6OttoEo0uCu+y0
	pO17RZp31iAouFM4gq5EGATOr5R9o4M6ZkJ6AvXZDcATmQeemTjBRqVrpTNVr1Bf40MpCg/d+af
	gK+Bu9CRL70xoVKMXaEig4FFgtWFyL4PqGvdTituT6PVtJxvyp2KQKUvME7MfRuh0hU7lInlRNP
	8Y+fnmHP9EoobkiZa+PvTBqmWtjBXG1V0PbpKfhrvcAiCBaOh8AkWq7tmRhvJFB628AWbZgBKKv
	2xvRdNtS0dA3wI7GVo6GmapFYHYAy44fdhuECzxmqiSOqpyXMH5Ivr1nLd4KOpRKEd39dIaubgg
	MV9l7ROktrq1v8VqF843M4MdmcHTpPftyJ2ooVjG+rJQ28DSFbcc4AmQM0cERhMeEAnspJqHKlw
	6FxZlhNWYiVknOLDqwnyFV6jvi3Hq0Kznjjv/pdvTwhN2Ml3oXF4DDXqDnNiJCVbAZ4Hg/Z3Xl2
	tio53jC68ob+Z1uYVHi1jRZN1CyXfcbDA==
X-Received: by 2002:a05:6512:1287:b0:5a8:5ca8:7f72 with SMTP id 2adb3069b0e04-5aa3238b947mr7339783e87.4.1779890655762;
        Wed, 27 May 2026 07:04:15 -0700 (PDT)
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
Subject: [PATCH 4/9] x86/mm: Convert arch_sync_kernel_mappings() to ptdescs
Date: Wed, 27 May 2026 15:03:11 +0100
Message-ID: <20260527140316.294621-5-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527140316.294621-1-vishal.moola@gmail.com>
References: <20260527140316.294621-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1779890656-86369D75-90D0EC58/0/0
X-purgate-type: clean
X-purgate-size: 1318
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
	NEURAL_HAM(-0.00)[-0.955];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 610695E5873
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert arch_sync_kernel_mappings() to ptdescs in preparation for
the eventual splitting of ptdescs from struct page.

Following this patch, we can successfully boot a 32-bit x86 kernel with
separately allocated ptdescs.

Signed-off-by: Vishal Moola <vishal.moola@gmail.com>
---
 arch/x86/mm/fault.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index 63de8e8684f2..6c72d6668416 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -269,17 +269,17 @@ void arch_sync_kernel_mappings(unsigned long start, unsigned long end)
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


