Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6vr8JX/AQmoMAgoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 20:59:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D156DE2B9
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 20:59:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VHjvW+3t;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1348001.1605838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHC8-0000w1-Sm; Mon, 29 Jun 2026 18:59:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348001.1605838; Mon, 29 Jun 2026 18:59:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHC8-0000tU-Ob; Mon, 29 Jun 2026 18:59:00 +0000
Received: by outflank-mailman (input) for mailman id 1348001;
 Mon, 29 Jun 2026 18:58:59 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vishal.moola@gmail.com>) id 1weHC7-0000tG-CY
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 18:58:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weHC6-004Xi0-63
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 20:58:58 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a42c063-5cb7-0a2a0a5109dd-0a2a4509ba9c-16
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 20:58:58 +0200
Received: from [209.85.210.182] (helo=mail-pf1-f182.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a42c070-97e6-0a2a45090019-d155d2b6f07a-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 20:58:57 +0200
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-845c92bc464so2199529b3a.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 11:58:57 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net
 ([2601:644:937c:6c90:6d4e:7b2d:4a39:fb0c])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-8479ff8f959sm223955b3a.3.2026.06.29.11.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 11:58:55 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782759536; x=1783364336; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxPWJHTw3pT5c3azMOI7S+84d384F4LI3DJDkaDNu6Y=;
        b=VHjvW+3tqRx/C2Yc7ZgCzdGAS7o/UKm3b65ad3US+fn5SA+RdpvHfJ7gVEf1pqTahC
         L0EYOOhLq5SgMkJIDoJxniTvNeeSpgA8/wGw73e/dK/9uq2NxeNBJgE/AoZ6c9Y00OtG
         eNQzbBKXowVTuroRF3UDlJQkmPZ/pcchpxjsf2jAfIYv/z/ngJMzVH6t1GMFI49afTBQ
         4yjTloSlPrNMG+KdT1a/Lym8eZfloVg5I8GsewB74KjuUgknsabl/21eePVo8Lpcl03f
         nmYMcXe4C2Je937r5H3C2gBWK8COBLs5De6mqSFhcOz5+nN9Ewe2I6KiOzKy7+4cpcNa
         oeVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782759536; x=1783364336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KxPWJHTw3pT5c3azMOI7S+84d384F4LI3DJDkaDNu6Y=;
        b=tXK9fyD/QXSotMCpsjG8bVh9mUHQ5Tp9jMjmtu1Dk4vS4ktNQLES9XeuMj/NC2Zkyb
         sDaKLBIcXzWzm6/66uM8MCC4dgfTgQ/xDL7JFXEK42KGNBHfIJElADIZv6Pb2O7RA0j5
         UTLF0ym/0gD+hsU8ckh27JEHlnSN7NEkXigwtgi2PdnBdeFd/lAeZyTacf6xUIIMe9Qy
         gc+8bLXE64sh8Tuk8gU8kgcXP2RwgB2becKrYxkwStcvYeqShupsfzqkOYtDm9l3nIIA
         7vmqzLRZW/HrdwPNkJcg2LQGvVuYwZ2ibop/NUNLN6N4N/C3Jq59rdmv/aAtPN5dXnuH
         KSrA==
X-Forwarded-Encrypted: i=1; AHgh+RppfDB//WUdmft2fcFbXEthw3wf9hDSBh+7ZwB7u97DEUzBONHns20fZjUGqbHdtSnJrpv38YQVOIc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGJfA7I3pYM3IH0xxvjhyttj9T3gx73JK0jLoymFP7XVPGdlJ3
	nY/SFkGcLKCQ3ogU+gdTObsC5epQIA2Z9QFzIP4HPNqYEQ0W2HGH6dkd
X-Gm-Gg: AfdE7cl9EisK43csiqfjY/R7BQuvcZj0pghKv1bUd3bzygITa8BkNlYwqFlIa1ob/Gm
	0Uxml4Qfa4BRJzE2T8v1PnJDgb+b3BWmWIAts0jDXiF1ynnPGujKGtAqOp1N4Hmae3o0DlH348w
	rsTrUpuvc0pK27HJ1CkxJ7ked1VZcMQeLzJBvdswa2H8/dWc6Uljxyh/l+RbFUis0drhGiPYFWq
	diU+f2MBSBzSyNKGSzOqp3qXU0CfiZb/aOQLXtQO6ktRa+h8iq8trxT5dAxPn/V8NPtvBnoSh4z
	1qtqPw9xgD5w6lw8Vqvptd0T1DQxPe5SRE7EsaQHKV2ov+xLCa8CwDZuGDKT9+MqJA8Prrn06L3
	StgBxfNwALrfLl2+KpY0xLkD0UObpmrygshpcecXFrl3xQQH4kh4/ZhCJQR9yMtJYO/GcNC29M4
	utb/G1fc7FlHADgr3mI6mt/dFC89GIdYwiBdJkjduLVX8d4tLMY9glIkFpXBe5iYeqmt4xQq4=
X-Received: by 2002:a05:6a00:3d10:b0:845:e60b:b5de with SMTP id d2e1a72fcca58-8479f2d3dd2mr559982b3a.59.1782759536056;
        Mon, 29 Jun 2026 11:58:56 -0700 (PDT)
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
Subject: [PATCH v2 1/9] x86/mm/pat: Use IS_ENABLED() instead of ifdef
Date: Mon, 29 Jun 2026 11:57:34 -0700
Message-ID: <20260629185742.126987-2-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629185742.126987-1-vishal.moola@gmail.com>
References: <20260629185742.126987-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1782759538-4693A986-7059928E/0/0
X-purgate-type: clean
X-purgate-size: 1129
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
X-Rspamd-Queue-Id: 29D156DE2B9

Use IS_ENABLED() to check if we are on 32 bit. This standardizes this
check with the other 32 bit check in the file. No functional changes.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: William Kucharski <william.kucharski@linux.dev>
Signed-off-by: Vishal Moola <vishal.moola@gmail.com>
---
 arch/x86/mm/pat/set_memory.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index d023a40a1e03..3b9032a3f315 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -888,8 +888,8 @@ static void __set_pmd_pte(pte_t *kpte, unsigned long address, pte_t pte)
 {
 	/* change init_mm */
 	set_pte_atomic(kpte, pte);
-#ifdef CONFIG_X86_32
-	{
+
+	if (IS_ENABLED(CONFIG_X86_32)) {
 		struct page *page;
 
 		list_for_each_entry(page, &pgd_list, lru) {
@@ -905,7 +905,6 @@ static void __set_pmd_pte(pte_t *kpte, unsigned long address, pte_t pte)
 			set_pte_atomic((pte_t *)pmd, pte);
 		}
 	}
-#endif
 }
 
 static pgprot_t pgprot_clear_protnone_bits(pgprot_t prot)
-- 
2.54.0


