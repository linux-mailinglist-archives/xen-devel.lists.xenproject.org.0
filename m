Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B09188184A6
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 10:38:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656619.1024920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFWYH-00067P-VR; Tue, 19 Dec 2023 09:38:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656619.1024920; Tue, 19 Dec 2023 09:38:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFWYH-00065M-S8; Tue, 19 Dec 2023 09:38:13 +0000
Received: by outflank-mailman (input) for mailman id 656619;
 Tue, 19 Dec 2023 09:38:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFWYF-00065G-LU
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 09:38:11 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 525d3f7f-9e52-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 10:38:10 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40c29f7b068so47679635e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 01:38:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bd7-20020a05600c1f0700b0040c420eda48sm2063141wmb.22.2023.12.19.01.38.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 01:38:09 -0800 (PST)
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
X-Inumbo-ID: 525d3f7f-9e52-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702978689; x=1703583489; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OmfLi6aAdjrEP8MwG7sWu6/S141J4AiA1n8U6hsxt/w=;
        b=bTcjRZEpOlpsPa8KaFuclsORokbBp+TLDxUnFj7jGH7Kp/H8L//4KZ3sIfGMccKjSo
         OanqXl2fhTJxYmedjwB3X26dpgm6BHIsZ8381yd2XTwEBnNl2D56qabZtxLobhQKJ/gV
         Jxnsj1pC70DsZTLZDpVLJIm0Dpmj2Uh3+0v/L8t8yCLJV0P7/P0PYTK6iMVyEscfBmkf
         JVE1AXzN4PYkKMSmW7sqmFfiJntGRTtdFULtfth+wjIiMZirhbgOYcx1wrS947plOf4H
         dbLO8lFM9xkiyJJWcW4mjtrFvFT2bjMkSr/sUroV9+UEVmhESDr27p/p+GBBndJlUuFD
         RQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702978689; x=1703583489;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OmfLi6aAdjrEP8MwG7sWu6/S141J4AiA1n8U6hsxt/w=;
        b=InOV2ZM1uvBnizoYzlYq3viEdLGk29IcIkrmB80bVCjOKSi7Foma4VJ5fP35C05USL
         QcyMA2TOKiKSF3eMZYTPe176gkZp663NjfifiSGycCDoGjVXJarluWngYk1tj8t9/LUL
         wepGiTOBQg1Gs21nIOeoWMFwn0XXhdzL84//eedggzPO/YMl7/oSHgK8a3ykWbpDSw3w
         SSDu0QCGGyjkXQ633fglXYo8PmdX4Wj8w9KWRty93KzY/Ej3xT0jusWFf1WtJeP8moFI
         yqrIBHIzcpDK8qUyvyttlArTBqoYTA6uE3WXbGx1u/IbPODPelQT/06mmf1ynEGP6Byj
         f1RA==
X-Gm-Message-State: AOJu0YxLAuUbqk+Wc7UQsxnMXzUCf8BbhDVlvLiuMTLujPvB22buzHTd
	2KOEoVK85eFbeYaszx1Oqb1X
X-Google-Smtp-Source: AGHT+IGt7S4c4IqySOqaBnhhRq4uQtr6f4Na09NnAbN0O09zTM45NdjxfIpLERtJTJuq76z8G9VEsQ==
X-Received: by 2002:a05:600c:6020:b0:40c:7a1:b2c8 with SMTP id az32-20020a05600c602000b0040c07a1b2c8mr8988206wmb.163.1702978689700;
        Tue, 19 Dec 2023 01:38:09 -0800 (PST)
Message-ID: <84920973-8322-4da6-bdbc-165a065a69ba@suse.com>
Date: Tue, 19 Dec 2023 10:38:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
Content-Language: en-US
To: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Cc: xen-devel@lists.xenproject.org
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <52bd8702-cf7d-4f5b-883d-be6214ba31c0@suse.com>
 <CAKm-UmadRsc7GEYDqMDTBaoozT5Bj3nwK+=uDs1LkTZVG8tgdQ@mail.gmail.com>
 <CAKm-UmZnPtH_Fxou3OV0BbpP+tBpSe1z8Qet4Q5=zDD7UGZy6Q@mail.gmail.com>
 <CAKm-UmbaHoXymP8CcBVBLSVG7T9zCE2fbFQB33SMnY8pwXOU1Q@mail.gmail.com>
 <435d159f-96d5-49af-82ec-bce6961e3391@suse.com>
 <CAKm-UmbEBOm525=f+OOL0P05tQVVQz9wegh7F8yhgV_=Z7rWug@mail.gmail.com>
 <CAKm-UmYejm8CW-Enc_Y-aefcLPsRhQO8w2P-fNdu1zXMMjUAoA@mail.gmail.com>
 <e83e7254-0c90-4912-ae63-ea7221a10071@suse.com>
 <CAKm-UmbDNbeakVQtDT47o4Qc4oQvi0dqmBDb5Q=pRqTHFY0C5w@mail.gmail.com>
 <CAKm-UmZtN2o3d13cE9GyyLKfMmZ855MfrAAw9O6zE-5ob0-iYg@mail.gmail.com>
 <64d738b7-08c1-4b2c-a828-a137c870408e@suse.com>
 <CAKm-UmayUxd8F337g+BnR=_50_o__oV_PeUv9Z+9gNZ5MXYmrA@mail.gmail.com>
 <3aeb708d-a4fa-45b5-9d74-260ef2035b4a@suse.com>
 <CAKm-UmbFkO5RCDMTEgWBtEYtfO_LH=TKTh5TP=FyFFpdnbto4w@mail.gmail.com>
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
In-Reply-To: <CAKm-UmbFkO5RCDMTEgWBtEYtfO_LH=TKTh5TP=FyFFpdnbto4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.12.2023 18:04, Sébastien Chaumat wrote:
> Le lun. 18 déc. 2023, 17:44, Jan Beulich <jbeulich@suse.com> a écrit :
> 
>> On 18.12.2023 17:21, Sébastien Chaumat wrote:
>>>>>>> On 05.12.2023 21:31, Sébastien Chaumat wrote:
>>>>> This issue seems that IRQ 7 (the GPIO controller) is natively fasteoi
>>>>> (so level type) while in xen it  is mapped to oapic-edge  instead of
>>>>> oapic-level
>>>>> as the SSDT indicates :
>>>>>
>>>>>  Device (GPIO)
>>>>>
>>>>>      {
>>>>>          Name (_HID, "AMDI0030")  // _HID: Hardware ID
>>>>>          Name (_CID, "AMDI0030")  // _CID: Compatible ID
>>>>>          Name (_UID, Zero)  // _UID: Unique ID
>>>>>          Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource
>> Settings
>>>>>          {
>>>>>              Name (RBUF, ResourceTemplate ()
>>>>>              {
>>>>>                  Interrupt (ResourceConsumer, Level, ActiveLow,
>> Shared, ,, )
>>>>>                  {
>>>>>                      0x00000007,
>>>>>            }
>>>>> Any idea why ?
>>>>
>>>> Information coming from AML is required to be handed down by Dom0 to
>> Xen.
>>>> May want checking that (a) Dom0 properly does so and (b) Xen doesn't
>> screw
>>>> up in consuming that data. See PHYSDEVOP_setup_gsi. I wonder if this is
>>>> specific to it being IRQ7 which GPIO uses, as at the (master) PIC IRQ7
>> is
>>>> also the spurious vector. You may want to retry with the tip of the 4.17
>>>> branch (soon to become 4.17.3) - while it doesn't look very likely to me
>>>> that recent backports there were related, it may still be that they make
>>>> a difference.
>>>>
>>>
>>> testing with 4.17.3:
>>>
>>> Adding some printk in PHYSDEVOP_setup_gsi, I  see (in xl dmesg)  that
>>> (XEN) PHYSDEVOP_setup_gsi setup_gsi : gsi: 7 triggering: 1 polarity: 1
>>>
>>> but later on in dmesg I see :
>>> [    1.747958] xen: registering gsi 7 triggering 0 polarity 1
>>>
>>> So triggering is flipped from 1 to 0 (cannot find the definition for
>>> those values).
>>> Could this be the culprit ?
>>
>> Possibly. Since it would be the kernel to invoke PHYSDEVOP_setup_gsi, it
>> looks as if the kernel was confused about which trigger mode to use. Have
>> you figured from where the kernel takes the two different values?
>>
> 
>> Would you mind pointing me to the definition for those values first ? I
> did not find what 0/1 means in this context.

See e.g. the IO-APIC spec, or Xen's io_apic.h:

struct IO_APIC_route_entry {
    ...
            unsigned int polarity:1;      /* 0: low, 1: high */
    ...
            unsigned int trigger:1;       /* 0: edge, 1: level */

(Sadly the comment may be the wrong way round for polarity, but then I
may also be missing something, as msi.h and apicdef.h suggest things
are as the comment above says.)

In any event the PHYSDEVOP_setup_gsi invocation looks fishy, at least
if this was a PCI IRQ. Just to mention it - according to the hypervisor
log you sent earlier there's also no source override for IRQ 7 (in the
log lines starting "ACPI: INT_SRC_OVR ").

Jan

