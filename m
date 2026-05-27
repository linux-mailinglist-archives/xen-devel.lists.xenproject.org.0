Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIgeKvP5FmqGzwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 16:04:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F765E5874
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 16:04:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320493.1587786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSErq-0006f9-1q; Wed, 27 May 2026 14:04:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320493.1587786; Wed, 27 May 2026 14:04:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSErp-0006cF-Uf; Wed, 27 May 2026 14:04:17 +0000
Received: by outflank-mailman (input) for mailman id 1320493;
 Wed, 27 May 2026 14:04:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vishal.moola@gmail.com>) id 1wSEro-0006aq-Bj
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 14:04:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSErn-00ExNd-O0
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 16:04:15 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a16f9d8-2eae-0a2a0a5409dd-0a2a45028c02-26
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 16:04:15 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a16f9df-af86-0a2a45020019-d155dd2cb4f5-3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 16:04:15 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-449d6c68ed8so7492694f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 07:04:15 -0700 (PDT)
Received: from fedora (cpc92878-cmbg18-2-0-cust539.5-4.cable.virginm.net.
 [86.16.54.28]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-45edb558f52sm6693771f8f.14.2026.05.27.07.04.11
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
        d=gmail.com; s=20251104; t=1779890655; x=1780495455; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkyZglyRu7RuI2nqe28wvRtM2BtUYvNg8u3jxi36ejc=;
        b=WbqH/vgoFY3jA9MoKfvhSfFJX29sov+dUpNB2f3UnUPh3UCCuSwZqR2WduINtzGQA5
         CLDbZDoFrQVCJRhcnKlElWZEeRpybGhH/3MWsX/ca78iNN08Z7ARwy56nkiQo1dGobx4
         QsK4eOGpwTJVYAj3S8G5IhTk+8HSbvioBkyHG15Nodz6ksoMYtwvVStMr+yUP5/lGsWp
         K8BZqP0BVr6jFZdtLUgRRUEjGC2z/Lg6TWmH4Z7uPxM2O/R7hq2n2ZQ2rzrm5PtoUDTG
         WF+IdV/KcD+MykOSqTHTzMQlivVn8h6c4wtFp26/HFA5BnAyjsx0Pa+hJVdaMByFvnN+
         c7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779890655; x=1780495455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mkyZglyRu7RuI2nqe28wvRtM2BtUYvNg8u3jxi36ejc=;
        b=h8dZNKhCrCwsj3PaV1CqgRoWUfZOI1vXYrJqsNe3QAjIuMk4ek+00EZ7Vasjl6Ai6n
         4CxD3oZriqlFwE2Znsi+3CbiURwwv3FZB56eUYWWThudyTzaUdUFmN6zrPrw7pwtMO8x
         6/XRWFtq775sMX4nGkUyeSeRphNDHre+VpGD4OSHj61vSpydKhcm2g0xl2zBw+LuHLPs
         E72KjTmUNphyJOMrO5V6Ne/oAZKuECiJgBKzBpeJuPnRflfS31e+ONICWL5mPxy7yxSL
         4WK1W/ZLrErZqzCCBBZ/YDLTz6Uvu5R4R4GlKELKijLpFOeHrJT5NFVHYl1e4nH292Cp
         Bouw==
X-Forwarded-Encrypted: i=1; AFNElJ/Cjmh0EeA1yOcpIB9UwAOIiAcVeilKpvUHJg9fbD09KgsnVk+jqgm69Jt27i25XcEZjFKKnCzyJDg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfPzXwRuf7wuWE1qfIEcTkrslU6dPkQpl3iEDfxgw07HHHyvE3
	2cH54SLNk5B8E86fG1cA588rDJHSsYYEbmyagjctcvLEANWoE77KccSO
X-Gm-Gg: Acq92OECxoEsI3Vamux3Ge6Au2Y1+7EBncslWvc1dBBQ7MYEPKbxTKPaUAJSDag3rFn
	kMBNX0GopfqdgY1ZDjGNq6HdwJIo+MamHj9sftW3ljbSFVzjqT601iPqXhupYaRIE5HaoP13rdF
	hQ2hwwO6XRhNh/h7w59DPgEFU1gm0v2HFphkVPPQkpmw1Y7NdWN/1y3iCguJpe64QD0tX7Q9kdg
	Sz8ppWtVnUC84DMVdDukdHNEBXQK9euAFrwhUhVEffKxrpfcSTuug1C9a7KSJIZDm1mpB1rwa5w
	rFt7yi1S+i5sDcAjrKeyqTa1mrP4uZc+X6imdfjsQqdFyMCecHUPGvt7ltDfN2za1zco2b0fmpy
	MO2Op7NIftq+ZFcQuVc/Cys3aLaxDSVfEtHrbLO/pC/ozO1U6s3rj4EksO0UalUWj3RbRy5Ou86
	fpzhzCEfwKzFUkt3rbtHMTdoelgZxTF4rolakmeeNzbrADXrXHeyyboUTsdSQelDXXCoxtF5iOf
	zPDO4yvR9leQI5VHUzpMBOsCWM/V+zWR4ehAPNzteWF
X-Received: by 2002:a05:6000:26c3:b0:45d:b14b:23fb with SMTP id ffacd0b85a97d-45eb369c7abmr40583483f8f.11.1779890652261;
        Wed, 27 May 2026 07:04:12 -0700 (PDT)
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
Subject: [PATCH 3/9] x86/mm/pat: Convert collapse_pmd_page() to ptdescs
Date: Wed, 27 May 2026 15:03:10 +0100
Message-ID: <20260527140316.294621-4-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527140316.294621-1-vishal.moola@gmail.com>
References: <20260527140316.294621-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1779890655-8316D161-6DF632E1/0/0
X-purgate-type: clean
X-purgate-size: 1130
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
	NEURAL_HAM(-0.00)[-0.951];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E5F765E5874
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert collapse_pmd_page() to ptdescs in preparation for the
eventual splitting of ptdescs from struct page.

Signed-off-by: Vishal Moola <vishal.moola@gmail.com>
---
 arch/x86/mm/pat/set_memory.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 93cb71451ce2..45623d4c24c9 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -1297,11 +1297,11 @@ static int collapse_pmd_page(pmd_t *pmd, unsigned long addr,
 	list_add(&page_ptdesc(pmd_page(old_pmd))->pt_list, pgtables);
 
 	if (IS_ENABLED(CONFIG_X86_32)) {
-		struct page *page;
+		struct ptdesc *ptdesc;
 
 		/* Update all PGD tables to use the same large page */
-		list_for_each_entry(page, &pgd_list, lru) {
-			pgd_t *pgd = (pgd_t *)page_address(page) + pgd_index(addr);
+		list_for_each_entry(ptdesc, &pgd_list, pt_list) {
+			pgd_t *pgd = (pgd_t *)ptdesc_address(ptdesc) + pgd_index(addr);
 			p4d_t *p4d = p4d_offset(pgd, addr);
 			pud_t *pud = pud_offset(p4d, addr);
 			pmd_t *pmd = pmd_offset(pud, addr);
-- 
2.54.0


