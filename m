Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EBz2N2I5IGpLywAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:25:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 973DA6388B4
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:25:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SIPulOqd;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1326564.1591976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmXB-0003Zl-Fh; Wed, 03 Jun 2026 14:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326564.1591976; Wed, 03 Jun 2026 14:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmXB-0003Xq-C6; Wed, 03 Jun 2026 14:25:29 +0000
Received: by outflank-mailman (input) for mailman id 1326564;
 Wed, 03 Jun 2026 14:25:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUmXA-0003Kz-5g
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:25:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUmX9-007UC0-IU
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 16:25:27 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a203957-2eae-0a2a0a5409dd-0a2a45059bec-0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:25:27 +0200
Received: from [209.85.208.48] (helo=mail-ed1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a203957-aaa8-0a2a45050019-d155d030f140-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:25:27 +0200
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-68c32f3c6d6so6685238a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 07:25:27 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf0517721c2sm162199766b.3.2026.06.03.07.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 07:25:26 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780496727; x=1781101527; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+x37B1+Fyus2+jQomeDFwH7emsF7fUQXicCRbEPM+E=;
        b=SIPulOqdEFRQD+bNaTkyBW5OHMxkivLLBlOpGOXDkFRS11wspIbBee7dwmr09k+VYX
         veU72ikA6a92ioK24KA1d2JT3Be2SBWELIqaguRTUkjU6B43i6gHskCyjwBxspY8YFWj
         Q33sEfmz5Liwt2Wy4IWsHbv2eMB6GO+ndaZDBn6yGJoMhuyNJo78TYMS+UaMojRuxWH0
         +ysdPgCFE+Mc3UcJTfN0B2Fx8560pdglBcoULC8ycVhvnLwDgYE0yzDFghx50Bs2r+rM
         pelqcFHD67nWH+O2tYZ7DJBmPVW0YpWaDWxq8SlNv5Vt37VAZu+rdvF8wlvyVn7vrRoH
         qyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496727; x=1781101527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y+x37B1+Fyus2+jQomeDFwH7emsF7fUQXicCRbEPM+E=;
        b=IuZGP5jQX02cQkoZHg7DoYyooI4PZnXNN2oFcemsfDVtp6HJxbYIFKJMopTbeZbXxN
         LJj0W2V3bV53hBkIo48L86gv+KP+6SHEbDj/Rr1KzCUpL1l9vF5QA0e4V0j+2NK7QSK2
         NCi3w2cGdGRlpsxJqfAW9uG/5XLRhLsR7fl0Q0hRLSzNY5U3TWZ1/29GgLv6Qdioksl0
         lnnunq65GchkJwwyifL6fwpcBIkVXqF2Id5Hp4cVcEZYTJ7a7KVLVOmDe0RSf3MyI5dt
         L6oN4NY2SvXYAYoBB0WzrCd/heC6S5/lWy7bROQF1+dna+TZIxNTK17e1Ceq2p8oyQih
         Jqlw==
X-Gm-Message-State: AOJu0Yw9J4TWZh2ypK72F0GlqBaIYGtZyah4MrGZ4gvJRKECyeXebOOO
	8IX98ES3VX3k2ETG6dgdXlnpxVHi1YW//5x43xRrFfmkZZXyr4abtz2GQPD3JA==
X-Gm-Gg: Acq92OGPuqNzfRyoWQpmmI6dg4sZXcKVswz0rAJH/cU25rlUnoRjsYBmjc27ol9M6cc
	5LqdblEuzt1y/ZukIgEZtpikeA+TurdY/AVsC3aBEtcIWJsNB8Eg3AP394Q+kI5nmpMnQz3izbU
	MMVmy1jW/S+NPszBKqrslnRJplUbd5gTIUmJj/CNl5+NKmnDHpKAC8myL4C7cShvcscdYB2YBbG
	y6eV39kEDh/GWt2u6x8vSIdSkAaX5NtUc0JAD96yqWxclc9oHgGsjFnlmkHH+okIXsQKizFYI5F
	Ll49QgGhMq1czOKGPZCuvAmZ7TDkzU6NXD+og8S7bL0aLAqZwF0NVwFZ5roNpDMf5NKJxX9KiYB
	DKLTnJlwbf/hZ1RJFDqjmAmG/SS8zvD3sT3vCXUEUyT+G301NAGvIlMaZ59xg+JO9ZlH5Q/IdmW
	kKzV7Rw3aVnVJajcgX3QClWbaYixdRyZymTiJ/ioEjMcyqbpa1OvNi7bBz/cFbDqjuPQF16MPJB
	IYDT7w=
X-Received: by 2002:a17:907:1c1d:b0:bed:19af:f89a with SMTP id a640c23a62f3a-bf0ac40a89amr191494066b.7.1780496726722;
        Wed, 03 Jun 2026 07:25:26 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>
Subject: [PATCH v3 1/2] libfdt: fix UBSAN null pointer in fdt_property()
Date: Wed,  3 Jun 2026 16:25:17 +0200
Message-ID: <a543a82e2ed03126e9fa1d9749095b13f60456c5.1780494838.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1780494838.git.oleksii.kurochko@gmail.com>
References: <cover.1780494838.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1780496727-E0C65443-A21F4550/10/73395122804
X-purgate-type: spam
X-purgate-size: 1776
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,xen.org,arm.com,amd.com,gibson.dropbear.id.au,vates.tech];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:david@gibson.dropbear.id.au,m:baptiste.le-duc@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,amd.com:email,vates.tech:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 973DA6388B4

fdt_property() unconditionally calls memcpy(ptr, val, len) even when
len is zero and val is NULL.  This is a legitimate calling convention
for adding empty FDT properties such as "interrupt-controller", which
carry no payload.

However, compilers that treat memcpy as nonnull on its pointer arguments
will fire UBSAN before observing that len is zero.

Guard the memcpy() with a check on len so it is skipped entirely when
there is no payload to copy, bringing the code in line with the
nonnull contract.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Origin: git://git.kernel.org/pub/scm/utils/dtc/dtc.git f57e7df35df4

Fixes: f0ea06558068 ("libfdt: add version 1.3.0")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Add Reviewed-by: Michal Orzel <michal.orzel@amd.com>.
 - Add Release-Acked-by.
---
Changes in v2:
 - Backport patch from https://github.com/dgibson/dtc/commit/f57e7df35df4a301961cbbf9433ba4e85c2ee5ed
---
 xen/common/libfdt/fdt_sw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/libfdt/fdt_sw.c b/xen/common/libfdt/fdt_sw.c
index 4c569ee7eb0d..96d4cf571319 100644
--- a/xen/common/libfdt/fdt_sw.c
+++ b/xen/common/libfdt/fdt_sw.c
@@ -330,7 +330,8 @@ int fdt_property(void *fdt, const char *name, const void *val, int len)
 	ret = fdt_property_placeholder(fdt, name, len, &ptr);
 	if (ret)
 		return ret;
-	memcpy(ptr, val, len);
+	if (len)
+		memcpy(ptr, val, len);
 	return 0;
 }
 
-- 
2.54.0


