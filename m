Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA75CBA71A8
	for <lists+xen-devel@lfdr.de>; Sun, 28 Sep 2025 16:38:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132382.1470741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2sXo-0005yb-PB; Sun, 28 Sep 2025 14:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132382.1470741; Sun, 28 Sep 2025 14:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2sXo-0005x6-MD; Sun, 28 Sep 2025 14:38:32 +0000
Received: by outflank-mailman (input) for mailman id 1132382;
 Sun, 28 Sep 2025 14:38:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wVCj=4H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v2sXn-0005x0-AR
 for xen-devel@lists.xenproject.org; Sun, 28 Sep 2025 14:38:31 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd352e9b-9c78-11f0-9d14-b5c5bf9af7f9;
 Sun, 28 Sep 2025 16:38:30 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3ee15b5435bso2072867f8f.0
 for <xen-devel@lists.xenproject.org>; Sun, 28 Sep 2025 07:38:30 -0700 (PDT)
Received: from ?IPV6:2003:ca:b74b:a88a:551d:1421:7d53:a1cf?
 (p200300cab74ba88a551d14217d53a1cf.dip0.t-ipconnect.de.
 [2003:ca:b74b:a88a:551d:1421:7d53:a1cf])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fac4a5e41sm15400339f8f.0.2025.09.28.07.38.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Sep 2025 07:38:29 -0700 (PDT)
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
X-Inumbo-ID: cd352e9b-9c78-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759070310; x=1759675110; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9aeZpNNB3AM/ivUXnYLwY+Ge/tWwIuSoY+2XAyCf+Do=;
        b=c/ttDHEo0SSzGGsyMjKnxsa/lNR91mOtIRnmpPW9hjNCvUvpY6CQ8n61Q5d9osF49l
         MyUPLWrJyInE86Ebu2LxKQdfdgsKgWQxl945E9SmL5Zog6DlBVfhiwkmQw73XcnAGKT9
         A/I4GF0v6TtET27V4SDxxlzsOOd3eUz8OsU5wV0zHRlZgAUuNvtIR+ef7Z98fawRLnrt
         i3LJurZZW/WtU6wiYM17eHxK3N3kQKa5Iddig8FnLlsyR8GtiEeknvyN9BA/j4ROFG+E
         CLirWiAhfIgiUS2TReontqjTD7nk3zCXe5TW3rBy5P/2Q8KN9XrkjQHWdLnbEqKt8B10
         jwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759070310; x=1759675110;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9aeZpNNB3AM/ivUXnYLwY+Ge/tWwIuSoY+2XAyCf+Do=;
        b=OkYmfAZihbaPeKrHhbop9L0ebqn0tH+EuGVzJ0FSyn+6E99/n9gBONrTcLCGChw+4K
         Cf7HvMNVVTisyxZvygctbQIbSTNnbIidBlxjNl4swC3nDc9wKFcPRVMOKh3DGD+7c7GA
         /OmWhRW+YwWFCUJz8AjhOwC6S7Z12wQwfmam2FSgYBSc/0MhRlHFyJqshd6+BmsR7wxC
         bit9cSmbrhlFk2tUZ4sfQ81BYOhCrJ/z8mRX7G0bR9og2oUqrIpsYgZZqiRYai9g5chA
         T1jfNeCPzcHEVzUtmVswVGdXzVnm7tiOKbMnsEMKWHfnRm2gTlU+LmhSjGuARE0yVnjr
         TVcw==
X-Forwarded-Encrypted: i=1; AJvYcCUD/eurvDc0GFqUeGuBwNRjhUolTF6X76dAv8gzx6Dyj8yUGCO5XlkF2oXRNvloStbe2pyKNfzNsgI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwnWBow0MqZspNtVQcwpv5zGI+SMN/cVV2fqF1q+BmdYjHZp3w
	8GPzgNF5Xktap1/KhTYM2NoXOQo1j41dy53TlJ/eUu8T4EqbTRMWTsuQj63Wuquo9g==
X-Gm-Gg: ASbGnct3mGTj71Sp1onWGuqPhZjn0HDGqTrKqJgIdfDPErrb2YCmilJ/xwS8qnehKhb
	/t9WQK+7n80b/cq4J2k3BCo7s5vQFAS73U1q27spH8fyme4prUrP5f0wZs4evUME3IOfhKUIKVa
	unDVAY8MUlYbEAVv72K7OSP4G3kaLov8hzIGChG2wWm6zTjMpyiJhE9QHaSJFmAY3p7n/FVhy76
	TQg1mMY/RteFPJHnDRWOr1GHLyiZqNpNFEsilz85NJSmeMT1zA4kEBBKF7sId7wfiTS3DDc0ca+
	IEAEbxIYnQAqSG6ovE5Icyp9VDxdMSXIYQFPnoKwQBBSLsr49yS0Gh0pvjUSdPTbOL9aaQBfUmW
	uyV2//vn6NcBiYVXQsL1J5DS02NjAHi32gFt85scZeA3JMSWrI+CnLoR9Pb71Iv0zqfYtdWRr0n
	SJxXuaIqHm1l5b6Po7tmu07TUSsg3XbSiqYs6KwLngG4A+8LuN5NTkZpyg
X-Google-Smtp-Source: AGHT+IGQNs7J7TB/XXzKdpKDFpRYjCWC4Rin7mOPmDUkK4GAq3ANzMWbicFv1LLA6ubzkKuXDKTNlw==
X-Received: by 2002:a05:6000:26c9:b0:3ee:15c6:9a6b with SMTP id ffacd0b85a97d-40e48a5697amr12825355f8f.48.1759070309593;
        Sun, 28 Sep 2025 07:38:29 -0700 (PDT)
Message-ID: <0e72c63c-9a6b-4fd7-848d-8c8d09fc91ef@suse.com>
Date: Sun, 28 Sep 2025 16:38:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/26] xen/domctl: wrap xsm_getdomaininfo() with
 CONFIG_MGMT_HYPERCALLS
To: Stefano Stabellini <sstabellini@kernel.org>,
 "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 "Andryuk, Jason" <Jason.Andryuk@amd.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-19-Penny.Zheng@amd.com>
 <a8b93dcc-c003-49a6-8a78-5fb890cbaec0@suse.com>
 <DM4PR12MB8451BE98219C343F8F62482AE11FA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <66b43c3b-c74f-4c18-b91a-bd7b56a62eff@suse.com>
 <DM4PR12MB84518B65027B6A355ED4D246E11EA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <af57c032-541d-4956-85de-269066c50cd3@suse.com>
 <IA1PR12MB8467188458BA8FAF348AC538E11EA@IA1PR12MB8467.namprd12.prod.outlook.com>
 <alpine.DEB.2.22.394.2509261224150.2244509@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2509261224150.2244509@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.09.2025 21:24, Stefano Stabellini wrote:
> On Thu, 25 Sep 2025, Penny, Zheng wrote:
>>> -----Original Message-----
>>> From: Jan Beulich <jbeulich@suse.com>
>>> Sent: Friday, September 26, 2025 2:53 PM
>>> To: Penny, Zheng <penny.zheng@amd.com>
>>> Cc: Huang, Ray <Ray.Huang@amd.com>; Daniel P. Smith
>>> <dpsmith@apertussolutions.com>; xen-devel@lists.xenproject.org; Stabellini,
>>> Stefano <stefano.stabellini@amd.com>; Andryuk, Jason
>>> <Jason.Andryuk@amd.com>
>>> Subject: Re: [PATCH v2 18/26] xen/domctl: wrap xsm_getdomaininfo() with
>>> CONFIG_MGMT_HYPERCALLS
>>>
>>> On 26.09.2025 06:41, Penny, Zheng wrote:
>>>>> -----Original Message-----
>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>> Sent: Thursday, September 25, 2025 10:29 PM
>>>>>
>>>>> On 25.09.2025 11:41, Penny, Zheng wrote:
>>>>>>> -----Original Message-----
>>>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>>>> Sent: Thursday, September 11, 2025 9:30 PM
>>>>>>>
>>>>>>> On 10.09.2025 09:38, Penny Zheng wrote:
>>>>>>>> --- a/xen/include/xsm/xsm.h
>>>>>>>> +++ b/xen/include/xsm/xsm.h
>>>>>>>> @@ -55,8 +55,8 @@ struct xsm_ops {
>>>>>>>>      void (*security_domaininfo)(struct domain *d,
>>>>>>>>                                  struct xen_domctl_getdomaininfo *info);
>>>>>>>>      int (*domain_create)(struct domain *d, uint32_t ssidref);
>>>>>>>> -    int (*getdomaininfo)(struct domain *d);
>>>>>>>>  #ifdef CONFIG_MGMT_HYPERCALLS
>>>>>>>> +    int (*getdomaininfo)(struct domain *d);
>>>>>>>>      int (*domctl_scheduler_op)(struct domain *d, int op);
>>>>>>>>      int (*sysctl_scheduler_op)(int op);
>>>>>>>>      int (*set_target)(struct domain *d, struct domain *e); @@
>>>>>>>> -234,7
>>>>>>>> +234,11 @@ static inline int xsm_domain_create(
>>>>>>>>
>>>>>>>>  static inline int xsm_getdomaininfo(xsm_default_t def, struct
>>>>>>>> domain
>>>>>>>> *d)  {
>>>>>>>> +#ifdef CONFIG_MGMT_HYPERCALLS
>>>>>>>>      return alternative_call(xsm_ops.getdomaininfo, d);
>>>>>>>> +#else
>>>>>>>> +    return -EOPNOTSUPP;
>>>>>>>> +#endif
>>>>>>>>  }
>>>>>>>
>>>>>>> This is in use by a Xenstore sysctl and a Xenstore domctl. The
>>>>>>> sysctl is hence already broken with the earlier series. Now the
>>>>>>> domctl is also being screwed up. I don't think MGMT_HYPERCALLS
>>>>>>> really ought to extend to any operations available to other than the core
>>> toolstack.
>>>>>>> That's the Xenstore ones here, but also the ones used by qemu
>>>>>>> (whether run in
>>>>> Dom0 or a stubdom).
>>>>>>
>>>>>> Maybe not only limited to the core toolstack. In
>>>>>> dom0less/hyperlaunched
>>>>> scenarios, hypercalls are strictly limited. QEMU is also limited to
>>>>> pvh machine type and with very restricted functionality(, only acting
>>>>> as a few virtio-pci devices backend). @Andryuk, Jason @Stabellini,
>>>>> Stefano Am I understanding correctly and thoroughly about our scenario here for
>>> upstream?
>>>>>> Tracking the codes, if Xenstore is created as a stub domain, it
>>>>>> requires
>>>>> getdomaininfo-domctl to acquire related info.  Sorry, I haven't found
>>>>> how it was called in QEMU...
>>>>>
>>>>> It's not "it"; it's different ones. First and foremost I was thinking
>>>>> of
>>>>>  * XEN_DOMCTL_ioport_mapping
>>>>>  * XEN_DOMCTL_memory_mapping
>>>>>  * XEN_DOMCTL_bind_pt_irq
>>>>>  * XEN_DOMCTL_unbind_pt_irq
>>>>> but there may be others (albeit per the dummy xsm_domctl() this is
>>>>> the full set). As a general criteria, anything using XSM_DM_PRIV
>>>>> checking can in principle be called by qemu.
>>>>>
>>>>
>>>> Understood.
>>>> I assume that they are all for device passthrough. We are not accepting device
>>> passthrough via core toolstack in dom0less/hyperlaunch-ed scenarios. Jason has
>>> developed device passthrough through device tree to only accept "static
>>> configured" passthrough in dom0less/hyperlaunch-ed scenario, while it is still
>>> internal , it may be the only accept way to do device passthrough in
>>> dom0less/hyperlaunch-ed scenario.
>>>
>>> Right, but no matter what your goals, the upstream contributions need to be self-
>>> consistent. I.e. not (risk to) break other functionality. (Really the four domctl-s
>>> mentioned above might better have been put elsewhere, e.g. as dm-ops. Moving
>>> them may be an option here.)
>>
>> Understood.
>> I'll move them all to the dm-ops
> 
> Hi Penny, Jan, I advise against this.
> 
> I think it is clear that there are open questions on how to deal with
> the safety scenarios. I briefly mentioned some of the issues last week
> at Xen Summit. One example is the listdomains hypercall that should be
> available to the control domain. We cannot resolve all problems with
> this patch series. I think we should follow a simpler plan:
> 
> 1) introduce CONFIG_MGMT_HYPERCALLS the way this patch series does,
>    removing all domctls and sysctls
> 
> 2) make further adjustments, such as making available the listdomains
>    hypercall and/or the hypercalls listed by Jan as a second step after
>    it

I'm going to be okay-ish with that as long as the help text of the Kconfig
option clearly mentions those extra pitfalls.

Jan

