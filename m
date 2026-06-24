Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f3BQOWvYO2pjeAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 15:15:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F0B6BE7CD
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 15:15:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ILPwSCR3;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1344904.1603944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcNRe-0004XG-KG; Wed, 24 Jun 2026 13:15:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344904.1603944; Wed, 24 Jun 2026 13:15:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcNRe-0004SB-Gf; Wed, 24 Jun 2026 13:15:10 +0000
Received: by outflank-mailman (input) for mailman id 1344904;
 Wed, 24 Jun 2026 12:49:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alhouseenyousef@gmail.com>) id 1wcN2N-0008Er-Pb
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 12:49:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcN2N-000Iyg-6b
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 14:49:03 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alhouseenyousef@gmail.com>)
 id 6a3bd22d-2eae-0a2a0a5409dd-0a2a4503acea-40
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 14:49:03 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alhouseenyousef@gmail.com>)
 id 6a3bd23f-ec1a-0a2a45030019-d155dd2ed15f-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 14:49:03 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-46019b190b6so847974f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 05:49:03 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fc47720sm797976155e9.0.2026.06.24.05.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 05:49:01 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782305343; x=1782910143; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NRKyao/0uQFhpjs6ysB7TR6a5cmOeMKMYRAxzRlp5+I=;
        b=ILPwSCR35ONtiz//F3qqgBBNibhRtsqUA1cwhxJdF24ea26JfrwWawedtfvOOOhgDa
         T8NCReHhrZphdco8lJELEO9Cy2Qr5e4GfW6j3S0iCPFbPlJugJWusi+o7yx6pjkMeij9
         MVOXUziO6lbY1fz5MIIlLIrn2xzfjxC1p7g5We2OTdEjJmFyurLXcj8+l9+DUwojm9GE
         2cyE8PR1MpVGjGKmBs/poEZ2pvZtcFKFgcurLBqzJ8Jn2gRp/DcTe921ROeB5QknVxUn
         I2s8d33lh5gLF1isn4mXpk/0H7TXPDY1s1W5PSq9zx6z8DIPpE6Z22gZV40A0WS+5RNV
         plSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782305343; x=1782910143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRKyao/0uQFhpjs6ysB7TR6a5cmOeMKMYRAxzRlp5+I=;
        b=jqERfM4zamBSZ0iA8H99Us8AxayDfXl8qIWvvN2rRrn0DTfLcEIAXauUtVfpwf+f8k
         VLw0x9HZ12gXmwTZJJcxVKWjfxWs7eigij1poXtSOld05YHueV14MQCJ0kAIXYL25tGr
         I05bTkJ9ULMMtfb0QnbbsICn4Mqe52yyu/PzlrtfHRbYSIMKQPmN+mTidaqgJNx0dnoa
         ayCbiuZMRbsR8aldksvYzxt0LXrmrAmLabaSzbiv6ZJOAykbgk6zTyco5OlOKonFqad7
         d9Fkv3JuydZFk7JqaMhME6Z+OWkHtPCoJ7V0wUL6ex0y49cHnHHM1ZhZ4RMhmpzv/E6G
         xh2A==
X-Gm-Message-State: AOJu0YyUIlQApxBfa+bMAlIGMn5Lj12HtzaGISIYTyKZBI9xDW0r1lGH
	02GOkf7RcfN5QVlZRf+6duwCCMCZgisJNomHSznhQprYulGmj2G8PSmD
X-Gm-Gg: AfdE7cn0tRtH23OPQpXdrLwocoiLDMLKJ2kWVZhDSnvHjupKDSGTTEqTjJEWc5kHQ/X
	Znx9ADh6aoisHRldjTJZo8jl+GWb+w6Euy+gRm4SjhD661wqslwsm3KWbjShQ+2wTboqVg0sS/n
	5jK7FFHvBYB0xDD9IXfKHUoAvIkv3UqPYuheor5IKMq7T2f7zPmd/xyxKseSWx2WDlySdGT/NzC
	UovsBYWYv4kP/Sp2j+6lDktlTsCZYWqKTmlRheBzqecCywxRok+YITZzdkj598NCGakc3SiYHC0
	KjFUMXXsq0+XJGSonb9P8edz/O2Y+r+rj0XNPNHE/Y4qCFqoQfqTQopRmTaeTYaPcjuD53ycDU/
	20kVrruoYb0KdpBFDIqgcPB6cyom6XDEH3h104XWP+BiWG0XvmX8UIWiJa9iiIs6wWYEajFAQ9v
	0IeYGDdyjDdXpcaz4hg/RQgcbvpFp444HOuQ8C
X-Received: by 2002:a05:600c:1d1e:b0:48a:906b:14ca with SMTP id 5b1f17b1804b1-49260873781mr43609065e9.20.1782305342275;
        Wed, 24 Jun 2026 05:49:02 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] xen/gntalloc: validate grant count before allocation
Date: Wed, 24 Jun 2026 14:47:45 +0200
Message-ID: <20260624124745.10073-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1782305343-BC9825D1-44CC695F/0/0
X-purgate-type: clean
X-purgate-size: 2178
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:alhouseenyousef@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alhouseenyousef@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[alhouseenyousef@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96F0B6BE7CD

gntalloc_ioctl_alloc() allocates the grant-id array before checking
whether the requested count can fit within the global grant limit.
Counts above the limit cannot succeed, so reject them before the
user-controlled allocation size reaches kcalloc().

The locked limit check also adds a u32 count to signed global counters.
Rewrite it as a subtraction-based range check so the arithmetic cannot
wrap around the limit.

While there, cast the count before advancing the per-file index so the
page-size multiplication is done in 64-bit arithmetic.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/xen/gntalloc.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/gntalloc.c b/drivers/xen/gntalloc.c
index eadedd1e9..ba6a25a09 100644
--- a/drivers/xen/gntalloc.c
+++ b/drivers/xen/gntalloc.c
@@ -272,6 +272,7 @@ static long gntalloc_ioctl_alloc(struct gntalloc_file_private_data *priv,
 	int rc = 0;
 	struct ioctl_gntalloc_alloc_gref op;
 	uint32_t *gref_ids;
+	int limit_snapshot;
 
 	pr_debug("%s: priv %p\n", __func__, priv);
 
@@ -280,6 +281,12 @@ static long gntalloc_ioctl_alloc(struct gntalloc_file_private_data *priv,
 		goto out;
 	}
 
+	limit_snapshot = READ_ONCE(limit);
+	if (limit_snapshot < 0 || op.count > (uint32_t)limit_snapshot) {
+		rc = -ENOSPC;
+		goto out;
+	}
+
 	gref_ids = kcalloc(op.count, sizeof(gref_ids[0]), GFP_KERNEL);
 	if (!gref_ids) {
 		rc = -ENOMEM;
@@ -292,14 +299,16 @@ static long gntalloc_ioctl_alloc(struct gntalloc_file_private_data *priv,
 	 * are about to enforce, removing them here is a good idea.
 	 */
 	do_cleanup();
-	if (gref_size + op.count > limit) {
+	limit_snapshot = READ_ONCE(limit);
+	if (limit_snapshot < 0 || gref_size > limit_snapshot ||
+	    op.count > (uint32_t)(limit_snapshot - gref_size)) {
 		mutex_unlock(&gref_mutex);
 		rc = -ENOSPC;
 		goto out_free;
 	}
 	gref_size += op.count;
 	op.index = priv->index;
-	priv->index += op.count * PAGE_SIZE;
+	priv->index += (uint64_t)op.count * PAGE_SIZE;
 	mutex_unlock(&gref_mutex);
 
 	rc = add_grefs(&op, gref_ids, priv);
-- 
2.54.0


