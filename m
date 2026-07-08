Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RSqSAhBATmqlJgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 14:18:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8D272637A
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 14:18:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=PeROiNku;
	dmarc=pass (policy=reject) header.from=citrix.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356938.1611456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whRE1-0003SC-8C; Wed, 08 Jul 2026 12:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356938.1611456; Wed, 08 Jul 2026 12:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whRE1-0003Pc-5C; Wed, 08 Jul 2026 12:18:01 +0000
Received: by outflank-mailman (input) for mailman id 1356938;
 Wed, 08 Jul 2026 12:17:59 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1whRDz-0003PW-83
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 12:17:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whRDx-008JQt-VM
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 14:17:57 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a4e3fea-e002-0a2a0a5209dd-0a2a450cac66-38
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 14:17:57 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a4e3ff5-f399-0a2a450c0019-d155802bd496-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 14:17:57 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-493e8d4f4dcso931775e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 05:17:57 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0f36786sm123766875e9.6.2026.07.08.05.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2026 05:17:56 -0700 (PDT)
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
        d=citrix.com; s=google; t=1783513077; x=1784117877; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/J9Sr8HL9sOwV2WsOoARWEz7ZgAmOZbuv5uZ8/XLSg8=;
        b=PeROiNkuCrxbkYiZDGx7ATyugbxCqCt90mcdxLWQMrmKgyE6nWDM4tw3TN/2iTlxK4
         xI1B9F1w7MflDdP1Vti/subTnhzPu8YY9FCCjZ3QRFVllTmmCD0MPTScU2lkcTZ9EEzw
         t0y6O6QtXxM/XVXoGEIIIhBgBLLTHiJ4LQQEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513077; x=1784117877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/J9Sr8HL9sOwV2WsOoARWEz7ZgAmOZbuv5uZ8/XLSg8=;
        b=LFCNePGCy3+fm0CTCOoIDlRcvFOM87CFovEmI1r1wuKUQA7xnkiu8Xsu7H7U4c/zbf
         YI5y6uN9gzvsx2g6Do1/yxzdiOhPHfqWifN/Zk927K0f2AkPZdr+uTmbE98csPG7EQZE
         5gO1u/fftktR1epXc3aQ60osdgAhA9K2PZKqtRoW3SjnNpc3izuTLVkf5io1d4oYiw6U
         7GRUuCkHQdGzS/p5L73S4AXLjPOossTTYbitHe4Ng+EZx4XQ83DNUdB0UFcVu4tVSluJ
         x8cNJUuD5Eoir986lL9JOAK5FSsVlDUrkAJ3VuXij2Y/mn/3RFJJcCNUgJlCikZuczBA
         5wsQ==
X-Gm-Message-State: AOJu0YycAMhR0GZbtvnDZcZ2Bdaawl0P1KXzoTfJbE8xbeLiHFjnAo8v
	1PIC/6yb6y9DDHkQ0NuT/z4S1dlltH5J3qAOJ7QEiDwg7rTDuvqS/LJH1um6DFncvo1GzRQaTQU
	T79NynIY=
X-Gm-Gg: AfdE7cmFm8VasbPxU4vtaVE8sR1d4q8wWPgZndcb84c4+Q7UUKTF4+tlj2QWlVgpG1+
	P7kEBhcmseIs3J7oRnhPUMjJnqDgWX922d7FvhV4nKVQEV1rUE1yjY24E9Mf5xfv5trswlGPM9H
	2r0yrS+RtNDlj5OsdtAWN6l3CFoG4KMnNNAlNaYCGnwvDeUpCsD/scNrMYWHlhcibrkC6xFj6Q0
	DT8gXSeSAFimp4cAVqQmPFi75OPKbjXzE2KHXy1fdmqq3G6IQBv2awfqFK6E17Kq7YTMHVT8ci5
	wQ0W8KC2/AihO1U4zw0m1jJEDRv3cQcb35ORXPG1BGGxHYIw+L2OdhWUnxQ1xZ8BDYAQb2GuvjY
	aJCXfFNamPgOpVKQez2lmnikJDAl2hqwZsQF3IOLICT4p7mU/XG7JS/ZTIZDIbcdZ0NGgU/totO
	rwKDKUP8Re5qwkHo9cQyGbQVdfvUyIwDpOps8jTuueZDeEU13Gmnv6bHkwWFlOCCk=
X-Received: by 2002:a05:600c:c174:b0:493:c862:3f2d with SMTP id 5b1f17b1804b1-493e685992cmr22738875e9.5.1783513076920;
        Wed, 08 Jul 2026 05:17:56 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] arm/vgic-v3: Fix data abort in get_vcpu_from_rdist()
Date: Wed,  8 Jul 2026 13:17:53 +0100
Message-Id: <20260708121753.1428271-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1783513077-0FF33D51-D9781102/10/73395122804
X-purgate-type: spam
X-purgate-size: 1427
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,amd.com,kernel.org,xen.org,epam.com,arm.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:from_mime,citrix.com:email,citrix.com:mid,citrix.com:dkim,epam.com:email,arm.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B8D272637A

Just because vcpu_id is within d->max_vcpus doesn't mean d->vcpu[vcpu_id] is
non-NULL.  Use the proper accessor to look up a vcpu object.

Reported-by: Michal Orzel <michal.orzel@amd.com>
Fixes: acf65e5a25a7 ("xen/arm: vgic-v3: Emulate correctly the re-distributor")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Untested.  This came from review discusson on a separate patch.
---
 xen/arch/arm/vgic-v3.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index c1c4d6f71ea8..c01cc596d593 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -1111,10 +1111,10 @@ static struct vcpu *get_vcpu_from_rdist(struct domain *d,
     unsigned int vcpu_id;
 
     vcpu_id = region->first_cpu + ((gpa - region->base) / GICV3_GICR_SIZE);
-    if ( unlikely(vcpu_id >= d->max_vcpus) )
-        return NULL;
 
-    v = d->vcpu[vcpu_id];
+    v = domain_vcpu(d, vcpu_id);
+    if ( !v )
+        return NULL;
 
     *offset = gpa - v->arch.vgic.rdist_base;
 

base-commit: c4bf5bc5f0edbcbc5965c924db069483b2cf6049
-- 
2.39.5


