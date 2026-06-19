Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JYzAILE+NWqBpwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:05:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F066A5F24
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:05:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=o9PkIc9r;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1342211.1602521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuX-0003cr-RB; Fri, 19 Jun 2026 13:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342211.1602521; Fri, 19 Jun 2026 13:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuX-0003Z5-Gu; Fri, 19 Jun 2026 13:05:29 +0000
Received: by outflank-mailman (input) for mailman id 1342211;
 Fri, 19 Jun 2026 13:05:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1waYuV-00031s-51
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 13:05:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waYuU-002qp2-Hr
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 15:05:26 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e96-5cb7-0a2a0a5109dd-0a2a4502961a-0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:26 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e96-fdf1-0a2a45020019-d155dd35a441-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:26 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-462cdb88d01so1443655f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 06:05:26 -0700 (PDT)
Received: from localhost.localdomain (8.17.6.51.dyn.plus.net. [51.6.17.8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4650bc428d9sm7960088f8f.27.2026.06.19.06.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 06:05:25 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781874326; x=1782479126; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HooZdhgBaCiFwgXUzAForDPKGFGx999vnsqrg/7EOTU=;
        b=o9PkIc9rKjlwHGgrhjXNjAqIE0Ya6wZhJjbcMKufWV9ZZzq47BgD7DbXhhATvULc25
         b/m2L+M5BJV71ZGkUytii0YBt0cwJZcp4jl4VoiTA6zfTZWtkxGzfUzUcRCrKAlFZ2ko
         59NZtGaTJJld5oR4a/SkHySok3gEH1sIVwLUeVqEnO+ag0kUS6AOhkUmGKeeThcT8fl0
         tplCTCrZ15//eA4L3T1US3ULa5O/6pyAZRKA1j1OOW2lQWuuNoP7Ez1TRJLMxhXoJbNi
         y2/5sGKsspJOeYB6+9mRCUN+w7rGhX+RdsQurJ7JIezprXwx2U9l+d8YiWY7OmN74oyk
         NMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874326; x=1782479126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HooZdhgBaCiFwgXUzAForDPKGFGx999vnsqrg/7EOTU=;
        b=BHInXD6cO4VbZJ+0bFXNQcF67PSrvTjBIPd2hc/2g+H3fAeYM4GB/j7cGkEss/BxnH
         jS1bep3dbvzyj+xNEPum5PbCMvjSbRTn7H60ZYcFNQlqf+RfO20SCcMZgB5dDLi8bF9P
         xSWShDfAkTBiYUl/DrqkJ+5UMurjEN1RlPFfBmmX20dI5LliX624tSxcA6zmttBry+mD
         KnNc8fQETJIwRqNY/5zg4Bb6JEWLcNxDjqLZq36niakliTSn4GvirZ8WmxEphhoq8m0e
         /nVuT4qmXvB+6kyaT8frYfq5gajGnjMTWIm/XrZWNxmImDzVl1p2LEgPND7z9TDLeqMC
         3oqg==
X-Gm-Message-State: AOJu0Ywpocim+Y+jKyUd5o5UbG8b0NEymCkQAAbC3EcWmwu7eHIPnIKX
	+GJ01miABBsaI7EF5/KRL1CW+Vj4PfiwKABJo9iHxc8FIEUC3JSUTtDeNeKI8Yk479U=
X-Gm-Gg: AfdE7cmCF+2yUVEX+vU4ODjaOg2nc508xB+r5gS6vAkcpHB3M/TJnRZ/bIwHOm8FAwM
	nH3qsfXbvKsS6TrFwldu6Y5ACJYeTK4OPn6XMT621VXslfUIKBZ+dsSlMshxWBL1JCAn/dnHpd/
	ysdjVdFRXuN4fLJ9UmAwFBPFKRCqTOnf0VNMZKTApbrMkNm8fb8st4TyRPxIkwTnrf1BiJEplO0
	L6jyaJfozgai4fT4Cmv8oWkYJqyXxyH2ZvNiJKRFwOt/0LInQHk5oJZLYRORf1QvJvGzRKw/b6C
	Pd9gVFc6mTSbn9gLhftZF6uRdRrzM3lvI/TfNEwp2vzZZw7n2CB9Zry28CPV0eSE6yAjpcmeX8t
	ireDex2W7+xTLfJSK9PYWdBdh7qDRSI1Gw36/iPOgfQYvEoR1Qi5DHP9SmAzX4acqH+MrH6Hbya
	OjYh+g1bOe5bnNG1EorRuEQ9G01Bn2L6+jZLhwLT4uw5SQopTbO5TKpTF8dcD/XCGlZGVzgsbkP
	dMIY6gH6oeX7/I5wN4=
X-Received: by 2002:a5d:5f47:0:b0:460:2d57:6923 with SMTP id ffacd0b85a97d-4651da3bf5bmr4733595f8f.10.1781874325651;
        Fri, 19 Jun 2026 06:05:25 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v6 13/16] privcmd: Add definition for new Linux privcmd to access new Xen hypercall
Date: Fri, 19 Jun 2026 14:04:58 +0100
Message-ID: <20260619130501.272832-14-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619130501.272832-1-frediano.ziglio@citrix.com>
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1781874326-47E773F3-106676AE/0/0
X-purgate-type: clean
X-purgate-size: 1400
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email];
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
X-Rspamd-Queue-Id: 70F066A5F24

Userspace should use new ioctl to access new hypercall.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
--
Changes since v4:
- update comment.
---
 tools/include/xen-sys/Linux/privcmd.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/include/xen-sys/Linux/privcmd.h b/tools/include/xen-sys/Linux/privcmd.h
index 607dfa2287..7a3c41308b 100644
--- a/tools/include/xen-sys/Linux/privcmd.h
+++ b/tools/include/xen-sys/Linux/privcmd.h
@@ -100,6 +100,14 @@ typedef struct privcmd_pcidev_get_gsi {
 	__u32 gsi;
 } privcmd_pcidev_get_gsi_t;
 
+typedef struct privcmd_foreigncopy {
+	domid_t dom;          /* Foreign domain. */
+	__u16 dir;            /* Direction,  0 from, 1 to. */
+	__u32 num;            /* Number of pages to copy. */
+	const xen_pfn_t __user *pfns; /* Array of pfns. */
+	void __user *buffer;  /* Buffer to copy to/from. */
+} privcmd_foreigncopy_t;
+
 /*
  * @cmd: IOCTL_PRIVCMD_HYPERCALL
  * @arg: &privcmd_hypercall_t
@@ -121,6 +129,8 @@ typedef struct privcmd_pcidev_get_gsi {
 	_IOC(_IOC_NONE, 'P', 7, sizeof(privcmd_mmap_resource_t))
 #define IOCTL_PRIVCMD_PCIDEV_GET_GSI			\
 	_IOC(_IOC_NONE, 'P', 10, sizeof(privcmd_pcidev_get_gsi_t))
+#define IOCTL_PRIVCMD_FOREIGNCOPY				\
+	_IOWR('P', 11, privcmd_foreigncopy_t)
 #define IOCTL_PRIVCMD_UNIMPLEMENTED				\
 	_IOC(_IOC_NONE, 'P', 0xFF, 0)
 
-- 
2.43.0


