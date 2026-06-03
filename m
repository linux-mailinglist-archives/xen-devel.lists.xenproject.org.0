Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hvrlMuQmIGquxgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B959F637DDF
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hICqtXaZ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1326242.1591766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIq-0008Du-2Z; Wed, 03 Jun 2026 13:06:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326242.1591766; Wed, 03 Jun 2026 13:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIp-00083x-AJ; Wed, 03 Jun 2026 13:06:35 +0000
Received: by outflank-mailman (input) for mailman id 1326242;
 Wed, 03 Jun 2026 13:06:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wUlIm-0007ZQ-AO
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:06:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUlIl-000siy-NM
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:06:31 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026cf-e002-0a2a0a5209dd-0a2a450cc1bc-34
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:31 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026d7-62f1-0a2a450c0019-d1558030a999-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:31 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-49041e84237so6558925e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 06:06:31 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ec711sm7254825f8f.12.2026.06.03.06.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 06:06:30 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780491991; x=1781096791; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qWQaaxuAbn2KGJsbhAAbGu8valGFsAq0ZGefI0obWI=;
        b=hICqtXaZgBdxmoN4hr9MTDgE0TnSGLWTDPJ8zGvMfuxD7OTuYsMnaySasJewnUwjll
         xQ1ajeY7xP1Xub4/8BGEBMEtkfiideKAleToVuc8eb0FhjPmFrACyWOm5zygUIGNLu9z
         8e08JsWlr1KbLxH5QVLQpzrLMylh2r/wbkf3EzPHLOksYz7DINw5GDwaRjydO3TZsP8s
         P+KAZ+cb+bWTxO80fCx9QtH5zXmqgF+PLUyIc8hE8Fh0uQfHCTNtUUJRjD8nnmzx6gPk
         M5HyEz9jK0rXfYsXOEEnbrYLKe5invGLecw7Xf3rZob2GZS+lWQKCnjwiNAWz1lC+nIZ
         la+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491991; x=1781096791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0qWQaaxuAbn2KGJsbhAAbGu8valGFsAq0ZGefI0obWI=;
        b=OUWWyHf3r9Z8zvUL7paylbNpmRwyjj8wJY+R81HoeM6lBWLljWsYMipm3mjtbhAmQJ
         psb3F5Q03sxjLJnS23fuU8R8RUC9ZU/nRHE5AAeQ49gm7zWs41rkkVuADt2hTQDGHG69
         fVs6aWf02mqXHjgr7jf9fxs6UjsP+lrD02yN1mJPhq0Q8nqZey3dh7p73EGv93wUw68N
         mH3nmju8IQscaSwW8s3Gfd0kY4hNhPSHTy7vUcRZzYDm/axoUrg49J/NeNkmMm2O4ert
         OYiNP6VdR6SbB/sqV9b96T01QTujAEXokAipeEMXQ0TI1hOQAkT0x7atyrIG31GEQFa9
         QCEA==
X-Gm-Message-State: AOJu0YzCJJ41fzAK4GCfitMbkQ37WPUaOt1VTkpSmNlS1Xw9qjE1PSJr
	ullSmB7SXFR/rNbjbD4Gmg3bPwUxnbmWh8RZQBB7APjY22ivAN1tYqx8x3QSkta9
X-Gm-Gg: Acq92OGAiBhyS8LfQkU2m+pl7C5PqXII1Q0HBqgrwZYOpPLbAYpAyr5qKwXvqi5OvpJ
	EaCq++hU0VLpulOsG/zovg2uQqPDFWey6i8Znb9IOP2jzSIP7ik2q+2ZIVqAtLYwl2Zxkw9cL4F
	StVyGTlUMI/kD0mrXMtF422VvuJOyQKfAyuwLYoNzMf+UHFIY89fV6quYmidXPXchhZ5e9kLtw1
	S6EfclcgQPxZsDQSPC0i58OVDsWpWiz//D+Z0I2NO0wZO2DT/jndxoHceIR76b9D1kKBC0cPs19
	FsMKpY4RimXCVERHLIaQw/erDu5pUICKH5l5kvdf5mf+u6C7o8n2IoX5Wn5ZhhrtAzhppTsC6Tz
	wfi50oPubBFXX2sTneBIQaJ59YJW5IbBKAeJys7qXpCOajMi12A9aQct8MmoL2xVUAnU9PLLpDZ
	ht2HBQ+pvKaM5CEAcdaA9VvRx/bdW+GMsUlbzedDdEJAW3PZ47Jj92xNeHI80QzMLFjQ48kmXY8
	soYZQH7LMAhBsACDbxoVeCYJSHMG+pKGEvH
X-Received: by 2002:a05:600c:3e19:b0:490:8b0b:d3b1 with SMTP id 5b1f17b1804b1-490b614c9demr51876955e9.12.1780491990938;
        Wed, 03 Jun 2026 06:06:30 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 13/16] privcmd: Add definition for new Linux privcmd to access new Xen hypercall
Date: Wed,  3 Jun 2026 14:06:00 +0100
Message-ID: <20260603130603.776452-14-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603130603.776452-1-frediano.ziglio@cloud.com>
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1780491991-E0766CF5-32E95B89/0/0
X-purgate-type: clean
X-purgate-size: 1452
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: B959F637DDF

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Userspace should use new ioctl to access new hypercall.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 tools/include/xen-sys/Linux/privcmd.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/include/xen-sys/Linux/privcmd.h b/tools/include/xen-sys/Linux/privcmd.h
index 607dfa2287..4b80eeae06 100644
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
+	void __user *buffer;  /* Buffer to copy to/from, must be page aligned. */
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
+	_IOC(_IOC_NONE, 'P', 11, sizeof(privcmd_foreigncopy_t))
 #define IOCTL_PRIVCMD_UNIMPLEMENTED				\
 	_IOC(_IOC_NONE, 'P', 0xFF, 0)
 
-- 
2.54.0


