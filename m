Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F645823E50
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 10:10:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661226.1030954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJk4-0008Sv-2t; Thu, 04 Jan 2024 09:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661226.1030954; Thu, 04 Jan 2024 09:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJk3-0008QK-Vj; Thu, 04 Jan 2024 09:10:19 +0000
Received: by outflank-mailman (input) for mailman id 661226;
 Thu, 04 Jan 2024 09:10:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4u2H=IO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rLJcp-00085z-0J
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 09:02:51 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 096f51fa-aae0-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 10:02:50 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1AB1121EE1;
 Thu,  4 Jan 2024 09:02:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EA5E413722;
 Thu,  4 Jan 2024 09:02:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gcMHODl0lmUfWQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 04 Jan 2024 09:02:49 +0000
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
X-Inumbo-ID: 096f51fa-aae0-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1704358970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/eJaaQzJFr9iaY84hbFZ6eF6VnkmvJwoY+5FWl4+J1Y=;
	b=gHkbmH218y0KMHOUNSXdUqKGLonH7D6XONOMfoCygBk+o9WiVnBd9twUa+LYfdx2fqc3gd
	TDa3LHwPa1rEKsFhxrsNNXs4XxS5Cvro14MSKiZKithqqSTuNbc706fJL3MjKuqlNnqA6s
	8/jY/cg1pp5uQOrBJGhXQJ2Gdo5AQ9A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1704358970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/eJaaQzJFr9iaY84hbFZ6eF6VnkmvJwoY+5FWl4+J1Y=;
	b=gHkbmH218y0KMHOUNSXdUqKGLonH7D6XONOMfoCygBk+o9WiVnBd9twUa+LYfdx2fqc3gd
	TDa3LHwPa1rEKsFhxrsNNXs4XxS5Cvro14MSKiZKithqqSTuNbc706fJL3MjKuqlNnqA6s
	8/jY/cg1pp5uQOrBJGhXQJ2Gdo5AQ9A=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v3 20/33] stubdom: extend xenstore stubdom configs
Date: Thu,  4 Jan 2024 10:00:42 +0100
Message-Id: <20240104090055.27323-21-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240104090055.27323-1-jgross@suse.com>
References: <20240104090055.27323-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ****
X-Spam-Score: 4.20
X-Spamd-Result: default: False [4.20 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 TO_DN_SOME(0.00)[];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 NEURAL_SPAM_LONG(3.50)[1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[suse.com,ens-lyon.org,gmail.com];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[41.34%]
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


