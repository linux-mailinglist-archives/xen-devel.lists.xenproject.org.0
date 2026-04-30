Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHBtDVon82mwxgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 11:56:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C51734A0507
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 11:56:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1298018.1573633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIO7b-0001Wp-EX; Thu, 30 Apr 2026 09:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1298018.1573633; Thu, 30 Apr 2026 09:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIO7b-0001Tt-Bo; Thu, 30 Apr 2026 09:55:51 +0000
Received: by outflank-mailman (input) for mailman id 1298018;
 Thu, 30 Apr 2026 09:55:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wIO7Z-0001Tn-HV
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 09:55:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIO7Y-008RTU-Iq
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 11:55:48 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 69f32722-2eae-0a2a0a5409dd-0a2a45089662-24
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 11:55:48 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 69f32724-63b5-0a2a45080019-d155dd2eb5d9-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 11:55:48 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-43d73352cf2so630730f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 02:55:48 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b421721fsm10898056f8f.15.2026.04.30.02.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2026 02:55:47 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777542948; x=1778147748; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnTr+tpnUjMMyY2EgI3u33HAIOJqHrh+Ji5jhOHj004=;
        b=dECBSC0ejh0jZOur3VZ1tZxHppiYazzwiBNxOY67fSv0r/vvFaEn46fPjOBlYZ2Lw5
         cHTFr/kiOFkRbDLS2ouwC0a9OOleVa0PTz/6nxcHZ5Ado/daYv3S8zX0zVBgJPIe9/tK
         QZ6BkwW2VKDKVm/mvzNdkmGHOflVxGc3hqwDFsSxlprXRlo/bvORHUUdV8TZzxq9gLC5
         QfOVdZOIxozZMa42/iBP3uXcFflBKGHv93LMutgnK1Uv21rge3M80lPEvqGJzNMd8gDC
         w0ZmIZt0nxt0FrxVkd/fL4t54VKcY6bYYhqFn+jFlfnKNQZ9xcmt5B81Dp+3hOhZZ/Ni
         3kHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777542948; x=1778147748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnTr+tpnUjMMyY2EgI3u33HAIOJqHrh+Ji5jhOHj004=;
        b=OU2/b9L73vJbGlxB8Osls2lchtSsFmkI9KZD+rMjcKTfzvdZlhfrRy13Y/yEnCrHQB
         AJZl+wBI5FsEQMnoXv0PRtfFdltAnTVvNSjIDUFUfYlGRF0Mk/ygw2PTBRSZmZPmlUMA
         i2B55t5FWWLZMfzQ0Gr+fpiLN25w2+LMw/wHPB6qCkhH0tnF110DupRQbgwR1afGVhv1
         VeHSvB6jBwPhPaAR54PIBQeYw0KFCgGuGqBAlg+xPrw1M2JYT3JqqW1beKCHZjqxR31w
         7Jffp61nzzqIr9uuCKOec6zEmrpo225/7Ur9lMF/l5T8AlKjGFO7yJh/S1z9Yz2hREN2
         RD1Q==
X-Gm-Message-State: AOJu0YwVYVp1CHAh0FiQxKgc5a4l21aXNqOvLY4hPzuCPRwQJ0VvIA/z
	wWzLzkIRu01bcrNN8zLivAoMwfArgGw/fOQTj3C4Bk8x6UGcn/pT/dU1Z9gPQkeJ
X-Gm-Gg: AeBDievz1iAubhhRO+Wn2gltyr8odYg2tDCH7RBkN7o8PtHSV2bqw09sMqGTGNNUVxr
	klF/76YCWg6tDVC4+8Y44MmvrPUpnpIGbz5JVqVSxFqOL4Ss7OwZltSq94T0NtZKTl1aDy7XZkb
	D0lTEBw3OaZgTijQFPi5b2P2ERDjvXAdsO2jOlD5oRT3/J3EEHlc5mVuztJBW+++A3v5dUJ2spT
	eeqCCORVy9ob32e7o8oB2T0TsMzfnRVxOQdmwZ4pA4F3PzehItoNvgHuRpBGXtxzHsNIvs5a2XZ
	xb10t8ofm9ejTYeEoNJPgbWGCokYpEl/CquyP3doGXdmfUSLkQSjAsDQRA6dXOP/w91swVh8zBB
	UHARSdV9IIzldCOu27YbaZ5iuJhIOwQK6YWFVoT605cgIQiYFAI0Wz5Y7p9kSY885Ysq/M1HZxx
	HCRMu73apFv5Z0AgqTbRU/MxFkR1TNZWfawUochdog1ZV5PHjkqQqm5ML5TbBjmPAYv3uGPFgdD
	trl
X-Received: by 2002:a5d:58e5:0:b0:449:c5e2:a8a8 with SMTP id ffacd0b85a97d-449c5e2ab40mr1037430f8f.3.1777542947544;
        Thu, 30 Apr 2026 02:55:47 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] tools: Use posix_memalign instead of valloc for NetBSD
Date: Thu, 30 Apr 2026 10:55:21 +0100
Message-ID: <20260430095521.8399-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1777542948-3AB74DB1-7C82FB20/0/0
X-purgate-type: clean
X-purgate-size: 1532
X-Rspamd-Queue-Id: C51734A0507
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,cloud.com:mid,cloud.com:email];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.974];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

More similar to other implementation.
posix_memalign was adde in NetBSD 8.0, released on July 17, 2018
and went out of support on May 4, 2024.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 tools/include/xenctrl.h     | 5 +++++
 tools/libs/ctrl/xc_netbsd.c | 9 ++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index d5dbf69c89..f4316089e7 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1390,6 +1390,11 @@ int xc_lockprof_query(xc_interface *xch,
                       uint64_t *time,
                       xc_hypercall_buffer_t *data);
 
+/**
+ * Allocate memory with a given alignment.
+ * The alignment must be a power of 2 and at least sizeof(void*).
+ * It returns NULL on error, errno is not set.
+ */
 void *xc_memalign(xc_interface *xch, size_t alignment, size_t size);
 
 /**
diff --git a/tools/libs/ctrl/xc_netbsd.c b/tools/libs/ctrl/xc_netbsd.c
index 1318d4d906..d27154dce9 100644
--- a/tools/libs/ctrl/xc_netbsd.c
+++ b/tools/libs/ctrl/xc_netbsd.c
@@ -60,7 +60,14 @@ void discard_file_cache(xc_interface *xch, int fd, int flush)
 
 void *xc_memalign(xc_interface *xch, size_t alignment, size_t size)
 {
-    return valloc(size);
+    int ret;
+    void *ptr;
+
+    ret = posix_memalign(&ptr, alignment, size);
+    if (ret != 0 || !ptr)
+        return NULL;
+
+    return ptr;
 }
 
 int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
-- 
2.43.0


