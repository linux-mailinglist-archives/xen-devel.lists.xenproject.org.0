Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TeluI3/AQmoKAgoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 20:59:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 200B76DE2B8
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 20:59:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=INKukaR0;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1348003.1605856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHCB-0001NV-G4; Mon, 29 Jun 2026 18:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348003.1605856; Mon, 29 Jun 2026 18:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHCB-0001L4-C9; Mon, 29 Jun 2026 18:59:03 +0000
Received: by outflank-mailman (input) for mailman id 1348003;
 Mon, 29 Jun 2026 18:59:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vishal.moola@gmail.com>) id 1weHC9-0001FI-Uj
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 18:59:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weHC9-00DrLG-Bc
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 20:59:01 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a42c06b-2eae-0a2a0a5409dd-0a2a4506b908-12
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 20:59:01 +0200
Received: from [209.85.210.179] (helo=mail-pf1-f179.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a42c073-08de-0a2a45060019-d155d2b3e964-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 20:59:01 +0200
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-847921eed4aso888204b3a.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 11:59:00 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net
 ([2601:644:937c:6c90:6d4e:7b2d:4a39:fb0c])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-8479ff8f959sm223955b3a.3.2026.06.29.11.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 11:58:58 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782759539; x=1783364339; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=001LhG9jRDHFHgxoUSCKNV/Xn5fJVvktzNuLDas4KQc=;
        b=INKukaR0gnjurOUz5kvv+sYzB2jmR648G3Xr7XYC4ynFA6aXVqGvZhQEVPBhc+3FmM
         ewzTWdwnv1uIM+5qCuSELE3bXYzvHYtUajMblFQgmXdys/90PeiYFLpp1FU1xtfyYQ31
         y3G4yNUtnuK6Pyzk5ETcUP+dIX7YLRpQ48KxbpHLzihoYU8cVOu7kr9rA2b3xpVuMBpO
         Qn9I/lenj+p7XDq+cFqGfCIUy5IoRyUXtRKUxMMSQGb4Iav2sTYGf6auAzL3HRXK0oqH
         nzUacqHjyPfMgOmuTMHxVz1JXeuvG8r4I7fMzhzrncxyxW5SOmOwCJ4vHCviw76tk0dT
         WtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782759539; x=1783364339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=001LhG9jRDHFHgxoUSCKNV/Xn5fJVvktzNuLDas4KQc=;
        b=PjN+hEjNH0UbRMgRSuYu4EWkLcccVx737zGH2x7xHuik6x/6RFO7FrYPpYKpvvNlPw
         Jj7WKNeAfNtuaQBKjwMwMEMWXKwsy8MmdXZwShOpR/WMLGebE2j/39iB+eWD+jOkNybu
         kwozFM94gRgRvQrgqpyzS7wO90/kMkI2FDlQaAb0eZfzkLfOH9pgqLJpwdA6v+g+PyAx
         fJ5sYPxLS3z/e6c3BQLBgTnQZB/i/pO586oFbKL5qZTrtbL6vycKxlK9dY0iVtrobYY1
         HbcksRP92r9JRKMXiGNUCX+Keg5caxlnnTkHHhih7dxPPex5HeLf+dIau4lYhmBcQw/B
         Cwjw==
X-Forwarded-Encrypted: i=1; AFNElJ/BsdZz7OxadqppBeVJjc2BRb+ielpHy+9/eJW+PFU3t/Bg3xncpqIezQUqcIo3eL2VFdqKRiUDusY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVzVnHrBMRVrPTrX0evumHF1uRFXXEt1OJWcY/iVZPdrf9fh1Y
	s+doqGpdKyM27B0n+dPCgD/CnVyq8ESffPISo3EQfc5c9AwAbwzqvrLl
X-Gm-Gg: AfdE7cnP1VEyI8cL3aSQ3BwuvM4BHDJ62CTtbviovt9sMvui4HfKNtyPxOBBMQ0pmGP
	HYLWNgW6cbt3YDkM+sH22yqOO5ILsvyvzPHCAd4K/BWG8auxmuNTzCoDfDHZPfAv0nMHI+n4ddS
	l+dNjUa+mxoYAjl71EO34r0O0yzk0I8u0Zw0zNOw2HcB+KO7GBnoIUJk1bzcE8Xqx0+oMgeJ2mg
	7L0mCkCMk8YyiLRV2SSnkWqWyP3ycRPn7MZKKBnnxE/PHDn07fVWp7CdcFhlnh9i+tjts7mwVIW
	HI3ZDhu1IdCxHkB7nFeqUEYtoAvmbS0xWLvSZsKVmjve2sTamE30sjcFOrkgolKCYHeHmJvE5mR
	6SfQRNHf7o4Ii3C8fzT2HvOPePlw3BfR+bhc/lJEuiZ5nchogVkbFat+9jox32HpWsfpMAQyEuu
	5qxe59Cax/xiDF2RJ/2BFI6MQ4Gss6iPgLXMolhzC6nOHOIbDw8gwmNmVy3u4JuwlmNQThsJs=
X-Received: by 2002:a05:6a00:885:b0:847:8b11:5966 with SMTP id d2e1a72fcca58-8479eeb687dmr466155b3a.1.1782759539361;
        Mon, 29 Jun 2026 11:58:59 -0700 (PDT)
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
Subject: [PATCH v2 3/9] x86/mm/pat: Convert collapse_pmd_page() to ptdescs
Date: Mon, 29 Jun 2026 11:57:36 -0700
Message-ID: <20260629185742.126987-4-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629185742.126987-1-vishal.moola@gmail.com>
References: <20260629185742.126987-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1782759541-41D3D68D-8BA45A1B/0/0
X-purgate-type: clean
X-purgate-size: 1247
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,lists.xenproject.org,redhat.com,alien8.de,zytor.com,infradead.org,suse.com,oracle.com,gmail.com,linux.dev];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dave.hansen@intel.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:rppt@kernel.org,m:baolu.lu@linux.intel.com,m:xen-devel@lists.xenproject.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:vishal.moola@gmail.com,m:william.kucharski@linux.dev,m:vishalmoola@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[vishalmoola@gmail.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 200B76DE2B8

Convert collapse_pmd_page() to ptdescs in preparation for the
eventual splitting of ptdescs from struct page.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: William Kucharski <william.kucharski@linux.dev>
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


