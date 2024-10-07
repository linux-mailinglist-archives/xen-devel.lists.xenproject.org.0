Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53504992950
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 12:35:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811868.1224565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxl53-0003Nc-9F; Mon, 07 Oct 2024 10:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811868.1224565; Mon, 07 Oct 2024 10:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxl53-0003Lz-61; Mon, 07 Oct 2024 10:35:09 +0000
Received: by outflank-mailman (input) for mailman id 811868;
 Mon, 07 Oct 2024 10:35:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4XqV=RD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sxl51-0003GC-Ho
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 10:35:07 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0e0400a-8497-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 12:35:06 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E20621FD38;
 Mon,  7 Oct 2024 10:35:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B731C13786;
 Mon,  7 Oct 2024 10:35:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id O4kvK1i5A2d0KgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 07 Oct 2024 10:35:04 +0000
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
X-Inumbo-ID: d0e0400a-8497-11ef-a0bb-8be0dac302b0
Authentication-Results: smtp-out2.suse.de;
	none
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 1/2] add config support for each Xen library
Date: Mon,  7 Oct 2024 12:34:55 +0200
Message-ID: <20241007103456.14946-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007103456.14946-1-jgross@suse.com>
References: <20241007103456.14946-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: E20621FD38
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Instead of adding all or no Xen library (controlled by CONFIG_XC),
support a dedicated config option for each library instead. In order
to support older Xen stubdom build versions, let CONFIG_XC enable
all CONFIG_LIBXEN options.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Config.mk | 19 +++++++++++++++++++
 Makefile  | 18 +++++++++++++++++-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index f2d1f0ae..d0fbacac 100644
--- a/Config.mk
+++ b/Config.mk
@@ -212,6 +212,25 @@ $(foreach i,$(CONFIG-n),$(eval $(i) ?= n))
 CONFIG-x += CONFIG_LIBXS
 CONFIG_LIBXS ?= $(CONFIG_XENBUS)
 
+CONFIG-x += CONFIG_LIBXENCALL
+CONFIG-x += CONFIG_LIBXENCTRL
+CONFIG-x += CONFIG_LIBXENDEVICEMODEL
+CONFIG-x += CONFIG_LIBXENEVTCHN
+CONFIG-x += CONFIG_LIBXENFOREIGNMEMORY
+CONFIG-x += CONFIG_LIBXENGNTTAB
+CONFIG-x += CONFIG_LIBXENGUEST
+CONFIG-x += CONFIG_LIBXENTOOLCORE
+CONFIG-x += CONFIG_LIBXENTOOLLOG
+CONFIG_LIBXENCALL ?= $(CONFIG_XC)
+CONFIG_LIBXENCTRL ?= $(CONFIG_XC)
+CONFIG_LIBXENDEVICEMODEL ?= $(CONFIG_XC)
+CONFIG_LIBXENEVTCHN ?= $(CONFIG_XC)
+CONFIG_LIBXENFOREIGNMEMORY ?= $(CONFIG_XC)
+CONFIG_LIBXENGNTTAB ?= $(CONFIG_XC)
+CONFIG_LIBXENGUEST ?= $(CONFIG_XC)
+CONFIG_LIBXENTOOLCORE ?= $(CONFIG_XC)
+CONFIG_LIBXENTOOLLOG ?= $(CONFIG_XC)
+
 CONFIG-all := $(CONFIG-y) $(CONFIG-n) $(CONFIG-x)
 
 # Export config items as compiler directives
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


