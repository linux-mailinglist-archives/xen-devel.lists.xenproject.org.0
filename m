Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qG3qLC7flWneVgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 16:47:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BFC157770
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 16:47:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235804.1538655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsjm6-0001ey-NH; Wed, 18 Feb 2026 15:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235804.1538655; Wed, 18 Feb 2026 15:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsjm6-0001bw-Kh; Wed, 18 Feb 2026 15:47:38 +0000
Received: by outflank-mailman (input) for mailman id 1235804;
 Wed, 18 Feb 2026 15:47:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cF4C=AW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsjm5-0001aX-Am
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 15:47:37 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 251cd65f-0ce1-11f1-b164-2bf370ae4941;
 Wed, 18 Feb 2026 16:47:35 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-4376acce52eso3572443f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Feb 2026 07:47:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a74918sm42702163f8f.17.2026.02.18.07.47.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Feb 2026 07:47:34 -0800 (PST)
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
X-Inumbo-ID: 251cd65f-0ce1-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771429655; x=1772034455; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tpzoMMNKAw8Tv8y20Bu/mhhyjy6Tbc0ostyv8jc+Euk=;
        b=fOorGpl9XB03075tVM/ntiL+urd0+WrV1oG6kqy/qdlXllWwhlX4zxP6mCFLiEv64b
         7anjk3GtRu2N0+5e7JthwbhxM4wbeZGbiAfughFjOck+BI9d9JTCnhyQTRSz369uzyVo
         k/v48FjX5t3iO7FQGQHupqfUi0nzLf0Nr3/h3q6ilkW2O9sGrt5xKQ6NdlqqDQ/tMVyb
         Pl5rFGT4mGOcfE+O7kVsp3AbKB+4oBscsR2INa6mnGA/9eiDFgKgKj4RShsjQjPYSi6p
         tB4htT9e1Fqg5ljIi4e9BWxbv+wgTZr1+pkHqanWcBtWv37775+NsbXulmzWRJusAX5w
         J7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771429655; x=1772034455;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpzoMMNKAw8Tv8y20Bu/mhhyjy6Tbc0ostyv8jc+Euk=;
        b=dm2O54y2Pnygomr8FXvcHMFtLVH1WF9JHQpgAHdblawvN8IHUcJsTsZrQK5tG2KIf3
         rXyxYYRwe6sOwJChmPL5JHDR0xwbc+QnEIUumY0ERkA6YGFp0P5gxqqE3dZ9cY1Up81X
         DyOwqkB2gpBfHuK+Fny19G3LdhFQ8MP6t9TJnLYes7cQZbIcdJL3Qz6VCDKqAaakfG03
         AnjndsR5IExWAe6Q5xr5i33TRaF4I+z+JHzIoUpyguyqHy51HQdG1QPtCnh+DiNOlXWO
         lKvQR5de7eSfVqwORBhozyvq9Gje2Ax7CaARW+aTvxrTJ3Jjxf1n8wiZhzB/fW6KTAYb
         LD0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXic9YA7LvW5xkmZcgmdNNVaO1QRRdLt+epy6S6peE5uBfypnL7T7A4nusl/PcTczojrCmJP5FwEOw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdId9wj8zA4+5I0zIgP3R8af/oM9wgzWdQVvmY9T95lWhrGbV9
	srjZlhxqTWR7SAOlc0NUEuJBi42GJRo1ppYPYRmQU6KaE1sFNMVNOr8xTiQmzx5hOQ==
X-Gm-Gg: AZuq6aJs7hV43xSH1YN3aDhuCYKEIiwrpK5tt8mZ4XTVtNmGc8PXLMprOnZg/2bX4zi
	EBCkaaRhQK67PsOwze2sKInBCVTHUcr8TssOpx7f112xPkQhdPKWvUz9c4h3uQjDyHaGarn2GOJ
	Xs82PIpQ75WtMkvQq3qx4WQgkvGT71SSGXOioI0VXFjl3mz7K2oilNd2/zLq6/LjEwPro4+oNO6
	Rq+Qk1A99OJ+42jwcdC6oAsU3h/s1bHjr0+0Ye3wP+cbSq97g7uRYGn4BUlNekO735+gg/vNS2x
	lEQkp4QuALOTfQv31ZRSUWNQeldtrHDQS0PUdtuks4xw8UE0H7f2kWzm/MzfuV6mBDwJAlw52MM
	prRxuCH+XSIkdeMp6Vc0tm4s7ayV0KId/OrzynMIWaR1YQnMJc5CcWEJ4Aoti+tPfQTjV2HLMl/
	WaWLEpcCE+jhzxICQ0PLl8ACosXh8AQkqXWFGrwNxPUvJIi3yT7J5dNgoMo2iz9cvtp1DmXPBdj
	LixR0RcpWh4iHE=
X-Received: by 2002:a05:6000:184e:b0:436:1a4b:de36 with SMTP id ffacd0b85a97d-43958e0314amr3869656f8f.22.1771429654789;
        Wed, 18 Feb 2026 07:47:34 -0800 (PST)
Message-ID: <158de6d6-f7ef-453c-9c78-00c4d785bcd1@suse.com>
Date: Wed, 18 Feb 2026 16:47:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] common/domctl: xsm update for get_domain_state access
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Chris Rogers <rogersc@ainfosec.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260216215748.20398-1-dpsmith@apertussolutions.com>
 <1a1d8db1-d553-470a-8678-b879385b2fec@suse.com>
 <ff62ece8-a7f3-4490-967c-e9e8283dcd9d@apertussolutions.com>
 <57074bdb-6af9-4cd8-b1da-d348757ca168@suse.com>
 <2ac8e0ec-54ab-4485-b0f4-a49920726d0f@apertussolutions.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <2ac8e0ec-54ab-4485-b0f4-a49920726d0f@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dpsmith@apertussolutions.com,m:rogersc@ainfosec.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 23BFC157770
X-Rspamd-Action: no action

On 18.02.2026 16:32, Daniel P. Smith wrote:
> On 2/18/26 10:03, Jan Beulich wrote:
>> On 18.02.2026 15:33, Daniel P. Smith wrote:
>>> On 2/17/26 04:34, Jan Beulich wrote:
>>>> On 16.02.2026 22:57, Daniel P. Smith wrote:
>>>>> --- a/xen/common/domain.c
>>>>> +++ b/xen/common/domain.c
>>>>> @@ -210,7 +210,7 @@ static void set_domain_state_info(struct xen_domctl_get_domain_state *info,
>>>>>    int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>>>>>                         domid_t *domid)
>>>>>    {
>>>>> -    unsigned int dom;
>>>>> +    unsigned int dom = 0;
>>>>>        int rc = -ENOENT;
>>>>>        struct domain *hdl;
>>>>>    
>>>>> @@ -219,6 +219,10 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>>>>>    
>>>>>        if ( d )
>>>>>        {
>>>>> +        rc = xsm_get_domain_state(XSM_XS_PRIV, d);
>>>>> +        if ( rc )
>>>>> +            return rc;
>>>>> +
>>>>>            set_domain_state_info(info, d);
>>>>>    
>>>>>            return 0;
>>>>> @@ -238,10 +242,10 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>>>>>    
>>>>>        while ( dom_state_changed )
>>>>>        {
>>>>> -        dom = find_first_bit(dom_state_changed, DOMID_MASK + 1);
>>>>> +        dom = find_next_bit(dom_state_changed, DOMID_MASK + 1, dom);
>>>>>            if ( dom >= DOMID_FIRST_RESERVED )
>>>>>                break;
>>>>> -        if ( test_and_clear_bit(dom, dom_state_changed) )
>>>>> +        if ( test_bit(dom, dom_state_changed) )
>>>>>            {
>>>>>                *domid = dom;
>>>>
>>>> This is problematic wrt other work (already talked about in the distant past,
>>>> but sadly only making little progress) towards trying to pull some of the
>>>> sub-ops out of the domctl-locked region. This subop is one of the prime
>>>> candidates, yet only if the test_and_clear_bit() remains here.
>>>
>>> Okay, but we can't be clearing the bit if the src domain doesn't have
>>> access. When considering that xsm_domctl() does a no-op check for
>>> XEN_DOMCTL_get_domain_state, deferring to xsm_get_domain_state(), then
>>> any domain could invoke the OP with DOMID_INVALID and clear the bit
>>> before access is checked.
>>>
>>> If you want to ensure atomic operations on the bit field, while I am not
>>> a fan of this, a combination with set_bit() could be done. Let the
>>> test_and_clear_bit() remain and then if access check fails, use
>>> set_bit() to put it back. Would that be sufficient for your objective?
>>
>> No, that could then confuse a legitimate (for that domain) caller. IOW
>> you would still build upon the domctl lock serializing things. I think
>> you want to do the XSM check first, and only then use test_and_clear_bit().
> 
> Currently, acquiring the struct domain pointer is inside the if 
> condition. This would have to be moved outside the if condition to be 
> able to do the access check before calling the bit operation. Which 
> brings up the question for me, if it is reordered in this fashion, why 
> not use clear_bit(), aiui it should be atomic as well.

The problem isn't with clear_bit() by itself (yes, it is atomic), but
with how things want doing here: The test-and-clear ensures data for a
given domain can only be retrieved exactly once (until the bit would be
set another time later). With test split from clear, multiple callers
could get data for the same domain, as in the window between test and
clear a 2nd caller can come in and also commit to returning data for
that domain. (Given the restriction on who can invoke this, one might
conclude no such race is possible, but that single domain could process
things on multiple vCPU-s, and would then wrongly be notified twice for
the same domain.)

>>>>> @@ -249,6 +253,15 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>>>>>    
>>>>>                if ( d )
>>>>>                {
>>>>> +                rc = xsm_get_domain_state(XSM_XS_PRIV, d);
>>>>> +                if ( rc )
>>>>> +                {
>>>>> +                    rcu_unlock_domain(d);
>>>>> +                    rc = -ENOENT;
>>>>
>>>> As you don't otherwise use xsm_get_domain_state()'s return value, the need
>>>> for this assignment can be eliminated by putting the function call straight
>>>> in the if(). Then again, to address the remark above, overall code structure
>>>> will need to change quite a bit anyway (so the remark here may be moot).
>>>
>>> I can drop the use of rc here and inline it.
>>>
>>>>> +                    dom++;
>>>>
>>>> It may be nice to eliminate the need to have this in two places (here and ...
>>>>
>>>>> +                    continue;
>>>>> +                }
>>>>> +
>>>>>                    set_domain_state_info(info, d);
>>>>>    
>>>>>                    rcu_unlock_domain(d);
>>>>> @@ -256,10 +269,13 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>>>>>                else
>>>>>                    memset(info, 0, sizeof(*info));
>>>>>    
>>>>> +            clear_bit(dom, dom_state_changed);
>>>>>                rc = 0;
>>>>>    
>>>>>                break;
>>>>>            }
>>>>> +
>>>>> +        dom++;
>>>>>        }
>>>>
>>>> ... here), by having the variable's initializer be -1 and then using dom + 1
>>>> in the find_next_bit() invocation.
>>>
>>> If you want this way, then there are two options, make dom no longer
>>> unsigned or be willing to allow unsigned int overflow. If we go with the
>>> former, If you agree, I would leave it as an int as that should cover
>>> the range of valid domids.
>>
>> I wouldn't outright nak use of plain int, but I'm putting in effort to remove
>> such undue uses of that type. Unsigned overflow is well-defined aiui, so I
>> see no reason why the variable can't remain "unsigned int".
> 
> Honestly, I'm not sure why it was not domid_t in the first place. I 
> can't keep all the rules, but I thought MISRA frowned on overflow usages 
> (abuse?) like this. If you will ack it with it as a uint or as a 
> domid_t, then I have no issue doing it this way.

A patch without changing the type I would ack. A switch to domid_t, if indeed
correct (I simply didn't go check yet), likely would want to be a separate
change.

Jan

