Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F57642B81
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 16:20:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453869.711494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2DGd-0003lY-Ar; Mon, 05 Dec 2022 15:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453869.711494; Mon, 05 Dec 2022 15:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2DGd-0003jA-7b; Mon, 05 Dec 2022 15:20:27 +0000
Received: by outflank-mailman (input) for mailman id 453869;
 Mon, 05 Dec 2022 15:20:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p2DGc-0003j4-IR
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 15:20:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2DGb-0002FS-Ka; Mon, 05 Dec 2022 15:20:25 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.30.208]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2DGb-0008Ft-Df; Mon, 05 Dec 2022 15:20:25 +0000
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
	bh=NEJo101sqCAV+1CSR9I/rWSNifrIDJVHc7qL+ytiObE=; b=LWL6oPyDq7ycTOROsjcQnaIAZB
	af2ws+doNNi9xL1oJ20tUpuDgwvzaVJm2YgaqTp9+CnvVteWppQk/rFS9zULfytK1oYKqYo2O1xfN
	mmaWTx88Ro6UjrgKzIkky1slyBN5/xwF3QAXsCh1Y2t7X3bXXAAD94Ctom2TdOHc9J2M=;
Message-ID: <2a062390-ea9a-7458-2411-0d89b5309523@xen.org>
Date: Mon, 5 Dec 2022 15:20:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 04/21] xen/arm: vIOMMU: add generic vIOMMU framework
To: Michal Orzel <michal.orzel@amd.com>, Rahul Singh <Rahul.Singh@arm.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
 <505b4566579b65afa0696c3a8772416a4c7cf59f.1669888522.git.rahul.singh@arm.com>
 <345d7d3c-e090-356b-1b4e-a9b491a146b5@amd.com>
 <4D9FBC4E-CF83-4D45-B657-A58041EAFCAB@arm.com>
 <2739e776-6bd6-6f35-d46e-9e1223b3d6ef@amd.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <2739e776-6bd6-6f35-d46e-9e1223b3d6ef@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2022 14:25, Michal Orzel wrote:
>>>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
>>>> index 1528ced509..33d32835e7 100644
>>>> --- a/xen/include/public/arch-arm.h
>>>> +++ b/xen/include/public/arch-arm.h
>>>> @@ -297,10 +297,14 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>>>> #define XEN_DOMCTL_CONFIG_TEE_NONE      0
>>>> #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
>>>>
>>>> +#define XEN_DOMCTL_CONFIG_VIOMMU_NONE   0
>>>> +
>>>> struct xen_arch_domainconfig {
>>>>      /* IN/OUT */
>>>>      uint8_t gic_version;
>>>>      /* IN */
>>>> +    uint8_t viommu_type;
>>> this should be uint16_t and not uint8_t
>>
>> I will modify the in viommu_type to uint8_t in "arch/arm/include/asm/viommu.h" and will
>> also fix  everywhere the viommu_type to uint8_t.
> Also I think that you need to bump XEN_DOMCTL_INTERFACE_VERSION due to the change
> in struct xen_arch_domainconfig.

We only need to bump the domctl version once per release. So if this is 
the first modification of domctl.h in 4.18 then yes.

That said, I am not sure whether this is necessary here as you are using 
a padding.

@Rahul, BTW, I think you may need to regenerate the bindings for OCaml 
and Go.

Cheers,

-- 
Julien Grall

