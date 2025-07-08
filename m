Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF41AFC2DD
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 08:38:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035968.1408413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ1xZ-0002sf-9E; Tue, 08 Jul 2025 06:37:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035968.1408413; Tue, 08 Jul 2025 06:37:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ1xZ-0002pm-4G; Tue, 08 Jul 2025 06:37:45 +0000
Received: by outflank-mailman (input) for mailman id 1035968;
 Tue, 08 Jul 2025 06:37:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lAOS=ZV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uZ1xW-0002pb-Ty
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 06:37:42 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c21818e-5bc6-11f0-a316-13f23c93f187;
 Tue, 08 Jul 2025 08:37:41 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6070621163;
 Tue,  8 Jul 2025 06:37:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2B79513A68;
 Tue,  8 Jul 2025 06:37:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 77AgCbS8bGg6NAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 08 Jul 2025 06:37:40 +0000
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
X-Inumbo-ID: 0c21818e-5bc6-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751956660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7cZ7nybzTpaKQKTLfaqiH+YahQsHBpiZj2w8QWGidzY=;
	b=pMRJqxu6BNCKsbDABIxiRUucT7i4TbVT0WN2u70cVeOEyGtdjLUCD94zmW9jnkkFcudF6i
	oHDq1jjlfNONcLaPNvgdlsZ4Z79pFDkTWxFIrvLeXJZvpov6U5dlw6CGjYA2DovYE1WNti
	L1cUCq3KBFh3OV1LWdc9VRkAj+MCSEk=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751956660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7cZ7nybzTpaKQKTLfaqiH+YahQsHBpiZj2w8QWGidzY=;
	b=pMRJqxu6BNCKsbDABIxiRUucT7i4TbVT0WN2u70cVeOEyGtdjLUCD94zmW9jnkkFcudF6i
	oHDq1jjlfNONcLaPNvgdlsZ4Z79pFDkTWxFIrvLeXJZvpov6U5dlw6CGjYA2DovYE1WNti
	L1cUCq3KBFh3OV1LWdc9VRkAj+MCSEk=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 0/2] x86: don't use a memory page for mapping the shared info page
Date: Tue,  8 Jul 2025 08:37:36 +0200
Message-ID: <20250708063738.18994-1-jgross@suse.com>
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

This is a small add-on series after the live-update series sent a week
ago.

I realized that having the shared info page in the normal RAM area is
a bad idea when considering kexec, as the new kernel might want it at
a different location.

So this series is moving the shared info page away from the RAM areas,
resulting in a net win of one memory page.

Juergen Gross (2):
  mm: provide a way to do very early page table allocations
  x86: don't use a memory page for mapping the shared info page

 arch/x86/mm.c     | 23 +++++++++++++++--------
 arch/x86/setup.c  | 15 ++++++++-------
 arch/x86/x86_32.S |  7 +------
 arch/x86/x86_64.S |  7 +------
 hypervisor.c      | 15 +++++++++++----
 5 files changed, 36 insertions(+), 31 deletions(-)

-- 
2.43.0


