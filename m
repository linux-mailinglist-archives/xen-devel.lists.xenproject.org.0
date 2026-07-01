Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id he/PFKwbRWqG7AoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 15:52:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A848C6EE5FB
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 15:52:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=DknmK2MO;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1349989.1607575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wevMi-0007Kl-9G; Wed, 01 Jul 2026 13:52:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349989.1607575; Wed, 01 Jul 2026 13:52:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wevMi-0007I1-5g; Wed, 01 Jul 2026 13:52:36 +0000
Received: by outflank-mailman (input) for mailman id 1349989;
 Wed, 01 Jul 2026 13:52:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wevMg-0007Hs-SP
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 13:52:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wevMg-00B58B-5Z
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 15:52:34 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a451b9f-2eae-0a2a0a5409dd-0a2a45088f56-6
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 15:52:34 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a451ba1-edec-0a2a45080019-d155dd2ef026-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 15:52:33 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-4763b0c1dcdso798018f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 06:52:33 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4756636ce7esm18672970f8f.23.2026.07.01.06.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2026 06:52:32 -0700 (PDT)
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
        d=citrix.com; s=google; t=1782913953; x=1783518753; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xl3e4suKSPl7CWk+sb8bPatN3ANB8eUSjC46flYftEE=;
        b=DknmK2MOxsjafHEumZJq0pswxDGKZal8eKAmaAM6Kh+0PPVO8c+VKgALVXbT3Kjx+3
         UkoO5E+XfDUsdt4jCTEAK/nA3YyRYzWHcRPP9WYWXc9rWRzEB8ijM5+FXR9WIzjxG5wU
         Qn4mWx2Um0+nx0w1uFYdm7upvJtPrftqqrSIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782913953; x=1783518753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xl3e4suKSPl7CWk+sb8bPatN3ANB8eUSjC46flYftEE=;
        b=DipnSc9Mz/vVvPnMj/QpRqmaUAWIh+v1g0J4CaeDmRKc1+lDglYVdFVAF0pgcX0szP
         5ugHrHrZa4BRriAeOA+Jbuvjy29FEgR8XCXZXr5KrBDZif1+aAW/x2rgpx77KxDbPysR
         tE2trzBFoTjTOon4JRe57g3AKISIQjqBFI9tFupAqEJt0ut1uAoCko9phKs938jILWLJ
         Ugo9ax11HEZzwANh65G+809TmuNbHsSU4sR0mwaf3tPEcxmLCFZVLB5EysO0Ij1bs538
         zMPp2015B8v1cf4dv+txeZ0gae0/9TzLQi3amhowVnwocVnmfUMWOJZPNsbHYYS2BUdb
         LDAQ==
X-Gm-Message-State: AOJu0Yy7JsPgpWEWZM8HMimZv4reNnLEc86KDQBA4luE/7chSPwNQiyx
	FSxjuBTXAkWOvIWFxz0hcecAjtmxnUrvJgt9gBl7Uncp46gTeTgnMK85CEfwY9bDT+FG1G4nFiA
	NAQB1
X-Gm-Gg: AfdE7cm1A2pEIVp1KfLTg26BeFk4DReA8wBmxoi/fG5t8kHo/T88Wnje93SGDqEqzuH
	HhXt7JpQa/FYlS5/y0u+T9YsDg1N9nfbs1tFbefUtlOiSBndHUp9y0Gl5N1r62FK8psziU0Pnyr
	6YTFBpN3jYjFLTSf2OrmkGxx4Izc6cYT99k9wf9jk4D9bHjxL3E1PPA2a3lNWnzi6UQs/KlwHJw
	sR60CFD2ZsCGwhqMGySKOzC2joYUEHDIQJK900IyUw1h06EcUAO+xdq7yqyGvbTFiBUBQCCz+5g
	NeVtnBD5rqV8jYO9JAJyWKParS/OTYdGrJC2iXG7sY2awa9JYBq2m4fXOe3jENhqSFSCyLAfIT9
	KmjT1t2ZAQw8DLJ2p3KfvLTmye+IeRYF9nnYY+jXJl5SwFFBMrt7pRJcT+W+1Swz2Z/4eOS1RRD
	eW5q6FVv+Nsn1VbV0qwz+q4jgxR21kq9KgsdKGN8A9vyl7K4dhFJtf1u04bLUMb9ixluKtU0AcH
	Q==
X-Received: by 2002:adf:ed42:0:b0:477:80fa:f44d with SMTP id ffacd0b85a97d-477b5677843mr793528f8f.40.1782913952815;
        Wed, 01 Jul 2026 06:52:32 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v6 1.9/16] libs/guest: Allocate rec_pfns earlier in write_batch()
Date: Wed,  1 Jul 2026 14:52:30 +0100
Message-Id: <20260701135230.794306-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260619130501.272832-3-frediano.ziglio@citrix.com>
References: <20260619130501.272832-3-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1782913954-A2D3B3FC-A57FC2C9/0/0
X-purgate-type: clean
X-purgate-size: 2133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,vates.tech:email];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A848C6EE5FB

For reasons which escape me, rec_pfns are allocated separately to the rest of
the batch allocations.

Allocate them all together.  This will allow for future simplifications to be
performed in an incremental mannor.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 tools/libs/guest/xg_sr_save.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index fdbceab52e46..69fe991a8113 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -116,8 +116,10 @@ static int write_batch(struct xc_sr_context *ctx)
     local_pages = calloc(nr_pfns, sizeof(*local_pages));
     /* iovec[] for writev(). */
     iov = malloc((nr_pfns + 4) * sizeof(*iov));
+    /* page_data record PFNs list */
+    rec_pfns = malloc(nr_pfns * sizeof(*rec_pfns));
 
-    if ( !mfns || !types || !errors || !guest_data || !local_pages || !iov )
+    if ( !mfns || !types || !errors || !guest_data || !local_pages || !iov || !rec_pfns )
     {
         ERROR("Unable to allocate arrays for a batch of %u pages",
               nr_pfns);
@@ -208,14 +210,6 @@ static int write_batch(struct xc_sr_context *ctx)
         }
     }
 
-    rec_pfns = malloc(nr_pfns * sizeof(*rec_pfns));
-    if ( !rec_pfns )
-    {
-        ERROR("Unable to allocate %zu bytes of memory for page data pfn list",
-              nr_pfns * sizeof(*rec_pfns));
-        goto err;
-    }
-
     hdr.count = nr_pfns;
 
     rec.length = sizeof(hdr);
@@ -264,11 +258,11 @@ static int write_batch(struct xc_sr_context *ctx)
     rc = ctx->save.nr_batch_pfns = 0;
 
  err:
-    free(rec_pfns);
     if ( guest_mapping )
         xenforeignmemory_unmap(xch->fmem, guest_mapping, nr_pages_mapped);
     for ( i = 0; local_pages && i < nr_pfns; ++i )
         free(local_pages[i]);
+    free(rec_pfns);
     free(iov);
     free(local_pages);
     free(guest_data);
-- 
2.39.5


