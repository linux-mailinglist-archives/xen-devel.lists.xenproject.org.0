Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D8893913B
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 17:02:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762118.1172232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVuXu-0000fZ-7E; Mon, 22 Jul 2024 15:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762118.1172232; Mon, 22 Jul 2024 15:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVuXu-0000c1-48; Mon, 22 Jul 2024 15:01:50 +0000
Received: by outflank-mailman (input) for mailman id 762118;
 Mon, 22 Jul 2024 15:01:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JAiy=OW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sVuXs-0000bJ-F1
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 15:01:48 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f6dea0a-483b-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 17:01:44 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 079111FB73;
 Mon, 22 Jul 2024 15:01:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF621136A9;
 Mon, 22 Jul 2024 15:01:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gC05LVd0nmaFVgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 22 Jul 2024 15:01:43 +0000
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
X-Inumbo-ID: 4f6dea0a-483b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721660504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8w2yj4tCoress7M4+t/E8kv6ccuo2Mv5ulBvjkeIp0o=;
	b=GlaVkVSednbL7HCSgkwFpoMPVG2c8InCkdzoLOgNKqOuTsSKH8jXlvmJphrYvaadSgBkBn
	nasSPcYGWZhE+zp44QKAUyMdzGLNZJDNr016LNAhcjwMa+ViJeJ5TJR4DywTY8EXiSkjEP
	Myg9Kg7m+EDJHlfmDXKgE4yYJoQ8rIM=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=GlaVkVSe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721660504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8w2yj4tCoress7M4+t/E8kv6ccuo2Mv5ulBvjkeIp0o=;
	b=GlaVkVSednbL7HCSgkwFpoMPVG2c8InCkdzoLOgNKqOuTsSKH8jXlvmJphrYvaadSgBkBn
	nasSPcYGWZhE+zp44QKAUyMdzGLNZJDNr016LNAhcjwMa+ViJeJ5TJR4DywTY8EXiSkjEP
	Myg9Kg7m+EDJHlfmDXKgE4yYJoQ8rIM=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/4] mini-os: cleanup of mm.c
Date: Mon, 22 Jul 2024 17:01:37 +0200
Message-ID: <20240722150141.31391-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.19 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim]
X-Spam-Level: 
X-Rspamd-Queue-Id: 079111FB73
X-Spam-Score: 0.19
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Bar: /

Some cleanups in mm.c: style, removal of unused stuff, optimizations.

Juergen Gross (4):
  mini-os: make mm.c coding style compliant
  mini-os: mm: remove not needed struct chunk_tail_st
  mini-os: mm: reduce buddy allocator list administration data
  mini-os: remove sanity_check()

 include/lib.h |   3 -
 mm.c          | 264 +++++++++++++++++++++-----------------------------
 2 files changed, 112 insertions(+), 155 deletions(-)

-- 
2.43.0


