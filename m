Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X9T2EmrYO2pheAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 15:15:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A10BB6BE7C6
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 15:15:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="KU19/Ljp";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1344894.1603939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcNRe-0004S7-Cy; Wed, 24 Jun 2026 13:15:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344894.1603939; Wed, 24 Jun 2026 13:15:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcNRe-0004PX-9x; Wed, 24 Jun 2026 13:15:10 +0000
Received: by outflank-mailman (input) for mailman id 1344894;
 Wed, 24 Jun 2026 12:43:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alhouseenyousef@gmail.com>) id 1wcMxR-0007YE-Sv
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 12:43:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcMxQ-001z2q-MW
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 14:43:56 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alhouseenyousef@gmail.com>)
 id 6a3bd105-2eae-0a2a0a5409dd-0a2a4506b1a2-10
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 14:43:56 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alhouseenyousef@gmail.com>)
 id 6a3bd10c-08de-0a2a45060019-d155dd2ac987-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 14:43:56 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-46255b269c2so695968f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 05:43:56 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c226a6f13sm6230010f8f.26.2026.06.24.05.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 05:43:55 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782305036; x=1782909836; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lZSBOgiOu98VSFfL5hE8Rxx3Hlc6Tda5ZxDJZ0F2Ebc=;
        b=KU19/LjpdJFrudroFVIKHNln700oCI47/Qs0Y0vbUjZ9pYMVjyLOrRXSp9q5J5M/fZ
         I68Nfxn2OUySiWTu+ZjgTL/wuIgIiCR6eXNMvUZFqcOhZjqpeGlOdlSuINpy5hx7lMbt
         eX1q1IJm70BesD9dVPxy4LSq9kEfLdm41Z3CuxbtvzVFN0mvsDLQp/L3HnRTcyRcbDVB
         POKLyIO4Xg0nXp/RDZ0dE8Cj28uQ+kSnJudijQ5oqw7WUEqtaiFLTDujv0oKjYPkMvTs
         8kM536mYCu2Am/95RyLeSwBooa6MZ8BaFpNfljWsLgWPf7O9d5nRXg7f5++eM1i7zkaK
         qTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782305036; x=1782909836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZSBOgiOu98VSFfL5hE8Rxx3Hlc6Tda5ZxDJZ0F2Ebc=;
        b=pW2jYckndokb2/O+dm8Wzq7bff0WENeZjXUtH1hGKqXneS/MNgEG/QfcXlKXNjxjQK
         k/WvrVL5ReJ0vpt7hmwSyHaXgw6bhnWm8SD0hNYrPDp91dklh/cM+YgFGoKu69pjWh6B
         MXSjslx9rryro7tdJbgE/gmhac3vnSktKyZDQYv3SN8ajMLb4g19c8A01mfDNj9Bigd5
         or2cxKKuAYKDRP5jEisbeb+U/2p1RPSa8edDRsyDnWzd+Op3TlAFmx6VvE2u+TdLrwa5
         b81yPMaAqP/7c8Llr4TxK15PEzLMo9usVqpPMGXyV0d5oftb9zuHgxZg08U1vZ6lyfTJ
         hZCg==
X-Gm-Message-State: AOJu0YyczclZSW1DnM/E/P10u2wBH76FOZnAGtEJroJfRNcEDxszMcP9
	ZEFz5riFEfZ/y9PJL3+jQhsyK4DwfoMroqr1sFFU79yIx7g2nbdUxaUE
X-Gm-Gg: AfdE7cnN5SdXqMd4NBKluCQ9BMaRUJ87wpaKyKkxy8s8/rQp5vsiXbSexMIddeag+q4
	uP5AobLMzyc+4kckKUqTCmeC4fjz5OhxpgCaNpWm25GVVFDhy0i9CgUJp7UrVvGSn04o2ZUg4lC
	2ZsCYRK6C3/9JWRGjK0mb3ClcGrAEcZvd8ziOwN453n2Kni2XhLjP2h6/DZckJHs8+NaquYraio
	F7yubGuK4tlj+gp/W2DcHWgAbvLatwVSnhkuTRGEF3A8WsMrSXmxkAK0XAsM8Lm10Be5iMPgSOC
	nmgS+cP9WqlLZ89cnPQ0QlQGudZHHpkIyv4zIXT5pXNmYz5SsDXGY4CkF07K7IKFLM/+Bgmv5bp
	bjVltBaCdzkyVm+stJ2WNXdrBEy9j6AbLqpZj4fc9R890E/ppXLud3V/IspQ/0xgTLhunrwxiA+
	IrHx79p0krsWiw3RF32ePjJjXOqA==
X-Received: by 2002:a05:6000:2f85:b0:43c:fa96:d939 with SMTP id ffacd0b85a97d-46c06ad9caamr5500865f8f.22.1782305036000;
        Wed, 24 Jun 2026 05:43:56 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] xenbus: preserve terminator when splitting directory strings
Date: Wed, 24 Jun 2026 14:42:42 +0200
Message-ID: <20260624124242.9160-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1782305036-4352968D-E3859EAC/0/0
X-purgate-type: clean
X-purgate-size: 1654
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
X-Rspamd-Queue-Id: A10BB6BE7C6

xenbus_directory() gets a reply buffer that xenbus_comms.c
null-terminates at body[len]. split_strings() counts strings using
that terminator, but then copies only len bytes into its combined
pointer/string allocation.

If a malformed or unexpected directory reply does not carry a final NUL
within the advertised length, the relocated last string is left
unterminated. Callers then treat the entries as C strings and can read
past the allocation.

Allocate and copy the transport-added terminator as part of the
relocated string block. This preserves current parsing behavior while
keeping every returned entry NUL-terminated.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/xen/xenbus/xenbus_xs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_xs.c b/drivers/xen/xenbus/xenbus_xs.c
index c202e7c55..05b758fff 100644
--- a/drivers/xen/xenbus/xenbus_xs.c
+++ b/drivers/xen/xenbus/xenbus_xs.c
@@ -420,13 +420,13 @@ static char **split_strings(char *strings, unsigned int len, unsigned int *num)
 	/* Count the strings. */
 	*num = count_strings(strings, len);
 
-	/* Transfer to one big alloc for easy freeing. */
-	ret = kmalloc(*num * sizeof(char *) + len, GFP_NOIO | __GFP_HIGH);
+	/* Transfer to one big alloc for easy freeing. Keep the extra NUL. */
+	ret = kmalloc(*num * sizeof(char *) + len + 1, GFP_NOIO | __GFP_HIGH);
 	if (!ret) {
 		kfree(strings);
 		return ERR_PTR(-ENOMEM);
 	}
-	memcpy(&ret[*num], strings, len);
+	memcpy(&ret[*num], strings, len + 1);
 	kfree(strings);
 
 	strings = (char *)&ret[*num];
-- 
2.54.0


