Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eZQGH8wIH2qodwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 18:46:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8658630576
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 18:46:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=CBMt8LzQ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1325278.1590773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUSF3-0001AD-4s; Tue, 02 Jun 2026 16:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325278.1590773; Tue, 02 Jun 2026 16:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUSF3-00017n-1r; Tue, 02 Jun 2026 16:45:25 +0000
Received: by outflank-mailman (input) for mailman id 1325278;
 Tue, 02 Jun 2026 16:45:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUSF1-00017h-KS
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 16:45:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUSF0-003uuK-Sg
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 18:45:22 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a1f0891-5cb7-0a2a0a5109dd-0a2a45058f04-40
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 18:45:22 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a1f08a2-aaa8-0a2a45050019-d155802acc81-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 18:45:22 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-490a7629380so27698055e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 09:45:22 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0e2b4e5sm85731745e9.7.2026.06.02.09.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 09:45:21 -0700 (PDT)
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
        d=citrix.com; s=google; t=1780418722; x=1781023522; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U5E49+b+uC/od9SZLoU0uYb9I0eV+tcWYMSLbFGajYw=;
        b=CBMt8LzQYum3CGxvR+33ka61TFI9rz40PmPQnyFmoTL0o9hcuiLpDY+rllvn40FNpO
         JZtmZgttndvZEUUGjNg0skziQ0G8c8W1tTRXTGOCgQ2wHb9SZ4OF7J6CfQppldmI5Sl2
         KgBizko5PcYXBgm4gX4kztJn6+ooOnhKg2DxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780418722; x=1781023522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5E49+b+uC/od9SZLoU0uYb9I0eV+tcWYMSLbFGajYw=;
        b=X09up92uqOElE6IV6KQXY5BpxLKWjDZRkZ2+gSGRrvuaMKWHnABAU+/qd3MmHwdFC3
         tjCjvjmw3Ven68pQbQ66qrVyzGv0WGwSXGNsS6NswX/u2vSJ1v+bQJG3pdb9mNxhLFaz
         lTQ20/84j0qtGPIZ/UQqbL2sL7o88bry5lzMrYH41z4bGnC4Jaiv2S3pBbSdiXHXMnFG
         Q4GAR6lth3HdlQq9efGQzb11ME/nJlV3OVclxG5Yn6HgEk5LwTiTbAUu5YEYxjQ2wZpr
         nKPLK8BVcCR36ZdtMhJRK6Wl9Wi2Sgfdc6UM69362PZlBsja/OAhXIIzIVR3oRQiQQnl
         cgdQ==
X-Gm-Message-State: AOJu0YwoY+oZcPSBril7LfNjnOOS1xsnWIiPUUMsH5b0O1W/Od4KQ9QF
	7WLR51Hw6B0uHs4Bo4pdDvkvBaOJ8ciELhF1lnLpNo97R1TZgd6+MH5XBgz60Twsi08DkRL/NzU
	mFjLk
X-Gm-Gg: Acq92OGHArNbvp8uo47t70HFFsbB2Uo3W1MsqHqTmvgO0ON6bGhOnJD5etIujViKO15
	2W2wR29DYYReUfa0mG5Et4918hZWeSfnOLmuEj+n6yuSyHL64wyVXV9JjQQ1LVtgsN29JSWh7qR
	o+wKMnWc+daw5aHHAHg8ycF3A4/icMxpKl7Qg0/D09+49Nl1TY3LAJckX0JRArLmxqB1OXSSaIw
	rmTDq4w1OAXviZLqYfO27azeKgPyZfLTFADy0cDCipXnRJvRYkiv8LpDqbK/zywmI7R9JZw6gbW
	Qu+wpC6vbz01INlw2aYQ2IrGRZt07Yfov8KjnHSbCtv+bg+07ye6onblUP7ztXigYxkhcb3Rjax
	6ccmMgkpXQ0ck4pAjIsc1MA0cF5yY1ny3nmKaRsQGQRzDEc2DTu/MqezPxxKj+tPXv1Be/J6MnF
	lutKl8KKOCpba8WkwHvsq40LnsbwOrsKKc7hEc8pWiXmUNivU+nt+Yo7+bmtgdZHQr9e/b2WlFW
	m9cCDptpyvDfbY=
X-Received: by 2002:a05:600c:8b27:b0:490:3fa2:1b93 with SMTP id 5b1f17b1804b1-490b5064808mr8729965e9.13.1780418722069;
        Tue, 02 Jun 2026 09:45:22 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.22] x86/fred: Enable FRED by default on AMD systems
Date: Tue,  2 Jun 2026 17:45:19 +0100
Message-Id: <20260602164519.2634144-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1780418722-E1D9D443-66F37A69/10/73395122804
X-purgate-type: spam
X-purgate-size: 2389
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:mid,citrix.com:dkim,citrix.com:from_mime,citrix.com:email,vates.tech:email];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[citrix.com,suse.com,vates.tech,gmail.com];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8658630576

FRED is now believed to be complete for AMD systems, and has had its tyres
kicked by both XenServer and AMD.  Enable FRED by default on capable AMD
systems (Zen6 and later).

Support on Intel is still not yet complete.  Leave it as tech preview and not
security supported.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

The issue on Intel is to do with virtualisation of MSR_SPEC_CTRL for PV
guests, and is waiting on the resolution of a question I've asked Intel.
---
 docs/misc/xen-command-line.pandoc | 6 +++---
 xen/arch/x86/traps-setup.c        | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index ef3c7371895b..50c119e5b79f 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1259,12 +1259,12 @@ does not provide `VM_ENTRY_LOAD_GUEST_PAT`.
 ### fred (x86)
 > `= <bool>`
 
-> Default: `false`
+> Default: `true` on AMD, `false` otherwise
 
 Flexible Return and Event Delivery is an overhaul of interrupt, exception and
 system call handling, fixing many corner cases in the x86 architecture, and
-expected in hardware from 2025.  Support in Xen is a work in progress and
-disabled by default.
+expected in hardware from 2026.  FRED is fully supported on AMD hardware.
+Intel hardware is still tech preview and not security supported.
 
 ### gnttab
 > `= List of [ max-ver:<integer>, transitive=<bool>, transfer=<bool> ]`
diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
index ccbd53fd9db0..a79a3b201389 100644
--- a/xen/arch/x86/traps-setup.c
+++ b/xen/arch/x86/traps-setup.c
@@ -22,7 +22,7 @@ unsigned int __ro_after_init ler_msr;
 static bool __initdata opt_ler;
 boolean_param("ler", opt_ler);
 
-int8_t __ro_after_init opt_fred = 0;
+int8_t __ro_after_init opt_fred = -1;
 boolean_param("fred", opt_fred);
 
 void nocall entry_PF(void);
@@ -392,7 +392,7 @@ void __init traps_init(void)
     }
 
     if ( opt_fred == -1 )
-        opt_fred = !pv_shim;
+        opt_fred = (boot_cpu_data.x86_vendor == X86_VENDOR_AMD) && !pv_shim;
 
     if ( opt_fred )
     {
-- 
2.39.5


