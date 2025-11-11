Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32813C4F002
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 17:20:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159097.1487526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIr6Z-0003QI-Cw; Tue, 11 Nov 2025 16:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159097.1487526; Tue, 11 Nov 2025 16:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIr6Z-0003LR-A1; Tue, 11 Nov 2025 16:20:27 +0000
Received: by outflank-mailman (input) for mailman id 1159097;
 Tue, 11 Nov 2025 16:20:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6vR8=5T=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vIr6Y-00027n-9u
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 16:20:26 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 548ed356-bf1a-11f0-9d18-b5c5bf9af7f9;
 Tue, 11 Nov 2025 17:20:25 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 667F521CE4;
 Tue, 11 Nov 2025 16:20:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3E5B614A47;
 Tue, 11 Nov 2025 16:20:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qlSlDUliE2lpDQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 11 Nov 2025 16:20:25 +0000
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
X-Inumbo-ID: 548ed356-bf1a-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1762878025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cfv/xgHZLZE2wANukYWztkqRSmV6C5Zi4y/LQSiOMQM=;
	b=Y2keFVwknK7R+SgY5Tll5//kL6L1r8wxCK2oP6BdCXxS7+yIu6qBXoRJ84z83aCftZGw86
	wS0MhKEWQNjE7/AGH1D9mwV/hV7tOASpLHonJ0whcsta5Qc1g5b54avZzej2VjvG/WdgCE
	FY3q6kOKI4YcB/aGuh2yBiDgo/GnS7U=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1762878025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cfv/xgHZLZE2wANukYWztkqRSmV6C5Zi4y/LQSiOMQM=;
	b=Y2keFVwknK7R+SgY5Tll5//kL6L1r8wxCK2oP6BdCXxS7+yIu6qBXoRJ84z83aCftZGw86
	wS0MhKEWQNjE7/AGH1D9mwV/hV7tOASpLHonJ0whcsta5Qc1g5b54avZzej2VjvG/WdgCE
	FY3q6kOKI4YcB/aGuh2yBiDgo/GnS7U=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 4/5] config: remove unused paths from config/Paths.mk.in
Date: Tue, 11 Nov 2025 17:19:58 +0100
Message-ID: <20251111161959.13667-5-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251111161959.13667-1-jgross@suse.com>
References: <20251111161959.13667-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Some paths in config/Paths.mk.in are used nowhere, so remove them.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 config/Paths.mk.in | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/config/Paths.mk.in b/config/Paths.mk.in
index bc42748b7a..668545be2f 100644
--- a/config/Paths.mk.in
+++ b/config/Paths.mk.in
@@ -20,10 +20,7 @@ libexecdir               := @libexecdir@
 datarootdir              := @datarootdir@
 mandir                   := @mandir@
 docdir                   := @docdir@
-dvidir                   := @dvidir@
 htmldir                  := @htmldir@
-pdfdir                   := @pdfdir@
-psdir                    := @psdir@
 includedir               := @includedir@
 localstatedir            := @localstatedir@
 sysconfdir               := @sysconfdir@
@@ -34,8 +31,6 @@ LIBEXEC_LIB              := @LIBEXEC_LIB@
 LIBEXEC_INC              := @LIBEXEC_INC@
 
 SHAREDIR                 := @SHAREDIR@
-MAN1DIR                  := $(mandir)/man1
-MAN8DIR                  := $(mandir)/man8
 
 XEN_RUN_DIR              := @XEN_RUN_DIR@
 XEN_LOG_DIR              := @XEN_LOG_DIR@
-- 
2.51.0


