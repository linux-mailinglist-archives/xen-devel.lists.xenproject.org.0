Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OEVII5m5mmlvwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 19:46:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D72E432147
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 19:46:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286391.1567466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEshH-0004gk-Sh; Mon, 20 Apr 2026 17:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286391.1567466; Mon, 20 Apr 2026 17:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEshH-0004eW-Pk; Mon, 20 Apr 2026 17:46:11 +0000
Received: by outflank-mailman (input) for mailman id 1286391;
 Mon, 20 Apr 2026 17:46:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wEshG-0004e7-6x
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 17:46:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEshD-0090Zo-Ba
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:46:08 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69e6663b-e002-0a2a0a5209dd-0a2a4501cb2a-24
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 19:46:08 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69e66660-c1f2-0a2a45010019-d155802de4ea-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 19:46:08 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-488ad135063so26926565e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 10:46:08 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a0c13sm96463505e9.21.2026.04.20.10.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 10:46:07 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1776707168; x=1777311968; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nQ1dtS+UVA2Zj6+lVhX2vjjkpgXkpEEgSIyaxC0p6Kw=;
        b=nn0C7kY6Z+YdJS3Zo7Z1bmD/LMbrbmEdSjQK6jYSHTih26fbtrt/hSlvComNGKjRHC
         ++nz2fkge93vpdrn5ZzZOFiUEPoZZlZCfpdQ3NgdUkx/pODAhazAoXQ2wKMHcFU3AW7T
         pzVQ8fHmQGJE2Z/EdyH3U9Ho7wmMWil5Su5Q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776707168; x=1777311968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQ1dtS+UVA2Zj6+lVhX2vjjkpgXkpEEgSIyaxC0p6Kw=;
        b=S+DieXm7aC19VK5KQxBzpNkeblyOKYIP2gwDCsF/r61DmjCZgA4R5n2TFLOkS7a7KE
         MR4i6wJDNhDRfbl/gb1Ne6sZZSJjXBhi8RPzLpIhBUrE8I185VoONty/Dl9caSVjajC6
         jE8dx4IOg/bwi4ipJjL2RsfTiOLdmyJldupCLCt0hWXNn6rER1JIKa5LGQ7zKtIBXB75
         1xXIYyWIFh2SuDsfb/35SDZomcNwTpL7B1ddWxwMY9VHkFsXPWOhe0FF2xhKv4KSknQP
         XAOGKRuf+rIqrJIbTK0TMIX56DAFSM1HwAnVe5y9DQOQo0QhKbXYFb32MenN0t4RrWN/
         aD1A==
X-Gm-Message-State: AOJu0YwxZq9VnRbYZAlpYAOmetI2zoYMjOsKIMQWsjn1iqbW0C4fnQbp
	q7T5bLJktPHdT+Pwfg51jNRVbGRdJNFQ/6W2HuLZ3qZmgPq2HwT2WnmMCsVXFIUHBGCtEuxVSc2
	c2b18pL4Z9g==
X-Gm-Gg: AeBDiesoSx6CWUcGE++IpQOz9M2G75uTumbIx85FFOi8EBnN2bpj60gwx+zt5ZayThB
	fQn1DXeJ0p8bAdNUoVMNAkvdOG7JZxmpfcJyXXkB1H+28EnnqAMT+vQUmtHeu0W/hKhMthNYUzZ
	YvaqpIL5QiNwoOvcgtTi0+3XsnhUN6a8yfN7kUxFZY/bECiME7VOR/0vXt7yCr1SnZvH8l6m1Ya
	PKyROhGzk46pJQnfHcCrBeI1VrgXnBkX/6Va2i6qH1MId76ycZn8DHmOK631C+YbcuNSSlFCjVA
	HdYbZDRn3A6zZVGjSrezpRhqAKb3X1uUmDxsfDram2BMGLIlTBFG68IOj/UdJtUhZAiLQPApJtI
	yHaFPPWtSgBIGV2aSDBjxqqM69yrs4veUdsg0A9U208n9KOnNee1n6JQcLTSGv5tmbYHk8wGrhC
	ubH1W2bFKLF1A2IsK4yEXFHN41DXGvFdBZI0O6dyhBcqmwsOVKWbenAQgTtvaEG34kaL4AqvA6l
	sKxIS/MRAon1jpwSwqekCaJHA==
X-Received: by 2002:a05:600c:8909:b0:489:1b10:d896 with SMTP id 5b1f17b1804b1-4891b10dd45mr72830655e9.0.1776707167691;
        Mon, 20 Apr 2026 10:46:07 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH Xen 4.20] x86/apic: Fix asm() constraints in TMICT calculation
Date: Mon, 20 Apr 2026 18:46:05 +0100
Message-Id: <20260420174605.706329-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1776707168-B6862FF4-1804EAD3/0/0
X-purgate-type: clean
X-purgate-size: 1925
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0D72E432147
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The encoded MUL is 64 bits, so writes %rdx too.  At a minimum, this needs
expressing as a clobber.

Also fix a logical disconnect between 'overflow' being the carry flag not the
overflow flag.  CF and OF are always the same for MUL instructions, so use the
flag which matches the variable name.

Fixes: d5c70a51bfbe ("x86/APIC: handle overflow in TMICT calculation")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>

Only affects 4.20 (and earlier) where __builtin_umull_overflow() can't be
used.

I've kept this form because it produces best code generation for GCCs which
support flag outputs.

An alternative would be to capture product_hi and check the nonzero-ness, as
that's how OF/CF are produced in hardware, which would be better code
generation on very old GCCs.
---
 xen/arch/x86/apic.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index daf597ed44b7..764ee1e98f77 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1317,9 +1317,10 @@ int reprogram_timer(s_time_t timeout)
 
         apic_tmict = UINT32_MAX;
         asm ( "mul %[expire]\n\t"
-              ASM_FLAG_OUT(, "setc %[cf]")
-              : "=a" (product), [cf] ASM_FLAG_OUT("=@ccc", "=qm") (overflow)
-              : "0" ((unsigned long)bus_scale), [expire] "r" (expire) );
+              ASM_FLAG_OUT(, "seto %[of]")
+              : "=a" (product), [of] ASM_FLAG_OUT("=@cco", "=qm") (overflow)
+              : "0" ((unsigned long)bus_scale), [expire] "r" (expire)
+              : "rdx" );
         if ( !overflow &&
              (product >>= BUS_SCALE_SHIFT) < apic_tmict )
             apic_tmict = product;

base-commit: 5f7054258c6937b74aee411f16db5eb54ce9fda1
-- 
2.39.5


