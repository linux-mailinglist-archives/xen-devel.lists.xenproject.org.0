Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D268A4EB6
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 14:17:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706122.1103166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwLGB-0006VL-LQ; Mon, 15 Apr 2024 12:16:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706122.1103166; Mon, 15 Apr 2024 12:16:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwLGB-0006Sm-Hh; Mon, 15 Apr 2024 12:16:31 +0000
Received: by outflank-mailman (input) for mailman id 706122;
 Mon, 15 Apr 2024 12:16:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IKSf=LU=bounce.vates.tech=bounce-md_30504962.661d1a9a.v1-df12415ac50046a4b0827733735753de@srs-se1.protection.inumbo.net>)
 id 1rwLG9-0006Sb-VD
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 12:16:30 +0000
Received: from mail145-16.atl61.mandrillapp.com
 (mail145-16.atl61.mandrillapp.com [198.2.145.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc166306-fb21-11ee-b908-491648fe20b8;
 Mon, 15 Apr 2024 14:16:28 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-16.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4VJ5kL3k0cz8XRqhX
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2024 12:16:26 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 df12415ac50046a4b0827733735753de; Mon, 15 Apr 2024 12:16:26 +0000
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
X-Inumbo-ID: fc166306-fb21-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1713183386; x=1713443886;
	bh=CpLIfnsQ6CTwc8nRBaUZ7IwM1SPQ6YD1gSr8oBgEhC4=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=vnO/XCy5oonWo/9iaWGidQIG+mO5ju2HWAg4RIUJ2r1bnOx96H/DvC/TEtRea+bVt
	 xVk5xDFya5hkSZHUrSfcs2GTrp4Yx8xaGVW1IfmfexggpdO7VwVkJNwdcz7aGZ7+fm
	 T5jIsJyDpWhxVUP9ebGr+aKrcFnfE1N+EfDZxrN2dX/uzaiqux5g/3JqJyAezQlQce
	 S/BxwiMf0P7ZHpWaoopaKsD9r6SjNROrdg/YaIQxMpYcUnGWl5OPVhSXELTGwaMdfa
	 oE7ZaNhZTTqwVcrfBAwcRlWs6eP/W28HhBlExqLc9DMk1WDKonXG83mt23P+XRHfkQ
	 v2A6u96hHK4GQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1713183386; x=1713443886; i=teddy.astie@vates.tech;
	bh=CpLIfnsQ6CTwc8nRBaUZ7IwM1SPQ6YD1gSr8oBgEhC4=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=yKN+5gwLR+KuqVgnsFp5pS5XH+jupvU54K9UkDo9sv7boUkP37pXjZSwMFpJA9WAh
	 ecMb2NQJtwqFyp5KQWQbyo6bZm5nJvkzocD201Yk5z0l/lrgbubRr/SF8qf5VcYsBy
	 4AyxoU7S03487GJ4DjACvOIpHiDuMcqmJr7fHLN5fl8YjVCx1/wQxNVZiJmpAD6mzj
	 SCCw4jiRZ42B5Ko9SufOF3UKSEGoz1wVsicLFrFRjf+lVoWzaUNnSO8x9pDxWlrdMo
	 6Yh6Vuy+ifxwdCQRSmTqWYnGdSGNuh/325Oj/6AgvaFS2vACsp4B7rrXsDpH2Moxnp
	 fG14Q08vyee/A==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=20v4=200/5]=20x86/iommu:=20Drop=20IOMMU=20support=20when=20cx16=20isn't=20supported?=
X-Mailer: git-send-email 2.44.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1713183385756
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>
Message-Id: <cover.1713174878.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.df12415ac50046a4b0827733735753de?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240415:md
Date: Mon, 15 Apr 2024 12:16:26 +0000
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

Teddy Astie (5):
  VT-d: Disable IOMMU if cx16 isn't supported
  AMD-Vi: Disable IOMMU if cx16 isn't supported
  VT-d: Cleanup MAP_SINGLE_DEVICE and related code
  VT-d: Disable intrerrupt remapping if cx16 is not supported
  AMD-Vi: Disable intrerrupt remapping if cx16 is not supported

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

