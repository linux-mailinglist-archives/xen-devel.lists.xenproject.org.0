Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDC3BA2A8C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 09:14:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131152.1470352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v22ed-0005FZ-Jn; Fri, 26 Sep 2025 07:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131152.1470352; Fri, 26 Sep 2025 07:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v22ed-0005CL-Ft; Fri, 26 Sep 2025 07:14:07 +0000
Received: by outflank-mailman (input) for mailman id 1131152;
 Fri, 26 Sep 2025 07:14:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v22ec-0004hn-1g
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 07:14:06 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 623fbaf4-9aa8-11f0-9809-7dc792cee155;
 Fri, 26 Sep 2025 09:14:04 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b2b4096539fso318250166b.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Sep 2025 00:14:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353efa4696sm312600166b.27.2025.09.26.00.14.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 00:14:03 -0700 (PDT)
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
X-Inumbo-ID: 623fbaf4-9aa8-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758870844; x=1759475644; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sTIC/0L6sFxkiu2SVYZaQ8jw3l3Vg3Sc1juVtjkc9fU=;
        b=MPbrf/FG6V1L46/KaRthz/c90y+9wZr8CoQ+uKtxDuFwi/5Wyrr1MUkgICrANrN5WI
         cNYL7/UwLzvAWr7EOPxaVrElk8tBHzc1RdFjVZaMu3P3yo7BDlG383DTD9wysC9XVJsQ
         GGA3CcX8oxuYF2Fia533gasLXR274SZLXIUTc7W1z/JFRk/dD9c6fyoT/LGO5qUEC/Na
         dtD0F72J1xsbWZLtNUkcnmMaSoYx+T9C5oyQXXM+YDvPoi4PcjMWHtXdjaqRqPd+eBx7
         Twp4uXlv5TTnnnntSug8yoPsWyeuUl86DrTIVYA2FuGi+yygAGO4RSpFsDd8MloLVJ1p
         lPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758870844; x=1759475644;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTIC/0L6sFxkiu2SVYZaQ8jw3l3Vg3Sc1juVtjkc9fU=;
        b=NyLoprAEzPgqW904ujNQBqPX8iN5jz9q4DjirYLMNJTH1ZGCT+yoPBmk3U2nOMS9vs
         p+toMpvVoxnd4BG/nQwyDM9UKTZW3cjhsm0TmmqggdNKyvCxv/kY7BLLRr6YVg5e6lUy
         +9j+md3VZWuAD4QjjvDGVSS+Uv+k2Gr5tIUBh0RS+QDzbAM+2VExAc+h333VSsWkK80j
         csjwpy+ys2tU+4trUnL1kQbB1NH2eMArj0LStGl5aeS9MYfaaO8iRHBuMw6ut/KACEVt
         8mt2BJhb2khDdZ29TVf1eWb+kK3GFyhpXn86nwrKngxR+YYPa8Bi/0yI7BP8Q4UC716B
         uUug==
X-Forwarded-Encrypted: i=1; AJvYcCV5G1Ca+N/Zm8OHRXg7PPZZ30XK9/akgpgM6uy6fb1/bx1OW2QCPzDGJIibZrBVx028BS5Th5hcpBc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxd6Ie1Y3C/BU6Nbzur9mEq6ScFqWI/E/m4le+vZQrZY9HLavMB
	CbCWETWs/KubVLmxO3RWmJWwayMBTR3VU0/b+dEguT0XJhQoeUiejhQ8dbiPOaDtmw==
X-Gm-Gg: ASbGncugE+un3bhOMe/PptmTwZSn0bPdO5KgqMZvqZ+zqEb3yc+BRWTlT9P5fdvQcdM
	wB8XQtAx5FOKuW0mb9+50HKEYd508G0qsGYrdG6zzcwH3Ix7AEIUgS/wJ5QOE6ffjCOIKPjNX5Y
	SOorljzXCMQCAauajzE/A/bsu1ddfvKxwRsfAhHmp7FLaOu7/e7RB1LxNPHZmUdpGoDc25u27mN
	XOf/a6ZNci4ZT2KVJJrgqZi3enoiv3dpt4Pce9Ul1iW4s2SGkjRbbjhqm2/jqMuTbeEs4P1XAx+
	3IBgpHnP82yLqoOhjkjJlEvtRx+Sn3on4s/QcD61T6D/oFdA2hnzrEL35p4zd47HO4qmEssvbWt
	ApqX589Vq22/UNJMm81/052g9jhUTX2ygQrftaT3VeWrGIEk01At433GEu0GPuM6bG3IyP9lfrr
	wHQ+Mbovk=
X-Google-Smtp-Source: AGHT+IFKaWfIsiQNl3CO572ZITMaToH7dz9HK9VGaqt5gx6iE2J6JafJ/4XgVNBPo9efzdLBrog32Q==
X-Received: by 2002:a17:907:7fa7:b0:afe:159:14b1 with SMTP id a640c23a62f3a-b354a2b1cd5mr566185166b.9.1758870843691;
        Fri, 26 Sep 2025 00:14:03 -0700 (PDT)
Message-ID: <a5224376-f89d-4a2f-8a74-e5256352f754@suse.com>
Date: Fri, 26 Sep 2025 09:14:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/26] xen/domctl: wrap xsm_getdomaininfo() with
 CONFIG_MGMT_HYPERCALLS
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Andryuk, Jason" <Jason.Andryuk@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-19-Penny.Zheng@amd.com>
 <a8b93dcc-c003-49a6-8a78-5fb890cbaec0@suse.com>
 <DM4PR12MB8451BE98219C343F8F62482AE11FA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <66b43c3b-c74f-4c18-b91a-bd7b56a62eff@suse.com>
 <DM4PR12MB84518B65027B6A355ED4D246E11EA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <af57c032-541d-4956-85de-269066c50cd3@suse.com>
 <IA1PR12MB8467188458BA8FAF348AC538E11EA@IA1PR12MB8467.namprd12.prod.outlook.com>
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
In-Reply-To: <IA1PR12MB8467188458BA8FAF348AC538E11EA@IA1PR12MB8467.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.09.2025 08:57, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Friday, September 26, 2025 2:53 PM
>>
>> On 26.09.2025 06:41, Penny, Zheng wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Thursday, September 25, 2025 10:29 PM
>>>>
>>>> On 25.09.2025 11:41, Penny, Zheng wrote:
>>>>>> -----Original Message-----
>>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>>> Sent: Thursday, September 11, 2025 9:30 PM
>>>>>>
>>>>>> On 10.09.2025 09:38, Penny Zheng wrote:
>>>>>>> --- a/xen/include/xsm/xsm.h
>>>>>>> +++ b/xen/include/xsm/xsm.h
>>>>>>> @@ -55,8 +55,8 @@ struct xsm_ops {
>>>>>>>      void (*security_domaininfo)(struct domain *d,
>>>>>>>                                  struct xen_domctl_getdomaininfo *info);
>>>>>>>      int (*domain_create)(struct domain *d, uint32_t ssidref);
>>>>>>> -    int (*getdomaininfo)(struct domain *d);
>>>>>>>  #ifdef CONFIG_MGMT_HYPERCALLS
>>>>>>> +    int (*getdomaininfo)(struct domain *d);
>>>>>>>      int (*domctl_scheduler_op)(struct domain *d, int op);
>>>>>>>      int (*sysctl_scheduler_op)(int op);
>>>>>>>      int (*set_target)(struct domain *d, struct domain *e); @@
>>>>>>> -234,7
>>>>>>> +234,11 @@ static inline int xsm_domain_create(
>>>>>>>
>>>>>>>  static inline int xsm_getdomaininfo(xsm_default_t def, struct
>>>>>>> domain
>>>>>>> *d)  {
>>>>>>> +#ifdef CONFIG_MGMT_HYPERCALLS
>>>>>>>      return alternative_call(xsm_ops.getdomaininfo, d);
>>>>>>> +#else
>>>>>>> +    return -EOPNOTSUPP;
>>>>>>> +#endif
>>>>>>>  }
>>>>>>
>>>>>> This is in use by a Xenstore sysctl and a Xenstore domctl. The
>>>>>> sysctl is hence already broken with the earlier series. Now the
>>>>>> domctl is also being screwed up. I don't think MGMT_HYPERCALLS
>>>>>> really ought to extend to any operations available to other than the core
>> toolstack.
>>>>>> That's the Xenstore ones here, but also the ones used by qemu
>>>>>> (whether run in
>>>> Dom0 or a stubdom).
>>>>>
>>>>> Maybe not only limited to the core toolstack. In
>>>>> dom0less/hyperlaunched
>>>> scenarios, hypercalls are strictly limited. QEMU is also limited to
>>>> pvh machine type and with very restricted functionality(, only acting
>>>> as a few virtio-pci devices backend). @Andryuk, Jason @Stabellini,
>>>> Stefano Am I understanding correctly and thoroughly about our scenario here for
>> upstream?
>>>>> Tracking the codes, if Xenstore is created as a stub domain, it
>>>>> requires
>>>> getdomaininfo-domctl to acquire related info.  Sorry, I haven't found
>>>> how it was called in QEMU...
>>>>
>>>> It's not "it"; it's different ones. First and foremost I was thinking
>>>> of
>>>>  * XEN_DOMCTL_ioport_mapping
>>>>  * XEN_DOMCTL_memory_mapping
>>>>  * XEN_DOMCTL_bind_pt_irq
>>>>  * XEN_DOMCTL_unbind_pt_irq
>>>> but there may be others (albeit per the dummy xsm_domctl() this is
>>>> the full set). As a general criteria, anything using XSM_DM_PRIV
>>>> checking can in principle be called by qemu.
>>>>
>>>
>>> Understood.
>>> I assume that they are all for device passthrough. We are not accepting device
>> passthrough via core toolstack in dom0less/hyperlaunch-ed scenarios. Jason has
>> developed device passthrough through device tree to only accept "static
>> configured" passthrough in dom0less/hyperlaunch-ed scenario, while it is still
>> internal , it may be the only accept way to do device passthrough in
>> dom0less/hyperlaunch-ed scenario.
>>
>> Right, but no matter what your goals, the upstream contributions need to be self-
>> consistent. I.e. not (risk to) break other functionality. (Really the four domctl-s
>> mentioned above might better have been put elsewhere, e.g. as dm-ops. Moving
>> them may be an option here.)
> 
> Understood.
> I'll move them all to the dm-ops

Before you do so, please consider the consequences, though (I said "may" for a
reason). Also please allow others to chime in. (In this context I notice that
several REST maintainers weren't even Cc-ed here, and hence may not have seen
the earlier discussion.)

One thing seems pretty clear to me: This work likely isn't going to be suitable
for 4.21 anymore. Hence we're back to considering alternatives to address the
still pending build issue. (My take on it remains: Revert the tail of the
sysctl work.) Adding Oleksii to Cc as well.

Jan

