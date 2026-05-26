Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEMMImNrFWoBVAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 11:44:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD595D3957
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 11:44:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319675.1587200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRoKH-0000sY-QS; Tue, 26 May 2026 09:43:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319675.1587200; Tue, 26 May 2026 09:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRoKH-0000oA-L2; Tue, 26 May 2026 09:43:53 +0000
Received: by outflank-mailman (input) for mailman id 1319675;
 Tue, 26 May 2026 09:43:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wRoKF-0000JN-99
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 09:43:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRoKE-00C7nY-LC
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 11:43:50 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a156b54-e002-0a2a0a5209dd-0a2a450396a4-32
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 11:43:50 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a156b56-672d-0a2a45030019-d155dd36d93b-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 11:43:50 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-43fe62837baso6040774f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 02:43:50 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d70c51sm36522744f8f.36.2026.05.26.02.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 02:43:49 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779788630; x=1780393430; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54F7jVLbDw17JTD+SKyHXt9Aa2Yn2dAnayA0OhhrPec=;
        b=V2KmXBFYoKq/VlpbqIx8zJ+WaLngZzzW75yTPjnrod4EoC/guQLFSp0jjl7JPiyTrg
         Vh4ZCKL346SKRzDv8jTxWNyj03yh2O+1K+hi5lLDU5s5ju89ee4qu6V3XSoNpl/ZoH1y
         81WukOOiCp5MKh+4bZjsW5WIZo3SwjIHaq6cuArioHsKVo4wtYZ6i3fVBgRyqbyNMsCF
         QTzIP6eNvko78ZAsdBUZ+Sbdo03QJHLsCWqgAgGXRo6mMQmls8jTLkoLiaeQBpOJ1FKL
         ETY3Uf+HZZ/hIfjfDLt/wyVT1ykAgpf8GKsDtCRWHFT9OtiqeK8Ra/+O8LnuoUxZcOVv
         QLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779788630; x=1780393430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=54F7jVLbDw17JTD+SKyHXt9Aa2Yn2dAnayA0OhhrPec=;
        b=D7EeYBTQfuvArcRzQ6zRHwSL8yY/44hdsuuXe1wS99Efpg4mKYOampcrCwLcWtHdjB
         amPI0Y31Ypt0tgAV6BwyO6vkKsDMChPPelhIqpZUddKsxyEeBa7YxiReaqnX1OcsKvY9
         KC4MCgoe3npTCHOaxu13FPozgUwUTinlMt8durV0FhkUdMCl4sZFKUUrNhO3wVc3ArkY
         qFtaPXbf8yUslIC9plQ9t6zc2Q8wg/ORzdrgU0GIAfj3/nn/VZKaiGBQ9P9DZhLdewYM
         KWeN68ngTbE3KfYmHzK2T7UbDIK06TXd7fYsSs4KFe690YcMjIicOqq9FAJE+lVzYEJo
         /2Gw==
X-Gm-Message-State: AOJu0YxVHhD/elu53+y0F/XD4Mx2vPZhcA4kPUmMXm9clViVG8iE0JTf
	SQZNdvbVnKB2SjlyHE3CNRpiE3uGfLG9hmvpwNcLgaKo9dyekm4GpgypNCrh2i6v
X-Gm-Gg: Acq92OFqD+aCOLJ+mH+SLmiKELiQHykVyCIRNdXdRUGo8fTUlV5wjCwTSAKupdcvZVC
	nGCM7Ij+s3IBnqjH45rPRBVpI5nHJR9UEOy8DOFu4wLqahqOgVBOHH+RjosePk7DH05ojb1+nLi
	XWNOVmpstRYLHNF3rZmlgFcNxvsbcLuoqSK7Wa8jzviPG7lB2NqWdKesltD177Td+QaXsnScSyG
	EubSTlf3l0IIkPdVoiV4+3aZb+6Tj723D+ePdgx4fbKljuVkyC4cDDiikjL9EuLqIz9EaHGiM4y
	OPud70ThLzqA6v2l9cek6r0JBGBZz5jdgkh5wUDdc4hwk9OZtlcPgn22FlfoErqgLh1e86Mgr0d
	zXBRnYoPLOKs7fWhlEfINvkAU58IPdyuezqQKSbjx+nkZulApktrvTnLxxq4gEriOIwBhGOyLMI
	3psZiZZ3bxS9qxZECcDwaXkUXmjXRZUssckPOsNWz8GS/70u11f/te83Kx0DrJ95SG1D/U2x8Fo
	kPIYhXeMhlrPc/ZdvMl+xZsXoEVU4bz2kfmU8WQq4ZkCzk=
X-Received: by 2002:a05:6000:2508:b0:45e:65a3:badf with SMTP id ffacd0b85a97d-45eb39e1f43mr31281958f8f.21.1779788629960;
        Tue, 26 May 2026 02:43:49 -0700 (PDT)
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
Subject: [PATCH v3 9/9] libs/ctrl: Allows writev_exact to change iov array
Date: Tue, 26 May 2026 10:43:20 +0100
Message-ID: <20260526094324.12286-10-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526094324.12286-1-frediano.ziglio@cloud.com>
References: <20260526094324.12286-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1779788630-41D91938-12F8B3E5/0/0
X-purgate-type: clean
X-purgate-size: 3234
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:email,cloud.com:mid];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0AD595D3957
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
2.54.0


