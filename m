Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEKdOG+yGWrryQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:36:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BB8604D95
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:36:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322629.1588949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSzFn-0004uC-55; Fri, 29 May 2026 15:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322629.1588949; Fri, 29 May 2026 15:36:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSzFn-0004pj-03; Fri, 29 May 2026 15:36:07 +0000
Received: by outflank-mailman (input) for mailman id 1322629;
 Fri, 29 May 2026 15:36:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wSzFl-0004iq-Hv
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 15:36:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSzFk-0016uA-Uu
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 17:36:04 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a19b253-5cb7-0a2a0a5109dd-0a2a4506e07c-36
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:36:04 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a19b264-7371-0a2a45060019-d155dd2fbdc3-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:36:04 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-45e6a4d0be0so6412131f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 08:36:04 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34b834esm4196196f8f.11.2026.05.29.08.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 08:36:03 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780068964; x=1780673764; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbvjQGIXrgh2VZV7pqCGHyTdh0FdQdlsGVZavBAbEBI=;
        b=R4zv9jQGJ0ynoZ3jc57s7oa+hDDND4CXOJHQ8pgjmuZceSi5EYsgIZ6/AmeECmJRTT
         EhmmV9ZpOoy1aWhG5wRvBkzaLOIE343l9zisn1VqTV/0aZI7MfHKfD/pG76e1ja4qtEJ
         c+PfvM4xV8TUrWLBUPQ8po0RPd58OgRevN5/jYRA7iog5ler48A5TMEzkGMOGvy2/47y
         c8dknMjK8JHSYqaBIE6gxU2T/ybTUJqP2z7f1K+RKgxUBsygdSuDGVl1FOPFN15E77IG
         Z6O34oiGXzVTABxhFveZj200nUKCw8FLYoeDcHm+kw3Lhw1LEg7TTYQsdtZUFJFSkb9l
         BRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780068964; x=1780673764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dbvjQGIXrgh2VZV7pqCGHyTdh0FdQdlsGVZavBAbEBI=;
        b=NTPgp5ws11ytPBiqkg5qkCB4NdSxFOEVpC9NW72ZDuYvY+W84ARDlT9+ZcpvhJPPJO
         7u4hC1Q5/8l+QsUn4tf1iyGh0sWD9mVnkbpxoZwoq3JhUf7xQk/fXAZdkzC5u2yyRH/W
         J7JYVMz7czVkNpuTcQ5i2Aye11J/0bkKHSPyHFDmxee4/qd7Y3miDKC0AcbNByanCSdK
         fwxZRij+MSOhfj8b2mg4n4hSMTs01OPFKBsb0GvU/wWlsCzi0IPmIFWrKK2yNQD3gCoU
         X7MUcAfWnV6VzbsXSjK8TZ/fgis0ph6OZ6KzCeQ5k6d3KCxIzZK+H92E6Gn1xpVmEkKr
         mV9A==
X-Gm-Message-State: AOJu0YyeoyspDlnnOuxjhynjdnMEHRZ0y28xOP7+ArlbIOFwGR1P7rcD
	L7JFen8gMRgMpsQOt+wzc08pSCXwj7NFWAPviKzzVgtJED3UlbnqgdlZnSh3qPOQ
X-Gm-Gg: Acq92OGdHPhpRfEKwCxtcQaCEQ1MTsSjUSGy7MfNGOTQcpbXNCBE4ebQ3zSPwoLNvg3
	2BuRQ7p3IlDnbYn+RoCRt56XL9owDPyyALxW5AT0DLmfswktypzExD4T5NyNZgwooG4el8tC7PM
	yOZRjma218zP7fKpMpfHnUpus0oALRWWyhVbKRzRCZjME92mq30niTBenF+QwfVF57+qvlAw6Gj
	nXhsmUSdDM9+NpFV7Dmpn3p8Gte7hYlgSnyQ6lj94V4GHl7PDzjq5Y1Q5CNo1Xny5lwjXApc8UM
	bmadc6rCwt80Ka9av4hcq2pKzEByVyemIzgOhqgA2/2eM/tnPsLyhJyABlfKeZ8Wp+XCubS3Yxt
	IBwyDFzX4/nW25SbKVgcBJWsaGQVJMMa+pXLKYCnHBtrzQAeWOHZ6HYZCCrCqCqfJBl3m1KcSEG
	NDAwahCjBKHh68OanGNU01ndHSTQrWzoeTeLe7OTCLurWzLP+k8RNEmFlfa8kRPg2zrq+b89Zmz
	xymTp+8eDyYTbT/KjbzwK6wX1JRRvZ09epA
X-Received: by 2002:a5d:6e89:0:b0:45e:73eb:1ff7 with SMTP id ffacd0b85a97d-45ef6af6c21mr490829f8f.3.1780068964295;
        Fri, 29 May 2026 08:36:04 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 6/6] x86: Split .init section to satisfy UEFI CA memory mitigation
Date: Fri, 29 May 2026 16:35:31 +0100
Message-ID: <20260529153531.1341542-7-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1780068964-84767D75-1041D615/0/0
X-purgate-type: clean
X-purgate-size: 1327
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloud.com:mid,cloud.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B3BB8604D95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently .init section is both writeable and executable, split data and code
to have 2 sections satisfying W^X rule.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/xen.lds.S | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index a5a85e9b8a..7f892cb2fa 100644
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
        *(.init.text)
        *(.text.startup)
@@ -210,12 +206,12 @@ SECTIONS
         */
        *(.altinstr_replacement)
 
-#ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
-       . = ALIGN(SMP_CACHE_BYTES);
-#else
   } PHDR(text)
-  DECL_SECTION(.init.data) {
+#ifdef EFI
+  /* align to satisfy UEFI CA memory mitigation */
+  . = ALIGN(SECTION_ALIGN);
 #endif
+  DECL_SECTION(.init.data) {
        *(.init.bss.stack_aligned)
        *(.init.data.page_aligned)
 
-- 
2.43.0


