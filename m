Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E02299A3E0
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 14:28:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817012.1231117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szEkO-0005Jr-KF; Fri, 11 Oct 2024 12:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817012.1231117; Fri, 11 Oct 2024 12:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szEkO-0005Gv-Gx; Fri, 11 Oct 2024 12:27:56 +0000
Received: by outflank-mailman (input) for mailman id 817012;
 Fri, 11 Oct 2024 12:27:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5FLX=RH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1szEkN-0005Gp-67
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 12:27:55 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cc3312a-87cc-11ef-a0bd-8be0dac302b0;
 Fri, 11 Oct 2024 14:27:53 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1E7B121FC9;
 Fri, 11 Oct 2024 12:27:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DEBE7136E0;
 Fri, 11 Oct 2024 12:27:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id bFPjNMgZCWfkagAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 11 Oct 2024 12:27:52 +0000
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
X-Inumbo-ID: 3cc3312a-87cc-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728649673; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=mSeU2If84l66PDOJ59XMLcV7XLr9GTHLce28wgBx0f0=;
	b=lWFcp1WphKFXgNm+inqiBzipp4RIZjt72yYvDN0mlWb3D2FPKylLVXjslI3k/u3lsV5/Qs
	aF3GcU74vCQEpy24blbDE8sdm/soDFp6Ifu3hvN8iiOU9NTtAfw+2rH4MfcI9DF3ERII4o
	3RLAGCNSdWIyjZV1a0r5zVsCuGX9exM=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728649673; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=mSeU2If84l66PDOJ59XMLcV7XLr9GTHLce28wgBx0f0=;
	b=lWFcp1WphKFXgNm+inqiBzipp4RIZjt72yYvDN0mlWb3D2FPKylLVXjslI3k/u3lsV5/Qs
	aF3GcU74vCQEpy24blbDE8sdm/soDFp6Ifu3hvN8iiOU9NTtAfw+2rH4MfcI9DF3ERII4o
	3RLAGCNSdWIyjZV1a0r5zVsCuGX9exM=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.12-rc3
Date: Fri, 11 Oct 2024 14:27:52 +0200
Message-ID: <20241011122752.13233-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.12a-rc3-tag

xen: branch for v6.12-rc3

It contains a single fix for topology information of Xen PV guests.

Thanks.

Juergen

 arch/x86/xen/enlighten_pv.c | 4 ++++
 1 file changed, 4 insertions(+)

Juergen Gross (1):
      x86/xen: mark boot CPU of PV guest in MSR_IA32_APICBASE

