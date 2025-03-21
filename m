Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C309A6B7C9
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 10:41:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923751.1327171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYsp-0003WJ-VC; Fri, 21 Mar 2025 09:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923751.1327171; Fri, 21 Mar 2025 09:41:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYsp-0003UW-Rd; Fri, 21 Mar 2025 09:41:43 +0000
Received: by outflank-mailman (input) for mailman id 923751;
 Fri, 21 Mar 2025 09:41:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wue=WI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tvYjG-00033C-4Z
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 09:31:50 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50b43586-0637-11f0-9ea1-5ba50f476ded;
 Fri, 21 Mar 2025 10:31:49 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A41C721D84;
 Fri, 21 Mar 2025 09:31:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 61F6C139AA;
 Fri, 21 Mar 2025 09:31:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ej9tFgQy3WdUGwAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 21 Mar 2025 09:31:48 +0000
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
X-Inumbo-ID: 50b43586-0637-11f0-9ea1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742549508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rI2ieuGEA6udzp8fMeYy10hSLLdHyPPXbjrCTmqils8=;
	b=YtFzqt/iQ7fECJZMX4n5dQLvSCjaMyKihRjazv1Jg642rAru2yf+OwAHv0TqOOYHO9rK1e
	+FswF0SmeVEdu0EqUrQrIA67dALheZOBnPO2I5PiCklIKCzH1BsRIW4G2nBNMQu9bwoJ0P
	X8AY9S6u10QZSTU9Bgc2dErnZBEgxK0=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742549508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rI2ieuGEA6udzp8fMeYy10hSLLdHyPPXbjrCTmqils8=;
	b=YtFzqt/iQ7fECJZMX4n5dQLvSCjaMyKihRjazv1Jg642rAru2yf+OwAHv0TqOOYHO9rK1e
	+FswF0SmeVEdu0EqUrQrIA67dALheZOBnPO2I5PiCklIKCzH1BsRIW4G2nBNMQu9bwoJ0P
	X8AY9S6u10QZSTU9Bgc2dErnZBEgxK0=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH v2 0/2] 9pfs: add some file operation hooks
Date: Fri, 21 Mar 2025 10:31:43 +0100
Message-ID: <20250321093145.17882-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.77 / 50.00];
	BAYES_HAM(-2.97)[99.88%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid]
X-Spam-Score: -2.77
X-Spam-Flag: NO

For being able to store the Xenstore state in preparation of a live
update operation, 9pfront is needing support for fstat and lseek.

Changes in V2:
- addressed comment for patch 1

Juergen Gross (2):
  9pfs: add fstat file operation hook
  9pfs: add lseek file operation hook

 9pfront.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

-- 
2.43.0


