Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1YATHO4hMWoYcQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:14:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CE768E0FE
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:14:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CY14pm6C;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1339038.1600173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQnn-0004Bb-7m; Tue, 16 Jun 2026 10:13:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339038.1600173; Tue, 16 Jun 2026 10:13:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQnn-00048z-4f; Tue, 16 Jun 2026 10:13:51 +0000
Received: by outflank-mailman (input) for mailman id 1339038;
 Tue, 16 Jun 2026 10:13:49 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wZQnl-0003iW-EN
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 10:13:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZQnk-003Fzp-R3
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 12:13:48 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3121da-bab6-0a2a0a5309dd-0a2a450bb25c-4
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:13:48 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3121dc-212f-0a2a450b0019-d1558031d873-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:13:48 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490b9318997so31384255e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 03:13:48 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea94f5b0sm295160265e9.1.2026.06.16.03.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 03:13:47 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781604828; x=1782209628; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aV50E1szkTOwyhMutswlcW3BTksNdLPvcC4004D+T/Y=;
        b=CY14pm6C7Btf+ZwQ2tL5bp5gurb559V8T6ftJhTZqxw4mEjMEO45HtVVev68mwWsxr
         S9YAlwWfH3uIkAgmleTwmYPM9CN2zgtWovr/2E8BzfpqBPi9q63Fpclo7bCVtQEmUd5V
         KuXOKGUAuSbl3LgnbN1Pefn7HoSHwmZQWIKBo3rRL5Mz1lphjEtO3+aYcXondK7OuXwT
         /oJIJjkSQgYefBgu/qHVafaUehi6o97eq2uFFC5whp82PP1F8wo64w3EY7JaEd7N0jgo
         16TmBT0BQPT4cWjPvUYn2F7UlyCm5SXrQc80pI0VsgAvRrZzqNq3b46d/eT8SVh9Ii0V
         /nNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604828; x=1782209628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aV50E1szkTOwyhMutswlcW3BTksNdLPvcC4004D+T/Y=;
        b=KMecy2dsN9T2ERoJsTkp6XfcOSZxl+FvubniseyqfF4oo3RAA8Gf9yo+HF2Wi70/EP
         23zvsYtmD6ZerefCd55Nm9f/S3IChboiu5VcEyXe1PCG9th/6auisvmlUNpCagXL9BgO
         yppWI5iIoZ/rWU7r8TMWWBwTP8guxB9uMn/bI50owySQeGHDbz0KxP173ikJqIz32+Ts
         LJKni3WXNoug4bB5K5LXGo9LYhtAzwEqvWm1Ds2rIye8oM7lZGHaT24HSrnVuaotNlBY
         RUa53a4IQy/mLQo3nTu5RCmPVGXxa2LgyVaOGW/JNZSC9xSn4xXIaiROPc47MqO2mTs7
         DgYQ==
X-Gm-Message-State: AOJu0YyXzAWNTfKrONmtOMMmEgb4rVYN3h56eryzBh/+4gHEMYSp4lDX
	pfZlwzxq1L0CKZAMb50M4vWcnlxg2WbA2Tw+PHiWOhqSHM32suOheGdvCGIX/c1vnHM=
X-Gm-Gg: Acq92OEYMMWrCnTqNJ8qDIcifYUhhuCnngqUNg59oewgSlmLEUQHmXTQTBkSv/VoYJU
	Y0EiB5RI/eTZ1zQ4pGM9zkSl8RkFbemzE6GrNgxN4nNWfSikC+rAz4p5iXwhUq+IoKUfUp3/qON
	KTxEFlrAg8K39aP2+ig4bLX5eVa/8mJ3WJi+u+CfJScgNhaIAgDfmV3PsvXW82C4LxQVgLVYGwF
	H5HxlhNXDrQmVXDIFYqhRfxM39jsmPOlZ8PkyfVlKKKro6KVVCAFL0KSy9dCd9FMibmIdPyTTVK
	WGi36ny6M7pRAHh95d/t6nCGAMGi8HL+Kxek3mxAc/TaLPfgPcblUXpAMU0izbjv+So8RK3ST/5
	1Bd2J2NEP8fxgfOyRsNSyypx1vhBbpspuJf+Nu6hVAwdYuGCQW6anEOUNs+4DiOO7WEq7ww6lm4
	Gm/ClBH10e19PMriO92Qi3Xv1KX2uhhpoPmQmkn+oMiPprkysWok7A4QXyHzCfiB+Vz7CG9KuMN
	EcPvBRdfxsWCpaQCJgo0LwIRBY=
X-Received: by 2002:a05:600c:3495:b0:490:e18f:d112 with SMTP id 5b1f17b1804b1-4922011df49mr193686985e9.21.1781604828155;
        Tue, 16 Jun 2026 03:13:48 -0700 (PDT)
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
Subject: [PATCH v3 3/4] x86/efi: avoid a relocation in efi_arch_post_exit_boot()
Date: Tue, 16 Jun 2026 11:13:35 +0100
Message-ID: <20260616101336.44009-4-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616101336.44009-1-frediano.ziglio@citrix.com>
References: <20260616101336.44009-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1781604828-19969F3B-0B315A27/0/0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email];
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
X-Rspamd-Queue-Id: B8CE768E0FE

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
Changes since v1:
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


