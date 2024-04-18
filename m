Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E618A992D
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 13:57:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708257.1106969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxQON-0003hi-3n; Thu, 18 Apr 2024 11:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708257.1106969; Thu, 18 Apr 2024 11:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxQON-0003cn-0u; Thu, 18 Apr 2024 11:57:27 +0000
Received: by outflank-mailman (input) for mailman id 708257;
 Thu, 18 Apr 2024 11:57:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJCO=LX=bounce.vates.tech=bounce-md_30504962.66210aa0.v1-5c38df16014047faaf062015fcbedd17@srs-se1.protection.inumbo.net>)
 id 1rxQOL-0003Zk-Sh
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 11:57:25 +0000
Received: from mail180-8.suw31.mandrillapp.com
 (mail180-8.suw31.mandrillapp.com [198.2.180.8])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d04448ef-fd7a-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 13:57:22 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-8.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4VKx8w64zLz3sN69S
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 11:57:20 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5c38df16014047faaf062015fcbedd17; Thu, 18 Apr 2024 11:57:20 +0000
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
X-Inumbo-ID: d04448ef-fd7a-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1713441440; x=1713701940;
	bh=7w+4W72EJin4JqvsqJb2bySRGGbCS4wlzK0+QcCcLr8=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=RDfmrae3AwPuYeTbP05OxxQNyBtU2FBunsGDUSUKk3pTF51LPIUokuJE4PrN1BXuK
	 rwT/UCMo2gtFqjhW3xCo2sfeN6sHz1TX2lM0SuOjPF+ObtE/JX0CO0CNV5Ar/bBAGd
	 08g0MzHZEPft9yPv9q+3N1t3YuU0xUrpnj54f3TnoMwK8ZhH4X6qQSIlS0iU4Ht1si
	 P42T3xnltNXomyz8ZeBxVp5GO/NJavih2ysKudf5dr4+LZAWALdpeZJiehl/4Er5cC
	 mXJiCzX73nWGj6GIFfwEk2ycA8eayAUMEYZx0ebkmIEkkTmbJkymcS1FTuduF6FZnF
	 mRfkw+Ove+xFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1713441440; x=1713701940; i=teddy.astie@vates.tech;
	bh=7w+4W72EJin4JqvsqJb2bySRGGbCS4wlzK0+QcCcLr8=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=zbzPSzYZkT+RSMuxiWgFzqnY+RbLHdgkfSTd4sCo8mf1H7dNZLNAe3wcgPZe2P6wu
	 Yz3NneJKbmCA+JxZkA1wfnplvJ3cn5tLLU/5kKVnQjZXVp33rRBEeAVifG9ls+1UgI
	 naZ3uAaJq081WmOTuZHafkeOrbGI/uBynzO7NJ3PEP+osU+LxLpGEhE93z/Cq50ZeD
	 JsUVNl6FCXC81ZtJBe0lb5woHuC2D26KPrZSaBMqg7M/3cK7ImiSXIQiClqPdKJk9y
	 /zZLtVGGlXiOQ67xdBh1yhkxublBtpZ/qtcsfpLX3fc+06mWJhVV62lRpdlk4wBq7k
	 ef0CwF/djOjLA==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=20v5=200/3]=20x86/iommu:=20Drop=20IOMMU=20support=20when=20cx16=20isn't=20supported?=
X-Mailer: git-send-email 2.44.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1713441439606
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Message-Id: <cover.1713433029.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5c38df16014047faaf062015fcbedd17?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240418:md
Date: Thu, 18 Apr 2024 11:57:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

All hardware that supports VT-d/AMD-Vi that exists also supports cx16 (aside
specifically crafted virtual machines).

Some IOMMU code paths in Xen consider cases where VT-d/AMD-Vi is supported
while cx16 isn't, those paths may be bugged and are barely tested, dead code
in practice.

Disable IOMMU in case we have IOMMU hardware but no cx16, then cleanup
no-cx16 handling logic from VT-d and AMD-Vi drivers. Also disable
interrupt remapping that also relies on cx16.

Teddy

---

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

Changed in v5:

 * Folded VT-d/AMD-Vi cx16 cleanup patches

Teddy Astie (3):
  x86/iommu: Disable IOMMU if cx16 isn't supported
  VT-d: Cleanup MAP_SINGLE_DEVICE and related code
  x86/iommu: Disable intrerrupt remapping if cx16 is not supported

 xen/drivers/passthrough/amd/iommu_intr.c    |  6 ++
 xen/drivers/passthrough/amd/iommu_map.c     | 42 ++++------
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  6 ++
 xen/drivers/passthrough/vtd/intremap.c      | 70 +++++-----------
 xen/drivers/passthrough/vtd/iommu.c         | 92 +++++++--------------
 xen/drivers/passthrough/vtd/vtd.h           |  5 +-
 6 files changed, 77 insertions(+), 144 deletions(-)

-- 
2.44.0



Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

