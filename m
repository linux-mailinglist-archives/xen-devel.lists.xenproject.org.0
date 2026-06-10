Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BIWuBipPKWp0UgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 13:48:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E60668F33
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 13:48:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=AlRDxUKO;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1334168.1597291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXHQP-0006Lw-IX; Wed, 10 Jun 2026 11:48:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334168.1597291; Wed, 10 Jun 2026 11:48:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXHQP-0006KN-FE; Wed, 10 Jun 2026 11:48:49 +0000
Received: by outflank-mailman (input) for mailman id 1334168;
 Wed, 10 Jun 2026 11:41:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <michael.bommarito@gmail.com>) id 1wXHJX-00051J-0h
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 11:41:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXHJW-0092Ij-6Y
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 13:41:42 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <michael.bommarito@gmail.com>)
 id 6a294d76-bab6-0a2a0a5309dd-0a2a4506bc24-0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 13:41:42 +0200
Received: from [209.85.219.52] (helo=mail-qv1-f52.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <michael.bommarito@gmail.com>)
 id 6a294d75-7371-0a2a45060019-d155db34b915-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 13:41:42 +0200
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-8cceaacd07bso69386396d6.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 04:41:41 -0700 (PDT)
Received: from server0 (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8cecd26b9d5sm253263426d6.44.2026.06.10.04.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 04:41:39 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781091701; x=1781696501; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpBQlFHxPmh6RO32iI4WOJ4ByDFhk3PQ/XSlBDQpR+c=;
        b=AlRDxUKOdIq2ryKXm+6YekSU+vwjjPP1yKzdb2GxlS2llJHG+e9fSLHlurU2XccRqP
         fS54m2Ifbpemnd/oMFKjm4FPFg3H+Wa+ye135QoCexjeZR/qagyVdW9iemzr09rINRtE
         rJw8JcqKEzAXzslrWgRBsUb5dohz0aq6xSmzcTO7SEM0MiYmBdvwkSb2nQBpnbIZYxmH
         4n8rZZ8BMaJAR7C6lufjlBqCFRUFN+oSlxX5jzHgh4OksJzhZEzKYd4tPEwWOHlUWu0n
         dO0YkOHXVE6aPjWUGjRTkmRujz7Pibq8p88pxA5pLuLdavAZD14kPCtIf5oAughTgTW8
         mecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781091701; x=1781696501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpBQlFHxPmh6RO32iI4WOJ4ByDFhk3PQ/XSlBDQpR+c=;
        b=G5mkbxbyMFJPcsszyzvFraLqMFpPi7qj45yUABYsAiNPy5LhEKwazSxYrlg4LbrFA9
         rNKGiHQPmBjFMtO6QR6sctWeNI7zDddFs2/AoO6XS8NKNTyVy0yM6I+WfAGyFXRH/iO7
         G/5JJq307AOmreE544VWJXRzdzOC+CWlSDD8U93o7QcbDokLM4u/5TzM2RhO5SA9jL7X
         9WhnJbGRGNAPe0CtnoSENrPJ426EKv5/o28X0BVx+AnEYDtIzuZE2bTvvepleO6uR/fo
         VNTIgpn8s3D9Dz2jemmENzJhQbhjHIBvAgzJGBh9oQmTGEp/u6aBag50FT8ILyCg0lYT
         xb9g==
X-Gm-Message-State: AOJu0YyMn/16tBDeIqFaqM76/6LDgSeM0Vyye+IiQ6ttQeKGH68G79oh
	etTK/HpMWuqEEYDSOKORjm2Zw7z0farxs2jT+NoWFMg91NVKW24pCSiO
X-Gm-Gg: Acq92OE+aHEo4RRL3JaypnqHDK5vpiEuhi0cUnPGbozpury80wLf69rJuWKOIdzTOZa
	79Z3szi4jbQFzdWiQWqM0M9MLrX+M4teiMOZkv2s6ZzCD6nPoMbk3nw8WUFwXYqvmHTPOaOPTaK
	dE4bC66LD+ND2iZv3fSDlNSWRe6QIL0X9TbJT8NWX7bUMD5rAvZ+DB/SDnu6Bc0XnMs5hvrGNoX
	ol9/GrpO4Yh78QcTOtO7V174R5a4szFW55Qc9UQT86T41bmwKBWla3wl/dIM8d3qIGGB1mTyNdw
	LGLH117c17gs1+cSzRsWJ2vq7rI7u89e4p3SQn+hbFgLkpNE59Amqlg5BiDvz5DgSTN/jadeQsH
	m+rP75UnnYGTSamW1nPt0d+zWmrpIwBZJaHW2mDPFj4l4Pz0PBj3ZH1ml4BL+tWD3BO7pbKW4Mj
	QY+ozbMxxyoQWQ52KLlq0+a8qaunCUP4liK1/Jz0XWwgp6DJZEJI62zlrP5h069gXieEt79oezy
	7coywIssgi/MX/HOrgIh967cZd3SWg=
X-Received: by 2002:ad4:4447:0:b0:8cc:ea2c:f2b5 with SMTP id 6a1803df08f44-8cee61359bemr283431546d6.23.1781091700398;
        Wed, 10 Jun 2026 04:41:40 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] xen/pvcalls: bound backend response req_id before indexing rsp[]
Date: Wed, 10 Jun 2026 07:41:37 -0400
Message-ID: <20260610114137.3749027-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1781091702-8D186D75-79C2F078/0/0
X-purgate-type: clean
X-purgate-size: 2266
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[michaelbommarito@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 99E60668F33

pvcalls_front_event_handler() takes req_id directly from the
backend-supplied ring response and uses it to index the fixed-size
bedata->rsp[] array for a memcpy() and a store, with no range check. A
malicious or buggy backend can set req_id past PVCALLS_NR_RSP_PER_RING
and drive an out-of-bounds write past the bedata allocation.

req_id was also declared int while the wire field rsp->req_id is u32, so
a range check on the signed value is insufficient on its own: a backend
req_id of 0xffffffff becomes -1, passes the >= PVCALLS_NR_RSP_PER_RING
test, and indexes bedata->rsp[-1], an out-of-bounds write to the left of
the array. Declare req_id as u32 and add the range check so both ends of
the index are covered.

The pvcalls frontend currently trusts its backend, so this is not a
classic-Xen security issue, but it matters for hardening PV frontends
against malicious backends (confidential and disaggregated deployments).
Reject responses whose req_id is out of range.

Fixes: 235a71c53903 ("xen/pvcalls: implement release command")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/xen/pvcalls-front.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/pvcalls-front.c b/drivers/xen/pvcalls-front.c
index 50ce4820f7eeb..78bd4e894b32e 100644
--- a/drivers/xen/pvcalls-front.c
+++ b/drivers/xen/pvcalls-front.c
@@ -168,7 +168,8 @@ static irqreturn_t pvcalls_front_event_handler(int irq, void *dev_id)
 	struct pvcalls_bedata *bedata;
 	struct xen_pvcalls_response *rsp;
 	uint8_t *src, *dst;
-	int req_id = 0, more = 0, done = 0;
+	u32 req_id = 0;
+	int more = 0, done = 0;
 
 	if (dev == NULL)
 		return IRQ_HANDLED;
@@ -185,6 +186,12 @@ static irqreturn_t pvcalls_front_event_handler(int irq, void *dev_id)
 		rsp = RING_GET_RESPONSE(&bedata->ring, bedata->ring.rsp_cons);
 
 		req_id = rsp->req_id;
+		if (req_id >= PVCALLS_NR_RSP_PER_RING) {
+			/* Malicious or buggy backend: req_id out of range. */
+			bedata->ring.rsp_cons++;
+			done = 1;
+			continue;
+		}
 		if (rsp->cmd == PVCALLS_POLL) {
 			struct sock_mapping *map = (struct sock_mapping *)(uintptr_t)
 						   rsp->u.poll.id;
-- 
2.53.0


