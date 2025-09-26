Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0BDBA2944
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 08:54:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131094.1470311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v22Ki-0000QG-5V; Fri, 26 Sep 2025 06:53:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131094.1470311; Fri, 26 Sep 2025 06:53:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v22Ki-0000Nt-22; Fri, 26 Sep 2025 06:53:32 +0000
Received: by outflank-mailman (input) for mailman id 1131094;
 Fri, 26 Sep 2025 06:53:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v22Kg-0000Nn-Lp
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 06:53:30 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8234ea77-9aa5-11f0-9d14-b5c5bf9af7f9;
 Fri, 26 Sep 2025 08:53:29 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b3164978f11so326408266b.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Sep 2025 23:53:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3545899fc9sm306151766b.91.2025.09.25.23.53.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 23:53:28 -0700 (PDT)
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
X-Inumbo-ID: 8234ea77-9aa5-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758869609; x=1759474409; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pOJA2bSz0c3Nk1Psq18q/DfKHEnHmwSaoMrIRG8ZQTA=;
        b=XWQwzU6sJdq+GFo6yY3OXGOc4YKYJluMgBw6VXDLY7qnIH9cv/6kPmlo7LgbYFkoE0
         5ShOp3J0kWigw0RWcTPNGdUwT8DRHob7UH232gNuh7OzjVJ8iLImkKN2V+S/sEtcQdv1
         QsCcD/gXUpwlChjvp20sSmp/Hy20dZ77greD6Lu4C0hQ8x4tT8yMvc+DL00v6BumavDq
         mRO4TRsFLKAHYNSOPsG56Lo1KwQLr+7ExSfzS7REzgjNkVXapa2s7iKrlu55xjmF8Ref
         hdB6Dx+vfRM7F41pIGrky5ILsUpHn+ctXl7LPe/XWodnpOKW7nhC0syyy0gtuiSaDEsG
         o5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758869609; x=1759474409;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOJA2bSz0c3Nk1Psq18q/DfKHEnHmwSaoMrIRG8ZQTA=;
        b=p66wZn8hEi88WzlaYknzc4UtUCBjlwME0SmXVs6aFfDATw2C0Wk1YfRSogIesnS5Ls
         6Q5e8+GX4iq0edMYnRwpCBR2IXXElYkmkgN5QtGv/4M25k39zhl6MNbbwuXCXz47kKPo
         fcw8CuCI2v25fG/yKEcj+nM/4EI7qyEKbqhxORDqN1xVdp00O/Jnj5CNRI8xm38XBXRH
         4PMAbqVD5Ywh1KODdQfzhZmof0B1cxk2ftjbMuj8S/XpXfvRpBMTXFhGWrdFkVxLzeL2
         dx19q8LUD97ewPaQJjiEU6AL6Pt8wFJWhZlOsdhAKWhfz6z0WVTTY2F4gtEkCwD7+ENJ
         +ygQ==
X-Forwarded-Encrypted: i=1; AJvYcCXseoomQ9FnZuOhLjVO5pQtmPkfEc7GoUE6QSqkysKXwYfN0NjPct1BX7qPax8mEfReTqvxjuUzL5A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz969qm3J7Je20L7vJ69Vs6ObkPrWRpEyUeuifLxXiHQRwht+9F
	eCZFftM813KU+lPkZgNaenB1V90dd9eEfO4dkh/6/MQoMX/OL1Hpndrvs/Jzjg4xVA==
X-Gm-Gg: ASbGncv3YPNXy588x6Sh7rtMRPtcF0vu/Xw9vz6m4DqJRHYvlwVkp4ZVk3RHBuaT8WE
	r8P+Bm9lHY4YFbcsJcsejq1SzN25/D6WmLD9AEtpRCqBhbQOhd869L5QrtYSa3Lnm4BmU7B5GfM
	G/p1TZXNRWf8So0ITyLzjENCHHGYn+QFKaXu8r3zk8d9F2ftxQ18Aq+uR4HT/snN/6LnJxTDLrP
	dTG2mOPQYzN4IRP8C19fcvSi62r2qyZdalWcNUzLHXctIPm1NvXb6kuW5z6k5adaS5/y08V5oja
	UUnmzBrjuweJ2Jv4BVRtTxSRILd9ZPeHYAE3NaWE8UPOALeVOjYl2u2M+i9BZdciqv91ae0RXTZ
	uDe3+tJ2i7JJh73f0aH/BW6Sw06Rp4cCCc/Ax5l6QAOx4fOjmmbqdBWyapg5Z7Qz9eFzmhSzAsb
	vWj+Y/2wCGM1KhVbMwIg==
X-Google-Smtp-Source: AGHT+IEpe2eeEYthqrXrv+qkhH313rrXvNKrKGULeFXh/zx6k6qWWwasHjRZI5WTyLP1oWcDK9QEhQ==
X-Received: by 2002:a17:907:6092:b0:afe:ea46:e808 with SMTP id a640c23a62f3a-b34baf43ad8mr624040966b.47.1758869608819;
        Thu, 25 Sep 2025 23:53:28 -0700 (PDT)
Message-ID: <af57c032-541d-4956-85de-269066c50cd3@suse.com>
Date: Fri, 26 Sep 2025 08:53:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/26] xen/domctl: wrap xsm_getdomaininfo() with
 CONFIG_MGMT_HYPERCALLS
To: "Penny, Zheng" <penny.zheng@amd.com>
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
In-Reply-To: <DM4PR12MB84518B65027B6A355ED4D246E11EA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.09.2025 06:41, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, September 25, 2025 10:29 PM
>>
>> On 25.09.2025 11:41, Penny, Zheng wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Thursday, September 11, 2025 9:30 PM
>>>>
>>>> On 10.09.2025 09:38, Penny Zheng wrote:
>>>>> --- a/xen/include/xsm/xsm.h
>>>>> +++ b/xen/include/xsm/xsm.h
>>>>> @@ -55,8 +55,8 @@ struct xsm_ops {
>>>>>      void (*security_domaininfo)(struct domain *d,
>>>>>                                  struct xen_domctl_getdomaininfo *info);
>>>>>      int (*domain_create)(struct domain *d, uint32_t ssidref);
>>>>> -    int (*getdomaininfo)(struct domain *d);
>>>>>  #ifdef CONFIG_MGMT_HYPERCALLS
>>>>> +    int (*getdomaininfo)(struct domain *d);
>>>>>      int (*domctl_scheduler_op)(struct domain *d, int op);
>>>>>      int (*sysctl_scheduler_op)(int op);
>>>>>      int (*set_target)(struct domain *d, struct domain *e); @@
>>>>> -234,7
>>>>> +234,11 @@ static inline int xsm_domain_create(
>>>>>
>>>>>  static inline int xsm_getdomaininfo(xsm_default_t def, struct
>>>>> domain
>>>>> *d)  {
>>>>> +#ifdef CONFIG_MGMT_HYPERCALLS
>>>>>      return alternative_call(xsm_ops.getdomaininfo, d);
>>>>> +#else
>>>>> +    return -EOPNOTSUPP;
>>>>> +#endif
>>>>>  }
>>>>
>>>> This is in use by a Xenstore sysctl and a Xenstore domctl. The sysctl
>>>> is hence already broken with the earlier series. Now the domctl is
>>>> also being screwed up. I don't think MGMT_HYPERCALLS really ought to
>>>> extend to any operations available to other than the core toolstack.
>>>> That's the Xenstore ones here, but also the ones used by qemu (whether run in
>> Dom0 or a stubdom).
>>>
>>> Maybe not only limited to the core toolstack. In dom0less/hyperlaunched
>> scenarios, hypercalls are strictly limited. QEMU is also limited to pvh machine type
>> and with very restricted functionality(, only acting as a few virtio-pci devices
>> backend). @Andryuk, Jason @Stabellini, Stefano Am I understanding correctly and
>> thoroughly about our scenario here for upstream?
>>> Tracking the codes, if Xenstore is created as a stub domain, it requires
>> getdomaininfo-domctl to acquire related info.  Sorry, I haven't found how it was
>> called in QEMU...
>>
>> It's not "it"; it's different ones. First and foremost I was thinking of
>>  * XEN_DOMCTL_ioport_mapping
>>  * XEN_DOMCTL_memory_mapping
>>  * XEN_DOMCTL_bind_pt_irq
>>  * XEN_DOMCTL_unbind_pt_irq
>> but there may be others (albeit per the dummy xsm_domctl() this is the full set). As
>> a general criteria, anything using XSM_DM_PRIV checking can in principle be
>> called by qemu.
>>
> 
> Understood.
> I assume that they are all for device passthrough. We are not accepting device passthrough via core toolstack in dom0less/hyperlaunch-ed scenarios. Jason has developed device passthrough through device tree to only accept "static configured" passthrough in dom0less/hyperlaunch-ed scenario, while it is still internal , it may be the only accept way to do device passthrough in dom0less/hyperlaunch-ed scenario.

Right, but no matter what your goals, the upstream contributions need to be self-
consistent. I.e. not (risk to) break other functionality. (Really the four domctl-s
mentioned above might better have been put elsewhere, e.g. as dm-ops. Moving them
may be an option here.)

Jan

