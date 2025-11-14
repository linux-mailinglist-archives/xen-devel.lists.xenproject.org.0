Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F9CC5D3B4
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 14:05:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162650.1490218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJtUX-0005ab-T6; Fri, 14 Nov 2025 13:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162650.1490218; Fri, 14 Nov 2025 13:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJtUX-0005XU-Q9; Fri, 14 Nov 2025 13:05:29 +0000
Received: by outflank-mailman (input) for mailman id 1162650;
 Fri, 14 Nov 2025 13:05:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V5eX=5W=bounce.vates.tech=bounce-md_30504962.69172911.v1-9da0dd0ef9aa453886466546575bd6d2@srs-se1.protection.inumbo.net>)
 id 1vJtUW-0005XM-Kk
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 13:05:28 +0000
Received: from mail180-15.suw31.mandrillapp.com
 (mail180-15.suw31.mandrillapp.com [198.2.180.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93cf890c-c15a-11f0-980a-7dc792cee155;
 Fri, 14 Nov 2025 14:05:22 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-15.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4d7HS12QYyzPm0ZmR
 for <xen-devel@lists.xenproject.org>; Fri, 14 Nov 2025 13:05:21 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9da0dd0ef9aa453886466546575bd6d2; Fri, 14 Nov 2025 13:05:21 +0000
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
X-Inumbo-ID: 93cf890c-c15a-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1763125521; x=1763395521;
	bh=It5TUr8BuYqVt4O3sGG623FLGRNdl49Ql9BxMXSKPpc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=ge9zS8PWJP+ThMA20WNhisg8Pmrvt1wm0IkuOJ5PqRkOcWFc1wAiiZ7w42Oxm8Bxr
	 DGe+lt8IlQg+N5PmMBv2+oIRM/m7rk0E+uW0hrGOSYF8dXkghc1CnAiR/+CFWoQPuo
	 zLWodP7bV9fyWTbgWU9erq4gOWDddfcNdAeg1g1w5wVWuankOpaA6NAFifGzlGGKIw
	 OSzdquel8XzhUWE4w8EMdil43UyeHifsmWRjXW6skJBtSZUvlH4ehK+NwQbxr0CXfh
	 j+Kf6JNN/6D38VkUh+2oBwURT6iJTiIzOTRsPf17ydfOevmn9wLPv66CwWrRvRzYIB
	 SdIMEG75DrplA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1763125521; x=1763386021; i=teddy.astie@vates.tech;
	bh=It5TUr8BuYqVt4O3sGG623FLGRNdl49Ql9BxMXSKPpc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=0jDB+2ZC4MPia9N9tJh8xSMrJB3HOiIgs4crDs3ff/S0AaHWmpfEoImsQXExy0LTr
	 3BXCGyrqf4gIextglPYjc7+Iz25QZbUJTLZKGWVeUZ7n6bClbk4tO6+KVSCVILs49I
	 V0rtT9fSnOmoFgoSVa9qD0nnYc5XbqDqfmBnMr//KIP7WYqgSWP7PLO1Tvb+bEJ4Rn
	 Rr4jkQnqpVkyvK8+tZ5ObzV1/ecXnxtQ9vqMXAHs/Ecf+68S6WojMC/LJX0aGDHthT
	 NVpr65TgXTURamf5YDCrE7cbWDXDygqaEGpC+/nk+LS/jWZVviVnsZHUJD7wp6RKua
	 OPZEjCDXZgZqw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20ioreq:=20Assert=20with=20out=20of=20bounds=20vCPU=20ID?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1763125519558
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <f4146ec2fa354ab6a64d96eca831fe0be97f281b.1763124998.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9da0dd0ef9aa453886466546575bd6d2?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251114:md
Date: Fri, 14 Nov 2025 13:05:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

A 4K page appears to be able to hold 128 ioreq entries, which luckly
matches the current vCPU limit. However, if we decide to increase the
domain vCPU limit, that doesn't hold anymore and this function would now
silently create a out of bounds pointer leading to confusing problems.

All architectures have no more than 128 as vCPU limit on HVM guests,
and have pages that are at most 4 KB, so this case doesn't occurs in
with the current limits.

Assert if the vCPU ID will lead to a out of bounds pointer.

No functional change.

Reported-by: Julian Vetter <julian.vetter@vates.tech>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
Not sure if this is the best approach, perhaps preventing compilation if the
vCPU limit is higher than what the ioreq page can hold is preferable ?

 xen/common/ioreq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index f5fd30ce12..b2ef46ed7b 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -99,6 +99,7 @@ static ioreq_t *get_ioreq(struct ioreq_server *s, struct vcpu *v)
 
     ASSERT((v == current) || !vcpu_runnable(v));
     ASSERT(p != NULL);
+    ASSERT(v->vcpu_id < (PAGE_SIZE / sizeof(struct ioreq)));
 
     return &p->vcpu_ioreq[v->vcpu_id];
 }
-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


