Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6+RgBUjVKmoaxwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 17:33:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB0567318C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 17:33:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=N+2nC5Q5;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1335795.1597968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXhPA-0005ea-1L; Thu, 11 Jun 2026 15:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335795.1597968; Thu, 11 Jun 2026 15:33:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXhP9-0005c9-Tu; Thu, 11 Jun 2026 15:33:15 +0000
Received: by outflank-mailman (input) for mailman id 1335795;
 Thu, 11 Jun 2026 15:33:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wXhP8-0005ZP-F9
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 15:33:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXhP7-0033ey-S9
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 17:33:13 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2ad52c-5cb7-0a2a0a5109dd-0a2a450bc8cc-22
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 17:33:13 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2ad539-212f-0a2a450b0019-d1558036c01f-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 17:33:13 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-490c1915793so59513575e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 08:33:13 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f0a43e9sm80679900f8f.0.2026.06.11.08.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 08:33:12 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781191993; x=1781796793; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxbC6GNVg+EvojTPZihdUDF+yieh851t4HFnrJpjWBU=;
        b=N+2nC5Q5Aoekbl6HPlhd27GyGi00CeI1XAZpSY/5p1ItF9NVvfvGCUDEMBMgDo2S3E
         vXuI/z3Y/AIob1ui7lXp8hNK0bqM7VZ1KtQh4wFHbkNly6XsT393XdDlLCyAvdDHvdXa
         nnFEGDAbAjOGTV92M2bvex/L6qgRDhE6nzOF7BUE78ONwtDvUH8gWDTTFQihsSMV3n20
         s2KKW3Rp74S8jIrYwPOq1VklRE54Ubn4GKmDb4r/lAM1H9rwV8CTb6ltYbQeO65VUbnk
         wrZm32jerrjlU0tCAadeVx8Hbq0dufj4X3UM8ZyW/32STxzrL865wmv2B1B7uq/UhGme
         GQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781191993; x=1781796793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QxbC6GNVg+EvojTPZihdUDF+yieh851t4HFnrJpjWBU=;
        b=cbJaXUA2DWACyngQYcBwWNxcE2M/W7u6eiETNptw/PSLwdlYoQ5TOY+lZIDVlQrvt9
         OKY0e+AdDhItTcVP2q6u6qoXDLlZrRRraHRIj2kjanrzHxBVk+ex5z1tbBHymf/ucLvW
         YXNzc5K9tsj2DVqzb/UUeoORqqb2hoTXutwB9CsDkhSwj2qQJz37Sj+WWMKMRH9uYBra
         yoI1zgAnsIk6oWANEGH+8i6hEW6lcLGabskzKpDgYfNQfxHci8M2MLoQ+M1VZPVTbkiw
         rx4lzvPyPTZl5PDwRAu7/O6IvH77UUuSkoLU888cGS3IFS4z0s5xEOpoDkYeHN+Y8HsD
         9Xug==
X-Gm-Message-State: AOJu0YzaUh4pHe6qchvcaQixvJob/9vbN/bdjrM2YCi5IvIPaZpIdUu9
	fFTPHln8RkK1QaLmbN5gKGU9s25/Ld11T0ILt0LsJAv5Y/8yl17XnQ4lIi9D1wJX9Mg=
X-Gm-Gg: Acq92OHCixNf+qJIpLS9rnzk17HS+ZcNfrquImMplVazW05tJv8dWltGJDTW4AlgFjQ
	MqfQPfEcZ/I1h+GuRYsmsU0SGD7DWv/TeQwaA1lAFGl2M2inQUvcIkRarJ8iGonSmz7RusmEDHn
	spufA8RErDz4vqovfSEOy79HKj95okRRdKxDcMbyGe4bi7Cs4LH9dEqvIxUU4uw1k5uVsjyfM02
	kUOTYlVNNIi7xXWGdWsrI0o19FYQSyAssQumyCE0wR7Rr/cez32u2X+RfwI5wVk+NlgctlRi8OH
	hcLMsuBnLCX45dYVC7R+JZ/kojlJuxgU7kCUbYke9CrBLsvk6IYHuAZ8PT0hrjl0+n3QCm2e2vM
	VLyFsagq+92c1RUdU6eVPFQogvt1Lx1SMYv/LcOWV5nX/BcndI1fQBbN8slROemkBeW5RcT77BK
	/bBq3yakLwDMGGLFi52giFMXBCPUsXIkQ9S8FRQDrlK6zA6bnCWjAAZJ25/Zx0iQ3+Svzr0N8Qe
	MxoUZoA5w8w0EL8JXZCS8A9YAE4WK2RLEww
X-Received: by 2002:a05:600d:84ca:10b0:490:e1a6:4d13 with SMTP id 5b1f17b1804b1-490e55d842bmr31380305e9.15.1781191992979;
        Thu, 11 Jun 2026 08:33:12 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v2 1/4] Align some sections to 4KB
Date: Thu, 11 Jun 2026 16:32:54 +0100
Message-ID: <20260611153257.650054-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611153257.650054-1-frediano.ziglio@cloud.com>
References: <20260611153257.650054-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1781191993-19165F3B-878AA1AA/0/0
X-purgate-type: clean
X-purgate-size: 1286
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,cloud.com:mid,citrix.com:email];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFB0567318C

Required by UEFI CA memory mitigation.

It is a requirement for NX_COMPAT so the PE can be loaded with W^X perms
in the pagetables.

NX_COMPAT is a requirement from shim-review,
https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-your-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have-you-done-to-ensure-such-compatibility

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
--
Changes since v2:
- Change subject.
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


