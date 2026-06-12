Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gpNDJdKRLGr6SwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 01:10:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 283D267D00A
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 01:10:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=FHmhUe9i;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1337049.1598700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYB0E-0001um-Vl; Fri, 12 Jun 2026 23:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337049.1598700; Fri, 12 Jun 2026 23:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYB0E-0001pp-S6; Fri, 12 Jun 2026 23:09:30 +0000
Received: by outflank-mailman (input) for mailman id 1337049;
 Fri, 12 Jun 2026 23:09:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wYB0D-0001me-OR
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 23:09:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYB0C-00HIs8-AQ
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 01:09:28 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a2c915b-5cb7-0a2a0a5109dd-0a2a4502ddb2-20
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 01:09:28 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a2c91a8-af86-0a2a45020019-d155dd2fc5bd-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 01:09:28 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-45e9f4a3510so892972f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 16:09:28 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2b0d28sm10035907f8f.20.2026.06.12.16.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 16:09:27 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1781305768; x=1781910568; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6698Uxcu0dfTevWQ4ApQH8lfT2iy2BjmmIOaPm7I/XA=;
        b=FHmhUe9iJhgoXiULmSgrnvCKDrn4Z6yGd8KSl+CvE4v3MyeSgB4eXL+Y8vy85LkJzq
         SwR1yKwkp1eUI+tBndIBN5TH3o4R8TH8pogLbP844SPvb5rZ06eTOImpb6sGXTcCIUxz
         3L6wmA3OOs+cCUOZOGmi/uSlVvZ8gGIzKlUEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781305768; x=1781910568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6698Uxcu0dfTevWQ4ApQH8lfT2iy2BjmmIOaPm7I/XA=;
        b=ddOsXDa8wJ0aA9Lm2qTBeYawWbF2QK5ReVrdcs4DcK/EfdIlkWCCXGX4ktFaDTVu7b
         GivaJqMtYwZpyVtXFa6iU6A68K8NS3oo4IFRbDGOhnSARUOR0ahfrhNuUE5anVRoo/MS
         xi2pfNrSiPYc9g3kfzxTSJiH/5upHEtaXmyDzo5fYrzv37pPlRZgMCELd1CM0DyAqITQ
         sEG2D2i7xzCKGx05TPNh2DjU0b7gGvcjDolmiA8zvDifjrHSx+gHiBCFNzfgOwDdp1WC
         LAw0nPpC0t2ptJ+YRO908/EzDg5YoSdqgBi8o5LETRHfzsKvdaAB65ZUfASurQVOlsVb
         8KiA==
X-Gm-Message-State: AOJu0Yw3ozQbBv10/VFUOYzVmkeJvCaAZ8an9Q8XEYT8oTC07fooqeZR
	VN4YfpE+wyPLyNW4F+HfHFUwFN9ZpEFg4dgBcguL2o5jImSFEceAlFlMwvxB8oomPHJeOm3Pmpa
	N3loZ
X-Gm-Gg: Acq92OH57ioApa+BL8zcXsQ6DiiGEl+QZ8a5retikHrwDo7VZL5c7I8AijauGJnQzdL
	Hi6iMGDjUlwI//K7AvqCRPSOujWV1aZApJIxGU0a25shmuL3UDBEJbgJR7hcRfiVbFD87dHSHCc
	1uBnwv/7bFxfwTBrI58OGx6U9qSY/HjLNtPUxYVetLExLwgD6OCvGOt1B1Qjxf//5m36gRTK6dB
	+p0JRASkp0bwZaADzFLmu7lBJnpXyu2jSklsQ3qM85VfSOFTY/XiujrmQK5WipVOovntV/FTLXb
	Ekvn4HpqxR1dpJPg261dfM0BbcJZ0wcVc+BsIg7Tj3SvWObqUleoUqehunr6ny6mI44Ua+f35PL
	9bsPoEDVLWUxZVTgEprXBHMykM9IEcoGDTYuWCt1jWL2gDafKWv63BWqLU9LMV0yzWyx2YdG8nH
	G/Ky47Lu2lIwGcjQ0qiNCwRFnxkkkkn3mLBk4rDS6f6kvUV81ecZ+KwMQV8bn93mJd0valQir2H
	O5c
X-Received: by 2002:a05:6000:290e:b0:45d:3cb0:5ab1 with SMTP id ffacd0b85a97d-46074b8a30bmr1549717f8f.38.1781305767643;
        Fri, 12 Jun 2026 16:09:27 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 1/7] tools/xenalyze: Work around GCC-15 -Werror=nonnull false positive
Date: Sat, 13 Jun 2026 00:09:18 +0100
Message-Id: <20260612230924.3181154-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260612230924.3181154-1-andrew.cooper3@citrix.com>
References: <20260612230924.3181154-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1781305768-A9B70161-0D63E41E/10/73395122804
X-purgate-type: spam
X-purgate-size: 1641
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,kernel.org,amd.com,cardoe.com,invisiblethingslab.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,vates.tech:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 283D267D00A

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

I don't particularly like this, but I see no better option.  It's clearly some
kind of VRA failure, yet we don't see it with GCC 15 in other distros.  I
suspect that Musl (as opposed to glibc) might be relevant, and perhaps even as
simple as not realising that error() is terminal for a non-zero input.
---
 tools/xentrace/xenalyze.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index 876d59d42ca5..cec1354cf779 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -3789,6 +3789,17 @@ void update_io_address(struct io_address ** list, unsigned int pa, int dir,
             error(ERR_SYSTEM, NULL);
         }
 
+        /*
+         * GCC 15.2 in Alpine Linux 3.24 fails with -Werror=nonnull,
+         * complaining that we're calling bzero(NULL, 128).
+         *
+         * This looks to be a false positive as p being NULL will never reach
+         * here as the error() above will have called exit().
+         *
+         * Work around this by hiding the NULL-ness of p from the compiler.
+         */
+        asm ("" : "+r" (p));
+
         bzero(p, sizeof(*p));
 
         p->pa=pa;
-- 
2.39.5


