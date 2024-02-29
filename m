Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D278A86C974
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 13:48:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687041.1069799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffqA-0004Yq-Lw; Thu, 29 Feb 2024 12:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687041.1069799; Thu, 29 Feb 2024 12:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffqA-0004Ww-IP; Thu, 29 Feb 2024 12:48:46 +0000
Received: by outflank-mailman (input) for mailman id 687041;
 Thu, 29 Feb 2024 12:48:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OAsO=KG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rffq8-0003qK-Ma
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 12:48:44 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df2c7477-d700-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 13:48:44 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B150C21CE4;
 Thu, 29 Feb 2024 12:48:43 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 865691329E;
 Thu, 29 Feb 2024 12:48:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id aaZVHyt94GUPIgAAn2gu4w
 (envelope-from <jgross@suse.com>); Thu, 29 Feb 2024 12:48:43 +0000
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
X-Inumbo-ID: df2c7477-d700-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709210923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/eJaaQzJFr9iaY84hbFZ6eF6VnkmvJwoY+5FWl4+J1Y=;
	b=rbS1Gdn1tpCoIIdJ7yCl1awe0yg1l8LML+1+2rg913jASv3h1+p20upRpaOOzRfFxNGuP2
	LdqI0IxiSDYwzsCLxwHktWNvJrLrqCVeu8vE7vRJ+b+wjrQ5OSHJAgjwDxKYtTIXOIy1ur
	8MJBOFPolqYbmY/DF9r+dxlBWKn8U5E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709210923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/eJaaQzJFr9iaY84hbFZ6eF6VnkmvJwoY+5FWl4+J1Y=;
	b=rbS1Gdn1tpCoIIdJ7yCl1awe0yg1l8LML+1+2rg913jASv3h1+p20upRpaOOzRfFxNGuP2
	LdqI0IxiSDYwzsCLxwHktWNvJrLrqCVeu8vE7vRJ+b+wjrQ5OSHJAgjwDxKYtTIXOIy1ur
	8MJBOFPolqYbmY/DF9r+dxlBWKn8U5E=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v9 2/6] stubdom: extend xenstore stubdom configs
Date: Thu, 29 Feb 2024 13:48:26 +0100
Message-Id: <20240229124830.13680-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240229124830.13680-1-jgross@suse.com>
References: <20240229124830.13680-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=rbS1Gdn1
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.67 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.82)[85.02%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[suse.com,ens-lyon.org,gmail.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 0.67
X-Rspamd-Queue-Id: B150C21CE4
X-Spam-Flag: NO

Extend the config files of the Xenstore stubdoms to include XENBUS
and 9PFRONT items in order to support file based logging.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
 stubdom/xenstore-minios.cfg    | 2 +-
 stubdom/xenstorepvh-minios.cfg | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/stubdom/xenstore-minios.cfg b/stubdom/xenstore-minios.cfg
index a41704bb6b..239da519b9 100644
--- a/stubdom/xenstore-minios.cfg
+++ b/stubdom/xenstore-minios.cfg
@@ -3,7 +3,7 @@ CONFIG_NETFRONT=n
 CONFIG_FBFRONT=n
 CONFIG_KBDFRONT=n
 CONFIG_CONSFRONT=n
-CONFIG_XENBUS=n
 CONFIG_LWIP=n
+CONFIG_9PFRONT=y
 CONFIG_BALLOON=y
 XEN_INTERFACE_VERSION=__XEN_LATEST_INTERFACE_VERSION__
diff --git a/stubdom/xenstorepvh-minios.cfg b/stubdom/xenstorepvh-minios.cfg
index 6af51f5753..752b90d7d3 100644
--- a/stubdom/xenstorepvh-minios.cfg
+++ b/stubdom/xenstorepvh-minios.cfg
@@ -4,7 +4,7 @@ CONFIG_NETFRONT=n
 CONFIG_FBFRONT=n
 CONFIG_KBDFRONT=n
 CONFIG_CONSFRONT=n
-CONFIG_XENBUS=n
 CONFIG_LWIP=n
+CONFIG_9PFRONT=y
 CONFIG_BALLOON=y
 XEN_INTERFACE_VERSION=__XEN_LATEST_INTERFACE_VERSION__
-- 
2.35.3


