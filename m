Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Ke6MnFA72lP/QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 12:54:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9351E4714F9
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 12:54:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294776.1571471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHJbH-0005Z1-BG; Mon, 27 Apr 2026 10:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294776.1571471; Mon, 27 Apr 2026 10:54:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHJbH-0005Wo-8C; Mon, 27 Apr 2026 10:54:03 +0000
Received: by outflank-mailman (input) for mailman id 1294776;
 Mon, 27 Apr 2026 10:54:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wHJbG-0005Wi-An
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 10:54:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHJbF-00FJ1T-5F
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 12:54:01 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 69ef4044-2eae-0a2a0a5409dd-0a2a450895ee-24
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 12:54:01 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 69ef4048-63b5-0a2a45080019-d155802ef010-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 12:54:01 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-488d2079582so119218975e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 03:54:01 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a5c4b9e8dsm116133355e9.7.2026.04.27.03.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2026 03:53:59 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1777287240; x=1777892040; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J19VskUN5SAQjX2c2S2wMGKN309vxDPBhalqAElyfx4=;
        b=HK5dHL03Pb24NUe3GuEVY+k8Tv+KWDGMWpFqea8IzrKlgebNme13SVTzhoXL4W1Q3n
         euaS/XcAZYPx1f2nDUR1tGy3LUmJVW/VUuKRmQzHFhXV2+z50FNl2+npvUSSXrwf/iyw
         cquNrp/dWI52AyjvegGpiJHxxu2199bZdR/d1EbJKuBSS7GeDEybQZZ/BHvKhRn1Xr+E
         ynxvAZH0A/c8cjSLuUjx2EBbPVjNzG8sWzeQngrn2dISHKR8Yd9uRIEHQyusf3D/pq8o
         j78/A+SM5FWJiogO5g8CpDEvr9AgLZJRp0X+C4rCIJ0p4gbtTqubopyKJ1RV4JnRudsP
         v/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777287240; x=1777892040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J19VskUN5SAQjX2c2S2wMGKN309vxDPBhalqAElyfx4=;
        b=dewGQUgygS9wEVO3dcztJLPqYeFRPysO9BUUUCaK215GDdldM/j9C2NwOolKj48fyL
         FVpuDA739tPBSqpd/gRHWBR/AbBj443/hZf68mCRxfpgV8a2mEXQKelxfOElck4l2Fp1
         UaTZlAux9BoOBzJkFmCWROtbkqp+pIcFdh7XGOrgcSnmmdnH7aggMA7UF0XAgiGdQ0E+
         SdZZEBEk9mT4rb8Sq0JCGgCmE+VFT1QeN4ZNGcwyYVG0+Ldg+QidrcPaLSa174yLmIEd
         JqDX4ptKa+7/jl6ZAPlVJ8xPJat04XJZu73MEUru9YVYbucgXkU7t5d8uB94H1oau0qH
         05yg==
X-Gm-Message-State: AOJu0YzEVuOSKW5bsRHAbPs5jUvRPbqKbCJ6nndSgwtqX3MsNU9H1GFi
	9Cy4atDPzuEftFjHgWaBV5sxxcAqbrnASW8JUU5yzuwYuhsb3aIFDDMWOCq/wbKk
X-Gm-Gg: AeBDieuqaprCkWeaNsNtE2gtJb07enYELBUKKAfnaghrw/yLAoCyv7tQ4v79MUgfNif
	x6O05vH7K15ThKwmQPALButiCQ+YAtvuZ5rnCau5pNEidg/MZWWLU2CJ32GEqAo7pd90L+wE+hE
	BEaVy8oDI/Y/j1Sh+wqwSyVN0JR9GGz01gZ7JCwe7zckWLmzHXLqVjD3GEFzQFkiTNTPwxle6s7
	AJmO8MfVDhHwd/7FGrhftMJV7VZVjBniVmm+9YM6owU7USVp9dw4IHx0Kh4Nx46jSWLcbVWHxSZ
	8wVk4m1FNi6s7V3S+FaKI/DFer9+2gnJDitwSmJ9kG1JTgrevus4DaSBhtpvGpqvz7IXQdAQl4k
	YDcPTEFwTbJKGFeWGRLTW79AHzYWHD4JX+zMh685lX5dPCDKUBGV6ZA9POab4B4haSjYAi9b9tW
	P/ddNpSFSigcImZiPfKpdgp+ftRzao4aGsnuPbEmODjh5NotTeOH5mqdgo8ixsnD6lAsOhWXOHj
	ujT
X-Received: by 2002:a05:600c:620c:b0:488:ae6c:42c6 with SMTP id 5b1f17b1804b1-488fb7786c2mr613145255e9.14.1777287240067;
        Mon, 27 Apr 2026 03:54:00 -0700 (PDT)
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
Subject: [PATCH v2 0/7] Minor xenguest optimisations
Date: Mon, 27 Apr 2026 11:53:25 +0100
Message-ID: <20260427105338.99792-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1777287241-C0159DB1-734E2BBF/0/0
X-purgate-type: clean
X-purgate-size: 1256
X-Rspamd-Queue-Id: 9351E4714F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
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

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Reduce some number of parts passed to writev.
Avoid possible allocation sending data with writev.
Reduce number of allocations sending memory state.

Changes since v1:
- add commit to cache up to 4 pages in hypercall;
- add other 2 commits reducing chunks passed to write/writev.

Edwin Török (2):
  tools/libs/guest: allocate various migration arrays just once
  tools/lib/call: cache up to 4 pages in hypercall bounce buffers

Frediano Ziglio (5):
  xenguest: Reduce number of parts in write_split_record
  xenguest: Reduce number of I/O vectors in write_batch
  xenguest: Allows writev_exact to change iov array
  xenguest: Reduce number of I/O vectors in write_batch
  xenguest: Use a single write_exact in write_headers

 tools/libs/call/buffer.c        |  28 +++---
 tools/libs/call/core.c          |   3 +-
 tools/libs/call/private.h       |   8 +-
 tools/libs/ctrl/xc_private.c    |  26 ++----
 tools/libs/ctrl/xc_private.h    |   2 +-
 tools/libs/guest/xg_sr_common.c |   6 +-
 tools/libs/guest/xg_sr_common.h |  13 +++
 tools/libs/guest/xg_sr_save.c   | 147 +++++++++++++++-----------------
 8 files changed, 114 insertions(+), 119 deletions(-)

-- 
2.53.0


