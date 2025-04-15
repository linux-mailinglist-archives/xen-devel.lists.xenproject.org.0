Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE4AA8A0CA
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 16:17:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954046.1348399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4h5w-0005AA-Tg; Tue, 15 Apr 2025 14:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954046.1348399; Tue, 15 Apr 2025 14:17:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4h5w-00057U-QJ; Tue, 15 Apr 2025 14:17:00 +0000
Received: by outflank-mailman (input) for mailman id 954046;
 Tue, 15 Apr 2025 14:16:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4h5v-00057O-PI
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 14:16:59 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ab8aff6-1a04-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 16:16:58 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39c1ef4ae3aso3466820f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 07:16:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf43cd17sm14442480f8f.78.2025.04.15.07.16.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 07:16:57 -0700 (PDT)
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
X-Inumbo-ID: 4ab8aff6-1a04-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744726618; x=1745331418; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LRtdgeRagpRv7px4EPnGp+fta7KHRAH3sy3fLzPUH1o=;
        b=au5HZADdBtIG0WgRNcN3aoFRaj5sMREXfuf+i/hD8mHq91AD5oD4l7RTV+Q7PiCQEw
         lUqXzfKAvCofPzWrbBD5pOr2jxX4YhVnrJo6JmzCjEw4mRIyT4RC0F5Xs2DzTRXfzSmv
         ayi2OJ2X0kJVN9fvW0cC7vUBjYZC/04Nkfa4kZxnHA8rntIedgnl2E7Go65RaWkdMtqw
         ta/U3wNxvz2hCpMEqdkv3BzG/pqTkAnj7wFFd/n+EziXiKaBJdgnFqH+m9OopY6Ml8+0
         a38lztAs35fDRX6HBVqySWuLF8e3VzxE6frkKYhBL6OpH/yRItlmXXgOLD/qnkKPhTb5
         C7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744726618; x=1745331418;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LRtdgeRagpRv7px4EPnGp+fta7KHRAH3sy3fLzPUH1o=;
        b=q+Y+3LGVxY6Zm778GvHqTVHGfzbLvncrStAZ5R502nowH/fnffVXyuledKZKk+TatQ
         DWWEVnAr4mnsoIbYPixX4mDKqNq2QcwsYHBd9NQhoAZD/SrADqS3SZ/U7B04ZK3yCwog
         tiUKGZxnMiQGoFMCthUD+NbpfmUyH8TFoXdEFEED8jIReRhM6To2ZolhK3q6d2IEt5Xh
         NOQKVwPMgmXjZ8XFMibhevhUZNBbEl9GfohBufZU6AyZebKIKqSE1axidKysFN3xDFHj
         RqTIOv5v9AJoZ/PMALWcbGwGGh/1gujbCX1M6hDQThT/0Qv991nZ96FmHziz8y1gVubo
         MLkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAMQ/y5bkbMLSCNNufFmuxR/rY/ZM4Ns/uZ9SksZJZBfhTKuzUbBbuX0csOcRNVwCsfus8HXOvN4E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwV+JEshuu+PXeVsywntJBXz2iUBw1qE10LHVN023yGqsBDZDUM
	g7AO3ZbS8H+yP7wIMw+JlDxmivc71hQJnH6nOT+lsGLHaAPcGH1Sq/lrltlpFQ==
X-Gm-Gg: ASbGncsMS1EEwl0ZAY88oe3GsP5AgXfqLdSKw/4r0b7jO8EPdqeWqy4z/bxWKGevfuf
	zGvc55pB3os0cwJOO1gDgztAYfPA+kW2fj4MGba5AhEb8xEO4uA5NxmFJaMXTMUn5+9fWV2G2fT
	T4qohd/dMN4FM7HzBGdWAnTfGYLzFi7VeWbQMV6BrsbNAxY+1g+Q7U6jcUNuWUWTpS48JQrkcrq
	WLlIm+ETGed64ELF8XDVMVh0kFj2VifaUC3NEOcgZiAPWJL/4qiPkDf0xfDwn0U+a8W52MJxQo+
	+qgJQyjIvwnNrsz1Xt6h6cmE5dsZCEdU8k3ZE6PSImyQ9w7rdaKqnObbSn79vJWaVSmVKZuB4vH
	f4ScH2JppwTjRv/gZYFT4v2jrc+YPL4ycJmun
X-Google-Smtp-Source: AGHT+IGNiLXXMxoogEGHExKNDMv3SltP1SjyDzTKtNREQ3BT6XWItmRAP+F48JLvSYhGPYxV/eR6Qg==
X-Received: by 2002:a05:6000:1847:b0:38d:dc03:a3d6 with SMTP id ffacd0b85a97d-39edc2fe0ffmr3272616f8f.4.1744726618000;
        Tue, 15 Apr 2025 07:16:58 -0700 (PDT)
Message-ID: <9f43c460-0564-4289-a60d-481fb342f7be@suse.com>
Date: Tue, 15 Apr 2025 16:16:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/16] x86/hyperlaunch: add domain id parsing to domain
 config
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-13-agarciav@amd.com>
 <6ce79cc0-1fec-4ad9-834e-680ef1f81549@suse.com>
 <D96KUGJTQO7F.39OKDX33SSKYH@amd.com>
 <1235d73d-ec62-4223-a92f-7a19d802c306@suse.com>
 <D9775TTK4FZG.3E5KDTZHDHVE@amd.com>
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
In-Reply-To: <D9775TTK4FZG.3E5KDTZHDHVE@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.04.2025 14:05, Alejandro Vallejo wrote:
> On Tue Apr 15, 2025 at 7:27 AM BST, Jan Beulich wrote:
>> On 14.04.2025 20:35, Alejandro Vallejo wrote:
>>> On Thu Apr 10, 2025 at 12:49 PM BST, Jan Beulich wrote:
>>>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>>>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>>>> @@ -158,12 +159,42 @@ int __init fdt_read_multiboot_module(const void *fdt, int node,
>>>>>  static int __init process_domain_node(
>>>>>      struct boot_info *bi, const void *fdt, int dom_node)
>>>>>  {
>>>>> -    int node;
>>>>> +    int node, property;
>>>>>      struct boot_domain *bd = &bi->domains[bi->nr_domains];
>>>>>      const char *name = fdt_get_name(fdt, dom_node, NULL) ?: "unknown";
>>>>>      int address_cells = fdt_address_cells(fdt, dom_node);
>>>>>      int size_cells = fdt_size_cells(fdt, dom_node);
>>>>>  
>>>>> +    fdt_for_each_property_offset(property, fdt, dom_node)
>>>>> +    {
>>>>> +        const struct fdt_property *prop;
>>>>> +        const char *prop_name;
>>>>> +        int name_len;
>>>>> +
>>>>> +        prop = fdt_get_property_by_offset(fdt, property, NULL);
>>>>> +        if ( !prop )
>>>>> +            continue; /* silently skip */
>>>>> +
>>>>> +        prop_name = fdt_get_string(fdt, fdt32_to_cpu(prop->nameoff), &name_len);
>>>>> +
>>>>> +        if ( strncmp(prop_name, "domid", name_len) == 0 )
>>>>> +        {
>>>>> +            uint32_t val = DOMID_INVALID;
>>>>> +            if ( fdt_prop_as_u32(prop, &val) != 0 )
>>>>> +            {
>>>>> +                printk("  failed processing domain id for domain %s\n", name);
>>>>> +                return -EINVAL;
>>>>> +            }
>>>>> +            if ( val >= DOMID_FIRST_RESERVED )
>>>>> +            {
>>>>> +                printk("  invalid domain id for domain %s\n", name);
>>>>> +                return -EINVAL;
>>>>> +            }
>>>>> +            bd->domid = (domid_t)val;
>>>>
>>>> And a conflict with other domains' IDs will not be complained about?
>>>
>>> Hmmm... sure, I can iterate the domlist and check.
>>
>> Well, just to clarify: The checking doesn't necessarily need to happen here
>> and now. It may also happen as domains are actually created. Yet then I
>> think a pointer there (in a code comment) would be helpful here.
> 
> That'd be fairly unsafe. In the case of parallel boot it'd be
> indeterminate which VMs end up running if they happen to have a domid
> clash. It's better to detect the error earlier and crash before any get
> to start up.

What's the unsafe aspect here? We'd crash either way; the domain(s) that
may be successfully launched wouldn't make it very far.

Yet irrespective - my request is _that_ collisions are checked for. I
don't mind much _where_ that checking lives.

>>>>> @@ -233,6 +264,12 @@ static int __init process_domain_node(
>>>>>          return -ENODATA;
>>>>>      }
>>>>>  
>>>>> +    if ( bd->domid == DOMID_INVALID )
>>>>> +        bd->domid = get_initial_domain_id();
>>>>> +    else if ( bd->domid != get_initial_domain_id() )
>>>>> +        printk(XENLOG_WARNING
>>>>> +               "WARN: Booting without initial domid not supported.\n");
>>>>
>>>> I'm not a native speaker, but (or perhaps because of that) "without" feels
>>>> wrong here.
>>>
>>> It's probably the compound effect of without and "not supported". The
>>> statement is correct, but it's arguably a bit obtuse.
>>>
>>> I'll replace it with "WARN: Unsupported boot with missing initial domid.".
>>
>> But that still doesn't fit the check, which compares the given ID (i.e.
>> there's nothing "missing" here) with the expected one. The "no ID given"
>> is handled by the plain if() that's first.
> 
> It's not that the domid is missing from the node, but that the domid in
> the node doesn't match the initial domid. Maybe s/domid/domain, then?
> 
>   "Warning: Unsupported boot with missing initial domain"

I must be missing something: When it's "don't match" why would the message
say "missing"?

Jan

