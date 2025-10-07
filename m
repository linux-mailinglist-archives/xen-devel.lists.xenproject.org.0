Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AF7BC1D27
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 16:56:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138963.1474534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v696u-0001x4-3r; Tue, 07 Oct 2025 14:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138963.1474534; Tue, 07 Oct 2025 14:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v696u-0001ud-1F; Tue, 07 Oct 2025 14:56:16 +0000
Received: by outflank-mailman (input) for mailman id 1138963;
 Tue, 07 Oct 2025 14:56:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v696s-0001uX-OC
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 14:56:14 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3e7adc6-a38d-11f0-9809-7dc792cee155;
 Tue, 07 Oct 2025 16:56:12 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-62fca216e4aso1575962a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Oct 2025 07:56:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63788111e1dsm12440054a12.40.2025.10.07.07.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 07:56:11 -0700 (PDT)
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
X-Inumbo-ID: c3e7adc6-a38d-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759848972; x=1760453772; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sxipmu1et9ScRqXhIPTG35ZU1uL07U23klRM39H128c=;
        b=CUhih7F5/kkviqL7Wb4RSJLqGbEBOniTqZBK9ApoV05gp2YC5o5BgSzFBBerqGSTk5
         7QxXMAYSu1giwf7V4VJ/xTBlRbEvHfGoy7+7wyAIkzzJw29n861VNgXHTR32FceCrRYY
         za4JB3pRyuJuzCJstMqReO2fDZbk8d0cVBiintyGyPSQw69KPyTC4c2jRaduzdkSIW3L
         mjWcJq8SfZJJDh35UWY8DWwWwQQ/IUxjYJ1y5kwxVA3Ni1pPssBWTWOSJyhfddgPHKvZ
         qcDuaEcs2KKCICcPIc+b+B1ZuUaXCT/EBMmnOQ6zFeavtNv6WFSobc6sdwDEU6W91evO
         XgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759848972; x=1760453772;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxipmu1et9ScRqXhIPTG35ZU1uL07U23klRM39H128c=;
        b=OPbe5LVcvq7UbWxJdChMguv9iAAg6a2/HsW7N9w/sd0DbaQheoDsiMHyLLZHaACcIM
         FID6xHyoGJP6nG2/2QWTem4d/AZ9asV6NE5NXaeSfFt1ItnxKsoYi3hkiPe5qVK0r9+L
         /OQwJ/i2uWsc+DDE2UzITxeM38h5wDPUkew+fbwnEhltIC4wAeh7aH/Eat11f3rUnYBO
         j2EpzXJ3dXyDas8mNdy6kCkUrVSUnNRyExI3Kw6z6xcnaS/+juCrsKjtY0l6uLKdRZH1
         K49teKrEMSvYO/cChSSdcrbpGdbx1MKMYomLWrabudrNBQ3T5QnVV/6mCJkGN0VWZu+W
         fP4A==
X-Gm-Message-State: AOJu0YwzxQjqqJdRECbvI5IGzhjDRDbD6xINHbjr95Oq/v+BdReUyCCz
	O6WSeiUbWOYKRk7NJVPiRGWXiZ8qMV8fX//oKalQS/2IwFyxH0tciZ+CryVEoOTuMA==
X-Gm-Gg: ASbGncv5uew0ca+x9UnDZHsTZxsvlFDdZ9OBch4vnfj3mXTtYydqUQ+n79XjlshwmRW
	gPznXACn8ik3zvETChI40GUmew0D2tkqV2OWZZwFtGFe6azTqIPCbpQUWMrx8RJZfFE3R2zpIY/
	TG0g3EuN4T5x6RjXYQiABkSRUXvDYLSHj4DttnruV++pIMkNdKHs/8os7XAgGBnUVtEA6GUl5xQ
	ZVwEYuZ74VWBt1RB7kZ0RIBto5CLn9dY8VLteqfv6YjRerYuM5XJSiSCs9yHp+PZmyVJ4LijSGL
	ac5Kkw3qY8y6sdG0dKux4ccs1qtutnx8OqSpNBy9DoK/P01c2nCySkx0X/LkSADD18eQydRITdT
	6eam2bekKCeFIjQVB8hBj7rAM0y4yLAShJWViu/lPpNOCnWd9xyo/H6n1W5rMtMBUiC5CfX0hXD
	UZX3EuM+idzHUvbN4KHdZnsndkRxBUBGE=
X-Google-Smtp-Source: AGHT+IGEPmoCXyVjGMOUyh4RJBJjVIZDcltlkqawVBhV5amVl63kf806eebglFtf9B6jJIrnbvehaA==
X-Received: by 2002:a05:6402:4402:b0:634:a23e:df26 with SMTP id 4fb4d7f45d1cf-639baf1c977mr5096709a12.6.1759848971578;
        Tue, 07 Oct 2025 07:56:11 -0700 (PDT)
Message-ID: <b5cdb1e8-0543-4025-b95a-eb57ac51caa8@suse.com>
Date: Tue, 7 Oct 2025 16:56:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] vpci/msix: improve handling of bogus MSI-X
 capabilities
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <20250929084149.70560-1-roger.pau@citrix.com>
 <2d1737a7-58e3-48e3-ac16-1bda3947c929@amd.com> <aON72Sq6ZJ6y95DI@Mac.lan>
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
In-Reply-To: <aON72Sq6ZJ6y95DI@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.10.2025 10:20, Roger Pau Monné wrote:
> On Fri, Oct 03, 2025 at 11:29:40PM -0400, Stewart Hildebrand wrote:
>> On 9/29/25 04:41, Roger Pau Monne wrote:
>>> I've had the luck to come across a PCI card that exposes a MSI-X capability
>>> where the BIR of the vector and PBA tables points at a BAR that has 0 size.
>>>
>>> This doesn't play nice with the code in vpci_make_msix_hole(), as it would
>>> still use the address of such empty BAR (0) and attempt to crave a hole in
>>
>> s/crave/carve/
>>
>>> the p2m.  This leads to errors like the one below being reported by Xen:
>>>
>>> d0v0 0000:22:00.0: existing mapping (mfn: 181c4300 type: 0) at 0 clobbers MSIX MMIO area
>>>
>>> And the device left unable to enable memory decoding due to the failure
>>> reported by vpci_make_msix_hole().
>>>
>>> Introduce checking in init_msix() to ensure the BARs containing the MSI-X
>>> tables are usable.  This requires checking that the BIR points to a
>>> non-empty BAR, and the offset and size of the MSI-X tables can fit in the
>>> target BAR.
>>>
>>> This fixes booting PVH dom0 on Supermicro AS -2126HS-TN severs with AMD
>>> EPYC 9965 processors.  The broken device is:
>>>
>>> 22:00.0 SATA controller: Advanced Micro Devices, Inc. [AMD] FCH SATA Controller [AHCI mode] (rev 93)
>>>
>>> There are multiple of those integrated controllers in the system, all
>>> broken in the same way.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>> Cc: Jan Beulich <jbeulich@suse.com>
>>> Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>
>>> While not strictly a bugfix, I consider this a worthy improvement so that
>>> PVH dom0 has a chance to boot on hardware that exposes such broken MSI-X
>>> capabilities.  Hence I think this change should be considered for inclusion
>>> into 4.21.  There a risk of regressing on hardware that was already working
>>> with PVH, but given enough testing that should be minimal.
>>> ---
>>>  xen/drivers/vpci/msix.c | 50 ++++++++++++++++++++++++++++++++++++-----
>>>  1 file changed, 45 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
>>> index 54a5070733aa..8458955d5bbb 100644
>>> --- a/xen/drivers/vpci/msix.c
>>> +++ b/xen/drivers/vpci/msix.c
>>> @@ -675,6 +675,51 @@ static int cf_check init_msix(struct pci_dev *pdev)
>>>      if ( !msix )
>>>          return -ENOMEM;
>>>  
>>> +    msix->tables[VPCI_MSIX_TABLE] =
>>> +        pci_conf_read32(pdev->sbdf, msix_table_offset_reg(msix_offset));
>>> +    msix->tables[VPCI_MSIX_PBA] =
>>> +        pci_conf_read32(pdev->sbdf, msix_pba_offset_reg(msix_offset));
>>> +
>>> +    /* Check that the provided BAR is valid. */
>>> +    for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
>>> +    {
>>> +        const char *name = (i == VPCI_MSIX_TABLE) ? "vector" : "PBA";
>>> +        const struct vpci_bar *bars = pdev->vpci->header.bars;
>>> +        unsigned int bir = msix->tables[i] & PCI_MSIX_BIRMASK;
>>> +        unsigned int type;
>>> +        unsigned int offset = msix->tables[i] & ~PCI_MSIX_BIRMASK;
>>> +        unsigned int size =
>>> +            (i == VPCI_MSIX_TABLE) ? max_entries * PCI_MSIX_ENTRY_SIZE
>>> +                                   : ROUNDUP(DIV_ROUND_UP(max_entries, 8), 8);
>>> +
>>> +        if ( bir >= ARRAY_SIZE(pdev->vpci->header.bars) )
>>
>> This assumes a type 0 header. For type 1 headers, bir values 2 and up are
>> also reserved.
> 
> Right, but those BARs will be set as VPCI_BAR_EMPTY for type 1 headers.
> The check here is to avoid doing an out of bounds array access, the
> check for validity of the pointed BAR is done below.
> 
>>
>>> +        {
>>> +            printk(XENLOG_ERR "%pp: MSI-X %s table with out of range BIR %u\n",
>>> +                   &pdev->sbdf, name, bir);
>>
>> Nit: placing the cleanup label at the end of the function and using 'rc' would
>> make it more amenable to future uses.
> 
> The issue with that is that we then end up with a structure like:
> 
>     return vpci_make_msix_hole();
> 
>  error:
>     xfree();
>     return rc;
> 
> Which I don't like much because of the double usage of return (it's a
> taste issue TBH).
> 
> My motivation for using a goto is that they are conceptually the same
> error path, but we provide different log messages to aid in debugging
> the issue.  Otherwise all checks will be done in a single condition.

I agree here, yet I'd like to point out that (iirc) Misra wants us to use
only forward goto-s (which imo is a mistake, but I don't expect they're
going to change their minds). So flipping where the label and goto are
may be desirable.

Jan

