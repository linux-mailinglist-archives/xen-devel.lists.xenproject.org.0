Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 690F5A54AA2
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 13:25:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903446.1311328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqAHJ-0005HO-BW; Thu, 06 Mar 2025 12:24:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903446.1311328; Thu, 06 Mar 2025 12:24:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqAHJ-0005En-8r; Thu, 06 Mar 2025 12:24:41 +0000
Received: by outflank-mailman (input) for mailman id 903446;
 Thu, 06 Mar 2025 12:24:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TCcn=VZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tqAHH-0005Eh-55
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 12:24:39 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3864e29-fa85-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 13:24:29 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 35F24211AD;
 Thu,  6 Mar 2025 12:24:29 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E542713676;
 Thu,  6 Mar 2025 12:24:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id G0eDNvyTyWfTUQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 06 Mar 2025 12:24:28 +0000
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
X-Inumbo-ID: f3864e29-fa85-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741263869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EEKhfUX1UAhdwTW1++HkghLsKqJFR8BkWE1VB2eK79Q=;
	b=Xjunt6SiGlfG0PfmllWo8fp3ukMBMcn4gHSW0FIVNLVvzxMg564wJ2/piNWHzx7MZlG2QX
	hMqyGldN8U95LaIbyQxtGoc1iVyVaUeSkWf9iv7mQrehpKmgBfoYNEjhfBfFLU21p1jWjV
	Trkrm5E/NUNiPnhZsjzUOHA9ztNM7tc=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741263869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EEKhfUX1UAhdwTW1++HkghLsKqJFR8BkWE1VB2eK79Q=;
	b=Xjunt6SiGlfG0PfmllWo8fp3ukMBMcn4gHSW0FIVNLVvzxMg564wJ2/piNWHzx7MZlG2QX
	hMqyGldN8U95LaIbyQxtGoc1iVyVaUeSkWf9iv7mQrehpKmgBfoYNEjhfBfFLU21p1jWjV
	Trkrm5E/NUNiPnhZsjzUOHA9ztNM7tc=
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
Subject: [PATCH] docs: specify numerical values of Xenstore commands
Date: Thu,  6 Mar 2025 13:23:55 +0100
Message-ID: <20250306122426.4351-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.98%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email]
X-Spam-Flag: NO
X-Spam-Level: 

In docs/misc/xenstore.txt all Xenstore commands are specified, but
the specifications lack the numerical values of the commands.

Add a table with all commands, their values, and a potential remark
(e.g. whether the command is optional).

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/misc/xenstore.txt | 59 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
index 7e1f031520..76001c6ee6 100644
--- a/docs/misc/xenstore.txt
+++ b/docs/misc/xenstore.txt
@@ -86,6 +86,65 @@ parts of xenstore inaccessible to some clients.  In any case passing
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
+
+XS_CONTROL		0	optional
+	If not supported, xenstore-control command will not work.
+	XS_DEBUG is a deprecated alias of XS_CONTROL.
+XS_DIRECTORY		1
+XS_READ			2
+XS_GET_PERMS		3
+XS_WATCH		4
+XS_UNWATCH		5
+XS_TRANSACTION_START	6
+XS_TRANSACTION_END	7
+XS_INTRODUCE		8
+XS_RELEASE		9
+XS_GET_DOMAIN_PATH	10
+XS_WRITE		11
+XS_MKDIR		12
+XS_RM			13
+XS_SET_PERMS		14
+XS_WATCH_EVENT		15
+	Not valid in client sent messages.
+	Only valid in Xenstore replies.
+XS_ERROR		16
+	Not valid in client sent messages.
+	Only valid in Xenstore replies.
+XS_IS_DOMAIN_INTRODUCED	17
+XS_RESUME		18
+XS_SET_TARGET		19
+XS_RESTRICT		20	no longer supported
+	XS_RESTRICT has been removed, the type value 20 is invalid.
+XS_RESET_WATCHES	21
+XS_DIRECTORY_PART	22	optional
+	If not supported, the output of xenstore-ls might be incomplete
+	with moŕe than ca. 1000 domains active.
+XS_GET_FEATURE		23	optional
+XS_SET_FEATURE		24	optional
+	XS_GET_FEATURE and XS_SET_FEATURE must either be both supported
+	or both unsupported.
+	If unsupported, setting availability of Xenstore features per
+	domain is not possible.
+XS_GET_QUOTA		25	optional
+XS_SET_QUOTA		26	optional
+	XS_GET_QUOTA and XS_SET_QUOTA must either be both supported
+	or both unsupported.
+	If unsupported, setting of Xenstore quota per domain is not
+	possible.
+XS_INVALID		65535
+	Guaranteed invalid type (never supported).
 
 ---------- Xenstore protocol details - introduction ----------
 
-- 
2.43.0


