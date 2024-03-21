Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE15885790
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 11:41:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696305.1087162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnFrU-0003g5-A8; Thu, 21 Mar 2024 10:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696305.1087162; Thu, 21 Mar 2024 10:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnFrU-0003ZO-4o; Thu, 21 Mar 2024 10:41:28 +0000
Received: by outflank-mailman (input) for mailman id 696305;
 Thu, 21 Mar 2024 10:28:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fSjw=K3=bounce.vates.tech=bounce-md_30504962.65fc0bc9.v1-eb479812074546b5afbb57b56b3defaa@srs-se1.protection.inumbo.net>)
 id 1rnFex-0007v6-C7
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 10:28:31 +0000
Received: from mail135-12.atl141.mandrillapp.com
 (mail135-12.atl141.mandrillapp.com [198.2.135.12])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1b4683c-e76d-11ee-afe0-a90da7624cb6;
 Thu, 21 Mar 2024 11:28:29 +0100 (CET)
Received: from pmta14.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail135-12.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4V0hWG0743z705xhC
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 10:28:26 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 eb479812074546b5afbb57b56b3defaa; Thu, 21 Mar 2024 10:28:25 +0000
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
X-Inumbo-ID: c1b4683c-e76d-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1711016906; x=1711277406;
	bh=bRgIlyJ6IbTuuXiog1EKxOiaZ1bQd5ybOrwG+UdBIvY=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=oifZv/JBfe9AzXx/S9lTFdeECrw8Zf7+gLOeKA3E38WdrsgQmqRvBECTFoN5wOBIW
	 Lu6DBseVRLBEKpBCR/dyl+31dxnxGzAxjNYhj/ALFoW2lleOrfjBpArcdny2gqMrNY
	 6xkdxTF69VpK4cz8lo5xn/ARfEX59Hy4TMf36n1hrfuihIzoDswPginQ9uWdE/8jQB
	 jOaNkPgpXkve0+mGzrJnFy+kI/6X01vTUBoZa0rvH/d+BKASmkvga1EZ2GFpATqf3h
	 7AEs0RDk2MMQEW6sWBB16SSCT8e3dyXr/tCyh2PIusKMVnoDubnLQ4bCij3rIiQio+
	 hfFnldYg5zLIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1711016906; x=1711277406; i=teddy.astie@vates.tech;
	bh=bRgIlyJ6IbTuuXiog1EKxOiaZ1bQd5ybOrwG+UdBIvY=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=sGIm+cedcPgiusNjayVJc52YBK6yvRB6+Ls98mgPQ6G1046QfObBCY3yc1hG/ONUY
	 ucA8b4KB/BDomZGtu6R/olKpshS8IuQINENopQfjcaq/NhXe3J/t6Xhypovd6TpseA
	 aENVvz7kaINZgXkuvl+dADkgd07lXXyxTXJIX5LrA4QMar0UqZfxfIclwvFKS6TbwL
	 CdRYbsUYs72BI6tiIkCogAhRlk0CuIvVHoFsYTc7cvXyXB9dS7Km++VxF5YRE7Tu8W
	 RNVxzrIKiU3cRBy4Dz4KtP/AiMCIY/tZSKHx9cL/GIL9F/W27vwVN0RT94Oc/j2Etj
	 4aZuKt1lSf1hw==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=200/3]=20x86/iommu:=20Drop=20IOMMU=20support=20when=20cpu=20doesn't=20support=20cx16.?=
X-Mailer: git-send-email 2.44.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1711016905266
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>
Message-Id: <cover.1711016106.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.eb479812074546b5afbb57b56b3defaa?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240321:md
Date: Thu, 21 Mar 2024 10:28:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

All hardware that supports VT-d/AMD-Vi that exists also supports cx16 (aside specifically crafted virtual machines).

Some IOMMU code paths in Xen consider cases where VT-d/AMD-Vi is supported while cx16 isn't, those paths may be bugged and are barely tested, dead code in practice.

Consider disabling IOMMU in case we have IOMMU hardware but no cx16, then cleanup no-cx16 handling logic from VT-d and AMD-Vi drivers.

Teddy Astie (3):
  VT-d: Disable IOMMU if cx16 isn't supported
  AMD-Vi: Disable IOMMU if cx16 isn't supported
  VT-d: Cleanup MAP_SINGLE_DEVICE and related dead code.

 xen/drivers/passthrough/amd/iommu_map.c     | 43 ++++------
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  6 ++
 xen/drivers/passthrough/vtd/intremap.c      | 67 ++++-----------
 xen/drivers/passthrough/vtd/iommu.c         | 92 +++++++--------------
 xen/drivers/passthrough/vtd/vtd.h           |  5 +-
 5 files changed, 67 insertions(+), 146 deletions(-)

-- 
2.44.0



Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

