Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lu4tK3/AQmoQAgoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 20:59:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4B96DE2BD
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 20:59:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ftJ7vuiy;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1348002.1605844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHC9-000135-8s; Mon, 29 Jun 2026 18:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348002.1605844; Mon, 29 Jun 2026 18:59:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHC9-0000yo-49; Mon, 29 Jun 2026 18:59:01 +0000
Received: by outflank-mailman (input) for mailman id 1348002;
 Mon, 29 Jun 2026 18:59:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vishal.moola@gmail.com>) id 1weHC8-0000tO-CE
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 18:59:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weHC7-004Xi0-PO
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 20:58:59 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a42c063-5cb7-0a2a0a5109dd-0a2a4509ba9c-20
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 20:58:59 +0200
Received: from [209.85.210.180] (helo=mail-pf1-f180.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a42c072-97e6-0a2a45090019-d155d2b4b8f5-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 20:58:59 +0200
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-845b733e82cso2323122b3a.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 11:58:59 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net
 ([2601:644:937c:6c90:6d4e:7b2d:4a39:fb0c])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-8479ff8f959sm223955b3a.3.2026.06.29.11.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 11:58:57 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782759538; x=1783364338; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVOlM7kPzvO4OMsU9kvVFUMLuWs6g1IuomjuOlanbZU=;
        b=ftJ7vuiyHWA4PSmW2Ow/YBio1thUGVR3X8A1LHtWmVVkFYQtCVTxNN/jESi+vUOjTl
         iqoubXJLAQwoIXhtLFaINGeeOal4uxpkFj1HJTFSI3d09iJXPpzxH1GXBpNJn+smWaIO
         5EmxNoxWl2utGEx84NwCeszgJrGwkgSNH/4/lJSho0jlr+3TwHxEngEcCGVTM2JMSSMr
         QcLisn+PFd1+ZDhQHInYNC1T+wvXhWXvFGl4EXj+GthrAH9FwmPh/iQtSPE83xucd5Xg
         QoM9jaHPeQx9+590mljwaoDcg5EgQiwVQ+5waKiNwJ6BjPXpFPbSuJhWYGJosxXsq64L
         kkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782759538; x=1783364338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HVOlM7kPzvO4OMsU9kvVFUMLuWs6g1IuomjuOlanbZU=;
        b=cNB6d97bxdL+wRRBrgnt0rCYnk1Bd9LzskvrFm8fjq9MX5gdaR6n1stsdtRipd32kn
         gOww5Fj2p99Fac/XN+WEKf9i2xRj0BSZMjTiduOBShZAVk32Em2DzdhkEzj5ry79dFlU
         cdeC0DirGrDDnRaeXpiGsMFQNqjFJw2zuMo5bxsi4JwTWWy21bKbxeTlLfu2Uf4LQdQ3
         nc+CoC2O7fsRnxzCEgMNo3UJXEQhBUftD6mIZiLw3mZbsjPErRbbJ13DRadz7TAiL3eL
         sO6pfGdWs+rGeYsZ4phmjbaOQ/3+uG0hGebKuI6CyJ9/VWjYcPFpTSN+87kEhY99NEno
         d6bw==
X-Forwarded-Encrypted: i=1; AFNElJ9b05ckREOn0vcHWFGgM1aU9DWTymviNHgruZVAUgXmKLlgXe68WZaH7YJZcDb8/mimcGL+pq3WqrI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLcYBwyRz3V9IswaudFh+IwuMpSaRjs6vSREobKK2Bl5U1/yzn
	DvCIXWwpccXk0x/8+bi0Gd54m9/E6DdNfaSQIb5aeSMF9q8YfCdrhV2v
X-Gm-Gg: AfdE7ckPxDve9CJx4fsLK6suLozBVWkn8geiLzk7KIkoploMr6fY+OgmS7OG6dVZd51
	QWzy03mxBDwqYH+qrCag/EygP8ubk8VuN/P7piI1uMwXZDQPPZ6Dwu9DEbWQC8zYEi70+CsIiva
	EcnhN7MGF+gFlo+pvMJARj75T+Hmx20l9XiNMNQMqUNWhSYeK6CrcF0M7fGg69kyBH5xukNHBfU
	UaR0MwyCUx3w2UHnbB4o94QXaS2AQNdOzkI6eg3dRI/HyGeSoAz42G5II9Vdusyp9/1Dz7QBGZT
	is4rf/rAADe3a4vzSGP/fmrA1zdrwMNZUOjyyWMgcUGv+EHJsPtGTIAAVF29YtCZ2aQ73G6DJdN
	5nWKhS+muLPC8C/YPncJOvcCzKWbj/JnnCmkBxUOvXxEkRcm+iO1eJYtpnji2CpMPpposLQLA3u
	lpGwuaCjXN1Kn8gQwQSLP9Ah8sljnM1mFxq/97WGQi47haYPg+d+4zJKIzRtrqxOTGJTU/fQ4=
X-Received: by 2002:a05:6a00:2c89:b0:847:8971:87bb with SMTP id d2e1a72fcca58-8479eec6fd9mr551262b3a.21.1782759537763;
        Mon, 29 Jun 2026 11:58:57 -0700 (PDT)
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
Subject: [PATCH v2 2/9] x86/mm/pat: Convert __set_pmd_pte() to ptdescs
Date: Mon, 29 Jun 2026 11:57:35 -0700
Message-ID: <20260629185742.126987-3-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629185742.126987-1-vishal.moola@gmail.com>
References: <20260629185742.126987-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1782759539-4512E986-1ED51F5E/0/0
X-purgate-type: clean
X-purgate-size: 1210
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,linux.dev:email];
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
X-Rspamd-Queue-Id: 9A4B96DE2BD

Convert __set_pmd_pte() to ptdescs in preparation for the eventual
splitting of ptdescs from struct page.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: William Kucharski <william.kucharski@linux.dev>
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


