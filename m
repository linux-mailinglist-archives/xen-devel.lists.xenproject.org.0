Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yBHME9uHMWo4lwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 19:28:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F5B6932CE
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 19:28:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=aXC0sFGT;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1339508.1600737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZXaa-0005Ea-JT; Tue, 16 Jun 2026 17:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339508.1600737; Tue, 16 Jun 2026 17:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZXaa-00059f-EG; Tue, 16 Jun 2026 17:28:40 +0000
Received: by outflank-mailman (input) for mailman id 1339508;
 Tue, 16 Jun 2026 17:28:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wZXaY-0004kp-V7
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 17:28:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZXaY-00Au7B-C6
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 19:28:38 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a318794-bab6-0a2a0a5309dd-0a2a4503ae7a-44
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 19:28:38 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3187c6-672d-0a2a45030019-d155dd2ca4e4-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 19:28:38 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-45ef1198766so70625f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 10:28:38 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-461abb44c3dsm5012754f8f.9.2026.06.16.10.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 10:28:37 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781630918; x=1782235718; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7zgfFDoBBPNpJ7qeY1DSNzH5DJ0mfqwAdGCYD7M6W0=;
        b=aXC0sFGT3UZC7hN8LYImicKW06h+nj0WJQU3UBBE8pTwpftVpvbFu7cuouivpGwHe1
         WXCkigmORmZg95k3RBLrJF6zKc6rJZB/A8228hsJKllJZszi0qS/AmHIVxNNj2oNcbjA
         qP0DPDuigtdQZG5M45WyvIem5Nlvw0Qa7jE3u8PDr0tplBiDFwhWJFRHILizJ23OSeuD
         zX1Lj6c6Ea3ExKsdQoZKqXxjaj3PIMDj2hs5XKie9PxC9SimLMBNE37CRyJetsFK/HT8
         moNcOqcvSwHbj/+0DXA4aza+Z5bq5xjv/PUfpSG6lLy8dRZcyAYq0EX/wyAg/Oh/TF45
         B4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781630918; x=1782235718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h7zgfFDoBBPNpJ7qeY1DSNzH5DJ0mfqwAdGCYD7M6W0=;
        b=Eo8aQofbxbIpeOY6YFIuCE6EInMhU8ito8wKBTt6JInX61cdn3I70T5Ge5zgtpjzfC
         YZQU9eoBrViIU0ux8JLIljlGmaQasUr9iEJe+3I9ByPHwU1fd255EGAVcjzzcVmJQtRV
         RBOZty/Z2jPGUeYJRcs0mT1UgtZXXXpHa5CGRz8uQ12a2vPV7XChYFQpGtFnNzY8+EoM
         8Uz1Bp27ed207DNbjboOI8Q6Eojmn7DFiXjgUDcO4efTsAJw9UBVc7AHkH+boxMHl5XV
         xTX+J+uO/ZFZmBCEBU124SOl9k/tfWdwnqCC3i5BQFM9KcIm5ax2EvsMBs+4dnCjkqJW
         CAjQ==
X-Gm-Message-State: AOJu0Yx8713vMDo5rwM+WuX75a7fbD9dk5PeFeNeKeHPNFGFIibkPlHr
	cX4Iv42KyP6eqUO65M9mLfrF4ZSU/Pq+DO/brPWxsvwyw3Mr5ZdbU4MiWhXJK5bzUYo=
X-Gm-Gg: Acq92OHpbVQO4KXZeG95fND4I6X6xCCqD5k9lWAwL5r1O4V+JUsmNsZzM6wmh0rsHu8
	tVUqFlS1Yo3oyamfwJY3FrMgiS1R9w5tZUhvDn6h5Nf2ANA5DFjzPNlf9JiMQWpwGarcpC7IiEo
	aaq4E7FOkAXm/fOuaTbRYX3GGU58TrESanSVz3BLkLu0lxX+9pEQHnEhISRqwdhmVBBDTCMJsDD
	hKHQWHgvsZeV49fP/JtrXLSoMmK7f2IdymTEEzlSuEeuJqyBqCKRuI5y3dBoCr6kbju4RE2t4tF
	AeD3SkCR09ZBLVS/v1H3KGSODHyBb0wwX+xuZARFBlCC54WgYs3keRllm4r9jbrexT7wuVa2Qih
	e0giZtcmOgSlSoXLBNNfQASNXxm9M4bFSnP3oM2Ii/Q7gC5lvOdH1ljapRJxsVLrx/lyM5iKylt
	Uv6JAX5jKua+PQUJkiLrMTOOxLHG+pr/ZHbX/6Xok2inocDtjRrw4uHxDT4kY9fPpyQruSvjKQL
	ft/hb2OMuu4MyMZVHsAqjb85Jc=
X-Received: by 2002:a05:6000:4902:b0:460:6b12:1783 with SMTP id ffacd0b85a97d-4622a7dad13mr1171084f8f.4.1781630917514;
        Tue, 16 Jun 2026 10:28:37 -0700 (PDT)
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
Subject: [PATCH v4 3/4] x86/efi: avoid a relocation in efi_arch_post_exit_boot()
Date: Tue, 16 Jun 2026 18:28:29 +0100
Message-ID: <20260616172830.111393-4-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616172830.111393-1-frediano.ziglio@citrix.com>
References: <20260616172830.111393-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1781630918-4279C938-AF5D7944/0/0
X-purgate-type: clean
X-purgate-size: 1923
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:mid,citrix.com:email,invisiblethingslab.com:email];
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
X-Rspamd-Queue-Id: F0F5B6932CE

From: Roger Pau Monné <roger.pau@citrix.com>

Instead of using the absolute __start_xen address, calculate it as an
offset from the current instruction pointer.  The relocation would be
problematic if the generated PE binary had .init.text as a standalone
section with just read and execute permissions."

Removing this relocation is necessary to make it safe to split .init.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
--
Changes since v1:
- Improve commit message.

Changes since v3:
- Added Acked-by.
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


