Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C196580828F
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 09:10:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649595.1014269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB9SJ-0003tZ-If; Thu, 07 Dec 2023 08:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649595.1014269; Thu, 07 Dec 2023 08:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB9SJ-0003qo-G1; Thu, 07 Dec 2023 08:09:59 +0000
Received: by outflank-mailman (input) for mailman id 649595;
 Thu, 07 Dec 2023 08:09:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZW7A=HS=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rB9SI-0003qi-2F
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 08:09:58 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 021b00ca-94d8-11ee-98e6-6d05b1d4d9a1;
 Thu, 07 Dec 2023 09:09:56 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7D3AC1FD77;
 Thu,  7 Dec 2023 08:09:55 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 5EDA3139E3;
 Thu,  7 Dec 2023 08:09:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id ggfpFdN9cWUtKwAAn2gu4w
 (envelope-from <jgross@suse.com>); Thu, 07 Dec 2023 08:09:55 +0000
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
X-Inumbo-ID: 021b00ca-94d8-11ee-98e6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701936595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=txb5DHYSMjJ3SW9/d7VpI5jR7+y/iiVln9WdKX8pbNo=;
	b=flrQwq/uTCCgaoJ4VgjiCUyGdfmrYq14hbpwaCLpBadZxPGKfXdsVRyXbPkOsE/GUEKaNH
	xXfpffzl8yMHUO00l5J0Ktpip11igdlIbSd1jcFqHdC70Q+zaak97en0Z/BD9CmT3m+t23
	i8kJgmdrWYoNO4JQRnBr9p6nE+SQy70=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] OSStest: use CONFIG_X86_GENERIC for 32-bit x86 kernel
Date: Thu,  7 Dec 2023 09:09:53 +0100
Message-Id: <20231207080953.27976-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ******
X-Spam-Score: 6.70
X-Spamd-Result: default: False [6.70 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_SPAM_SHORT(2.80)[0.932];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 TO_DN_SOME(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

Today the cpu type for a 32-bit x86 kernel is not specified in the
used kernel config, resulting in the M686 to be used.

Instead of using the M686 which isn't even a 64-bit cpu (thus not
capable to run a Xen guest), use the X86_GENERIC variant which is
more appropriate.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 ts-kernel-build | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/ts-kernel-build b/ts-kernel-build
index 719b33aa..d9e033c4 100755
--- a/ts-kernel-build
+++ b/ts-kernel-build
@@ -608,7 +608,10 @@ setopt CONFIG_POWER_RESET_XGENE y
 setopt CONFIG_RTC_DRV_XGENE y
 
 case ${XEN_TARGET_ARCH} in
-    x86_32) setopt CONFIG_64BIT n ;;
+    x86_32)
+	setopt CONFIG_64BIT n
+	setopt CONFIG_X86_GENERIC y
+	;;
     x86_64)
 	setopt CONFIG_64BIT y
 	setopt CONFIG_IA32_EMULATION y
-- 
2.35.3


