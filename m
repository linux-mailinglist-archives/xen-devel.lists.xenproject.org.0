Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xbaOBYhyPmolGQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 14:37:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC3C6CD0ED
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 14:37:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=l9m5imnY;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1346120.1604639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd5nu-00048W-39; Fri, 26 Jun 2026 12:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346120.1604639; Fri, 26 Jun 2026 12:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd5nu-00046L-0W; Fri, 26 Jun 2026 12:37:06 +0000
Received: by outflank-mailman (input) for mailman id 1346120;
 Fri, 26 Jun 2026 12:37:05 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wd5nt-00046F-8E
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 12:37:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd5ns-008INd-Kt
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 14:37:04 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3e726d-e002-0a2a0a5209dd-0a2a4508b3e4-8
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 14:37:04 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3e7270-edec-0a2a45080019-d155802dc930-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 14:37:04 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49241896317so4658705e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 05:37:04 -0700 (PDT)
Received: from localhost.localdomain (8.17.6.51.dyn.plus.net. [51.6.17.8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268ff1be9sm76578835e9.8.2026.06.26.05.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 05:37:03 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782477424; x=1783082224; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZ5oq/h6Ct/bubpgcFsVwUap/Y9yiAwC2oUUawjmI68=;
        b=l9m5imnYUPZGohIf2QU0qVmhqxhtLCQxR3jx3II/9h2WAZRUkQJcDZCjAzXkUdSKQ7
         zWDKygena+02bFBKRCUf649gv+Si2LERDMxcDuSQsb7EuO5JJRxdPVn5/cnWYXIjN3iQ
         tUNMS5s4v40X552mTk0Lh8m17Qp88e9u3/+Rlim2iU3o9zT7oJVCO3AVWnYmRwVtIMD9
         3OzPkL1W386FDR61B+8QafSLBAgpSEHi0R2MaNlhY64y+uIX/arjnrgYhtBsb9NiI0WM
         U9fibYWTb/WosovCSRLYNvK3LmH8OERg8pFNOwdAgUm2dzPLDTMMRgPuUR050Ij/tAHq
         Mriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782477424; x=1783082224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SZ5oq/h6Ct/bubpgcFsVwUap/Y9yiAwC2oUUawjmI68=;
        b=FOQE5zeJlDYMUPG/5AApOE5LULSZEu4JZXyyp8Be6gHzK/IvIUdzyoSQbMPwuHqZPw
         dooG+mnBnOru8gN6ZmMZyUfa21Q+2PlcKZWtomPBriHBwlYuynoYFPVTt6USg//uSYvo
         VcJWWfKWtl5RRImGq1undMn0ndtuR+tRmO+ZH7HdPnwI3TpwyjE4q6H9twQGU4Y5BJu2
         3J+tvvYVpFew2HdFpyHBnGOKmvf/oTzDF3f45oxrvgYpes46MlfPUq9oezTxtB8N7Wm1
         4UV3kNAO8J100jGYwHPf+pa/WFmcTpae8QP+NyzMs3TWUUziCIJ405snjBrO+SeKpuza
         x26w==
X-Gm-Message-State: AOJu0YyKbrrTRQY2FZjnGhnEwwXgRDa9T7N6xH1c54EfWdOgvOqeWVCX
	W2DbqptIIUeAt6tqXGfMLZjrc5hLoH8/cXeb1RTupzWBt5JKqte/TWBhR+DofgwA0Sc=
X-Gm-Gg: AfdE7ck1Q0TduYZDbSKdnnZbJ4T4hLMG4BNVSvZbxlrK7eHLckbHQV0RD15Al2Ys4bW
	iOvEupidhgwe3jkNdMCO50emymYUCNLq6Sc1XZLAdON789HtnzyB60ytE5chJIEjppIvNkcP1id
	+CB1uQN0s0Fucod7pmeFbQF7ajCp31ZiIxwx9I7FvjJgqN6rSbTR7p7zRCRQNtisiFNebNPjezI
	J9+aRsJY40ynds6Gb26E6/ZslT3OndPfvabrfZUVO2CtKuJXj1Vc5dBuEDDguZ5BA9sldptYAMn
	9V78rRTtBZb0XqAVyiju+187ezRRwdr/6HSVp5OFG3TmrQgJGcFRQgapzlJIyJQE8QJltaHDTKP
	idt4+IMENBCqp5OFEVGcGH62ww20WZzh1HUJ9ZTNkqqBKDNqC5gg57knFTXgQGVqRTg6ioHNa3e
	1zka7LsTwU81Ju2e4emK9Il6OWDa9+N0meP3/mMGutNJcrUPCzj5n9S19aPxBETHhAjQdQUWVkR
	V9ACDgD
X-Received: by 2002:a05:600c:8b4b:b0:492:3d05:5639 with SMTP id 5b1f17b1804b1-492668945eamr90594455e9.36.1782477423934;
        Fri, 26 Jun 2026 05:37:03 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v5 1/5] Align relevant sections to 4KB
Date: Fri, 26 Jun 2026 13:36:41 +0100
Message-ID: <20260626123645.229375-2-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626123645.229375-1-frediano.ziglio@citrix.com>
References: <20260626123645.229375-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1782477424-411293FC-B7135E53/0/0
X-purgate-type: clean
X-purgate-size: 2075
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:mid,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,cloud.com:email];
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
X-Rspamd-Queue-Id: 8EC3C6CD0ED

From: Frediano Ziglio <frediano.ziglio@cloud.com>

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
--
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


