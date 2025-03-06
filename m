Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0730A5449B
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 09:21:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903081.1311000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6Te-0004cK-Tg; Thu, 06 Mar 2025 08:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903081.1311000; Thu, 06 Mar 2025 08:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6Te-0004as-R3; Thu, 06 Mar 2025 08:21:10 +0000
Received: by outflank-mailman (input) for mailman id 903081;
 Thu, 06 Mar 2025 08:21:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TCcn=VZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tq6Td-0004aI-H5
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 08:21:09 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f486fe12-fa63-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 09:21:08 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 02A3621168;
 Thu,  6 Mar 2025 08:21:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D4AB913676;
 Thu,  6 Mar 2025 08:21:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Jgz1MfNayWdqfwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 06 Mar 2025 08:21:07 +0000
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
X-Inumbo-ID: f486fe12-fa63-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741249268; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IgT4GEz/+4aizq9LqqppR1TDzJn72Fff1KpmcUE94kc=;
	b=GqUEj2QQQBdKqUHbxvQamG1jjjDZS2u9BTgxF+XrCntmtqVe0Qi5kwqgaNCHhbUqxJC4c9
	izZOnbgPsnjC3CrUE3aRqs5oYyzzHX7s5fdxIK29pazSTMfYpGkhHv1/gWYMfCZY6WVbAm
	eB+SNSSRLjkN8TDYu++RSCuWlq2oDZw=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741249268; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IgT4GEz/+4aizq9LqqppR1TDzJn72Fff1KpmcUE94kc=;
	b=GqUEj2QQQBdKqUHbxvQamG1jjjDZS2u9BTgxF+XrCntmtqVe0Qi5kwqgaNCHhbUqxJC4c9
	izZOnbgPsnjC3CrUE3aRqs5oYyzzHX7s5fdxIK29pazSTMfYpGkhHv1/gWYMfCZY6WVbAm
	eB+SNSSRLjkN8TDYu++RSCuWlq2oDZw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>
Subject: [PATCH] xen/public: add missing Xenstore commands to xs_wire.h
Date: Thu,  6 Mar 2025 09:21:05 +0100
Message-ID: <20250306082105.17398-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.70 / 50.00];
	BAYES_HAM(-2.90)[99.58%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.70
X-Spam-Flag: NO

The GET_FEATURE, SET_FEATURE, GET_QUOTA and SET_QUOTA Xenstore commands
are defined in docs/misc/xenstore.txt, but they are missing in
xs_wire.h.

Add the missing commands to xs_wire.h

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/include/public/io/xs_wire.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/include/public/io/xs_wire.h b/xen/include/public/io/xs_wire.h
index 0d9f49ac89..e92a87a07b 100644
--- a/xen/include/public/io/xs_wire.h
+++ b/xen/include/public/io/xs_wire.h
@@ -35,6 +35,10 @@ enum xsd_sockmsg_type
     /* XS_RESTRICT has been removed */
     XS_RESET_WATCHES = XS_SET_TARGET + 2,
     XS_DIRECTORY_PART,
+    XS_GET_FEATURE,
+    XS_SET_FEATURE,
+    XS_GET_QUOTA,
+    XS_SET_QUOTA,
 
     XS_TYPE_COUNT,      /* Number of valid types. */
 
-- 
2.43.0


