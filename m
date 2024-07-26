Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B4893D0B3
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 11:58:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765370.1175958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXHi7-0002cZ-76; Fri, 26 Jul 2024 09:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765370.1175958; Fri, 26 Jul 2024 09:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXHi7-0002aD-4F; Fri, 26 Jul 2024 09:58:03 +0000
Received: by outflank-mailman (input) for mailman id 765370;
 Fri, 26 Jul 2024 09:58:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xI/c=O2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sXHi5-0002a3-Ep
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 09:58:01 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a9db4c4-4b35-11ef-bbff-fd08da9f4363;
 Fri, 26 Jul 2024 11:58:00 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BA8C61F892;
 Fri, 26 Jul 2024 09:57:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8646F1396E;
 Fri, 26 Jul 2024 09:57:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QHT2Hidzo2Y9TgAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 26 Jul 2024 09:57:59 +0000
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
X-Inumbo-ID: 8a9db4c4-4b35-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721987879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1knbRafuZJdjClcPDZqqUCWVZiNFY1gGFmGIQ1GvI/U=;
	b=dMfzfwgczwDGZ9T7UZGIzIQ9LaT1E99Pvl1lrdn/YDSbRkKh/E5W7OIn4kJzatFhQv/Yfx
	/lkwhqtwvBZmkgRmidk8vE/sXTTBv3Xhr0+HQcq57VJCHbr2X4isJP+PzLCj7HppgWcnR8
	jmLG21dlXOefdMYiWwRASOnWKaVYT/k=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721987879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1knbRafuZJdjClcPDZqqUCWVZiNFY1gGFmGIQ1GvI/U=;
	b=dMfzfwgczwDGZ9T7UZGIzIQ9LaT1E99Pvl1lrdn/YDSbRkKh/E5W7OIn4kJzatFhQv/Yfx
	/lkwhqtwvBZmkgRmidk8vE/sXTTBv3Xhr0+HQcq57VJCHbr2X4isJP+PzLCj7HppgWcnR8
	jmLG21dlXOefdMYiWwRASOnWKaVYT/k=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.11-rc1 take 2
Date: Fri, 26 Jul 2024 11:57:58 +0200
Message-ID: <20240726095758.15879-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.60 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.60

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.11-rc1a-tag

xen: branch for v6.11-rc1 take 2

It contains 2 fixes for issues introduced in this merge window:

- one for enhanced debugging in the Xen multicall handling

- a series with 2 patches fixing a boot failure when running as dom0 in
  PVH mode

Thanks.

Juergen

 arch/x86/include/asm/xen/hypervisor.h |   5 --
 arch/x86/platform/pvh/enlighten.c     |   3 -
 arch/x86/xen/enlighten_pvh.c          | 107 ++++++++++++++++++----------------
 arch/x86/xen/multicalls.c             |  19 +++---
 arch/x86/xen/smp_pv.c                 |   1 +
 arch/x86/xen/xen-ops.h                |   3 +
 6 files changed, 74 insertions(+), 64 deletions(-)

Juergen Gross (1):
      xen: fix multicall debug data referencing

Roger Pau Monne (2):
      x86/xen: move xen_reserve_extra_memory()
      x86/xen: fix memblock_reserve() usage on PVH

