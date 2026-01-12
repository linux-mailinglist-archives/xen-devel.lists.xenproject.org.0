Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AA8D13D5B
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 16:56:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200652.1516515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfKHT-0007QS-Ea; Mon, 12 Jan 2026 15:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200652.1516515; Mon, 12 Jan 2026 15:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfKHT-0007Nv-Bj; Mon, 12 Jan 2026 15:56:35 +0000
Received: by outflank-mailman (input) for mailman id 1200652;
 Mon, 12 Jan 2026 15:56:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfKHS-0007Np-PG
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 15:56:34 +0000
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [2a00:1450:4864:20::341])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4460b892-efcf-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 16:56:33 +0100 (CET)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-47d5e021a53so48413005e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 07:56:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f410c6csm373463475e9.1.2026.01.12.07.56.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 07:56:32 -0800 (PST)
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
X-Inumbo-ID: 4460b892-efcf-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768233393; x=1768838193; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ewxnBaxkEZmaU9gpOowpu+m6pnznGAAv/rdTc8xpueI=;
        b=eAdoYSMtUWveAnrM249JUkdFmoorKfT0qbM/EIhCHsFaQ+Zci5k+bcCs2SBizYw1KR
         MkULkRmMm5J+Sh1L2bGS8HNSeJZoz3TmwmYuTjD1UP9GNsv31Og2ehAT3sZC2Mxq4F3F
         njdoxG8Wni2i63MQIrksXrVD9Vp3DAKXMtPG5iq6AZd4lQsCABLrxTloSo3Base+x5oS
         WmVgqn2CCAdT/+i3fdHfLtFHja/UVGcJJ2ZkGy5masqEDvMW4d05dsS837oFmFPgBa4D
         2/IL19cgqGyG42+TzgAVqJHqSkqwuRpZdQFxRBnw/zejykohfvZZ7TIVIBf97yF6+UYG
         dTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768233393; x=1768838193;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewxnBaxkEZmaU9gpOowpu+m6pnznGAAv/rdTc8xpueI=;
        b=rlMkHG0H5I7Le5ooGpUYprTdQk6uwdzOWP2Q3OSzPNJxkn9lsdiMvYEbaYxBl5wPpZ
         0Ai53rrryXulYoos/pqmP+MI3e/g/cGs5cNc3tb8iGRjPvQQlkUsQtoDl9nOmrGs4YEZ
         lEgYiyGmktGumAfiXSdY1zLqcQgkWD7oK9tl6EjUeAu8B0/HOP9gfamMJgKyIpAiozOr
         9bp3rloXi05uNqKGvDuYIQ38LkU4nhFLUmKuU0q3TXoBgsWFOYueiO0dM4FQ6k3xRphk
         KKEeaGnvx190eauPA5+drHSGN8y/sy5SSCeJRHtBU4JewBmIyi05/fYA72bgECZQbiFH
         bvqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWVMQG/91m/enrByxp8JT9PlWfq2Kl7oKe+ntJ4Qm3DiVezUePkJ//wQcBN1wtzdjQp9yX4HyveJ4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywr3UT/4fVCYwGwyL56LvN62vLn8+Nq1CSi8vIBvHCBqAd0izNz
	9HtGWqm5SwRWTwoYWfegDfQjZPjWmrE519vFAPDnkIxAER6wJfq4Tem+C4yiALXa0g==
X-Gm-Gg: AY/fxX7lHmpqED98gj9AXXUujiY0B6Vto173UTPy1LCne8IYKZVBRjna8y5G+TugGyR
	NBvf8CvtxcNwK0qhjii8UUkp5eoDXnYyNsZ8/39f1b94VLUJMMu+6oGiVzNfLURcxEwRgR4mXyu
	18b1Il85gtKJ4mjuWpdghCABZD+uPL7XqPZBcGPewWVLKn5RsInTJyYIzKpb6xZZyIWaQfMFMRA
	aaJOg1iYJKQq7ZwbNeG1P5meLNAFGf5MdwLixY0KACKswTIA8qmIYbWGb7PNcxZtiHvjBXNA++F
	csmPkUwBeP8wMzsLiol7FSfodzXN1LPyWgnCqINaESwNbgsdXdvqw8jfLSZBbtbmR3AVJmE0A/A
	DLStHeCJVNomV61kum5r/F6Nyg1rKX+7Kke3bRTBt3CaNrvQzAP4V/c8V1I56ZEgemm/erGmo3x
	Ok9a1CaWN4xfoG5nRfw6GXt90jauItXRYEl8jaKQ627lWwM852nQenW/PF4cUsgaUzeOwM7j5Bq
	uw=
X-Google-Smtp-Source: AGHT+IHw4mmlempgE0Yw/AObsToSevvBL5AY5mh/Y8veom4AvJIVCtMY/ZI3qCnJhfYZtok8GR4gEw==
X-Received: by 2002:a05:600c:470c:b0:477:7a78:3016 with SMTP id 5b1f17b1804b1-47d84b0a5bemr201540245e9.8.1768233392826;
        Mon, 12 Jan 2026 07:56:32 -0800 (PST)
Message-ID: <7cbda859-4257-499e-86e0-a0d001fd49c9@suse.com>
Date: Mon, 12 Jan 2026 16:56:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1761998077.git.oleksii_moisieiev@epam.com>
 <b0a72660d58608c80e7408eb8df32ec369d4e45b.1761998077.git.oleksii_moisieiev@epam.com>
 <9598b2e2-7df8-40c5-82cb-c097121af763@suse.com>
 <5d8f55a6-7182-4e9d-a139-96fddb9450f8@epam.com>
 <98f5e8f0-070c-4be5-9baf-46278de8093d@suse.com>
 <99586f5c-d76b-4cbe-9fbd-c87e86bb236a@epam.com>
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
In-Reply-To: <99586f5c-d76b-4cbe-9fbd-c87e86bb236a@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.01.2026 16:54, Oleksii Moisieiev wrote:
> 
> 
> On 12/01/2026 17:40, Jan Beulich wrote:
>> On 12.01.2026 16:16, Oleksii Moisieiev wrote:
>>> On 06/11/2025 12:09, Jan Beulich wrote:
>>>> On 01.11.2025 12:56, Oleksii Moisieiev wrote:
>>>>> @@ -827,7 +828,32 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>>>>        case XEN_DOMCTL_test_assign_device:
>>>>>        case XEN_DOMCTL_deassign_device:
>>>>>        case XEN_DOMCTL_get_device_group:
>>>>> +        int ret1;
>>>>> +
>>>>> +        /*
>>>>> +         * Add chained handling of assigned DT devices to support
>>>>> +         * access-controller functionality through SCI framework, so
>>>>> +         * DT device assign request can be passed to FW for processing and
>>>>> +         * enabling VM access to requested device.
>>>>> +         * The access-controller DT device processing is chained before IOMMU
>>>>> +         * processing preserving return code and expected to be executed for
>>>>> +         * any DT device regardless if DT device is protected by IOMMU or
>>>>> +         * not (or IOMMU is disabled).
>>>>> +         */
>>>>> +        ret1 = sci_do_domctl(op, d, u_domctl);
>>>> Why would this not be the initializer of the new variable? (I also don't think
>>>> that we've decided to permit variable declarations at other than the top of
>>>> scopes or within e.g. a for() loop control construct.)
>>>>
>>> +
>>>>>            ret = iommu_do_domctl(op, d, u_domctl);
>>>>> +        if ( ret < 0 )
>>>>> +            return ret;
>>>> Why would you invoke both in all cases? If sci_do_domctl() handled the request,
>>>> there isn't any point in also invoking iommu_do_domctl(), is there? Or else is
>>>> there maybe some crucial aspect missing from the description (or not explicit
>>>> enough there for a non-SCI person like me)?
>>>>
>>>> Also this doesn't look to fit the description saying "The SCI access-controller
>>>> DT device processing is chained after IOMMU processing ..."
>>>>
>>> We call both because SCI and IOMMU cover different concerns and a DT
>>> device may need
>>> both: SCI for FW-mediated access control (power/clocks/reset) and IOMMU
>>> for DMA isolation.
>>> SCI returning success does not mean the IOMMU work is redundant.
>> Can the comment then please be updated to properly call out this dual
>> requirement?
> Yes, for sure.
>>> - sci_do_domctl() returns -ENXIO when it has nothing to do (non-DT, no
>>> mediator, mediator lacks assign hook).
>>> That is the “not handled by SCI” sentinel; in that case the code
>>> proceeds to IOMMU normally.
>>> -  When sci_do_domctl() succeeds (0), the device may still require IOMMU
>>> programming
>>> (e.g., DT device has an iommus property). Skipping iommu_do_domctl()
>>> would leave DMA isolation unprogrammed.
>>>
>>> The final if (ret1 != -ENXIO) ret = ret1; ensures that if both paths ran
>>> and IOMMU succeeded,
>>> an SCI failure is still reported to the caller.
>>>
>>> Device-tree examples to illustrate the dual roles:
>>> 1. Access-controlled DT device (not necessarily IOMMU-protected):
>>>
>>> i2c3: i2c@e6508000 {
>>>       compatible = "renesas,rcar-gen3-i2c";
>>>       reg = <0 0xe6508000 0 0x40>;
>>>       power-domains = <&scmi_pd 5>;      // FW-managed power domain
>>>       clocks = <&scmi_clk 12>;
>>>       clock-names = "fck";
>>>       access-controllers = <&scmi_xen 0>;
>>>       // no iommus property: SCI may need to authorize/power this device;
>>> IOMMU has nothing to do
>>> };
>>>
>>> 2. IOMMU-protected DT device that still may need SCI mediation:
>>> vpu: video@e6ef0000 {
>>>       compatible = "renesas,rcar-vpu";
>>>       reg = <0 0xe6ef0000 0 0x10000>;
>>>       iommus = <&ipmmu 0 0>;             // needs IOMMU mapping for DMA
>>> isolation
>>>       power-domains = <&scmi_pd 7>;      // FW-managed power/clock/reset
>>>       clocks = <&scmi_clk 34>;
>>>       access-controllers = <&scmi_xen 0>;
>>>       clock-names = "vpu";
>>> };
>>>>> --- a/xen/drivers/passthrough/device_tree.c
>>>>> +++ b/xen/drivers/passthrough/device_tree.c
>>>>> @@ -379,6 +379,12 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>>>>>                break;
>>>>>            }
>>>>>    
>>>>> +        if ( !dt_device_is_protected(dev) )
>>>>> +        {
>>>>> +            ret = 0;
>>>>> +            break;
>>>>> +        }
>>>>> +
>>>>>            ret = iommu_assign_dt_device(d, dev);
>>>>>    
>>>>>            if ( ret )
>>>> How are DT and PCI different in this regard?
>>> Please find examples above.
>> Sorry, but I can't spot anything PCI-ish in the examples above. Then again I
>> also no longer recall why I compared with PCI here. Oh, perhaps because the
>> PCI side isn't being modified at all.
>>
> Correct, pci code wasn't touched by these changes.

Yet my question boils down to "why", not "whether".

Jan

