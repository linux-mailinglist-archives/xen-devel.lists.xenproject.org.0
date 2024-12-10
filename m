Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EED69EB094
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 13:15:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852223.1266078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKz8r-0005GD-My; Tue, 10 Dec 2024 12:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852223.1266078; Tue, 10 Dec 2024 12:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKz8r-0005EL-Jg; Tue, 10 Dec 2024 12:15:05 +0000
Received: by outflank-mailman (input) for mailman id 852223;
 Tue, 10 Dec 2024 12:15:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKz8q-0005EF-Se
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 12:15:04 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 621f79e7-b6f0-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 13:15:02 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-434e69857d9so18468325e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 04:15:02 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:8df1:d232:d9a2:1ff9?
 (p200300cab746063c8df1d232d9a21ff9.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:8df1:d232:d9a2:1ff9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-435d4cd4a78sm15432415e9.28.2024.12.10.04.15.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 04:15:01 -0800 (PST)
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
X-Inumbo-ID: 621f79e7-b6f0-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733832902; x=1734437702; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VN/XkDuVaTjolMOyGf7nGyHdqQnIcuNJJVWfTZMVHSA=;
        b=N+NM4r9hNymfzVRw/rtgXXStVHL2Gw9lGD/AFnOkXIqqnrSc+XGQEaVSLhd5asGoJi
         vptJpykasJjFkyRonmtmoLX8tRLASRoJJHUZZsTAo2MhHNh03rRC2gra2D+ZdUsGbtdR
         20vITjb5q+XGpSHfQQzYOUE797kANefL5x7M9ZSAegfw2ZvQPTb1UPPz/5ML0PAH/uGs
         AiqUH2NaynlY1ib1pYOMkaVCMlMLw25Jhb3SWTukKuxoJPES7GK/PM+/mB3MEb0luCzm
         l7mJqDCh5/fgmXvHcQ0yD1Z4a0RkeEbvw8ZjEK8itSoq7Dke/VmFmulpQt+jhS/JTleI
         v9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733832902; x=1734437702;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VN/XkDuVaTjolMOyGf7nGyHdqQnIcuNJJVWfTZMVHSA=;
        b=nxMHyoPxm69dAh3bt2vpiP2+bpWkqahMlZ7aRZL0jb5eKMk8SIRMEcY2+GEulAsHfa
         5jOxhNnFLJqVJDVwgYT5Xp11l1CFDuVHx0vj8u5XsKxETlrveZ13riHUgqYDTx/GOAPw
         emKBElYhKs0fMTPivo0hylbCir3wOwJ+DZmACkcH4iBV71ApDpdbU/gPwDvLPSMLnMIt
         BvTSLu2Ywt9WSJbEIiSjb6+ULKQWdGKrNLD40k6XWxhdlT1SH7xPpkvPcjISSBykuJvq
         VNBq+GEiAjHbWY6OfnTbp8UuSBBlfemRiuOvltVMsW4MCaKkbB52YSjWa5UFhB96YBpE
         E2Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUSF2TCbIQn78d3WtPluItu0O2dlFiDZeoY8rD1SQVJstmzgnDBLLhTnfA1z4n8rdGfLG9zDG0DwcY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEOntdSrLNUKK/JBR2Q6c0ewnvi5P/gOCs49bnjAixnlPzxPZW
	V7KXvjmzx+gOPY9T2LrQfv+ctPY0uhogtn68/t/02Ca4B1Gk37UidtTRzpHDSQ==
X-Gm-Gg: ASbGnctQsJxZykvblLTWa6O7A1H7HLHITz29S8wp5ToCAxWAFnqPg3BnV9Di+2givYT
	FmcipfS79Jy9vUyi9zAYiaCiMZ5jHT2DLctri6SY8WYrLwSRGZJ6Uhd1UHSotpHLh7onHifltR+
	VUfcgh+4Tj98ne74Tg+uJz1wEolOvZKVrtNzk1eNf44f7D/l00fjllupxQQ9cDjH5DVQ7kltiRJ
	/gXKfX/AEXTijdG9A03yevAUU31+k+w33L0fqhwvq9QpbjpF9Ifr03c91Pd7fXvdSveINL2+d9H
	K3Ew3wMs00f9WUi++it1hJ2HBk/BReMxKz9TYydp4xZDCuYXZOMK99CjayqL17Fs73zYr44YRIm
	b4sZLblmysg==
X-Google-Smtp-Source: AGHT+IESlpRT9UqqU1MpPU2RVpcxcxGVuYoc9i+dSELlevqa/ftR1J9ZyoIBmRo42ahrwYs7YaTujA==
X-Received: by 2002:a05:600c:4ed2:b0:434:e69c:d338 with SMTP id 5b1f17b1804b1-43502182706mr21046805e9.5.1733832902136;
        Tue, 10 Dec 2024 04:15:02 -0800 (PST)
Message-ID: <e3231310-0041-44f8-b92b-989992c64d0a@suse.com>
Date: Tue, 10 Dec 2024 13:15:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] vpci: Add resizable bar support
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, "Huang, Ray"
 <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20241202060956.1124162-1-Jiqian.Chen@amd.com>
 <4e4df0ee-67f6-41e3-bfc7-e78011680015@suse.com>
 <BL1PR12MB58499BEB287C4F9711324F71E73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <1e0576d9-400e-4483-8dd1-061e215a00cd@suse.com>
 <BL1PR12MB584945F11C271CE137231F7BE73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <a07bca59-90d2-4a84-bb47-59157bf5207d@suse.com>
 <Z1glF5FJjnSzRqsB@macbook.local>
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
In-Reply-To: <Z1glF5FJjnSzRqsB@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.12.2024 12:25, Roger Pau Monné wrote:
> On Tue, Dec 10, 2024 at 10:54:43AM +0100, Jan Beulich wrote:
>> On 10.12.2024 08:57, Chen, Jiqian wrote:
>>> On 2024/12/10 15:17, Jan Beulich wrote:
>>>> On 10.12.2024 08:07, Chen, Jiqian wrote:
>>>>> On 2024/12/9 21:59, Jan Beulich wrote:
>>>>>> On 02.12.2024 07:09, Jiqian Chen wrote:
>>>>>>> +static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
>>>>>>> +                                      unsigned int reg,
>>>>>>> +                                      uint32_t val,
>>>>>>> +                                      void *data)
>>>>>>> +{
>>>>>>> +    uint64_t size;
>>>>>>> +    unsigned int index;
>>>>>>> +    struct vpci_bar *bars = data;
>>>>>>> +
>>>>>>> +    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
>>>>>>> +        return;
>>>>>>
>>>>>> I don't think something like this can go uncommented. I don't think the
>>>>>> spec mandates to drop writes in this situation?
>>>>> Spec says: Software must clear the Memory Space Enable bit in the Command register before writing the BAR Size field.
>>>>> This check is suggested by Roger and it really helps to prevent erroneous writes in this case,
>>>>> such as the result of debugging with Roger in the previous version.
>>>>> I will add the spec's sentences as comments here in next version.
>>>>
>>>> What you quote from the spec may not be enough as a comment here. There's
>>>> no direct implication that the write would simply be dropped on the floor
>>>> if the bit is still set. So I think you want to go a little beyond just
>>>> quoting from the spec.
>>> How about quoting Roger's previous words: " The memory decoding must be disabled before writing the BAR size field.
>>> Otherwise changing the BAR size will lead to the active p2m mappings getting out of sync w.r.t. the new BAR size." ?
>>
>> That'll be better, but imo still not enough to explain the outright ignoring
>> of the write.
> 
> I think we might want to do something along the lines of:
> 
> uint64_t size = PCI_REBAR_CTRL_SIZE(val);
> struct vpci_bar *bar = data;
> 
> if ( bar->enabled )
> {
>     if ( size == bar->size )
>         return;
> 
>     /*
>      * Refuse to resize a BAR while memory decoding is enabled, as
>      * otherwise the size of the mapped region in the p2m would become
>      * stale with the newly set BAR size, and the position of the BAR
>      * would be reset to undefined.  Note the PCIe specification also
>      * forbids resizing a BAR with memory decoding enabled.
>      */
>     gprintk(XENLOG_ERR,
>             "%pp: refuse to resize BAR with memory decoding enabled\n",
> 	    &pci->sbdf);
>     return;
> }
> 
> Note this requires that the data parameter points to the BAR that
> matches the ReBAR control register, this needs adjusting in
> init_rebar().

SGTM.

>>>>>>> +        if ( rc )
>>>>>>> +        {
>>>>>>> +            printk("%pp: add register for PCI_REBAR_CAP failed (rc=%d)\n",
>>>>>>> +                   &pdev->sbdf, rc);
>>>>>>> +            break;
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
>>>>>>> +                               rebar_offset + PCI_REBAR_CTRL, 4,
>>>>>>> +                               pdev->vpci->header.bars);
>>>>>>> +        if ( rc )
>>>>>>> +        {
>>>>>>> +            printk("%pp: add register for PCI_REBAR_CTRL failed %d\n",
>>>>>>> +                   &pdev->sbdf, rc);
>>>>>>> +            break;
>>>>>>
>>>>>> Is it correct to keep the other handler installed? After all ...
>>>>> Will change to "return rc;" here and above in next version.
>>>>
>>>> I'm not convinced this is what we want, as per ...
>>>>
>>>>>>> +        }
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    return 0;
>>>>>>
>>>>>> ... you - imo sensibly - aren't communicating the error back up (to allow
>>>>>> the device to be used without BAR resizing.
>>>>
>>>> ... what I said here.
>>> Sorry, I didn’t understand.
>>> Do you mean it is not enough to return error code once a handler failed to be installed, I need to remove the already installed handlers?
>>
>> No, if you return an error here, nothing else needs doing. However, I
>> question that returning an error here is good or even necessary. In
>> the event of an error, the device ought to still be usable, just
>> without the BAR-resizing capability.
> 
> So you suggest that the capability should be hidden in that case?

Yes.

>  We
> have logic to hide capabilities, just not used for the hardware
> domain.  It would need some extra wiring to be capable of hiding
> failed capabilities.

Indeed.

Jan

