Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A7F996D38
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 16:06:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814578.1228170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXKF-0005nQ-Vn; Wed, 09 Oct 2024 14:06:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814578.1228170; Wed, 09 Oct 2024 14:06:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXKF-0005l9-Sr; Wed, 09 Oct 2024 14:06:03 +0000
Received: by outflank-mailman (input) for mailman id 814578;
 Wed, 09 Oct 2024 14:06:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEV=RF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1syXKE-0005jJ-G5
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 14:06:02 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b8b9a69-8647-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 16:06:00 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C842E1F37E;
 Wed,  9 Oct 2024 14:05:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 98DE013A58;
 Wed,  9 Oct 2024 14:05:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id TliiI8WNBmftPAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 09 Oct 2024 14:05:57 +0000
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
X-Inumbo-ID: 9b8b9a69-8647-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728482757; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yqRBCP7FgP4VCqck1HlxmjV776MIZqqvSBZq0/0yHPI=;
	b=oJ5KmLAwWU5cwqnPcAht5hSe8Y6foCGJa73B1QB93e0Vr4n7EtakVB+nfABnUFH75sklUC
	g9Bh9CgxP1fuaWowvQVFgLEcQ9E7Ksoy3ufJ4NhpfKCddYGHuZ9v+dFnOgulfLYvfl8Vz4
	uF1r3fRCfC7wu3L228G03Hi2WBKsB+w=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728482757; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yqRBCP7FgP4VCqck1HlxmjV776MIZqqvSBZq0/0yHPI=;
	b=oJ5KmLAwWU5cwqnPcAht5hSe8Y6foCGJa73B1QB93e0Vr4n7EtakVB+nfABnUFH75sklUC
	g9Bh9CgxP1fuaWowvQVFgLEcQ9E7Ksoy3ufJ4NhpfKCddYGHuZ9v+dFnOgulfLYvfl8Vz4
	uF1r3fRCfC7wu3L228G03Hi2WBKsB+w=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH v2] add config support for each Xen library
Date: Wed,  9 Oct 2024 16:05:54 +0200
Message-ID: <20241009140554.1084-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Instead of adding all or no Xen library (controlled by CONFIG_XC),
support a dedicated config option for each library instead,
defaulting to disabled.

As it is no longer needed now, drop the CONFIG_XC support.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- merge patches of the V1 series (Samuel Thibault)

Note: do not apply to the tree until the related Xen series
"stubdom: prepare more fine grained Xen library usage" has been
applied.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Config.mk | 11 +++++++++--
 Makefile  | 18 +++++++++++++++++-
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/Config.mk b/Config.mk
index f2d1f0ae..f59a0cf4 100644
--- a/Config.mk
+++ b/Config.mk
@@ -193,6 +193,15 @@ CONFIG-n += CONFIG_9PFRONT
 CONFIG-n += CONFIG_TPM_TIS
 CONFIG-n += CONFIG_TPMBACK
 CONFIG-n += CONFIG_BALLOON
+CONFIG-n += CONFIG_LIBXENCALL
+CONFIG-n += CONFIG_LIBXENCTRL
+CONFIG-n += CONFIG_LIBXENDEVICEMODEL
+CONFIG-n += CONFIG_LIBXENEVTCHN
+CONFIG-n += CONFIG_LIBXENFOREIGNMEMORY
+CONFIG-n += CONFIG_LIBXENGNTTAB
+CONFIG-n += CONFIG_LIBXENGUEST
+CONFIG-n += CONFIG_LIBXENTOOLCORE
+CONFIG-n += CONFIG_LIBXENTOOLLOG
 # Setting CONFIG_USE_XEN_CONSOLE copies all print output to the Xen emergency
 # console apart of standard dom0 handled console.
 CONFIG-n += CONFIG_USE_XEN_CONSOLE
@@ -201,8 +210,6 @@ CONFIG-y += CONFIG_PARAVIRT
 else
 CONFIG-n += CONFIG_PARAVIRT
 endif
-# Support legacy CONFIG_XC value
-CONFIG_XC ?= $(libc)
 
 CONFIG-$(lwip) += CONFIG_LWIP
 
diff --git a/Makefile b/Makefile
index 6c8df8b5..ffa8d1a8 100644
--- a/Makefile
+++ b/Makefile
@@ -123,23 +123,39 @@ endif
 OBJS := $(filter-out $(OBJ_DIR)/lwip%.o $(LWO), $(OBJS))
 
 ifeq ($(libc),y)
-ifeq ($(CONFIG_XC),y)
+ifeq ($(CONFIG_LIBXENTOOLCORE),y)
 APP_LDLIBS += -L$(TOOLCORE_PATH) -whole-archive -lxentoolcore -no-whole-archive
 LIBS += $(TOOLCORE_PATH)/libxentoolcore.a
+endif
+ifeq ($(CONFIG_LIBXENTOOLLOG),y)
 APP_LDLIBS += -L$(TOOLLOG_PATH) -whole-archive -lxentoollog -no-whole-archive
 LIBS += $(TOOLLOG_PATH)/libxentoollog.a
+endif
+ifeq ($(CONFIG_LIBXENEVTCHN),y)
 APP_LDLIBS += -L$(EVTCHN_PATH) -whole-archive -lxenevtchn -no-whole-archive
 LIBS += $(EVTCHN_PATH)/libxenevtchn.a
+endif
+ifeq ($(CONFIG_LIBXENGNTTAB),y)
 APP_LDLIBS += -L$(GNTTAB_PATH) -whole-archive -lxengnttab -no-whole-archive
 LIBS += $(GNTTAB_PATH)/libxengnttab.a
+endif
+ifeq ($(CONFIG_LIBXENCALL),y)
 APP_LDLIBS += -L$(CALL_PATH) -whole-archive -lxencall -no-whole-archive
 LIBS += $(CALL_PATH)/libxencall.a
+endif
+ifeq ($(CONFIG_LIBXENFOREIGNMEMORY),y)
 APP_LDLIBS += -L$(FOREIGNMEMORY_PATH) -whole-archive -lxenforeignmemory -no-whole-archive
 LIBS += $(FOREIGNMEMORY_PATH)/libxenforeignmemory.a
+endif
+ifeq ($(CONFIG_LIBXENDEVICEMODEL),y)
 APP_LDLIBS += -L$(DEVICEMODEL_PATH) -whole-archive -lxendevicemodel -no-whole-archive
 LIBS += $(DEVICEMODEL_PATH)/libxendevicemodel.a
+endif
+ifeq ($(CONFIG_LIBXENGUEST),y)
 APP_LDLIBS += -L$(GUEST_PATH) -whole-archive -lxenguest -no-whole-archive
 LIBS += $(GUEST_PATH)/libxenguest.a
+endif
+ifeq ($(CONFIG_LIBXENCTRL),y)
 APP_LDLIBS += -L$(CTRL_PATH) -whole-archive -lxenctrl -no-whole-archive
 LIBS += $(CTRL_PATH)/libxenctrl.a
 endif
-- 
2.43.0


