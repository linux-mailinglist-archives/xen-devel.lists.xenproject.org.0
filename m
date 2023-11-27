Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFCF7F9DC9
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:40:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641893.1000897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Z1v-00037Z-Gi; Mon, 27 Nov 2023 10:39:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641893.1000897; Mon, 27 Nov 2023 10:39:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Z1v-00035X-DT; Mon, 27 Nov 2023 10:39:55 +0000
Received: by outflank-mailman (input) for mailman id 641893;
 Mon, 27 Nov 2023 10:39:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r7Yoe-0000Co-EC
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:26:12 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61d40f72-8d0f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 11:26:10 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CB4AA21B08;
 Mon, 27 Nov 2023 10:26:09 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id A145E132A6;
 Mon, 27 Nov 2023 10:26:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id wlYeJsFuZGWyfgAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 27 Nov 2023 10:26:09 +0000
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
X-Inumbo-ID: 61d40f72-8d0f-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701080769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IWD9wp7e1oDERY6EogAJmEZnMVVQ68S78bsckAXuJSQ=;
	b=mLeiD3dNhIcEs2Z5Pm6u+uA1RJoffr7sg/iuIZ0VeVkYVSgg52ytLyBNM9niK/PZ5VW5Yt
	iKVSQ5ALKVsXR5030f7xVXKnC4APnKErB6lKba2SgTIS7KvesZkJl4hliq3Dj8nhDaw9ju
	fl/M2tlIoddQ9+rNKxtt1xwMGD0OMhs=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 08/32] Mini-OS: add EXPORT_SYMBOL() instances to lib/string.c
Date: Mon, 27 Nov 2023 11:24:59 +0100
Message-Id: <20231127102523.28003-9-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231127102523.28003-1-jgross@suse.com>
References: <20231127102523.28003-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ****************
X-Spam-Score: 16.50
X-Spamd-Result: default: False [16.50 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(5.10)[100.00%];
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

Add the needed instances of EXPORT_SYMBOL() to lib/string.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 lib/string.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/lib/string.c b/lib/string.c
index 8b241464..b0b628c6 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -19,6 +19,7 @@
  */
 
 #include <strings.h>
+#include <mini-os/export.h>
 
 /* newlib defines ffs but not ffsll or ffsl */
 int __ffsti2 (long long int lli)
@@ -49,11 +50,13 @@ int ffsl (long int li)
 {
     return __ffsti2 ((long long int) li);
 }
+EXPORT_SYMBOL(ffsl);
 
 int ffsll (long long int lli)
 {
     return __ffsti2 (lli);
 }
+EXPORT_SYMBOL(ffsll);
 
 #if !defined HAVE_LIBC
 
@@ -72,6 +75,7 @@ int memcmp(const void * cs,const void * ct,size_t count)
 			break;
 	return res;
 }
+EXPORT_SYMBOL(memcmp);
 
 void * memcpy(void * dest,const void *src,size_t count)
 {
@@ -83,6 +87,7 @@ void * memcpy(void * dest,const void *src,size_t count)
 
 	return dest;
 }
+EXPORT_SYMBOL(memcpy);
 
 int strncmp(const char * cs,const char * ct,size_t count)
 {
@@ -96,6 +101,7 @@ int strncmp(const char * cs,const char * ct,size_t count)
 
 	return __res;
 }
+EXPORT_SYMBOL(strncmp);
 
 int strcmp(const char * cs,const char * ct)
 {
@@ -108,6 +114,7 @@ int strcmp(const char * cs,const char * ct)
 
         return __res;
 }
+EXPORT_SYMBOL(strcmp);
 
 char * strcpy(char * dest,const char *src)
 {
@@ -117,6 +124,7 @@ char * strcpy(char * dest,const char *src)
                 /* nothing */;
         return tmp;
 }
+EXPORT_SYMBOL(strcpy);
 
 char * strncpy(char * dest,const char *src,size_t count)
 {
@@ -127,6 +135,7 @@ char * strncpy(char * dest,const char *src,size_t count)
 
         return tmp;
 }
+EXPORT_SYMBOL(strncpy);
 
 void * memset(void * s,int c,size_t count)
 {
@@ -137,6 +146,7 @@ void * memset(void * s,int c,size_t count)
 
         return s;
 }
+EXPORT_SYMBOL(memset);
 
 size_t strnlen(const char * s, size_t count)
 {
@@ -146,6 +156,7 @@ size_t strnlen(const char * s, size_t count)
                 /* nothing */;
         return sc - s;
 }
+EXPORT_SYMBOL(strnlen);
 
 
 char * strcat(char * dest, const char * src)
@@ -159,6 +170,7 @@ char * strcat(char * dest, const char * src)
     
     return tmp;
 }
+EXPORT_SYMBOL(strcat);
 
 size_t strlen(const char * s)
 {
@@ -168,6 +180,7 @@ size_t strlen(const char * s)
 		/* nothing */;
 	return sc - s;
 }
+EXPORT_SYMBOL(strlen);
 
 char * strchr(const char * s, int c)
 {
@@ -176,6 +189,7 @@ char * strchr(const char * s, int c)
                         return NULL;
         return (char *)s;
 }
+EXPORT_SYMBOL(strchr);
 
 char * strrchr(const char * s, int c)
 {
@@ -185,6 +199,7 @@ char * strrchr(const char * s, int c)
                         res = s;
         return (char *)res;
 }
+EXPORT_SYMBOL(strrchr);
 
 char * strstr(const char * s1,const char * s2)
 {
@@ -202,6 +217,7 @@ char * strstr(const char * s1,const char * s2)
         }
         return NULL;
 }
+EXPORT_SYMBOL(strstr);
 
 char *strdup(const char *x)
 {
@@ -211,6 +227,7 @@ char *strdup(const char *x)
     memcpy(res, x, l + 1);
     return res;
 }
+EXPORT_SYMBOL(strdup);
 
 int ffs(int i)
 {
@@ -224,5 +241,6 @@ int ffs(int i)
    } while (i);
    return 0;
 }
+EXPORT_SYMBOL(ffs);
 
 #endif
-- 
2.35.3


