Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9VmkLJd4SmrSDgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 05 Jul 2026 17:30:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F6270A74E
	for <lists+xen-devel@lfdr.de>; Sun, 05 Jul 2026 17:30:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=0sec.ai header.s=google header.b=KBAhfMRz;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1354806.1609845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgOmS-00075G-DZ; Sun, 05 Jul 2026 15:29:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1354806.1609845; Sun, 05 Jul 2026 15:29:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgOmS-00073k-9h; Sun, 05 Jul 2026 15:29:16 +0000
Received: by outflank-mailman (input) for mailman id 1354806;
 Sun, 05 Jul 2026 11:56:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <doruk@0sec.ai>) id 1wgLSm-0008E4-PN
 for xen-devel@lists.xenproject.org; Sun, 05 Jul 2026 11:56:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgLSl-00G2oW-Tq
 for xen-devel@lists.xenproject.org; Sun, 05 Jul 2026 13:56:44 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <doruk@0sec.ai>)
 id 6a4a4618-bab6-0a2a0a5309dd-0a2a45029554-36
 for <xen-devel@lists.xenproject.org>; Sun, 05 Jul 2026 13:56:43 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <doruk@0sec.ai>)
 id 6a4a467a-5a27-0a2a45020019-d155dd2bc179-3
 for <xen-devel@lists.xenproject.org>; Sun, 05 Jul 2026 13:56:42 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-47d6c634f45so256336f8f.3
 for <xen-devel@lists.xenproject.org>; Sun, 05 Jul 2026 04:56:42 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.219.178])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e4d83bdsm15695537f8f.13.2026.07.05.04.56.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 05 Jul 2026 04:56:41 -0700 (PDT)
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
        d=0sec.ai; s=google; t=1783252602; x=1783857402; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pwRuSlbR797Mkzk8fZcr08AJmiX5cll2qBttTfovZeo=;
        b=KBAhfMRz85ezx70BOLacSIb0iSY3F1afq8ZMvF2StkinaXKtbFNmU8n9QN1X8VDLwS
         SjbQz62sOPDBGbHY6SueGULuLoo8aIMZJrkeRq6UG9AD00biu2RCgD/Cz0ft1+SJW4jo
         PXWHew/B4C1PvrzXxG/5Xjvjk9i1lo+IxLZDRs+gKSWjPVn58gwjAt4qm6LNqrBUiIpE
         CYaQfvUVzrNDAvuGinr5mjHjHSpzwbe1vf+JQ7EPFwTTPUTRk9zHb4cEmbRuiJre513S
         JWFpOaH33ubTr12J3p4SIvCYUsGgclNOy/1CVV95G0MbcmcrrL07UU+9JDBI5iBYT4iI
         fteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783252602; x=1783857402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwRuSlbR797Mkzk8fZcr08AJmiX5cll2qBttTfovZeo=;
        b=Y9W2rt3wdwOq7o/LipK3meraKL2M2pIYHb9v2uSFdqxrv42F5w+W5MJUmQHUEqChj3
         DC4LKZJ3ZiaT/Fe6M5Cg85Jw9LD8XEEgneA8tJcmdkPlL/Hccj4th1Rr5U3DBJvBVFCy
         A+iqxcMHCEfrXQBqbm828w/7JKqSPweLuQTN8DmiQJtilD95dwIyMMQJecUSY2nArzeb
         9LRh1LCMkY6M0Jexsx2mJ04tNsL/MFUiBYRzbAJnDiCQgOwGhyktfqSIjCOxzGejA9ZU
         l18dnx5owsC94Ggg35Mtr5xBSEOa5usYhpoAsibv408xjtfPKPSVJeeHr0BBOsnsatLC
         Xzvw==
X-Forwarded-Encrypted: i=1; AHgh+RoKTo+X3uPrWvGfR3cCRIbIxhy9wsSw1/VtVoVKNauqPaRlljEwEBb1p5d18GeSIytBKvu/9IN+RJU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwP21lGwquS0/AsBoh3ovmeF60vWX1BJs/t/oywDjDz53MEJjQu
	4AwDCbjxFnNSHf0pYHwxuknynvIecLllyMx+Fv6QOfEe+hYU6PR+LCXy1NABuT/QKX3a
X-Gm-Gg: AfdE7cmfJiqRu+UyBtXrtxHDUR+0IMXxcI3ntWzUdf5qDb+QZnGK33hTBiybOi4htCD
	KEAvYa5rHJ3ync8cb5X7LFE1pIGXNj7yyCU+mNW/Bpksho1WJRNU+NnTgU2il9ruMBeDMmGuE4X
	iXPj/mp1dA5+oWlonDBj6ck73f9uWMoqL5S22s81vaUX/HPk5ZMs4Eko/fT42BQA+9m95Wva2OC
	E5N9iK/H57HCBqH4LmGHCQ/qU4KGbcGI+8eAboiCmUUtCjrmHfRpF6kX4/gNJSx4/zRbMVxrwJw
	bp6eIAcnqKKrYFx8LOtwnhiMEOB75Y/7AG85wmeXu76PNJRizuxs1U1Tu0SGfmOPyHdkVAi25Kq
	JFeMNaPgsEL8LdSUvTFQZTDWEc7bXFospme0H+wsVYF+01/OWoDdpU7Nnf61/HECTXS5FlB6oyH
	BKkqKB5K/slSHrxAbqwgwKM7QqdNdUUz8AWih00xBeod/8Fu0UOlnnyk5/HL1MYKXzHOTqhi/6V
	Q3gZPcr6z5aCpGklN/omi4Pc2Rz3Gg9lh0=
X-Received: by 2002:a05:6000:1818:b0:475:f0c2:5afb with SMTP id ffacd0b85a97d-47aad07e091mr5521587f8f.49.1783252601779;
        Sun, 05 Jul 2026 04:56:41 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jens Axboe <axboe@kernel.dk>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH] xen-blkfront: fix double completion of split requests on resume
Date: Sun,  5 Jul 2026 13:56:39 +0200
Message-ID: <20260705115639.72805-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1783252603-4D1027C5-1EABFEDE/0/0
X-purgate-type: clean
X-purgate-size: 2670
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[0sec.ai:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:axboe@kernel.dk,m:xen-devel@lists.xenproject.org,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:doruk@0sec.ai,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[0sec.ai];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[doruk@0sec.ai,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[0sec.ai:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0sec.ai:dkim,0sec.ai:mid,0sec.ai:from_mime,0sec.ai:url,0sec.ai:email,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[doruk@0sec.ai,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 01F6270A74E

When a block request is too large for a single ring entry and the
backend does not support indirect descriptors, blkfront splits it
across two ring requests.  blkif_ring_get_request() is called twice
and both shadow slots (shadow[id] and shadow[extra_id]) are made to
point at the *same* struct request, linked together through
associated_id.

On the normal completion path blkif_completion() collapses the pair:
it recycles the second slot via add_id_to_freelist() and only completes
the request once.  The suspend/resume path in blkfront_resume() does
not.  It walks every physical shadow slot and, for each slot whose
->request is set, calls blk_mq_end_request() or re-queues
->request.  For an in-flight split request this visits the shared
struct request twice, so on resume/migration the same request is
ended (or re-queued) two times.  The second visit is a double
blk_mq_end_request() (refcount underflow / double free) and a
use-after-free read of req->bio, which was cleared on the first visit.

Skip the secondary slot of a split request in the resume walk, so each
logical request is completed or re-queued exactly once, matching how
blkif_completion() already treats the pair.  The secondary slot is the
one that is linked (associated_id != NO_ASSOCIATED_ID) and carries no
scatter-gather list (num_sg == 0); the first slot always keeps the
scatter-gather list.

This was found by 0sec automated security-research tooling
(https://0sec.ai).  The bug is only reachable on suspend/resume or live
migration of a guest whose backend lacks indirect-descriptor support, so
it has no local reproducer; the fix is by source inspection against the
existing blkif_completion() collapse logic.

Fixes: 6cc568339047 ("xen/blkfront: Handle non-indirect grant with 64KB pages")
Assisted-by: 0sec:claude-opus-4-8
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/block/xen-blkfront.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index f765970578f9..b2e83fd0c77b 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -2079,6 +2079,15 @@ static int blkfront_resume(struct xenbus_device *dev)
 			if (!shadow[j].request)
 				continue;
 
+			/*
+			 * Split requests alias one request across two shadow
+			 * slots; skip the sg-less secondary so it completes
+			 * once, like blkif_completion() does.
+			 */
+			if (shadow[j].associated_id != NO_ASSOCIATED_ID &&
+			    shadow[j].num_sg == 0)
+				continue;
+
 			/*
 			 * Get the bios in the request so we can re-queue them.
 			 */
-- 
2.43.0


