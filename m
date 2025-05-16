Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F3DAB9A30
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 12:31:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986856.1372392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsLo-0004yg-7r; Fri, 16 May 2025 10:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986856.1372392; Fri, 16 May 2025 10:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsLo-0004wq-4K; Fri, 16 May 2025 10:31:36 +0000
Received: by outflank-mailman (input) for mailman id 986856;
 Fri, 16 May 2025 10:31:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vian=YA=bounce.vates.tech=bounce-md_30504962.68271272.v1-26fc1f1497074d24a6572d1c605778cd@srs-se1.protection.inumbo.net>)
 id 1uFsFI-0000kS-NX
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 10:24:52 +0000
Received: from mail187-4.suw11.mandrillapp.com
 (mail187-4.suw11.mandrillapp.com [198.2.187.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffd42512-323f-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 12:24:51 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-4.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4ZzNVp20C8zlfcMZ
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 10:24:50 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 26fc1f1497074d24a6572d1c605778cd; Fri, 16 May 2025 10:24:50 +0000
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
X-Inumbo-ID: ffd42512-323f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1747391090; x=1747661090;
	bh=lPXqp2js7vt00YaTBMUsWA+9FdXRi2GQpFRihsFOl30=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=s+sHoJ0eyQzfCTB2nT0EItF49M6MwcQqXVhGklNcZ8O5YHLcHlJbVMTiXV/68RB2F
	 T/O2y1MtmHFlf7DgOq2qMMbnat6Q381r53wsF1dE3l4qHrzL3g29htS8KC4GsEaUZC
	 +6ss4KnPoicPic3B8KmevO9CPxn40f/itRtMfBEM5KSKmEAkk3NKKva6+3RLzGpoHx
	 mjlISCXb8a+4F+sXBdD3EUKI0c9IM3zO/h4OeXTLtnfNzfn/OMeRwB3qwhyCZGeeD/
	 G1OlDWfn2ReZcflLk/MVXfiIhDjwT4+TbJsBb5vE62ZEXQeEu+DdOalTGvPrqzfyiC
	 zyLE0Ev1MQHuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1747391090; x=1747651590; i=teddy.astie@vates.tech;
	bh=lPXqp2js7vt00YaTBMUsWA+9FdXRi2GQpFRihsFOl30=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=l+1h2LX+iOCvWdCT8w/r0sAX+gA8ejuFRSzeHDK3B97fbdHgxMwrOReEagGjB9dqm
	 QnwlbgiTkxDZxKyQ6PxApNR/pyWD2Bzapa8Qw/sfhzii/5BCmj/hOdcpGAeVeyUdjn
	 uzpqUq13p4WV0SQ0rc/GxCi2sMR2NX5RGMww20d1VYaqj/k93jBsiXL1lEj5vipFlj
	 xKML5LximY8+d/ncP8JNsGhYbnflYmaJZReTG7oOkVbJwLOQg/xxK4LkhPTxqxPJr2
	 X5/+aFU3pSCB+BTDCLesgqwflgY4ZuJCrw9HylOJg+ysL6NAy3NOfA8AHxxDG6e/B+
	 jq1N1NdTIIcTQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=2015/16]=20HACK:=20coco:=20Leak=20ASID=20for=20coco=20guests?=
X-Mailer: git-send-email 2.49.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1747391089320
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <fb33a88071da5c4d4bdddbd38882534489194cd7.1747312394.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1747312394.git.teddy.astie@vates.tech>
References: <cover.1747312394.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.26fc1f1497074d24a6572d1c605778cd?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250516:md
Date: Fri, 16 May 2025 10:24:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

In order to reuse a ASID in a SEV guest, we need to perform a
WBINVD on all pCPUs that ran the guest, then a DF_FLUSH on the PSP.

Just leak the ASID for now.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/hvm/hvm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index d3060329fb..ced58ccf4b 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -795,7 +795,10 @@ void hvm_domain_destroy(struct domain *d)
         list_del(&ioport->list);
         xfree(ioport);
     }
-    hvm_asid_free(&d->arch.hvm.asid);
+    if ( !is_coco_domain(d) )
+        hvm_asid_free(&d->arch.hvm.asid);
+    else
+        printk("coco: Leaking ASID %x: TODO (DF_FLUSH handling)\n", d->arch.hvm.asid.asid);
     destroy_vpci_mmcfg(d);
 
 }
-- 
2.49.0



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


