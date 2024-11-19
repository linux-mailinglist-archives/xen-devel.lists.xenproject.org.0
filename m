Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4BB9D20EE
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 08:45:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839686.1255470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDIud-0005v2-KP; Tue, 19 Nov 2024 07:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839686.1255470; Tue, 19 Nov 2024 07:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDIud-0005sR-HP; Tue, 19 Nov 2024 07:44:39 +0000
Received: by outflank-mailman (input) for mailman id 839686;
 Tue, 19 Nov 2024 07:44:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UMhk=SO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tDIub-0005sL-V0
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 07:44:37 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ec692a4-a64a-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 08:44:34 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a9e8522c10bso824966166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2024 23:44:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df779afsm618477566b.85.2024.11.18.23.44.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2024 23:44:33 -0800 (PST)
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
X-Inumbo-ID: 1ec692a4-a64a-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzUiLCJoZWxvIjoibWFpbC1lajEteDYzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjFlYzY5MmE0LWE2NGEtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDAyMjc0LjczODk2MSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732002274; x=1732607074; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=//rhrJzDxAdJAfoAhHK6Qrpe797l4LIw9wGnWw3ZBjE=;
        b=VNQnisF7ddfbBnqlZxMYEHJpyLZaS7RFc/pmjzVNxGq+/pUwMCoqd2VM39jvjZ0Ne/
         oN5+m7Q+2vxi9m0f6LWwzPfSfq7orQjVbsimRqVViZ5RiXTvFq5CW7VUtDxV60uj13B4
         cYx5kqi3fLHD/Yiluipao4r3rr60yVTZ3k9p9oseQmQ0f2wWgdA4pjlL35CsCvy+YhGS
         kCWOzzaBDu1OyMV3NoBeD48HowCFSx60gXEoNCJq89//Ib6dlQXu1DWd1U4jyasKnI4C
         E48GdsqZIcnf6yiqzGG62KDOV/laFVzpldIbFOG/+93jKaMRuy7GS2feAkh7EAcd2v12
         j9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732002274; x=1732607074;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//rhrJzDxAdJAfoAhHK6Qrpe797l4LIw9wGnWw3ZBjE=;
        b=rBeWBpkajjLTmMbbqjlaD6F/HmOUz3Y7G6WG16swIKNg9QyRvOaRRt1pQo+DJ87Rto
         gCRRhGu+tyfrVq3XFK9Yr6OYY5PM5O9eOkGypE7jAxInWURxB94S6SR+afAcybQhJJxi
         VqRIv9B2jxMjgbizDhVB+wXkIPXRSBUY1qIK0qaFoJZLBGhS7eGimD2W6fwBFqFggjhH
         g6QsIJVjrpAQFaoOk3yvejgnrgCis8m1qA3SKpe/Omd0aUVo6eZ1N2bRGeo7BvHglq2l
         v29j9eLs53yPHshsPn1KekyqLl45N6dzXudM+tzIQ9WiiJdICMk0AWXX8pUuOWHeYIbY
         OB0w==
X-Gm-Message-State: AOJu0Yx5CCSlWdfW+a5l6xHpMPZhPO7QCE4eoI2KHL0K8Ad/3UpjV3Rh
	VrbCUtN8NozMN/6A/fpZ5TtbaOKYFXKaDw2YotjQx974MHqOmeOcpQB6ztF3BA==
X-Google-Smtp-Source: AGHT+IE4+KPcN6xUgq9aBmJH4YpzfCnvk/jebCIFeNGcqDVpYHlh9Ov7MkFtJ4/Po5dran9FgX8osw==
X-Received: by 2002:a17:907:8688:b0:a9a:babb:b916 with SMTP id a640c23a62f3a-aa4c7e473a6mr236378666b.15.1732002274231;
        Mon, 18 Nov 2024 23:44:34 -0800 (PST)
Message-ID: <5262adaf-2ff7-47ea-8c13-c544b31e4115@suse.com>
Date: Tue, 19 Nov 2024 08:44:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vpci: Add resizable bar support
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241113080027.244240-1-Jiqian.Chen@amd.com>
 <ZzsUL3dnjl5x0-si@macbook>
 <BL1PR12MB5849F6F7A4E86E0209AB152AE7202@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849F6F7A4E86E0209AB152AE7202@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.11.2024 08:31, Chen, Jiqian wrote:
> On 2024/11/18 18:17, Roger Pau Monné wrote:
>> On Wed, Nov 13, 2024 at 04:00:27PM +0800, Jiqian Chen wrote:
>>> +static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
>>> +                                      unsigned int reg,
>>> +                                      uint32_t val,
>>> +                                      void *data)
>>> +{
>>> +    uint32_t ctrl, index;
>>
>> index should better be unsigned int, as it's the BAR index [0, 5], and
>> so fits perfectly in an unsigned int.
>>
>>> +    struct vpci_bar *bars = pdev->vpci->header.bars;
>>
>> You could pass bars as the data parameter.
>>
>> Additionally you need to check that memory decoding is not enabled for
>> the device, otherwise attempting to change the BAR size will lead to
>> the active p2m mappings getting out of sync w.r.t. the new BAR size.
>>
>>> +
>>> +    ctrl = pci_conf_read32(pdev->sbdf, reg);
>>> +    if ( ctrl == val )
>>> +        return;
>>
>> I would still carry out the write in this case, as that's what the
>> owner of the device requested.
>>
>>> +
>>> +    ctrl &= ~PCI_REBAR_CTRL_BAR_SIZE;
>>> +    if ( ctrl != ( val & ~PCI_REBAR_CTRL_BAR_SIZE ) )
>>                      ^ extra space here and         ^ here
>>> +        return;
>>
>> The feature only being exposed to dom0 ATM, I would suggest we allow
>> it to write any bits it wants in the control register, as that would
>> be what the OS would do when not running as a guest.
> But only PCI_REBAR_CTRL_BAR_SIZE bits of REBAR_CTRL register are RW, others are RO.
> Is removing the check here fine?

A native kernel would write the full register (with r/o bits simply not
getting updated). Hence for Dom0 we ought to do the same, just in case
e.g. some future spec declares some other bit(s) writable.

>>> +
>>> +    index = ctrl & PCI_REBAR_CTRL_BAR_IDX;
>>
>> Some sanity checking of the BAR index might be good.  At least a check
>> that the BAR is of type VPCI_BAR_MEM64_LO or VPCI_BAR_MEM32.
> But the information of the BAR that support resizing is from hardware(when init_rebar), that shouldn't have any problems and doesn't need to check the BAR's info.

Right, but also better to avoid confusing ourselves over bogus hardware.

>>> +    bars[index].size = (1 << ((val & PCI_REBAR_CTRL_BAR_SIZE) >>
>>> +                              PCI_REBAR_CTRL_BAR_SHIFT)) *
>>> +                       PCI_REBAR_CTRL_BAR_UNIT;
>>
>> This would better be a macro in pci_regs.h I think, and you need to
>> use 1UL, plus using MASK_EXTR() simplifies it:
>>
>> PCI_REBAR_CTRL_SIZE(v) (1UL << (MASK_EXTR(v, PCI_REBAR_CTRL_BAR_SIZE) + 20))
> OK, another question: Should I need to check the size is allowed by hardware(the PCI_REBAR_CAP_SIZES bits in PCI_REBAR_CAP)?

Probably better to do so, yes. Whether to reject bogus attempts or
merely warn about them I'm less certain: It's (see above) Dom0, after
all.

Jan

