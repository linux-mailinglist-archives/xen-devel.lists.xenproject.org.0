Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDDC707D45
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 11:51:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536267.834441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzaIT-0000ZT-NR; Thu, 18 May 2023 09:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536267.834441; Thu, 18 May 2023 09:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzaIT-0000Xd-Jx; Thu, 18 May 2023 09:51:45 +0000
Received: by outflank-mailman (input) for mailman id 536267;
 Thu, 18 May 2023 09:51:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pzaIR-0000XX-Uq
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 09:51:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pzaIR-0002RY-HL; Thu, 18 May 2023 09:51:43 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.26.27]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pzaIR-000607-A3; Thu, 18 May 2023 09:51:43 +0000
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
	bh=GR9jO2FVSzo4DjMEKBsiQgSVBVqVBCDL+yA8NIXhThM=; b=n/cinT6NaIhizgd7R4yc+D3JVH
	PyqXpH8cgaBaMYaNpm9Lbe+w7kL+hno1oyu3EuwqQfiqdSsjz6I17nNswDVvzIItdeBg5LwSCEU5A
	LGIOKZJ+EIvUjiT4K0ayDVD0Mmxw1yQ6pCCnoi/RmUe8yDCmnbzH6x2dc0vrOovG2g9I=;
Message-ID: <92f0e233-2832-be64-ce67-0082691c9f3f@xen.org>
Date: Thu, 18 May 2023 10:51:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v6 03/12] xen/arm: Expose SVE feature to the guest
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-4-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230424060248.1488859-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/04/2023 07:02, Luca Fancellu wrote:
> When a guest is allowed to use SVE, expose the SVE features through
> the identification registers.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

With one remark below:

Acked-by: Julien Grall <jgrall@amazon.com>

> +    case HSR_SYSREG_ID_AA64ZFR0_EL1:
> +    {
> +        /*
> +         * When the guest has the SVE feature enabled, the whole id_aa64zfr0_el1
> +         * needs to be exposed.
> +         */
> +        register_t guest_reg_value = guest_cpuinfo.zfr64.bits[0];

Coding style: Add a newline after the declaration.

> +        if ( is_sve_domain(v->domain) )
> +            guest_reg_value = system_cpuinfo.zfr64.bits[0];
> +
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
> +                                  guest_reg_value);
> +    }
>   
>       /*
>        * Those cases are catching all Reserved registers trapped by TID3 which

Cheers,

-- 
Julien Grall

