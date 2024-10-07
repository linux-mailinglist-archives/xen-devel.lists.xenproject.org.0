Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0866E99294F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 12:35:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811867.1224556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxl50-00039V-UO; Mon, 07 Oct 2024 10:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811867.1224556; Mon, 07 Oct 2024 10:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxl50-00037G-R2; Mon, 07 Oct 2024 10:35:06 +0000
Received: by outflank-mailman (input) for mailman id 811867;
 Mon, 07 Oct 2024 10:35:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4XqV=RD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sxl4z-00035P-B4
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 10:35:05 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce010888-8497-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 12:35:01 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 58DB621C04;
 Mon,  7 Oct 2024 10:34:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1CFF713786;
 Mon,  7 Oct 2024 10:34:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id fYnqBFO5A2dgKgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 07 Oct 2024 10:34:59 +0000
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
X-Inumbo-ID: ce010888-8497-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728297299; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ZASSLIzfHqopUtGvOkhmKp1Hp3ymOFW1ke9KMIdGtSQ=;
	b=qWA/KZVtlbhcqxrzer4qaMDdaXGJe4OTqULyWuuERjuHGtJFJjogZRb9H3mE+fiZMZTrTu
	mXAHjbTMVDgP2228XqpIfaWQFfcBP8hN/ir/7IsfOVsAFjJtCljyF2axKV9BSy/DTA9ZlJ
	RJBua9GTHXGoI3k7PYoy07kXZAUXDAI=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728297299; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ZASSLIzfHqopUtGvOkhmKp1Hp3ymOFW1ke9KMIdGtSQ=;
	b=qWA/KZVtlbhcqxrzer4qaMDdaXGJe4OTqULyWuuERjuHGtJFJjogZRb9H3mE+fiZMZTrTu
	mXAHjbTMVDgP2228XqpIfaWQFfcBP8hN/ir/7IsfOVsAFjJtCljyF2axKV9BSy/DTA9ZlJ
	RJBua9GTHXGoI3k7PYoy07kXZAUXDAI=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 0/2] support individual Xen library use cases
Date: Mon,  7 Oct 2024 12:34:54 +0200
Message-ID: <20241007103456.14946-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.77
X-Spamd-Result: default: False [-2.77 / 50.00];
	BAYES_HAM(-2.97)[99.88%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Instead of using either none or all Xen libraries, support each
library individually.

This series needs to be applied only after the related Xen side series
"stubdom: prepare more fine grained Xen library usage" has been
applied.

Juergen Gross (2):
  mini-os: add config support for each Xen library
  mini-os: drop CONFIG_XC support

 Config.mk | 11 +++++++++--
 Makefile  | 18 +++++++++++++++++-
 2 files changed, 26 insertions(+), 3 deletions(-)

-- 
2.43.0


