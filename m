Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GSgpESQnV2pHGQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 08:22:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EE875AF76
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 08:22:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=snwnbrF6;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1362691.1614479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjt0c-000205-KZ; Wed, 15 Jul 2026 06:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362691.1614479; Wed, 15 Jul 2026 06:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjt0c-0001wr-Gd; Wed, 15 Jul 2026 06:22:18 +0000
Received: by outflank-mailman (input) for mailman id 1362691;
 Wed, 15 Jul 2026 06:22:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wjt0a-0001gi-Ej
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 06:22:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjt0Z-00DZsc-Ri
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 08:22:15 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a572717-e002-0a2a0a5209dd-0a2a450b9e78-6
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 08:22:15 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a572717-b7e8-0a2a450b0019-d1558031b901-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 08:22:15 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-493c52cde9eso43221505e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 23:22:15 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f4635a63esm14336663f8f.9.2026.07.14.23.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 23:22:14 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784096535; x=1784701335; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HzSJO6a2Zt2m1n1ujDT4uRTju/cRsXyLEg5Me9ypANU=;
        b=snwnbrF6yAzAElnHSrzq/N9y4zjYqeqH/bx0kWfhsqWOjfzU6UJSW2btzuc7Rli52Y
         vQRvi1ssRVoLWxZ9iesIqWNN6vZYnr/V+nHfoDeB4bHDRfh3o6ZLnwKWaGynIGnp+YJC
         HGnQE36KW/3jAO5z+QQPjNFuc1MWcfvPwCwEEVUi6Hi36AnJH1505MCkCpXGLOCTdqrT
         bUVs7i48uUqhzD2vOpO4yb0Aeg5e0hkfGIFEksvRXV5/dlo4uw5HFdZEobn7zT1cPk3T
         yqDWURFBD7eUpICYnLhzEIJoKdaeXcSpNW1CBjM5xZzxWT4Wsb0pMhXFA1ulVOwq69hu
         RtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096535; x=1784701335;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzSJO6a2Zt2m1n1ujDT4uRTju/cRsXyLEg5Me9ypANU=;
        b=nidlVUf+SNTLy74mNGAZlN3dzAbZnj12pEMbCWA17ouhZIHDMpXe/hK7zxL8VkLLXp
         HhMU+9DYuyLItbB5gqFiC/sInWWZFF7ntoXuOtmIqJr/10NIOcEmRgw2FvdyVUYXWiZM
         U3PG60hPxeYuF89ySw9g8daD/Im1qHbkmS4kjUleOoJ+7RbaQvmYc8w4DurtqJCvYH2u
         lNrW8tKfDJ6s7NBgnzWfRijGr1Jrlcz57nYH7aBaebBzm1MDt5G8KaSiFEX71O1JRZfs
         yLmfBt1Ry90KylLThNs7reYbRc35jCVunW4jhtx7ffFuMvr+GetlTUBKP4JeIYoy4VRT
         VR5g==
X-Gm-Message-State: AOJu0YxwVS57q1luRvLBdn1B1cTMUy4Nw6JbYKS7JLWQD6HsNqTEPtxP
	a4UzJhvQCnWcm6EH4F/9iSA7j7oIvRC8McPWCzuMELS58TIUMmVWCYsISOxi/SZZLrHMMA==
X-Gm-Gg: AfdE7cls/dQlaEbf2LY2dyvajb1L5//Tr9ZNxqWUvUNzQRhV0mczktM4n5UpyHEa8Up
	n8jM7g2RABqlEE1bSbYuFS/ThBMrnqHhf8Nv7Y1hXmKWO7wIQRskEeW++HhcPneQQizSyQabsKh
	hizdlISLxYNqJUcjdtsaD+d+xwSbPrl9fbDZ8138k5IB9jJbHijj1n6QcM7E6JK67NkMPpZjzKO
	5kQk0ZOleZcciJQWIdaHWBdae1q4UGWXLKIQYYvCsD2yYnK0Qln2UFXnQz/4As0D2t6iz8uzIW9
	Wz/+QvQ/SkPdGoeILNsSmlvAYO+I7ZO1cd546TQOkoUqfyDseRJfCPCbEHK5hYy9jTdsNoQhDAt
	c9iGVG1JTM1nqQ2UjoztQM1oABbx8cKKNf72kBgSnDGa6FGS/gzCo0ZsPVKXKc76kxhFQaJja6m
	fEYeVoi3I0/1bYxQQ9WtJ5BiuGvXftZ2HSxzjrWmuhczdc3QCPv3PdvmhVo3uDNAuWs/bnfNTSJ
	domK3Berxb742UFlRs=
X-Received: by 2002:a05:600c:8a0d:10b0:495:3b8a:5e17 with SMTP id 5b1f17b1804b1-4953b8a5e5amr14974785e9.16.1784096534938;
        Tue, 14 Jul 2026 23:22:14 -0700 (PDT)
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
Subject: [PATCH v8 3/4] x86/efi: avoid a relocation in efi_arch_post_exit_boot()
Date: Wed, 15 Jul 2026 07:22:05 +0100
Message-ID: <20260715062206.328049-4-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715062206.328049-1-frediano.ziglio@citrix.com>
References: <20260715062206.328049-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1784096535-2C59A9EA-68D735A4/0/0
X-purgate-type: clean
X-purgate-size: 1970
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:mid,invisiblethingslab.com:email,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: E1EE875AF76

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


