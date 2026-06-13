Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Oe04CD/QLWrpkQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 23:48:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0C867FD04
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 23:48:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=NTvVG6dN;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1337560.1598903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYWDE-0003FZ-IH; Sat, 13 Jun 2026 21:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337560.1598903; Sat, 13 Jun 2026 21:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYWDE-0003Aw-CS; Sat, 13 Jun 2026 21:48:20 +0000
Received: by outflank-mailman (input) for mailman id 1337560;
 Sat, 13 Jun 2026 21:48:18 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wYWDC-0002jU-4a
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 21:48:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYWDB-00DVVl-Hj
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 23:48:17 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2dcf18-2eae-0a2a0a5409dd-0a2a450bc4b2-32
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 23:48:17 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2dd021-212f-0a2a450b0019-d1558030c84f-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 23:48:17 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-490a76757e5so14953915e9.2
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 14:48:17 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492202edf89sm113877065e9.1.2026.06.13.14.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2026 14:48:16 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781387297; x=1781992097; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MhL+IoB2npTTdx+dYewd7GvfekT0Xac13RwRFw6zgo=;
        b=NTvVG6dNhC3mEpRfBD2njqws/hYIb+dx6lb09jaYgR9Xog+3Gb+aiXxRjnqz1NcI9I
         5sub9RwrS36/DeXf3MIAVBQzOhx/ltjqsHMuqvOKNKRe9WuTN4/iRMY6djAhtL4hvCr/
         tfoQlKDYbsZCYOD2VTW5h0j6YL/HCXINYQmYuDbX1f0I5CBmq+3/78f6/GRnvgHiT0Sn
         2pZaG1yk2VU6ns7S2DDYo2Qru7fUL5cXwD3xs4Gv++YgU2vUejR0Xa74zmIHDKeeTfBO
         g+kujPjSY2wsObeL3mGAvy4sUjWOucwXHr4C652njY7kEVvONCtMxg+DhQDCVeTl+95I
         fZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781387297; x=1781992097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9MhL+IoB2npTTdx+dYewd7GvfekT0Xac13RwRFw6zgo=;
        b=NrWlriWDq7P8X7RyhayyksPXYhvMPsBxmrRpFmuT9PhghsNjkqBOjXWXOmjxjzmd2r
         4LIyKHtEIgQ3y8VmfGYcSM597v8+Npzv8gvAJXEbieiCLaVf7H+XF8Iq1i2fBzaihaHn
         oB+syRMVusRG4KpyjnJX24L6Ub0x8q2I/4qMnPqAfgdFwm9UYaqJdCAT090qjZwsqJKN
         vyBksQmo6+sms8n1GAcbs1ENYtvNEGlY3HRm8eeaOhvGpeV8PDSmUVtvLtvk5AhPVo/j
         K9jON2994n428CKVJ3ykIT/hJ1OwdcUlQIgi+H5IJdpBsFCityUGqoyKBfBI+TIuGRwN
         cruA==
X-Gm-Message-State: AOJu0Yyl9ugs5D5L4rwCw+OqRAfZocNFOtiCnXPk4Ilcg84DpfrBAuo8
	H2QCuXfC7eUr4C8jS8au3tIWlGEOgD3gq+WhO8JqwKoQBB7/fWZnTiNjZjmTa1n4xP4=
X-Gm-Gg: Acq92OF+YuwiyllxGNHF1ULVEiTS2VNQ+LBpTQrIOhiiccULuvmRC+Pi7FBs1Jzwbzd
	BHc64kfasStyD8ME0G3GxexhKTa6sky1I14VA3CBTORXO5JI4D5Lh2ucbEMw/5U6h3XR1E4HlFH
	FZvLg2Kohq6dA1cm9g1650smWU1zMja5o1wbk2a4a3yOjwawknc9KMi9OKRKonjUTszI5WS59s6
	j05D34ISAF5ihXrbgMiTjgYzo5AQ9Eaz+S9zwR3ZC5eTnArjFaOOsRJRCkiqSiqGEpfmIMtRSKr
	sYlszc79MHDp4DjuZElsa98xVnX3EU4T6JKb027s8H9R8t1eZ9jzKCPCUtHKG1Y1ohYIHPCUxw7
	stiDlPBNNouB2UxJPig8o/IGE2rx9+865wXa4tn7O5kViO41+J9YZN/8BG0dZ1jDksrWIDmU6wY
	Za4NLfODq11Tnc1h6wBEndy6r1gO+iLvdzGbzBpP8pfFpwp64PyBNhWvJ28MQOVO1muEHREexBE
	0T71jMW0Q2e0YEOW0KFatYRUQ==
X-Received: by 2002:a05:600c:4e4e:b0:490:e196:e8df with SMTP id 5b1f17b1804b1-492200bb228mr56160055e9.23.1781387296918;
        Sat, 13 Jun 2026 14:48:16 -0700 (PDT)
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
Subject: [PATCH v5 09/16] libs/ctrl: Allows writev_exact to change iov array
Date: Sat, 13 Jun 2026 22:47:42 +0100
Message-ID: <20260613214749.20620-10-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613214749.20620-1-frediano.ziglio@cloud.com>
References: <20260613214749.20620-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1781387297-13F7EF3B-2B28A7F9/0/0
X-purgate-type: clean
X-purgate-size: 3226
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
X-Rspamd-Queue-Id: BB0C867FD04

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Avoid having to allocate and copy the array if a partial write
happens.
The implementation in tools/libs/store/xs.c already use this
signature and method.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
--
Changes since v2:
- change prefix in subject.
---
 tools/libs/ctrl/xc_private.c | 26 +++++---------------------
 tools/libs/ctrl/xc_private.h |  2 +-
 2 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/tools/libs/ctrl/xc_private.c b/tools/libs/ctrl/xc_private.c
index bb0f81d6f3..946fc307aa 100644
--- a/tools/libs/ctrl/xc_private.c
+++ b/tools/libs/ctrl/xc_private.c
@@ -635,7 +635,7 @@ int write_exact(int fd, const void *data, size_t size)
 /*
  * MiniOS's libc doesn't know about writev(). Implement it as multiple write()s.
  */
-int writev_exact(int fd, const struct iovec *iov, int iovcnt)
+int writev_exact(int fd, struct iovec *iov, int iovcnt)
 {
     int rc, i;
 
@@ -649,9 +649,8 @@ int writev_exact(int fd, const struct iovec *iov, int iovcnt)
     return 0;
 }
 #else
-int writev_exact(int fd, const struct iovec *iov, int iovcnt)
+int writev_exact(int fd, struct iovec *iov, int iovcnt)
 {
-    struct iovec *local_iov = NULL;
     int rc = 0, iov_idx = 0, saved_errno = 0;
     ssize_t len;
 
@@ -686,23 +685,9 @@ int writev_exact(int fd, const struct iovec *iov, int iovcnt)
                 len -= iov[iov_idx++].iov_len;
             else
             {
-                /* Partial write of iov[iov_idx]. Copy iov so we can adjust
-                 * element iov_idx and resubmit the rest. */
-                if ( !local_iov )
-                {
-                    local_iov = malloc(iovcnt * sizeof(*iov));
-                    if ( !local_iov )
-                    {
-                        saved_errno = ENOMEM;
-                        rc = -1;
-                        goto out;
-                    }
-
-                    iov = memcpy(local_iov, iov, iovcnt * sizeof(*iov));
-                }
-
-                local_iov[iov_idx].iov_base += len;
-                local_iov[iov_idx].iov_len  -= len;
+                /* Partial write of iov[iov_idx]. */
+                iov[iov_idx].iov_base += len;
+                iov[iov_idx].iov_len  -= len;
                 break;
             }
         }
@@ -711,7 +696,6 @@ int writev_exact(int fd, const struct iovec *iov, int iovcnt)
     saved_errno = 0;
 
  out:
-    free(local_iov);
     errno = saved_errno;
     return rc;
 }
diff --git a/tools/libs/ctrl/xc_private.h b/tools/libs/ctrl/xc_private.h
index b5892ae8dc..3af996e900 100644
--- a/tools/libs/ctrl/xc_private.h
+++ b/tools/libs/ctrl/xc_private.h
@@ -383,7 +383,7 @@ int xc_flush_mmu_updates(xc_interface *xch, struct xc_mmu *mmu);
 /* Return 0 on success; -1 on error setting errno. */
 int read_exact(int fd, void *data, size_t size); /* EOF => -1, errno=0 */
 int write_exact(int fd, const void *data, size_t size);
-int writev_exact(int fd, const struct iovec *iov, int iovcnt);
+int writev_exact(int fd, struct iovec *iov, int iovcnt);
 
 int xc_ffs8(uint8_t x);
 int xc_ffs16(uint16_t x);
-- 
2.43.0


