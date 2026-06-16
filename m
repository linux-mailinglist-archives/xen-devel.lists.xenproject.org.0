Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 92OXF+shMWoWcQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:14:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E67B168E0F5
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:14:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=irXgKyTX;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1339039.1600182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQno-0004QL-HY; Tue, 16 Jun 2026 10:13:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339039.1600182; Tue, 16 Jun 2026 10:13:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQno-0004NA-EY; Tue, 16 Jun 2026 10:13:52 +0000
Received: by outflank-mailman (input) for mailman id 1339039;
 Tue, 16 Jun 2026 10:13:50 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wZQnm-000409-FM
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 10:13:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZQnl-003Fzp-SE
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 12:13:49 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3121da-bab6-0a2a0a5309dd-0a2a450bb25c-6
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:13:49 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3121dd-212f-0a2a450b0019-d155802ed87a-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:13:49 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-490b9318997so31384405e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 03:13:49 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea94f5b0sm295160265e9.1.2026.06.16.03.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 03:13:48 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781604829; x=1782209629; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFITs22eOFRWlUIcORe3IAjkHztBHE2ao+BX4i1CqUw=;
        b=irXgKyTXES0FSnXHsPUhd+XSNaMNIlTmEX3V/HM8hT2F2bpwb/Fbbmo1VAglXdjkRM
         bzHMYDPQA4/D70pnDoHoeG+NgcdM3oWX8WscC+BSiTBbzFFUt5sDtHghX/pramg26aW7
         g44TaW+3+kiGJVY4rdtEfog9X6Zd2zQ+2bJo3B1VyHT+4okbZBC6lPMI2Eo2jIaaYSAv
         prHQBX62G0SPnmiLuCPmAaXViX5TgtNww7xW/f5ii//hJ3MzxDrLk8HQxMRCC/wMsA97
         DpVV4B2vId1Xpbx1H0YNHL7k5vlejpw7DYoRU+gXAdy9GzaMSUpogbF2xrJiuotqzVBU
         7A3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604829; x=1782209629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xFITs22eOFRWlUIcORe3IAjkHztBHE2ao+BX4i1CqUw=;
        b=BsUmhcjt82j8SMDFNvGIavnt/dROA/rL3rdFXSoq9D/607QNKy4ECd4nj83PJKyM2Q
         UH8fCnSrdCW6YTkbXOtIEMgIwZNcfD98mqocvB7DkM5CCV/GwqX4VguVkL03zGACI5YG
         0zG2wF4H5uvpo/Y0Jt6CLQgXikv5ai0zZ95q+O5MlVoj6Jwqq6qec3BHSM48WtWeiBXM
         wSTJ2MH7k8V3GQJi1Msf5lGWuW3EpaItoTmw7OTm++5AtD0Y5eTt38CFs4xo6Tj7iUdZ
         rW9z+rn09y6HI+oE+jiOKY1YLMsXHHS1Oah1VvHwwn5BSUUyJ4pI4BqzY5JvWuYCSemb
         IgDA==
X-Gm-Message-State: AOJu0YwZQICY0hdikKmvh195Ayfg1b0v/Y9nsWEB8ndzdfYR/TMzupfr
	sQtKCmAxJxUoZ8jduV3+EBc/M092Jm/JI1s9dDGnHOBtlNoAYuzIpIZ7lXLarilq4jE=
X-Gm-Gg: Acq92OHMwikSqfFaxxtZfmUJlHeU1sBt7+FoYHT8tuNeVOKR8AHIz9W0P7A5wB2/hj7
	Jeeoz5vjn4ETNVpPAkFSVG4pcHgJ5tjUx8yi7HHNz8zmgK6i/GXcRZJeD4VzaYDSLSo0Y2cKhvd
	Q5zo7K0IBICe6BiTYidCqRsZ4eVgdnx/a/kK3Pg5RbdufDBeB59DOIP4u9w3IUb412tmFjW00l+
	tyW9SuaJyx6Aao3JIMh3Ct6/kTUN7JEfdsKt8z6tqcodM45tm1UtAhLKb58oQP0zXusET6cYGG3
	a1vwikrBCPpNcMrZOJHrbsSmQmbDb1i3S8E2QNyNlbuG3V5fgpagL/lNOtm88GcJ5e3s/0RS3uJ
	znZyYGKERI/W7vPY+wodpxFC61wu4Uj/0eZ9F1HQqFujbOAWxOWs7DEZ1/cj1miMI8AaM/ODasQ
	Xr+f7a0gh3ue+cELczMcqyJ4wPbSVYJVyCPq4CK7t4GTzBVfMcZawxQAuAHqdrCo3+6yAaTNHmV
	sBcc5qUEmftc8JWU4uZ4B1g35tx1hBtBrugFg==
X-Received: by 2002:a05:600c:4e90:b0:490:b724:5085 with SMTP id 5b1f17b1804b1-492201641dfmr197752535e9.33.1781604828879;
        Tue, 16 Jun 2026 03:13:48 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v3 4/4] x86: Split .init section to satisfy UEFI CA memory mitigation
Date: Tue, 16 Jun 2026 11:13:36 +0100
Message-ID: <20260616101336.44009-5-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616101336.44009-1-frediano.ziglio@citrix.com>
References: <20260616101336.44009-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1781604829-12D77F3B-0A3F6D84/0/0
X-purgate-type: clean
X-purgate-size: 1760
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,cloud.com:email];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E67B168E0F5

From: Frediano Ziglio <frediano.ziglio@cloud.com>

Currently .init section is both writeable and executable, split data and code
to have 2 sections satisfying W^X rule.

It is a requirement for NX_COMPAT so the PE can be loaded with W^X perms
in the pagetables.

NX_COMPAT is a requirement from shim-review,
https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-your-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have-you-done-to-ensure-such-compatibility

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
--
Change since v1:
- update comment style.
---
 xen/arch/x86/xen.lds.S | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 749d9719cc..8fefda1816 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -193,11 +193,7 @@ SECTIONS
   __2M_init_start = .;         /* Start of 2M superpages, mapped RWX (boot only). */
   . = ALIGN(PAGE_SIZE);             /* Init code and data */
   __init_begin = .;
-#ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
-  DECL_SECTION(.init) {
-#else
   DECL_SECTION(.init.text) {
-#endif
        _sinittext = .;
        *(.init.multiboot)
        *(.init.text)
@@ -210,12 +206,12 @@ SECTIONS
         */
        *(.altinstr_replacement)
 
-#ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
-       . = ALIGN(SMP_CACHE_BYTES);
-#else
   } PHDR(text)
-  DECL_SECTION(.init.data) {
+#ifdef EFI
+  /* Align to satisfy UEFI CA memory mitigation. */
+  . = ALIGN(SECTION_ALIGN);
 #endif
+  DECL_SECTION(.init.data) {
        *(.init.bss.stack_aligned)
        *(.init.data.page_aligned)
 
-- 
2.43.0


