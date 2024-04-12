Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AF58A2E5B
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 14:34:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704623.1101095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvG6B-0000jb-NE; Fri, 12 Apr 2024 12:33:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704623.1101095; Fri, 12 Apr 2024 12:33:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvG6B-0000gi-KW; Fri, 12 Apr 2024 12:33:43 +0000
Received: by outflank-mailman (input) for mailman id 704623;
 Fri, 12 Apr 2024 12:33:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uGUh=LR=bounce.vates.tech=bounce-md_30504962.66192a22.v1-3b07ce38dac04a7aa6620cfa04f75290@srs-se1.protection.inumbo.net>)
 id 1rvG69-0000fM-PK
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 12:33:41 +0000
Received: from mail5.us4.mandrillapp.com (mail5.us4.mandrillapp.com
 [205.201.136.5]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3dc9626-f8c8-11ee-b908-491648fe20b8;
 Fri, 12 Apr 2024 14:33:40 +0200 (CEST)
Received: from pmta15.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail5.us4.mandrillapp.com (Mailchimp) with ESMTP id 4VGGFZ615KzDRHy9G
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2024 12:33:38 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 3b07ce38dac04a7aa6620cfa04f75290; Fri, 12 Apr 2024 12:33:38 +0000
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
X-Inumbo-ID: e3dc9626-f8c8-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1712925218; x=1713185718;
	bh=lUyJPgNnx0SAin6hEtZWlv9ZWViQpLeT4NrclMLzQzg=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=j9A6GE63KybtdPlWDUCBXZlbxQcE/rPJpNYW6RlKqKMszuvj6RauYGS69IG4wV3hD
	 ALwNxeJhVP8IseHLUeBavCx2nDlIBS+6QPK2es9Cv0lAx1mMDvI6355e3Up78+af43
	 zihy4JiOhmYuVUVuRVok3UDgJJvKSToNfD0W9dR41O2J2rIhwj7PfGMUVz69mIbR/K
	 485dJqzY1sEgVldEzCORBEyHTvLDN6PURRDaIzg7wVhXo3qbRzVyA1cZdKlbyTxSdK
	 23gZM/n03p6CiIqihYR0WZAjKWMWKN9ps/dHFxWkvPMkv/naFIhK1AZilAj4x5/344
	 7HQIoF/VdAhQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1712925218; x=1713185718; i=teddy.astie@vates.tech;
	bh=lUyJPgNnx0SAin6hEtZWlv9ZWViQpLeT4NrclMLzQzg=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=v5RAGysVGmuL8VTxbmcnwseQXYj03PBP5oRqrmKWaryZTkAm7TlaVZvFvLBvfuRMu
	 gPpXqIToEDHmQreXKKX18fP9cMPVBvKWeeI+1rN6+dW3WEMRbM9ecnZd45rIfNLzhy
	 la0HWfHy8yt8IvLsfYxndUBqeJDfPoxP66+YwzVpIfyTeUAtUpppPm80p2UqovpBXy
	 7iT9rwoO0rnGBQ0yGscR+bv0JLerHAWr4jlTKaNXG8HaEa/QpjD7I95UvqBq0P4tFs
	 Tr5NFVLELnDZsyAuVdOZ2Ul6hCCLCbmHiyVx/tFyP4PUzamNT3CAWVoUprDRX7X7wG
	 2kkD9URb/MacQ==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=20v3=200/3]=20x86/iommu:=20Drop=20IOMMU=20support=20when=20cx16=20isn't=20supported?=
X-Mailer: git-send-email 2.44.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1712925216018
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Message-Id: <cover.1712915011.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.3b07ce38dac04a7aa6620cfa04f75290?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240412:md
Date: Fri, 12 Apr 2024 12:33:38 +0000
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

Changed in v3:

 * Use -ENODEV instead of -ENOSYS.

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

