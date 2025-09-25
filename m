Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE45BA0000
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 16:29:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130611.1470102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1mxS-0005KP-5J; Thu, 25 Sep 2025 14:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130611.1470102; Thu, 25 Sep 2025 14:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1mxS-0005Ir-1j; Thu, 25 Sep 2025 14:28:30 +0000
Received: by outflank-mailman (input) for mailman id 1130611;
 Thu, 25 Sep 2025 14:28:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1mxQ-0005Ik-S8
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 14:28:28 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6a03707-9a1b-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 16:28:27 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-631845b51e2so1213362a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Sep 2025 07:28:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b35446f76a9sm176160866b.60.2025.09.25.07.28.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 07:28:26 -0700 (PDT)
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
X-Inumbo-ID: e6a03707-9a1b-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758810507; x=1759415307; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=POSxx/CzD6aDdQqQY9sJI3SYM4DNPaqNJIL9XBTXcmE=;
        b=cHtije0YqoJwS0CUj1uV0Y9dFU505k/8ecKSxMVWCp5Q2aU443b3eZ6/+CmHU4P441
         WWc/xayveszbmqXjtck5kQvDXkglgFGJ3hXbiHqL71USHLyrAuMIBXHprONVo9etfIPV
         UQvtc0agUmIxXsz4EEhqTwb92miKbsRy2vOIg6YkFQ6sWYHKP54VkdsvuU6lWL/glZVZ
         dbYmK2g6I8nw3Mv+AZfm+JhuQdI60OExRdLTpHUxP4+DdfXAl8XSiQqM+iP/XIRfqc4w
         V/vmwIMIAzyXR0MFIWWZbJ6ZAOCcd46ZqFfIXB2R4sK/z4DdlQMOv8oK7h8s+VuMlLND
         IA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758810507; x=1759415307;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=POSxx/CzD6aDdQqQY9sJI3SYM4DNPaqNJIL9XBTXcmE=;
        b=ju5xRh+K3YPNzkuymuz1Qp8BTAZzoDhFEOlWC2mO7Uzx6p+qjz0ZLcRY/zYqzOKQNW
         za5M42b/4MpW6B9xjzBihF1sawi+CzA6ZtaMkMbDutnqg690fkHdGSUxz2xEhc2I7CjT
         fptrJ7lfa5ZgvHwpyE8ExnKYdODUyw6220Hev+GSHioXkNZMVoIosYE0LCR0rU5I4XAG
         Sd0SFZ3co6qS/Ac5yiruGMA8thcaOXqm5s+rU2yRc2cZ26mzRX5NQ68OOebx4KImMY7r
         14r/59Tl0AL9bK9gPRrW8KBa9hdsvqcFG96TLjPHBXsmwjTUgok8ELC6v5R/qt9E25tX
         HpcA==
X-Forwarded-Encrypted: i=1; AJvYcCX5XbzkmpvKtARr/45ql0PwEg1cbgl6Hb/2MzaL5+GmxEX+w8hVhWqRGn6B7znHR2qvT8/xTDFVa4o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGimjrkdeComJ/NbmJlb1B11AzMFLnfRZIpXSKS7dVVSVaZM5A
	Sih5H8Q2W5W/QxCtB7pEILbiZZt/0nQblNjpW0p9JT0XCsahwGOZnepuh6YP0gartA==
X-Gm-Gg: ASbGncvECz08eWsdtSKycGiFsGv8v/GelppTlgGVyixzTX+dc77N2oJGomneR1ZMqCD
	D5aCcnZMyKNafX9SofrxM6Uzzr2fz4ejeXKIKSP41PhcbeBkfOqXiHHOABoWKVw6OKJbkgLOa5v
	aHaqi0ph6EGtHF1yPlGhKP0igDmkmhsFfr0TEvQp3aL1IDl6QWYrlqZra5DJKPg4PBia3poybNU
	UT2U2y4xqIxOfQemzPUkasbiliAJTmAt3XKWj3RJIEu+K/j4fCU0PVlql71znzjsNZcm4/EVtA8
	eTb1b+tvFueHeJlMwjbLWcDLCc219NEom2GkHpidhyMO9/z5D25PSzkj0nMHwvQM1h6B9D4g1OS
	1Tu63WfkJ3kMxZdW3gV3haQUdBVfZWrfBScYNcsjfaALhWbU01DLudMW+Arw7JhhE6Zo43hzvQg
	vQbFMTmWE=
X-Google-Smtp-Source: AGHT+IFSddq+yuJQaYFPWt7nYRUWeLSXrotuLshcfLfixA6lP2Hg4AE780jEMo+FeSm7LJmvaRKmlA==
X-Received: by 2002:a17:906:5a4d:b0:b0e:8cd4:e2d3 with SMTP id a640c23a62f3a-b3503555d83mr279615866b.19.1758810506697;
        Thu, 25 Sep 2025 07:28:26 -0700 (PDT)
Message-ID: <66b43c3b-c74f-4c18-b91a-bd7b56a62eff@suse.com>
Date: Thu, 25 Sep 2025 16:28:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/26] xen/domctl: wrap xsm_getdomaininfo() with
 CONFIG_MGMT_HYPERCALLS
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Andryuk, Jason" <Jason.Andryuk@amd.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-19-Penny.Zheng@amd.com>
 <a8b93dcc-c003-49a6-8a78-5fb890cbaec0@suse.com>
 <DM4PR12MB8451BE98219C343F8F62482AE11FA@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451BE98219C343F8F62482AE11FA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.09.2025 11:41, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, September 11, 2025 9:30 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Daniel P. Smith
>> <dpsmith@apertussolutions.com>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v2 18/26] xen/domctl: wrap xsm_getdomaininfo() with
>> CONFIG_MGMT_HYPERCALLS
>>
>> On 10.09.2025 09:38, Penny Zheng wrote:
>>> --- a/xen/include/xsm/xsm.h
>>> +++ b/xen/include/xsm/xsm.h
>>> @@ -55,8 +55,8 @@ struct xsm_ops {
>>>      void (*security_domaininfo)(struct domain *d,
>>>                                  struct xen_domctl_getdomaininfo *info);
>>>      int (*domain_create)(struct domain *d, uint32_t ssidref);
>>> -    int (*getdomaininfo)(struct domain *d);
>>>  #ifdef CONFIG_MGMT_HYPERCALLS
>>> +    int (*getdomaininfo)(struct domain *d);
>>>      int (*domctl_scheduler_op)(struct domain *d, int op);
>>>      int (*sysctl_scheduler_op)(int op);
>>>      int (*set_target)(struct domain *d, struct domain *e); @@ -234,7
>>> +234,11 @@ static inline int xsm_domain_create(
>>>
>>>  static inline int xsm_getdomaininfo(xsm_default_t def, struct domain
>>> *d)  {
>>> +#ifdef CONFIG_MGMT_HYPERCALLS
>>>      return alternative_call(xsm_ops.getdomaininfo, d);
>>> +#else
>>> +    return -EOPNOTSUPP;
>>> +#endif
>>>  }
>>
>> This is in use by a Xenstore sysctl and a Xenstore domctl. The sysctl is hence
>> already broken with the earlier series. Now the domctl is also being screwed up. I
>> don't think MGMT_HYPERCALLS really ought to extend to any operations available
>> to other than the core toolstack. That's the Xenstore ones here, but also the ones
>> used by qemu (whether run in Dom0 or a stubdom).
> 
> Maybe not only limited to the core toolstack. In dom0less/hyperlaunched scenarios, hypercalls are strictly limited. QEMU is also limited to pvh machine type and with very restricted functionality(, only acting as a few virtio-pci devices backend). @Andryuk, Jason @Stabellini, Stefano Am I understanding correctly and thoroughly about our scenario here for upstream?
> Tracking the codes, if Xenstore is created as a stub domain, it requires getdomaininfo-domctl to acquire related info.  Sorry, I haven't found how it was called in QEMU...

It's not "it"; it's different ones. First and foremost I was thinking of
 * XEN_DOMCTL_ioport_mapping
 * XEN_DOMCTL_memory_mapping
 * XEN_DOMCTL_bind_pt_irq
 * XEN_DOMCTL_unbind_pt_irq
but there may be others (albeit per the dummy xsm_domctl() this is the full
set). As a general criteria, anything using XSM_DM_PRIV checking can in
principle be called by qemu.

Jan

