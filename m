Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D91C8E830
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 14:39:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173861.1498885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOcDt-0008GV-51; Thu, 27 Nov 2025 13:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173861.1498885; Thu, 27 Nov 2025 13:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOcDt-0008Dn-1t; Thu, 27 Nov 2025 13:39:49 +0000
Received: by outflank-mailman (input) for mailman id 1173861;
 Thu, 27 Nov 2025 13:39:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V9Ld=6D=bounce.vates.tech=bounce-md_30504962.6928549c.v1-f6bdf73267e24ad58f58833a5a32f85c@srs-se1.protection.inumbo.net>)
 id 1vOcDr-0007qN-29
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 13:39:47 +0000
Received: from mail132-18.atl131.mandrillapp.com
 (mail132-18.atl131.mandrillapp.com [198.2.132.18])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 867166d9-cb96-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 14:39:41 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-18.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4dHHbc2h8WzCf9XsP
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 13:39:40 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f6bdf73267e24ad58f58833a5a32f85c; Thu, 27 Nov 2025 13:39:40 +0000
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
X-Inumbo-ID: 867166d9-cb96-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1764250780; x=1764520780;
	bh=thBPwpCdaOZGJV5TWAllKK33OhFnY55OPorBf+4bLqU=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=QfuXrUYc4XnbI+pzTl1aARchA7yYhnETOdD8yISoCYlUKoAr2Pp6a0CcLQnbfiXJ+
	 xaZtGmQQguRDKhmzjxRG0k/qNnzs5EIMnBY0mp7564FrQ2xey0yCtlvD6/A3xLp13g
	 bV5NgyXKflSn+5Yzyca63+VCGFNVGh062m0Do4ArV/6qiyL8Igv/n7yOl2j11yUxfn
	 qV/e4jMNnZlznzVuRsKb+3EDoCzBGXWgtY5EBlF5h13Cogi/6xg3OijmcH4NPAgcOL
	 rsAuy4yAntUcnm6I2Jr5iS1+qTCw2Gmy0h7hVMXO4IMpc/+F36TX4CalLA5hTCPKNm
	 nXzUWQWbm4jAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1764250780; x=1764511280; i=teddy.astie@vates.tech;
	bh=thBPwpCdaOZGJV5TWAllKK33OhFnY55OPorBf+4bLqU=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=U3pwQzuXkV+Jq/Sn7vDo/+wGH/jmAJxZCgn5uTsm4UzF50z+zbAb/6Ym0U45X4rQr
	 zy53Y4t1ockktlu8ESaKwsOYIhPGC9K3ZGmJxg5vZ6bDZ7+TmXMp83kOc7cGkIShpK
	 2VtOEHss6i6cxgi37y1+CnWLz55Jxb2l7nJMOCX5Emgopv42wAHJlQYdG9CHyHZkJh
	 z9JoV6X4VZ4ez+zIMR55P/BX6snHD2JNdbvFXKfC5pS3kDJVOEWJiApRel71VIkjSn
	 Be8m2hCW566NGGiKnE44J0+X70K7T7SqoVQKp8qiQnA5koGXmI1kb6RGgIs+VAcPEw
	 BzLgcFrJNby+Q==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=201/4]=20x86/ept:=20Drop=20shadow=20mode=20check=20in=20ept=5Fsync=5Fdomain()?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1764250779412
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <f63e38b0edbc2c49a7849af8896089c7f21c8956.1764248710.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1764248710.git.teddy.astie@vates.tech>
References: <cover.1764248710.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f6bdf73267e24ad58f58833a5a32f85c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251127:md
Date: Thu, 27 Nov 2025 13:39:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

This function can only be reached from EPT-related code which is inherently
HAP. Thus it is not useful to check for shadow_paging (or lack of HAP) there.

Moreover, it is an error to call this function in the non-EPT cases.

Not a functional change.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
This function is only called through EPT code and by vmx_domain_update_eptp()
called by EPT log-dirty logic, and doesn't look reachable from shadow paging
code.

I think the original reason of this check was for eventually allowing guests to
use both shadow paging and HAP and switch between the 2 dynamically.

 xen/arch/x86/mm/p2m-ept.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index ce4ef632ae..dfdbfa0afe 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -1268,9 +1268,10 @@ static void ept_sync_domain_mask(struct p2m_domain *p2m, const cpumask_t *mask)
 void ept_sync_domain(struct p2m_domain *p2m)
 {
     struct domain *d = p2m->domain;
+    ASSERT(hap_enabled(d));
 
-    /* Only if using EPT and this domain has some VCPUs to dirty. */
-    if ( paging_mode_shadow(d) || !d->vcpu || !d->vcpu[0] )
+    /* Only if this domain has some VCPUs to dirty. */
+    if ( !d->vcpu || !d->vcpu[0] )
         return;
 
     ept_sync_domain_prepare(p2m);
-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


