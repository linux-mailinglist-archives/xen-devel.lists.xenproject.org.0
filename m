Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDUhKFtrFWoBVAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 11:43:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6845D392B
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 11:43:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319669.1587160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRoKB-00087A-TD; Tue, 26 May 2026 09:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319669.1587160; Tue, 26 May 2026 09:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRoKB-00084y-O8; Tue, 26 May 2026 09:43:47 +0000
Received: by outflank-mailman (input) for mailman id 1319669;
 Tue, 26 May 2026 09:43:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wRoK9-0007iC-Md
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 09:43:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRoK9-00C7jc-2g
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 11:43:45 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a156b4e-e002-0a2a0a5209dd-0a2a4502c48c-22
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 11:43:45 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a156b50-af86-0a2a45020019-d155dd31e5d7-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 11:43:45 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-44a5174670eso5826141f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 02:43:44 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d70c51sm36522744f8f.36.2026.05.26.02.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 02:43:43 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779788624; x=1780393424; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LjNuNS+tEGweRY5UYIRJVJv/E+lf3Z5v+uA7RoSWlbs=;
        b=hrh9wP11MCg828qnNiYc72rHGBH7f11cmnLvqPuYp8KRjA09eZv9Ua6jDwvmvLz6Sj
         hGOUqRrbMnNm/HmT4va+SPBVjFa+XnfMmyWbNue6iTax1pRBRsWFXrEWv4QYLXMDkiWS
         KB5bs03EUQn91WLrp3NlK0YdsvmuUnzt0m2ST9715OF1Yf6wSXqzTcmPw2yFcjTOBs9q
         nazRevj+Vl3t6rOhIncE6tT0E2mHF1sXwlPLjHXHl2eCXP4vFGyjL5SnwWWKy6/vyOMk
         FkoOeDjvQHQdwr4Ii//ju/RY25eWk6TuM+7lbkampg+S9NJk7xD9Y3cnOXNZ2Txqhrqw
         eWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779788624; x=1780393424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LjNuNS+tEGweRY5UYIRJVJv/E+lf3Z5v+uA7RoSWlbs=;
        b=U9oWJg907+BLfj5XuoG2F9sJERx8dzJivDBtsRAWjwx1spEuNO9/p3NhkgPgytWkHG
         I6UMLlSEmjM7ySsk7IEtAqGGatJNYvz9FGARH1WbAOGUcz0vOiCIVQVFwWs8VjoItCal
         zXNB9T+FoeQmTLmAvsm73ZNv9SgLudh7mqd0ZRaoMtuWk4cL7ldCJ4p0WcbSZTRvzUMb
         reWeF9DCD66+atEC31ksu+SMElsMDwY5gW1C1Ak/Hr5FpYA8nynPdGugAEWeG1zV94ON
         jbS2yjX1ITF2XJfoBmMLtHX7N4u5yfwUjERgqe7UormsKX+6VNt976Mog7hYuITwZQ4l
         4ftg==
X-Gm-Message-State: AOJu0YyJvCkJ2NApxq9E1FgyD3h/obBtpyIh8F5W8MW+MkdR2UyapaMA
	1W2LnKsCUOnk/pDvKoIAAY42ccazFFVyJocWxiKC2qmbTma8lufSf3We/8mxFcZT
X-Gm-Gg: Acq92OHQVcKBYOOsxt+sNzwr+WtTFk3tOyEivl7r6GK0gT4zc0nOoWTLaSBpAOKQFML
	Wo1lJ7ssX/GIQz21LVXuO/Awfv5ah3peIhOK5i3EXPXhyD3ZN+mpreX3HErda4mBC9/sUVbRWGl
	c6S29Pi/VFPRs1HxqvjtA86kIdRHgehasJPLu+emlerylAz5DKu68YpW1L7BaIGc5fW6MldpPX+
	smvogHvlsaLekHuW9FXFAkehGiK2cQYSV8vYWiuG84kZXhJuuUJ5MpEfjJGdj8TTCrg55F1sh7o
	38izswGi5L5CylRj56/zw0uAa7EF3WTr3TKCdrVfTt8roKxzqLjU9YpyJx2H1lYPpV5sN2F908w
	5uWT9GNLIvJrzSUyFxLNAIXG516Sgvvg4GAN0Q6NVdf2NMggJY6z6kzWGQrfZa3kV0GT9YhxyWt
	ppzJTq2773clzSuVHSZy7LKTeN7pRaBeF9PQRzs2/w2LXOyAAoD0Pn/pp8L395gkZ2JSglMAwdp
	2WEucfPwLOAuaR2UA41Ky/omPmLzLQkejTm
X-Received: by 2002:a05:6000:2688:b0:45e:88f5:ccfb with SMTP id ffacd0b85a97d-45eb367320cmr33474548f8f.2.1779788624364;
        Tue, 26 May 2026 02:43:44 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 4/9] libs/guest: Use a single write_exact in write_headers
Date: Tue, 26 May 2026 10:43:15 +0100
Message-ID: <20260526094324.12286-5-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526094324.12286-1-frediano.ziglio@cloud.com>
References: <20260526094324.12286-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1779788625-81772161-A7D1DB3C/0/0
X-purgate-type: clean
X-purgate-size: 2254
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,cloud.com:mid];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5A6845D392B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Reduce number of syscalls.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
--
Changes since v2:
- change prefix in subject.
---
 tools/libs/guest/xg_sr_save.c | 37 +++++++++++++++++------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 62a39dfecc7a..8c4e760f8d0a 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -10,17 +10,22 @@ static int write_headers(struct xc_sr_context *ctx, uint16_t guest_type)
 {
     xc_interface *xch = ctx->xch;
     int32_t xen_version = xc_version(xch, XENVER_version, NULL);
-    struct xc_sr_ihdr ihdr = {
-        .marker  = IHDR_MARKER,
-        .id      = htonl(IHDR_ID),
-        .version = htonl(3),
-        .options = htons(IHDR_OPT_LITTLE_ENDIAN),
-    };
-    struct xc_sr_dhdr dhdr = {
-        .type       = guest_type,
-        .page_shift = XC_PAGE_SHIFT,
-        .xen_major  = (xen_version >> 16) & 0xffff,
-        .xen_minor  = (xen_version)       & 0xffff,
+    struct {
+        struct xc_sr_ihdr ihdr;
+        struct xc_sr_dhdr dhdr;
+    } hdrs = {
+        {
+            .marker  = IHDR_MARKER,
+            .id      = htonl(IHDR_ID),
+            .version = htonl(3),
+            .options = htons(IHDR_OPT_LITTLE_ENDIAN),
+        },
+        {
+            .type       = guest_type,
+            .page_shift = XC_PAGE_SHIFT,
+            .xen_major  = (xen_version >> 16) & 0xffff,
+            .xen_minor  = (xen_version)       & 0xffff,
+        },
     };
 
     if ( xen_version < 0 )
@@ -29,15 +34,9 @@ static int write_headers(struct xc_sr_context *ctx, uint16_t guest_type)
         return -1;
     }
 
-    if ( write_exact(ctx->fd, &ihdr, sizeof(ihdr)) )
-    {
-        PERROR("Unable to write Image Header to stream");
-        return -1;
-    }
-
-    if ( write_exact(ctx->fd, &dhdr, sizeof(dhdr)) )
+    if ( write_exact(ctx->fd, &hdrs, sizeof(hdrs)) )
     {
-        PERROR("Unable to write Domain Header to stream");
+        PERROR("Unable to write Headers to stream");
         return -1;
     }
 
-- 
2.54.0


