Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kN20MueHCGq7twMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 16 May 2026 17:06:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B84E55C3DB
	for <lists+xen-devel@lfdr.de>; Sat, 16 May 2026 17:06:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1310870.1581445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOGZz-0007o1-VF; Sat, 16 May 2026 15:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1310870.1581445; Sat, 16 May 2026 15:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOGZz-0007mL-Ry; Sat, 16 May 2026 15:05:27 +0000
Received: by outflank-mailman (input) for mailman id 1310870;
 Sat, 16 May 2026 15:05:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wOGZz-0007fa-6X
 for xen-devel@lists.xenproject.org; Sat, 16 May 2026 15:05:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOGZy-000zny-J8
 for xen-devel@lists.xenproject.org; Sat, 16 May 2026 17:05:26 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0887b6-bab6-0a2a0a5309dd-0a2a4509ea70-2
 for <xen-devel@lists.xenproject.org>; Sat, 16 May 2026 17:05:26 +0200
Received: from [209.85.208.45] (helo=mail-ed1-f45.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0887b6-2497-0a2a45090019-d155d02da55f-3
 for <xen-devel@lists.xenproject.org>; Sat, 16 May 2026 17:05:26 +0200
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-678a16429c6so1733006a12.1
 for <xen-devel@lists.xenproject.org>; Sat, 16 May 2026 08:05:26 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.18]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6830fc1a0b4sm3268676a12.0.2026.05.16.08.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 08:05:25 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778943926; x=1779548726; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAy7stFhq3QazvA4VXAmm7gr3DiN33Vj0r1SCSJMER8=;
        b=RvQNL9PFt4e1MpV4XHvsDDPm0pbieEDKL9HwLtqHpNTsTK7LNlzfuGx+5bf8yKbmwd
         QOXcKH/L+fouhfZzXb+PBkbx/mi8/3+dG+Mr1qR33w0Gnxg6MRCfMyPkIoukCUD91YVa
         5TwqxRhfz1H278e3f0Qal3Pp3SMjyd5Gwiv4eRaXSaddGcxxKv70oTMj2AUUy7Q6bVnY
         pS4/lbBnjWh7jZi2eIB1N+6F08eKcKnc6G3ES2tT31hwbE8Fd8Ur1x7+ra1YVoaJ7HzU
         p1FvRD43y+bu+Qc4uusTVTzEAUctPssk3yWTr6DfOWIMCV2fmQCi34b1Y6DCPKthr/hG
         0bbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778943926; x=1779548726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sAy7stFhq3QazvA4VXAmm7gr3DiN33Vj0r1SCSJMER8=;
        b=dz37pxfv0PBt2+Sk07FAgaGX1VDo2Q9jl/f7xdjEHELScKBSYJXgRXzRaNz/1uWbuX
         KVCscsmihWtbWM7E/d9DLUdLmqVUP4urVlO+4MnTpDXv6KNPl5I2cTCi9uKIdb4mn+yJ
         tgTzYBu6KUiFPaciS04YPXryV3KY+douf4ScxCk7OY+yKRvPGC71h3Cptka/Aghn8Ixh
         469mxWzu5KIEKSpQrZD4AfONeHrR3EbfY3WFIO9PaaLXy7jUb+XcU71/0z2Iwxs5AmjE
         YeFo7oFIHs9Ku3IVuuct6GmoO3skmqHnDlR12v8GLd9MhRh1lXZVAYPBqATdyTzEzPaQ
         FBNw==
X-Gm-Message-State: AOJu0YyfqnOVwiggs7Hs8bEpGroGRcNcyg1LRYMgSzAI0ieIDrPD1GhC
	c6n2/hSynDOAXnpszlxvcrRqbSdECkFRcaGoBXlCslQOCyLkzMOO1SFRPI4YDA==
X-Gm-Gg: Acq92OFoEkgBCalD6wEbI55L43ixYz2bfdBCYhfMnHXQFpKAkew7jzGwtuke8Aiwjp0
	lsUpgfjQJ+u7/OPnRJJ9SPIbyWIuugDufWXBJNBnu0l9sAsVpIylkQuYTULWvfdqcqz4AGmOJNA
	Q8zmN5AVgwyUqgrHVvqlZi1ojhefFXw6XmSWDVNoK1T3P2y1Xc7et7OwHOGYhFJGDLB+v9BmDWC
	IlpfHm442uL8KYzkjDAN3iYIXuHGmvsDCujR771mvHFLeh9i4avEywZmKVqVn2SbKIL5aqFONWB
	Qjujk4HecZfjG6jMx4urCAsd+C/PyyCJTOcit3T6yFkqgCp7wXgTwRXGOrptShnbz8CRfYm3Z+t
	As6y8jTvJ5s6Ofg/edJ/a7gSsU0aw2j0ozMPCZ1ehN1LV0AMoNB89O0juA3cyoE8y265Yl3gj8t
	Mg59p1oZStDehKsvs84A67B370FSOnuFaRgtRJ
X-Received: by 2002:a05:6402:2043:b0:66d:d11c:fa0e with SMTP id 4fb4d7f45d1cf-6830b0fda84mr3831406a12.12.1778943925751;
        Sat, 16 May 2026 08:05:25 -0700 (PDT)
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
Subject: [PATCH 1/2] xen/common: llc-coloring: clear color count on parse failure
Date: Sat, 16 May 2026 18:03:11 +0300
Message-ID: <cbb02d6c5af6606ada3e477e8d45d730ffe72723.1778925998.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1778925998.git.mykola_kvach@epam.com>
References: <cover.1778925998.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1778943926-40B60A53-F42A240C/0/0
X-purgate-type: clean
X-purgate-size: 1422
X-Rspamd-Queue-Id: 6B84E55C3DB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

From: Mykola Kvach <mykola_kvach@epam.com>

parse_color_config() updates the caller-provided color count while
parsing. If parsing later fails, leave the count at zero so callers
do not consume a partially parsed configuration.

Fixes: 6cdea3444eaf ("xen/arm: add Dom0 cache coloring support")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/common/llc-coloring.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index 6dc614739a..2606cb0977 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -79,7 +79,7 @@ static int __init parse_color_config(const char *buf, unsigned int colors[],
         if ( end >= NR_LLC_COLORS || start > end ||
              (end - start) >= (UINT_MAX - *num_colors) ||
              (*num_colors + (end - start)) >= max_num_colors )
-            return -EINVAL;
+            goto fail;
 
         /* Colors are range checked in check_colors() */
         for ( color = start; color <= end; color++ )
@@ -91,7 +91,14 @@ static int __init parse_color_config(const char *buf, unsigned int colors[],
             break;
     }
 
-    return *s ? -EINVAL : 0;
+    if ( *s )
+        goto fail;
+
+    return 0;
+
+ fail:
+    *num_colors = 0;
+    return -EINVAL;
 }
 
 static int __init parse_dom0_colors(const char *s)
-- 
2.43.0


