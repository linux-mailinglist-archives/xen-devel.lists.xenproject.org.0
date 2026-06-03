Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pn+wK9UmIGqRxgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D65637DA2
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=n7eoLNbq;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1326223.1591654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIa-00052v-58; Wed, 03 Jun 2026 13:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326223.1591654; Wed, 03 Jun 2026 13:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIa-000507-1J; Wed, 03 Jun 2026 13:06:20 +0000
Received: by outflank-mailman (input) for mailman id 1326223;
 Wed, 03 Jun 2026 13:06:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wUlIY-0004zv-AD
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:06:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUlIX-007IV7-N7
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:06:17 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026c1-bab6-0a2a0a5309dd-0a2a450ae342-16
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:17 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026c9-56b3-0a2a450a0019-d155802aac1f-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:17 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-490bb83a3f6so357775e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 06:06:17 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ec711sm7254825f8f.12.2026.06.03.06.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 06:06:16 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780491977; x=1781096777; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hmV5aeQ33UccOsNO+ZfDPPQsqDB1cLMygIKOpc1+2bg=;
        b=n7eoLNbq+LLcATOLR2ilEK0r623VL3EH01FoR/2GsT473pzYI+EC5wHGgqe4KoPuw6
         uD1TNib9uLQpvMDs+c3T92tL2UWi8pI2kRU+yY16B/lpYBhFtmIGFh48c4b/Jw0lnSFN
         zyY5YBvmLekR3+KHYs8YGiGvCn9FdH64RNuqBZ56cx9J7y5Ka1LPf2CVuZH7aoZqWhvF
         mK6e+X5GgTXCSiWNLQfdOdNp96Ji8UZopgIkmMdsGex02WeG47KiApI22eQHs03Krs+n
         QZH/NpO/ZozfdDFKYe1Ryyk/mexZuTF0HUdq/JFavbwTVzbIn+hiQ0pctUrYG/twv+Wu
         auHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491977; x=1781096777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmV5aeQ33UccOsNO+ZfDPPQsqDB1cLMygIKOpc1+2bg=;
        b=W3wRYXHscc3yMKYHBt/rIoayHtLPAnPqNL47tQNVONq1To0H/jQ32f0WO8qBw9bDmk
         Rz2hCMa03Eo9y744+JFRjTO43nYcDzDmPAbX1MzbTlGQmz3i2l+846cEsC4mh4h8Qk+s
         bgnsmHaMk6p1+Oji0GgfzunpcxydP/WDR4S1kg5UxyfVwByUbntwDPf44Z+ziKGOtWFy
         21n3n3Y/1y53QIeutWLZYZEUEM8IX8ymT1yIJSQ/ERo0+GV5IrqRbFLYFw6zP87xPW76
         sGUZ19KBWc/fEmZFqdv3Y+KUWl7HJcDkq3CQT5RV5D5wXXQ7VIRIPpBe3N8/Ko3ee83O
         LcRw==
X-Gm-Message-State: AOJu0YwmLTD+lxFUjw0poK7QDnrvKI7uvpVjSdnOGKv5UHrNsA2XDSin
	kSn2bAf+BYNYbsFqBx17scrmAN2fWh0pkA37IrVR7Q3sI37OAGV1o1XaLmaejFCz
X-Gm-Gg: Acq92OGGMsoSzaQQFy9g2m7iWuTBBSUIw14UWmrDnMBKtqQuv0sJZb2QpvXYBmDFS/v
	xi08lZZJY1orTHdN97f+uMv3rhPVqpvwBvVVyna7/D7pP1HonOKCCb5lI0P8g/DWMCFnf8mrTwA
	NPflqJHvv62Z5qx9z2+Hy72duQhuyFwNlNKXS+m5iqlAfwdmG68zEzPPggyNCJswEXFy2zKRz6A
	JMf6DsZELrWSZCnzLFkBd3QE4vbbYmENeKNgMIkMNOhi8+W04f2UTEFkNsImO9TNa31w23VshMU
	A3oHY6W8OjeOAJ537lqzksY6W0IskJWLcxN8k5TGM+CJ+rPM3U+NFWrbd0GhWQ/ZUD4jb9xDJIp
	UV+QNjNXecslwGBnYFa0OCgZbgPZ/Sn0RUcXQpSrf+FHUA0mL+uRneap0meqbznYnr04mujSddL
	0kh2yOZjPshVhP6oqHMCYb77j4lV0gNJeJ/3O2ldHvRGVs45QK+yHXKPpzl8WGQtVVKCHOLN6qs
	sGJwgcixCRxKIwXrNTioM95youvHa6T34Qz
X-Received: by 2002:a05:600c:c103:b0:490:9bc2:bf8b with SMTP id 5b1f17b1804b1-490b5e79656mr41657875e9.5.1780491976873;
        Wed, 03 Jun 2026 06:06:16 -0700 (PDT)
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
Subject: [PATCH v4 00/16] xenguest optimisations
Date: Wed,  3 Jun 2026 14:05:47 +0100
Message-ID: <20260603130603.776452-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1780491977-709668B7-352EAB86/0/0
X-purgate-type: clean
X-purgate-size: 2305
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email];
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
X-Rspamd-Queue-Id: 17D65637DA2

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Reduce some number of parts passed to writev.
Avoid possible allocation sending data with writev.
Reduce number of allocations sending memory state.

Implement and use new Xen and Linux kernel ABI to copy foreign memory.
This new ABI allows to replace theexpensive  map/copy/unmap sequence
with a single call.

Changes since v1:
- add commit to cache up to 4 pages in hypercall;
- add other 2 commits reducing chunks passed to write/writev.

Changes since v2:
- update patches commit prefixes;
- add other 2 optisations.

Changes since v3:
- address some comments;
- add patches for foreign copy optimisation.

Edwin Török (3):
  libs/guest: allocate various migration arrays just once
  libs/call: cache up to 4 pages in hypercall bounce buffers
  PoC: libs/guest: use foreign copy during migration

Frediano Ziglio (12):
  libs/guest: Reduce number of parts in write_split_record
  libs/guest: Reduce number of I/O vectors in write_batch
  libs/guest: Reduce number of I/O vectors in write_batch
  libs/guest: Use a single write_exact in write_headers
  libs/guest: avoids using 2 indexes
  libs/guest: fill directly iov structure
  libs/ctrl: Allows writev_exact to change iov array
  libs/guest: add xg_foreignmemory_copy_{from,to}
  xen: implement new foreign copy hypercall
  privcmd: Add definition for new Linux privcmd to access new Xen
    hypercall
  libs/guest: use new hypercall if available
  libs/guest: finalize PoC

 public-abi/memory.h                   |  40 ++++-
 tools/include/xen-sys/Linux/privcmd.h |  10 ++
 tools/libs/call/buffer.c              |  28 ++--
 tools/libs/call/core.c                |   3 +-
 tools/libs/call/private.h             |   8 +-
 tools/libs/ctrl/xc_private.c          |  26 +--
 tools/libs/ctrl/xc_private.h          |   2 +-
 tools/libs/guest/xg_sr_common.c       |  95 ++++++++++-
 tools/libs/guest/xg_sr_common.h       |  21 +++
 tools/libs/guest/xg_sr_restore.c      | 100 ++++++------
 tools/libs/guest/xg_sr_save.c         | 225 +++++++++++---------------
 xen/common/memory.c                   | 133 +++++++++++++++
 xen/include/public/memory.h           |  40 ++++-
 13 files changed, 512 insertions(+), 219 deletions(-)

-- 
2.54.0


