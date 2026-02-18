Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALYuFvXUlWnFVAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 16:04:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9B415740C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 16:04:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235748.1538616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsj5u-0002tB-V5; Wed, 18 Feb 2026 15:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235748.1538616; Wed, 18 Feb 2026 15:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsj5u-0002rf-RB; Wed, 18 Feb 2026 15:04:02 +0000
Received: by outflank-mailman (input) for mailman id 1235748;
 Wed, 18 Feb 2026 15:04:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cF4C=AW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsj5u-0002rZ-3c
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 15:04:02 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e51dd7d-0cdb-11f1-b164-2bf370ae4941;
 Wed, 18 Feb 2026 16:04:00 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4362197d174so3650931f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Feb 2026 07:04:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ad009bsm41299027f8f.39.2026.02.18.07.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Feb 2026 07:03:59 -0800 (PST)
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
X-Inumbo-ID: 0e51dd7d-0cdb-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771427040; x=1772031840; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tEVEkoZtAay+XmTShREPVqYfTs2ms0eYUXlFrlW/xfk=;
        b=QFK7rMFIW8yBJjarvxncVKke21yySrWmTYvoSfuN7DrLcdWs6uBwxcjc7MQ1t9iVLC
         zUZqJIOohVvzjGWyGnxmyZVxYPxpdpIb0JaIyhbrFJ2GCafW0tGX/xFdnEEeHUm3bnsn
         O+j/gtTfiCRL1CI1wmQ2b81+1lG/jjGB2EvA3YZZzaV0PQx8CKebZ7Qt+GfJjsnBtFRg
         p0BcMNCssJcYlL3ShnAdSp/69du+TmNFOuDJYJl+A/L8aYRkZJC3SCnlDB32XQ5yTFMg
         3vkUWAbhuNKroMSmh3YW9o1shUCmuWszfzdU4px2tcnCP+VDm5T3jnVNlMOQyvhWeyFR
         Nhqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771427040; x=1772031840;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEVEkoZtAay+XmTShREPVqYfTs2ms0eYUXlFrlW/xfk=;
        b=aDPV5aAVp687I2X/nkzAL3ReyhTgutSWfTA+TPlNOrxcHQOypUy4gtvJgnr3YPKqwP
         SyjOMGWvVChLsKAQ82vJ0ZotAZ75eGqKhKAgyPX2yIgo2rJ2/LbgYUaztK96ysTd67qY
         +VuBr3NdhXQoyC3lironipLfvVp3xae8DEylpeCHOTl11mOTEmAlU0ROyVd5Rfndbr0u
         i8yIsYljFTBu7/GjHrllR/izLIyyjJtkb+aqZiYRahwGMDBnvFpTA0vLenzjVKXdQzAN
         JaTl/2Od+I8rxqj+FFRsBRQdpPpIOo+8dF9HjCPUctVS/dw63cct2UN6VyXjPqC133eu
         9sow==
X-Forwarded-Encrypted: i=1; AJvYcCUF1TTczM4a03REfLmj/FPbyqi49UQU/cOX+Qqt3GQFKmZ/9P8of94YpNN2/4iC6X+PaIv70lvZPnQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzhJjgnNCn0/TSqduC27vcflou4Zk8ElHqI4JJ2x2F8nWu1CdM7
	/dL2Cmu22a1B5JdgbaWGB6H9SBXSyp8sbsS1L6jxRTQcsC2ItU5gRQLmGbc1tW+/jw==
X-Gm-Gg: AZuq6aLroXkfVfmtEOldOag1gPxojhQs+5/3bgKToKX5RPrCj/A+WTDvUkVoJixD4DB
	fIVR1uoRPYUmXD27Ch3KZwHpyo8ckN6ubRt4GqyhvJZq92LzhBxWfI1XV/9MDosZr1K0aKgyC9/
	PIoh39SpvQWhfrKZ1+A/wDnFVhzTnFIfbYlk5bnUOI7d6pw5/Yd2scvAU3dIEtFrGo+FGg+0sMm
	9u/p8SVhTHWg8qQHM6VDsy//IiAUDOkoXo3weG1SBWUv8JNxg1VRXi5HeifPo+9U83kCZNrUkkq
	xhxBBiv8O5TP5FUFNcbtlkNxwQo/AX1LGb78QwSzJFEJUTDYDoGwLgx0+FLuvKzaEAwEjS1/nhe
	sgsuhSeVBSULPY1AO3vxJkIs1w+h41ip2Sdms1mj9PSMKXuDYV6+NVBE2Fqe3se5kK+A0d7amnZ
	L7xlxKp97BqEw158jq3op8ZZWC9fnQbLooXd+S1/Q+IZ9IXEOP/ESCF9O8G7ixvmOZ0re0Zczb0
	Ea6Tn0N7dZfAdw=
X-Received: by 2002:a5d:5d02:0:b0:437:893f:3361 with SMTP id ffacd0b85a97d-43958e02d7amr3667857f8f.20.1771427039718;
        Wed, 18 Feb 2026 07:03:59 -0800 (PST)
Message-ID: <57074bdb-6af9-4cd8-b1da-d348757ca168@suse.com>
Date: Wed, 18 Feb 2026 16:03:57 +0100
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
In-Reply-To: <ff62ece8-a7f3-4490-967c-e9e8283dcd9d@apertussolutions.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: BB9B415740C
X-Rspamd-Action: no action

On 18.02.2026 15:33, Daniel P. Smith wrote:
> On 2/17/26 04:34, Jan Beulich wrote:
>> On 16.02.2026 22:57, Daniel P. Smith wrote:
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -210,7 +210,7 @@ static void set_domain_state_info(struct xen_domctl_get_domain_state *info,
>>>   int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>>>                        domid_t *domid)
>>>   {
>>> -    unsigned int dom;
>>> +    unsigned int dom = 0;
>>>       int rc = -ENOENT;
>>>       struct domain *hdl;
>>>   
>>> @@ -219,6 +219,10 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>>>   
>>>       if ( d )
>>>       {
>>> +        rc = xsm_get_domain_state(XSM_XS_PRIV, d);
>>> +        if ( rc )
>>> +            return rc;
>>> +
>>>           set_domain_state_info(info, d);
>>>   
>>>           return 0;
>>> @@ -238,10 +242,10 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>>>   
>>>       while ( dom_state_changed )
>>>       {
>>> -        dom = find_first_bit(dom_state_changed, DOMID_MASK + 1);
>>> +        dom = find_next_bit(dom_state_changed, DOMID_MASK + 1, dom);
>>>           if ( dom >= DOMID_FIRST_RESERVED )
>>>               break;
>>> -        if ( test_and_clear_bit(dom, dom_state_changed) )
>>> +        if ( test_bit(dom, dom_state_changed) )
>>>           {
>>>               *domid = dom;
>>
>> This is problematic wrt other work (already talked about in the distant past,
>> but sadly only making little progress) towards trying to pull some of the
>> sub-ops out of the domctl-locked region. This subop is one of the prime
>> candidates, yet only if the test_and_clear_bit() remains here.
> 
> Okay, but we can't be clearing the bit if the src domain doesn't have 
> access. When considering that xsm_domctl() does a no-op check for 
> XEN_DOMCTL_get_domain_state, deferring to xsm_get_domain_state(), then 
> any domain could invoke the OP with DOMID_INVALID and clear the bit 
> before access is checked.
> 
> If you want to ensure atomic operations on the bit field, while I am not 
> a fan of this, a combination with set_bit() could be done. Let the 
> test_and_clear_bit() remain and then if access check fails, use 
> set_bit() to put it back. Would that be sufficient for your objective?

No, that could then confuse a legitimate (for that domain) caller. IOW
you would still build upon the domctl lock serializing things. I think
you want to do the XSM check first, and only then use test_and_clear_bit().

>>> @@ -249,6 +253,15 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>>>   
>>>               if ( d )
>>>               {
>>> +                rc = xsm_get_domain_state(XSM_XS_PRIV, d);
>>> +                if ( rc )
>>> +                {
>>> +                    rcu_unlock_domain(d);
>>> +                    rc = -ENOENT;
>>
>> As you don't otherwise use xsm_get_domain_state()'s return value, the need
>> for this assignment can be eliminated by putting the function call straight
>> in the if(). Then again, to address the remark above, overall code structure
>> will need to change quite a bit anyway (so the remark here may be moot).
> 
> I can drop the use of rc here and inline it.
> 
>>> +                    dom++;
>>
>> It may be nice to eliminate the need to have this in two places (here and ...
>>
>>> +                    continue;
>>> +                }
>>> +
>>>                   set_domain_state_info(info, d);
>>>   
>>>                   rcu_unlock_domain(d);
>>> @@ -256,10 +269,13 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>>>               else
>>>                   memset(info, 0, sizeof(*info));
>>>   
>>> +            clear_bit(dom, dom_state_changed);
>>>               rc = 0;
>>>   
>>>               break;
>>>           }
>>> +
>>> +        dom++;
>>>       }
>>
>> ... here), by having the variable's initializer be -1 and then using dom + 1
>> in the find_next_bit() invocation.
> 
> If you want this way, then there are two options, make dom no longer 
> unsigned or be willing to allow unsigned int overflow. If we go with the 
> former, If you agree, I would leave it as an int as that should cover 
> the range of valid domids.

I wouldn't outright nak use of plain int, but I'm putting in effort to remove
such undue uses of that type. Unsigned overflow is well-defined aiui, so I
see no reason why the variable can't remain "unsigned int".

Jan

