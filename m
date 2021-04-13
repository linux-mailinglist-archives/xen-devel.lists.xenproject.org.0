Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 035AA35E5C2
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 19:59:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110064.210082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWNJW-0005ic-3v; Tue, 13 Apr 2021 17:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110064.210082; Tue, 13 Apr 2021 17:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWNJV-0005ho-Vy; Tue, 13 Apr 2021 17:59:01 +0000
Received: by outflank-mailman (input) for mailman id 110064;
 Tue, 13 Apr 2021 17:59:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1MWi=JK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lWNJU-0005hQ-7Y
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 17:59:00 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62782047-4503-41e2-b0a3-e5d7cfc8fc58;
 Tue, 13 Apr 2021 17:58:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C413613B8;
 Tue, 13 Apr 2021 17:58:58 +0000 (UTC)
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
X-Inumbo-ID: 62782047-4503-41e2-b0a3-e5d7cfc8fc58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618336738;
	bh=ImhZWk7x78CTIS8U8sdIJlAltMyeY1Uabc6bAXjkZYU=;
	h=Date:From:To:cc:Subject:From;
	b=XE30a/gfovvwK/PyEOpzlyzYB3lqNXDqBat3ZsbV7JS4jurlBx4oFunxUln88L8/K
	 OcVSbDBWxAYqW8Am1dsKnBZ9JVlYI9udplss1/pZtI6zz2CSC9swedSUmrfmUNcb1i
	 woSbUnz4m7Crgv8CXmSQK0jGdnHkV0sX51EiETWfrNi+ixhZjZZF0q1fQ+FwFw97Dq
	 V3gua79Edi0UAzd9hpUVanFJ/OLA6OadWI5LYHFau0C9cS14nQe3Iz7P9dEbNCvJ8X
	 tV1PfuFYsZ4QG2czNGE5J8OB72pNfNPYvnu8d+voufW4Y8ta+pccwoDGv8c/B1jH9/
	 t4g4U6bLYBR8A==
Date: Tue, 13 Apr 2021 10:58:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel <xen-devel@lists.xenproject.org>
cc: sstabellini@kernel.org, julien@xen.org, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, rahul.singh@arm.com, brian.woods@xilinx.com
Subject: [PATCH RESEND v3 0/3] Generic SMMU Bindings
Message-ID: <alpine.DEB.2.21.2104131055580.4885@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This series introduces support for the generic SMMU bindings to
xen/drivers/passthrough/arm/smmu.c.

This is the same as the previous v3 version forward ported on top of
staging, plus Rahul's "xen/arm: smmuv1: Revert associating the group
pointer with the S2CR" patch
(https://marc.info/?l=xen-devel&m=161822284816587).

Cheers,

Stefano


Brian Woods (3):
      arm,smmu: switch to using iommu_fwspec functions
      arm,smmu: restructure code in preparation to new bindings support
      arm,smmu: add support for generic DT bindings. Implement add_device and dt_xlate.

 xen/drivers/passthrough/arm/smmu.c    | 145 ++++++++++++++++++++++++++--------
 xen/drivers/passthrough/device_tree.c |  24 ++----
 2 files changed, 118 insertions(+), 51 deletions(-)

