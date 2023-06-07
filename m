Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEEB725B5C
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 12:16:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544663.850599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6qD2-0002lV-8Z; Wed, 07 Jun 2023 10:16:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544663.850599; Wed, 07 Jun 2023 10:16:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6qD2-0002jS-59; Wed, 07 Jun 2023 10:16:08 +0000
Received: by outflank-mailman (input) for mailman id 544663;
 Wed, 07 Jun 2023 10:16:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q6qD1-0002j3-2r
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 10:16:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6qD0-00005v-LC; Wed, 07 Jun 2023 10:16:06 +0000
Received: from [15.248.2.248] (helo=[10.24.67.28])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6qD0-0003WX-D8; Wed, 07 Jun 2023 10:16:06 +0000
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
	bh=Eir5h+++jJYHRdfdOVrzLvnP6Z1BdZQSacpNlu1LMXk=; b=gI5pxNMRvw9UfAqHWsSMaBU6pA
	iJNKF6K0D7UIdWcUjhaqMcVHpSWY//ofrBzyG40eBrptqIa9/Pr6idoVs31BFzeRAjRwfz51bTt1E
	VwNxVR55tAbJUUc7WYmkKdReoUHZdOwxUJWSvz+PS6wKxuID0/tqZ/oJA2uQITxsVXPY=;
Message-ID: <d338c29b-8ac6-f910-078f-95f6709a32cd@xen.org>
Date: Wed, 7 Jun 2023 11:16:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v8 05/12] arm/sve: save/restore SVE context switch
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230531072413.868673-1-luca.fancellu@arm.com>
 <20230531072413.868673-6-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230531072413.868673-6-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 31/05/2023 08:24, Luca Fancellu wrote:
> Save/restore context switch for SVE, allocate memory to contain
> the Z0-31 registers whose length is maximum 2048 bits each and
> FFR who can be maximum 256 bits, the allocated memory depends on
> how many bits is the vector length for the domain and how many bits
> are supported by the platform.
> 
> Save P0-15 whose length is maximum 256 bits each, in this case the
> memory used is from the fpregs field in struct vfp_state,
> because V0-31 are part of Z0-31 and this space would have been
> unused for SVE domain otherwise.
> 
> Create zcr_el{1,2} fields in arch_vcpu, initialise zcr_el2 on vcpu
> creation given the requested vector length and restore it on
> context switch, save/restore ZCR_EL1 value as well.
> 
> List import macros from Linux in README.LinuxPrimitives.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

