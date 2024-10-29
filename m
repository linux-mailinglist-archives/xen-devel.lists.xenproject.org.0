Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0CA9B487A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 12:42:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827285.1241866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5kbx-0008KR-O8; Tue, 29 Oct 2024 11:42:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827285.1241866; Tue, 29 Oct 2024 11:42:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5kbx-0008IT-KT; Tue, 29 Oct 2024 11:42:09 +0000
Received: by outflank-mailman (input) for mailman id 827285;
 Tue, 29 Oct 2024 11:42:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uXRL=RZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1t5kbw-0008Gd-7b
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 11:42:08 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfe1a429-95ea-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 12:42:02 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D0F4B1FB55;
 Tue, 29 Oct 2024 11:42:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9DD65136A5;
 Tue, 29 Oct 2024 11:42:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id adwYJQjKIGfKSQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 29 Oct 2024 11:42:00 +0000
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
X-Inumbo-ID: cfe1a429-95ea-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5NS4xMzUuMjIzLjEzMSIsImhlbG8iOiJzbXRwLW91dDIuc3VzZS5kZSJ9
X-Custom-Transaction: eyJpZCI6ImNmZTFhNDI5LTk1ZWEtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjAyMTI1LjMwNjg3MSwic2VuZGVyIjoiamdyb3NzQHN1c2UuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1730202121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2eMJHLt456vECrCu/l8OxKrENcFTh4cA6cpXQSAO0YE=;
	b=LG9N2mVREj2xU/47DbXEzCQTWLSc4diLosoB3R2BQy789XlPHGVQCGiOaIHaS3cOjim0LY
	bO8gC7SnYI2DA/DsCbDDXxdRNDFCs4sSGahf6gSt8DrUgmTKVf7X6S6E0dizwUHAaQ0/2P
	CPPnuhkmm/1XJL1xc/hzQIY4JMscjwg=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1730202120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2eMJHLt456vECrCu/l8OxKrENcFTh4cA6cpXQSAO0YE=;
	b=gzmY9s0ZFTK2YUCSvJNni/KstZ2hKCsmdBfo3tpRmXWk3IQ2aRl52Z1NJ984GI8Jhufs6b
	2ju/VVJ1gaDa5k9gTBe/NzlYxSmxWODHBA63MpS/TSujWjlK28XsxE0uAKc0ZxJTrjv9P9
	xvjvY1FLcoMTQXysdIKOzKMJVDZFf5E=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>,
	Natanael Copa <ncopa@alpinelinux.org>
Subject: [Mini-OS PATCH] Add missing symbol exports for grub-pv
Date: Tue, 29 Oct 2024 12:41:58 +0100
Message-ID: <20241029114158.17231-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Grub-pv needs start_info_union and phys_to_machine_mapping to be
accessible. Export both symbols.

Fixes: 33411a11f848 ("Mini-OS: hide all symbols not exported via EXPORT_SYMBOLS()")
Reported-by: Natanael Copa <ncopa@alpinelinux.org>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/mm.c    | 1 +
 arch/x86/setup.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/x86/mm.c b/arch/x86/mm.c
index 572e762e..3ba6d917 100644
--- a/arch/x86/mm.c
+++ b/arch/x86/mm.c
@@ -55,6 +55,7 @@
 #endif
 
 unsigned long *phys_to_machine_mapping;
+EXPORT_SYMBOL(phys_to_machine_mapping);
 unsigned long mfn_zero;
 pgentry_t *pt_base;
 EXPORT_SYMBOL(pt_base);
diff --git a/arch/x86/setup.c b/arch/x86/setup.c
index b27bbed7..b613083b 100644
--- a/arch/x86/setup.c
+++ b/arch/x86/setup.c
@@ -41,6 +41,7 @@
  * address of the shared_info structure, and things like that.
  */
 union start_info_union start_info_union;
+EXPORT_SYMBOL(start_info_union);
 #endif
 
 /*
-- 
2.43.0


