Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26966BA9370
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 14:37:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132879.1471101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3D7M-0000Kl-BK; Mon, 29 Sep 2025 12:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132879.1471101; Mon, 29 Sep 2025 12:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3D7M-0000Hp-8S; Mon, 29 Sep 2025 12:36:36 +0000
Received: by outflank-mailman (input) for mailman id 1132879;
 Mon, 29 Sep 2025 12:36:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jTdn=4I=bounce.vates.tech=bounce-md_30504962.68da7d4e.v1-6fa71c65d6dc4ebbb0a9e75aa3c277f5@srs-se1.protection.inumbo.net>)
 id 1v3D7K-0000Hj-GO
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 12:36:34 +0000
Received: from mail132-16.atl131.mandrillapp.com
 (mail132-16.atl131.mandrillapp.com [198.2.132.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed8d4d53-9d30-11f0-9d14-b5c5bf9af7f9;
 Mon, 29 Sep 2025 14:36:32 +0200 (CEST)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-16.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4cb0zz09xHzB5pFhv
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 12:36:31 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 6fa71c65d6dc4ebbb0a9e75aa3c277f5; Mon, 29 Sep 2025 12:36:30 +0000
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
X-Inumbo-ID: ed8d4d53-9d30-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1759149391; x=1759419391;
	bh=YnSW9gELxUcxloQJ2wKYxscreQekHZqw75K18b2Lbho=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=tRKtT+grGRD7c/odQU2LEoKSB7rhYzUyieCQ39ahD2J75bQPKD1priTmgK6nlh+Kz
	 XGwbKBUtPlh92RSYzg+TOFvR/5qv5ByQSdWsBR7/OTLpV7F7fFSCbuOXReHD4TO/RK
	 oRW5NXp4aAt5n6ADDRAqsQmjjWER/oJ1H7hN5MGXwqexQlD8bZkIazsO4IwOnx6SEF
	 J1+Qqg7/ZDcfmg24DBSH3TvI8a9DJHkNwAxkRXqR8GU5sSz/y92NF07zD4XVElLa7n
	 tbcR+5RK1VyNmaooytsRtZk76uO0khiKJePecckMkmJgKDO/cxgT3ib+G9xFW3aMY+
	 79fWXm8ENRhgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1759149391; x=1759409891; i=teddy.astie@vates.tech;
	bh=YnSW9gELxUcxloQJ2wKYxscreQekHZqw75K18b2Lbho=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Tg0g1LnoGgLI0Fvzw9egH0Ox/2EpcBByDwFKo8uQW3WLSDO4TbdzRdCR3xyH84iFf
	 XrBw4BSX6zcvZW7ukHxCjhsjlJhhjtHKxNZwwELQ5kPspsnrWQ/FXo9OEOt457RnVB
	 dEZxTi92FOxIbK4SozFUY5gkz85zEzyd3ivLgF8+6ofui48rUoasM7kAVr/1LTMa15
	 Mut9i2mdGIrghnkSh7baP3Shz95gGFAtDnOSBQtywn9ob+luOkVcaQ7c0izu6PXSLK
	 oYkFxlEOo5nedZOKnNEmLIihOBPDPnRTpdaYIp4KSJpthaRSf12PINNm2+MUSecLKx
	 bgdKIORh83cRg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20x86/hap:=20Inline=20"flush=5Fvcpu"=20in=20"flush=5Ftlb"?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1759149389822
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <bb570008f237cb77f2c74c5f025375ca6c4f140a.1759148418.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.6fa71c65d6dc4ebbb0a9e75aa3c277f5?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250929:md
Date: Mon, 29 Sep 2025 12:36:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

flush_vcpu static function here is only used in one place which is just below
where it is defined. Inline the function to reduce the noise and clarify
what we are doing.

No functional change.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/mm/hap/hap.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 2f69ff9c7b..407c80afab 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -721,11 +721,6 @@ static pagetable_t cf_check hap_update_cr3(struct vcpu *v, bool noflush)
     return pagetable_null();
 }
 
-static bool flush_vcpu(const struct vcpu *v, const unsigned long *vcpu_bitmap)
-{
-    return !vcpu_bitmap || test_bit(v->vcpu_id, vcpu_bitmap);
-}
-
 /* Flush TLB of selected vCPUs.  NULL for all. */
 static bool cf_check flush_tlb(const unsigned long *vcpu_bitmap)
 {
@@ -742,7 +737,7 @@ static bool cf_check flush_tlb(const unsigned long *vcpu_bitmap)
     {
         unsigned int cpu;
 
-        if ( !flush_vcpu(v, vcpu_bitmap) )
+        if ( vcpu_bitmap && !test_bit(v->vcpu_id, vcpu_bitmap) )
             continue;
 
         hvm_asid_flush_vcpu(v);
-- 
2.51.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


