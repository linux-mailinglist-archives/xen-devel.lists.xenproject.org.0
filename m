Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PXdrIgBdImrcVQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 07:22:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C7964527D
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 07:22:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Wtk3PwK9;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1328925.1593149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVMzr-00022z-S0; Fri, 05 Jun 2026 05:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328925.1593149; Fri, 05 Jun 2026 05:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVMzr-00021A-OR; Fri, 05 Jun 2026 05:21:31 +0000
Received: by outflank-mailman (input) for mailman id 1328925;
 Fri, 05 Jun 2026 05:21:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wVMzq-000213-4h
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 05:21:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVMzp-006Ddi-3d
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 07:21:29 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a225cb0-bab6-0a2a0a5309dd-0a2a450697ca-48
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 07:21:28 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a225cd8-7371-0a2a45060019-d155802be5eb-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 07:21:28 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-490b4a8e28bso12167305e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 22:21:28 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.204])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490c2c9ea37sm31922435e9.0.2026.06.04.22.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 22:21:27 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780636888; x=1781241688; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O1mQfU8nVubaPNeVbtqSYXyI1fcXaMwz8rsvcS3hlZ4=;
        b=Wtk3PwK9C4TLsHvkaqP/7Pa/eQhYko/uCEo893Bo1XSywWRBGyZDKCl8bW8HJfKTjn
         wNwxMkhf30m55uiUK++aGxVmE4hfk7IhYBx6guMk/e4ioKbRLDjqxD6/dOqjo9LyQCIx
         SOyy6e8tQ4I86wUvtxe45cWZwkP1eaIqr5RuBfRTpxBtvOW7x65QUBBYpHa9+K6R+F5l
         vQqR+SlOD2LKukXnuJmonpBpdL0/n84cvacmCFCd8SbRTApFSgmLnqfvCNjryq36UHVv
         mpGb7/H/ey1l2pxKLBOxZt1aEEKD0yn42qG+a2cLCcD6lYUWOGmQ9QTyx0CMSJOf6Hc8
         DyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780636888; x=1781241688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1mQfU8nVubaPNeVbtqSYXyI1fcXaMwz8rsvcS3hlZ4=;
        b=BgpZtMTeY8FsFT7b3rjDEct9O+UXHngbA9ZOwru94De/Xs3dSsqwPN5YDxfJSYdckN
         WggCRmNF5jEeAs1bPaLygOgXwNJ+V+Yu8eggHQhRUPg/hkVFLQk1TtlWlEF9b207DFcz
         kqm/cQbUt+t22D9RcfJkiv+/Y3Ztzxmp7zrhhxGc1+sloT8L0Xlt3ksnmXs+iNjAKAxT
         no9K67KLvZxiZYtH2Q9ZwB8ANApXFEVEe3DafMZtZ+skOHW7c78/MSJa1vBP5tS5T/hD
         xwwn7o7Aqp/z5aFM52W5ANOzq/gf//g026IWhX38vVzoyzWxImP6r1T5fwN6bQA4a1Xb
         HC2g==
X-Gm-Message-State: AOJu0YyVFr08QKfRWWOqCsnINXjm5u65A1M66xDlfhg0h7W8pMMVubyb
	7as78iYxFoCpsL7G6eVgJs5hZcYxSbtzlxB8OlHl+cyg0z5CLFeq7kmo8sUxeg==
X-Gm-Gg: Acq92OGiDxvb6vgQzYtdwKzi4kk5ASQfXWuIdqOMXR7p2gd5jn4hfHNlFCjf4+bwzyW
	Re9sFV+jzCm1wQzlEIIl8nE4sHdiOmlJUe2qpe7cc/ZmAvqL0aQ1hR9MnAzFztziUIc8xl/J+0p
	loK2ZoQq9ZiKbeyt2JYJQR9znkS7BRyxou+qrM3OiRKzHuwEkfICGCb6lys5YOd8t9bZ6dNz87a
	FOvsFcsWsfCsysw1uuK7RmSuOmUUb7u3XsY4SG6N4BcTweKCOM9A3nJC9arvXaIs0O77wotUj0G
	BwjapK2noyuuFoJVdpUDtQdXSSwgdHp/Eui/8wWPghlg5zlc9SxVFdThtbk+TwlJzNB6XLusozT
	6x3JCN/lo5mHhDk4lOqNkLM47MywXVTZZvzi9vM9tIzPLFmM/NzjrenuJPSVcd05q6m73D6cuK7
	HxG341+4RGYUzIxIBnLOAufzn8dD6BHfnJy9fOqg==
X-Received: by 2002:a05:600c:19d2:b0:490:bb45:79da with SMTP id 5b1f17b1804b1-490c25af9a3mr23949615e9.13.1780636888119;
        Thu, 04 Jun 2026 22:21:28 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH for-4.22 v2 0/2] xen/arm: validate hwdom first bank boot placement
Date: Fri,  5 Jun 2026 08:19:06 +0300
Message-ID: <cover.1780602987.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1780636888-85361D75-EDA92A00/0/0
X-purgate-type: clean
X-purgate-size: 1731
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 25C7964527D

From: Mykola Kvach <mykola_kvach@epam.com>

With LLC coloring enabled, the hardware domain memory is allocated by
allocate_hwdom_memory() instead of relying on the fixed direct-map
layout. Since de99f3263555 ("device-tree: Improve hwdom memory
allocation for DMA"), the allocator prefers lower host regions, but the
first-bank filter still only enforces the old 128MB heuristic.

A low candidate bank can satisfy that heuristic while still being
unsuitable for the Arm kernel/DTB/initrd placement rules. Split the Arm
placement logic into reusable helpers first, then validate the candidate
hardware-domain bank 0 against those helpers before allocating it.

Changes in v2:
- Split the previous single patch into a behavior-preserving Arm
  placement refactoring and a separate hardware-domain first-bank fix.
- Rename find_module_placement() and place_modules() to use DTB/initrd
  terminology.
- Pass ramend to find_dtb_initrd_placement().
- Update the stale tools/libs/guest/xg_dom_arm.c reference.

Link to v1:
  https://patchew.org/Xen/4f862bb2dc323914b8120b0f16af7516140cf42b.1780065103.git.mykola._5Fkvach@epam.com/

Mykola Kvach (2):
  xen/arm: split DTB/initrd placement helpers
  device-tree: device-tree: validate hwdom bank 0 boot placement

 xen/arch/arm/acpi/domain_build.c        |   2 -
 xen/arch/arm/domain_build.c             |   8 +
 xen/arch/arm/include/asm/domain_build.h |   4 +
 xen/arch/arm/include/asm/kernel.h       |   9 ++
 xen/arch/arm/kernel.c                   | 190 ++++++++++++++++++------
 xen/common/device-tree/domain-build.c   |  30 ++--
 xen/include/xen/fdt-kernel.h            |   9 ++
 7 files changed, 192 insertions(+), 60 deletions(-)

-- 
2.43.0


