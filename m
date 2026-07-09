Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bAwpHntRT2pxeQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 09:44:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2734972DE6C
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 09:44:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dFi+2J0V;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1357594.1612008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whjQt-00088u-L5; Thu, 09 Jul 2026 07:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357594.1612008; Thu, 09 Jul 2026 07:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whjQt-00086M-F2; Thu, 09 Jul 2026 07:44:31 +0000
Received: by outflank-mailman (input) for mailman id 1357594;
 Thu, 09 Jul 2026 07:44:29 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1whjQr-0007rR-CJ
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 07:44:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whjQq-00B0uc-P9
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 09:44:28 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4f514d-bab6-0a2a0a5309dd-0a2a4505a858-36
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 09:44:28 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4f515c-3cb2-0a2a45050019-d155802aec98-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 09:44:28 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-493e497643fso8374575e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 00:44:28 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6f3b85sm69114695e9.2.2026.07.09.00.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 00:44:27 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783583068; x=1784187868; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VIQbF+Op50T3FNdB6k5+hscux1I4CT+hNhWYmJo58Ts=;
        b=dFi+2J0V/FQPNGrcsa4PGCk701bLEGOkqd712O7KMfcwv4+yLEVYEjIKKWjXksmKrt
         jnDCqW0h6o/JLQFCvzwakOrT7mJutLBpUUKYUeQ72bLAT4rLpoPwHkX+GuR82dDmKQsL
         Jp6XyWt2k6kiOkKVJQr7x+AV2dAwG6d1WvWj1B0PscKfKz10KBhNA+O4G3cSjfB3Mto0
         1y+byQ+pLbeOqUAeSDaKlov6F79mseIGyu2wX2KnIk6dLyVWEe1CEFAuXmtBqvlw4MbV
         JTD5S4ErjwKkImBNknbc74DTG/DBdG+lgwgpfyK5XWUir47z42u+2tgqXAW5jMpIyPf4
         kVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783583068; x=1784187868;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VIQbF+Op50T3FNdB6k5+hscux1I4CT+hNhWYmJo58Ts=;
        b=sfhTFSIKvOuCeSmhlGEUbzzhFxreqSuWy8PMi4NV7MH3WvkOnUFMsbSlpf7o1aeVMZ
         XAiKo5HqxlV0CEMX1nR780KaK2L7nVcgVqBX4Xs9fxa81gaGXkVUMYi0I/iYOigItHKJ
         nqQ6xxIHmCIyjnBBnYyG7L1+bMvOcLbS+EI07T5dTG2gD3RVCNuCCM6ltl97XppU091Z
         +zXTZxlbpqgfT+x/nzHL5ffMOZX3vkZiuS8xdGT4/pvg26mEhwjdFvabhAt6Zddjgjrl
         XYNxRIFV11i3AHusz+cNwlX5J0YStQ2DC8HqX6+wBGz2BB9oD+Nd+TwsmVQtxpwzD6je
         X3Hg==
X-Gm-Message-State: AOJu0YxDrJ8wYAnY+BDCWL6Z5brazeW7sCKDNAEHDkr+EhEzlqWLg280
	IlHN++tQYx0+HaAlQEojKCtg9bPHNrJKm3qB995C6zE8YqtR6HeHMWCIAAudwdawy5E=
X-Gm-Gg: AfdE7cnYP6IsmP9aaf1zWf99WKYTZ1TOmzKpWWmOola3eJWGpPz9BIWJsgCv2fKeq0Y
	laDsRIRhZdQ/4+JrSZkvrxEVqK/qzNatFNs/1tX/twloESC4FEv9yulTGS5co9m/j5VMnyhi4fb
	hoghypIMY7WC/583JY+V9pFavnHgt0cT96YTMSHRWO68L2NXdpFH2UpXclDpym1gyQ7Mm1X/9Un
	UvuwmzEt102MaFHofAMyKI1hdIyCIcliGxxyOgDW0/ZTKxTtyPKNmzKxwCbL3mwH1ogRDDd/bir
	uIZ30yJL1tpERiRrxul78jfc189ror4CYtHAFtgtQWCvTQIvb0pgApLAer0SdKi/0MK5dFduF0y
	inF8S/XHjwEyg9L9OGZjxQREupgxlLBM6UvMy4L10CA1zZqqiOUmUN5WRc+wzf2+liN2VxB7nZx
	z5uDWZ4HPhCHRwR3a0ADQ4SZjkSSIP4yqjgZ3vRegdja5zwp/z2EirTionlNzMFr6gF8lzB3CGo
	Kpz9v8aY591ERfDR+k=
X-Received: by 2002:a05:600c:6088:b0:493:d100:b487 with SMTP id 5b1f17b1804b1-493e6828725mr54656495e9.0.1783583067956;
        Thu, 09 Jul 2026 00:44:27 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v7 5/6] libs/guest: allocate various migration arrays just once
Date: Thu,  9 Jul 2026 08:43:56 +0100
Message-ID: <20260709074358.256084-6-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709074358.256084-1-frediano.ziglio@citrix.com>
References: <20260709074358.256084-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1783583068-1771B2B8-92FE7BDE/0/0
X-purgate-type: clean
X-purgate-size: 3812
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2734972DE6C

From: Edwin Török <edwin.torok@citrix.com>

Allocate these array just once at the start of migration,
using the maximum batch size, and free them at the end.

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
Changes since v2:
- change prefix in subject.

Changes since v3:
- fix comment style

Changes since v4:
- change order of fields in structure.

Changes since v6:
- split preparation commit.
---
 tools/libs/guest/xg_sr_common.h |  6 ++++++
 tools/libs/guest/xg_sr_save.c   | 33 ++++++++++++---------------------
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 7574c9f5b6..c07c6db59e 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -246,6 +246,12 @@ struct xc_sr_context
             struct xc_sr_context_save_buffers
             {
                 xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
+                xen_pfn_t mfns[MAX_BATCH_SIZE];
+                xen_pfn_t types[MAX_BATCH_SIZE];
+                void *local_pages[MAX_BATCH_SIZE];
+                struct iovec iov[MAX_BATCH_SIZE + 2]; /* Headers + data. */
+                uint64_t rec_pfns[MAX_BATCH_SIZE];
+                int errors[MAX_BATCH_SIZE];
             } *buffers;
         } save;
 
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 8956f4260d..a49df00971 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -117,24 +117,18 @@ static int write_batch(struct xc_sr_context *ctx)
     batch_pfns = ctx->save.buffers->batch_pfns;
 
     /* Mfns of the batch pfns. */
-    mfns = malloc(nr_pfns * sizeof(*mfns));
+    mfns = ctx->save.buffers->mfns;
     /* Types of the batch pfns. */
-    types = malloc(nr_pfns * sizeof(*types));
+    types = ctx->save.buffers->types;
     /* Errors from attempting to map the gfns. */
-    errors = malloc(nr_pfns * sizeof(*errors));
+    errors = ctx->save.buffers->errors;
     /* Pointers to locally allocated pages.  Need freeing. */
-    local_pages = calloc(nr_pfns, sizeof(*local_pages));
+    local_pages = ctx->save.buffers->local_pages;
+    memset(local_pages, 0, sizeof(*local_pages) * nr_pfns);
     /* iovec[] for writev(). */
-    iov = malloc((nr_pfns + 2) * sizeof(*iov));
+    iov = ctx->save.buffers->iov;
     /* page_data record PFNs list */
-    rec_pfns = malloc(nr_pfns * sizeof(*rec_pfns));
-
-    if ( !mfns || !types || !errors || !local_pages || !iov || !rec_pfns )
-    {
-        ERROR("Unable to allocate arrays for a batch of %u pages",
-              nr_pfns);
-        goto err;
-    }
+    rec_pfns = ctx->save.buffers->rec_pfns;
 
     iov[0].iov_base = &hdrs;
     iov[0].iov_len = sizeof(hdrs);
@@ -253,13 +247,10 @@ static int write_batch(struct xc_sr_context *ctx)
     if ( guest_mapping )
         xenforeignmemory_unmap(xch->fmem, guest_mapping, nr_pages_mapped);
     for ( i = 0; local_pages && i < nr_pfns; ++i )
+    {
         free(local_pages[i]);
-    free(rec_pfns);
-    free(iov);
-    free(local_pages);
-    free(errors);
-    free(types);
-    free(mfns);
+        local_pages[i] = NULL;
+    }
 
     return rc;
 }
@@ -793,8 +784,8 @@ static int setup(struct xc_sr_context *ctx)
 
     if ( !ctx->save.buffers || !dirty_bitmap || !ctx->save.deferred_pages )
     {
-        ERROR("Unable to allocate memory for dirty bitmaps, batch pfns and"
-              " deferred pages");
+        ERROR("Unable to allocate memory for dirty bitmaps, deferred pages"
+              " and various batch buffers");
         rc = -1;
         errno = ENOMEM;
         goto err;
-- 
2.43.0


