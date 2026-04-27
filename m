Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FqlfMXFA72lN/QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 12:54:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A6C4714F8
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 12:54:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294780.1571507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHJbM-0006QZ-Dn; Mon, 27 Apr 2026 10:54:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294780.1571507; Mon, 27 Apr 2026 10:54:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHJbM-0006Or-98; Mon, 27 Apr 2026 10:54:08 +0000
Received: by outflank-mailman (input) for mailman id 1294780;
 Mon, 27 Apr 2026 10:54:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wHJbK-0005x2-GK
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 10:54:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHJbJ-00FSse-TO
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 12:54:05 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 69ef404a-e002-0a2a0a5209dd-0a2a450a8756-12
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 12:54:05 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 69ef404d-56b3-0a2a450a0019-d1558035e4fe-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 12:54:05 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-488ad135063so92238245e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 03:54:05 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a5c4b9e8dsm116133355e9.7.2026.04.27.03.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2026 03:54:04 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777287245; x=1777892045; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGSrCjw2s0wYO4IMNzZTZ7EkL1Z+q5fAlbsu5KPJu08=;
        b=rnGb9HCBGyIo9p1Rx+UbHkcBoRIOdoyddDbPxWzSqUhpmF/ApRNOfgJ07Fog3KLVR7
         kj7vLZ1KHXLeRdRhHQPEFZpGUQl0x2ay55H95p2O+5LFTvbEU+IaFtZxBTq5goSKWKM6
         z3y4PzD+JRg1zKqu5XeZMsbBKJencerw62SkuDR+cLI309fHKYjuFwK9nGz1+uomleq+
         LogEIV3aQ9GwKo2ejf4N9kll6XVGCQyUSu2HZsGeivoP8mtYgtJbOEVHs+mmtAhaRGH+
         mlddz8Xi63JwFN32qqipvWhh3F7wdzdHh2ZpYlWe1tLQBSiFpp+gol7ETOGLhBIidpLt
         2MKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777287245; x=1777892045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HGSrCjw2s0wYO4IMNzZTZ7EkL1Z+q5fAlbsu5KPJu08=;
        b=rjueFz9yxUW42AOKAg6U+BDgixNtlSYtG1FDRzr9qDoVGxThqy2GdlwCeTzTwGRZic
         nsC1RPy1++zjrS1+79rsINDl9q3zwPaWmsEZRUtUGFxhlhY6TQoFXwC0KeIV/EbFrm23
         68YSdb210x0adNR4LO7dMNx+DLwUwnziBKoxNQwlxpgZIwkwrTtrHTrAIZ8uie0DKv2E
         VUpc71+z9quT2cOed2Get5Lu+pbF+f1kpjYr93PWjoksGqZVHRPhQxx3qxd+nTP0op++
         a+vKPY7i3sZWDEyneSOLepYZtWTtHwYDHspiIgmEzFGkTyyX+Kih/EENngUXSDL8D4Lx
         9RLA==
X-Gm-Message-State: AOJu0Yz3HRt4kZZ7Srsqt8kIZ32tgI9NNb5OJkNQwnRk2M/cMT1mlAxx
	BqoUQZE3Qon20Y64l8EAYKft7753wVPtje83TbvPSxrnFWs2zcNzxpDZda2Xs0yF
X-Gm-Gg: AeBDieuv4Hpc9slJeI3qtsfOhXrPX8Oox9uot1P7yK6lRYkTADl2holvJosoXPwF1mZ
	TvaSi/JcGLX29ueTl/KLfBUZPFRO56wgDy/+EHK/6YSS3FAodtIEVN+M/PkKqufdxkRxNsh6s/X
	a/5u+rE86EvVo24txzNodhGYcL/ICfKUq7zxBn5JLuXeyf54ZET/4JRugnEUOqbbvKNIVNfgVIF
	H+nt95lExpvJ6ZLP29C58GVrpZmLpSCcSUtNSNB9G1YoYDfcDwwsGyEh7ZZIRVlOrObxtsbe9cj
	iAvHdGDz9+d5ygfwX1n6laMG7y95KqT7RRiE++LGUHdtKV8VVfXdCssLCY4nYZiSq8Vi6gkmBZ8
	Hg//BhFm5tPzVuJL0QCqEpHJ14Gfg8U7GMtZG3HLC2p5gXZjAnQrw6W3C03qnNqrL3vR07G8THC
	lQfXY8qpSqHbswa3HRtiCgM9vMldIM4UUEDzot1jKUx2Ngikidqr57t0g+BFU2V8WuXa06NMeKo
	Tqt
X-Received: by 2002:a05:600c:a108:b0:480:69b6:dfed with SMTP id 5b1f17b1804b1-488fb78ba6fmr501796635e9.24.1777287244934;
        Mon, 27 Apr 2026 03:54:04 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 4/7] xenguest: Reduce number of I/O vectors in write_batch
Date: Mon, 27 Apr 2026 11:53:29 +0100
Message-ID: <20260427105338.99792-5-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427105338.99792-1-frediano.ziglio@cloud.com>
References: <20260427105338.99792-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1777287245-CDF698B7-73142FAC/0/0
X-purgate-type: clean
X-purgate-size: 1276
X-Rspamd-Queue-Id: 59A6C4714F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Each page was sent using a different iovec item. This potentially exceed
Linux maximum (1024).
Also some implementation (MiniOS) emulate writev with multiple write calls.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 tools/libs/guest/xg_sr_save.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 1700d819051a..62a39dfecc7a 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -240,13 +240,20 @@ static int write_batch(struct xc_sr_context *ctx)
     {
         for ( i = 0; i < nr_pfns; ++i )
         {
-            if ( guest_data[i] )
+            if ( !guest_data[i] )
+                continue;
+
+            if ( iov[iovcnt-1].iov_base + iov[iovcnt-1].iov_len != guest_data[i] )
             {
                 iov[iovcnt].iov_base = guest_data[i];
                 iov[iovcnt].iov_len = PAGE_SIZE;
                 iovcnt++;
-                --nr_pages;
             }
+            else
+            {
+                iov[iovcnt-1].iov_len += PAGE_SIZE;
+            }
+            --nr_pages;
         }
     }
 
-- 
2.53.0


