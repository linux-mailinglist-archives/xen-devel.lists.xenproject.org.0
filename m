Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Rt+KLPL5FmqGzwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 16:04:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3062E5E5870
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 16:04:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320498.1587831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSErv-0007sk-Mu; Wed, 27 May 2026 14:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320498.1587831; Wed, 27 May 2026 14:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSErv-0007qi-Gk; Wed, 27 May 2026 14:04:23 +0000
Received: by outflank-mailman (input) for mailman id 1320498;
 Wed, 27 May 2026 14:04:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vishal.moola@gmail.com>) id 1wSEru-0007et-FG
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 14:04:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSErt-007Nbf-RE
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 16:04:21 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a16f9e1-5cb7-0a2a0a5109dd-0a2a4505b586-22
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 16:04:21 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a16f9e5-aaa8-0a2a45050019-d155dd2df0c9-3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 16:04:21 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-43d73422431so8369225f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 07:04:21 -0700 (PDT)
Received: from fedora (cpc92878-cmbg18-2-0-cust539.5-4.cable.virginm.net.
 [86.16.54.28]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-45edb558f52sm6693771f8f.14.2026.05.27.07.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 07:04:19 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779890661; x=1780495461; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6e5970dOoz9fKbdnw0tfYlfryhDGT/Rrpa19h5wLuiY=;
        b=eOBXwpVKkQA6Qc7ODOHDcfb/EGJxy3BAd9s5rCGxTbpGXPy8v76xWd0K2evdCldGlJ
         SkBE27kG4zob2SuJaequ/2svxHS12Kq2uTnQmt5k9ZNV6l7r4cXfkbAz8a8rljvP/LSl
         vVqaWDt0gxSn/Mx/3CfFkx4mseAqbKG35Ee3J6cIgp7OLQVNHgkNH4JOg9LE0FdaGbpS
         veZ59/XDevlZgeE22hjUdufQAziMUQXsb36+NDIFTLGW0AfdaXRumxidpSZmPon0r1i9
         2RD+xfh3TbzjeckE34pYvURPsUvJeOrqNnWwIGWMjeIxg6tK8Sl+dl9tlqLjqe4YIY79
         HyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779890661; x=1780495461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6e5970dOoz9fKbdnw0tfYlfryhDGT/Rrpa19h5wLuiY=;
        b=OLEnpBX04UKr7UGCyGxA1X92MlX22dFoJn2eigRgHhxhHWkFSQkiGcRUz0ZcRhOzOK
         Whdk8bYH3leZBZ+tJ3P2IPc/Hn0oGCkvqOFIDnW1kWErFePduXwNPNoysxOzjhMO9T8v
         tGMwlDayXjDYh8m6iokjPB9gQWwRkFWy7nqBbEKSIi6T+VBS6FIJwy9CI7+0/6mLZsdt
         ND72n2yWe9dQX7Xe8F7NsMZJD20NVgwh6oMl5PsGIQK6cXEQDGye/Bkg4ffjxpk/oLhj
         ltynvwlIeaMP007teNQ+QIRf50ad1OU9sed2KlHERkX/RQVyzX8O512oIu66/emBHG2F
         WOHA==
X-Forwarded-Encrypted: i=1; AFNElJ8B/YxhRhIvs/YKpDHM1oGr2jiD46zWSGkWPK23TQnssUqKSHBDdhPtncV2nVYqd/GPwKMcHCEx1w8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDDJrljLQOZ+T/4D5PVsggkREYk1iiGyh3kplzhBTjXj7sMYVf
	hGhO3EfUwawPk4GfaT+uliuUVH5ZGTaAgJojcHDke8DjNQIuXY5IYFVA
X-Gm-Gg: Acq92OErchV7slpIOlV3rD7HrSpKOcEUZsw8e1ThN9WatIASNIJfm1CC4Ns/sW5ulke
	ZdIwGFH23F/YrQxV0H/kXxu7gJAOX3y79Hvj9NW8HHgPwJBwXw98tdsGI+jXEGN8tqYF+XW16bJ
	9SOeToDkvFYBqmY4T6fP1fqDS1wXYy/mW42tUBn3YpJ3LenXH5nKfEJSA4McUPYEll5a+ys2m+H
	DD/7BhKl8g4iW/aFHHPQjjX0Le5ED2N9cpuEsYwJFIMbp4tVXD21SBpSW6gCQD0HeRicQWfeMol
	YWBD946paUDtUH7tndnqwRoiYj+GfhNp2+QFFzsNdWRjMpZ6L4q/HfzMck6BEjnh8aaEaotaj/c
	n4z+ySfQujVH/m8Le50G7h+6nfdOEZeX9Oqtfc7q3bksUR2PEXFRr/DCv0bcn0bbsdXH3x3DD0U
	aWyrxPs5ZgbdHAGA7dqtOBRzmGyUVQaNgXSoCxU7x0HGuPzq+7Gp8/AvU7Q5pRCw969Xxg1abPG
	dyVuzvgfUVFLJlH9JaneB1Jw+W7mrlPSw==
X-Received: by 2002:a05:6000:4707:b0:45e:75c5:1a6a with SMTP id ffacd0b85a97d-45eb38bcb3fmr37810576f8f.33.1779890660721;
        Wed, 27 May 2026 07:04:20 -0700 (PDT)
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
Subject: [PATCH 8/9] x86/xen: Convert xen_mm_pin_all() to ptdescs
Date: Wed, 27 May 2026 15:03:15 +0100
Message-ID: <20260527140316.294621-9-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527140316.294621-1-vishal.moola@gmail.com>
References: <20260527140316.294621-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1779890661-E338A443-E4976255/0/0
X-purgate-type: clean
X-purgate-size: 1161
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
	NEURAL_HAM(-0.00)[-0.954];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3062E5E5870
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert xen_mm_pin_all() to ptdescs in preparation for the eventual
splitting of ptdescs from struct page. Continue checking PagePinned
through the underlying page as we do not have a per-memdesc api for
page flags yet.

Signed-off-by: Vishal Moola <vishal.moola@gmail.com>
---
 arch/x86/xen/mmu_pv.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 3eee5f84f8a7..b2f6e7b7c545 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -828,15 +828,15 @@ static void xen_pgd_pin(struct mm_struct *mm)
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


