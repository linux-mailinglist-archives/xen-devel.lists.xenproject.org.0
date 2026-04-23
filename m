Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEnBG1576mmqzwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 22:04:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FC94571E1
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 22:04:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1292628.1570994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wG0Hd-0007vN-Uh; Thu, 23 Apr 2026 20:04:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292628.1570994; Thu, 23 Apr 2026 20:04:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wG0Hd-0007tG-Q0; Thu, 23 Apr 2026 20:04:21 +0000
Received: by outflank-mailman (input) for mailman id 1292628;
 Thu, 23 Apr 2026 20:04:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wG0Hc-0007Ru-0Z
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 20:04:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wG0Hb-005MUL-Dg
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 22:04:19 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 69ea7b25-2eae-0a2a0a5409dd-0a2a45019a8a-26
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 22:04:19 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 69ea7b43-c1f2-0a2a45010019-d155802fbddc-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 22:04:19 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-488b0046078so63848575e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 13:04:19 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e3a341sm60065442f8f.24.2026.04.23.13.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 13:04:18 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776974658; x=1777579458; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oxg5mCtqQQ6xjPu85ADP9KtAzh/otnbEOWyjQXNEH9o=;
        b=qCDKa/yPJQv3ZglBr2bNQqMrs0XBQKqTQMMm4Te4/N4vZJGk7Aho/USAR7JhajlmAv
         7cf4+xGOIdjDxJt9JaT+EDMpZekmKOVkL84gtBSiJqXrAuIhJp21Zyh2w9vD1ATyKtJ/
         2WP0u1MsH6YpzO/p550biFcojXFtMt8WZJh4zyLV8Cxf3+vawZ3KcO6xxtulZ/TYWi7N
         wePpUfC0zFxEiNr0lbtUjsuzbYaoFvNS62Bqtsfql0TvE1NB0kNcf7kH4EwM4fXYDrJ2
         LO/apOpBSaNpLwsvAxC7h/Mid3yJ3NvuLRVn2PhnvsmTaiZmH4e1PF4we9ePQc6KLRzA
         ho+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776974658; x=1777579458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oxg5mCtqQQ6xjPu85ADP9KtAzh/otnbEOWyjQXNEH9o=;
        b=DFYIZ1+BoB+sAOI+jMDWe5mWXW/rQdeu/pFaACQwz2IWYT1b4jdOClLMdelQ2VyiV0
         LXFbVTCkRlTtTb7IaNbv05A8rxEvRUXbnREzqvhsOKk3dqD8pIAihIsADZhUopfqjw2b
         hGP1OsuITNgI5sVvkIgal37WllH7DdaXYD493hVLvsbWLVhZJ+pPYddFsLRSwjmPmx9J
         nW1uB5/UZWEIph7V1WW3fl/WyJflDNUxP3if4R0M4Wsfsn2hwn/Cqkn951IFtu39YRwJ
         Ao1Iyf2FJ8k/2cBZ0twxXY3cORu6zGjEY/cgkNrI1HUlGTRpVNnMZtnS4rX1z4U1sflN
         bQDA==
X-Gm-Message-State: AOJu0YzwvUrjMRwSt3/qffGtsDqatH1ADzWDNxnhlNM1pBd5/cUC6N+p
	tgfLQkyyqSObdtOryXFicgLXb19FU/KV3NacYTbPyxKbbWCENxcqCGoqN6xz0krZ
X-Gm-Gg: AeBDievcX8muDa1N3CEYNreH5E5nxFE/eQConsiAITcjfq1XFWjB+LM+BYpiwLjxdwN
	U+D3Z4NIW/FdQgwF1z4t6gd7MkqqP7zjlq388cvsgegPTxCRtOmLu+evhg+n+wif0L+Pl9Me0a+
	qopU8Oo7BnA1+9p0BW75OPHZJdPIVi9SQeRi2RwdiDQQm7PxjfU2qmQdeiG2xxTxxUOoNX2Aznp
	2DUHpnLaXkOaUy7/e3TLDcf4dW26eYHyD10VdO+nvkbfa23BztsxqtxTnuwz8oVn0w28tw3o8dw
	Gt6g0q/f+dMrhkhMIhAmnISaL6DRkZNt28TvF76d+LaxxV+wFbxDM9YNvy0M25lWORCfUvJkIMn
	/xwampbVlGc3Ml9jDrIC0nNPkZS3CAPWvStL8pXYUF8kI5uM/uy8Bf+xcgbSUMzyQNRke+jRjzb
	6N72gTeOr8VxZcOHRTfZe66yQE8hhhm4ouHj1go8Nr1SRJF0GHGdngik+6Cu93AicCja25zCUkV
	tkb
X-Received: by 2002:a05:6000:178b:b0:43d:7946:bae5 with SMTP id ffacd0b85a97d-43fe3e144cbmr44457096f8f.42.1776974658500;
        Thu, 23 Apr 2026 13:04:18 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 3/4] xenguest: Allows writev_exact to change iov array
Date: Thu, 23 Apr 2026 21:03:58 +0100
Message-ID: <20260423200406.28178-4-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423200406.28178-1-frediano.ziglio@cloud.com>
References: <20260423200406.28178-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1776974659-B4617FF4-6AF0E027/0/0
X-purgate-type: clean
X-purgate-size: 3174
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloud.com:mid];
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
X-Rspamd-Queue-Id: 20FC94571E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


