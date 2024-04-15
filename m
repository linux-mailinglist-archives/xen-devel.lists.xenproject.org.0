Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F24F58A4EBA
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 14:17:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706126.1103201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwLGE-0007EX-SF; Mon, 15 Apr 2024 12:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706126.1103201; Mon, 15 Apr 2024 12:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwLGE-00075v-M2; Mon, 15 Apr 2024 12:16:34 +0000
Received: by outflank-mailman (input) for mailman id 706126;
 Mon, 15 Apr 2024 12:16:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pS0x=LU=bounce.vates.tech=bounce-md_30504962.661d1a9d.v1-caa6bf1133c14d1cae10a4a7408ac7e0@srs-se1.protection.inumbo.net>)
 id 1rwLGD-0006Sb-K3
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 12:16:33 +0000
Received: from mail145-16.atl61.mandrillapp.com
 (mail145-16.atl61.mandrillapp.com [198.2.145.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe1b57c1-fb21-11ee-b908-491648fe20b8;
 Mon, 15 Apr 2024 14:16:31 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-16.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4VJ5kP5ZkLz8XRtNC
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2024 12:16:29 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 caa6bf1133c14d1cae10a4a7408ac7e0; Mon, 15 Apr 2024 12:16:29 +0000
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
X-Inumbo-ID: fe1b57c1-fb21-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1713183389; x=1713443889;
	bh=B+c7RehFkAuxaWjjcCy94ZxQGcqvvJ7UfjtxAPt1lFo=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=tJWK3kjKGaJ5ODKmCTaMtkpaAF3SUTDZLG4NY4MZ5cniSka81DmQxs5DWkMbE49DC
	 gXqfMSEnMxibuJO+vl261kCg26QdXwDT5bufrCwbDFVT9ZwDS7jmBGbAz0VCQ24x13
	 NM2XWVFymftX1VfAjoYQW3i3g5gBqIb4D5EmCdC97UDIlBX5W+Fam0znXwdOT+l8IG
	 LuPrZaDrCG4w5GKRvRVQbNcdasvCXYjrFqoB2gk611z4qpsKkYv1nb6HxFxQ6a4iw3
	 SbXIN1pLe5jYqnzmjowJ6/B8BK8cUpylyZWfexe9onQLIeuHB8JnNywgLhWXWhly5n
	 HMpx/kNXgDNUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1713183389; x=1713443889; i=teddy.astie@vates.tech;
	bh=B+c7RehFkAuxaWjjcCy94ZxQGcqvvJ7UfjtxAPt1lFo=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=q03gxlrm5nJiiJuHIPlVeR0H0pmoUMGynKNNJ8AIketBg/xvhJe9Eq7Icj3r4brOc
	 mOvWK14uNZBWgob5C/w11EKDOz1F60WtOj1llO1bfTTKPDscA1EK/ME1NuTx0HQwZa
	 d/Rmn39iqvHXOXsmlhx6+AxG73wYF9PW8QdFJJPYg79NtXuvfPTPjntMY5xKTvOqB1
	 IpGM0Fv+CO0qJ2jGfBXmdZ8g/0FSbu6DzxUK/37+ZrdE4CZ+nJsWbAWIDGx+Ue+nKK
	 +RYqCBayUsoA58e/8elFYemTw5Y1oJplaibW135CNcghDh1lIk5IzV+Feo0m2GCegZ
	 oOY9NXhxg4sTg==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=20v4=205/5]=20AMD-Vi:=20Disable=20intrerrupt=20remapping=20if=20cx16=20is=20not=20supported?=
X-Mailer: git-send-email 2.44.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1713183387341
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>
Message-Id: <26557d23386030166e89dfee240d99d07def6021.1713174878.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1713174878.git.teddy.astie@vates.tech>
References: <cover.1713174878.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.caa6bf1133c14d1cae10a4a7408ac7e0?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240415:md
Date: Mon, 15 Apr 2024 12:16:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

All hardware with AMD-Vi has CMPXCHG16 support.  Check this at initialisation
time, and remove the effectively-dead logic for the non-cx16 case.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/drivers/passthrough/amd/iommu_intr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index 7fc796dec2..9ab7c68749 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -649,6 +649,12 @@ bool __init cf_check iov_supports_xt(void)
     if ( !iommu_enable || !iommu_intremap )
         return false;
 
+    if ( unlikely(!cpu_has_cx16) )
+    {
+        AMD_IOMMU_WARN("CPU doesn't support CMPXCHG16B, disable interrupt remapping\n");
+        return false;
+    }
+
     if ( amd_iommu_prepare(true) )
         return false;
 
-- 
2.44.0



Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

