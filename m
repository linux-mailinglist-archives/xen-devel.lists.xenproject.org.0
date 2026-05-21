Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPLAHHZSD2qoJAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 20:44:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC825AB367
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 20:44:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315794.1585490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ8Mk-0003BG-Qt; Thu, 21 May 2026 18:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315794.1585490; Thu, 21 May 2026 18:43:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ8Mk-000368-Lo; Thu, 21 May 2026 18:43:30 +0000
Received: by outflank-mailman (input) for mailman id 1315794;
 Thu, 21 May 2026 18:43:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wQ8Mi-00032y-SU
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 18:43:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ8Mi-00HU6L-8W
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 20:43:28 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0f523f-e002-0a2a0a5209dd-0a2a450add6c-28
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 20:43:28 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0f5250-56b3-0a2a450a0019-d1558033e549-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 20:43:28 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-48e8132c6d0so42393015e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 11:43:28 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.24.36]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49035c6766fsm42558855e9.2.2026.05.21.11.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 11:43:27 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779389008; x=1779993808; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljEMYEkr4A++xDwBUmB/QQXR4E0ZeG++aH7cfc2SFig=;
        b=c9lAF4n8wFvBWvBIYGmXLRJyvESG7eCY69h5hGWKrX+KRfvY5wFM2n845SOHuir3sB
         LvYyRLsLfTKTakKhzGhy2WOUdzKk+YuEY6j4jlnNqXqRcGirpZ0YDUXCL+Jw2DSl+1AE
         guySLor4zdcN8P4n6rVe0G7B1oRYHtMfoxLC1TOelpDSh7YTh4OFSblfZWPkuCKR1oxG
         7TcS2vMlHhSKTX5mTQgcIbAft1nby8lnFk6TFMU/oJ6ol160UbdbAm9hJMMOr7FsMa5s
         fyBQi+VmLbBJwUlJUHfOCC9jR0GZ4h4rmacGv5nBHzr7Yt4J3MS/yWKHY3uOM8pYWw2X
         MUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779389008; x=1779993808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ljEMYEkr4A++xDwBUmB/QQXR4E0ZeG++aH7cfc2SFig=;
        b=I13g1mONgxE2aZCPdhTBFfpDPRADI1NmV41fElRv+aWdaxDf/AW36K+kUTFSvOWVhX
         313eDU+T6z3zORdYypP7q8uxen1ElcXFJvF09y6GhOGIC2lY3aSxCZNlVSEHXYmp81IQ
         DzcwnX8nc1wrDEpAUHgD2HwjpQ1kfNE8OLkfbEE6VJ4rqWS+/IKvBtEmsB+WRpogo3Gq
         F7a8bWGH7aUma2HqooVPhL47MkrQJFlVA1xTFeWqGD4jA0Wrf2mdnN9vX5CKZ0nDuV1s
         ABUO5I99eKJqYvvVaH2uw9+CTPqeVW4ENU06XI/NPNqA1Btb1Tm90NCEupHgh9zaW3Fy
         MCNg==
X-Gm-Message-State: AOJu0Yxrd/7hiFzZmKINIXJ8OW5X7NowrvsDKVtnnjd6a5NsdmlnLRwr
	D762mp0m61EsqloV1gVahLphCgSypnhN4hnl+WKAP0XJ1SrXDU3t9icPcTxW5VNl
X-Gm-Gg: Acq92OEi/urH8hgu8P7Mt96F1ohKEuXapqQ+QPDgoMC64s7WCvOmSE0BBtEGH339JoR
	GF88rYPDjAn0JqRr5QGxdEWxkBwW6+tL9TEWzk57E+Q/WZ1LuhmdAW4Y0BJ3VHJ91lxRmXGWBeK
	JB2zpE2b4cv+vgwdMThoMs+8tAC11LEEYUSvlQz76eLDgf29rX4ajJhxbrUTnrVp5RNlot6bPDc
	etn4k0uIYcCQ3UBfA2dX/NzI+HG8FmN5WkV0BuipcnITN0YJDXO//tCJxMxwVqJxWDDqoClPUZz
	kBSkGPfTrZmldAYC71Y662YiVRY3o0HLwQQWd21RhzyUth0IyrvulCy4lT8NyzHEJp1DlX0GB6S
	Ej0+Wd4cPavg9511U/kkujti/Ss2XNIMddE7teQWCmhfiwKiEnFyCIx/oiFXObRL/hLqDxMusmc
	OtjI8834cE2OS3b+/dkaTJN5q4EZ2YPJWlQXlp
X-Received: by 2002:a05:600c:4fc9:b0:48f:fe2a:107c with SMTP id 5b1f17b1804b1-4904248ac8cmr185605e9.6.1779389007490;
        Thu, 21 May 2026 11:43:27 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
	Marco Solieri <marco.solieri@minervasys.tech>,
	Luca Miccio <luca.miccio@amd.com>,
	Mykola Kvach <mykola_kvach@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v2 1/2] xen/common: llc-coloring: clear color count on parse failure
Date: Thu, 21 May 2026 21:41:21 +0300
Message-ID: <61c93d1364b24f19215db24f4ca88cf7a5014f24.1779388510.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779388510.git.mykola_kvach@epam.com>
References: <cover.1779388510.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1779389008-7015A8B7-563894AE/0/0
X-purgate-type: clean
X-purgate-size: 1898
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:carlo.nonato@minervasys.tech,m:marco.solieri@minervasys.tech,m:luca.miccio@amd.com,m:mykola_kvach@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,epam.com:mid,epam.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,ford.com:email];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0DC825AB367
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

parse_color_config() updates the caller-provided color count while
parsing. If parsing later fails, leave the count at zero so callers
do not consume a partially parsed configuration.

The bug is reachable in practice: cmdline_parse() ignores the -EINVAL
from a custom_param callback, so boot continues with the partial
xen_num_colors / dom0_num_colors that llc_coloring_init() and
dom0_set_llc_colors() then consume.

Fixes: 6cdea3444eaf ("xen/arm: add Dom0 cache coloring support")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
---
Changes in v2:
- Clarify that the partial color count can be consumed after
  a command-line parse failure.
- Add Reviewed-by tags.
---
 xen/common/llc-coloring.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index 6dc614739a..2606cb0977 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -79,7 +79,7 @@ static int __init parse_color_config(const char *buf, unsigned int colors[],
         if ( end >= NR_LLC_COLORS || start > end ||
              (end - start) >= (UINT_MAX - *num_colors) ||
              (*num_colors + (end - start)) >= max_num_colors )
-            return -EINVAL;
+            goto fail;
 
         /* Colors are range checked in check_colors() */
         for ( color = start; color <= end; color++ )
@@ -91,7 +91,14 @@ static int __init parse_color_config(const char *buf, unsigned int colors[],
             break;
     }
 
-    return *s ? -EINVAL : 0;
+    if ( *s )
+        goto fail;
+
+    return 0;
+
+ fail:
+    *num_colors = 0;
+    return -EINVAL;
 }
 
 static int __init parse_dom0_colors(const char *s)
-- 
2.43.0


