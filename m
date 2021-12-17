Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2B6478DEB
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 15:38:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248689.428958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myENF-0003q8-3f; Fri, 17 Dec 2021 14:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248689.428958; Fri, 17 Dec 2021 14:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myENF-0003nb-0O; Fri, 17 Dec 2021 14:38:17 +0000
Received: by outflank-mailman (input) for mailman id 248689;
 Fri, 17 Dec 2021 14:38:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1myEND-0003nV-Sl
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 14:38:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1myENB-0004xV-Gk; Fri, 17 Dec 2021 14:38:13 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.25.72]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1myENB-0007QW-9v; Fri, 17 Dec 2021 14:38:13 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=va8QdcEuX8heMXQFbIFEbAYGFnGL8UWhRlJJRpBp/vA=; b=3N1owOzH7jEbyP8dRuyBPxIa6d
	kMVw6qW/XKcnYXYv0A2nTQm6OTVIjPZ5pfq8XNGjf49FT4Ny0IoGR45pwc1x/LkUMyUXQCH39+Vrt
	xEh5dNK5JB23zooPU9d8qyMt0fWUChxO++1ChKM31+nsy7hlgrcNqQR0MHgbU2f9IF9o=;
Message-ID: <c3fbd191-df91-1c4b-5bff-6df33bf57554@xen.org>
Date: Fri, 17 Dec 2021 14:38:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v2 14/18] IOMMU: fold flush-all hook into "flush one"
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <e40ee980-9151-101a-1484-b1710aaeafb0@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e40ee980-9151-101a-1484-b1710aaeafb0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/09/2021 10:53, Jan Beulich wrote:
> Having a separate flush-all hook has always been puzzling me some. We
> will want to be able to force a full flush via accumulated flush flags
> from the map/unmap functions. Introduce a respective new flag and fold
> all flush handling to use the single remaining hook.
> 
> Note that because of the respective comments in SMMU and IPMMU-VMSA
> code, I've folded the two prior hook functions into one. For SMMU-v3,
> which lacks a comment towards incapable hardware, I've left both
> functions in place on the assumption that selective and full flushes
> will eventually want separating.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

For the Arm part:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

