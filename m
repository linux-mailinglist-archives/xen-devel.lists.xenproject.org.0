Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E98AE03F1
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 13:38:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019957.1396395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSDau-0001qw-OR; Thu, 19 Jun 2025 11:38:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019957.1396395; Thu, 19 Jun 2025 11:38:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSDau-0001p6-LT; Thu, 19 Jun 2025 11:38:12 +0000
Received: by outflank-mailman (input) for mailman id 1019957;
 Thu, 19 Jun 2025 11:38:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rg/r=ZC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uSDas-0001ot-Mf
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 11:38:10 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id debb2229-4d01-11f0-b894-0df219b8e170;
 Thu, 19 Jun 2025 13:38:07 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 29D2421167;
 Thu, 19 Jun 2025 11:38:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E7FAE136CC;
 Thu, 19 Jun 2025 11:38:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id y8a9Np72U2hVbgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 19 Jun 2025 11:38:06 +0000
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
X-Inumbo-ID: debb2229-4d01-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750333087; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fHu1G+O8pg228Mge4annxJlFqTCUB9Its+MVOrMgr5k=;
	b=cgREe0QHD/+lvL9hfMzJWOenrMciV0S97Sv1mW2XobOLy3ffugLwYKtTGyUKpaXAzm0Ho4
	4CTUEbB9hmpHGOH4GWCOthxYpx3b4ofL4GNtvFfO4Z9AFFZT+cX4+vsdo5yoBReZYfE5jZ
	VTU06wFAnB8NEqv5O9hUm8mwB7BPYTw=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750333087; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fHu1G+O8pg228Mge4annxJlFqTCUB9Its+MVOrMgr5k=;
	b=cgREe0QHD/+lvL9hfMzJWOenrMciV0S97Sv1mW2XobOLy3ffugLwYKtTGyUKpaXAzm0Ho4
	4CTUEbB9hmpHGOH4GWCOthxYpx3b4ofL4GNtvFfO4Z9AFFZT+cX4+vsdo5yoBReZYfE5jZ
	VTU06wFAnB8NEqv5O9hUm8mwB7BPYTw=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 0/6] hide struct start_info from PVH code
Date: Thu, 19 Jun 2025 13:37:58 +0200
Message-ID: <20250619113804.32694-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80

While working on xenstore-stubdom live update support I came across
some really unpleasant code using struct start_info even when running
in PVH mode.

Especially suspend/resume was doing some crazy stuff, including
overwriting the initial struct hvm_start_info partially.

This series is hiding struct start_info from PVH code. This didn't
result in any runtime error, but in future I'll need to access struct
hvm_start_info some time after boot, so I need to get that fixed.

Tested especially with xl suspend/resume and xl save/restore in PV and
in PVH mode.

Juergen Gross (6):
  suspend: drop crazy pfn handling for PVH
  setup: drop parameter from map_shared_info()
  x86/pv: remove global start_info
  console: drop parameter from get_console()
  xenbus: drop parameter from get_xenbus()
  x86/pv: make start_info_ptr PV-only

 arch/arm/setup.c     |  6 ++--
 arch/x86/setup.c     | 69 ++++++++++++--------------------------------
 console.c            | 10 +++----
 hypervisor.c         |  2 +-
 include/console.h    |  2 +-
 include/hypervisor.h | 14 ++-------
 include/xenbus.h     |  4 +--
 xenbus.c             | 13 ++++-----
 8 files changed, 39 insertions(+), 81 deletions(-)

-- 
2.43.0


