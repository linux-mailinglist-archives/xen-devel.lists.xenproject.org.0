Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C4D998C71
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 17:55:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816342.1230574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syvVZ-0002L5-LD; Thu, 10 Oct 2024 15:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816342.1230574; Thu, 10 Oct 2024 15:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syvVZ-0002Ii-I0; Thu, 10 Oct 2024 15:55:21 +0000
Received: by outflank-mailman (input) for mailman id 816342;
 Thu, 10 Oct 2024 15:55:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rEWG=RG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1syvVY-0002EK-1K
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 15:55:20 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 093ee287-8720-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 17:55:13 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 652AB1FB68;
 Thu, 10 Oct 2024 15:55:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 29E5713A6E;
 Thu, 10 Oct 2024 15:55:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id O0GECOH4B2erBAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 10 Oct 2024 15:55:13 +0000
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
X-Inumbo-ID: 093ee287-8720-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728575713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6UMD6Lbjq0ddLxOkXGyThPw2L3Nb6hzF/du4wZSluoo=;
	b=gAsNP5qStKlIhyGSZRwcBD8SbIxRReGo+gW3IpyBOBiJuZkFTyP8vtOaQZ4QyiU5cA+Ow+
	Bx3y7DrQ9BcUsGoihfrqaaOAXk8HBKVDikrReH8Yqo3rDe/GharnADQ2CtBfcdjnRmlDDN
	qt33v7GNsgD6798mh0P0rck+RtMaaa4=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728575713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6UMD6Lbjq0ddLxOkXGyThPw2L3Nb6hzF/du4wZSluoo=;
	b=gAsNP5qStKlIhyGSZRwcBD8SbIxRReGo+gW3IpyBOBiJuZkFTyP8vtOaQZ4QyiU5cA+Ow+
	Bx3y7DrQ9BcUsGoihfrqaaOAXk8HBKVDikrReH8Yqo3rDe/GharnADQ2CtBfcdjnRmlDDN
	qt33v7GNsgD6798mh0P0rck+RtMaaa4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 2/3] tools/xenstored: remove unneeded libxenguest reference
Date: Thu, 10 Oct 2024 17:54:58 +0200
Message-ID: <20241010155459.22389-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241010155459.22389-1-jgross@suse.com>
References: <20241010155459.22389-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.992];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Today the xenstored Makefile contains an unneeded reference to the
not used libxenguest library.

Remove it.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/Makefile.common | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/xenstored/Makefile.common b/tools/xenstored/Makefile.common
index ef63ef650c..27fdb3b49e 100644
--- a/tools/xenstored/Makefile.common
+++ b/tools/xenstored/Makefile.common
@@ -13,7 +13,6 @@ XENSTORED_OBJS-$(CONFIG_MiniOS) += minios.o lu_minios.o
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
 CFLAGS += $(CFLAGS_libxenevtchn)
 CFLAGS += $(CFLAGS_libxenctrl)
-CFLAGS += $(CFLAGS_libxenguest)
 CFLAGS += $(CFLAGS_libxentoolcore)
 
 $(XENSTORED_OBJS-y): CFLAGS += $(CFLAGS_libxengnttab)
-- 
2.43.0


