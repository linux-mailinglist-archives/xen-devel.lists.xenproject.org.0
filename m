Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4IZsDYhyPmotGQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 14:37:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ECB6CD0F0
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 14:37:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IyatKNDO;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1346124.1604676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd5ny-0004y9-1G; Fri, 26 Jun 2026 12:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346124.1604676; Fri, 26 Jun 2026 12:37:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd5nx-0004xA-TU; Fri, 26 Jun 2026 12:37:09 +0000
Received: by outflank-mailman (input) for mailman id 1346124;
 Fri, 26 Jun 2026 12:37:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wd5nw-0004WD-9z
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 12:37:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd5nv-008INd-N6
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 14:37:07 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3e726c-e002-0a2a0a5209dd-0a2a45029de0-16
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 14:37:07 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3e7273-5a27-0a2a45020019-d155dd34ecbb-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 14:37:07 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-463f1165e16so907066f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 05:37:07 -0700 (PDT)
Received: from localhost.localdomain (8.17.6.51.dyn.plus.net. [51.6.17.8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268ff1be9sm76578835e9.8.2026.06.26.05.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 05:37:06 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782477427; x=1783082227; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELcjCw1r06UTqQr5rPCcaNMw6q60HdsbqsHgkVk0c/k=;
        b=IyatKNDOF4vmV3btcCKbZhH5ESavWm50IlzZfKNH0ZJJux4vuhffDc1zwpl6LGCop5
         GMCza8k+qEaoVJOOBYCQL2vI6uNb4eB7TcBy5tQZq37rIDFAZmuGv2Wd4MC3MSvdgq2v
         yAzP+AI2ZflZbuoTkvW4mkLTYtbhXWGYOwJgEyiFx+w2OMYUix2OUyMDJ5FqN44TN23P
         qLTWPEMuHUojQGGePSuCrEQ05zWd4Ax8O5p85ubnQ2icYXkmWsvhs2J23RzpiI9Zj6Rn
         8JmtprumhKIPzmP4eOnUwcU1bluNoIeeazoPb6b3lLVqMHqY7JtRogzXUpclTVvv9t0V
         DzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782477427; x=1783082227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ELcjCw1r06UTqQr5rPCcaNMw6q60HdsbqsHgkVk0c/k=;
        b=hNRWYfuUili5Bz823f0iSqQsjopBIlTX0zXAVLv9atlW8QSkgMi9GuaIr5LyPmaJJh
         swLPnd/U1iN/lHFYMxDj3z8XwGRRWZC6Hj8juIEbS2DC0gV8db8jRRTgyx2TihFlGk2G
         0iKY3SZFSVK8e6pqnCenNnr951yJyaG5C7+8I/o/Q10axcrJXGY3BsNOHzoc3k9jBiET
         aOBYs54Q50GTuQvvaNjjiM+kMRGj8Jl1IhjcB4Rsv1nYeJTHRuXUD5XhmulsBF0jRSF4
         RfoCUfpLTkk2NjW6SnNPX/toRH+4qMWY520tgtOQI4N1WrmXnBmpztset8Fhk4kMUEFA
         4HKg==
X-Gm-Message-State: AOJu0YySLFlJbRLCl+kINxL9pfz8tnBbIs38GzOkb/mdb3Du4JhBKJGl
	w3XCVGuvO9fc2b6ODB405LdNC64an3KWMc5/2DTEgbWiCxyueQRR92kD4vjYHiLpse0=
X-Gm-Gg: AfdE7cnQRT0wtyM/+pNQCbNEOt1XSdgNRBoRE7raLcozgNkxNHEld6HRuIcMc5Pu5ao
	osr3HrckvCGl/tuvu0miAkGSRyTvDhdTyfQ46cFREkk0N98oqtYUZeqWnDbKc1LZ8Bk/YGfmiyX
	oiNj6kRmw8A1pbb2tUcdHieskLrufKBNzhLVjQel7IwviQa3qAqKFxeDDarAdGL8onyW9PLmOmq
	G3DvZaLMJI7U3Qqt17pctnMimWpDHQFsXhDO71SfzJ5Alvrj+qHLalySRogxs6enJGYEPGApH5D
	a7m5Ro3XRtQgTGChxESR9XeMUnu5tuKBcrBorWX31fCt2YyndNx6JVK0AOHVbJio47vnc0cay25
	Wbvp4CuFmTO5v+aHCcFu0HHBBFS1xlKzB4LJtrxV1vRPUGt107Mz8JFHOA9bH8fMPWkNMwpgZHL
	lG4CHpaU5IO8MyBdDHSWtu6m8QUZGz8p6xa3PiqkjWeI55EyX055SpJPy+oes+oph/59XD2w27n
	wY517wj
X-Received: by 2002:a05:600c:6211:b0:490:c2a3:23cf with SMTP id 5b1f17b1804b1-492668b6dd3mr98566805e9.34.1782477426787;
        Fri, 26 Jun 2026 05:37:06 -0700 (PDT)
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
Subject: [PATCH v5 4/5] x86: Split .init section to satisfy UEFI CA memory mitigation
Date: Fri, 26 Jun 2026 13:36:44 +0100
Message-ID: <20260626123645.229375-5-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626123645.229375-1-frediano.ziglio@citrix.com>
References: <20260626123645.229375-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1782477427-572F47C5-54AFC484/0/0
X-purgate-type: clean
X-purgate-size: 1956
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,cloud.com:email,citrix.com:mid,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: A3ECB6CD0F0

From: Frediano Ziglio <frediano.ziglio@cloud.com>

Currently .init section is both writeable and executable, split data and code
to have 2 sections satisfying W^X rule.

It is a requirement for NX_COMPAT so the PE can be loaded with W^X perms
in the pagetables.

NX_COMPAT is a requirement from shim-review,
https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-your-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have-you-done-to-ensure-such-compatibility

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
--
Change since v1:
- update comment style.

Changes since v3:
- Added Acked-by.

Changes since v4:
- Added Acked-by.
---
 xen/arch/x86/xen.lds.S | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 88553513a9..70678ab83c 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -195,11 +195,7 @@ SECTIONS
   __2M_init_start = .;         /* Start of 2M superpages, mapped RWX (boot only). */
   . = ALIGN(PAGE_SIZE);             /* Init code and data */
   __init_begin = .;
-#ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
-  DECL_SECTION(.init) {
-#else
   DECL_SECTION(.init.text) {
-#endif
        _sinittext = .;
        *(.init.multiboot)
        *(.init.text)
@@ -212,12 +208,12 @@ SECTIONS
         */
        *(.altinstr_replacement)
 
-#ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
-       . = ALIGN(SMP_CACHE_BYTES);
-#else
   } PHDR(text)
-  DECL_SECTION(.init.data) {
+#ifdef EFI
+  /* Align to satisfy UEFI CA memory mitigation. */
+  . = ALIGN(SECTION_ALIGN);
 #endif
+  DECL_SECTION(.init.data) {
        *(.init.bss.stack_aligned)
        *(.init.data.page_aligned)
 
-- 
2.43.0


