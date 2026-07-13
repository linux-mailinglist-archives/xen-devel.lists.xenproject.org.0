Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Aw1kCjVPVWqMmgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 22:48:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB09974F219
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 22:48:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=oQBFdVJS;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1361927.1613950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjNZT-0005Cf-9R; Mon, 13 Jul 2026 20:48:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361927.1613950; Mon, 13 Jul 2026 20:48:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjNZT-00059y-5w; Mon, 13 Jul 2026 20:48:11 +0000
Received: by outflank-mailman (input) for mailman id 1361927;
 Mon, 13 Jul 2026 20:48:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wjNZR-00059r-Og
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 20:48:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjNZP-009Hn3-Gx
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 22:48:07 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a554eec-e002-0a2a0a5209dd-0a2a450bb952-8
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 22:48:07 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <freddy77@gmail.com>)
 id 6a554f07-b7da-0a2a450b0019-d1558033d168-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 22:48:07 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-493f60208a5so31037715e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 13:48:07 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49508724786sm23924255e9.3.2026.07.13.13.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 13:48:06 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783975687; x=1784580487; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jNvcypdvf8cqrabG10FqUFjqt5luk1pIONVqLXZYNUc=;
        b=oQBFdVJSdxXGBPBpKt8W5qtY+KaNwg3QgfuhlgN8ciYxljoiXEmGhIquIrY4FX8kqj
         i61XLT4znuY289EV87hU/2mQnRCSv44BdXwvp+V13CLES/zlbO7zfz3LshTAkj7OjGE6
         0HqyMzunJ9tBt1zvgVKkpHUZOVcZzwalB0YGMb8sLlulXpQxbrV+1eEPe+eEEnXfzt5v
         S0xhizxkz3n6tVSOtDmKEn81wbTWZWblU0cZHVVdFMy4yBoALARcKfFd5NQHz5prFpGl
         JpEXVRT53IaMDFSycos05osdX3bG+oLiXzEbctbtzmHVFkDy/04Nl+qCkSjyyp9A+5Af
         YRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783975687; x=1784580487;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jNvcypdvf8cqrabG10FqUFjqt5luk1pIONVqLXZYNUc=;
        b=rOBSpTjp2F/xNxnAt/pQB9PeIlN02Mlrz5qwybvNAbjlDFODcKH7oHUPgGn8ToJ4PS
         aDXoZTjp1KzOUhoJQOu7xJhKVVbY31N5e8u4DtSlXQXhOkjmGm3e09TDPsVQtB07cx84
         cwSnXtDdjUnLnt5nIWtvQxLYwsJSjljwgJASSgftpSnEdaP0QRRrQBv3BhTFBVwXB2TP
         Qg3cgY79qFMZegnYga3t5nW/4pe5C8mHIkxVshrDvKyVBMMVAOja1M+AveGwwNZQYS5Z
         Lr9XzGDQvy4VF+7y5Z8cb28XO9XIdjD0Euk2O9JBHZTeClwOqCKCiabd6XWfRNBd/a1x
         6QBg==
X-Gm-Message-State: AOJu0YwBoEQUZwJ5yFwv7ukXl5otcjGszuqhMRVWZ82ZjZGsCMuHXOSX
	pAjhO51zQMvcz8qo49Rg+daaZLKgvTN7nN4rFmx/zgEBOxyLkMH9xXI6Cy+Fqrkn95w=
X-Gm-Gg: AfdE7clluoZcHvkktK+Jo+8Otkqw+n/BCuYVlInm48uJSsDaW0/dy2wFzjKXoezy4hI
	YxYogEwbTOqGZqGP5whIijy1tTV0yw0QjeEeqIWY/EEdxyfPwKZDa9YFvR+E74+9YTYYkzglSst
	M1RYRtZJ2W51jd+c8v65XLMZVMMogjIXg4ZJhuwER0tkBev9w0bVa6jK+YIslRK+uCBBFfowwer
	NT4Fx2h0Tf4T4w2n/nmeIxM831MMHa4LbEej/5XoR5DMjQhI9v56XYNLAnsmftB9ICbzGcXqzgX
	MLc1rCvfF/ikYagmyCkrLyzBcoDbh8IGfnx3MPuaFgB+dwln0x3YfGnrkUhpWHypD1bKY29oXCo
	ArODho+mwM9jNid9bUCZ+YCefIrEz/ZE5Jts+JML/zAlWevKMCWh5OSS3FD9iCuZU02AquUbDNZ
	OTXkfnfZoBeFpjaF0QAzhO5a6p4fVacYxuz6hgYVDpWrcFj7bRAYzwzAYRA6YvbpoGkp33sU9U9
	hPtdYOI5lRXlL+8C46BE1IzVcczWg==
X-Received: by 2002:a05:600c:5493:b0:493:f262:b8 with SMTP id 5b1f17b1804b1-493f87d666bmr110995615e9.1.1783975686631;
        Mon, 13 Jul 2026 13:48:06 -0700 (PDT)
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
Subject: [PATCH v9 0/4] xenguest optimisations
Date: Mon, 13 Jul 2026 21:47:58 +0100
Message-ID: <20260713204802.105115-1-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1783975687-C716D9ED-233DDF28/0/0
X-purgate-type: clean
X-purgate-size: 1879
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB09974F219

Reduce number of allocations sending memory state.

Changes since v1:
- add commit to cache up to 4 pages in hypercall;
- add other 2 commits reducing chunks passed to write/writev.

Changes since v2:
- update patches commit prefixes;
- add other 2 optisations.

Changes since v3:
- address some comments;
- add patches for foreign copy optimisation.

Changes since v4:
- added Reviewed-by;
- improved commit messages;
- other minor fixes, see individual commits.

Changes since v5:
- avoids potential buffer underflow if nr_pages is 0 calling cache_alloc;
- do not overwrite errno if xenforeignmemory_map fails;
- lot of changes to "implement new foreign copy hypercall", see specific
  commit.

Changes since v6:
- removed merged patch;
- keep only optimization commits for now;
- improve comments;
- merged "fill directly iov structure collapsing them" and moved it;
- split "allocate various migration arrays just once";
- add a commit for memory checks using Valgrind.

Changes since v7:
- removed merged commits;
- minor style fixes.

Changes since v8:
- added Reviewed-by;
- remove useless check;
- remove useless memset;
- initialize variables while declaring them.

Edwin Török (2):
  libs/call: cache up to 4 pages in hypercall bounce buffers
  libs/guest: allocate various migration arrays just once

Frediano Ziglio (2):
  libs/guest: move batch_pfns into a separate structure
  libs/guest: use Valgrind to detect various buffer overflows

 tools/libs/call/buffer.c        | 34 ++++++++-----
 tools/libs/call/core.c          |  3 +-
 tools/libs/call/private.h       |  8 ++--
 tools/libs/ctrl/xc_private.h    |  8 ++++
 tools/libs/guest/xg_sr_common.h | 19 +++++++-
 tools/libs/guest/xg_sr_save.c   | 84 ++++++++++++++++-----------------
 6 files changed, 98 insertions(+), 58 deletions(-)

-- 
2.43.0


