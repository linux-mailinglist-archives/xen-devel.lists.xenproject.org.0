Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A04B7F9DC0
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:38:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641855.1000826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Z0o-0008ST-Jn; Mon, 27 Nov 2023 10:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641855.1000826; Mon, 27 Nov 2023 10:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Z0o-0008QT-Dm; Mon, 27 Nov 2023 10:38:46 +0000
Received: by outflank-mailman (input) for mailman id 641855;
 Mon, 27 Nov 2023 10:38:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r7Yoo-0000Co-75
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:26:22 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6865c561-8d0f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 11:26:21 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D80AA21A5E;
 Mon, 27 Nov 2023 10:26:20 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id AEEAA132A6;
 Mon, 27 Nov 2023 10:26:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id JriAKcxuZGW3fgAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 27 Nov 2023 10:26:20 +0000
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
X-Inumbo-ID: 6865c561-8d0f-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701080780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ktKhOGmur4jQ1Brbb0nDkjWoCytuJc3+OYR5hECH7CE=;
	b=IjYs3Cs2b2fDJ3zRFhwBZ2fdsjgytBwFlhVyufPK6Kks/dxRbKSpbdlKH+yCrYRmlsjoI6
	FDaSPq0TJBmoKfP94ajBemev0J17uiv40Ca4NESo7mvgs7+88VfKCSBVo18EHNxgam5/Oe
	fc/+FfV8ugeqZS1kaWzBBK+VAtajTCA=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 10/32] Mini-OS: add EXPORT_SYMBOL() instances to lib/printf.c
Date: Mon, 27 Nov 2023 11:25:01 +0100
Message-Id: <20231127102523.28003-11-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231127102523.28003-1-jgross@suse.com>
References: <20231127102523.28003-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ***********
X-Spam-Score: 11.40
X-Spamd-Result: default: False [11.40 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_SPAM_SHORT(3.00)[1.000];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_SPAM_LONG(3.50)[1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

Add the needed instances of EXPORT_SYMBOL() to lib/printf.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 lib/printf.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/lib/printf.c b/lib/printf.c
index f9e9d682..0e054957 100644
--- a/lib/printf.c
+++ b/lib/printf.c
@@ -150,6 +150,7 @@ strtoul(const char *nptr, char **endptr, int base)
                 *endptr = __DECONST(char *, any ? s - 1 : nptr);
         return (acc);
 }
+EXPORT_SYMBOL(strtoul);
 
 /*
  * Convert a string to a quad integer.
@@ -241,6 +242,7 @@ strtoq(const char *nptr, char **endptr, int base)
                 *endptr = __DECONST(char *, any ? s - 1 : nptr);
         return (acc);
 }
+EXPORT_SYMBOL(strtoq);
 
 /*
  * Convert a string to an unsigned quad integer.
@@ -309,6 +311,7 @@ strtouq(const char *nptr, char **endptr, int base)
                 *endptr = __DECONST(char *, any ? s - 1 : nptr);
         return (acc);
 }
+EXPORT_SYMBOL(strtouq);
 
 /*
  * Scaled down version of printf(3).
@@ -585,6 +588,7 @@ number:
         }
 #undef PCHAR
 }
+EXPORT_SYMBOL(vsnprintf);
 
 /**
  * snprintf - Format a string and place it in a buffer
@@ -603,6 +607,7 @@ int snprintf(char * buf, size_t size, const char *fmt, ...)
     va_end(args);
     return i;
 }
+EXPORT_SYMBOL(snprintf);
 
 /**
  * vsprintf - Format a string and place it in a buffer
@@ -617,7 +622,7 @@ int vsprintf(char *buf, const char *fmt, va_list args)
 {
     return vsnprintf(buf, 0xFFFFFFFFUL, fmt, args);
 }
-
+EXPORT_SYMBOL(vsprintf);
 
 /**
  * sprintf - Format a string and place it in a buffer
@@ -635,6 +640,7 @@ int sprintf(char * buf, const char *fmt, ...)
     va_end(args);
     return i;
 }
+EXPORT_SYMBOL(sprintf);
 
 /*
  * Fill in the given table from the scanset at the given format
@@ -1214,6 +1220,7 @@ input_failure:
 match_failure:
         return (nassigned);
 }
+EXPORT_SYMBOL(vsscanf);
 
 /**
  * sscanf - Unformat a buffer into a list of arguments
@@ -1231,5 +1238,6 @@ int sscanf(const char * buf, const char * fmt, ...)
 	va_end(args);
 	return i;
 }
+EXPORT_SYMBOL(sscanf);
 
 #endif
-- 
2.35.3


