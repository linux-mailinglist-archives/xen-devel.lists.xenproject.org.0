Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JY8NFhrFWrxUwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 11:43:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB005D391D
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 11:43:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319666.1587133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRoK7-0007Op-Vj; Tue, 26 May 2026 09:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319666.1587133; Tue, 26 May 2026 09:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRoK7-0007NH-Sx; Tue, 26 May 2026 09:43:43 +0000
Received: by outflank-mailman (input) for mailman id 1319666;
 Tue, 26 May 2026 09:43:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wRoK6-0007D9-WF
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 09:43:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRoK6-00C7fR-CA
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 11:43:42 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a156b46-e002-0a2a0a5209dd-0a2a45098e94-30
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 11:43:42 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a156b4e-2497-0a2a45090019-d155dd2ec0a5-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 11:43:42 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-4526a8170ceso5213617f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 02:43:42 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d70c51sm36522744f8f.36.2026.05.26.02.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 02:43:41 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779788622; x=1780393422; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDSatSx8OrVXDk0o7wj5shH6txGUOWHFIUf5mWNv4L0=;
        b=TWsILB3LAnnFrJSxgdWZhQEt9yL1tCRXbBKjBG2R8hou2/Enw3Pc0OKhRdVP9OV63u
         WIDJHHoCH9/FgErxAOztFshqbegT4SgRb5ayu5ar/J+zfqZqyBt8d2nSwT2d0o6uVmjc
         np9uJpkVth+r1RqlwAWVfo/5pNuNS8FdkMMrin6c3wt1OAgC5FHDsSmOQDkv2l2H8e6R
         QURKRF5r7BcMdqnz9IwhaFXjIPe0CrJCngnvHPDzojpGR2K2DuG0KMgnsfgBeRUJvyts
         UpTsWyEU7HK4T5as0oHr56SZAHVvQ6GlLd/eiVzspkDlBOkOznGKoxVk+94yraYNa1Cp
         ZKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779788622; x=1780393422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CDSatSx8OrVXDk0o7wj5shH6txGUOWHFIUf5mWNv4L0=;
        b=B6CmWA63zg18ER7m+Zc0SEOtoR45mkM6inte/PspvW36MskdaqcXsTQnzWR9MzP6m8
         +n9oTR/chqZsUOsycrOBExom1BSLxWkyPMFWJegvJe1H7opjFTtKaeV5Mrw3KWhMuluy
         H50ihQJPzKVkczW166KZ7OlqBUMxrBC0q4OwJnhnLhyNWHt3UONeSkr6EAKG5Yq6A731
         mo+B1V9ZO+yVk4CdG3+R72CKy6lK6mjNfjyOrXLZzrh6ekxEQMrM/lR+pqsaM9nT4M/g
         qR6pKaHnk02aq0wjk/QUURCgYvfN7UL/Lirh47cenHuqIAzmmyeEFJjwf75t4PF+eeWB
         5xYA==
X-Gm-Message-State: AOJu0YwHMVcmtFDJWP5ExGuReRmFMPR/I0g5iFCXnNJrcALmI02mP+G3
	OEPQ7ijy5mc12W0AS3JKBSSuosyK9INBH4DYSmVy8i68FrlcnOF59mLQBmEUWpV2
X-Gm-Gg: Acq92OGgkWhytvi93pOHazqIJnz/fYY7wZ6ebDMNqSNUIVRX8RdPutEQ4vdbJkjFxMW
	rroW7eg8ru8zKdZi3pWWy80Eb4ZuIJQk61cMhG+58zKKC8DPi9rxm1un2AD1bEpg/yKUbEI4d4/
	XL5TZtNeJDoYfN8+eVSEHJ/elaLysmNhF+t850RTYnD5Iiy/PKnofP+BCudTal5QWJUtf1BDZTm
	ZYejzZEv6bBsqCx/eawzK7NhhrDBxFNGChMh0mh1w3V+HV7F1RE29E7TK0qsZHrJhqPlTjqzwyY
	1Fa5KW4Jn5D7eGfRRdAiPdiJOpud5gUDWrovvLMX5Nzu/+dmlBtfnwT4NhaXkL7jyUqNSCNzsxM
	XXcNTu6dPlpD8T8npaCd1x/fFx0K4l50WYrpgBNof1HZi8j2Twop4PQqk2PMix+4gcrKdluuWYQ
	aJyXvzMcVsxHF7K3xtqa72EZBcF6Ai39n2XfXpW3II6IZuo49Gulid5hImY4qZGCtW+aKOhbKBh
	O3xV3KcaQQXWMrza1tsX227sQ==
X-Received: by 2002:a05:6000:41d2:b0:43d:242:b9bb with SMTP id ffacd0b85a97d-45eb36a7d34mr28920267f8f.18.1779788621742;
        Tue, 26 May 2026 02:43:41 -0700 (PDT)
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
Subject: [PATCH v3 1/9] libs/guest: Reduce number of parts in write_split_record
Date: Tue, 26 May 2026 10:43:12 +0100
Message-ID: <20260526094324.12286-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526094324.12286-1-frediano.ziglio@cloud.com>
References: <20260526094324.12286-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1779788622-89B7BA53-2F529E4D/0/0
X-purgate-type: clean
X-purgate-size: 1632
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
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CCB005D391D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Small optimization.
There's no much sense to split the header in 2 pieces, it will
just take more time and space to reassemble them in the final
buffer.
This also avoids truncating combined_length to 32 bit in case of
64 bit machines potentially avoiding following record_length check.
The function become more coherent with following read_record
function.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
--
Changes since v2:
- change prefix in subject.
---
 tools/libs/guest/xg_sr_common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.c b/tools/libs/guest/xg_sr_common.c
index 7ccdc3b1f6aa..86c148c62f3e 100644
--- a/tools/libs/guest/xg_sr_common.c
+++ b/tools/libs/guest/xg_sr_common.c
@@ -59,11 +59,11 @@ int write_split_record(struct xc_sr_context *ctx, struct xc_sr_record *rec,
     static const char zeroes[(1u << REC_ALIGN_ORDER) - 1] = { 0 };
 
     xc_interface *xch = ctx->xch;
-    typeof(rec->length) combined_length = rec->length + sz;
+    size_t combined_length = rec->length + sz;
     size_t record_length = ROUNDUP(combined_length, REC_ALIGN_ORDER);
+    struct xc_sr_rhdr rhdr = { rec->type, combined_length };
     struct iovec parts[] = {
-        { &rec->type,       sizeof(rec->type) },
-        { &combined_length, sizeof(combined_length) },
+        { &rhdr,            sizeof(rhdr) },
         { rec->data,        rec->length },
         { buf,              sz },
         { (void *)zeroes,   record_length - combined_length },
-- 
2.54.0


