Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F60C90C534
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 11:14:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742892.1149770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJUui-0004yC-CN; Tue, 18 Jun 2024 09:14:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742892.1149770; Tue, 18 Jun 2024 09:14:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJUui-0004wK-9V; Tue, 18 Jun 2024 09:14:04 +0000
Received: by outflank-mailman (input) for mailman id 742892;
 Tue, 18 Jun 2024 09:14:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MUlf=NU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJUuh-0004wE-60
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 09:14:03 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19c59955-2d53-11ef-90a3-e314d9c70b13;
 Tue, 18 Jun 2024 11:14:01 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-57c83100bd6so6350650a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 02:14:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56ed357asm601906766b.125.2024.06.18.02.13.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 02:14:00 -0700 (PDT)
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
X-Inumbo-ID: 19c59955-2d53-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718702040; x=1719306840; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z8kss9qGBQgb51Jq9Iz0lX8khDkUj6+Ajw4D7ZRyHpM=;
        b=SXXsg+Z8r8BUZOQsGTdBQ8LkijGfmElLZtvxO4cX3akTuuKGLj8VHxuu4vgBRO4e2k
         KgVh9xptV/U7g7kUqwbgaT+lIl7KAk/sAt5FP6FPV9qs9BmtQPgXd969y2Vdub9H+uuN
         rvbqGNA90taAyhLHUU05De5mq4mVgNfnisUN7Hp6j3TNvZM2+Z62zzZ6rPYtoqkInzqC
         HaHcM7S56zrCQ/bkn/zrMZkt1r/Mc9+RJf1oaNO+A5TFTo0UFelV9SLeZ5AXqSgVz4cC
         Jk/yDt8aBvVqdS8icNF+0gt+uWFjedbfyYno2YECDy39365X4ientmM6zV8gmpsaAaOc
         VCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718702040; x=1719306840;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8kss9qGBQgb51Jq9Iz0lX8khDkUj6+Ajw4D7ZRyHpM=;
        b=vO+dwY/kKe/cGVgTisXjobNkQMP5jzTiziQbiKK0R6fIUsQkDUAc7wBkoQhWUwyjgB
         95zVOcyARxt+c19mSgsZVR8gFKNw/gKx3RDYu4opAIp2CXVagcCi90hD2MTWakRF71TR
         iBcJSbssPGWzEi6JJyn6pUODute9LusMp5g/9zWSDlYbd8yMxBXOfrcCWOh08rHKWFtI
         ZGrFheOyUJ85gEAs/rFVYZR8+Uw+uYhknRIu61YKkUFaQNM5NdJtd9xktRM4z0D/TIrD
         WPBh5OHKGObnBmXWifnguuPqetosR6+cWfaAsD0iOHirzLFar9LxzBcrC2PrkJynwhmz
         KSew==
X-Forwarded-Encrypted: i=1; AJvYcCXkTvBYf4bUcJZVvlRaWNSX5vo5Z1BV47nOczh7eb4+mNU32A7ep9KdcJifi2TFUNY1xQ47WcknGhsGw0nVWo+1lxZDJZ0b9ygkmCWhAN0=
X-Gm-Message-State: AOJu0Yzc26Do9rdr41K3im+eZJm3qzTvDK/Q06CBzWBaY6yCIzV3+esV
	FayupMunZ9YXndtnnNOv194ug2RXh6S4oNgNAYwpz1o7YfulZo0pxdllu5fZKA==
X-Google-Smtp-Source: AGHT+IF9koj9b1SfYi+gReJwPgiOMjOZFRPdDCJuI1FNSfDA1eonowDxUU2QlcuquR88GLJhT9H4oQ==
X-Received: by 2002:a17:906:37d9:b0:a68:bfd7:b0f3 with SMTP id a640c23a62f3a-a6f60d2975bmr777644966b.21.1718702040414;
        Tue, 18 Jun 2024 02:14:00 -0700 (PDT)
Message-ID: <ab99b766-7bec-4046-beb2-f77a2591a911@suse.com>
Date: Tue, 18 Jun 2024 11:13:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v10 4/5] tools: Add new function to get gsi from dev
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-5-Jiqian.Chen@amd.com>
 <49563a31-d50e-4015-88ee-e0dab9193cd1@suse.com>
 <BL1PR12MB584910D242D9D8B4BA8B15C1E7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB584910D242D9D8B4BA8B15C1E7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.06.2024 10:10, Chen, Jiqian wrote:
> On 2024/6/17 23:10, Jan Beulich wrote:
>> On 17.06.2024 11:00, Jiqian Chen wrote:
>>> --- a/tools/include/xen-sys/Linux/privcmd.h
>>> +++ b/tools/include/xen-sys/Linux/privcmd.h
>>> @@ -95,6 +95,11 @@ typedef struct privcmd_mmap_resource {
>>>  	__u64 addr;
>>>  } privcmd_mmap_resource_t;
>>>  
>>> +typedef struct privcmd_gsi_from_dev {
>>> +	__u32 sbdf;
>>
>> That's PCI-centric, without struct and IOCTL names reflecting this fact.
> So, change to privcmd_gsi_from_pcidev ?

That's what I'd suggest, yes. But remember that it's the kernel maintainers
who have the ultimate say here, as here you're only making a copy of what
the canonical header (in the kernel tree) is going to have.

>>> +	int gsi;
>>
>> Is "int" legitimate to use here? Doesn't this want to similarly be __u32?
> I want to set gsi to negative if there is no record of this translation.

There are surely more explicit ways to signal that case?

>>> --- a/tools/libs/light/libxl_pci.c
>>> +++ b/tools/libs/light/libxl_pci.c
>>> @@ -1406,6 +1406,12 @@ static bool pci_supp_legacy_irq(void)
>>>  #endif
>>>  }
>>>  
>>> +#define PCI_DEVID(bus, devfn)\
>>> +            ((((uint16_t)(bus)) << 8) | ((devfn) & 0xff))
>>> +
>>> +#define PCI_SBDF(seg, bus, devfn) \
>>> +            ((((uint32_t)(seg)) << 16) | (PCI_DEVID(bus, devfn)))
>>
>> I'm not a maintainer of this file; if I were, I'd ask that for readability's
>> sake all excess parentheses be dropped from these.
> Isn't it a coding requirement to enclose each element in parentheses in the macro definition?
> It seems other files also do this. See tools/libs/light/libxl_internal.h

As said, I'm not a maintainer of this code. Yet while I'm aware that libxl
has its own CODING_STYLE, I can't spot anything towards excessive use of
parentheses there.

>>> @@ -1486,6 +1496,18 @@ static void pci_add_dm_done(libxl__egc *egc,
>>>          goto out_no_irq;
>>>      }
>>>      if ((fscanf(f, "%u", &irq) == 1) && irq) {
>>> +#ifdef CONFIG_X86
>>> +        sbdf = PCI_SBDF(pci->domain, pci->bus,
>>> +                        (PCI_DEVFN(pci->dev, pci->func)));
>>> +        gsi = xc_physdev_gsi_from_dev(ctx->xch, sbdf);
>>> +        /*
>>> +         * Old kernel version may not support this function,
>>
>> Just kernel?
> Yes, xc_physdev_gsi_from_dev depends on the function implemented on linux kernel side.

Okay, and when the kernel supports it but the underlying hypervisor doesn't
support what the kernel wants to use in order to fulfill the request, all
is fine? (See also below for what may be needed in the hypervisor, even if
this IOCTL would be satisfied by the kernel without needing to interact with
the hypervisor.)

>>> +         * so if fail, keep using irq; if success, use gsi
>>> +         */
>>> +        if (gsi > 0) {
>>> +            irq = gsi;
>>
>> I'm still puzzled by this, when by now I think we've sufficiently clarified
>> that IRQs and GSIs use two distinct numbering spaces.
>>
>> Also, as previously indicated, you call this for PV Dom0 as well. Aiui on
>> the assumption that it'll fail. What if we decide to make the functionality
>> available there, too (if only for informational purposes, or for
>> consistency)? Suddenly you're fallback logic wouldn't work anymore, and
>> you'd call ...
>>
>>> +        }
>>> +#endif
>>>          r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
>>
>> ... the function with a GSI when a pIRQ is meant. Imo, as suggested before,
>> you strictly want to avoid the call on PV Dom0.
>>
>> Also for PVH Dom0: I don't think I've seen changes to the hypercall
>> handling, yet. How can that be when GSI and IRQ aren't the same, and hence
>> incoming GSI would need translating to IRQ somewhere? I can once again only
>> assume all your testing was done with IRQs whose numbers happened to match
>> their GSI numbers. (The difference, imo, would also need calling out in the
>> public header, where the respective interface struct(s) is/are defined.)
> I feel like you missed out on many of the previous discussions.
> Without my changes, the original codes use irq (read from file /sys/bus/pci/devices/<sbdf>/irq) to do xc_physdev_map_pirq,
> but xc_physdev_map_pirq require passing into gsi instead of irq, so we need to use gsi whether dom0 is PV or PVH, so for the original codes, they are wrong.
> Just because by chance, the irq value in the Linux kernel of pv dom0 is equal to the gsi value, so there was no problem with the original pv passthrough.
> But not when using PVH, so passthrough failed.
> With my changes, I got gsi through function xc_physdev_gsi_from_dev firstly, and to be compatible with old kernel versions(if the ioctl
> IOCTL_PRIVCMD_GSI_FROM_DEV is not implemented), I still need to use the irq number, so I need to check the result
> of gsi, if gsi > 0 means IOCTL_PRIVCMD_GSI_FROM_DEV is implemented I can use the right one gsi, otherwise keep using wrong one irq. 

I understand all of this, to a (I think) sufficient degree at least. Yet what
you're effectively proposing (without explicitly saying so) is that e.g.
struct physdev_map_pirq's pirq field suddenly may no longer hold a pIRQ
number, but (when the caller is PVH) a GSI. This may be a necessary adjustment
to make (simply because the caller may have no way to express things in pIRQ
terms), but then suitable adjustments to the handling of PHYSDEVOP_map_pirq
would be necessary. In fact that field is presently marked as "IN or OUT";
when re-purposed to take a GSI on input, it may end up being necessary to pass
back the pIRQ (in the subject domain's numbering space). Or alternatively it
may be necessary to add yet another sub-function so the GSI can be translated
to the corresponding pIRQ for the domain that's going to use the IRQ, for that
then to be passed into PHYSDEVOP_map_pirq.

> And regarding to the implementation of ioctl IOCTL_PRIVCMD_GSI_FROM_DEV, it doesn't have any xen heypercall handling changes, all of its processing logic is on the kernel side.
> I know, so you might want to say, "Then you shouldn't put this in xen's code." But this concern was discussed in previous versions, and since the pci maintainer disallowed to add
> gsi sysfs on linux kernel side, I had to do so.

Right, but this is a separate aspect (which we simply need to live with on
the Xen side).

Jan

