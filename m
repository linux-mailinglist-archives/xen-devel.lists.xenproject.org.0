Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF4FB05C99
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 15:34:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044250.1414330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfnG-0007vA-Lc; Tue, 15 Jul 2025 13:34:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044250.1414330; Tue, 15 Jul 2025 13:34:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfnG-0007tY-Im; Tue, 15 Jul 2025 13:34:02 +0000
Received: by outflank-mailman (input) for mailman id 1044250;
 Tue, 15 Jul 2025 13:34:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7giJ=Z4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ubfjg-0000p6-6b
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 13:30:20 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8402f10-617f-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 15:30:16 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 330CC21204;
 Tue, 15 Jul 2025 13:30:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EFE5413A68;
 Tue, 15 Jul 2025 13:30:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jlbmOOdXdmhaNwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 15 Jul 2025 13:30:15 +0000
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
X-Inumbo-ID: d8402f10-617f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752586216; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0y6tolrzUxQrHWx/8IlHGOKqrdgtUprT6TUKSYQpynQ=;
	b=m4OQMCDEdQ8Q2/LemCbTQ+Gq+C83J+toOJf7ct1vK4rcVkI7bqGrkUoeIk1YIj/fZom61m
	c1DTFC0mJws10bv4Ype5QiArxyxkdmjuN9KaiHnUge2dSt4/CvDBQHAUaS03gblcHJ4l1I
	Z0pH5LfRlpfmi8Z2fMhqBo1EA69WpNA=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=m4OQMCDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752586216; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0y6tolrzUxQrHWx/8IlHGOKqrdgtUprT6TUKSYQpynQ=;
	b=m4OQMCDEdQ8Q2/LemCbTQ+Gq+C83J+toOJf7ct1vK4rcVkI7bqGrkUoeIk1YIj/fZom61m
	c1DTFC0mJws10bv4Ype5QiArxyxkdmjuN9KaiHnUge2dSt4/CvDBQHAUaS03gblcHJ4l1I
	Z0pH5LfRlpfmi8Z2fMhqBo1EA69WpNA=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [MINI-OS PATCH v2 06/14] mini-os: config: add support for config items with numerical values
Date: Tue, 15 Jul 2025 15:29:28 +0200
Message-ID: <20250715132936.2798-7-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250715132936.2798-1-jgross@suse.com>
References: <20250715132936.2798-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 330CC21204
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[config.mk:url,suse.com:dkim,suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.01

Add support for a Mini-OS config file containing config items with
numerical values, e.g. CONFIG_FOO=7.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 Config.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Config.mk b/Config.mk
index e2afb1b4..b9675e61 100644
--- a/Config.mk
+++ b/Config.mk
@@ -178,6 +178,7 @@ endif
 # CONFIG-y contains all items defaulting to "y"
 # CONFIG-n contains all items defaulting to "n"
 # CONFIG-x contains all items being calculated if not set explicitly
+# CONFIG-val-y contains all items with numerical values, defaulting to 0
 CONFIG-y += CONFIG_START_NETWORK
 CONFIG-y += CONFIG_SPARSE_BSS
 CONFIG-y += CONFIG_BLKFRONT
@@ -219,6 +220,8 @@ CONFIG-$(lwip) += CONFIG_LWIP
 $(foreach i,$(CONFIG-y),$(eval $(i) ?= y))
 $(foreach i,$(CONFIG-n),$(eval $(i) ?= n))
 
+$(foreach i,$(CONFIG-val-y),$(eval $(i) ?= 0))
+
 CONFIG-x += CONFIG_LIBXS
 CONFIG_LIBXS ?= $(CONFIG_XENBUS)
 
@@ -226,6 +229,7 @@ CONFIG-all := $(CONFIG-y) $(CONFIG-n) $(CONFIG-x)
 
 # Export config items as compiler directives
 $(foreach i,$(CONFIG-all),$(eval DEFINES-$($(i)) += -D$(i)))
+$(foreach i,$(CONFIG-val-y),$(eval DEFINES-y += -D$(i)=$($(i))))
 
 DEFINES-y += -D__XEN_INTERFACE_VERSION__=$(XEN_INTERFACE_VERSION)
 
-- 
2.43.0


