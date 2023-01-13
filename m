Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B7D6691CE
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 09:53:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476879.739291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGFoY-0007LG-Q9; Fri, 13 Jan 2023 08:53:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476879.739291; Fri, 13 Jan 2023 08:53:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGFoY-0007J3-MV; Fri, 13 Jan 2023 08:53:30 +0000
Received: by outflank-mailman (input) for mailman id 476879;
 Fri, 13 Jan 2023 08:53:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pGFoW-0007Ix-S9
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 08:53:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pGFoV-0004ch-Mc; Fri, 13 Jan 2023 08:53:27 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.6.109]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pGFoV-0001bx-G3; Fri, 13 Jan 2023 08:53:27 +0000
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
	bh=k1Ov1U07Jan8onZaC2heWsBWIE6+/OP85zbh62hF1ls=; b=lDeVwjScMCd9XObMN3xEBg6HJH
	jzoxu93uw8Tv3/0IdvL6QxNnVgpoBPc2LP4Ij4AiyShM5bVxfKNEiEebkaTsgTBHPkfek5hakCTJb
	Q5Q2xbdlpd2HhvDI4hfcZeQIYb5jHRiJhNlfAd+2Mjmjbe2OR/RZI/BWQU9baDJE1EkU=;
Message-ID: <0d736370-5dd9-637d-c6d2-74dfb7e4209e@xen.org>
Date: Fri, 13 Jan 2023 08:53:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 1/8] xen/arm: enable SVE extension for Xen
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230111143826.3224-1-luca.fancellu@arm.com>
 <20230111143826.3224-2-luca.fancellu@arm.com>
 <e37e5564-e7b9-c9d2-1360-171c014649c7@xen.org>
 <85F9C725-816A-46EE-AD0C-2725AE13F14C@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <85F9C725-816A-46EE-AD0C-2725AE13F14C@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 12/01/2023 10:46, Luca Fancellu wrote:
> 
> 
>> On 11 Jan 2023, at 17:16, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> As this is an RFC, I will be mostly making general comments.
> 
> Hi Julien,
> 
> Thank you.
> 
>>
>> On 11/01/2023 14:38, Luca Fancellu wrote:
>>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>>> index 99577adb6c69..8ea3843ea8e8 100644
>>> --- a/xen/arch/arm/domain.c
>>> +++ b/xen/arch/arm/domain.c
>>> @@ -181,6 +181,8 @@ static void ctxt_switch_to(struct vcpu *n)
>>>       /* VGIC */
>>>       gic_restore_state(n);
>>>   +    WRITE_SYSREG(n->arch.cptr_el2, CPTR_EL2);
>>
>> Shouldn't this need an isb() afterwards do ensure that any previously trapped will be accessible?
> 
> Yes you are right, would it be ok for you if I move this before gic_restore_state because it inside
> has an isb()? This to limit the isb() usage. I could put also a comment to don’t forget it.

I would rather prefer if we don't rely on gic_restore_state() to have an 
isb() because this could change in the future (although unlikely).

Looking at the context switch code, I think we can move the call to 
restore the floating register towards the end of the helper and use one 
of the existing isb() for our purpose.


>>> @@ -122,6 +137,7 @@ __initcall(update_serrors_cpu_caps);
>>>     void init_traps(void)
>>>   {
>>> +    register_t cptr_bits = get_default_cptr_flags();
>>>       /*
>>>        * Setup Hyp vector base. Note they might get updated with the
>>>        * branch predictor hardening.
>>> @@ -135,17 +151,15 @@ void init_traps(void)
>>>       /* Trap CP15 c15 used for implementation defined registers */
>>>       WRITE_SYSREG(HSTR_T(15), HSTR_EL2);
>>>   -    /* Trap all coprocessor registers (0-13) except cp10 and
>>> -     * cp11 for VFP.
>>> -     *
>>> -     * /!\ All coprocessors except cp10 and cp11 cannot be used in Xen.
>>> -     *
>>> -     * On ARM64 the TCPx bits which we set here (0..9,12,13) are all
>>> -     * RES1, i.e. they would trap whether we did this write or not.
>>> +#ifdef CONFIG_ARM64_SVE
>>> +    /*
>>> +     * Don't trap SVE now, Xen might need to access ZCR reg in cpufeature code,
>>> +     * trapping again or not will be handled on vcpu creation/scheduling later
>>>        */
>>
>> Instead of enable by default at boot, can we try to enable/disable only when this is strictly needed?
> 
> Yes we could un-trap inside compute_max_zcr() just before accessing SVE resources and trap it
> again when finished. Would it be ok for you this approach?

Yes.

Cheers,

-- 
Julien Grall

