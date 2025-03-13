Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C21DBA5F1FB
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 12:07:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911918.1318296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsgOn-0002GB-0T; Thu, 13 Mar 2025 11:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911918.1318296; Thu, 13 Mar 2025 11:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsgOm-0002Dm-TQ; Thu, 13 Mar 2025 11:06:48 +0000
Received: by outflank-mailman (input) for mailman id 911918;
 Thu, 13 Mar 2025 11:06:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oZoU=WA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tsgOl-0002Dg-D8
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 11:06:47 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ea74b47-fffb-11ef-9898-31a8f345e629;
 Thu, 13 Mar 2025 12:06:42 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C537E1F388;
 Thu, 13 Mar 2025 11:06:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7144B137BA;
 Thu, 13 Mar 2025 11:06:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ZVw2GkO80meDUwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 13 Mar 2025 11:06:43 +0000
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
X-Inumbo-ID: 3ea74b47-fffb-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741864003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JmBUFmUxTDnuOsAQ/WK/9Mo0hulw/ps8V91deC4RFJY=;
	b=sNyAN6wYFZ1eyzxJ3GFGPjYevwnhGKThe7yXeJk9Qipn//5oxohKq4ohwHdrpngD8toRNw
	p5+urtAP5xt11xe6mBqWUJisbPbqx522K0DUIcffZyLWoWgmWNp7HYFa1L3ANj8yqjs98o
	tM82HvmQ+UoYhtEE7+e7q4V9ACU1vx8=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=sNyAN6wY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741864003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JmBUFmUxTDnuOsAQ/WK/9Mo0hulw/ps8V91deC4RFJY=;
	b=sNyAN6wYFZ1eyzxJ3GFGPjYevwnhGKThe7yXeJk9Qipn//5oxohKq4ohwHdrpngD8toRNw
	p5+urtAP5xt11xe6mBqWUJisbPbqx522K0DUIcffZyLWoWgmWNp7HYFa1L3ANj8yqjs98o
	tM82HvmQ+UoYhtEE7+e7q4V9ACU1vx8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4] docs: specify numerical values of Xenstore commands
Date: Thu, 13 Mar 2025 12:06:40 +0100
Message-ID: <20250313110640.4330-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C537E1F388
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

In docs/misc/xenstore.txt all Xenstore commands are specified, but
the specifications lack the numerical values of the commands.

Add a table with all commands, their values, and a potential remark
(e.g. whether the command is optional).

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- replace "ŕ" with plain "r" (Jan Beulich)
- replace hard tabs with blanks (Jan Beulich)
- allow GET_FEATURES and GET_QUOTA support without SET_* (Jan Beulich)
V3:
- specify error code returned for unsupported commands (Julien Grall)
- reword XS_DIRECTORY_PART related text (Julien Grall)
V4:
- drop "XS_" prefixes as they are language specific (Anthony Perard)
---
 docs/misc/xenstore.txt | 61 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
index 7e1f031520..4eccbc2f7f 100644
--- a/docs/misc/xenstore.txt
+++ b/docs/misc/xenstore.txt
@@ -86,6 +86,67 @@ parts of xenstore inaccessible to some clients.  In any case passing
 bulk data through xenstore is not recommended as the performance
 properties are poor.
 
+---------- Defined Xenstore message types ----------
+
+Below is a table with all defined Xenstore message types (type name
+and its associated numerical value).
+
+Some types are optional to be supported by a specific Xenstore
+implementation.  If an optional type is not supported by a Xenstore
+implementation, Xen tools will continue to work, maybe with slightly
+reduced functionality.  A mandatory type not being supported will
+result in severely reduced functionality, like inability to create
+domains.  In case a type is optional, this is stated in the table with
+the lost functionality in case Xenstore doesn't support that type.
+Any not supported type sent to Xenstore will result in an error response
+with the "ENOSYS" error.
+
+CONTROL               0    optional
+    If not supported, xenstore-control command will not work.
+    DEBUG is a deprecated alias of CONTROL.
+DIRECTORY             1
+READ                  2
+GET_PERMS             3
+WATCH                 4
+UNWATCH               5
+TRANSACTION_START     6
+TRANSACTION_END       7
+INTRODUCE             8
+RELEASE               9
+GET_DOMAIN_PATH      10
+WRITE                11
+MKDIR                12
+RM                   13
+SET_PERMS            14
+WATCH_EVENT          15
+    Not valid in client sent messages.
+    Only valid in Xenstore replies.
+ERROR                16
+    Not valid in client sent messages.
+    Only valid in Xenstore replies.
+IS_DOMAIN_INTRODUCED 17
+RESUME               18
+SET_TARGET           19
+RESTRICT             20    no longer supported
+    RESTRICT has been removed, the type value 20 is invalid.
+RESET_WATCHES        21
+DIRECTORY_PART       22    optional
+    If not supported, the output of xenstore-ls might be incomplete
+    with a node's sub-node list exceeding the maximum payload size
+    (e.g. the "/local/domain" node with more than ca. 1000 domains
+    active).
+GET_FEATURE          23    optional
+SET_FEATURE          24    optional
+    SET_FEATURE requires GET_FEATURE to be supported.
+    If unsupported, setting availability of Xenstore features per
+    domain is not possible.
+GET_QUOTA            25    optional
+SET_QUOTA            26    optional
+    SET_QUOTA requires GET_QUOTA to be supported.
+    If unsupported, setting of Xenstore quota per domain is not
+    possible.
+INVALID           65535
+    Guaranteed invalid type (never supported).
 
 ---------- Xenstore protocol details - introduction ----------
 
-- 
2.43.0


