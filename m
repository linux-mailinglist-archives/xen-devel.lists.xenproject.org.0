Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 167D380CB55
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 14:49:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651885.1017722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCgeE-00042t-0a; Mon, 11 Dec 2023 13:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651885.1017722; Mon, 11 Dec 2023 13:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCgeD-0003yq-Te; Mon, 11 Dec 2023 13:48:37 +0000
Received: by outflank-mailman (input) for mailman id 651885;
 Mon, 11 Dec 2023 13:48:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g7EY=HW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rCgeD-0003yP-1U
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 13:48:37 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f82f0309-982b-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 14:48:33 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1174C223E4;
 Mon, 11 Dec 2023 13:48:30 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id CFEFB138FF;
 Mon, 11 Dec 2023 13:48:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id na14MS0Td2V5XAAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 11 Dec 2023 13:48:29 +0000
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
X-Inumbo-ID: f82f0309-982b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702302510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rISOabk/O5Wf7niWMjEmE4W7QdZVELpmEGuNpHII/3Y=;
	b=GayPgh4uEr/XQfiNmtIrAVLIfKc2qCxjO1epPhSmxJjSwIRHsyqX3G3jUDJzX3h1avr6SD
	c/xuoI8ve4WQz2D83opkQJcRYDLx386YXunlxQ7Jd4T1E1wibOmNxDzB9BSInJwNRgjHZ6
	8W64uOoaI1TnCERSJ2jlKGqbsJVcKMI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702302510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rISOabk/O5Wf7niWMjEmE4W7QdZVELpmEGuNpHII/3Y=;
	b=GayPgh4uEr/XQfiNmtIrAVLIfKc2qCxjO1epPhSmxJjSwIRHsyqX3G3jUDJzX3h1avr6SD
	c/xuoI8ve4WQz2D83opkQJcRYDLx386YXunlxQ7Jd4T1E1wibOmNxDzB9BSInJwNRgjHZ6
	8W64uOoaI1TnCERSJ2jlKGqbsJVcKMI=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/3] Mini-OS: fix and cleanup of event handling
Date: Mon, 11 Dec 2023 14:48:24 +0100
Message-Id: <20231211134827.7130-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: ***************
X-Spam-Score: 15.00
X-Spam-Flag: YES
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=GayPgh4u;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=fail (smtp-out1.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:98 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [0.98 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 DMARC_POLICY_ALLOW(0.00)[suse.com,quarantine];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.01)[50.54%];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(0.00)[-all];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 SPAM_FLAG(5.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 WHITELIST_DMARC(-7.00)[suse.com:D:+];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 0.98
X-Rspamd-Queue-Id: 1174C223E4
X-Spam-Flag: NO

Patch 1 fixes an issue when running as PVH guest
Patches 2 + 3 are cleanups

Juergen Gross (3):
  Mini-OS: call event handlers always with interrupts off
  Mini-OS: drop in_callback variable
  Mini-OS: cleanup hypervisor.c

 hypervisor.c         | 94 +++++++++++++++++++-------------------------
 include/hypervisor.h |  2 -
 sched.c              | 11 ------
 3 files changed, 40 insertions(+), 67 deletions(-)

-- 
2.35.3


