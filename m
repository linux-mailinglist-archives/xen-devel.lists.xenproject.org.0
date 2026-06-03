Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gmznJN4mIGqmxgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45397637DCE
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=R7CadIYO;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1326233.1591730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIk-00075m-1N; Wed, 03 Jun 2026 13:06:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326233.1591730; Wed, 03 Jun 2026 13:06:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIj-0006yP-JJ; Wed, 03 Jun 2026 13:06:29 +0000
Received: by outflank-mailman (input) for mailman id 1326233;
 Wed, 03 Jun 2026 13:06:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wUlIh-0006iZ-VH
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:06:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUlIh-000siy-C1
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:06:27 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026d2-e002-0a2a0a5209dd-0a2a450586e0-6
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:27 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026d3-aaa8-0a2a45050019-d155dd34e827-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:27 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-46013161068so1771657f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 06:06:27 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ec711sm7254825f8f.12.2026.06.03.06.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 06:06:26 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780491987; x=1781096787; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKuxb0CO6/FH9FO7YOyiSG4lQEpi75NZF/ea4dVESjo=;
        b=R7CadIYOXVRN06F/q298zH4BwvFlN3f4EIUJtWn0O50i4Msa5sZwKpx1VAOcAFzAHQ
         uBwKPJ4l0XFWRMZLEgqkx5yJTNFON2PNjEulVKkvIJwEhMsxdkm6jLRf57d9HrTNhXAj
         8cFSLthmZJYYc4Ee9363x2bE8ShIiv5AsS5NUugA7lwjNKerzCot1VlmxXwK7DNocCZa
         VbweOIjBw+xl1bEPc/MZHFKfv4n/aEtBckYsT2eCOd8Pd/7QLTqdT/+4ZykfxZvUfVP4
         2C/p4hfWbSL0ulDtQAAUxR5aZS12F93jV5Y9oGNGD+oQT09W/AlNVg418fhyA98UCQCC
         vWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491987; x=1781096787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KKuxb0CO6/FH9FO7YOyiSG4lQEpi75NZF/ea4dVESjo=;
        b=db3bqgEzawlC3cXepOgHSwcJl/Xvynju6tTfaqdhvUyMbI58waiyv9ZYLN2qzoD9V/
         c5z2zBseVB3H1lj/sErUocUVFvI1OfSZ75rx4Rf5aKrDvxevQs/bzpKz5UHCGQ4ESomn
         F6BPFQXFGemlSFb43nJd/kRUL385mDuVKBXdsjSL7EL79hLfvqJEE+t2G6DrvTJ/rwOY
         ZprqgsBqP5C/9RnL1yGSPZdGAduYGbJhRvIhpL7U6AA9VXSOAHbm/R+Vp/fv8nm87oUW
         Llvqoe572wh3G2m2C6frG6Gi60zHfpQoNf32mPOWwH/mrMINIYNo0aQfwDS6/AnOyjbP
         D/ug==
X-Gm-Message-State: AOJu0YxJnjJGNt/lg5GH1ZzbrbAPYxQuMMsKqF15IzzDBSTOmRu0w+A9
	o1thAZbH6f5JtfAFk8caC5WBYRsZYkwBW1wTwT+BJjpyWxTLZq58TFPB0IlXnoxD
X-Gm-Gg: Acq92OGqwRtrYcjaWEf118twonHy7HvbWNXA1gqBiuYYIwnU2YQ52W8jeF5erk8yZdZ
	uLUKDUQsSJfFYyXls/lmKK3fAKcydtWWSqW+9ZneEOSAw8tRbQC5VZdvVXtHJWwvuuPi9RG4co3
	y9XOJxZZYSOYksFCV9rKbYAx4/vdl0pY2Fu62092Ab5jcyPAPIL3XR6b7Vqvrg47SvN3YnPhalH
	18Be3xGIzVU/7fwwMcM3UdEgM42m7sFjgYQsEbqEpPDkhllJIFkNNZaBSV3V7DMJ/pOAfY1CtRT
	Nq18kIxO/KaRbvEXsprhjIBDBOgzIJjYygkelxB0q9wUPdUpK9hsOa2l6Kman4MbUAgh+hBwQ4b
	JBkcOYgDJOAKX+FFibo9BPytW6DToSh4djOd7zdUnNMfs4O1Y5lYbxq2U1mn854ElX1vGGfmQI6
	cw5qeXeUeC2aEbDB+xTYWxkkE1r1Qyso37MHQFWXO7k01k0bxvy/vFcajrlXwSZHMw2YWHRYxfG
	rSEvIKA49b5xxJb3vb5h8mhw1p8BcJAnAEz
X-Received: by 2002:a05:6000:2905:b0:460:ff2:63e5 with SMTP id ffacd0b85a97d-4602181e60fmr4559736f8f.18.1780491986609;
        Wed, 03 Jun 2026 06:06:26 -0700 (PDT)
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
Subject: [PATCH v4 09/16] libs/ctrl: Allows writev_exact to change iov array
Date: Wed,  3 Jun 2026 14:05:56 +0100
Message-ID: <20260603130603.776452-10-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603130603.776452-1-frediano.ziglio@cloud.com>
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1780491987-E3589443-1145D8E2/0/0
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
X-Rspamd-Queue-Id: 45397637DCE

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
2.54.0


