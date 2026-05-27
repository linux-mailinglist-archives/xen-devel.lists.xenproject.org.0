Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPpjIPL5FmrUywcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 16:04:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EA85E586D
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 16:04:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320491.1587764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSErl-00063C-GR; Wed, 27 May 2026 14:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320491.1587764; Wed, 27 May 2026 14:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSErl-0005zT-Aq; Wed, 27 May 2026 14:04:13 +0000
Received: by outflank-mailman (input) for mailman id 1320491;
 Wed, 27 May 2026 14:04:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vishal.moola@gmail.com>) id 1wSErj-0005xG-Vh
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 14:04:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSErj-007NSK-Bg
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 16:04:11 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a16f9d1-e002-0a2a0a5209dd-0a2a450ce74a-42
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 16:04:11 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a16f9db-62f1-0a2a450c0019-d1558036b0ad-3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 16:04:11 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-49039a8851fso62330125e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 07:04:11 -0700 (PDT)
Received: from fedora (cpc92878-cmbg18-2-0-cust539.5-4.cable.virginm.net.
 [86.16.54.28]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-45edb558f52sm6693771f8f.14.2026.05.27.07.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 07:04:10 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779890651; x=1780495451; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JDtbAu0FdDQr0xPj+QYmQdEcSfPjgFyi+UN5Ynqy4tE=;
        b=oIFCPnylFYx8YE55wNrNFbd2ypu8fn/b3s+/2zPNLW/OCzTkcNizB1TEi0zvJT0c2n
         GD50xDmjmZMyk1XZe1S3B1rj+2zDlWQEbIkySU3AAq/UtR0RLKu8BYXD4Ma+1vE6ae2g
         HUGitwDX+23LndvlL9/u0Sm+/gPbRnhs++4SoS4dcCoTnxgGVrVO2YccbG991Cw1OuwT
         qNQvDZWnf4NCQdcYssRAy0yeEmblSwcVjXvjrwrpA6QSui0Ts1rSDzJVGLR3nxL+6G9i
         6NUURgJofhtwj3ULAIhuz/nR7Iz23C8CVU76m9TLjHiT7DdewK8PsEwkZhEh8BAk4ci/
         rxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779890651; x=1780495451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JDtbAu0FdDQr0xPj+QYmQdEcSfPjgFyi+UN5Ynqy4tE=;
        b=pXZ5KzDU2Xt3+xmwX4XENlIBA4ONCGEfIGC+pCYP+GN49oPFxXL/C0dJuyaMKKrapg
         O5uYqo20+UWIGsCehGWYoLE/BMaQn7tikAMbz+WfrLy/r/gdUSSvmjgmaoyZAV183mZO
         ycYaXIvMS3wbYIY6/O9FR2M1hucuYhJ/8nVxxHv8y8/+H5aJVtXE27zHiaA8bx5UDEaQ
         R0Jrn1TDy9ORuHg6mHvFNtzatdwHo+CHUl9bDy0tOyvDz3PZAwqZMPLuduRV1hTSfH4E
         OFBYsk5pmY0ChGVOtq3uo27WHg7ieXnbzvfhy5viVNTwnRVWtjvOTab/I3ol9Biw90an
         cnNw==
X-Forwarded-Encrypted: i=1; AFNElJ93rUfVFNN1g8D96TAfAVRIXFBw+QQBIoh/2bReofds0UxjBfl3eMxWiD2g68x4qWYYDJ8mo2Bmfpw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzACPxrp0PhoghS+x7olhl1DiK+Y2GF7AfW56cEcObsIgf5+uS4
	VENAEMgH49Usrb3P9ghcMzjps6j4eV3Tv3KYxMd99dmlaJfWNIzdNFMc
X-Gm-Gg: Acq92OFJeV7de5p/ZgFj+hZs7gkAxgrmSrEfKBimYz9aNPmICeLkP1sPxl9cb6SkY5j
	Qg15sDUhSkX16uOEeX9Z+DBGZN94Ueemgaom0sSoxG9FUlBO8NGeYH024FyOPYF996OUZ0Alsqg
	BTkUR2KLe4jjfiK/ypkRIR0X2fCVZh8HNY5BaJleT2js2P5g6gKN9aIY9SxmlbhtzWPrlmU63MI
	tQFTsJpK5isFVWbHuWkmmcEsotzxj7hqqxX8gn0wInyFlOJFBBkwn3Paj2+NkMLJclGCi/Ketm4
	OSElMoyZ6Tp6M5j4evWog8rmXA8/PRQjJOrvt8aB50LrNyH5w4rqw1cwdRaq3zz1+O/734sBYL/
	RRa0Wm8Vdfr6rAy4dFTJnS5BfG118sCqXyN9wy4ZxGQqNfbZ/SBBU3hsvmhHiL3QFabWsYbAIop
	KcTFIRyN5QLgMAzJcvwRUtMKIeE1chHjpVWU0ZypAdZdJKLE0ihzXYNeHEyC0U0ZFlfl64PhCHs
	aOxEZU3KMnaqQlOD77U2Q3ZY8V976sCDoUln5dbOrNA
X-Received: by 2002:a05:600c:6383:b0:490:4717:970f with SMTP id 5b1f17b1804b1-4904717984dmr382832315e9.14.1779890650342;
        Wed, 27 May 2026 07:04:10 -0700 (PDT)
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
Subject: [PATCH 1/9] x86/mm/pat: Use IS_ENABLED() instead of ifdef
Date: Wed, 27 May 2026 15:03:08 +0100
Message-ID: <20260527140316.294621-2-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527140316.294621-1-vishal.moola@gmail.com>
References: <20260527140316.294621-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1779890651-E377ECF5-F5EE87C9/0/0
X-purgate-type: clean
X-purgate-size: 1012
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
	NEURAL_HAM(-0.00)[-0.961];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 20EA85E586D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use IS_ENABLED() to check if we are on 32 bit. This standardizes this
check with the other 32 bit check in the file. No functional changes.

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


