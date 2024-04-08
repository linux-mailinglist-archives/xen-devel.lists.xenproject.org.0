Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E964589BFC7
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 15:02:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701950.1096600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtodb-0001DQ-Fe; Mon, 08 Apr 2024 13:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701950.1096600; Mon, 08 Apr 2024 13:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtodb-0001Bg-Cl; Mon, 08 Apr 2024 13:02:15 +0000
Received: by outflank-mailman (input) for mailman id 701950;
 Mon, 08 Apr 2024 13:02:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0myf=LN=bounce.vates.tech=bounce-md_30504962.6613ead3.v1-5b58a5928e67455fbecda3529697de3e@srs-se1.protection.inumbo.net>)
 id 1rtoda-0001Ba-C3
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 13:02:14 +0000
Received: from mail177-6.suw61.mandrillapp.com
 (mail177-6.suw61.mandrillapp.com [198.2.177.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36fbf243-f5a8-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 15:02:12 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-6.suw61.mandrillapp.com (Mailchimp) with ESMTP id 4VCq4M33k1z2K1rvl
 for <xen-devel@lists.xenproject.org>; Mon,  8 Apr 2024 13:02:11 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5b58a5928e67455fbecda3529697de3e; Mon, 08 Apr 2024 13:02:11 +0000
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
X-Inumbo-ID: 36fbf243-f5a8-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1712581331; x=1712841831;
	bh=JQ6LM3Ho+eDAiTb570CdKQbJlPC3483j6ox6dL2ZHI0=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=X8Ne/q5YsO/85iP4k+G0ujsk3B9pzscAqzok+UakHtvKhACd8oUctRO8tHehPY6aL
	 TmNFyRLyiZxirXtOyHusxSX3sl9MvByjZaT6RZLXBtAPQ4kw4XE/Uz97J6AB6rv0pm
	 HOrsqof5o2CKGNoqbg9Yjshi1ns5PMppJ7n8012yvekWiPQ4rNbAahAmqTOS6nRWFG
	 naG80BkZySQRWkV9KZi2v34oys6U/kO7rJvU9xxK0zUc/fHFoPh9MLAyj1pJHW9/3l
	 ewC/T1kr7COfdUPVQ7RXlEUbzPsBYzVJoD1GX9NiyQkk3a3zWZsMZBne0YAOsfDIXo
	 MnTl6860fDDBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1712581331; x=1712841831; i=teddy.astie@vates.tech;
	bh=JQ6LM3Ho+eDAiTb570CdKQbJlPC3483j6ox6dL2ZHI0=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=TKl4RfSotxcoPbP/8QwunrDLmaGOawmbIYv+gqkoEtDcnjfot33CqPZphA/CGyxSJ
	 +NGNOP17LPMBUEPzDF/kfs6PBIifaLe8OSWq3cdof0bmSpGHNh6v3RZ4vgDzzIEImx
	 YhwpWxqzvBvEWnqEcr/uAN1HFuc6wRpwU8nGnNsatSovTMtlHpquLt7HKRRdV4WJmI
	 NW3nHwYQ4rkIs8gN7tbZGOVCsRBf/eJ3urppAvJ+gkRCa4OfYBDaHf+/8munC1ibDi
	 8L6xvmj7x4viuIg4epzVGWCAMznkHs8C1j5e5KZdOI9OZLZB+fgeOA7biHVgJN9dwu
	 ESwTeuE+eWJLw==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=20v2=200/3]=20x86/iommu:=20Drop=20IOMMU=20support=20when=20cx16=20isn't=20supported?=
X-Mailer: git-send-email 2.44.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1712581330187
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Message-Id: <cover.1712580356.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5b58a5928e67455fbecda3529697de3e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240408:md
Date: Mon, 08 Apr 2024 13:02:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

All hardware that supports VT-d/AMD-Vi that exists also supports cx16 (aside
specifically crafted virtual machines).

Some IOMMU code paths in Xen consider cases where VT-d/AMD-Vi is supported
while cx16 isn't, those paths may be bugged and are barely tested, dead code
in practice.

Disable IOMMU in case we have IOMMU hardware but no cx16, then cleanup
no-cx16 handling logic from VT-d and AMD-Vi drivers.

Teddy

Changed in v2:

 * Added cleanup no-cx16 code for x2APIC
 * Fixed commit and code formatting
 * Added missing Suggested-by note

Teddy Astie (3):
  VT-d: Disable IOMMU if cx16 isn't supported
  AMD-Vi: Disable IOMMU if cx16 isn't supported
  VT-d: Cleanup MAP_SINGLE_DEVICE and related code

 xen/arch/x86/apic.c                         |  6 ++
 xen/drivers/passthrough/amd/iommu_map.c     | 42 ++++------
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  6 ++
 xen/drivers/passthrough/vtd/intremap.c      | 65 ++++-----------
 xen/drivers/passthrough/vtd/iommu.c         | 92 +++++++--------------
 xen/drivers/passthrough/vtd/vtd.h           |  5 +-
 6 files changed, 71 insertions(+), 145 deletions(-)

-- 
2.44.0



Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

