Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A22B387357F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 12:17:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689065.1074003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhpHN-0003ct-C1; Wed, 06 Mar 2024 11:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689065.1074003; Wed, 06 Mar 2024 11:17:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhpHN-0003aD-8X; Wed, 06 Mar 2024 11:17:45 +0000
Received: by outflank-mailman (input) for mailman id 689065;
 Wed, 06 Mar 2024 11:17:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=frGc=KM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rhpHL-0003a3-AX
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 11:17:43 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2635f582-dbab-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 12:17:42 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BEDA93FF72;
 Wed,  6 Mar 2024 11:17:40 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 8A0E313A79;
 Wed,  6 Mar 2024 11:17:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id gYI3INRQ6GXWPgAAn2gu4w
 (envelope-from <jgross@suse.com>); Wed, 06 Mar 2024 11:17:40 +0000
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
X-Inumbo-ID: 2635f582-dbab-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709723861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xHuzMuZf+SGDKE+y7OBsn8gOryBcsmiQazYM2WVKUKU=;
	b=oHzdocecuCQVCbXDXOOP4kKr8FYWoolfhx7I6R54gf0k6/0Rt/pVjr8lDxCHcUNHk3VLri
	j4d6YRYrIdC+emb11X/4iKm1gpnrn6Uc/qKaBNFBQj+veBhX3G0YjDltsUGe6J3uhCeEA8
	WjswL1+KTWcOUy7hddZ9wj+edfyA+Yo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709723860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xHuzMuZf+SGDKE+y7OBsn8gOryBcsmiQazYM2WVKUKU=;
	b=Dpu5oaEpSobEY5HjoM3vaZXLdVFaM0nbUGhcGNLVDm+eTDkXyeAPzg+Hk47VaubkIxre/v
	JJscGTthqXDvQjrVAj97aiujVaeavkTt1mE5C4FcqDm6Akpb0cF+6xpSqvfCtiwZiWUtmi
	s2TyxO3hDZIPbPYluha/iM7VXm1taUE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH] CHANGELOG: add an entry for 9pfsd
Date: Wed,  6 Mar 2024 12:17:38 +0100
Message-Id: <20240306111738.1815-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [6.40 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-0.00)[20.95%];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 R_MISSING_CHARSET(2.50)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[keepachangelog.com:url,suse.com:email,changelog.md:url];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[suse.com,gmail.com,xenproject.org];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Level: ******
X-Spam-Score: 6.40
X-Spam-Flag: NO

Add an entry to CHANGELOG.md regarding the new xen-9pfsd daemon.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index f9874f9bb0..93fda73c00 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -18,6 +18,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - On x86:
    - Introduce a new x2APIC driver that uses Cluster Logical addressing mode
      for IPIs and Physical addressing mode for external interrupts.
+ - Add a new 9pfs backend running as a daemon in dom0. First user is
+   Xenstore-stubdom now being able to support full Xenstore trace capability.
 
 ### Removed
 - caml-stubdom.  It hasn't built since 2014, was pinned to Ocaml 4.02, and has
-- 
2.35.3


