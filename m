Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BDB942F82
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 15:00:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768589.1179448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ8wS-0003OY-E8; Wed, 31 Jul 2024 13:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768589.1179448; Wed, 31 Jul 2024 13:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ8wS-0003LU-9t; Wed, 31 Jul 2024 13:00:32 +0000
Received: by outflank-mailman (input) for mailman id 768589;
 Wed, 31 Jul 2024 13:00:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q60C=O7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sZ8wR-0003KO-LW
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 13:00:31 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dcc4e5f0-4f3c-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 15:00:30 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DBC041F833;
 Wed, 31 Jul 2024 13:00:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9DB0B13297;
 Wed, 31 Jul 2024 13:00:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id y+qaJGw1qmbeWAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 31 Jul 2024 13:00:28 +0000
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
X-Inumbo-ID: dcc4e5f0-4f3c-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1722430828; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hpSSf1738sWC9fHR0jGFAPQBcPotnWSurDV4E82jGpw=;
	b=LNR88QzGSLEUWV0lDQUE5eUCmpS/11RQ6N4GenYLFjD4PoLHARip/vjkbaDasmuO/jwEfm
	qB1joTOj6HD3a5jOw/u+o3Q8G92J9xnHLrL0b1hkE3LzA+I7WkfF6yc9iVDBvAhXi3MzZI
	9qO99E9I2pWnV3Oe7aKMjK8TLfStB28=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=LNR88QzG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1722430828; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hpSSf1738sWC9fHR0jGFAPQBcPotnWSurDV4E82jGpw=;
	b=LNR88QzGSLEUWV0lDQUE5eUCmpS/11RQ6N4GenYLFjD4PoLHARip/vjkbaDasmuO/jwEfm
	qB1joTOj6HD3a5jOw/u+o3Q8G92J9xnHLrL0b1hkE3LzA+I7WkfF6yc9iVDBvAhXi3MzZI
	9qO99E9I2pWnV3Oe7aKMjK8TLfStB28=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/3] mini-os: mm: use a generic page table walker
Date: Wed, 31 Jul 2024 15:00:23 +0200
Message-ID: <20240731130026.8467-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.81 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.81
X-Rspamd-Queue-Id: DBC041F833

Instead of open coding a page table walk multiple times, use a generic
page table walker instead.

This new page table walker will be used later for kexec support, too.

Juergen Gross (3):
  mini-os: mm: introduce generic page table walk function
  mini-os: mm: switch need_pgt() to use walk_pt()
  mini-os: mm: convert set_readonly() to use walk_pt()

 arch/x86/mm.c | 337 ++++++++++++++++++++++++++++----------------------
 1 file changed, 187 insertions(+), 150 deletions(-)

-- 
2.43.0


