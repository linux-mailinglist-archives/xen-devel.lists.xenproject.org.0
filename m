Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 048EC6E0E75
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 15:24:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520733.808652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmwvj-0004Ow-9r; Thu, 13 Apr 2023 13:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520733.808652; Thu, 13 Apr 2023 13:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmwvj-0004Mc-6j; Thu, 13 Apr 2023 13:24:03 +0000
Received: by outflank-mailman (input) for mailman id 520733;
 Thu, 13 Apr 2023 13:24:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pmwvi-0004MS-4w
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 13:24:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pmwvh-000391-PC; Thu, 13 Apr 2023 13:24:01 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.20.117]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pmwvh-00078L-IP; Thu, 13 Apr 2023 13:24:01 +0000
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
	bh=cY4vS72LVwklu7Jew54sP8KEU4l53pjfjrYouwzFacw=; b=Vu9jlyHvIFPSNC4qm50WYG4kE3
	DzQ1lMiftua6vIZGbvhiIldunTwfhrrVoZeSRnV/IFm4YbZfZ5ajLb4pY4x46W5CytBMpsqsYH/Uc
	363Qr6Bmd4WFgDF+j7WGvP8xR1GOHTRXAjUqnHPdO/nlZVbltvxD5o8IH09LpU5cQE9o=;
Message-ID: <d354fee8-4d02-fe5f-1ff1-15f96efeb13f@xen.org>
Date: Thu, 13 Apr 2023 14:23:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [XEN PATCH v8 11/22] xen/arm: ffa: send guest events to Secure
 Partitions
Content-Language: en-US
To: Jens Wiklander <jens.wiklander@linaro.org>, xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Marc Bonnici <marc.bonnici@arm.com>,
 Achin Gupta <achin.gupta@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-12-jens.wiklander@linaro.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230413071424.3273490-12-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/04/2023 08:14, Jens Wiklander wrote:
> +static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
> +                                      uint8_t msg)
> +{
> +    uint32_t exp_resp = FFA_MSG_FLAG_FRAMEWORK;
> +    int32_t res;
> +
> +    if ( msg == FFA_MSG_SEND_VM_CREATED )
> +        exp_resp |= FFA_MSG_RESP_VM_CREATED;
> +    else if ( msg == FFA_MSG_SEND_VM_DESTROYED )
> +        exp_resp |= FFA_MSG_RESP_VM_DESTROYED;
> +    else
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    do {
> +        const struct arm_smccc_1_2_regs arg = {
> +            .a0 = FFA_MSG_SEND_DIRECT_REQ_32,
> +            .a1 = sp_id,
> +            .a2 = FFA_MSG_FLAG_FRAMEWORK | msg,
> +            .a5 = vm_id,
> +        };
> +        struct arm_smccc_1_2_regs resp;
> +
> +        arm_smccc_1_2_smc(&arg, &resp);
> +        if ( resp.a0 != FFA_MSG_SEND_DIRECT_RESP_32 || resp.a2 != exp_resp )
> +        {
> +            /*
> +             * This is an invalid response, likely due to some error in the
> +             * implementation of the ABI.
> +             */
> +            return FFA_RET_INVALID_PARAMETERS;
> +        }
> +        res = resp.a3;
> +    } while ( res == FFA_RET_INTERRUPTED || res == FFA_RET_RETRY );

This loop seems potentially unbounded to me. Can you add a comment 
explaining why this is fine?

> +
> +    return res;
> +}
> +

Cheers,

-- 
Julien Grall

