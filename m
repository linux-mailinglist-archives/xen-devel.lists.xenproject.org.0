Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEF49ACAF6
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 15:18:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824667.1238836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3bFX-000323-Jq; Wed, 23 Oct 2024 13:18:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824667.1238836; Wed, 23 Oct 2024 13:18:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3bFX-00030O-Go; Wed, 23 Oct 2024 13:18:07 +0000
Received: by outflank-mailman (input) for mailman id 824667;
 Wed, 23 Oct 2024 13:18:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W0hE=RT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1t3b8c-0006Ra-Ff
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 13:10:58 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a5d39e4-9140-11ef-99a3-01e77a169b0f;
 Wed, 23 Oct 2024 15:10:52 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4A0401FDA3;
 Wed, 23 Oct 2024 13:10:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 218B613A63;
 Wed, 23 Oct 2024 13:10:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id VoOzBtv1GGcIeAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 23 Oct 2024 13:10:51 +0000
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
X-Inumbo-ID: 3a5d39e4-9140-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1729689051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LFewm/PyRpGCHNCNmkuqU9cF9n06m4bxHZhH7BxdXMU=;
	b=CnO/byiXVHpDym0EN2ob8KIWqZIg544Q0AT9OKrmSamYzGK7DbTX/pH2jGl1AZL1I/Flxy
	OmYU0k6zHJGnh+bZa/c4cd6vHDcLesqG75MFXWlbaiK7vvL4BN2gRAIeeZ9MXKsGdKBVqT
	+CTAFc6NsqdKiNP+UmH0k86AAnd0BOM=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="CnO/byiX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1729689051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LFewm/PyRpGCHNCNmkuqU9cF9n06m4bxHZhH7BxdXMU=;
	b=CnO/byiXVHpDym0EN2ob8KIWqZIg544Q0AT9OKrmSamYzGK7DbTX/pH2jGl1AZL1I/Flxy
	OmYU0k6zHJGnh+bZa/c4cd6vHDcLesqG75MFXWlbaiK7vvL4BN2gRAIeeZ9MXKsGdKBVqT
	+CTAFc6NsqdKiNP+UmH0k86AAnd0BOM=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH] config: add support for libxenmanage
Date: Wed, 23 Oct 2024 15:10:48 +0200
Message-ID: <20241023131048.32240-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4A0401FDA3
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Add CONFIG_LIBXENMANAGE support.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
Please note that this patch should be committed only after the related
Xen patch "tools/libs: add a new libxenmanage library" has been Acked,
as otherwise it should either be dropped (in case the approach of
adding a new library is being rejected) or changed (in case the name
of the new library needs to be modified)!

 Config.mk | 2 ++
 Makefile  | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/Config.mk b/Config.mk
index f59a0cf4..e493533a 100644
--- a/Config.mk
+++ b/Config.mk
@@ -46,6 +46,7 @@ GNTTAB_PATH ?= $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/gnttab
 CALL_PATH ?= $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/call
 FOREIGNMEMORY_PATH ?= $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/foreignmemory
 DEVICEMODEL_PATH ?= $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/devicemodel
+MANAGE_PATH ?= $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/manage
 CTRL_PATH ?= $(XEN_ROOT)/stubdom/libxc-$(MINIOS_TARGET_ARCH)
 GUEST_PATH ?= $(XEN_ROOT)/stubdom/libxc-$(MINIOS_TARGET_ARCH)
 else
@@ -202,6 +203,7 @@ CONFIG-n += CONFIG_LIBXENGNTTAB
 CONFIG-n += CONFIG_LIBXENGUEST
 CONFIG-n += CONFIG_LIBXENTOOLCORE
 CONFIG-n += CONFIG_LIBXENTOOLLOG
+CONFIG-n += CONFIG_LIBXENMANAGE
 # Setting CONFIG_USE_XEN_CONSOLE copies all print output to the Xen emergency
 # console apart of standard dom0 handled console.
 CONFIG-n += CONFIG_USE_XEN_CONSOLE
diff --git a/Makefile b/Makefile
index ffa8d1a8..d094858a 100644
--- a/Makefile
+++ b/Makefile
@@ -159,6 +159,10 @@ ifeq ($(CONFIG_LIBXENCTRL),y)
 APP_LDLIBS += -L$(CTRL_PATH) -whole-archive -lxenctrl -no-whole-archive
 LIBS += $(CTRL_PATH)/libxenctrl.a
 endif
+ifeq ($(CONFIG_LIBXENMANAGE),y)
+APP_LDLIBS += -L$(MANAGE_PATH) -whole-archive -lxenmanage -no-whole-archive
+LIBS += $(MANAGE_PATH)/libxenmanage.a
+endif
 APP_LDLIBS += -lpci
 APP_LDLIBS += -lz
 APP_LDLIBS += -lm
-- 
2.43.0


