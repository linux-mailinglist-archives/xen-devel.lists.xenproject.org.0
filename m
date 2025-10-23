Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11424C00252
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 11:12:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148834.1480669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBrMq-0003aT-EB; Thu, 23 Oct 2025 09:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148834.1480669; Thu, 23 Oct 2025 09:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBrMq-0003Xq-B9; Thu, 23 Oct 2025 09:12:20 +0000
Received: by outflank-mailman (input) for mailman id 1148834;
 Thu, 23 Oct 2025 09:12:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QiUI=5A=bounce.vates.tech=bounce-md_30504962.68f9f170.v1-920b4946db8a4b81a0e48242a6ea855a@srs-se1.protection.inumbo.net>)
 id 1vBrMp-0003Xf-FT
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 09:12:19 +0000
Received: from mail180-10.suw31.mandrillapp.com
 (mail180-10.suw31.mandrillapp.com [198.2.180.10])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f2cf52b-aff0-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 11:12:18 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-10.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4csgKD4Wczz5Qm5kF
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 09:12:16 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 920b4946db8a4b81a0e48242a6ea855a; Thu, 23 Oct 2025 09:12:16 +0000
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
X-Inumbo-ID: 5f2cf52b-aff0-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761210736; x=1761480736;
	bh=wXU0e4LjP4CzdmwZR2zK88YdKuGD/2VQavWbKojJYQs=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=X3ObGt6ejJDa+unjpeRpL42FDZkEEmJ712yMz0aK167hR4axMHVUQF5WJ0I4yFCaa
	 kNZ7NdHc/UZ8cDAHVhYW71BA2cR9CfNwDTMV/d5u6ujwd8G4QVda4j2OTvRPKJAtaR
	 VRtc7qt96Y1po5RGwUmDPaxqSHQKKLiJeTgOm+qQfKU8tBskNMSKHzRFN0t1SEKuQc
	 Pgy6/nkCSITrPIZ2mG+OEKEb9QnI5/G6/KuVwMU2xCxmepRJUYrCEieJqi9ik2vEtp
	 8VGzyAU0a5ywLRfJ30JnG4ajVgRtw2UMX5OYQIAoHyc20C23YRkXeUjR+8VFcV4HnW
	 73PptoJrz1CJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761210736; x=1761471236; i=teddy.astie@vates.tech;
	bh=wXU0e4LjP4CzdmwZR2zK88YdKuGD/2VQavWbKojJYQs=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=BrLH5sL3oPBZPaNsi64ItoqnYCkptiTIiSlNoL2Pra+jnLPiKZ0ybV6TaIdvxEOeF
	 08ZTJ3Pji6iyp4F9XnQnZjXtmVsKA5vLzskaN5tTir8RO1z8a95Worm6FR+J9OVZUs
	 A9WP1OswlsBMYxbkuABK2pEU+1TwD8gBeGlz6xU0XlnjS76z/Ja51SiiT18g8VHI6P
	 qR54pElaQKgPs+ZIj5uvguLTE+FeCmr+N1Lc/bBlbgHkmkCwt+sfSO7eYkNK2Ei3cs
	 eCYsbbpxuwCnnoRfSHimMIEW+MttRk3+RfNgM/yrgGII6PJhryZMOFo4XAafmwa8S9
	 +plOm3BvP5h5w==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2=200/5]=20Various=20IOMMU=20related=20simplifications?=
X-Mailer: git-send-email 2.51.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761210736045
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>
Message-Id: <cover.1761209564.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.920b4946db8a4b81a0e48242a6ea855a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251023:md
Date: Thu, 23 Oct 2025 09:12:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Various simplifications in the VT-d and IO-APIC code (mostly related to legacy ia64 code).

No functional change intended.

Changed in v2 :
 - drop (un)map_vtd_domain_page wrapper instead of moving it
 - drop deprecated and Intel-exclusive iommu_inclusive_mapping=<boolean>
 - description and formatting changes

Teddy Astie (5):
  vtd: Drop (un)map_vtd_domain_page wrapper
  vtd: Drop "iommu_inclusive_mapping" command-line option
  vtd: Collapse x86 subdirectory
  vtd: Remove IO_xAPIC_route_entry macro
  x86/ioapic: Don't open-code 32-bits rte reads

 CHANGELOG.md                                |  2 +
 docs/misc/xen-command-line.pandoc           |  6 --
 xen/arch/x86/include/asm/io_apic.h          |  1 +
 xen/arch/x86/io_apic.c                      | 29 +++----
 xen/drivers/passthrough/vtd/Makefile        |  3 +-
 xen/drivers/passthrough/vtd/{x86 => }/ats.c | 21 ++---
 xen/drivers/passthrough/vtd/dmar.c          |  2 +-
 xen/drivers/passthrough/vtd/extern.h        |  3 -
 xen/drivers/passthrough/vtd/intremap.c      | 34 ++++----
 xen/drivers/passthrough/vtd/iommu.c         | 88 ++++++++++-----------
 xen/drivers/passthrough/vtd/iommu.h         |  7 +-
 xen/drivers/passthrough/vtd/qinval.c        | 13 +--
 xen/drivers/passthrough/vtd/utils.c         | 25 +++---
 xen/drivers/passthrough/vtd/vtd.h           |  3 -
 xen/drivers/passthrough/vtd/x86/Makefile    |  2 -
 xen/drivers/passthrough/vtd/x86/vtd.c       | 48 -----------
 16 files changed, 108 insertions(+), 179 deletions(-)
 rename xen/drivers/passthrough/vtd/{x86 => }/ats.c (92%)
 delete mode 100644 xen/drivers/passthrough/vtd/x86/Makefile
 delete mode 100644 xen/drivers/passthrough/vtd/x86/vtd.c

-- 
2.51.1



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


