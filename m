Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65052810ACE
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 08:03:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653730.1020218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDJGv-0005F2-Hh; Wed, 13 Dec 2023 07:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653730.1020218; Wed, 13 Dec 2023 07:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDJGv-0005DO-Er; Wed, 13 Dec 2023 07:03:09 +0000
Received: by outflank-mailman (input) for mailman id 653730;
 Wed, 13 Dec 2023 07:03:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bXc=HY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDJGu-0005DG-Dr
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 07:03:08 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aad1d23f-9985-11ee-98e9-6d05b1d4d9a1;
 Wed, 13 Dec 2023 08:03:07 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3363ebb277bso97414f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 23:03:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n6-20020a5d6606000000b00332ff137c29sm12537187wru.79.2023.12.12.23.03.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Dec 2023 23:03:06 -0800 (PST)
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
X-Inumbo-ID: aad1d23f-9985-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702450986; x=1703055786; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Gamhmm4WB1pdkOpIrL4JFJZCO8vgk5i08dxaSStvSg=;
        b=Gu7V1F2ZB6w76FMHZXZ/3xkENm99y9nxF8vQHlMwFkGhCy24wbtWV9321DZbM6Lwgr
         4uvTY7DMG/ZJjGKKMuUHNxHxRjkOjtWsd2ttqlHnaSWt0mdGnbDTQuvHvJUa1FRKnjZI
         CmmccHgblW4vIC+T1H1oInxuGyG0iy9am3H7BN4rRAPcH9qtIdXIeaAzqsLykXL1+IrO
         oobPeWWJ2YvziLVQR150k4Za/qcwS2pZxSmbXq9bjmlZAkMZ9O7iYUUBhcNw06yOKalx
         a3Dyg28Po1dCxkIVaXQbsMzziUqiwiuPE83EqSmlTVNigNrm31Jcf62BrOPtMfBEeXe+
         /+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702450986; x=1703055786;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Gamhmm4WB1pdkOpIrL4JFJZCO8vgk5i08dxaSStvSg=;
        b=YetDq5uaG6URi+crWANCXb9fq4VUAFxPRRPX314FpOlXGh49nELDeA3Zx+xAdFquoE
         RHxBr6C0ZPlYc1U0/qGFbRGQqEQDNSv/5hLrIJBFlPNEKlADBxqLg4xe0B/u5rlHyZS7
         qSP8LmnBM9OPpTlgYqcQT9UtLEwIVt1u+ouwzIqRXg/U91sn/CxakHr08hPOdfy0q1Ej
         ZoNQuNI7xZtjO4iSY/ovetM9mNPz6G5ktn39qNLvExwoGh8Rkbd/pbVscBbXmKFE6cRA
         tUjhFCieR5Ir1CVD5IrcfeUqkSzRmG40obBqaqGpMPFI+x4iX+kOTpxHMjyLMiFePo3s
         QuRQ==
X-Gm-Message-State: AOJu0YwuHTVWAYrQUk0dOWA5Z1wTm8la1ekSgwQCIt5ZWN776uDAXPzR
	VzcqupLzbHKQJXTzVut3mQKg
X-Google-Smtp-Source: AGHT+IHm94ysyCN9oDiUvHGizTCUs26FyitVU7nYmhb5dbzo6IZRigx64whFPbAsg4iIGvZJFud0Ag==
X-Received: by 2002:adf:db0f:0:b0:333:3eaa:f67a with SMTP id s15-20020adfdb0f000000b003333eaaf67amr3645533wri.75.1702450986705;
        Tue, 12 Dec 2023 23:03:06 -0800 (PST)
Message-ID: <917ef38b-5aec-4c6a-803c-c0b2dcc74454@suse.com>
Date: Wed, 13 Dec 2023 08:03:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v3 2/3] x86/pvh: Add (un)map_pirq and setup_gsi
 for PVH dom0
Content-Language: en-US
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "Daniel P . Smith" <dpsmith@apertussolutions.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>, "Huang, Honglei1"
 <Honglei1.Huang@amd.com>, "Zhang, Julia" <Julia.Zhang@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20231210164009.1551147-1-Jiqian.Chen@amd.com>
 <20231210164009.1551147-3-Jiqian.Chen@amd.com> <ZXcrX44ceUjzjtDh@macbook>
 <BL1PR12MB5849B1BDCBECD73353413869E78EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <704cc051-7362-4691-a120-4effaf8dd1fc@suse.com>
 <BL1PR12MB584993E317AF28E675814FC6E78DA@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB584993E317AF28E675814FC6E78DA@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.12.2023 03:47, Chen, Jiqian wrote:
> On 2023/12/12 17:30, Jan Beulich wrote:
>> On 12.12.2023 07:49, Chen, Jiqian wrote:
>>> On 2023/12/11 23:31, Roger Pau Monné wrote:
>>>> On Mon, Dec 11, 2023 at 12:40:08AM +0800, Jiqian Chen wrote:
>>>>> --- a/xen/arch/x86/hvm/hypercall.c
>>>>> +++ b/xen/arch/x86/hvm/hypercall.c
>>>>> @@ -72,8 +72,11 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>>  
>>>>>      switch ( cmd )
>>>>>      {
>>>>> +    case PHYSDEVOP_setup_gsi:
>>>>
>>>> I think given the new approach on the Linux side patches, where
>>>> pciback will configure the interrupt, there's no need to expose
>>>> setup_gsi anymore?
>>> The latest patch(the second patch of v3 on kernel side) does setup_gsi and map_pirq for passthrough device in pciback, so we need this and below.
>>>
>>>>
>>>>>      case PHYSDEVOP_map_pirq:
>>>>>      case PHYSDEVOP_unmap_pirq:
>>>>> +        if ( is_hardware_domain(currd) )
>>>>> +            break;
>>>>
>>>> Also Jan already pointed this out in v2: this hypercall needs to be
>>>> limited so a PVH dom0 cannot execute it against itself.  IOW: refuse
>>>> the hypercall if DOMID_SELF or the passed domid matches the current
>>>> domain domid.
>>> Yes, I remember Jan's suggestion, but since the latest patch(the second patch of v3 on kernel side) has change the implementation, it does setup_gsi and map_pirq for dom0 itself, so I didn't add the DOMID_SELF check.
>>
>> And why exactly would it do specifically the map_pirq? (Even the setup_gsi
>> looks questionable to me, but there might be reasons there.)
> Map_pirq is to solve the check failure problem. (pci_add_dm_done-> xc_domain_irq_permission-> XEN_DOMCTL_irq_permission-> pirq_access_permitted->domain_pirq_to_irq->return irq is 0)
> Setup_gsi is because the gsi is never be unmasked, so the gsi is never be registered( vioapic_hwdom_map_gsi-> mp_register_gsi is never be called).

And it was previously made pretty clear by Roger, I think, that doing a "map"
just for the purpose of granting permission is, well, at best a temporary
workaround in the early development phase. If there's presently no hypercall
to _only_ grant permission to IRQ, we need to add one. In fact "map" would
likely better not have done two things at a time from the very beginning ...

Jan

