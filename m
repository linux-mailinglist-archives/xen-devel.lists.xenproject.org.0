Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uPk2Lix5S2oRSAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 11:45:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B42470EB9B
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 11:45:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=lc4GCSER;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355213.1609992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgfsa-0007W0-LT; Mon, 06 Jul 2026 09:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355213.1609992; Mon, 06 Jul 2026 09:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgfsa-0007TV-Hc; Mon, 06 Jul 2026 09:44:44 +0000
Received: by outflank-mailman (input) for mailman id 1355213;
 Mon, 06 Jul 2026 09:44:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wgfsZ-0007Fi-3H
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 09:44:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgfsY-002r9l-GP
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 11:44:42 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4b78fd-5cb7-0a2a0a5109dd-0a2a4504c6e0-42
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 11:44:42 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4b790a-a01d-0a2a45040019-d155dd31c50c-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 11:44:42 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-47640541585so1723767f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 02:44:42 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493ccd9d620sm283605205e9.1.2026.07.06.02.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 02:44:41 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783331082; x=1783935882; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ia93IaiRGnVFsVP6/iZrBYXvaYw/rZ06cLV16cU84oM=;
        b=lc4GCSERlL7vHVdOWN4g54TbPs+iKkzF9wiyTcBD4e6HBFtnZkuaypXrdrTidxucpw
         jwvs59cupMwO/9CD7V/4TfSk6QE37OS2GAXdv34PveZnIc6uNMIcaKrPC7KnKq/BnK08
         dfDCoq2Cg2pMZdnM0uBfk4IRUpvofjSTjmaCfubnqW84Laj0BE3hNznmOWQO+T2MtlR3
         Ds3L41jU1LjzXSkFdWVAaqrxhpJAOIBh+XtgAQWqiqwTfiJWUhLvcNqrdISPziKiFt2P
         9JSUWNo4r7K3wG65mDmayGghdb2KpILaP7n8erbPRkAj5a6xzlPg/xWyzQ2Gs9BHGqUK
         mI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331082; x=1783935882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ia93IaiRGnVFsVP6/iZrBYXvaYw/rZ06cLV16cU84oM=;
        b=BgBAJaSUU7EX36q/QOXLFAHnewO22Glm8pnvG3yjPb70BDAaN0Zu0+BrbT/nXljl+7
         7Y/En9A6ssps9nYODK4xxY6m/+1rxDJX7hckW947L+RkpFX3ybax9N1oPYurS83T6GAS
         NgTIhKER6Q/mNq2RqeL3UuRv5LejmH0zFaEeL0ioT0FYGBkxPGHvISaDCHbHGzvgnEuz
         BmGmR+rKTFGqz4O3CyczmXILlfqaT+BNuIGuuZLW8YXMFmM2/BPsRUx+z5QFaCs4Yr5r
         ctE7otUXcO58ScgbLq5B2kgnfmSt6olflBQYYmOmICqC0OMC/OKjcTVwvnCSoW9i3kmc
         mwWg==
X-Gm-Message-State: AOJu0YywDObZ4CTMwztOdyP8rN37TmYK+Q/1ySLawW68cEqz+MVc2dor
	Htnb8X5hBVxSpuixx+mGypc0cCLmOmvoYQ0rAAGNR55fvu8LOgRifK3CoGNbMy+nEnA=
X-Gm-Gg: AfdE7cmuGwvxOOPrhCOxbAkgriwq+Os775R+3CG7AalX/DRu0j8ZLI/aXbqKLeBpZK0
	R+hcbIhHZjdtwHdhcqxcudS8ZBOE6RcCjuQX+NH4kRPlmfAH+LdO+36LCS8JTua0vf1f7KOxNwP
	2BdB96eE5sjgmiD7nITGwH94KWOmt3KZtvSo+7OFiH5yRUszSLOiPerzOC4s6YJ3CO6MjLiW2Vp
	UFzykhhf+h0iMK+MMWMeD7fjXp3xeIgJPwZtIUrO1kz5sqdpCph3QAc3Dmqn8SmY1t6wGSBD+C6
	rIkpotjMOXvHKk1yiGj7gpnGPMekTvgkB9amYZDQDKcNcvCVKyUPeeXvsZrjvLv1raZL8rLFoWN
	hrKMXLuBnhfqW4iSaUCWTrBCMjGAcUFfCy9zbGW/gjy0VU1YBGL9x1qz2ICz/NTaQf1T8VgUeDS
	x5Fsv4DRb38yATUaJuoMDaIsFZENJ87GNccmD0k+2cN23nhgfIvsqY6ZXmu6Xuj9ragghMeKeyH
	aqYP4gscBNlei9SBV0=
X-Received: by 2002:a05:600c:8711:b0:493:aa24:792b with SMTP id 5b1f17b1804b1-493d11f15c6mr104883045e9.22.1783331081816;
        Mon, 06 Jul 2026 02:44:41 -0700 (PDT)
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
Subject: [PATCH v6 4/4] x86: Split .init section to satisfy UEFI CA memory mitigation
Date: Mon,  6 Jul 2026 10:44:30 +0100
Message-ID: <20260706094430.427155-5-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706094430.427155-1-frediano.ziglio@citrix.com>
References: <20260706094430.427155-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1783331082-2DDA51CC-36E60BFD/0/0
X-purgate-type: clean
X-purgate-size: 1957
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,invisiblethingslab.com:email,cloud.com:email,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 0B42470EB9B

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
---
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
index 4ed1d2bec1..e26e37db13 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -193,11 +193,7 @@ SECTIONS
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
@@ -210,12 +206,12 @@ SECTIONS
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


