Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K1HvGj/QLWrrkQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 23:48:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D98067FD06
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 23:48:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mnxIRCsy;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1337561.1598908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYWDE-0003M3-Vc; Sat, 13 Jun 2026 21:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337561.1598908; Sat, 13 Jun 2026 21:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYWDE-0003G2-Qg; Sat, 13 Jun 2026 21:48:20 +0000
Received: by outflank-mailman (input) for mailman id 1337561;
 Sat, 13 Jun 2026 21:48:19 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wYWDC-0002vD-RJ
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 21:48:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYWDC-006VOz-8B
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 23:48:18 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2dcfe1-e002-0a2a0a5209dd-0a2a4509edf2-6
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 23:48:18 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2dd022-2497-0a2a45090019-d155802bbd49-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 23:48:18 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-490b12270b3so12637205e9.1
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 14:48:18 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492202edf89sm113877065e9.1.2026.06.13.14.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2026 14:48:17 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781387298; x=1781992098; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZLqhAsEGWHmz0lV8qaz7KK9CmcVhtj8aflYqjYEp+c=;
        b=mnxIRCsyer12mBvOHgDifaR5ohSDWRcJFb1LaNV0OmKOWDjNxgVED6IxI7SrJFKVnZ
         B8vY9kV4R5rXiB/i/SlpH4QDsvZDCwfawNJgDed3l0L99ryQPshLiqQehN+5z+lhoYPN
         HShjjW9MOtoGrlUBxe5Jrf12DoIGkkCf5mJokoiqx6Q7d0ZY7DhFwMgUzD1QuG+/NgEm
         ohHTiDxLGavqEHGmdkow0ERunE83ovWLEXWOXHTCAXMfepJshtNBfN5alYHjWeTq8wOa
         Ge80jz31rzZpEN7fIuN9w+6QVQ7ywBR85/rGU0V77aky83FU1VnE+GBAB3ecLqG4rTQS
         lZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781387298; x=1781992098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kZLqhAsEGWHmz0lV8qaz7KK9CmcVhtj8aflYqjYEp+c=;
        b=j7TVbPCn4LYdfoqfVCPcAL6fyvgebrYqqxnawgMExU6CCC0HB1rg5/uPW05lShEYo8
         aYkbrqG5N+M2hX/OGsQPzrIb4W4b4rtu/tb7HCJJYOpB6dETBNFLPxyaBXwRR00DiiM9
         G7wW23WE9cxqonqsVRYMO7tehBW1+LYNaVhWNJAbXICI+ixmP8Wsy5nxKjPrSGqzCAea
         D+wjaeffIq/TAEDkxBK43FR1bxie/hwq2E/3JCJ6Q/CTnuLfRmYkb2QAq3nqgMwSC3+l
         WnRDp2w053H9deQpQtBXiRN2hQKbuc0QqPRB1YQ1QKXfKviSblJjOxiLXlp0VfpFI/Jn
         BdrQ==
X-Gm-Message-State: AOJu0YysDxBFXL9dAcSYt3hV7o8dbcqaqVgSAvi1drGWLGIkXM0n7uBq
	H6E+olkZiaYjOI0si+dbFBPelPpdFVCs2Rxrf5lGZdkaElT43OkwUYPnaNhd6ZAb1xA=
X-Gm-Gg: Acq92OFTxDtFsyW415ztR7D2Is8jsD5xqhaYxZa/j0sSehea28diCldvDF2jhq74y2k
	J9IL66m07N6djHuLWmxjKZMkReTjBdFJ6l3Rw16L6QB3Z2nyzWTljA+e8erj3WvTpR2nsq7K+4O
	7ERrjkddNvYDVwKTEWDSMTpXDyZHk8UZXi0ab4rRv2czOiQpXWQi9SA5joo7uANeSBM67XIvL5Q
	Husq+LNRN7gujES//mqDnPCmpmjA8NXQh3LwNALW1M/0sYFNdJfwI0yWkSlx4PTKpjyfvgZtovj
	2vb31+mFoV9wBtsTqM/oypanAaLQk0yYioRUI3GWNFBwjB2dlR0TXHLneKJSNfgG+XdG0rz1fl4
	EfZkP7CFKd5EW4iKYBL+SOqkDxlD4HpPyiiAq/iInz/IkeKbQBKXd2avvda9xrF5CbxVHQrAuIS
	TvqET7U64n3IOPJxJovpTzDFc1s8SnnSgAgtPQ7M+7VfpskCMoTYCEu8pN/Ow23IlYVL5sK9JvR
	C+1jIZ/2YMxyoXhfi5QE6ltgA==
X-Received: by 2002:a05:600c:3153:b0:490:e5c1:b897 with SMTP id 5b1f17b1804b1-490ec4fe7c2mr108569145e9.20.1781387297616;
        Sat, 13 Jun 2026 14:48:17 -0700 (PDT)
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
Subject: [PATCH v5 10/16] libs/guest: add xg_foreignmemory_copy_{from,to}
Date: Sat, 13 Jun 2026 22:47:43 +0100
Message-ID: <20260613214749.20620-11-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613214749.20620-1-frediano.ziglio@cloud.com>
References: <20260613214749.20620-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1781387298-8A98FA53-81DB1CEF/0/0
X-purgate-type: clean
X-purgate-size: 3485
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
X-Rspamd-Queue-Id: 1D98067FD06

From: Frediano Ziglio <frediano.ziglio@citrix.com>

This change prepare code to use a new "foreign copy" hypercall.
The new hypercall will copy memory from/to a foreign domain.
The new hypercall can be emulated with a sequence of:
- map foreign memory;
- copy memory;
- unmap foreign memory.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 tools/libs/guest/xg_sr_common.c | 60 +++++++++++++++++++++++++++++++++
 tools/libs/guest/xg_sr_common.h |  8 +++++
 2 files changed, 68 insertions(+)

diff --git a/tools/libs/guest/xg_sr_common.c b/tools/libs/guest/xg_sr_common.c
index 9b2782b5cf..f760b63548 100644
--- a/tools/libs/guest/xg_sr_common.c
+++ b/tools/libs/guest/xg_sr_common.c
@@ -156,6 +156,66 @@ static void __attribute__((unused)) build_assertions(void)
     BUILD_BUG_ON(sizeof(struct xc_sr_rec_hvm_params)        != 8);
 }
 
+enum {
+    foreigncopy_from,
+    foreigncopy_to
+};
+
+static int xg_foreignmemory_copy(xc_interface *xch, domid_t domid,
+                                 int dir, size_t nr_pages, void *buffer,
+                                 const xen_pfn_t foreign_pfns[nr_pages])
+{
+    if ( nr_pages == 0 )
+        return 0;
+
+    if ( !buffer || !foreign_pfns )
+    {
+        errno = EINVAL;
+        return -1;
+    }
+
+    int err[nr_pages];
+    const int prot = (dir == foreigncopy_from) ? PROT_READ : PROT_READ|PROT_WRITE;
+
+    void *p = xenforeignmemory_map(xch->fmem, domid, prot, nr_pages, foreign_pfns, err);
+    if ( !p )
+    {
+        errno = EINVAL;
+        return -1;
+    }
+
+    for ( size_t n = 0; n < nr_pages; ++n )
+        if ( err[n] )
+        {
+            xenforeignmemory_unmap(xch->fmem, p, nr_pages);
+            errno = -err[n];
+            return -1;
+        }
+
+    if ( dir == foreigncopy_from )
+        memcpy(buffer, p, nr_pages * XC_PAGE_SIZE);
+    else
+        memcpy(p, buffer, nr_pages * XC_PAGE_SIZE);
+
+    return xenforeignmemory_unmap(xch->fmem, p, nr_pages);
+}
+
+int xg_foreignmemory_copy_from(xc_interface *xch, domid_t dom,
+                               size_t nr_pages, void *dest,
+                               const xen_pfn_t source[nr_pages])
+{
+    return xg_foreignmemory_copy(xch, dom, foreigncopy_from,
+                                 nr_pages, dest, source);
+}
+
+int xg_foreignmemory_copy_to(xc_interface *xch, domid_t dom,
+                             size_t nr_pages, const xen_pfn_t dest[nr_pages],
+                             const void *source)
+{
+    return xg_foreignmemory_copy(xch, dom, foreigncopy_to,
+                                 nr_pages, (void *) source, dest);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index b2c441b644..e37f805240 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -553,6 +553,14 @@ static inline bool page_type_has_stream_data(uint32_t type)
     }
 }
 
+int xg_foreignmemory_copy_from(xc_interface *xch, domid_t dom,
+                               size_t nr_pages, void *dest,
+                               const xen_pfn_t source[nr_pages]);
+
+int xg_foreignmemory_copy_to(xc_interface *xch, domid_t dom,
+                             size_t nr_pages, const xen_pfn_t dest[nr_pages],
+                             const void *source);
+
 #endif
 /*
  * Local variables:
-- 
2.43.0


