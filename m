Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DBD8A5276
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 15:58:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706228.1103321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwMqX-0002ja-Bk; Mon, 15 Apr 2024 13:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706228.1103321; Mon, 15 Apr 2024 13:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwMqX-0002iS-8R; Mon, 15 Apr 2024 13:58:09 +0000
Received: by outflank-mailman (input) for mailman id 706228;
 Mon, 15 Apr 2024 13:58:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KTTO=LU=bounce.vates.tech=bounce-md_30504962.661d326b.v1-3f53356a234540f5b7dcdb8ce226b42f@srs-se1.protection.inumbo.net>)
 id 1rwMqW-0002hb-2M
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 13:58:08 +0000
Received: from mail5.us4.mandrillapp.com (mail5.us4.mandrillapp.com
 [205.201.136.5]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e216879-fb30-11ee-94a3-07e782e9044d;
 Mon, 15 Apr 2024 15:58:05 +0200 (CEST)
Received: from pmta15.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail5.us4.mandrillapp.com (Mailchimp) with ESMTP id 4VJ7zc08GZzDRHx8N
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2024 13:58:04 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 3f53356a234540f5b7dcdb8ce226b42f; Mon, 15 Apr 2024 13:58:03 +0000
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
X-Inumbo-ID: 2e216879-fb30-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1713189484; x=1713449984;
	bh=BzKnsmB4jyVFuAlTsX3hEq7RfO+rPuia5QX7Cge2lFc=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=vzByzrynWrLloem+/VHrppcnmUGl6PxxhtJjmJ0wvpShjt7H30tEhko/fk8VytNVB
	 hxysOKSgWkk9QN/sagBv5G5lOF1i502yu1YuAOamI5QPFNz//Dn4IIqKqex0KNkKj9
	 v5uSQ80+w2J1z1M1TwOmFjsOMfPUPjY6nJ7eLvujHZrtAy+qZv3UIkIAffbJmY+ysq
	 hA61VsGMZiT7A/6hU0bhljaTwo3OlCRM5Fb3jwkfTZu7pCm7QoFJYyyx2eo17RAeFg
	 fhbHt9ZGeotiwZCy29aPGa3QWP0Y1X7noLbwfuGqFA9MuTvuXH4sJ12ejzCnGlG7w7
	 NTJACYS7bQo+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1713189484; x=1713449984; i=teddy.astie@vates.tech;
	bh=BzKnsmB4jyVFuAlTsX3hEq7RfO+rPuia5QX7Cge2lFc=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=at4TE6OZY6cvK2SPZJEllwXfs2kWf+BrMpBjECvNV/Rv5DYr5oLWkbZGIP+AHEcRx
	 pvU77Ha7Zhvz+ZK9YC6WD3pZCHm36reHwlDb3CyBRRQkfrhdqrCMwEgPSpZzz9pHFE
	 VHSU82sNOIhGSlEZHVPs0L8dyVfBPO9ArZdLl0WrPKqkInaHbI0KMgm1DwXeuTHdPS
	 sEbETvNilfs8CCZBdBha85gfOMvOmhgHsdL6B8cxIwcRKbehJl9BucUa0cylOKL8fN
	 SEcjYtSFGiAOj14WK3OAHNscHPI3mBO4Yf4eLBxyWts0F7fO2lE6wQ0INXhcmGH0Wp
	 UpwNSqGt0QkZA==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=20v4=200/5]=20x86/iommu:=20Drop=20IOMMU=20support=20when=20cx16=20isn't=20supported?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1713189481572
Message-Id: <32d39e38-b128-48f9-ab26-4c69c77cda9c@vates.tech>
To: xen-devel@lists.xenproject.org
References: <cover.1713174878.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1713174878.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.3f53356a234540f5b7dcdb8ce226b42f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240415:md
Date: Mon, 15 Apr 2024 13:58:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 15/04/2024 =C3=A0 14:15, Teddy Astie a =C3=A9crit=C2=A0:
> All hardware that supports VT-d/AMD-Vi that exists also supports cx16 (as=
ide
> specifically crafted virtual machines).
> 
> Some IOMMU code paths in Xen consider cases where VT-d/AMD-Vi is supporte=
d
> while cx16 isn't, those paths may be bugged and are barely tested, dead c=
ode
> in practice.
> 
> Disable IOMMU in case we have IOMMU hardware but no cx16, then cleanup
> no-cx16 handling logic from VT-d and AMD-Vi drivers. Also disable
> interrupt remapping that also relies on cx16.
> 
> Teddy Astie (5):
>    VT-d: Disable IOMMU if cx16 isn't supported
>    AMD-Vi: Disable IOMMU if cx16 isn't supported
>    VT-d: Cleanup MAP_SINGLE_DEVICE and related code
>    VT-d: Disable intrerrupt remapping if cx16 is not supported
>    AMD-Vi: Disable intrerrupt remapping if cx16 is not supported
> 
>   xen/drivers/passthrough/amd/iommu_intr.c    |  6 ++
>   xen/drivers/passthrough/amd/iommu_map.c     | 42 ++++------
>   xen/drivers/passthrough/amd/pci_amd_iommu.c |  6 ++
>   xen/drivers/passthrough/vtd/intremap.c      | 70 +++++-----------
>   xen/drivers/passthrough/vtd/iommu.c         | 92 +++++++--------------
>   xen/drivers/passthrough/vtd/vtd.h           |  5 +-
>   6 files changed, 77 insertions(+), 144 deletions(-)
> 

Here is the patch history that got lost for some reason in this cover.

Changed in v2:

  * Added cleanup no-cx16 code for x2APIC
  * Fixed commit and code formatting
  * Added missing Suggested-by note

Changed in v3:

  * Use -ENODEV instead of -ENOSYS.

Changed in v4:

  * Reworded "Disable IOMMU if cx16 isn't supported"
  * Moved interrupt remapping cleanup in separate patches
  * Check cx16 for interrupt remapping in driver's callbacks rather than 
in x2apic_bsp_setup

Teddy

---


Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


