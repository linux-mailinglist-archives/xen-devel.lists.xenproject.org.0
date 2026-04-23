Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0N8XC1x76mmqzwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 22:04:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3364571CC
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 22:04:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1292625.1570968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wG0Hb-0007IS-2G; Thu, 23 Apr 2026 20:04:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292625.1570968; Thu, 23 Apr 2026 20:04:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wG0Ha-0007FP-Vc; Thu, 23 Apr 2026 20:04:18 +0000
Received: by outflank-mailman (input) for mailman id 1292625;
 Thu, 23 Apr 2026 20:04:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wG0Ha-0007FE-4i
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 20:04:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wG0HZ-008AbV-B5
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 22:04:17 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 69ea7b23-bab6-0a2a0a5309dd-0a2a4507ec64-24
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 22:04:17 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 69ea7b41-229c-0a2a45070019-d1558034bde0-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 22:04:17 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-488b0046078so63848315e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 13:04:17 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e3a341sm60065442f8f.24.2026.04.23.13.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 13:04:15 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776974656; x=1777579456; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OgPgLrJe3moAhlzkuCpYhzQa4RXKhr2E3EuEQSE1TaA=;
        b=Gvo1N5Ke+BAJHttcdV6TFtSn5UVz1e6S+iNYp6e8uuhOPqr+M9ZnnAyRlk7GQQ/FGD
         AVnCjNcFi5lZZL+pKt72rcofrlBQDwd6HvzN2+qhDkXHrbQ5/CF25ThZy8tTivOnR/VZ
         StL9EXnzpT6LghcBO9TR1/sIPhxF+xm3pbJAZeCvwOqL4fdt2xBFilhsoov2uBufICVw
         Xv1ojWwh9z9ZiuoAD6bVENOf3bQjNbw8SeL48Wrn8ZuWvZSafizBIc6ywqipGSmiNAYa
         yliRedmXSHJOPumZJ8Ir91Juwc69wK8qyUmIML1OGvWRgTDNnCGzxb+6CECX+uNPFVJn
         4yuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776974656; x=1777579456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgPgLrJe3moAhlzkuCpYhzQa4RXKhr2E3EuEQSE1TaA=;
        b=EtEyMOlYd/6h/2eify09nQe6PXgPkP3d1fU/+lk2tNV3eXSTFVzWQo8i3rVpwWfL9M
         Znml28xWOctYvHUs1JSV8eBKXX9NDLZU6J8O+MM76bT7nR2LUq8vFfGcrdTUgyJwtUNm
         xRYj1xVkd2b+dgtK+xFZr56akH+o8KuyacpkSZ+wV6JbHNN8+NIWng7Hd0IFcSDTxHhd
         RH1XXz3CMk4V7snTLOPrT/f6DqzAXuNU7EhSu3efhnVh7Tj8Vwcl1lWV4Q1IK2Cpd3me
         39aGbQQQ5cAgB6re9/0YjPmGPwlZhPmkCU4NS+zlDctx2+N1bQdnQG5bn2NdcBuigQMS
         oz0g==
X-Gm-Message-State: AOJu0YyygUs72PI++kVT7iItPIfFUFysN5FDMBEpe7w1jo4vwDu8YSv2
	qZyjLzKn9zRzB45xgy57QCVOHbVA65sPwK8BZofv6NN4SAwt85y+oAxYDDJZsrv5
X-Gm-Gg: AeBDieubz/82gWMIHxKdhpqpClHWP4Ed+XK7cuE+Sy59uASP9wdGcfE3xZidiEFxl+x
	cWKrMOUVE46EdteRlNTUSkKyfJKRe8dJFMSB8Hfrk2klXTwhin0Gt0UYBUqFBeUhytg5M7S9++X
	uOSGAMiuWlDwQrB2nQjFSSqAgL3aZRICCAt2qvhoCYLxALbM5JolM9+eKo1KwUyaVNw1vLF9VVt
	OLNT22TlXoVT8kSQ7tjZ3HXDSJHuj8WcB16dpR+d6zI90LDI8QK9M3sqcPjf2Iw1MvVd6CdpPly
	Qu41xstp2bC7FKCq++E1ztDMLxEa1Tl1NSS6HHowA9eMJPqaZxqd3ZODkzZD6t8eChZQJ+K8TBd
	X6AsgGyRCshV/5WpXRdyV1FhMJLA8+uLNH82emph89EpSBZFcUH5i02HNrgGfW67JBhAj72FKDG
	Fi5sXXaVbZsCF31zfSldBUbe0/cvhIvNNMOhGkG4L9Ien8rbfqdhBauV2Iz9CFLeCpADJfqNWyb
	wpy
X-Received: by 2002:a05:600c:8586:b0:489:e49:f766 with SMTP id 5b1f17b1804b1-4890e49f7d8mr206987525e9.17.1776974656302;
        Thu, 23 Apr 2026 13:04:16 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/4] Minor xenguest optimisations
Date: Thu, 23 Apr 2026 21:03:55 +0100
Message-ID: <20260423200406.28178-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1776974657-ACF66C48-7E9FBD09/0/0
X-purgate-type: clean
X-purgate-size: 754
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloud.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
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
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BB3364571CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Reduce some number of parts passed to writev.
Avoid possible allocation sending data with writev.
Reduce number of allocations sending memory state.

Edwin Török (1):
  tools/libs/guest: allocate various migration arrays just once

Frediano Ziglio (3):
  xenguest: Reduce number of parts in write_split_record
  xenguest: Reduce number of I/O vectors in write_batch
  xenguest: Allows writev_exact to change iov array

 tools/libs/ctrl/xc_private.c    | 26 ++-------
 tools/libs/ctrl/xc_private.h    |  2 +-
 tools/libs/guest/xg_sr_common.c |  6 +-
 tools/libs/guest/xg_sr_common.h | 13 +++++
 tools/libs/guest/xg_sr_save.c   | 99 ++++++++++++++-------------------
 5 files changed, 63 insertions(+), 83 deletions(-)

-- 
2.43.0


