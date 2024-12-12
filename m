Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD679EE50D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 12:31:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855814.1268618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLhPf-0007Zc-Ay; Thu, 12 Dec 2024 11:31:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855814.1268618; Thu, 12 Dec 2024 11:31:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLhPf-0007X8-8H; Thu, 12 Dec 2024 11:31:23 +0000
Received: by outflank-mailman (input) for mailman id 855814;
 Thu, 12 Dec 2024 11:31:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLhPe-0007X2-QW
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 11:31:22 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 994550c4-b87c-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 12:31:16 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d414b8af7bso956892a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 03:31:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa653a95e90sm798695766b.173.2024.12.12.03.31.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 03:31:20 -0800 (PST)
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
X-Inumbo-ID: 994550c4-b87c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734003080; x=1734607880; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7amF25cdvQu/McBE34fVxW5BL8pahhXcLQJF3ts/xS4=;
        b=cEJZ5+X8gb3vudBqVa+90nw/UYPcSe6QsG/YG6hPEb7e5xhgeaEh6TE0MUo6RALSpV
         CY2a74vS9znEvCa0PllTNyVIH0iJKVTa7eAHZStJwNRzrQJSkbkxSkd2s9y4DvP6/P45
         2uTXeOsNczhG/acOqJqkrz35i+IpBRLrVqjSt9nYEht9cYIpBpsGVMUphRcywBeQizjR
         956b98wu13RV17e3qVyX2oxP6gt2vcE5H2jpoa5zB0KoScra7sjWKYW51OIrgK3i962N
         YzffrFRIXtp5+V3R0cPWmPmFj7Sv75O3vDIV73d0iV0Lvm6SYuRwq/XhNHs0MLnQ9YH/
         pheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734003080; x=1734607880;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7amF25cdvQu/McBE34fVxW5BL8pahhXcLQJF3ts/xS4=;
        b=d9I0coalDqvqtvIZvbeJCGHna7m/8cSd7VzfojWzlfKu2iXBcUts9De4vXhozb3HQ8
         Gl6fae/CH7MD7Bhossjw6/cWFTDgW1dbFKaJBiNE0cH0wLvcvrenxJ9Ht0YG7Ve8nfbl
         jRpHbARf3FriY8Cl4gP5GRKkNeMO8T8ZGT+NTUraZ5adkTtm6GD9S8Kln+KPri+v+SAF
         Vr0UBH+sRLxAtm0pgrvdalTqc3g4ulq0yAsSjt8Mlm5SRLafoW9iAKp6AtHdTCUilnmr
         O0enuBvE27n27HCQ0h8vCMI3H7FJk5F2q7Y8s164Pi48ftVChzj9U2XZuDvqow24UYyY
         hc1g==
X-Forwarded-Encrypted: i=1; AJvYcCX+mHMgxLRQzkyb1iJpV6bnKE5mzbjoMtfbY/FkaRtXJQojVX5sxg8ITh6zWIP2auOMnkCgyleqIIg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4n9IWv0PRH2GQDEWa2BzQAEVBC+H0+G9EOz3CuXL6LY5o2k55
	2IyNEg3T0/+KHKsDXYw4LgvQ8R/a/9JwnLBLwS8vVcnHwuprxIwdppPSVBVQWg==
X-Gm-Gg: ASbGncvRI6moQTD+3xe4KZOwqKZ6vU0j+FXbFgEFpYeN+3yjuuuaQDXdznNfWftSuwE
	YjG/veGWYQK2ytgMxaJVDQWE8Vfro0JXBTdvVHwSlU1CI7SrxJY7goBN8EfpYVt9EmtvaagKptW
	IFuFZEsnAg8RHkimC7TGTiSVPoxIl7AS0IFKIye8iImNTpaxeEobWZPSfWDhNBFy2akHxvqEMFU
	LbNyLAl8P6v2o9m+qFbxNqfn04irJBsg/ST7KSZSboXGawTmU7RLIhHDtTu0ygpn++AgccxeePq
	EKdoVuKkXcwhXl295mjTtg5LDN99Ebr0/chDtbpWSQ==
X-Google-Smtp-Source: AGHT+IG97GlLKcTMGVsO557G17EWUlb8Gm7OrFZWZ8VS4UGIKYX3VjIFOAyWTMmeq7j1hLisqpRYtA==
X-Received: by 2002:a17:906:7307:b0:aa6:32f9:d1a7 with SMTP id a640c23a62f3a-aa6c1cf1b1fmr502292766b.38.1734003080415;
        Thu, 12 Dec 2024 03:31:20 -0800 (PST)
Message-ID: <9a1589bc-82d9-42b1-a200-7b6a61035eec@suse.com>
Date: Thu, 12 Dec 2024 12:31:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/15] x86/hyperlaunch: specify dom0 mode with device tree
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-13-dpsmith@apertussolutions.com>
 <294035fd-45c9-4c59-a5b7-bc1ebed90e47@suse.com>
 <029011a0-0b7c-48e2-a98a-845588bbc7bf@apertussolutions.com>
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
In-Reply-To: <029011a0-0b7c-48e2-a98a-845588bbc7bf@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2024 18:48, Daniel P. Smith wrote:
> On 12/2/24 07:06, Jan Beulich wrote:
>> On 23.11.2024 19:20, Daniel P. Smith wrote:
>>> --- a/xen/arch/x86/domain_builder/fdt.c
>>> +++ b/xen/arch/x86/domain_builder/fdt.c
>>> @@ -141,6 +141,25 @@ static int __init process_domain_node(
>>>               bd->domid = (domid_t)val;
>>>               printk("  domid: %d\n", bd->domid);
>>>           }
>>> +        if ( match_fdt_property(fdt, prop, "mode" ) )
>>> +        {
>>> +            if ( fdt_prop_as_u32(prop, &bd->mode) != 0 )
>>> +            {
>>> +                printk("  failed processing mode for domain %s\n",
>>> +                       name == NULL ? "unknown" : name);
>>> +                return -EINVAL;
>>> +            }
>>> +
>>> +            printk("  mode: ");
>>> +            if ( !(bd->mode & BUILD_MODE_PARAVIRT) ) {
>>> +                if ( bd->mode & BUILD_MODE_ENABLE_DM )
>>> +                    printk("HVM\n");
>>> +                else
>>> +                    printk("PVH\n");
>>> +            }
>>> +            else
>>> +                printk("PV\n");
>>
>> Oh, and: What about BUILD_MODE_ENABLE_DM also being set here?
> 
> Are you asking in the sense that the PV domain is being flag as a device 
> model domain? Maybe I am missing something, but I am not aware of 
> anything specific that must be set for a PV domain to operate as device 
> model domain. If flask is in play, then there is a secure label 
> requirement but that is separate of a mode that the domain must be 
> running in. Please enlighten me if I am over looking something.

Rephrasing my question: Is it legitimate for BUILD_MODE_PARAVIRT to be
accompanied with BUILD_MODE_ENABLE_DM. If it is, what is the difference
between BUILD_MODE_PARAVIRT|BUILD_MODE_ENABLE_DM and plain
BUILD_MODE_PARAVIRT? If there's none, perhaps better to reject the flag
(retaining possible use for some future purpose)?

Jan

