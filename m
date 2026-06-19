Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id toARDrI+NWqGpwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:05:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4DD6A5F2F
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:05:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=FLwa72QN;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1342205.1602479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuR-0002HM-1l; Fri, 19 Jun 2026 13:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342205.1602479; Fri, 19 Jun 2026 13:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuQ-0002F9-S5; Fri, 19 Jun 2026 13:05:22 +0000
Received: by outflank-mailman (input) for mailman id 1342205;
 Fri, 19 Jun 2026 13:05:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1waYuP-0001ty-9a
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 13:05:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waYuO-002qlM-Mf
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 15:05:20 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e8f-bab6-0a2a0a5309dd-0a2a450cd1de-6
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:20 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e90-94a4-0a2a450c0019-d155dd34bdf9-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:20 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-45fe59255beso1163723f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 06:05:20 -0700 (PDT)
Received: from localhost.localdomain (8.17.6.51.dyn.plus.net. [51.6.17.8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4650bc428d9sm7960088f8f.27.2026.06.19.06.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 06:05:19 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781874320; x=1782479120; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXzH0W3KjNNVT2/fbradMnP12nKpXvhtoDr3wKrOgVQ=;
        b=FLwa72QNj+LfYEW6VuuKVRRfvYZdlApd0XVX2DE8jY1f7FYLNdHxyVe5vYtMUnEYWp
         pap3RVxPJIJOO+DiPOHuligm8bX8EUG9jgjpBRr0hKUlcvJm5ohXb5w6M0+jiUMaI1Ot
         4uvLh6G0KteIPTeacnbSvz24mYRwu3eCW0vmTEvkNuNgUwbB5crTabPuZuF84P38zVj6
         XvH1/pr5D1mTj4hORCqkXfWJ2AEWslq218kW7v6LsDWOcdZJcH2CqExbPshPyAPeLy7r
         PZdVw3/08+8DEqrjaClbnFWf3KRC6bgxzmp3plPkxUHenXQgl5vMbiEtwkqOwLwG4jEW
         N5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874320; x=1782479120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yXzH0W3KjNNVT2/fbradMnP12nKpXvhtoDr3wKrOgVQ=;
        b=W2zyC7ahZiEHwm+qhDVDBrKEtcx+rTYI5Uhyju7p2GZcEmq4CXALC+DzHc8KlM3dbQ
         4bd/J4ZiXFnaqfxzLwGcJT0Px5d7gAescXRdS1D4K7zvtRMU0HZOBW8zmin6eWshSKhH
         GHKXqFrwO2TFG9wuZc3oTSd8HXUwj6Pih5Vgzh+c0Pjccs7tYNkrd7565j8jocvUP6hB
         p8fsaCBFyRJ6tkc1rhPfnngMrn57lcupXOvwgJ1/fe8sIgAzHYOoRAIcUg+8JV6bElu9
         sUNnchv60RjOPzDVfkp4AqmmFxUzoKdhaUKCFM1uOHyr17JSBsGRItEmDBOVm6hoj3BH
         JHlw==
X-Gm-Message-State: AOJu0YzMKEEJDIL/SnsSxVALSsVs3eCGmxdMWiuOWrHayJ3ZbrAb7udW
	Wj/H5y+VHNJI6yzcZPd+wg+Xq57hbsk0Yf67eEuU8YtnwXN9Pqy5qlxbTjMGKp0r10c=
X-Gm-Gg: AfdE7ckV3IshFRbZnSx8Umz+xS8Nw/8hHr7tH3DPyiYMdBB/eaiftfuLCshj36yIgk4
	DMats7+fkAQkytvNAFhRxMRyoT/xGTs57V7rH+/IszO3CWvcBPHAswBD/ok4nTKAEcN0RTrq14w
	2clR0z9wOld19vWqTqwwajSAtzFcDLenvixg7tAqSW6AKPNUlTJRz1kaRAI3lkzVHow3cEjiOi+
	bRZOjqiBMKqYk5eR9Kf7S62fq9lVkOCCU8GZTnlPjiYtNGv6jw0gujenyJY7SPvt7OMcueMfk/2
	Wu4iWTYBcekb+6nPjEmng1EK0R5a9oMsAm5DQM2cZOH29Oh1KPftSMR+FXV6FluF2oXCGyVNTe6
	7Q236Qa2avUYj75QAveLqY1ZnaOU/XP7qOTJXsY0x9FbxaimHaGc/mXhEju/gl8PEl1NSUD8sIy
	nuLAvIQqL+N/Y5xkOy2D6HDUlfQGtl8zqTyJun6ZepZfgyC6e5MUqWPmUbe4mkSV2JLisELUHjX
	nhPM+R9
X-Received: by 2002:a5d:5f96:0:b0:462:6aa1:4393 with SMTP id ffacd0b85a97d-4656d643c3fmr3720824f8f.4.1781874320011;
        Fri, 19 Jun 2026 06:05:20 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v6 08/16] libs/guest: fill directly iov structure
Date: Fri, 19 Jun 2026 14:04:53 +0100
Message-ID: <20260619130501.272832-9-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619130501.272832-1-frediano.ziglio@citrix.com>
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1781874320-DA7E9ABF-3082923D/0/0
X-purgate-type: clean
X-purgate-size: 4544
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email];
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
X-Rspamd-Queue-Id: DB4DD6A5F2F

Instead of storing page pointers into an array and lately adding to
iov vector add the pages directly to iov to avoid "guest_data"
array.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 tools/libs/guest/xg_sr_common.h |  1 -
 tools/libs/guest/xg_sr_save.c   | 64 ++++++++++++---------------------
 2 files changed, 23 insertions(+), 42 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 95b0564e5c..b2c441b644 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -214,7 +214,6 @@ struct xc_sr_context_save_buffers
     xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
     xen_pfn_t mfns[MAX_BATCH_SIZE];
     xen_pfn_t types[MAX_BATCH_SIZE];
-    void *guest_data[MAX_BATCH_SIZE];
     void *local_pages[MAX_BATCH_SIZE];
     struct iovec iov[MAX_BATCH_SIZE + 2]; /* Headers + data. */
     uint64_t rec_pfns[MAX_BATCH_SIZE];
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 4988d8040b..8a22267fdf 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -88,7 +88,6 @@ static int write_batch(struct xc_sr_context *ctx)
     xc_interface *xch = ctx->xch;
     xen_pfn_t *mfns, *types;
     void *guest_mapping = NULL;
-    void **guest_data;
     void **local_pages;
     int *errors, rc = -1;
     unsigned int i, p, nr_pages = 0, nr_pages_mapped = 0;
@@ -113,9 +112,6 @@ static int write_batch(struct xc_sr_context *ctx)
     types = ctx->save.buffers->types;
     /* Errors from attempting to map the gfns. */
     errors = ctx->save.buffers->errors;
-    /* Pointers to page data to send.  Mapped gfns or local allocations. */
-    guest_data = ctx->save.buffers->guest_data;
-    memset(guest_data, 0, sizeof(*guest_data) * nr_pfns);
     /* Pointers to locally allocated pages.  Need freeing. */
     local_pages = ctx->save.buffers->local_pages;
     memset(local_pages, 0, sizeof(*local_pages) * nr_pfns);
@@ -158,6 +154,19 @@ static int write_batch(struct xc_sr_context *ctx)
         mfns[nr_pages++] = mfns[i];
     }
 
+    hdrs.rec.length = sizeof(hdrs.page_data);
+    hdrs.rec.length += nr_pfns * sizeof(*rec_pfns);
+
+    hdrs.page_data.count = nr_pfns;
+
+    iov[0].iov_base = &hdrs;
+    iov[0].iov_len = sizeof(hdrs);
+
+    iov[1].iov_base = rec_pfns;
+    iov[1].iov_len = nr_pfns * sizeof(*rec_pfns);
+
+    iovcnt = 2;
+
     if ( nr_pages > 0 )
     {
         guest_mapping = xenforeignmemory_map(
@@ -199,61 +208,34 @@ static int write_batch(struct xc_sr_context *ctx)
                 else
                     goto err;
             }
+            else if ( iov[iovcnt - 1].iov_base + iov[iovcnt - 1].iov_len !=
+                      page )
+            {
+                iov[iovcnt].iov_base = page;
+                iov[iovcnt].iov_len = PAGE_SIZE;
+                iovcnt++;
+            }
             else
-                guest_data[i] = page;
+            {
+                iov[iovcnt - 1].iov_len += PAGE_SIZE;
+            }
 
             rc = -1;
             ++p;
         }
     }
 
-    hdrs.rec.length = sizeof(hdrs.page_data);
-    hdrs.rec.length += nr_pfns * sizeof(*rec_pfns);
     hdrs.rec.length += nr_pages * PAGE_SIZE;
 
-    hdrs.page_data.count = nr_pfns;
-
     for ( i = 0; i < nr_pfns; ++i )
         rec_pfns[i] = ((uint64_t)(types[i]) << 32) | ctx->save.batch_pfns[i];
 
-    iov[0].iov_base = &hdrs;
-    iov[0].iov_len = sizeof(hdrs);
-
-    iov[1].iov_base = rec_pfns;
-    iov[1].iov_len = nr_pfns * sizeof(*rec_pfns);
-
-    iovcnt = 2;
-
-    if ( nr_pages )
-    {
-        for ( i = 0; i < nr_pfns; ++i )
-        {
-            if ( !guest_data[i] )
-                continue;
-
-            if ( iov[iovcnt - 1].iov_base + iov[iovcnt - 1].iov_len !=
-                 guest_data[i] )
-            {
-                iov[iovcnt].iov_base = guest_data[i];
-                iov[iovcnt].iov_len = PAGE_SIZE;
-                iovcnt++;
-            }
-            else
-            {
-                iov[iovcnt - 1].iov_len += PAGE_SIZE;
-            }
-            --nr_pages;
-        }
-    }
-
     if ( writev_exact(ctx->fd, iov, iovcnt) )
     {
         PERROR("Failed to write page data to stream");
         goto err;
     }
 
-    /* Sanity check we have sent all the pages we expected to. */
-    assert(nr_pages == 0);
     rc = ctx->save.nr_batch_pfns = 0;
 
  err:
-- 
2.43.0


