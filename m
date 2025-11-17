Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC7DC64157
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 13:36:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163703.1490783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKySQ-0005dg-4G; Mon, 17 Nov 2025 12:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163703.1490783; Mon, 17 Nov 2025 12:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKySQ-0005cD-1d; Mon, 17 Nov 2025 12:35:46 +0000
Received: by outflank-mailman (input) for mailman id 1163703;
 Mon, 17 Nov 2025 12:35:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U5OC=5Z=bounce.vates.tech=bounce-md_30504962.691b169a.v1-9d57f880a78d4269b44695c32720c3ff@srs-se1.protection.inumbo.net>)
 id 1vKySP-0005c7-8b
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 12:35:45 +0000
Received: from mail128-17.atl41.mandrillapp.com
 (mail128-17.atl41.mandrillapp.com [198.2.128.17])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec6eebfa-c3b1-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 13:35:39 +0100 (CET)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-17.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4d96fL2YHqzCfDYPy
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 12:35:38 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9d57f880a78d4269b44695c32720c3ff; Mon, 17 Nov 2025 12:35:38 +0000
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
X-Inumbo-ID: ec6eebfa-c3b1-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1763382938; x=1763652938;
	bh=OTcYBpW3DFwg6yb++UPu5qkISFQJwQ+nog7+BvPyFtQ=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=hboBF5WfOKy00mq7EZ8SaQwGyNmh3Q3mSllJ6/usrCXS3uOsAH/k780A7UPYWtCHk
	 9/HRbZ5hT2D2WceVYhq5P/MWmYWWa4pQhSd10XOEX/mwheeGXd6AZWzFcGd5QHAqOW
	 Qbv5ziIXmp9F7e79KLGEWyT9byC7nJKdususT36qobYgFZ7kFUuQnEEP/8OgnujIz/
	 WeeTd1liMb7JobB+x2y4YTCFJ8Jyhy/x8QOjExSUHZ+Gv94cYxGavbwPmCBMcdXcww
	 RYNKnz7C1YXQmnehM71KMN4uV3HzReIw6wi3mMTOpkWOUE6mUUQxfMC0bgjiJToUAM
	 WnaH6ZVUIOKVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1763382938; x=1763643438; i=teddy.astie@vates.tech;
	bh=OTcYBpW3DFwg6yb++UPu5qkISFQJwQ+nog7+BvPyFtQ=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=RcgZsdFcvQedX6Amr8SlJ7Ihbpj/yRSrVUqwrpKtzNkA6QS8TK2q0DQttL7GuTQEF
	 TbF4+WKHthROTVC/z60BVYveKPTkIvixPA7pnJFMtUkOkEif8Y4bAD2zzE4/cXbDYT
	 8uqZQPHbdl96Bk/QSbvjP9lMNlb3HsWD4AwNa2NBeiT7LgRPZi9Sa2C4Q0Kagk62Iq
	 Y7numIXHCFj+v7RLfeB9ZSGPOThb1Kz5DMFUMh4KondJ/omvPpG674wl9SNw1PUSjf
	 qU7JM2ZlQRFONvaVK/xUp0g6O3rrJkLm4cFXlP7pTWWI3v6o834Yw8zRX7NmwGz1q7
	 rzTwwKofNmuiQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v3]=20ioreq:=20Make=20sure=20ioreq=20is=20always=20in-bounds?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1763382936944
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <dddbae09e8e6b94a20f5ce24f3560dd15e5c6c01.1763382746.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9d57f880a78d4269b44695c32720c3ff?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251117:md
Date: Mon, 17 Nov 2025 12:35:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

A 4K page appears to be able to hold 128 ioreq entries, which luckly
matches the current vCPU limit. However, if we decide to increase the
domain vCPU limit, that doesn't hold anymore and this function would now
silently create a out of bounds pointer leading to confusing problems.

All architectures with ioreq support don't support 128 vCPU limit for
HVM guests, and  have pages that are at least 4 KB large, so this case
doesn't occurs in with the current limits.

For the time being, make sure we can't make a Xen build that can
accidentally make a out of bounds pointers here.

No functional change.

Reported-by: Julian Vetter <julian.vetter@vates.tech>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
v3:
 - make it a BUILD_BUG_ON instead (compile-time check)
v2:
 - check and report instead of ASSERT and eventually crash offending domain

 xen/common/ioreq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index f5fd30ce12..7a0421cc07 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -99,6 +99,7 @@ static ioreq_t *get_ioreq(struct ioreq_server *s, struct vcpu *v)
 
     ASSERT((v == current) || !vcpu_runnable(v));
     ASSERT(p != NULL);
+    BUILD_BUG_ON(HVM_MAX_VCPUS > (PAGE_SIZE / sizeof(struct ioreq)));
 
     return &p->vcpu_ioreq[v->vcpu_id];
 }
-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


