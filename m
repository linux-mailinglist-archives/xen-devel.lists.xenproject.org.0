Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y4L5K7I+NWqIpwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:05:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 612806A5F37
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:05:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BSpDRh9u;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1342206.1602488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuT-0002cI-IV; Fri, 19 Jun 2026 13:05:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342206.1602488; Fri, 19 Jun 2026 13:05:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuT-0002aU-7b; Fri, 19 Jun 2026 13:05:25 +0000
Received: by outflank-mailman (input) for mailman id 1342206;
 Fri, 19 Jun 2026 13:05:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1waYuR-0002GD-4O
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 13:05:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waYuQ-002qp2-FT
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 15:05:22 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e8c-5cb7-0a2a0a5109dd-0a2a4501e924-32
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:22 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e92-e031-0a2a45010019-d155802bb4ce-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:22 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4908b92904fso26773065e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 06:05:22 -0700 (PDT)
Received: from localhost.localdomain (8.17.6.51.dyn.plus.net. [51.6.17.8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4650bc428d9sm7960088f8f.27.2026.06.19.06.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 06:05:21 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781874322; x=1782479122; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rq+qhmTPgKBhNpU+5cysMmMVcR/5yZiixTBKuWIy3R4=;
        b=BSpDRh9uqp4Oz4Q1KNTRN3xMV0HZxqvCgMpaYpwutUmO52n/WYVqzBqXOTiINbIr/V
         ve8VJwXvnXJHFypZszDtPo/psyHY9i/In43TBFyAsBphTrs93ez9ZPDkqbupFv7QuA/X
         7EgHASp/yvZ5qn6XhY5DTG/QynExHn67ASMt5LYUPRSG2F8nhQn5YuGoh2OQBGS43rXl
         U+FazrtkrOF34jD8vxCi2Gkf8cGISYYbO3dkkZPO2XSPx81YfipIQsBS9pOR5i3q9zSn
         Ya7kQunYGYKLploGTUVZh1tCZR0iDZuXNShVYK17fLN5EjunDP1NvJXrOgI8t8tiWKcR
         Pvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874322; x=1782479122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rq+qhmTPgKBhNpU+5cysMmMVcR/5yZiixTBKuWIy3R4=;
        b=W/++0ZtdzLDddF1PR9DZQXaY1Zi7bY5V1Om/nc8Hrkud88oHnrg0MP2j9CAx3oDARY
         aIyesLRaPPaekrbP5izIuUTR2VzmzvLVSAi9DsgFuPd0Vcvu2psJaCd4eVB7ktdRFu+o
         +54tdpi4cVbyhjhM0XOhOZhQrlN/HmBWuHZQ+BxFsend6Ir0pN5nqyKb01KkVjTGAXEC
         JjXQx7Tnry1zyinyRwYgDqJYz5iIt2Z6LGX5kYszOImYAVB7C8xXRjtIEK4UUPAEq2JP
         wsJ/a1xFyf/bbUItGjRqdz1gCSDDau6MOUgPoTnJ7Rs1EtUnjjzSr2M6gOjFjXZHqNJa
         qr/A==
X-Gm-Message-State: AOJu0YzVBDKmH7zzSwo7hnaZUu5r9c1mWiiCz6YsScGa/tmPDt/4jS5f
	kGjKBOuT3PrWJSH6VNqmfsD+5+WIrc7maA8yhyw/5sUWG1oEWKG3rD9V0dYJJBcIP1g=
X-Gm-Gg: AfdE7clIeOh4C17TEthyVoii78rGe8P5nSTV24bezkacmOuq/fcaA8r4xpWRw94AJAL
	e30m72Xptg/3m195YNbHG6Z7CfnIH9AhhPVNZ0MTgKfuS+iajlj3pqFnMrc/q0yxe6kDAWOcBol
	5AgbhhEci7RjZX7h5NPTc2hH8Q4Zqt4MGMOndgwlF3kJ37fNmQWQZSpM8lk/WxEZlZOpF0FbDJJ
	ncaKyqAtT11T/cJKGTHJAkTe/QC9xlsS55dBWrqRboK8zw9Ncl9M/Etv4/vxf7Ctq4LP+jCHg82
	Fs3MdqI5GYODSVrGSQDpHcCSYMmVZJy29odrQbnQMLFJPejVVoed9QNJTO3z0EmwvXooh06pBHi
	i7GDfCGbyJazjanqw66i7MtCVybN6l1mDriCM7+oinDa0S4XIlbeSkzqOf3akBXY6tkeJhlojQ3
	UZlccbZb8FmWcBWXR+dIfM5mCQ2pAeYNxDjSrrlL2icAMOgj4cYse1iwBHHwH6zAB2bW/AQvPNd
	8TIkEbl
X-Received: by 2002:a05:600c:810c:b0:490:d3ef:fa4a with SMTP id 5b1f17b1804b1-4924233f9fcmr37363585e9.14.1781874321616;
        Fri, 19 Jun 2026 06:05:21 -0700 (PDT)
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
Subject: [PATCH v6 09/16] libs/ctrl: Allows writev_exact to change iov array
Date: Fri, 19 Jun 2026 14:04:54 +0100
Message-ID: <20260619130501.272832-10-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619130501.272832-1-frediano.ziglio@citrix.com>
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1781874322-711F3E30-ECB58022/0/0
X-purgate-type: clean
X-purgate-size: 3172
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
X-Rspamd-Queue-Id: 612806A5F37

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


