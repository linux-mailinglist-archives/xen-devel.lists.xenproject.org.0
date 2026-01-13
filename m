Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD05D1A182
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 17:09:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202003.1517610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfgwM-00070l-L7; Tue, 13 Jan 2026 16:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202003.1517610; Tue, 13 Jan 2026 16:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfgwM-0006zN-HY; Tue, 13 Jan 2026 16:08:18 +0000
Received: by outflank-mailman (input) for mailman id 1202003;
 Tue, 13 Jan 2026 16:08:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=thT7=7S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfgwL-0006zF-Ax
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 16:08:17 +0000
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [2a00:1450:4864:20::441])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1117fe21-f09a-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 17:08:15 +0100 (CET)
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-432d256c2a9so4086499f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 08:08:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5df9c5sm46202980f8f.22.2026.01.13.08.08.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 08:08:14 -0800 (PST)
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
X-Inumbo-ID: 1117fe21-f09a-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768320495; x=1768925295; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AbU4BY2euF9GgZDEbcuk9Z4wbGADyfZOyW34Xh2W4Yo=;
        b=LEkBvESIJMHLc0+77XYQ9AFv+mHf9dtseyIZ2la/WdXhVG2M5kyg6NeJee64Mr45HS
         7Ev8+5ObW8LA1kkFuU084OSawcmYbWB2pVIlPr++1DUmPjR1oES44xC5HSM3ye+FPTDg
         QsWeei7KA6paRSBS66H0TqFytReKhue5E6iVSNlchvhgqQM2liNgkT8Yuo+8KHJfyoQX
         dXKbVABCVZzwzYQIFzmskHLTHOMfKbxcUUqFh5cCgj9ljR/qn79/B+4+D67jsdXBYjjY
         qNsMPRsmWwgNORwbhnVXaQ4TykrAb/zrUgrSjUNsHUfV5HTI/rIQZQdzxQhhxwg0YCiV
         2aVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768320495; x=1768925295;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AbU4BY2euF9GgZDEbcuk9Z4wbGADyfZOyW34Xh2W4Yo=;
        b=cJwmC8iBau8gofRJVY21NEWAH1+3olaM78Yc35RfAzQlhHsiCkCWZNygUJhR03081V
         ANTAocCcAbRKtPwulWtXlR/cofXDcCfTfAO6dyvPb4A1gfY0rYcJUKT52obPtiKR969Y
         ItU3HTkRdx9LGz67vuywUx4lmolAUuYeQ28/cVUshit0XUEP9a7BnqkOJA4uG0pAnOtu
         cF6PmcTPlUwhih6CbZj481XL4HhbLRxpBpd+S3KLU/dujZol0TgCyOEz/PwnOsRfu/qz
         Auz43u3oqZoc8TNdKVxfaKlXal3Qky8naDnDJVBvseGHTI5xEGhhV3EqnuleuTTljixL
         e5Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWe2+t40w13qG1ImBne+xxCLHh3ULOlxWaS6EPwVX3+wb1Iop9dY0b4HCKa2q6X/SvVfNWZbOOJ9Hg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzi6H+y/JXvdQENi+fABsdO0iX21xX8RupgthiHSnbS1JY0zwlG
	OAIH6djrVoW8dZsxILM5GpCB9HnAsVW6mfsQcr2+TQ8kZ2yP+NwvU96oPF6ejqudww==
X-Gm-Gg: AY/fxX7H2td8rRxQUCdCyMwYeAo3G3DJpP6Z21NRYdl7B+f2ihYkfCqn3fNWsWtF4Cw
	qvv6tuvy7bZMdQA2KJ/2HiIOzY1qHHQNW3VsVca0gJN19iTkrHTqa3nQAms+dIYYs/eMOiM1v4u
	p7AtqqBwPSbIOYPYXiousZQTSwQrRHkMFpjtSd78M7VngInId8C0lqYCc3oKMJzzGi+PxMehIAu
	93ciN6v+il5q72JAbSac5samvZbMsY69icT9dKnpyC7Qcmu7NhBZg3kDg6YY/48a2EYYsKy0yQ6
	5YSXpo9JpG2ijAoqHGSUcdIMe/r2PqhI58+oNhtHAbMaphS+zNqbaZe5+u5akGbSqr5qFDDTUuc
	hjKJoO7aOr6ffS4KSl9U8f8bIhv1fGiB7uxfMBh1ldwIKrljakcjXZfFjADfPyH8roO58CV4pUG
	wTiWBgYhwfDI/hwFd80zZ45cgXLBW3ScLv9zr3aHymz7+SfMneTjPFjENsCsdfVdOcH4k1f5rwy
	sg=
X-Google-Smtp-Source: AGHT+IEaGzmZuj5vrsrc8lKuzDGqnhkeeZthSUWtmLXmrWQpsKjXgSgeqpkHk9PVx8M7Z4yaJeuzTA==
X-Received: by 2002:a5d:64e3:0:b0:430:f68f:ee7d with SMTP id ffacd0b85a97d-432c379b79cmr29190345f8f.47.1768320494490;
        Tue, 13 Jan 2026 08:08:14 -0800 (PST)
Message-ID: <93cf250d-864d-4375-b05a-e48d3d56dac9@suse.com>
Date: Tue, 13 Jan 2026 17:08:14 +0100
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
 <4807d2d3-fae7-45a4-b7c7-e101a95a6b58@suse.com>
 <87ba1c35-f1f3-4a52-ba76-306a538ad0c6@epam.com>
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
In-Reply-To: <87ba1c35-f1f3-4a52-ba76-306a538ad0c6@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.01.2026 16:50, Oleksii Moisieiev wrote:
> 
> 
> On 12/01/2026 18:13, Jan Beulich wrote:
>> On 12.01.2026 17:10, Oleksii Moisieiev wrote:
>>> On 12/01/2026 17:56, Jan Beulich wrote:
>>>> On 12.01.2026 16:54, Oleksii Moisieiev wrote:
>>>>> On 12/01/2026 17:40, Jan Beulich wrote:
>>>>>> On 12.01.2026 16:16, Oleksii Moisieiev wrote:
>>>>>>> On 06/11/2025 12:09, Jan Beulich wrote:
>>>>>>>> On 01.11.2025 12:56, Oleksii Moisieiev wrote:
>>>>>>>>> @@ -827,7 +828,32 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>>>>>>>>          case XEN_DOMCTL_test_assign_device:
>>>>>>>>>          case XEN_DOMCTL_deassign_device:
>>>>>>>>>          case XEN_DOMCTL_get_device_group:
>>>>>>>>> +        int ret1;
>>>>>>>>> +
>>>>>>>>> +        /*
>>>>>>>>> +         * Add chained handling of assigned DT devices to support
>>>>>>>>> +         * access-controller functionality through SCI framework, so
>>>>>>>>> +         * DT device assign request can be passed to FW for processing and
>>>>>>>>> +         * enabling VM access to requested device.
>>>>>>>>> +         * The access-controller DT device processing is chained before IOMMU
>>>>>>>>> +         * processing preserving return code and expected to be executed for
>>>>>>>>> +         * any DT device regardless if DT device is protected by IOMMU or
>>>>>>>>> +         * not (or IOMMU is disabled).
>>>>>>>>> +         */
>>>>>>>>> +        ret1 = sci_do_domctl(op, d, u_domctl);
>>>>>>>> Why would this not be the initializer of the new variable? (I also don't think
>>>>>>>> that we've decided to permit variable declarations at other than the top of
>>>>>>>> scopes or within e.g. a for() loop control construct.)
>>>>>>>>
>>>>>>> +
>>>>>>>>>              ret = iommu_do_domctl(op, d, u_domctl);
>>>>>>>>> +        if ( ret < 0 )
>>>>>>>>> +            return ret;
>>>>>>>> Why would you invoke both in all cases? If sci_do_domctl() handled the request,
>>>>>>>> there isn't any point in also invoking iommu_do_domctl(), is there? Or else is
>>>>>>>> there maybe some crucial aspect missing from the description (or not explicit
>>>>>>>> enough there for a non-SCI person like me)?
>>>>>>>>
>>>>>>>> Also this doesn't look to fit the description saying "The SCI access-controller
>>>>>>>> DT device processing is chained after IOMMU processing ..."
>>>>>>>>
>>>>>>> We call both because SCI and IOMMU cover different concerns and a DT
>>>>>>> device may need
>>>>>>> both: SCI for FW-mediated access control (power/clocks/reset) and IOMMU
>>>>>>> for DMA isolation.
>>>>>>> SCI returning success does not mean the IOMMU work is redundant.
>>>>>> Can the comment then please be updated to properly call out this dual
>>>>>> requirement?
>>>>> Yes, for sure.
>>>>>>> - sci_do_domctl() returns -ENXIO when it has nothing to do (non-DT, no
>>>>>>> mediator, mediator lacks assign hook).
>>>>>>> That is the “not handled by SCI” sentinel; in that case the code
>>>>>>> proceeds to IOMMU normally.
>>>>>>> -  When sci_do_domctl() succeeds (0), the device may still require IOMMU
>>>>>>> programming
>>>>>>> (e.g., DT device has an iommus property). Skipping iommu_do_domctl()
>>>>>>> would leave DMA isolation unprogrammed.
>>>>>>>
>>>>>>> The final if (ret1 != -ENXIO) ret = ret1; ensures that if both paths ran
>>>>>>> and IOMMU succeeded,
>>>>>>> an SCI failure is still reported to the caller.
>>>>>>>
>>>>>>> Device-tree examples to illustrate the dual roles:
>>>>>>> 1. Access-controlled DT device (not necessarily IOMMU-protected):
>>>>>>>
>>>>>>> i2c3: i2c@e6508000 {
>>>>>>>         compatible = "renesas,rcar-gen3-i2c";
>>>>>>>         reg = <0 0xe6508000 0 0x40>;
>>>>>>>         power-domains = <&scmi_pd 5>;      // FW-managed power domain
>>>>>>>         clocks = <&scmi_clk 12>;
>>>>>>>         clock-names = "fck";
>>>>>>>         access-controllers = <&scmi_xen 0>;
>>>>>>>         // no iommus property: SCI may need to authorize/power this device;
>>>>>>> IOMMU has nothing to do
>>>>>>> };
>>>>>>>
>>>>>>> 2. IOMMU-protected DT device that still may need SCI mediation:
>>>>>>> vpu: video@e6ef0000 {
>>>>>>>         compatible = "renesas,rcar-vpu";
>>>>>>>         reg = <0 0xe6ef0000 0 0x10000>;
>>>>>>>         iommus = <&ipmmu 0 0>;             // needs IOMMU mapping for DMA
>>>>>>> isolation
>>>>>>>         power-domains = <&scmi_pd 7>;      // FW-managed power/clock/reset
>>>>>>>         clocks = <&scmi_clk 34>;
>>>>>>>         access-controllers = <&scmi_xen 0>;
>>>>>>>         clock-names = "vpu";
>>>>>>> };
>>>>>>>>> --- a/xen/drivers/passthrough/device_tree.c
>>>>>>>>> +++ b/xen/drivers/passthrough/device_tree.c
>>>>>>>>> @@ -379,6 +379,12 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>>>>>>>>>                  break;
>>>>>>>>>              }
>>>>>>>>>      
>>>>>>>>> +        if ( !dt_device_is_protected(dev) )
>>>>>>>>> +        {
>>>>>>>>> +            ret = 0;
>>>>>>>>> +            break;
>>>>>>>>> +        }
>>>>>>>>> +
>>>>>>>>>              ret = iommu_assign_dt_device(d, dev);
>>>>>>>>>      
>>>>>>>>>              if ( ret )
>>>>>>>> How are DT and PCI different in this regard?
>>>>>>> Please find examples above.
>>>>>> Sorry, but I can't spot anything PCI-ish in the examples above. Then again I
>>>>>> also no longer recall why I compared with PCI here. Oh, perhaps because the
>>>>>> PCI side isn't being modified at all.
>>>>>>
>>>>> Correct, pci code wasn't touched by these changes.
>>>> Yet my question boils down to "why", not "whether".
>>>>
>>> I have reviewed the previous versions of the patch serie and could not
>>> find any questions related to PCI prior to this series. Therefore, "How
>>> are DT and PCI different in this regard?" appears to be the first
>>> question concerning PCI.
>> Quite possible, yet does that somehow eliminate the need to address it? I'm
>> trying to understand why the respective PCI code isn't being touched.
>>
> XEN_DOMCTL_assign_device dispatch: we now chain sci_do_domctl first, 
> then iommu_do_domctl.
> iommu_do_domctl first tries iommu_do_pci_domctl (when CONFIG_HAS_PCI) 
> and falls back to iommu_do_dt_domctl only if PCI returns -ENODEV.
> The new dt_device_is_protected() bypass in iommu_do_dt_domctl only 
> applies to DT-described devices; SCI parameters are carried via DT nodes.
> PCI devices handled by iommu_do_pci_domctl do not carry DT/SCI metadata 
> in this path, so there is no notion of “SCI parameters on a 
> non-IOMMU-protected PCI device” for it to interpret or to skip. The PCI 
> path should continue to report errors if assignment cannot be performed 
> by the IOMMU layer.
> So we should leave iommu_do_pci_domctl unchanged; the SCI/DT-specific 
> relaxations belong only in the DT path.
> Also  SCI handling only exists when DT is present.

Can an abridged variant of this please be added to the description?

Jan

