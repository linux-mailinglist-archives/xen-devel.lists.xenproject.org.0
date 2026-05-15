Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCEyIxgZB2rOrgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 15:01:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CDD550151
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 15:01:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309993.1580995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNs9A-0004KL-Op; Fri, 15 May 2026 13:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309993.1580995; Fri, 15 May 2026 13:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNs9A-0004I5-MD; Fri, 15 May 2026 13:00:08 +0000
Received: by outflank-mailman (input) for mailman id 1309993;
 Fri, 15 May 2026 13:00:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wNs99-0004C7-3h
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 13:00:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNs98-008bvJ-8z
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 15:00:06 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a0718d1-2eae-0a2a0a5409dd-0a2a450b8244-8
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 15:00:06 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 6a0718d5-212f-0a2a450b0019-c387df82e46a-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 15:00:05 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5763C6315D;
 Fri, 15 May 2026 13:00:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D880593A9;
 Fri, 15 May 2026 13:00:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IVHnCdUYB2qATQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 15 May 2026 13:00:05 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1778850005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fGLVgn9Q1bMVXvQUOe97ySXM/CiVTvt4tuaV2FX7IzM=;
	b=sthPDOjhzCNfEekl01yEq935Na1bIY42n3wShAZxhE+X8J/4h3594iUdKJC6GfoX0R1ldw
	RB2AsjYXy8dGTxLvgpNPMPoP9J689Ke+TRHXaRAHq6X2LSfg/13KpSwobalw7/nyDqciFR
	BYpkF5SM6S8WO42U2ZL9sXXNPEpIDDA=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=sthPDOjh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1778850005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fGLVgn9Q1bMVXvQUOe97ySXM/CiVTvt4tuaV2FX7IzM=;
	b=sthPDOjhzCNfEekl01yEq935Na1bIY42n3wShAZxhE+X8J/4h3594iUdKJC6GfoX0R1ldw
	RB2AsjYXy8dGTxLvgpNPMPoP9J689Ke+TRHXaRAHq6X2LSfg/13KpSwobalw7/nyDqciFR
	BYpkF5SM6S8WO42U2ZL9sXXNPEpIDDA=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v7.1-rc4
Date: Fri, 15 May 2026 15:00:04 +0200
Message-ID: <20260515130004.1571139-1-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-purgate-ID: tlsNG-42698a/1778850005-19364F3B-2388FD85/0/0
X-purgate-type: clean
X-purgate-size: 734
X-Rspamd-Queue-Id: 09CDD550151
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Action: no action

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.1b-rc4-tag

xen: branch for v7.1-rc4

It contains:

- one simple cleanup
- a fix for a corner case when running as Xen PV dom0
- a fix of a regression for Xen PV guests, introduced in 7.0

Thanks.

Juergen

 arch/x86/xen/mmu_pv.c       | 8 ++++++--
 arch/x86/xen/setup.c        | 2 +-
 include/xen/arm/interface.h | 2 +-
 3 files changed, 8 insertions(+), 4 deletions(-)

Juergen Gross (2):
      x86/xen: Fix xen_e820_swap_entry_with_ram()
      x86/xen: Tolerate nested XEN_LAZY_MMU entering/leaving

Thomas Huth (1):
      xen/arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in interface.h

