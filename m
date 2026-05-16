Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YL8/D+iHCGq7twMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 16 May 2026 17:06:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E839C55C3E9
	for <lists+xen-devel@lfdr.de>; Sat, 16 May 2026 17:06:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1310871.1581454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOGa2-000848-6R; Sat, 16 May 2026 15:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1310871.1581454; Sat, 16 May 2026 15:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOGa2-00081G-3V; Sat, 16 May 2026 15:05:30 +0000
Received: by outflank-mailman (input) for mailman id 1310871;
 Sat, 16 May 2026 15:05:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wOGa0-0007yz-Mw
 for xen-devel@lists.xenproject.org; Sat, 16 May 2026 15:05:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOGa0-000ziQ-38
 for xen-devel@lists.xenproject.org; Sat, 16 May 2026 17:05:28 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0887a1-e002-0a2a0a5209dd-0a2a4501bb9e-10
 for <xen-devel@lists.xenproject.org>; Sat, 16 May 2026 17:05:28 +0200
Received: from [209.85.208.47] (helo=mail-ed1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0887b7-c1f2-0a2a45010019-d155d02feda3-3
 for <xen-devel@lists.xenproject.org>; Sat, 16 May 2026 17:05:28 +0200
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-676a89de629so1519912a12.1
 for <xen-devel@lists.xenproject.org>; Sat, 16 May 2026 08:05:28 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.18]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6830fc1a0b4sm3268676a12.0.2026.05.16.08.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 08:05:26 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778943927; x=1779548727; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVrXc3Z0YNDU/cSa9N1k1VbjjSsyEmY6q4/XgcyD2jQ=;
        b=Hgiw9ISKgj1hJD7s85SqDvJNFXB0cCjF0Qz5KJSz0T38GFKn9hGvbEhYhMui5Te/z0
         7LE+aKKopBl7yDxfTrVj+9ot8JJqwV9JrWekIsnp50OvgHeTsCRUKjWVkRkzt1z4XOVz
         atoSy8Urf5bPazK+TpB80s1BwWkCWH0N2OHBoIoAYXaQq8WxKvQ50K+jzqzKzv7aT5Dd
         MmpOvPhWFuDmak8di5g+1/17xGGFFn7ycf5V4hsPBCACTi8Z9JewC6bIvzCkE1qNB/OP
         15RAKGhxF7x4S8MOkrToat8lVB8/cntLS2VQynBVPwyMOhVuvHhVx4Rmn9esGR/SsofL
         UYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778943927; x=1779548727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oVrXc3Z0YNDU/cSa9N1k1VbjjSsyEmY6q4/XgcyD2jQ=;
        b=JmEzob0VOz7F9E9P/GxrmRWJmYP+XrmeKkkpkBY1n+IVKzopB2K3mUcqeoiAX4+cQ1
         tFBVya+PMYohAl/iJRG2UjtIukweNI6LB+3c6mXToeefUvnn9DIv8AgNhicXkP/RjC2r
         qEqnHv93KMIG/rVJi44yl8q1hnxoA5SnGlc6TgmgiD48PtzhcWVwjXMOK10pYajy2e4s
         bIhBtbLmbB8+qHsxiTRap/qlB45Q2TM29aBDO+/3PTywi/Vp4M0LHLyCJAkppGWTnHLo
         cm3BY0iJQkR1Chc+h+4o+YQCsEQDu0HltrKJKeokgEs8KMMgogsujvidyMcfpRylOJ5j
         duBg==
X-Gm-Message-State: AOJu0YxdjhJDdsZdRY0nr4tHsm6NoR7Ao2qi4v/+j0os7NdqTo/Tbx8R
	kUKMw6pSVye7nQ6xG5tgYeV27kUnRmgjZZGGdgsr9kZYCEGBHn52/CIZIhIDXQ==
X-Gm-Gg: Acq92OFV8pEjJqnQV0zv8uxmyrM0yxKRg2oTSYVkTmAJ8OWJXqpP6Zw6+9JU5E6ii3m
	BerhXAax8v+lD/Ki6Egq7QwIEw35G4udbZ/4Q/Mm0a+rF8jTT8QnnvqZEZ+bfv32iSfAAvfP4qH
	qUd6fg1Duskb/iLm+Htw8XDp5+F8RdK1Mlg/fnI8Pw20+vIEkuciS5iy10R09z4Bb+JyzWYWv6p
	npH+626qGyxJprzu+ORR1TxwZbGFUjAf8YclSm3lriBCQHicARArRk6OC5Yc5HdOO17IkVzgkuX
	YGM7Ra2y+2vqpWCbq3ArQ4bXL0Z/PYrffT4/mJ9/x1AN5TaUpZ0Nl00Joay7wj6RcC4qf5HnmjT
	rnzxOT539Jczsk57txiBScv0ceQJB5huiJcQZ1FMoXfoQzDiPge8Y/b6J0I91+zDODUsPY1bNo8
	UWwCQgmeaAcpkQ+aevEzF4IcddGGwutiVjgBtu
X-Received: by 2002:a05:6402:556:b0:67e:9e04:31d0 with SMTP id 4fb4d7f45d1cf-683bd779fe2mr2819853a12.23.1778943927569;
        Sat, 16 May 2026 08:05:27 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] xen/common: llc-coloring: reject empty color tokens
Date: Sat, 16 May 2026 18:03:12 +0300
Message-ID: <0820f91dd0499e5f66f8961b5e27fe0a0ff9be35.1778925998.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1778925998.git.mykola_kvach@epam.com>
References: <cover.1778925998.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1778943928-B7555FF4-863ECD26/0/0
X-purgate-type: clean
X-purgate-size: 1894
X-Rspamd-Queue-Id: E839C55C3E9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,epam.com:mid];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

From: Mykola Kvach <mykola_kvach@epam.com>

parse_color_config() currently accepts delimiters where a color value
is expected because simple_strtoul() returns zero without advancing the
input pointer. This makes strings such as ",2-6", "-10,19-20" or
"1,,2" look as if an empty value was color 0.

Also add the missing newline to the DT color parsing error message.

Fixes: 6cdea3444eaf ("xen/arm: add Dom0 cache coloring support")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/common/llc-coloring.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index 2606cb0977..5d00d4b40e 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -64,14 +64,21 @@ static int __init parse_color_config(const char *buf, unsigned int colors[],
 
     while ( *s != '\0' )
     {
+        const char *endp;
         unsigned int color, start, end;
 
-        start = simple_strtoul(s, &s, 0);
+        start = simple_strtoul(s, &endp, 0);
+        if ( endp == s )
+            goto fail;
+        s = endp;
 
         if ( *s == '-' )    /* Range */
         {
             s++;
-            end = simple_strtoul(s, &s, 0);
+            end = simple_strtoul(s, &endp, 0);
+            if ( endp == s )
+                goto fail;
+            s = endp;
         }
         else                /* Single value */
             end = start;
@@ -334,7 +341,7 @@ int __init domain_set_llc_colors_from_str(struct domain *d, const char *str)
     err = parse_color_config(str, colors, max_nr_colors, &num_colors);
     if ( err )
     {
-        printk(XENLOG_ERR "Error parsing LLC color configuration");
+        printk(XENLOG_ERR "Error parsing LLC color configuration\n");
         xfree(colors);
         return err;
     }
-- 
2.43.0


