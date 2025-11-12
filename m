Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9457C53153
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 16:38:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160079.1488323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJCv6-0008Qk-5U; Wed, 12 Nov 2025 15:38:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160079.1488323; Wed, 12 Nov 2025 15:38:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJCv6-0008OI-1l; Wed, 12 Nov 2025 15:38:04 +0000
Received: by outflank-mailman (input) for mailman id 1160079;
 Wed, 12 Nov 2025 15:38:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6SUh=5U=bounce.vates.tech=bounce-md_30504962.6914a9d3.v1-e949b06b9e564745b25a47e47821002d@srs-se1.protection.inumbo.net>)
 id 1vJCv5-0008Gb-BG
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 15:38:03 +0000
Received: from mail136-17.atl41.mandrillapp.com
 (mail136-17.atl41.mandrillapp.com [198.2.136.17])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fbb0437-bfdd-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 16:37:57 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-17.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4d66wz4Zw9zPm0Pgv
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 15:37:55 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e949b06b9e564745b25a47e47821002d; Wed, 12 Nov 2025 15:37:55 +0000
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
X-Inumbo-ID: 8fbb0437-bfdd-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1762961875; x=1763231875;
	bh=bAIekkhp/BKtr62/rlriAxaCAr8fs4tufSc18XCcYVQ=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=x/yp2Qn+qLhavL2KM547Fovgwuv9oNIK2KTgLlJLpHaPgzv2LN7czhImJ8/aQpVjR
	 cdbItmqJ6s2tJ0Ulrtd499eon0imTy/imRbCL1z/gm9ThcQeKMApbhcgjTp04nszGq
	 29Bs1oR3S7ETYEyDoIiZkYinK4ANRrHaKvIXJM0Ap2sliE+21NZngFkPqOAcIr7g7M
	 VdQZvR7F32rVWEGfMZQn3oLfs+aO+Gv0vmNeqkOpRTowzCjiOBAnWPeShcvdfGghI3
	 DyBZm0wKfvuVlrA7KkLi35ErTzRRBYHVQ3u4Jne21aKPQPC0T52t4R87Iud5b4vgL8
	 sHgv8C31pmKuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1762961875; x=1763222375; i=teddy.astie@vates.tech;
	bh=bAIekkhp/BKtr62/rlriAxaCAr8fs4tufSc18XCcYVQ=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=shzVzP9NaOuH2XW3KVE6PaRxv5Fc35UcPSQCewPHg2TK2AAzKw4L5DTnERqv081nH
	 quPiHRpcAa7Z08fLp9ItY5Yq5fZ9MDDjNix5k7a/xRXrlQFsjP/3gsiqbrN8EB/hXy
	 UayVtITSPkh5MzpTkHLZ8R/8kfy6Ss1Qmg2buwIg01o4x8BNc6q44La3WZqz2IFZ6i
	 +Wa1DXUhW7NrpKmTTHg6colNJ+WpPDuuvJDW3vSu26k6ZQFV+riqsGKz08pGMbeoRu
	 gcwxuPmMD5iXALMayo7/61sAEBdQDWhU8obPoVuexSt+WiBWbbxq8EbJvKL070VxbE
	 1OKjXbAtyIjig==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=200/2]=20AMD-Vi=20cleanups=20around=20domain=20device=20setup?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1762961874207
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Jason Andryuk" <jason.andryuk@amd.com>
Message-Id: <cover.1762961527.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e949b06b9e564745b25a47e47821002d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251112:md
Date: Wed, 12 Nov 2025 15:37:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Various simplifications (redundant logic merging and dead code removal)
with no expected impact on effective behavior.

Teddy Astie (2):
  amd/iommu: Always atomically update DTE
  amd/iommu: Remove dead non-atomic update checking

 xen/drivers/passthrough/amd/iommu_map.c     | 78 +++++++--------------
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 18 -----
 2 files changed, 25 insertions(+), 71 deletions(-)

-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


