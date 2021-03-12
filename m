Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AABBF338282
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 01:39:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96766.183425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKVpF-0002XI-6A; Fri, 12 Mar 2021 00:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96766.183425; Fri, 12 Mar 2021 00:38:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKVpF-0002Wt-3C; Fri, 12 Mar 2021 00:38:45 +0000
Received: by outflank-mailman (input) for mailman id 96766;
 Fri, 12 Mar 2021 00:38:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oc3E=IK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lKVpC-0002Wo-UN
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 00:38:42 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ee21236-2a60-4521-aa1a-22feede08581;
 Fri, 12 Mar 2021 00:38:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EEE9E64F8E;
 Fri, 12 Mar 2021 00:38:40 +0000 (UTC)
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
X-Inumbo-ID: 9ee21236-2a60-4521-aa1a-22feede08581
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615509521;
	bh=LxhJQNmeTlbV2mKTliu09mr/7q9XmffjSSgUB5VRJfk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Wto0DKzf3jAwwj8OK7fePvU1NBXf1RyJ2ZP5uSTHIf/ZxNljCWtfP9c8Bs/HcYgKY
	 rm1XeybdlQ50Ip1QLR6m2KKCuFbKH2a/MHmsSy5PK/EbphhcDys1t5YYFj98JhcPOc
	 qd4fNHzWqrvZNkL/90KxkedECuwfuvDZdJhLfcIqKbAkaZaX1pMGE1i0UmO21crlUA
	 0vDl6yGiTTY+JdzydE/pY9Ev2FGVpzcpAO7M4yk1xd+b51x7diiO5QaUmYWCYjQJdz
	 ozg2vmMSoc1LSU0+9bBclwCa4qpk01GPWh85yDTg3ar7CRnfzJbZK1gJldFXINBSRA
	 tS0JQC0V/kp+w==
Date: Thu, 11 Mar 2021 16:38:33 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 0/5] xen/arm: smmuv1: Fix stream match conflict issue
In-Reply-To: <cover.1615312254.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2103111637020.18926@sstabellini-ThinkPad-T480s>
References: <cover.1615312254.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1376348301-1615509521=:18926"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1376348301-1615509521=:18926
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 9 Mar 2021, Rahul Singh wrote:
> This patch is the work to fix the stream match conflict issue when two devices
> have the same stream-id.
> 
> Approach taken is to merge the below commit from Linux driver to fix the
> issue.
> 
> 1. "iommu/arm-smmu: Handle stream IDs more dynamically"
>     commit 21174240e4f4439bb8ed6c116cdbdc03eba2126e
> 2. "iommu/arm-smmu: Consolidate stream map entry state"
>     commit 1f3d5ca43019bff1105838712d55be087d93c0da
> 3. "iommu/arm-smmu: Keep track of S2CR state"
>     commit 8e8b203eabd8b9e96d02d6339e4abce3e5a7ea4b
> 4. "iommu/arm-smmu: Add a stream map entry iterator"
>     commit d3097e39302083d58922a3d1032d7d59a63d263d
> 5. "iommu/arm-smmu: Intelligent SMR allocation"
>     commit 588888a7399db352d2b1a41c9d5b3bf0fd482390
> 
> Rahul Singh (5):
>   xen/arm: smmuv1: Handle stream IDs more dynamically
>   xen/arm: smmuv1: Consolidate stream map entry state
>   xen/arm: smmuv1: Keep track of S2CR state
>   xen/arm: smmuv1: Add a stream map entry iterator
>   xen/arm: smmuv1: Intelligent SMR allocation
> 
>  xen/drivers/passthrough/arm/smmu.c | 423 ++++++++++++++++++-----------
>  1 file changed, 262 insertions(+), 161 deletions(-)

I didn't closely review the changes but I made sure that all patches
build and I also compared each patch with the original commit in Linux:
all changes correspond correctly.

For the whole series:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1376348301-1615509521=:18926--

