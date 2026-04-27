Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMfbLHVA72lN/QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 12:54:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B86247151E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 12:54:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294779.1571495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHJbL-00062d-2N; Mon, 27 Apr 2026 10:54:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294779.1571495; Mon, 27 Apr 2026 10:54:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHJbK-0005zD-Rv; Mon, 27 Apr 2026 10:54:06 +0000
Received: by outflank-mailman (input) for mailman id 1294779;
 Mon, 27 Apr 2026 10:54:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wHJbJ-0005wq-QX
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 10:54:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHJbJ-00C4TO-7F
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 12:54:05 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 69ef404b-bab6-0a2a0a5309dd-0a2a450c96ba-12
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 12:54:05 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 69ef404d-62f1-0a2a450c0019-d1558030a430-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 12:54:05 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4891f625344so90080665e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 03:54:05 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a5c4b9e8dsm116133355e9.7.2026.04.27.03.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2026 03:54:03 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1777287244; x=1777892044; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvJdGnq8cUcIRKsRqa+Ot2JNRA4/ZQKz59vK5GFR3u4=;
        b=fEyvEUkJ3Ov/tyWaEjHQQQ/u9TSJ/kZ1W6ToR1i4kCXT9rWkgeenmDOVik2dxjE3js
         rcJ0+latap+jmHQLajsbFcxQFCaHHumVBgmYVO2b0q0mXHMjmtvFwyfdv1vLLmXtbXJv
         IbLvaE1Fl82/fygodiqZMjZ551oaeQlxrbc3QLv1JNaoOdt16vUhfacJzv3OUkbeDLBb
         pZwOiWKrpAHnygPqKsesTMH4h6pgVxPXaCna1N+yYOOd4WOW8HsKQvPYqck5wGAncQTl
         xmwlHrgSEMoLMbnS1NBZbYCRPe7mperAbQzSGLrgyGz6ZSAQrm6n4LS1xyKLHb9UeCwJ
         OfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777287244; x=1777892044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bvJdGnq8cUcIRKsRqa+Ot2JNRA4/ZQKz59vK5GFR3u4=;
        b=DdavYh2khl4qwl6YB5aiNeFNQRxOhlB0l1HQw2sW9zkQl7EFeba9A2gDmCDTKxYhPn
         d3OqR2IQ6gAxOKxzKhW10SLnZcPMpaMsudM8zWQExuFkDbyiQXT2kFBgUwWjzgx5OEw6
         pO3Hjk1wxxqmqqf+OCcRbhYcakt96hMpnzmk8DN92Wf7WUu14XCup15/2ikHpR9g/Xio
         hgmB7zcWnEgg1s6OGFfXaERMBJIKSdQ4ZSjmgiqqKNpSV++o4vhfwHaSKdA7wG55QYcc
         5cUyWTnJGnIDCyuOjvMI9jc6Yi38u9kTyU19WCKyC1rXPKmieRANqdLVzufcpihVVcCh
         Qv3g==
X-Gm-Message-State: AOJu0Yy3m8tTwTR06DyuzSEurUe9+SX+E26zkSQmAqGjR0FVI9lfDpw8
	P4XXMhSoxYoF2/rjZ3cl1FZqejPWImn6yE/k1qxjfqvBKWEPt4m7NpzjknWYZ+3T
X-Gm-Gg: AeBDietfPO5XVrmUqeatZxynPiTGhJRkXHgeLTvMnyTR4fc6cpLai+xTspRZDQDWSCh
	FX2IPcY3g2ku3U1VGjGoBE2v2mQ+UD9Xfrs4fAgjB8Rxyba00plA0P+ioK+I0CZHCZwC0PZGArN
	ZFLcmI6M8tHLBwNQIZbFDHywmj1nq92wTS+7yYnzmZ9Abbp3RgmrzzyTz8W4moHUHpiBMysTHzP
	S2TaTfT4jUAfO/nVWcLaQwC37KAHxp48OM3CYlHVB5IAg2Vsxif6NHHMjKF0t6sxdfOLgTZ2cdy
	m1ixylK62C+Wb/khCZ6jB0V170eR3f6SGrUSkD57EobYwZ0ryDkH6dXyba4SM8KO/VR83NvcIor
	ib6N33Iysx4tVdJd0hmcUQTpBNESyAH+LsHDYpMDxuRLMt4I0LNBpNCM/N1Mkzwq7mQ7G6Va/qJ
	zlvG9sZrjLGogKjttQA3jm/UUUVYx7m8h7ts3MJu9Qn5QVsahKaVBAAtJawd0r3qJZw4PX7B1NS
	YZT
X-Received: by 2002:a05:600c:870e:b0:488:aa33:dc8f with SMTP id 5b1f17b1804b1-488fb84ffb8mr571290555e9.0.1777287244170;
        Mon, 27 Apr 2026 03:54:04 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 3/7] xenguest: Allows writev_exact to change iov array
Date: Mon, 27 Apr 2026 11:53:28 +0100
Message-ID: <20260427105338.99792-4-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427105338.99792-1-frediano.ziglio@cloud.com>
References: <20260427105338.99792-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1777287245-6F57FCF5-7DF79E61/0/0
X-purgate-type: clean
X-purgate-size: 3182
X-Rspamd-Queue-Id: 6B86247151E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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

Avoid having to allocate and copy the array if a partial write
happens.
The implementation in tools/libs/store/xs.c already use this
signature and method.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 tools/libs/ctrl/xc_private.c | 26 +++++---------------------
 tools/libs/ctrl/xc_private.h |  2 +-
 2 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/tools/libs/ctrl/xc_private.c b/tools/libs/ctrl/xc_private.c
index bb0f81d6f389..946fc307aabd 100644
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
index b5892ae8dc1e..3af996e9002e 100644
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
2.53.0


