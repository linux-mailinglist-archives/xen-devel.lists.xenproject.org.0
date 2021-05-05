Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 965093747D7
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 20:07:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123265.232510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leLv2-0004it-6R; Wed, 05 May 2021 18:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123265.232510; Wed, 05 May 2021 18:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leLv2-0004fb-2n; Wed, 05 May 2021 18:06:44 +0000
Received: by outflank-mailman (input) for mailman id 123265;
 Wed, 05 May 2021 18:06:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1leLv1-0004fV-1C
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 18:06:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1leLuz-0007Wa-Tp; Wed, 05 May 2021 18:06:41 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1leLuz-0004WL-Nz; Wed, 05 May 2021 18:06:41 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=tNAWVrdaQhtGTqwXr1cIycPbH/1Akop+EME/lo8dk5o=; b=cykerznRqq0MqqVIYAFbrxFvyG
	pxr/+UwH7GnSQ/LLPrqB+wkogXLoRcyEuqEPCX0CIVqtJChU4nANiAjN43ahmmNCk5W7qiFcH8DLm
	2rQSFw+Bg6VRi4MrJrLlgOcovUSyFWT5zt89wXy0LKL+q/n48NiQDhygo0IYxG9uHihY=;
Subject: Re: [PATCH v3 05/10] arm/gic: Get rid of READ/WRITE_SYSREG32
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com,
 wei.chen@arm.com
References: <20210505074308.11016-1-michal.orzel@arm.com>
 <20210505074308.11016-6-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a2cdf940-bec8-05cc-2c08-b66aff357bc2@xen.org>
Date: Wed, 5 May 2021 19:06:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210505074308.11016-6-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Michal,

On 05/05/2021 08:43, Michal Orzel wrote:
> AArch64 registers are 64bit whereas AArch32 registers
> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
> we should get rid of helpers READ/WRITE_SYSREG32
> in favour of using READ/WRITE_SYSREG.
> We should also use register_t type when reading sysregs
> which can correspond to uint64_t or uint32_t.
> Even though many AArch64 registers have upper 32bit reserved
> it does not mean that they can't be widen in the future.
> 
> Modify types of following members of struct gic_v3 to register_t:
> -vmcr
> -sre_el1
> -apr0
> -apr1
> 
> Add new macro GICC_IAR_INTID_MASK containing the mask
> for INTID field of ICC_IAR0/1_EL1 register as only the first 23-bits
> of IAR contains the interrupt number. The rest are RES0.
> Therefore, take the opportunity to mask the bits [23:31] as
> they should be used for an IRQ number (we don't know how the top bits
> will be used).
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

