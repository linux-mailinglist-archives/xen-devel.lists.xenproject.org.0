Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NLgNKtgmIGqaxgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 989E0637DB2
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IKWctpKY;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1326226.1591677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlId-0005YX-1r; Wed, 03 Jun 2026 13:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326226.1591677; Wed, 03 Jun 2026 13:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIc-0005S9-RJ; Wed, 03 Jun 2026 13:06:22 +0000
Received: by outflank-mailman (input) for mailman id 1326226;
 Wed, 03 Jun 2026 13:06:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wUlIb-0005DG-CG
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:06:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUlIa-00Fz1h-Oz
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:06:20 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026c5-5cb7-0a2a0a5109dd-0a2a4504cb46-20
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:20 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026cc-1dec-0a2a45040019-d155dd31e574-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:20 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-45ee6d32402so3660716f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 06:06:20 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ec711sm7254825f8f.12.2026.06.03.06.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 06:06:19 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780491980; x=1781096780; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqFYUY4LLWBRQq7NSsaodrilUaXJC/aM45b33pOy+8Y=;
        b=IKWctpKYbAKP9veP3t90mlK5BPpK9SdK8WE36hycjpQXKR1dPpUoCn/W04RMznElso
         24Sb7YkKyPrtByWMDPDnLHFGvX58pMLsTgU5qLFcbBuFVtTS2vKmM6YSuyzAqaR3IpYZ
         29ddcPVjFKH52rLCbAPX+Wf+UZFi4zYSY/YA3MysAeP+A/b++baGXdvaWWkixMpf+AyP
         1DOfNI4qpNQ/52FLFD5aoKffmrkgCEurUiCVy2ooOw4NnOyHNJVwuau1gz053Jkwgfm9
         Y2XtQUTPyFbKApBeO3kz8w4M6/21wzUWmu5cHhEo80Iiatv3ia4XqqWhiVHfUeV8rcXt
         teXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491980; x=1781096780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NqFYUY4LLWBRQq7NSsaodrilUaXJC/aM45b33pOy+8Y=;
        b=fan7yccUNFKeonjGulq6vBVp443Ei5iPIv4Bnq1OrAR0WVZUdbLutxmZJKizgSuM6/
         BpR85QhzwsR4z76yVoYOhJw73OPnaxD6Rcunzc9XWNm0DJzZqE7Ypp2Dmwt74NOv6q3q
         PEpfEY14Y1QpLI5d2mHXHEJ6R4oEsla+LdI9KMSRNuwq98VAzT0QqG8LPiZ6sGIzUnzJ
         g/W5k9j0NZoJI7/IZqxXdeq7sbm4nAwQhYmKZ121FxRdXgqACT7mBKnEpeKPaBlAOuTn
         VmG5RkzHrIaDUGIUECHrwBj11kVlJh74Wnkrgv9B9xwZVXLnZhhS7Y6wtlPXnoNk1Fd6
         5dtQ==
X-Gm-Message-State: AOJu0YxkMX/dBGm2yt1b0/EX3yQWR0HYtvknxhhekHqrU6xB7twK2JRX
	pL9I5D0SHB0tW+cR6JuHZHuDWbKHoeBa1cu5Pvx7LrnqxO6mguJRBnbtWtShi69v
X-Gm-Gg: Acq92OGrBd4Op4FipnqWCxmWsSnDf9Mr6EDyS/wvoOgXAAGlAVGTk7aydiMyHKFkV8C
	3Y0a+q6r26Rk9eJtCht9CzgRDH5D8Kczu/MY9rAcUcTo9xQDvPasq1IxKnMuxIguQAVCcoDR98M
	xBrjeYPfjh9hJ7Q8agjbqkxY/Zho7SSLQ9hmAKLH2Et70GIwb3J5mdPdt2pBapXIa5/R/qYUXYS
	4USawKWqlnD7DURKJQcXtjPsJAQD8wyHXZLsj2cVaUTW+apBTWJj1X6L10836Wl62jQg/d+nKub
	7aVCV+29aDS4PC7BGYaf3m3To41W5nsAqPiAseTHm8RSSilETutb6QR7CEBNotyiafzP+Y+9nZ/
	KJE3IATxKzZpgdIAqZFSRNizjQSORhLn9JC7vLnMG0G9cqqB2S7rZPI7NEtwcjFw3txFQIPh9kE
	CIfUrLL7h3z2tSBDF4wGi1KqZhsHXQx2yPvvAI97S60Ll4oFWercjvZgfees0w5c8QbQnVZ+vzh
	gEhCPOsi4S31sXKtABtI9MWnGCz7RkexZnmTJlGF7gnpwI=
X-Received: by 2002:a5d:4a02:0:b0:44a:2cb3:b633 with SMTP id ffacd0b85a97d-46021794f73mr3643466f8f.12.1780491979837;
        Wed, 03 Jun 2026 06:06:19 -0700 (PDT)
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
Subject: [PATCH v4 03/16] libs/guest: Reduce number of I/O vectors in write_batch
Date: Wed,  3 Jun 2026 14:05:50 +0100
Message-ID: <20260603130603.776452-4-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603130603.776452-1-frediano.ziglio@cloud.com>
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1780491980-2B1663FF-29F4062E/0/0
X-purgate-type: clean
X-purgate-size: 1324
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
X-Rspamd-Queue-Id: 989E0637DB2

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Each page was sent using a different iovec item. This potentially exceed
Linux maximum (1024).
Also some implementation (MiniOS) emulate writev with multiple write calls.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
--
Changes since v2:
- change prefix in subject.
---
 tools/libs/guest/xg_sr_save.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 1700d81905..62a39dfecc 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -240,13 +240,20 @@ static int write_batch(struct xc_sr_context *ctx)
     {
         for ( i = 0; i < nr_pfns; ++i )
         {
-            if ( guest_data[i] )
+            if ( !guest_data[i] )
+                continue;
+
+            if ( iov[iovcnt-1].iov_base + iov[iovcnt-1].iov_len != guest_data[i] )
             {
                 iov[iovcnt].iov_base = guest_data[i];
                 iov[iovcnt].iov_len = PAGE_SIZE;
                 iovcnt++;
-                --nr_pages;
             }
+            else
+            {
+                iov[iovcnt-1].iov_len += PAGE_SIZE;
+            }
+            --nr_pages;
         }
     }
 
-- 
2.54.0


