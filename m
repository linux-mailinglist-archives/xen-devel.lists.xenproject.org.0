Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vBM3BkjVKmobxwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 17:33:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B77E567318D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 17:33:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Y7/9WQzb";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1335798.1597986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXhPB-000663-OQ; Thu, 11 Jun 2026 15:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335798.1597986; Thu, 11 Jun 2026 15:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXhPB-00062O-Jc; Thu, 11 Jun 2026 15:33:17 +0000
Received: by outflank-mailman (input) for mailman id 1335798;
 Thu, 11 Jun 2026 15:33:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wXhPA-0005i8-GT
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 15:33:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXhP9-00DLDY-MM
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 17:33:15 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2ad537-bab6-0a2a0a5309dd-0a2a45019f02-8
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 17:33:15 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2ad53b-c1f2-0a2a45010019-d1558036a8e6-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 17:33:15 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-490b8ac62baso8779555e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 08:33:15 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f0a43e9sm80679900f8f.0.2026.06.11.08.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 08:33:14 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781191995; x=1781796795; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qoEJu6qfOh2UmjrdngE2nnp9Dsm0B7C3c1boM1iOShI=;
        b=Y7/9WQzbQb9g8jYU6YXpcFQiP81Or8j1ogibRmo34dtA1NEZnH2nWKqVX/x657N8VT
         wc49AajHtV7jr6Zdygc4SzH6KFjNWofnpUkgEpFzzf7dELJ3C3Ndi9zunLUBylcWXA41
         oVsRL4cwLuBDJ+YBbagtU2XwO1gZ7guNgW5TsVHGPoYFNVi12Tixy9qbyzmrSwyuEXv7
         yWm0naXiHhoMjN5AVYT7EUimIibd7V+jveEJaYjMqLkqUlQmrBv6ua5Yqgbn8IKoEgaU
         U3tEq3bc1DE2BhBc54H59M+ApWaRTSH0XsVqalUJl/bsqiv7pNxAtYf85pZMxlJPOtgi
         cNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781191995; x=1781796795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qoEJu6qfOh2UmjrdngE2nnp9Dsm0B7C3c1boM1iOShI=;
        b=GPBtNUhvqoEcP6fSO8vOlb3l+7OO1DIYBLN1ELNQV54kwYzfwAF+WGvd01pklcmeNJ
         ellvC7rctquSIAG9mqVJyg+mvmCBnhpmjk4v5kP86WSTx4iCi3OXQz7YUagrMzisZ1A7
         ohtr1qEW2GpX+yD23ldA1E5w1qiH/quvNQkcXlLV9W0AqqONk3usROWVV8W4ZTPaufHt
         evZ1MLYWFaj22BvympB5Zsy9UxiXIM16aTr7RHmEYZNtF05c/NhHj8sABN4yJiL8/qUf
         TmWOGCyP5IfZ8HfsRQ9CgoXqLJuh8G6SC3RXxOwy+Lb/6ngDcp5itI0zahNe3RIJSmsF
         lR/g==
X-Gm-Message-State: AOJu0YzKx7fH5lgVblIHCmZHmKfAxuPokAwezEYwF+aKthR1rdzWAQ5k
	vAGtJwoWMT2+Bsx1yqUH2NCo4lU+d5Zfg8Dt86ZL1LWXFnUN4Ffghtps5jUW+D1hZK8=
X-Gm-Gg: Acq92OEOq3UfF7mxLaloJDJXX6hLpUvvqRWVEfj2FTklfP1SJ2Aycwmdw+Dd9XTSQV8
	o8OaXLfa6eAvDeQMAZSSUNdlbjHNV9XZ5ZmHr/vg8d4OedGtGeTn0XNl0q3AClwhTLQB/5coL/A
	wzmV9sH4u/SzZpKHW9vPnT6ydKm296Zo9lXJfYsfYKGwqlU9LMKIxVX0fmS+Hf0F776cKhzHyB5
	7JMk7EnNjZ8fc9K8cjMSOScW0u5I9yctmg5cYWfKtZI+tRn04eHA2R0NDOgHdHwq2QmQCcXIhEn
	KsiyQ+0FoZ9Wv/80I/o0iX8ouI5xq9fyPxmTqdym+VrFP3ECyQCwtvW3DmZUZyVTKxc3n31eeuc
	D4WmoffWUlvU1FEdHPcaZeedPvH+FjFRgN1ybOwFP1fKjAAuPZrcnkFBEBfwyAck6RKpvJQ7iQ+
	3Qq9kjNB7H5itDNMldz+725VqkFirpcjC+AALi/HvuSXW7/5KrPnrVVLZe9eoppIs3JN9sP7PcU
	Oqkwt6QWqrQImHyN5pWMYxm0Cu6U3Lvpwsq
X-Received: by 2002:a05:600c:c059:10b0:490:3d3d:805a with SMTP id 5b1f17b1804b1-490e5131ae7mr32259635e9.12.1781191994826;
        Thu, 11 Jun 2026 08:33:14 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v2 3/4] x86/efi: avoid a relocation in efi_arch_post_exit_boot()
Date: Thu, 11 Jun 2026 16:32:56 +0100
Message-ID: <20260611153257.650054-4-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611153257.650054-1-frediano.ziglio@cloud.com>
References: <20260611153257.650054-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1781191995-AE342FF4-DF0BB432/0/0
X-purgate-type: clean
X-purgate-size: 1810
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email,cloud.com:mid];
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
X-Rspamd-Queue-Id: B77E567318D

From: Roger Pau Monné <roger.pau@citrix.com>

Instead of using the absolute __start_xen address, calculate it as an
offset from the current instruction pointer.  The relocation would be
problematic if the generated PE binary had .init.text as a standalone
section with just read and execute permissions."

Removing this relocation is necessary to make it safe to split .init.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
--
Changes since v2:
- Improve commit message.
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


