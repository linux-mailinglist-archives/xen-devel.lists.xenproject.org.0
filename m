Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B904AF0DB2
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:20:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030433.1404113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWshw-0004Pm-1V; Wed, 02 Jul 2025 08:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030433.1404113; Wed, 02 Jul 2025 08:20:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWshv-0004MX-N4; Wed, 02 Jul 2025 08:20:43 +0000
Received: by outflank-mailman (input) for mailman id 1030433;
 Wed, 02 Jul 2025 08:20:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uWsbQ-00082X-QU
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:14:00 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8188ff02-571c-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 10:13:59 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 047E51F76B;
 Wed,  2 Jul 2025 08:13:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CF10213A24;
 Wed,  2 Jul 2025 08:13:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mGctMUbqZGhbSQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 02 Jul 2025 08:13:58 +0000
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
X-Inumbo-ID: 8188ff02-571c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZRCeeHYAZX30u0CV5OETlVsm4bHFhhMFufeH4FMn+N0=;
	b=dpMRKraZzMJzlGpf14sfq/88yWICScoZbVVspc/xbXT70FZ6rxyYuH04YJ+B06g3u5ACSI
	SWp4voOugJ9WgumnG1awE6Xg+ZZ+ODkDFpOeeoMNu88L0HbTjsGKnFvN4IWYOLM+/Arghf
	6GM/VbrJJlYAlQeE+A3MyX56InCwWpE=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZRCeeHYAZX30u0CV5OETlVsm4bHFhhMFufeH4FMn+N0=;
	b=dpMRKraZzMJzlGpf14sfq/88yWICScoZbVVspc/xbXT70FZ6rxyYuH04YJ+B06g3u5ACSI
	SWp4voOugJ9WgumnG1awE6Xg+ZZ+ODkDFpOeeoMNu88L0HbTjsGKnFvN4IWYOLM+/Arghf
	6GM/VbrJJlYAlQeE+A3MyX56InCwWpE=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 11/19] mini-os: config: add support for config items with numerical values
Date: Wed,  2 Jul 2025 10:12:46 +0200
Message-ID: <20250702081254.14383-12-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702081254.14383-1-jgross@suse.com>
References: <20250702081254.14383-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 

Add support for a Mini-OS config file containing config items with
numerical values, e.g. CONFIG_FOO=7.

Signed-off-by: Juergen Gross <jgross@suse.com>
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


