Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8461A6A0B9
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 08:49:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921377.1325228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvAeg-00054X-Bh; Thu, 20 Mar 2025 07:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921377.1325228; Thu, 20 Mar 2025 07:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvAeg-00052O-8g; Thu, 20 Mar 2025 07:49:30 +0000
Received: by outflank-mailman (input) for mailman id 921377;
 Thu, 20 Mar 2025 07:49:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=496r=WH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tvAee-00052A-Jn
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 07:49:28 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8f25f2b-055f-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 08:49:27 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 645B921EDD;
 Thu, 20 Mar 2025 07:49:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2523013757;
 Thu, 20 Mar 2025 07:49:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YnWOB4bI22d2VQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 20 Mar 2025 07:49:26 +0000
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
X-Inumbo-ID: d8f25f2b-055f-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742456966; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=F+g+wm9A9fsxM6hgQJRPcZj5vTjjhE0Om5U0CGzeX/o=;
	b=SyjDu+3pgR8t7x8C68rf0Sv7+YSl9BHCcQR1xTTWzn/iJXmvLAaEKz6Nzr5DKiTZvvRAE7
	nawv/X2+gIf314LGcGMBVzbf4jSOyvjvqyO23Z9HAbhiW3eLZ/kbj9W0wVS8KRJBR4KGhE
	j0HXwrPvqYS9ubMOl6c6iOuKM9FDzQ4=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=SyjDu+3p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742456966; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=F+g+wm9A9fsxM6hgQJRPcZj5vTjjhE0Om5U0CGzeX/o=;
	b=SyjDu+3pgR8t7x8C68rf0Sv7+YSl9BHCcQR1xTTWzn/iJXmvLAaEKz6Nzr5DKiTZvvRAE7
	nawv/X2+gIf314LGcGMBVzbf4jSOyvjvqyO23Z9HAbhiW3eLZ/kbj9W0wVS8KRJBR4KGhE
	j0HXwrPvqYS9ubMOl6c6iOuKM9FDzQ4=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 0/2] 9pfs: add some file operation hooks
Date: Thu, 20 Mar 2025 08:49:22 +0100
Message-ID: <20250320074924.8080-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 645B921EDD
X-Spam-Level: 
X-Spamd-Result: default: False [-2.97 / 50.00];
	BAYES_HAM(-2.96)[99.81%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.97
X-Spam-Flag: NO

For being able to store the Xenstore state in preparation of a live
update operation, 9pfront is needing support for fstat and lseek.

Juergen Gross (2):
  Mini-OS: 9pfs: add fstat file operation hook
  Mini-OS: 9pfs: add lseek file operation hook

 9pfront.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

-- 
2.43.0


