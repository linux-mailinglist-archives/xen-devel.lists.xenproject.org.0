Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PrMxNdqHMWo3lwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 19:28:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 859BE6932CB
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 19:28:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=fo6FO9Jt;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1339506.1600720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZXaZ-0004pA-03; Tue, 16 Jun 2026 17:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339506.1600720; Tue, 16 Jun 2026 17:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZXaY-0004iy-Sb; Tue, 16 Jun 2026 17:28:38 +0000
Received: by outflank-mailman (input) for mailman id 1339506;
 Tue, 16 Jun 2026 17:28:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wZXaX-0004hE-K2
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 17:28:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZXaW-00FwMQ-Oi
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 19:28:36 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a318794-2eae-0a2a0a5409dd-0a2a450ae170-36
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 19:28:36 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3187c4-56b3-0a2a450a0019-d155dd2ee83c-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 19:28:36 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-46013161068so2446792f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 10:28:36 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-461abb44c3dsm5012754f8f.9.2026.06.16.10.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 10:28:35 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781630916; x=1782235716; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5ZX9dmJkDiN34cxHkkBNBwcyGdjITLJ3elG4nDDaKs=;
        b=fo6FO9Jt50m/4eX3KWElo0BYmPURrr97Nii3QiGs5zJScjyBnZeLqkui6q4dquS/On
         F4LEW4VaV3ve4qs2UQSTbLiGFlNCBbxr6A/442WMQ0xFFpX2BXEhAY6w8Bu/QyAA+K6o
         E0WOLMW8+xIpI4AVfr7Z3E9kXCb2Q+reI/hYxdcaKzyzFFmpTRo6aEdlBkjuj59i6zT6
         /whFMfWKLPnMelj2X/N6Q7c72ans7KULuzuacX753J/f3Ac1zeb5BTVFV/iOTSLFTGoz
         DsMSGDFIJRc0gA8I4OiIhIcZvNspA579VpLV5L/Uhdp5zGFtT0hnthy9AZKEgrJnTZKJ
         l1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781630916; x=1782235716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T5ZX9dmJkDiN34cxHkkBNBwcyGdjITLJ3elG4nDDaKs=;
        b=K36oPcXCwdICudsJJsqjtrZEe1NC5RAL7Punh2CPQ9S62u/g7nXYC75gnTl7eZW52W
         jujsl8ZJU47C2+gmRe+O1y+2L8GHOdBfqwdPW4K4ypTbmfYCmkvQeM+5GvsgDxI3uvRs
         gtQjoBA4OpO+3y8DLGLqj9X9cs9hd0chRllXiqNPw+i7cOvDkLZr/fJZwlFGyp/2AjI1
         pm1b7anb/3N2eIJSyylDAh8pBWv6R4Qc7rEkS9j0AxW53FTrzGE/8o8uRwfdDKXAt8A4
         yBTwRqsRiXK8oYcSaXitbygEJeuFhr508qe6h78qc4B394N9jkEI+mVorW6ttdB8A3B8
         rgfQ==
X-Gm-Message-State: AOJu0YyyXYFfA5SA4h6rf/6QSUpRJHBKOknBTReVolRa8NjhEZcHDw3L
	EHa9ZI3MzGHxEDeeZ+EoiKoiJbG0Y3lIPpl8/VS6ll6kthCm1GmLD5hDavYQnrTCK9Q=
X-Gm-Gg: Acq92OGbAXAyXls5TCULZHg8sNcCXKWqsZaLL7bMi8oPYIFUkeUUiOhr+Qhq7HjnmiH
	huaXj9IcYunqfJqRVRvI26wWsuA5n2RmwaFBTw0Tg37W7BuM1sZo+ozFG/32MCdyc5qw6XIx63F
	PNQ5crVxFvDCky9GpOUQr4Kj+eSMzukUbhHFv7WOFcZxtidHHpBMi+fYJ6OjDAuArjLq4gCdeqT
	cSo2d7mzwpMgq2MxmlOJLJfC9F9EDaQOGFdME7ZH2y1/n9pU4MPVNM5Uudell2e/QL8qdwZhk35
	d5GOZYmtjN+IXkU0V+KzPPB19rgKG7NSLjmQ69cC2QVIIV2C/Zf6j4eXhzQ+8TrwM5niXiogjag
	44sDCBK5WEB4IxpTsoRRCKtyoQoJXR3DBLNWGGe1ArQ17rnbZgmKV6D4yrdCzDlY65tzJDeC4Yp
	g8p+kUBlF/TXtUuY2QvnpFGQVJ8ChuIRNYVUxNaw0Ias/jHXqNPO52y0xzx1bbEKyzccKXppfdB
	pXcwV3Jm6a0BVhStZsg6PKDCDgZdkjDaLhJsA==
X-Received: by 2002:a05:600c:4f93:b0:492:29a1:98c4 with SMTP id 5b1f17b1804b1-492333e8d1fmr7008005e9.8.1781630915917;
        Tue, 16 Jun 2026 10:28:35 -0700 (PDT)
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
Subject: [PATCH v4 1/4] Align relevant sections to 4KB
Date: Tue, 16 Jun 2026 18:28:27 +0100
Message-ID: <20260616172830.111393-2-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616172830.111393-1-frediano.ziglio@citrix.com>
References: <20260616172830.111393-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1781630916-7D1848B7-8FA6B5E3/0/0
X-purgate-type: clean
X-purgate-size: 1911
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,invisiblethingslab.com:email];
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
X-Rspamd-Queue-Id: 859BE6932CB

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
--
Changes since v1:
- Change subject.

Changes since v2:
- Improved commit message and subject.

Changes since v3:
- Added Acked-by;
- Improved commit message.
---
 xen/arch/x86/xen.lds.S | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index b9e888e596..f758940674 100644
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
@@ -330,6 +330,7 @@ SECTIONS
   __2M_rwdata_end = ALIGN(SECTION_ALIGN);
 
 #ifdef EFI
+  . = ALIGN(PAGE_SIZE);
   .reloc ALIGN(4) : {
     __base_relocs_start = .;
     *(.reloc)
-- 
2.43.0


