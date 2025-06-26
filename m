Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E44AEA222
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 17:14:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026650.1401835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUoIV-0003uF-Cx; Thu, 26 Jun 2025 15:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026650.1401835; Thu, 26 Jun 2025 15:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUoIV-0003si-9w; Thu, 26 Jun 2025 15:13:55 +0000
Received: by outflank-mailman (input) for mailman id 1026650;
 Thu, 26 Jun 2025 15:13:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zZyX=ZJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uUoIT-0003sc-3D
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 15:13:53 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2899ae2f-52a0-11f0-b894-0df219b8e170;
 Thu, 26 Jun 2025 17:13:47 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3FCFB2117A;
 Thu, 26 Jun 2025 15:13:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D8DB813188;
 Thu, 26 Jun 2025 15:13:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id d7Y5M6pjXWjnOgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 26 Jun 2025 15:13:46 +0000
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
X-Inumbo-ID: 2899ae2f-52a0-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750950827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BUHGghIHe7WPy3rBL11hpqHMD1d3lwvA0GNEh4izy4c=;
	b=LKTRNdSir2I8WBpDDXchIB8olZ8882JMTyTK2aLSSNe6k+Rqx7ZU+LFk724glmHIEs72Pz
	RuImcUYcruQLVxzt2KWnZfxBVUMrCjqY1IOcjvZ9ViFC05vQ4+DhOhqYP5dHoLr3+Aq+kT
	0fg+Jwfn3opi4kdCG7YlpGaM27kI1cM=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=LKTRNdSi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750950827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BUHGghIHe7WPy3rBL11hpqHMD1d3lwvA0GNEh4izy4c=;
	b=LKTRNdSir2I8WBpDDXchIB8olZ8882JMTyTK2aLSSNe6k+Rqx7ZU+LFk724glmHIEs72Pz
	RuImcUYcruQLVxzt2KWnZfxBVUMrCjqY1IOcjvZ9ViFC05vQ4+DhOhqYP5dHoLr3+Aq+kT
	0fg+Jwfn3opi4kdCG7YlpGaM27kI1cM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/3] stubdom/grub: avoid relying on start_info definition
Date: Thu, 26 Jun 2025 17:13:41 +0200
Message-ID: <20250626151344.6971-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 3FCFB2117A
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

With the related change having been added to Mini-OS, the single V1
patch can now be expanded to a 3 patch series, especially meant to
untangle the close dependencies between grub-pv and Mini-OS internals.

Changes in V2:
- add comment to patch 1
- added patches 2+3

Juergen Gross (3):
  stubdom/grub: avoid relying on start_info definition
  Config: update Mini-OS commit id
  stubdom/grub: swap start_info usage with start_info_ptr

 Config.mk            |  2 +-
 stubdom/grub/kexec.c | 26 +++++++++++++-------------
 2 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.43.0


