Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 146E5A4F94C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 09:57:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901853.1309779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpkYe-0003Fy-8q; Wed, 05 Mar 2025 08:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901853.1309779; Wed, 05 Mar 2025 08:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpkYe-0003Dg-5O; Wed, 05 Mar 2025 08:56:52 +0000
Received: by outflank-mailman (input) for mailman id 901853;
 Wed, 05 Mar 2025 08:56:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/re5=VY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tpkYc-0003DY-U7
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 08:56:50 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c67dc63a-f99f-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 09:56:49 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 926801F393;
 Wed,  5 Mar 2025 08:56:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6676F13939;
 Wed,  5 Mar 2025 08:56:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IQJXF9ERyGenYQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 05 Mar 2025 08:56:49 +0000
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
X-Inumbo-ID: c67dc63a-f99f-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741165009; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=an+W2//aeRMz1jH2MSoBL0mEjd2EhjgqV4zdxDcKBAU=;
	b=XJCiP1gfpAHoiyRqpm2q6KlkZJZNP9b+XdJtXj0npQ3N48vbX22XQJXBaor27XJT1CXF0T
	z0XFUMhCb2J/b5WtbETYq5xT8YwHeA3UcBYVe2Otum28xgKZiGe8BfIsFAV8vdvcvzVNXI
	TLn+XQSP7+VxfFq7e/yg2SPBx2JWhDI=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741165009; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=an+W2//aeRMz1jH2MSoBL0mEjd2EhjgqV4zdxDcKBAU=;
	b=XJCiP1gfpAHoiyRqpm2q6KlkZJZNP9b+XdJtXj0npQ3N48vbX22XQJXBaor27XJT1CXF0T
	z0XFUMhCb2J/b5WtbETYq5xT8YwHeA3UcBYVe2Otum28xgKZiGe8BfIsFAV8vdvcvzVNXI
	TLn+XQSP7+VxfFq7e/yg2SPBx2JWhDI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>
Subject: [PATCH] xen/public: remove some unused defines from xs_wire.h
Date: Wed,  5 Mar 2025 09:56:46 +0100
Message-ID: <20250305085646.26472-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.79 / 50.00];
	BAYES_HAM(-2.99)[99.95%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.79
X-Spam-Flag: NO

xs_wire.h contains some defines XS_WRITE_* which seem to be leftovers
from some decades ago. They haven't been used in the Xen tree since at
least Xen 2.0 and they make no sense anyway.

Remove them, as they seem not to be related to any Xen interface we
have today.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/include/public/io/xs_wire.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/xen/include/public/io/xs_wire.h b/xen/include/public/io/xs_wire.h
index 04e6849feb..0d9f49ac89 100644
--- a/xen/include/public/io/xs_wire.h
+++ b/xen/include/public/io/xs_wire.h
@@ -41,10 +41,6 @@ enum xsd_sockmsg_type
     XS_INVALID = 0xffff /* Guaranteed to remain an invalid type */
 };
 
-#define XS_WRITE_NONE "NONE"
-#define XS_WRITE_CREATE "CREATE"
-#define XS_WRITE_CREATE_EXCL "CREATE|EXCL"
-
 /* We hand errors as strings, for portability. */
 struct xsd_errors
 {
-- 
2.43.0


