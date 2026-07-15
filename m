Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f8YbFyInV2pEGQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 08:22:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F34B275AF2E
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 08:22:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=X83jrNlk;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1362689.1614457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjt0Z-0001Ls-1f; Wed, 15 Jul 2026 06:22:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362689.1614457; Wed, 15 Jul 2026 06:22:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjt0Y-0001Il-Sv; Wed, 15 Jul 2026 06:22:14 +0000
Received: by outflank-mailman (input) for mailman id 1362689;
 Wed, 15 Jul 2026 06:22:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wjt0Y-0001Gm-4E
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 06:22:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjt0X-00DZpn-HD
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 08:22:13 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a5726fa-e002-0a2a0a5209dd-0a2a450288c0-46
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 08:22:13 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a572715-6ca4-0a2a45020019-d155dd31e1b3-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 08:22:13 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-47de0093c42so1429382f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 23:22:13 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f4635a63esm14336663f8f.9.2026.07.14.23.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 23:22:12 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784096533; x=1784701333; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pqCnw296qrnwdmXLYDWU2GesaXoLsxGgUNGqF+FPq+0=;
        b=X83jrNlkieOwg4NaW4oBRr71PTdcVvcRdSeaGDbXhhLRD1Oombf2wATCiFEtb5tP22
         N09Nh7+ISnFS2OFFoCQSqG+3ACuRmQYtRB1MOBquZaQj1Tb+Z5wlsZFNAT5riGv/H8v/
         ZlRbTkyzidYI6m4ntLTHzgFOHdO8XiSyR3tE8gIeGqsjl7Ag9TlZfjpxQHAV32PjyHsP
         Mp0Zk70x7wk4u7eOQw7B5OHTPvbJl+EIbh+5UfxeVmW7O1TRfml0ZBrZvJ+1yjbR1m+g
         eaKOgM9TCAxG+T185JNn2vBvY17cCOFpn2w4+130MKIbmQ0XtEOFej9t74dgFooudkZ0
         +M2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096533; x=1784701333;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pqCnw296qrnwdmXLYDWU2GesaXoLsxGgUNGqF+FPq+0=;
        b=aZdI2XrFRUp7C6AGsW5OXCGs9PFNuY4tWO60vckn4gO5olDlMgHO7b8noKa2AphGt4
         HxeZwmdsvkbH4nHZyxtnryLGu6K8Lg40n6DENKfdeY1cqIcIG+F8cHL+1wQ0VNn6UTel
         0AEOg2KmjZ9u5y6fm1PEBDwAoWUuzP3aIjWxC6i6DSXSaP6A7grMffxNC8f8BZy4+Kof
         /EZZ0XTR0SW4QtYnsLTMhrMst8wym+bJu0Kq78mTIWUxS5Pp0k7E1khj6+JbUzTVlG+r
         gwLEzbpgsq0iX9BANkfimXqgsx8W/jx7AaCURIlispAAWkdMX+aRGApb/BrAlm3hwfbd
         TtRQ==
X-Gm-Message-State: AOJu0Yyh1hDO/RXdv3qFUEeKvkTj0g+QwEQDqEDmTX6c1zvLhs4x4JqO
	ijc7AdnJBs5/7LzCBKG2z9JJC0X+48vsu6uTa9q3qnwXHB5whFN+lmjiMzn4FNofHSMGcw==
X-Gm-Gg: AfdE7ckFxCoavS8FZNFFnCmk2696FasclIQd8uaU1c/ODC3KmtBg40puYGbso+YPHAV
	JIMO/anKrqgKdRWKg+u1ctYiwIbXHzLYp0dTot1EedLV1Sz+XiDeoJeMeLWvmWaQFvjX1DNQZ49
	qZFxkUz/0sJCU234sr+XdgTdegB6uNv7J8N3p10G1ERqqRbiCCNT2oobKVHfIfD48CydCLMEzMH
	0dYBNtxYUfUuxtiOl/P/e+oIzABdZbY9kO+K5V0n+tk8IiIjNDt76PiajOhS5Rv8Ajx2TGy87YA
	TK2Oxd64d8Q4qIr+QqXHS8IsuqEabiGzRo8gAoBZhZ8BjfQv+bnE6m03ct5tRSU0d5CWO+mRA/v
	BuI1dl9+eVPwj+qn13uI4r9h6nRgoc+P6AJHllnZsoC9AesgouJWWNPqcuXF39psq4d2XvJLV54
	TboL0oY/d8TkGlc9LdYZiGCJXzI7Z+Y3lf4Fltw37qkXCxtC4QvToHzy4rF0DG0S4wD2gp0W44u
	WxalAQxAM5onOcv17A=
X-Received: by 2002:a5d:5f83:0:b0:44a:be4:d0e4 with SMTP id ffacd0b85a97d-47f2dccb3bemr17034965f8f.25.1784096532832;
        Tue, 14 Jul 2026 23:22:12 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v8 1/4] Align relevant sections to 4KB
Date: Wed, 15 Jul 2026 07:22:03 +0100
Message-ID: <20260715062206.328049-2-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715062206.328049-1-frediano.ziglio@citrix.com>
References: <20260715062206.328049-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1784096533-F14AE2AC-30B94D61/0/0
X-purgate-type: clean
X-purgate-size: 2023
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:email];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F34B275AF2E

Required by UEFI CA memory mitigation.

It is a requirement for NX_COMPAT so the PE can be loaded with W^X perms
in the pagetables.

NX_COMPAT is a requirement from shim-review,
https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-your-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have-you-done-to-ensure-such-compatibility

Sections with different permissions must be in separate pages.
In the case of debug sections they are contiguous and have the same
permissions, including the immediately preceding .reloc section, so it's
not an issue if they are not aligned to the page.
Before the .debug sections you could have the .reloc or the SBAT section,
either are permission-compatible.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v1:
- Change subject.

Changes since v2:
- Improved commit message and subject.

Changes since v3:
- Added Acked-by;
- Improved commit message.

Changes since v4:
- Added missing comment;
- Added Acked-by.
---
 xen/arch/x86/xen.lds.S | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index b9e888e596..8e63cf5bc2 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -162,8 +162,8 @@ SECTIONS
        __note_gnu_build_id_end = .;
   } PHDR(note) PHDR(text)
 #elif defined(BUILD_ID_EFI)
-  /* Workaround bug in binutils < 2.36 */
-  . = ALIGN(32);
+  /* Align to satisfy UEFI CA memory mitigation. */
+  . = ALIGN(PAGE_SIZE);
   DECL_SECTION(.buildid) {
        __note_gnu_build_id_start = .;
        *(.buildid)
@@ -330,6 +330,8 @@ SECTIONS
   __2M_rwdata_end = ALIGN(SECTION_ALIGN);
 
 #ifdef EFI
+  /* Align to satisfy UEFI CA memory mitigation. */
+  . = ALIGN(PAGE_SIZE);
   .reloc ALIGN(4) : {
     __base_relocs_start = .;
     *(.reloc)
-- 
2.43.0


