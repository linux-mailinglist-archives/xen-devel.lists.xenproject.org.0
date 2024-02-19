Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A9E85A536
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 14:58:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682871.1062082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc48s-0005ZH-KX; Mon, 19 Feb 2024 13:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682871.1062082; Mon, 19 Feb 2024 13:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc48s-0005XY-Ht; Mon, 19 Feb 2024 13:57:10 +0000
Received: by outflank-mailman (input) for mailman id 682871;
 Mon, 19 Feb 2024 13:57:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OQos=J4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rc48r-0005XO-LU
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 13:57:09 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c406a5e5-cf2e-11ee-98f5-efadbce2ee36;
 Mon, 19 Feb 2024 14:57:06 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2F4431F800;
 Mon, 19 Feb 2024 13:57:05 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 04BFC13585;
 Mon, 19 Feb 2024 13:57:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id Y8ktOzBe02W9DAAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 19 Feb 2024 13:57:04 +0000
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
X-Inumbo-ID: c406a5e5-cf2e-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1708351025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=SwodJ1pTCGhLAwKhDNMO6/ovhBbx7H7Fl1qXIfAUnBE=;
	b=X/lfICm01rh/mCjemMUvY0penYfitc1mzMqdXdVnl0vTZs/N4XpLcT7OaYpWgCpwZh/dHr
	QVoxvVU2BZVJUoyyrcHujB19tD5TbpSyN0LOHSweFu/Z16LyuyFqvgMutdR4HpwCigAv6D
	Q4xVD4XrqLl/G+4BsobRUT7PNm4K210=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1708351025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=SwodJ1pTCGhLAwKhDNMO6/ovhBbx7H7Fl1qXIfAUnBE=;
	b=X/lfICm01rh/mCjemMUvY0penYfitc1mzMqdXdVnl0vTZs/N4XpLcT7OaYpWgCpwZh/dHr
	QVoxvVU2BZVJUoyyrcHujB19tD5TbpSyN0LOHSweFu/Z16LyuyFqvgMutdR4HpwCigAv6D
	Q4xVD4XrqLl/G+4BsobRUT7PNm4K210=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/9pfsd: add missing va_end() in fill_data()
Date: Mon, 19 Feb 2024 14:56:58 +0100
Message-Id: <20240219135658.3662-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 TO_DN_SOME(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[31.25%]
X-Spam-Flag: NO

In xen-9pfsd fill_data() va_end() needs to be called before returning.

Coverity Id CID 1592145

Fixes: bcec59cf7ff4 ("tools/xen-9pfsd: add 9pfs version request support")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/9pfsd/io.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/tools/9pfsd/io.c b/tools/9pfsd/io.c
index ebc4102713..adb887c7d9 100644
--- a/tools/9pfsd/io.c
+++ b/tools/9pfsd/io.c
@@ -445,7 +445,7 @@ static int fill_data(struct ring *ring, const char *fmt, ...)
             if ( !*f || array_sz )
                 fmt_err(fmt);
             if ( !chk_data(ring, data, sizeof(uint16_t)) )
-                return pars;
+                goto out;
             array_sz = get_unaligned((uint16_t *)data);
             data += sizeof(uint16_t);
             *(unsigned int *)par = array_sz;
@@ -455,10 +455,10 @@ static int fill_data(struct ring *ring, const char *fmt, ...)
 
         case 'b':
             if ( !chk_data(ring, data, sizeof(uint8_t)) )
-                return pars;
+                goto out;
             if ( !fill_data_elem(&par, array, &array_sz, sizeof(uint8_t),
                                  data) )
-                return pars;
+                goto out;
             data += sizeof(uint8_t);
             break;
 
@@ -466,48 +466,48 @@ static int fill_data(struct ring *ring, const char *fmt, ...)
             if ( array_sz )
                 fmt_err(fmt);
             if ( !chk_data(ring, data, sizeof(uint32_t)) )
-                return pars;
+                goto out;
             len = get_unaligned((uint32_t *)data);
             data += sizeof(uint32_t);
             *(unsigned int *)par = len;
             par = va_arg(ap, void *);
             if ( !chk_data(ring, data, len) )
-                return pars;
+                goto out;
             memcpy(par, data, len);
             data += len;
             break;
 
         case 'L':
             if ( !chk_data(ring, data, sizeof(uint64_t)) )
-                return pars;
+                goto out;
             if ( !fill_data_elem(&par, array, &array_sz, sizeof(uint64_t),
                                  data) )
-                return pars;
+                goto out;
             data += sizeof(uint64_t);
             break;
 
         case 'S':
             if ( !chk_data(ring, data, sizeof(uint16_t)) )
-                return pars;
+                goto out;
             len = get_unaligned((uint16_t *)data);
             data += sizeof(uint16_t);
             if ( !chk_data(ring, data, len) )
-                return pars;
+                goto out;
             str_off = add_string(ring, data, len);
             if ( str_off == ~0 )
-                return pars;
+                goto out;
             if ( !fill_data_elem(&par, array, &array_sz, sizeof(unsigned int),
                                  &str_off) )
-                return pars;
+                goto out;
             data += len;
             break;
 
         case 'U':
             if ( !chk_data(ring, data, sizeof(uint32_t)) )
-                return pars;
+                goto out;
             if ( !fill_data_elem(&par, array, &array_sz, sizeof(uint32_t),
                                  data) )
-                return pars;
+                goto out;
             data += sizeof(uint32_t);
             break;
 
@@ -520,6 +520,9 @@ static int fill_data(struct ring *ring, const char *fmt, ...)
         pars++;
     }
 
+ out:
+    va_end(ap);
+
     return pars;
 }
 
-- 
2.35.3


