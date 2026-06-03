Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /qFxMeQmIGqtxgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 749FC637DDE
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ntX164dl;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1326243.1591770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIr-0008W4-2u; Wed, 03 Jun 2026 13:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326243.1591770; Wed, 03 Jun 2026 13:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIq-0008MC-Nf; Wed, 03 Jun 2026 13:06:36 +0000
Received: by outflank-mailman (input) for mailman id 1326243;
 Wed, 03 Jun 2026 13:06:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wUlIo-0007zb-7M
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:06:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUlIn-007IbY-KK
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:06:33 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026d5-bab6-0a2a0a5309dd-0a2a4501d2b8-20
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:33 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026d9-c1f2-0a2a45010019-d155dd2bf17d-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:33 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-45ef616daf6so5237396f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 06:06:33 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ec711sm7254825f8f.12.2026.06.03.06.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 06:06:32 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780491993; x=1781096793; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8RZoFNdKBiiJYSE0JveF3xGCWq95UHsjjlw2XdGNa0=;
        b=ntX164dlsdTP2a/qG9cLPEdns+B041zFXJ1Xk8091DZKWHG6AjeWYsQ9Dugmt1Rm8A
         LW6cmdw3sYl1sb3q0MrYJBf9cLduLmFBbgitq8mZDlGkFOLdFriF8XBwPyHZwKzzOGXp
         wEYvRX7aqcU9Dmjg22eHu+YeKfPALDx9SV5h5NwEkzvY6SksQWxGZriCT9mNVQN7L3Pe
         9p4NAmE9LbA2wrYyteooV9Wq9DsFJdSS0U+Qbjxxk41LtpGXH6935aSIGtNo25DvMdaS
         oWsCAcktDrKQ/av6r0OgPHzioiUpQs6IUZOzxqbU6/nbJbOYBa5+iJjIXWXEYzjyfM2q
         Wt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491993; x=1781096793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D8RZoFNdKBiiJYSE0JveF3xGCWq95UHsjjlw2XdGNa0=;
        b=AmwwjCtLp0Nvk3pUOcRmh+kl0adfKYO3hre9V6Vi76sK7XwY+Y47Zgl9S894gGcULa
         dqKzT74I8v3dWGHkx2MXIFsPc0WhaoGl5FmTZWhSD2AnADxEKqYXgGCf9D1X+5oRGCgB
         NKLXNnFOEqwPw3i2zB1A+VlAgz9hYFfjhKsDAWyrT0/z+bKSE26LPEvkaEN0g2bTnn8B
         ljW4rDM42AMBnShUkAZW/dii22Wgvm9WLbC5p3xOTWXwMFdnSiIwLeHBeUMhuRlELXda
         OAZ1zMEOq+VUp4bR2ZiHMcK3kpm2a8cwrq/yUIZ4Tmh8L5xWUuOCptP6lpOtLiMkcuDx
         KGjg==
X-Gm-Message-State: AOJu0YxxJqtUSnby8yCRaBoS2kRZxYBnnn8XQ+ghz021q/hTazkbcbpB
	KcHIJsoONULjGN0iGFvtukhqopLmRGoO5b3CsZxvY0ZvVe7kRXw3dlVEGAO9koqe
X-Gm-Gg: Acq92OFQkjbCtUwoe1+da7E/aVrMnnSeCDx1DeoIDJpWCE507OqymAxVGBDfP4vzTU3
	T8MfzU9gTjAkAbVGBNlWvu52qyF6xzRmZrPlo9sZtQKOuKRUzVzxyGmT/oq8uiqLL6UY35ENKFP
	L5LZEbF4qWNbC09gLMRM3vpgBCy311Qbm+nJx6jJM2V7xT/eGrzx+FofGb0iUPfpTY5AqxhoZ/G
	LLV4yVwRXy/5r4A3HPklDAIBocWzJ1MPccQ8IqRUmuioQ/CMbpO/n2ONgqwuNZZADge1bkWmr70
	LyCq9XfRSSFGApvXUc2Q3kXz8YdGoCg1U6GDfjvi7gGipyTSf+X8PSYKptYJfeQ6h5YyE1gprbi
	9XjDKUggjHu84sk3S2MYemxy0K/Q3iwtum9/rieK0OQFKqYES8bQNzp4xXpAWiitnVCut6j9pAm
	lyHL+jczjQlSnMf0QFWJw/dy6lGd+Nvgaf9zWbvEcWTApmY8xJ6I5mbon+o6uiURtHApGdCbtGr
	kXMnz2iyiIafmdM+EMD3zCIQ7fQZi+Ky3Bx
X-Received: by 2002:a5d:624a:0:b0:45e:ce28:666a with SMTP id ffacd0b85a97d-46021781a64mr3654744f8f.1.1780491992881;
        Wed, 03 Jun 2026 06:06:32 -0700 (PDT)
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
Subject: [PATCH v4 14/16] libs/guest: use new hypercall if available
Date: Wed,  3 Jun 2026 14:06:01 +0100
Message-ID: <20260603130603.776452-15-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603130603.776452-1-frediano.ziglio@cloud.com>
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1780491993-AC851FF4-E346FA30/0/0
X-purgate-type: clean
X-purgate-size: 3587
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email];
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
X-Rspamd-Queue-Id: 749FC637DDE

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Use new hypercall if available, otherwise fall back to map+copy+unmap
sequence.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 tools/libs/guest/xg_sr_common.c | 47 ++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 9 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.c b/tools/libs/guest/xg_sr_common.c
index a94e9dfbff..cb3e6a5658 100644
--- a/tools/libs/guest/xg_sr_common.c
+++ b/tools/libs/guest/xg_sr_common.c
@@ -156,11 +156,6 @@ static void __attribute__((unused)) build_assertions(void)
     BUILD_BUG_ON(sizeof(struct xc_sr_rec_hvm_params)        != 8);
 }
 
-enum {
-    foreigncopy_from,
-    foreigncopy_to
-};
-
 static int xg_foreignmemory_copy(xc_interface *xch, domid_t domid,
                                  int dir, size_t nr_pages, void *buffer,
                                  const xen_pfn_t foreign_pfns[nr_pages])
@@ -174,8 +169,42 @@ static int xg_foreignmemory_copy(xc_interface *xch, domid_t domid,
         return -1;
     }
 
+    /*
+     * If foreign copy is supported, -1 not initialized, 0 not supported,
+     * 1 supported.
+     */
+    static char foreign_copy_supported = -1;
+
+    if ( foreign_copy_supported )
+    {
+        int rc;
+        privcmd_foreigncopy_t copy = {
+            .dom = domid,
+            .dir = dir,
+            .num = nr_pages,
+            .buffer = buffer,
+        };
+        DECLARE_HYPERCALL_BOUNCE_IN(foreign_pfns, nr_pages * sizeof(xen_pfn_t));
+
+        if ( xc_hypercall_bounce_pre(xch, foreign_pfns) )
+            return -1;
+
+        copy.pfns = foreign_pfns;
+
+        rc = ioctl(xencall_fd(xch->xcall), IOCTL_PRIVCMD_FOREIGNCOPY, &copy);
+        if ( foreign_copy_supported < 0 )
+            foreign_copy_supported =
+                (!rc || (errno != ENOTTY && errno != ENOSYS));
+
+        xc_hypercall_bounce_post(xch, foreign_pfns);
+
+        if ( foreign_copy_supported )
+            return rc;
+    }
+
+    /* Fallback, emulate. */
     int err[nr_pages];
-    const int prot = (dir == foreigncopy_from) ? PROT_READ : PROT_READ|PROT_WRITE;
+    const int prot = (dir == XENMEM_foreigncopy_from) ? PROT_READ : PROT_READ|PROT_WRITE;
 
     void *p = xenforeignmemory_map(xch->fmem, domid, prot, nr_pages, foreign_pfns, err);
     if ( !p )
@@ -192,7 +221,7 @@ static int xg_foreignmemory_copy(xc_interface *xch, domid_t domid,
             return -1;
         }
 
-    if ( dir == foreigncopy_from )
+    if ( dir == XENMEM_foreigncopy_from )
         memcpy(buffer, p, nr_pages * XC_PAGE_SIZE);
     else
         memcpy(p, buffer, nr_pages * XC_PAGE_SIZE);
@@ -204,7 +233,7 @@ int xg_foreignmemory_copy_from(xc_interface *xch, domid_t dom,
                                size_t nr_pages, void *dest,
                                const xen_pfn_t source[nr_pages])
 {
-    return xg_foreignmemory_copy(xch, dom, foreigncopy_from,
+    return xg_foreignmemory_copy(xch, dom, XENMEM_foreigncopy_from,
                                  nr_pages, dest, source);
 }
 
@@ -212,7 +241,7 @@ int xg_foreignmemory_copy_to(xc_interface *xch, domid_t dom,
                              size_t nr_pages, const xen_pfn_t dest[nr_pages],
                              const void *source)
 {
-    return xg_foreignmemory_copy(xch, dom, foreigncopy_to,
+    return xg_foreignmemory_copy(xch, dom, XENMEM_foreigncopy_to,
                                  nr_pages, (void *) source, dest);
 }
 
-- 
2.54.0


