Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0616E0E8F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 15:27:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520743.808679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmwyx-0005eG-7Y; Thu, 13 Apr 2023 13:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520743.808679; Thu, 13 Apr 2023 13:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmwyx-0005bj-47; Thu, 13 Apr 2023 13:27:23 +0000
Received: by outflank-mailman (input) for mailman id 520743;
 Thu, 13 Apr 2023 13:27:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pmwyv-0005bd-In
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 13:27:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pmwyv-0003DS-7A; Thu, 13 Apr 2023 13:27:21 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.20.117]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pmwyu-0007CE-UR; Thu, 13 Apr 2023 13:27:21 +0000
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
	bh=9/n7hnNMcYoNgoCz7dxwE/VXQp/HTEyugpR8WeQ2158=; b=jHv18kU29a4bFg7THOxcDLqP/b
	ElGSFhdnhFShbiJBdq75Ik7vpT7BPkukQ5JbqeDOrbir/CmVQSnNEojI9rCX63i5iiDZeJu12YsTO
	7ZH2nwkSd4zObjnuqkXB/gqnIOJNCko/HBONXD0wasM7BUX0eXAodkep0qcB3KijcQls=;
Message-ID: <2dba6372-330d-a068-241f-59e19b837150@xen.org>
Date: Thu, 13 Apr 2023 14:27:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [XEN PATCH v8 09/22] xen/arm: ffa: add direct request support
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Marc Bonnici <Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-10-jens.wiklander@linaro.org>
 <2359695e-f8f8-cf51-27f9-5f0c776feca5@xen.org>
 <916BB708-3028-4AAB-BD6A-BCABAFBD7C45@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <916BB708-3028-4AAB-BD6A-BCABAFBD7C45@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/04/2023 14:20, Bertrand Marquis wrote:
> Hi Julien,
> 
>> On 13 Apr 2023, at 15:15, Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 13/04/2023 08:14, Jens Wiklander wrote:
>>> Adds support for sending a FF-A direct request. Checks that the SP also
>>> supports handling a 32-bit direct request. 64-bit direct requests are
>>> not used by the mediator itself so there is not need to check for that.
>>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>>> ---
>>>   xen/arch/arm/tee/ffa.c | 112 +++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 112 insertions(+)
>>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
>>> index f129879c5b81..f2cce955d981 100644
>>> --- a/xen/arch/arm/tee/ffa.c
>>> +++ b/xen/arch/arm/tee/ffa.c
>>> @@ -181,6 +181,56 @@ static bool ffa_get_version(uint32_t *vers)
>>>       return true;
>>>   }
>>>   +static int32_t get_ffa_ret_code(const struct arm_smccc_1_2_regs *resp)
>>> +{
>>> +    switch ( resp->a0 )
>>> +    {
>>> +    case FFA_ERROR:
>>> +        if ( resp->a2 )
>>> +            return resp->a2;
>>> +        else
>>> +            return FFA_RET_NOT_SUPPORTED;
>>> +    case FFA_SUCCESS_32:
>>> +    case FFA_SUCCESS_64:
>>> +        return FFA_RET_OK;
>>> +    default:
>>> +        return FFA_RET_NOT_SUPPORTED;
>>> +    }
>>> +}
>>> +
>>> +static int32_t ffa_simple_call(uint32_t fid, register_t a1, register_t a2,
>>> +                               register_t a3, register_t a4)
>>> +{
>>> +    const struct arm_smccc_1_2_regs arg = {
>>> +        .a0 = fid,
>>> +        .a1 = a1,
>>> +        .a2 = a2,
>>> +        .a3 = a3,
>>> +        .a4 = a4,
>>> +    };
>>> +    struct arm_smccc_1_2_regs resp;
>>> +
>>> +    arm_smccc_1_2_smc(&arg, &resp);
>>> +
>>> +    return get_ffa_ret_code(&resp);
>>> +}
>>> +
>>> +static int32_t ffa_features(uint32_t id)
>>> +{
>>> +    return ffa_simple_call(FFA_FEATURES, id, 0, 0, 0);
>>> +}
>>> +
>>> +static bool check_mandatory_feature(uint32_t id)
>>> +{
>>> +    int32_t ret = ffa_features(id);
>>> +
>>> +    if (ret)
>>> +        printk(XENLOG_ERR "ffa: mandatory feature id %#x missing: error %d\n",
>>> +               id, ret);
>>> +
>>> +    return !ret;
>>> +}
>>> +
>>>   static uint16_t get_vm_id(const struct domain *d)
>>>   {
>>>       /* +1 since 0 is reserved for the hypervisor in FF-A */
>>> @@ -222,6 +272,57 @@ static void handle_version(struct cpu_user_regs *regs)
>>>       set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
>>>   }
>>>   +static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
>>> +{
>>> +    struct arm_smccc_1_2_regs arg = { .a0 = fid, };
>>> +    struct arm_smccc_1_2_regs resp = { };
>>> +    struct domain *d = current->domain;
>>> +    uint32_t src_dst;
>>> +    uint64_t mask;
>>> +
>>> +    if ( smccc_is_conv_64(fid) )
>>> +        mask = GENMASK_ULL(63, 0);
>>> +    else
>>> +        mask = GENMASK_ULL(31, 0);
>>> +
>>> +    src_dst = get_user_reg(regs, 1);
>>> +    if ( (src_dst >> 16) != get_vm_id(d) )
>>> +    {
>>> +        resp.a0 = FFA_ERROR;
>>> +        resp.a2 = FFA_RET_INVALID_PARAMETERS;
>>> +        goto out;
>>> +    }
>>> +
>>> +    arg.a1 = src_dst;
>>> +    arg.a2 = get_user_reg(regs, 2) & mask;
>>> +    arg.a3 = get_user_reg(regs, 3) & mask;
>>> +    arg.a4 = get_user_reg(regs, 4) & mask;
>>> +    arg.a5 = get_user_reg(regs, 5) & mask;
>>> +    arg.a6 = get_user_reg(regs, 6) & mask;
>>> +    arg.a7 = get_user_reg(regs, 7) & mask;
>>> +
>>> +    arm_smccc_1_2_smc(&arg, &resp);
>>> +    switch ( resp.a0 )
>>> +    {
>>> +    case FFA_ERROR:
>>> +    case FFA_SUCCESS_32:
>>> +    case FFA_SUCCESS_64:
>>> +    case FFA_MSG_SEND_DIRECT_RESP_32:
>>> +    case FFA_MSG_SEND_DIRECT_RESP_64:
>>> +        break;
>>> +    default:
>>> +        /* Bad fid, report back. */
>>> +        memset(&arg, 0, sizeof(arg));
>>> +        arg.a0 = FFA_ERROR;
>>> +        arg.a1 = src_dst;
>>> +        arg.a2 = FFA_RET_ABORTED;
>>> +    }
>>> +
>>> +out:
>>> +    set_regs(regs, resp.a0, resp.a1 & mask, resp.a2 & mask, resp.a3 & mask,
>>> +             resp.a4 & mask, resp.a5 & mask, resp.a6 & mask, resp.a7 & mask);
>>> +}
>>> +
>>>   static bool ffa_handle_call(struct cpu_user_regs *regs)
>>>   {
>>>       uint32_t fid = get_user_reg(regs, 0);
>>> @@ -239,6 +340,10 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
>>>       case FFA_ID_GET:
>>>           set_regs_success(regs, get_vm_id(d), 0);
>>>           return true;
>>> +    case FFA_MSG_SEND_DIRECT_REQ_32:
>>> +    case FFA_MSG_SEND_DIRECT_REQ_64:
>>> +        handle_msg_send_direct_req(regs, fid);
>>> +        return true;
>>>         default:
>>>           gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
>>> @@ -326,6 +431,13 @@ static bool ffa_probe(void)
>>>       printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
>>>              major_vers, minor_vers);
>>>   +    /*
>>> +     * TODO save result of checked features and use that information to
>>> +     * accept or reject requests from guests.
>>> +     */
>>
>> I am not entirely sure I understand this TODO. Does it mean a guest can currently use a request that is not supported by FFA?
> 
> In fact this is a bit the opposite: in the following patch we check that all features we could need are supported but if a guest is only using a subset we might not need to have all of them.
> Idea of this TODO would be to save the features supported and refuse guest requests depending on the features needed for them.

Thanks. I would suggest the following comment:

/*
  * At the moment domains must supports the same features used by Xen.
  * TODO: Rework the code to allow domain to use a subset of the features
  * supported.
  */

Note that I am using "domains" rather than "guests" because the latter 
doesn't include dom0.

Cheers,

-- 
Julien Grall

