Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Jv/fMm+yGWroyQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:36:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD6B604D92
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:36:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322628.1588945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSzFm-0004pa-Ri; Fri, 29 May 2026 15:36:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322628.1588945; Fri, 29 May 2026 15:36:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSzFm-0004nE-MN; Fri, 29 May 2026 15:36:06 +0000
Received: by outflank-mailman (input) for mailman id 1322628;
 Fri, 29 May 2026 15:36:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wSzFk-0004a8-QC
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 15:36:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSzFk-0016uA-78
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 17:36:04 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a19b253-5cb7-0a2a0a5109dd-0a2a4506e07c-32
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:36:04 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a19b264-7371-0a2a45060019-d155dd34e8bf-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:36:04 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-45ef42dfb26so245206f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 08:36:04 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34b834esm4196196f8f.11.2026.05.29.08.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 08:36:02 -0700 (PDT)
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
        bh=9wf3y14NPqhrBND7m76mJz5c5h7xyT91mnaBZEnOl+A=;
        b=psxg2t1ookUP9cn0s5UrzMuqkBA9+/n6Ta7FR8wZTOgfcV84M13HAyO0+kkNi8zjD3
         pFDw4f7EpMfsOVOaOH+nInTgzpsfqdcVMLJwvtIW7U6ElnNX9dQbGVlqswXFwVTPEVBp
         vXyw9uQzhJmK8s9onG6PXaA6mHtRdpX22Mvc+2xtH+EHlqlxPlGHP1VjLMHsFO34a+bm
         PLwW0UCiQoRI/2AXZxleezTmaJA4Zd1mjC64rnVkpoHXHKH+Ex2Zun4Trge1atHGL3cl
         YPGjCLiZ03+xfcF94nGrwSXBklTkNQEMsL9MjtECa4+XYra0zPzobiJ42GRF2NFzkZJH
         o+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780068964; x=1780673764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9wf3y14NPqhrBND7m76mJz5c5h7xyT91mnaBZEnOl+A=;
        b=WRj/XPpelgUsGZ7tjsUvEDAVVt7liw0SknpPXZUIlT/DHVzqdven5VEk1gHI/9sc2S
         43zcIOyZLjlHaNeQrkauct+Ht8b4A4it36JrmhY18YlLEIf/CnePr/8EuVFX0kDfgyYW
         zaLWe4EAf6EaJO3/e7dh+Ffhtj8YGDq3zxsrsBYVQFNvlxacFkKMw9djTSJ4NiubQ1xg
         bAcTGi9YooUZuxHZNwcv7e4TjBklnGv7r+AkdKLo1ccFB8zYLNdPA4+NGm2SWp1ldkMU
         NvXpeTOpKsMPPkQpZjiN0aYLCw3Tyvl/V9zC2KGzLsUz+GDL//dSBnvGMdlrYaCYMqZc
         GvrQ==
X-Gm-Message-State: AOJu0Yzu982LTgqWXkkyJ7oj9qRvP2AwrLLXupExO+Kvf8zA2fIZZmcR
	fbNFJGF4+QyVlLSkIenJ9OWh7e2QbgL9Ckmgb/6/CSE8/8cUKStKM1kBtWdQXpNa
X-Gm-Gg: Acq92OFKBOPAoExMvQwnIQwZ3QV8WifMi9wAuq/3IWrem7ftERbT/4qUkN1hzQDEbJb
	LY4bjEk1ecYt4ZaJlKIFqVtUWlRdaypC3zvrXGLZVTV7Q+OIvUtyz97r143COnUaUbXtN/BM4si
	gWTXIXz8o+AqXTQdZQVB8ZnahCJYZKThy6nGHrnzPUnGm2krDbp2G2U1VVwkcSfSdbrk7OZNP8U
	cp9JIFGduYMnbabxBGvjyKHTdMwk6YWn/ly25S6vpl8VzipexiF/1/SX5koNRzbRookETaSehIC
	q1CPUGbcUkC1IPHc+gZC6DyCIsk5hA6SJzGEmSIP4B/oIWwFyGFKbR8+taKGDKLEyrMRIUpPoq+
	I4ebUgRNafetqVtTH3i5FDi3EB2YLJuNW0n/OLBiXWioyXyg+bPGvhsu22n+Vt2aOFiTvpVl4jG
	m0nHWvsHKlKnzKZuzcgcA4bA1XZcTCkpIOyEq8uAjncmpTeYJlH3X0w+PHvv2zCiZf7o9MvDxBx
	JgfkkgHyFSb8mlunAgqlm40fF9y8EsSM3yo
X-Received: by 2002:a05:6000:21c6:b0:45e:7418:a3f2 with SMTP id ffacd0b85a97d-45ef6b718c1mr357738f8f.26.1780068963494;
        Fri, 29 May 2026 08:36:03 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 5/6] x86/efi: avoid a relocation in efi_arch_post_exit_boot()
Date: Fri, 29 May 2026 16:35:30 +0100
Message-ID: <20260529153531.1341542-6-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1780068964-87170D75-8A821924/0/0
X-purgate-type: clean
X-purgate-size: 1646
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,cloud.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
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
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6DD6B604D92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Roger Pau Monné <roger.pau@citrix.com>

Instead of using the absolute __start_xen address, calculate it as an
offset from the current instruction pointer.  The relocation would be
problematic if the loader has acknowledged the Xen image section
attributes, and mapped .init.text with just read and execute permissions.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
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


