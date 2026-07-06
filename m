Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zUFSF5SHS2oYUwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 12:46:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C379F70F700
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 12:46:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dBmh5XMP;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355304.1610082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wggq2-0002k5-Ba; Mon, 06 Jul 2026 10:46:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355304.1610082; Mon, 06 Jul 2026 10:46:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wggq2-0002dl-4K; Mon, 06 Jul 2026 10:46:10 +0000
Received: by outflank-mailman (input) for mailman id 1355304;
 Mon, 06 Jul 2026 10:46:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wggq0-0002UB-Te
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 10:46:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wggq0-008v6e-A4
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 12:46:08 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4b8769-5cb7-0a2a0a5109dd-0a2a45029186-26
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 12:46:08 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4b8770-5a27-0a2a45020019-d155802ba82a-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 12:46:08 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-493b27c7451so34907015e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 03:46:08 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c63ba97csm349823985e9.12.2026.07.06.03.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 03:46:07 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783334768; x=1783939568; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HzSJO6a2Zt2m1n1ujDT4uRTju/cRsXyLEg5Me9ypANU=;
        b=dBmh5XMP7MOppMWRL6M1dvW8MkO2W9q1yKB5m8iPiQCLGtqGTAfT7sCPrxzJ5KhL5V
         eZXuL/S24r4X9jILGkqeqWXUAtPeQT5N9h1xELsqYZY3XPzcs9Rl4LI+29CHK5fFGYcI
         kYoW5GFjaqwVPd4Ga+iIIq/40EM/cbr6iz+G+Hj9tqA64gEVdhz5LWEZXRNS7zSTJdNQ
         uJMcpVuol44U8bDQAMnMj9Gv6D4X4BwUvrFF5Kzs4Heq1MEz17SPgKQZ2sPQysQRIzsb
         cdn5run4/FFEncseafTz6jW+AMkVQQYUNolu5RDo/MS+HUU12fLZ631x5qpUAgANm3X8
         Dk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783334768; x=1783939568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HzSJO6a2Zt2m1n1ujDT4uRTju/cRsXyLEg5Me9ypANU=;
        b=XSAtulQ0RWhE6qZZDPkAsvuGPdS3jR63E7XyJQrhSEsbKzJPo0nEtGvsbQGA2g9EFj
         PlBPfbQleTZyLXcrHOvXzA0apuo38h7NAlus3k3EAWTEpBe/Owe2EFUz2XBrUYlzst25
         WtDgB9vo6riiyTscowa5YbkgztbN6KDBu+XMlUbH76hcYnctAmerz/3P4lKPbkuckzcz
         HMSya5X+ynZt8RBXOmwxwQK9KLjcVEKtOhnz4ok0Mcg5Tj3f+7zRImbX7G0Ug82EbpmH
         NIjayXUW4Seiqug+34PFH1DEZQqc5C62Bdbc3XYTABzS99h5BssW7KvFWD9kX/lqi+ar
         zxlQ==
X-Gm-Message-State: AOJu0YwnyFK9q7EUw+U3JJoj2kiCFPppxnTseg5Q4VCK0+GatLnXO+Hp
	efnBhgCw9hBNk1cOzAgl5iECd1wS9oI4FxXqlOu6zZdjlLfyxat9Hfky2eIR81bpRaw=
X-Gm-Gg: AfdE7cknSL2SZ040ub6XfwIv6l/FrGYme/nX2PCmYRZIgat4wv3fcyaU4QCEKRfjSmc
	qlzdcm3DiNjS33evP02A3Iy3gmFNJ+OcDkpXlELtmXh4iweZvVAPXXYlZBsj1AyaYh7oXzJJ3E/
	EO7VWYB7rnEJB6vYobbZf2Qu5mdcm2glTKRfb167tl+lyLQ+Q72SsWvCfScwi3kysruhGFDE4IK
	1MmJjFlW92UbhI6ZilkXVoO0FDddZf0WaIF8KfUxIdjvWbsjAPw8y/oCz/scc1QPWHEL5EkcjPW
	H7tp0kpVufk588ZUD6TeLeotXZn5LThqyKpVSNHRdUHhYDn3oCmLShCfPQgpBCfmWwalgxD9av1
	0TrTahzByKB+o1ulOuQBY4u8EL52Jq7Gt9EqCqkgEYxox5mmY6KH/JdUWRNS2+Vsg75ybMK6m6+
	VxWGPmJNKWMrMmE4m9UGd5eMuJgXZRZgJIhveWEb5IojogkJJTlZJz8T5qNuESvdW61JQkbJ20Y
	GJZE21xXRxEag9fyIY=
X-Received: by 2002:a05:600c:4ed4:b0:493:c600:e1a6 with SMTP id 5b1f17b1804b1-493dece4adcmr1187235e9.12.1783334767437;
        Mon, 06 Jul 2026 03:46:07 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v7 3/4] x86/efi: avoid a relocation in efi_arch_post_exit_boot()
Date: Mon,  6 Jul 2026 11:45:56 +0100
Message-ID: <20260706104557.430097-4-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706104557.430097-1-frediano.ziglio@citrix.com>
References: <20260706104557.430097-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1783334768-4E5147C5-3B7912CC/0/0
X-purgate-type: clean
X-purgate-size: 1970
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C379F70F700

From: Roger Pau Monné <roger.pau@citrix.com>

Instead of using the absolute __start_xen address, calculate it as an
offset from the current instruction pointer.  The relocation would be
problematic if the generated PE binary had .init.text as a standalone
section with just read and execute permissions.

Removing this relocation is necessary to make it safe to split .init.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes since v1:
- Improve commit message.

Changes since v3:
- Added Acked-by.

Changes since v6:
- remove spurious quote.
---
 xen/arch/x86/efi/efi-boot.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index d738b839ee..b983f054b5 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -270,7 +270,9 @@ static void __init noreturn efi_arch_post_exit_boot(void)
 
                    /* Jump to higher mappings. */
                    "mov    stack_start(%%rip), %%rsp\n\t"
-                   "movabs $__start_xen, %[rip]\n\t"
+                   "lea    __start_xen(%%rip), %[rip]\n\t"
+                   "add    %[offset], %[rip]\n\t"
+
                    "push   %[cs]\n\t"
                    "push   %[rip]\n\t"
                    "lretq"
@@ -278,7 +280,8 @@ static void __init noreturn efi_arch_post_exit_boot(void)
                      [cr4] "+&r" (cr4)
                    : [cr3] "r" (idle_pg_table),
                      [cs] "i" (__HYPERVISOR_CS),
-                     [ds] "r" (__HYPERVISOR_DS)
+                     [ds] "r" (__HYPERVISOR_DS),
+                     [offset] "r" (__XEN_VIRT_START - xen_phys_start)
                    : "memory" );
     unreachable();
 }
-- 
2.43.0


