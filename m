Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1E2D13EA8
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 17:13:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200691.1516547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfKXZ-0003jg-9F; Mon, 12 Jan 2026 16:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200691.1516547; Mon, 12 Jan 2026 16:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfKXZ-0003gd-5y; Mon, 12 Jan 2026 16:13:13 +0000
Received: by outflank-mailman (input) for mailman id 1200691;
 Mon, 12 Jan 2026 16:13:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfKXX-0003gT-Ku
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 16:13:11 +0000
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 966f5574-efd1-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 17:13:10 +0100 (CET)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-47d493a9b96so38067555e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 08:13:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d86c6ff40sm291223085e9.2.2026.01.12.08.13.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 08:13:09 -0800 (PST)
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
X-Inumbo-ID: 966f5574-efd1-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768234389; x=1768839189; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jx1dZXRM1A0pEJ3m/5Bxc2ZGwDlTpl7OLP4BEe21ByE=;
        b=M93MwTtcATpdGfV6Au96V8lvQN8nYcqwyV5WFZczFcjCgVKTCnqQ+FlibYjhW6oJKF
         J62uLaHfp1WcWhvuCGvGSCmPD27DIPPJZjSqvukiAqqYoGeA6k4fjuKcnvm4XgaYop/Y
         tiV6MbW1+xljmiJ3Z/jH3Avss6jGwVyndsK+pupztnFMRRpBasL4gog2ncq7uzEcnWnv
         KtJ9aSGcSW0K+8L/biLCqnY3RhgCpkxbvNTmtGJ0O1oRFnKoLYwMQicSXR9eVl4sZCTX
         Xf7ADe7Pol1rvbeNhmFlYEUVqoYFtclm+ySRGP47sMZnBmVnbhprDULaeXZX3c6LyYUq
         GCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768234389; x=1768839189;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jx1dZXRM1A0pEJ3m/5Bxc2ZGwDlTpl7OLP4BEe21ByE=;
        b=GB+UqOUoN4swLo67vS0HUtIuWXZ1K7pz8/V524TyDVeb7KhTN5T6+krUjkjm09JhDf
         aW4vKDCdfIkTI6bEZneXqs46oDNwOr41kdew9SUzEC0OGm4+46pUId+tQOvq42blhCVJ
         UW5vwyDDZLcXLzRVXibIWrFWvjpRKTaHgLFpGz04J0M5mY0cdUMeLDYvfMUwIj3M7hSO
         T9vEuN3ltmhIOX8ff1kkvN9s0QgtAX0lVN/CdQ0Xq0pPRtH3IWDFxMEj5wl0+OOzuDtm
         5fLN2O0KGJyDcitUnLbspzi3K74tC93Dkfrg6jXGycUFFbGQ9cF4cTsuW8IVUBFz1zNS
         nDww==
X-Forwarded-Encrypted: i=1; AJvYcCUwZblLDCM1Ee51h53MeDUjb6v/YGv2lqo5oeq2DLmhNBUnI4jAT6G47O30BByUp9ySbofp2+04PlU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDex46TdQ6vnF1kwbfGxeCGaUIklle9SyH7rVccy6zkCB4O0fU
	lMr7AwEROYlwTI6QAkMtoDlf5F5IYW6n2S8NNxXc9P+oMsUpR5DZaALoOT0/AXyt6A==
X-Gm-Gg: AY/fxX59Xx0t4UYQrcsGSyXDcKxPNue424pJ2obJgJtVkhbmJBwV6VrCBHAsaVNGVke
	7e9Gd/+mVtSr2pK4vZ9c6NMCphT5jLFq6uSNkaHpr6Ll4VLvLoImL3K2asD8BwH0iSoi8dHStej
	GOrTE3cSbRSkD/CuIT4/V0jvsrZWt8S3OqpDi1nSiLeaHMK4PiWaWUPiqAl5sF6JqSQZOnAOMBX
	O5U3sFrMhCQ6GjHmeThWcv3zRAelbWURZtMke9DpdyEKI4tBhcQkj50MMkOuMBZC3+Yv9qes7QF
	qCNNret4YGE49nZ4+CzghOFvzl5hJHib7WFpxsSGgmzNQJeUboG1pwOWnOa+5i5t6VYARyfluY7
	FIwNbHmfJJ9WQiAPUwN+zhRKgyuWjV2iEz7KBpOR2U1vvA9PN2+2QHr5PLi4RHjVvwpAj6K+wG6
	ZmnzisaHpfvcVYLq745dkGUZXUPHZpYOqiuFnMcIReo9lyy73ArosQsiCD17gUjtbIWhciiUJu2
	M4=
X-Google-Smtp-Source: AGHT+IG7OfI3kF7k5L6BdMMoWGOlBt7rjBV4OS/a2u6qsQacWVCQxvU6rqJyS30j1JAOWROLj1Z5Gg==
X-Received: by 2002:a05:600c:1e24:b0:475:de14:db1e with SMTP id 5b1f17b1804b1-47d84b36a1emr225505175e9.24.1768234389443;
        Mon, 12 Jan 2026 08:13:09 -0800 (PST)
Message-ID: <4807d2d3-fae7-45a4-b7c7-e101a95a6b58@suse.com>
Date: Mon, 12 Jan 2026 17:13:09 +0100
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
 <7cbda859-4257-499e-86e0-a0d001fd49c9@suse.com>
 <9631b854-2fc6-41aa-8b12-1e7283b22246@epam.com>
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
In-Reply-To: <9631b854-2fc6-41aa-8b12-1e7283b22246@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.01.2026 17:10, Oleksii Moisieiev wrote:
> On 12/01/2026 17:56, Jan Beulich wrote:
>> On 12.01.2026 16:54, Oleksii Moisieiev wrote:
>>> On 12/01/2026 17:40, Jan Beulich wrote:
>>>> On 12.01.2026 16:16, Oleksii Moisieiev wrote:
>>>>> On 06/11/2025 12:09, Jan Beulich wrote:
>>>>>> On 01.11.2025 12:56, Oleksii Moisieiev wrote:
>>>>>>> @@ -827,7 +828,32 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>>>>>>         case XEN_DOMCTL_test_assign_device:
>>>>>>>         case XEN_DOMCTL_deassign_device:
>>>>>>>         case XEN_DOMCTL_get_device_group:
>>>>>>> +        int ret1;
>>>>>>> +
>>>>>>> +        /*
>>>>>>> +         * Add chained handling of assigned DT devices to support
>>>>>>> +         * access-controller functionality through SCI framework, so
>>>>>>> +         * DT device assign request can be passed to FW for processing and
>>>>>>> +         * enabling VM access to requested device.
>>>>>>> +         * The access-controller DT device processing is chained before IOMMU
>>>>>>> +         * processing preserving return code and expected to be executed for
>>>>>>> +         * any DT device regardless if DT device is protected by IOMMU or
>>>>>>> +         * not (or IOMMU is disabled).
>>>>>>> +         */
>>>>>>> +        ret1 = sci_do_domctl(op, d, u_domctl);
>>>>>> Why would this not be the initializer of the new variable? (I also don't think
>>>>>> that we've decided to permit variable declarations at other than the top of
>>>>>> scopes or within e.g. a for() loop control construct.)
>>>>>>
>>>>> +
>>>>>>>             ret = iommu_do_domctl(op, d, u_domctl);
>>>>>>> +        if ( ret < 0 )
>>>>>>> +            return ret;
>>>>>> Why would you invoke both in all cases? If sci_do_domctl() handled the request,
>>>>>> there isn't any point in also invoking iommu_do_domctl(), is there? Or else is
>>>>>> there maybe some crucial aspect missing from the description (or not explicit
>>>>>> enough there for a non-SCI person like me)?
>>>>>>
>>>>>> Also this doesn't look to fit the description saying "The SCI access-controller
>>>>>> DT device processing is chained after IOMMU processing ..."
>>>>>>
>>>>> We call both because SCI and IOMMU cover different concerns and a DT
>>>>> device may need
>>>>> both: SCI for FW-mediated access control (power/clocks/reset) and IOMMU
>>>>> for DMA isolation.
>>>>> SCI returning success does not mean the IOMMU work is redundant.
>>>> Can the comment then please be updated to properly call out this dual
>>>> requirement?
>>> Yes, for sure.
>>>>> - sci_do_domctl() returns -ENXIO when it has nothing to do (non-DT, no
>>>>> mediator, mediator lacks assign hook).
>>>>> That is the “not handled by SCI” sentinel; in that case the code
>>>>> proceeds to IOMMU normally.
>>>>> -  When sci_do_domctl() succeeds (0), the device may still require IOMMU
>>>>> programming
>>>>> (e.g., DT device has an iommus property). Skipping iommu_do_domctl()
>>>>> would leave DMA isolation unprogrammed.
>>>>>
>>>>> The final if (ret1 != -ENXIO) ret = ret1; ensures that if both paths ran
>>>>> and IOMMU succeeded,
>>>>> an SCI failure is still reported to the caller.
>>>>>
>>>>> Device-tree examples to illustrate the dual roles:
>>>>> 1. Access-controlled DT device (not necessarily IOMMU-protected):
>>>>>
>>>>> i2c3: i2c@e6508000 {
>>>>>        compatible = "renesas,rcar-gen3-i2c";
>>>>>        reg = <0 0xe6508000 0 0x40>;
>>>>>        power-domains = <&scmi_pd 5>;      // FW-managed power domain
>>>>>        clocks = <&scmi_clk 12>;
>>>>>        clock-names = "fck";
>>>>>        access-controllers = <&scmi_xen 0>;
>>>>>        // no iommus property: SCI may need to authorize/power this device;
>>>>> IOMMU has nothing to do
>>>>> };
>>>>>
>>>>> 2. IOMMU-protected DT device that still may need SCI mediation:
>>>>> vpu: video@e6ef0000 {
>>>>>        compatible = "renesas,rcar-vpu";
>>>>>        reg = <0 0xe6ef0000 0 0x10000>;
>>>>>        iommus = <&ipmmu 0 0>;             // needs IOMMU mapping for DMA
>>>>> isolation
>>>>>        power-domains = <&scmi_pd 7>;      // FW-managed power/clock/reset
>>>>>        clocks = <&scmi_clk 34>;
>>>>>        access-controllers = <&scmi_xen 0>;
>>>>>        clock-names = "vpu";
>>>>> };
>>>>>>> --- a/xen/drivers/passthrough/device_tree.c
>>>>>>> +++ b/xen/drivers/passthrough/device_tree.c
>>>>>>> @@ -379,6 +379,12 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>>>>>>>                 break;
>>>>>>>             }
>>>>>>>     
>>>>>>> +        if ( !dt_device_is_protected(dev) )
>>>>>>> +        {
>>>>>>> +            ret = 0;
>>>>>>> +            break;
>>>>>>> +        }
>>>>>>> +
>>>>>>>             ret = iommu_assign_dt_device(d, dev);
>>>>>>>     
>>>>>>>             if ( ret )
>>>>>> How are DT and PCI different in this regard?
>>>>> Please find examples above.
>>>> Sorry, but I can't spot anything PCI-ish in the examples above. Then again I
>>>> also no longer recall why I compared with PCI here. Oh, perhaps because the
>>>> PCI side isn't being modified at all.
>>>>
>>> Correct, pci code wasn't touched by these changes.
>> Yet my question boils down to "why", not "whether".
>>
> I have reviewed the previous versions of the patch serie and could not 
> find any questions related to PCI prior to this series. Therefore, "How 
> are DT and PCI different in this regard?" appears to be the first 
> question concerning PCI.

Quite possible, yet does that somehow eliminate the need to address it? I'm
trying to understand why the respective PCI code isn't being touched.

Jan

