Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C93F981BA86
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 16:22:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659009.1028467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGKsX-0000Cv-K2; Thu, 21 Dec 2023 15:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659009.1028467; Thu, 21 Dec 2023 15:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGKsX-00009b-H8; Thu, 21 Dec 2023 15:22:29 +0000
Received: by outflank-mailman (input) for mailman id 659009;
 Thu, 21 Dec 2023 15:22:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vttA=IA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rGKsV-00009O-QN
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 15:22:27 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be9c4389-a014-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 16:22:25 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40d31116dbeso10320315e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 07:22:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x17-20020a5d4451000000b0033651e6a74dsm2222293wrr.27.2023.12.21.07.22.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 07:22:24 -0800 (PST)
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
X-Inumbo-ID: be9c4389-a014-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703172145; x=1703776945; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HAphuRwLurYFBjXpaM6RIqzTzL8xPWiQTrSb6wYU7MA=;
        b=ZnuLb4Gu4s/mbJs7q69pW1D1SdnU8tU540JRjkRddQ3XXnzuR27kCe75guZF3s+CKS
         u00niAvoRWREqKCQ9x1S2/3VC40g++vTxQWsAM9dGwBqwLPq3lwoGuWMaxl6b+JhxI+e
         37Ln+e5dWCRoS2TbvOmOkOwlteUHB2B4cCFdkDBPbsdJJiceGwrztzTqzsUcGA7bygf4
         S0NDgzXSeMUPp3bllmWGZJSzSEv93ltH8OGdmNcMkMyj/EvoW7KI3e8Dfu4+ALTYFYCi
         d8gCX3u4a/nvOErmic30yCGwQ7i94D8qf+pd7zLpVpABMaAokgUEW+uF2JayLJ0ADXuC
         g7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703172145; x=1703776945;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HAphuRwLurYFBjXpaM6RIqzTzL8xPWiQTrSb6wYU7MA=;
        b=gB3VF4TARDmU+spkEctUqp9Z66ZBHZkbh/zzlPPK9IpRXHtsKZWNspUgwQLjVUR04O
         X3dkdeq97jBwLsrYiKyp91Q7bnRkWoFmV5nu2rq3Jr44JnBkESyYa7O7LvFQy1FsVgdn
         /EaYAfD/nNr0IKyyZks7myEM3xYXG+C8TXi77t07jReq/rmUTwhnbS/49xWAVQahyRkF
         HabNdELLBez9Mjdj+DEI5Sl8MyLhBCjUrFfLD7Isl2609VZiLTrVcSitx15J6rt7o+6r
         lcJTAJg32Z06Y3pfREXloPcHEdrJ2IZUqJ4yYFfbJQeyeRz9y/lbqwhHIlC0GhxXXJ+g
         Tahg==
X-Gm-Message-State: AOJu0YyF+QbPGCvx826CAu2mEOd/kBkmfX27wTx8kPLKk0AgM5rWb5lK
	XOud4PwkwsHbpIUPyvbMCclu
X-Google-Smtp-Source: AGHT+IEnyMvuRC7W4Ld3kCKK7HXOrXbrhziNvnHUcJ7QXKN86LlALEhlTQFdbv0SKrqvyqw5diXw7Q==
X-Received: by 2002:a05:600c:338a:b0:40c:2b2b:6429 with SMTP id o10-20020a05600c338a00b0040c2b2b6429mr875743wmp.67.1703172144887;
        Thu, 21 Dec 2023 07:22:24 -0800 (PST)
Message-ID: <e2d16343-2293-4640-8deb-f30da599ae7d@suse.com>
Date: Thu, 21 Dec 2023 16:22:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?S=C3=A9bastien_Chaumat?=
 <euidzero@gmail.com>
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <CAKm-UmZtN2o3d13cE9GyyLKfMmZ855MfrAAw9O6zE-5ob0-iYg@mail.gmail.com>
 <64d738b7-08c1-4b2c-a828-a137c870408e@suse.com>
 <CAKm-UmayUxd8F337g+BnR=_50_o__oV_PeUv9Z+9gNZ5MXYmrA@mail.gmail.com>
 <b4f46a91-b3b9-49b9-9a26-e2f962dee54c@suse.com>
 <CAKm-UmY9yYv2gOwm-O3DF7dBBNeNjs+3pDGuU+sYgJ+OHwcLNw@mail.gmail.com>
 <CAKm-UmZ1Q77EqUit9J6RX0-MCALdu4gjaU2zrX6oneW+45a+Kw@mail.gmail.com>
 <CAKm-UmYZcsY=C2Yhmy_EeZi0iAguVH0Eqy83upBLa_ikQtPwnw@mail.gmail.com>
 <CAKm-Umapq5LW9yhSOGk8TOg1iuvUogUDKbEXbUcE5T5-vVzW3w@mail.gmail.com>
 <CAKm-UmaUZ=rj-F3RvMoR7H3OvBHm1iy4PTRZAjyi=MQUVTuYVg@mail.gmail.com>
 <CAKm-Umat77MTh6=GEuH+bf1WRX+_B4-N5hY4xwADALfhj4QCPA@mail.gmail.com>
 <6ba9568a-ff8e-48ad-907f-74303e04d3a2@suse.com>
 <CAKm-UmZVoUhidEV15Xk+J_XN5a2GsBqMbXL9wqdFdoAFf_u5AA@mail.gmail.com>
 <bcbceba7-42ac-45be-80ab-e3dfe7741ec6@suse.com>
 <2eafe45b-fd97-472c-a173-459d6ff0b957@suse.com>
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
In-Reply-To: <2eafe45b-fd97-472c-a173-459d6ff0b957@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.12.2023 14:29, Juergen Gross wrote:
> On 21.12.23 13:40, Jan Beulich wrote:
>> On 20.12.2023 17:34, Sébastien Chaumat wrote:
>>> Here are the patches I made to xen and linux kernel
>>> Plus dmesg (bare metal,xen) and "xl dmesg"
>>
>> So the problem looks to be that pci_xen_initial_domain() results in
>> permanent setup of IRQ7, when there only "static" ACPI tables (in
>> particular source overrides in MADT) are consulted. The necessary
>> settings, however, are known only after _CRS for the device was
>> evaluated (and possibly _PRS followed by invocation of _SRS). All of
>> this happens before xen_register_gsi() is called. But that function's
>> call to xen_register_pirq() is short-circuited by the very first if()
>> in xen_register_pirq() when there was an earlier invocation. Hence
>> the (wrong) "edge" binding remains in place, as was established by
>> the earlier call here.
>>
>> Jürgen, there's an interesting comment in xen_bind_pirq_gsi_to_irq(),
>> right before invoking irq_set_chip_and_handler_name(). Despite what
>> the comment says (according to my reading), the fasteoi one is _not_
>> used in all cases. Assuming there's a reason for this, it's not clear
>> to me whether updating the handler later on is a valid thing to do.
>> __irq_set_handler() being even an exported symbol suggests that might
>> be an option to use here. Then again merely updating the handler may
>> not be sufficient, seeing there are also e.g. IRQD_TRIGGER_MASK and
>> IRQD_LEVEL.
> 
> I understand the last paragraph of that comment to reason, that in case
> pirq_needs_eoi() return true even in case of an edge triggered interrupt,
> the outcome is still okay.
> 
> I don't think updating the handler later is valid.

In which case fixing this is going to be interesting.

>> Jürgen, looking at pci_xen_initial_domain(), what's the purpose of
>> the loop in the final if()? Can this ever do anything useful when
>> the earlier comment suggests nr_legacy_irqs() is zero anyway? Or is
>> the comment simply inaccurate in not covering the "no IO-APICs" case?
> 
> No, I think the final loop would only do something in case probe_8259A()
> is detecting a working PIC (which should not be the case IMHO). Could it
> be that there have been Xen versions emulating a PIC?

Not as far back as I can recall (for PV Dom0). Even in 3.2 Dom0 was
already denied access to the respective I/O ports. And iirc upstream
Linux wants at least 4.0?

Jan

