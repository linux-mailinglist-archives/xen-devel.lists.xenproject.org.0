Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 725439497A4
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 20:40:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773060.1183509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbP5p-0006xX-MY; Tue, 06 Aug 2024 18:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773060.1183509; Tue, 06 Aug 2024 18:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbP5p-0006v0-Jx; Tue, 06 Aug 2024 18:39:33 +0000
Received: by outflank-mailman (input) for mailman id 773060;
 Tue, 06 Aug 2024 18:39:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sbP5o-0006uu-JQ
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 18:39:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sbP5n-0003u0-TS; Tue, 06 Aug 2024 18:39:31 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sbP5n-0001dN-NE; Tue, 06 Aug 2024 18:39:31 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=Q4oiiBQrnLtDMBmAE82vdEsAbOoqARQ2yu6VDxhK4VM=; b=mjpuj81Olt6MrA9OeTOv7v3BWq
	6o5MRO6Y/ylXUMAysQsoJi7BfidzDi+zIqy0jMGRJQ+F4Hop1W16sz+VJBvCA8+2f/Nv8vMI5sW6A
	RNxFdWJ2am1aKMwo0ZCBd4nSaBTHGx+Tavl9hRRdYgeGniNADRIOOcHDEkiCXLxWuCs0=;
Message-ID: <6746ba68-bb14-4ebf-83c7-90504ceea1c7@xen.org>
Date: Tue, 6 Aug 2024 19:39:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] xen/arm: dom0less: Add #redistributor-regions
 property to GICv3 node
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Luca Fancellu <Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240704075419.34966-1-michal.orzel@amd.com>
 <19A039ED-1B56-4C16-B1D0-72F28AA123C5@arm.com>
 <7f426aab-bccb-4255-994f-2d1613f2342b@xen.org>
In-Reply-To: <7f426aab-bccb-4255-994f-2d1613f2342b@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/07/2024 14:03, Julien Grall wrote:
> Hi,
> 
> On 04/07/2024 11:39, Luca Fancellu wrote:
>>
>>
>>> On 4 Jul 2024, at 08:54, Michal Orzel <michal.orzel@amd.com> wrote:
>>>
>>> Dom0less domain using host memory layout may use more than one
>>> re-distributor region (d->arch.vgic.nr_regions > 1). In that case Xen
>>> will add them in a "reg" property of a GICv3 domU node. Guest needs to
>>> know how many regions to search for, and therefore the GICv3 dt binding
>>> [1] specifies that "#redistributor-regions" property is required if more
>>> than one redistributor region is present. However, Xen does not add this
>>> property which makes guest believe, there is just one such region. This
>>> can lead to guest boot failure when doing GIC SMP initialization. Fix it
>>> by adding this property, which matches what we do for hwdom.
>>>
>>> [1] Linux: Documentation/devicetree/bindings/interrupt-controller/ 
>>> arm,gic-v3.yaml
>>>
>>> Fixes: 4809f9ec7d71 ("xen/arm: if direct-map domain use native 
>>> addresses for GICv3")
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>
>> Looks good to me!
>>
>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

This is now committed.

Cheers,

-- 
Julien Grall


