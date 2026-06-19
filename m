Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oZY6IrE+NWqCpwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:05:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0E86A5F22
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:05:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JnK5JK3i;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1342197.1602408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuI-0000VH-T2; Fri, 19 Jun 2026 13:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342197.1602408; Fri, 19 Jun 2026 13:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuI-0000SS-O3; Fri, 19 Jun 2026 13:05:14 +0000
Received: by outflank-mailman (input) for mailman id 1342197;
 Fri, 19 Jun 2026 13:05:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1waYuG-0000SG-Ho
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 13:05:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waYuF-002qlM-Uv
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 15:05:11 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e84-bab6-0a2a0a5309dd-0a2a4508d34e-6
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:11 +0200
Received: from [209.85.218.47] (helo=mail-ej1-f47.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e87-9ee7-0a2a45080019-d155da2fd034-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:11 +0200
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-bec49f7e35eso299362166b.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 06:05:11 -0700 (PDT)
Received: from localhost.localdomain (8.17.6.51.dyn.plus.net. [51.6.17.8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4650bc428d9sm7960088f8f.27.2026.06.19.06.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 06:05:10 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781874311; x=1782479111; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cK/F40kmfhZ4Q4nBiYM3DRyYw/SqqYHHopWGOvg80R0=;
        b=JnK5JK3irj8kb7zvor6oA2nb1De63gx4CXIZNi6dTafe1XDrNn3IuC764NZPRP1Q9C
         3tJMzB2R87/IhlwXQwpNG1j1F0+50ZRZhiVVmBkrK5zq6rlGrDup/m7orOGtXILU0KBK
         1kVlo7caI5xRJnUDJ/K3ouYBCE/6OjgE9LxwZ52xmKL9Wx2Eef0gLDhQJB8MoC8Wjvt3
         +t/wbd06/xMfMAVxLzy5Doo4BYuxYLw78ompnmIEWHD3D6MrRmy3hLtcy/8RvVLSoUid
         ctfrmmnKRilobOGyhEGr9VNuGY4iKZe102friyqmZqD5Uu3V9e1ZweRahKtGrPewC9mt
         epsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874311; x=1782479111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cK/F40kmfhZ4Q4nBiYM3DRyYw/SqqYHHopWGOvg80R0=;
        b=cwPEkNfsHndjzmbHHPbmbFig80zuaFapnXzZJrm8UmR4W9FpU9by/lZ/fwkPbhfV7g
         CWwA/+HkbPS0FOUAWhxUUBSdQ1CEyDKqfmPmvkgKIhBNLC/r6KAhl53isP6WFZR2EYEm
         dsWXkXDjAyCyytDPXQSkd2U0o6nOc8iyXonwogO2drK85eCMgrYquE+FwYDC/+crK9fR
         m8j9gMsbxXbBnbMbQ1HNAaRwgblYlbyv3G+7fWXma+ncn4P8gKaLQmAHeteYSK3/RI0v
         zkA2hT66amJ0BjOLVq/nisO36aS/dAuFnJVRihOQ9zhl28am7ddPcKVcZ97pRepWluyw
         Y+3w==
X-Gm-Message-State: AOJu0YwP2OJfhaKTBcipRJynsCuYvX3VLgV2OhiSreKRzKEs6en104U3
	UGY/HVUO8weWT/w1AsopbhBgLXOy0HgSEnfvAGyPCtmj32FDjWwTjCy+tR8ZSW8x/io=
X-Gm-Gg: AfdE7ckumJHxu8ASWSbmbXP6RXxzySAQBlPC8jhMZLzTkLAQc4e1q5TRXEOQ4NwvaYi
	oU7RotA0rZJoFoBd0YcJ2JbRWU1tbTCGK4rMXUSFIJsAjWPg6YKFRfCOMOrOaoBlWOJexgBLNam
	L3KsEe5Mu3MXMMH8S3OwhYo05JANkiQPaZIewwNHuADnaMCPQV24PVjtWmhnZ/60RxufPX1VchF
	nkt1BmnBezBPEtuOIHlN1xckoXe0PzUanQ7qVv/5LBrJtUYVAYS4HOzl3NxvBJYsWabzSwwUIa5
	7KpwB38j06kdWvHxxR835P2SBuB41ORp3IGTmrHNLOTSBfz2/ndXCclT8Erc+lxsdIOsUiQTjb2
	XodZ4DdU6sY4leVZ0hLDtSYPWPzwrC8D8lqp0+oxzef9RYVyOKk4Z6mvja9J0P+iYvo50PF2M6l
	CL7Imiw12jO2iI9ZJbExrQytbNngBPJCAW9axpl4y1ToLLF5KrHIhGnAbEwjSzAZukaPvNlFIQB
	HvWWawm
X-Received: by 2002:a17:907:8e07:b0:bec:5234:af7d with SMTP id a640c23a62f3a-c097adb7396mr160275366b.6.1781874311067;
        Fri, 19 Jun 2026 06:05:11 -0700 (PDT)
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
Subject: [PATCH v6 00/16] xenguest optimisations
Date: Fri, 19 Jun 2026 14:04:45 +0100
Message-ID: <20260619130501.272832-1-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1781874311-77FE50FA-DE87A0A5/0/0
X-purgate-type: clean
X-purgate-size: 2606
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid];
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
X-Rspamd-Queue-Id: 3A0E86A5F22

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

Changes since v4:
- added Reviewed-by;
- improved commit messages;
- other minor fixes, see individual commits.

Changes since v5:
- avoids potential buffer underflow if nr_pages is 0 calling cache_alloc;
- do not overwrite errno if xenforeignmemory_map fails;
- lot of changes to "implement new foreign copy hypercall", see specific
  commit.

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

 tools/include/xen-sys/Linux/privcmd.h |  10 ++
 tools/libs/call/buffer.c              |  31 ++--
 tools/libs/call/core.c                |   3 +-
 tools/libs/call/private.h             |   8 +-
 tools/libs/ctrl/xc_private.c          |  26 +--
 tools/libs/ctrl/xc_private.h          |   2 +-
 tools/libs/guest/xg_sr_common.c       |  92 ++++++++++-
 tools/libs/guest/xg_sr_common.h       |  21 +++
 tools/libs/guest/xg_sr_restore.c      | 100 ++++++------
 tools/libs/guest/xg_sr_save.c         | 224 +++++++++++---------------
 xen/arch/x86/traps-setup.c            |   2 +-
 xen/common/memory.c                   | 145 +++++++++++++++++
 xen/include/public/memory.h           |  44 ++++-
 13 files changed, 489 insertions(+), 219 deletions(-)

-- 
2.43.0


