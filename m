Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MIcEK98mIGqnxgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 490A4637DD3
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SFTj4Cky;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1326234.1591743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIl-0007Tu-Ts; Wed, 03 Jun 2026 13:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326234.1591743; Wed, 03 Jun 2026 13:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIl-0007Nk-Ho; Wed, 03 Jun 2026 13:06:31 +0000
Received: by outflank-mailman (input) for mailman id 1326234;
 Wed, 03 Jun 2026 13:06:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wUlIj-0006v4-0i
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:06:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUlIi-007IYC-DT
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:06:28 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026ce-bab6-0a2a0a5309dd-0a2a450bebbe-16
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:28 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026d4-212f-0a2a450b0019-d155dd35c909-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:28 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-45efb698ef2so2358935f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 06:06:28 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ec711sm7254825f8f.12.2026.06.03.06.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 06:06:27 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780491988; x=1781096788; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCpz3u+0gUwl9boMIWgHEbNmxOn2zYt5frimeVUxE30=;
        b=SFTj4CkyWPLhWvQnyVU354cMkyeKw4D4lz868LH3uwj9eHzXbikRBJmSOsrp6HKY/t
         44pe3ujaDfi7egx246K33OqK+Qs7A/Q74MTZezlZfF94VdfZaRjDPC7hNgM1+hKUhQD1
         D4NGuDG6A7cgyAF8bOCMZ+3uNAnGAIrVlGeQ7O1LgEiZFarULuKBXqr/+DQMv6YrhQPF
         thftdE6+a6EN7i1EPF/fCImenp0h3YjkRpCbHN0Yl6WgpubXw4OE4yiDriz3E+k/SPnP
         WGxcMNezwh1G1lAGS3FVHxEDeqrdkMaizlebVCX1pS2HGalRAOMzxECsuNkBdizcN0Hm
         xCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491988; x=1781096788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qCpz3u+0gUwl9boMIWgHEbNmxOn2zYt5frimeVUxE30=;
        b=hAimnwfNJbu9wu8rBuNqLuxiofqN01ih4Q12CD7O5WkHHNrRQ+jICO7uYl6gIyzJ7N
         Rg7z0nk5GPUcKErFmd7BntWCMCiDT3W8TjqY9tQemXnq9GlxUMlBbv4EkiEW8XJjcT5b
         LrIES73UlpI7o/r+qv1qCj6me0unAyC3u+A/kst390E/2WNAItVsrYo6eTTQnTbp+9F5
         +AU3QdFq9HuRfzMBdmdJ9Qs6RyM6C8yQAfN6ubDZk5mk8Hijj+hoynm+AyE/vVHCj6ta
         R+9EGxH1RjXNlRv2EysMO092po9HpGGkN9R5eV6CIroGD0b/CRXM20A/J0HWylz2Rt1p
         iUJQ==
X-Gm-Message-State: AOJu0Ywf2YmdrYU6oIml7Yk5tUzrzujnwTIBpjtdyj3lZPl8RrBLKj3g
	8urzn68ksftvzRFhcOxn/qS0w5uWkXfFqnc04AN3VMog9VWjIQJkOskNlJlq7wA3
X-Gm-Gg: Acq92OGmh9h0qevPNXYjs3MYvQezkCqpHdcOxJXvqrYHKoHhvUOjfYVwwBe2JexhwGw
	4gvGHenINGkDHmlbglUstkFG26oRVr6EooN0fr+2rFb+onZugymYR+VoMGETTSyt1A+VHiea3LX
	xHfffplSRkW+C/mD1TwmvM5schIZMptUVS2TKVPxlcc742c1o3NOLh4vvyNmqpGnuFFKt1CmyZA
	JgTbmN5QhOUE2wBAR+mx2VvOBuPMBvFumC6YyHF/aRrybfCHspw4sYR94DO+DEMnu/U5EOkIFda
	8xQOlpXnpuc67PveEgRsSFfrfIolhhzQLQajU0tXKutniRRnEzcLvv4Q/DB4nsfJVLRDmxC5eEw
	W+L9Ulk4D2CEkqhdjueGPp0JLsitTRrtv7I8EPMYy5dvq33S9jdghJxA5BAblWEWhB7b+yFCbrX
	LuGPK8i74s/I7d2mCPB7weaqzGiApeyBSKWSuVP++RdQv+xWiwUrySJJD3teyvT+ApT2yR4V6dV
	n4dcxJMEI/PJo8Tr1zasbH3XbxpUR1N4B+g
X-Received: by 2002:a05:6000:299c:20b0:460:1223:a044 with SMTP id ffacd0b85a97d-46021612545mr3590294f8f.0.1780491987578;
        Wed, 03 Jun 2026 06:06:27 -0700 (PDT)
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
Subject: [PATCH v4 10/16] libs/guest: add xg_foreignmemory_copy_{from,to}
Date: Wed,  3 Jun 2026 14:05:57 +0100
Message-ID: <20260603130603.776452-11-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603130603.776452-1-frediano.ziglio@cloud.com>
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1780491988-18762F3B-CCFB2C11/0/0
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
X-Rspamd-Queue-Id: 490A4637DD3

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
index 86c148c62f..a94e9dfbff 100644
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
index e8452746e4..72c9511f38 100644
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
2.54.0


