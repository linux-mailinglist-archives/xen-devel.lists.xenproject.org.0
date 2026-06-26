Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jBpBCYhyPmomGQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 14:37:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 989A76CD0EE
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 14:37:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BOBvzVsb;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1346125.1604684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd5nz-0005Dc-8l; Fri, 26 Jun 2026 12:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346125.1604684; Fri, 26 Jun 2026 12:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd5nz-0005B7-5Z; Fri, 26 Jun 2026 12:37:11 +0000
Received: by outflank-mailman (input) for mailman id 1346125;
 Fri, 26 Jun 2026 12:37:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wd5nx-0004eO-09
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 12:37:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd5nw-006RzF-CR
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 14:37:08 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3e726d-bab6-0a2a0a5309dd-0a2a4509caa2-10
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 14:37:08 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3e7274-97e6-0a2a45090019-d1558033acb1-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 14:37:08 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4926fe5be4bso1267315e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 05:37:08 -0700 (PDT)
Received: from localhost.localdomain (8.17.6.51.dyn.plus.net. [51.6.17.8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268ff1be9sm76578835e9.8.2026.06.26.05.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 05:37:07 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782477428; x=1783082228; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ana3ymIwcmSeF/vMnLZznGGCNHfICJ1NLKaFG+o2Xcw=;
        b=BOBvzVsb1DUxuMZUHaPbNMSIovIhOBMcqYLQoLpJnGlm11rIRczzoRJYCdiFpCkwmo
         N/hJUkCgxeq7FdFG0bE5yBiG9rwyXSph5Iz3AdQh5T3TQu1SJAcTsVuul/qetqVaPiZI
         0qqtP3jUmGqIJg64fAWdR+WAEtGewSJDxDcWQZZr3186xxKWO+TmRsSxQPyjYxsOvg8c
         eqcrsawBeYO1lJNU9jEfe65cdl3MfwgwEyamp6W7QCkFFSZedJHBPT26meO8/FMPcn+J
         8GjtsStLFszPEFnnaV/2KrAVZGh15DzsLZ3wUF3W1y6THntTJF9FHG4XkTjRmFnXZKH9
         R+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782477428; x=1783082228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ana3ymIwcmSeF/vMnLZznGGCNHfICJ1NLKaFG+o2Xcw=;
        b=D3iOLXoEqYcUlFSEzRx/LIAWHWe5a5rDWWz+UwMaXFawdjSOVcdXUpgKtoLn4t2ya3
         h1NSEZ8a/iRZCGVtzUHJMmMr7VWEK/zQMoeCpZy2AUEvLlTPT3owpsANyWZw/rdcjhNe
         GkWhKOr8UcgfUIclUhQp41EXmN21a4ozSzCnBf/Xg3+FXW5QCj/vM+EnnxHfXSwBA8Zw
         xGtQYU4SqJTJ/4RgKJ8R5EgcZRPTEiq9ISa7RbJ1olExfT6uTjdy4LUeVLbbIW3KiG9c
         CAbxwTp7Z9fAarRjXNyAY6Swg+cRTQOiZbgDcu5osL16VK2sTVNxXKaLtI5RNxlY4mLX
         +uSg==
X-Gm-Message-State: AOJu0YwZmYTnfy0P3QAen2Y9t72v5h+8W1we54YIE5LJZqeTRfEmT++f
	7+BX4p/jpu+fqyu74MG2TC/1/85o5SUjdk8PcmzUdmL9jk0OHkXXMxrAZ46D43j6cAU=
X-Gm-Gg: AfdE7ckC759MWkwed4QxsKk6BRZ4xIyIghHAaMiuVktLhYGij0gdm4/QRyZaFKogtXp
	m5R0ZqPNf4C7SPSdBtAC0w/NIwIWQzKh0GnN3MowDTcjv9NP05DP4NhZM/maorIUDLVgBDz/hom
	dLpJVQ0yftNMIbVqkvZUGZrjgP/IB+sMZ9xelzMC4MSHkutdk4TzVX5yYXgNKAyySwzT6y3HAjA
	jvI5YxzHbkaovwa8K6OzKn707rgzJ+y/9rwaRcKTfAmCF0diuzAadT1KQECCJnLq4kssNgd4Ha8
	zf7osKG+CJg1tWF7c0AY0iUQhPZlqT0/8F1lcCSCRYoJ/K+15wv87gKrTw/jZI1JLa/BxyHxozn
	xYTqwZTp50RG6iIOK+0toJd+gbrRMZQqylbTtrQ1Dzm/OSm2GVoPsh8WixIjRL8qiUhAYVhgJzy
	zLhRy90sOY25U5eMlD5xLw/NZd8qgRkzYdPE+HFUTvXS1oxHnhkmQvrwBzz0ZFjoeWyy0Bx7Ffm
	eSEqiLl
X-Received: by 2002:a05:600c:4443:b0:490:688b:f9f8 with SMTP id 5b1f17b1804b1-4926fc8cd5fmr10059545e9.27.1782477427721;
        Fri, 26 Jun 2026 05:37:07 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v5 5/5] x86/boot: Exclude not used string
Date: Fri, 26 Jun 2026 13:36:45 +0100
Message-ID: <20260626123645.229375-6-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626123645.229375-1-frediano.ziglio@citrix.com>
References: <20260626123645.229375-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1782477428-46B3B986-A624AA7A/0/0
X-purgate-type: clean
X-purgate-size: 803
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:dpsmith@apertussolutions.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:mid,citrix.com:email];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 989A76CD0EE

If CONFIG_REQUIRE_NX is not enabled the string is not used.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 xen/arch/x86/boot/head.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index ebdc562207..981f262b5e 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -133,7 +133,9 @@ multiboot2_header:
 .Lbad_ldr_nbs: .asciz "ERR: Bootloader shutdown EFI x64 boot services!"
 .Lbad_efi_msg: .asciz "ERR: EFI IA-32 platforms are not supported!"
 .Lbag_alg_msg: .asciz "ERR: Xen must be loaded at a 2Mb boundary!"
+#ifdef CONFIG_REQUIRE_NX
 .Lno_nx_msg:   .asciz "ERR: Not an NX-capable CPU!"
+#endif
 
         .section .init.data.multiboot, "aw", @progbits
         .align 4
-- 
2.43.0


