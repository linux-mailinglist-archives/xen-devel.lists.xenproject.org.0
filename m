Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38767AE5EA8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 10:06:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023301.1399257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTyf8-0001Vb-Nj; Tue, 24 Jun 2025 08:05:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023301.1399257; Tue, 24 Jun 2025 08:05:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTyf8-0001Tr-Ks; Tue, 24 Jun 2025 08:05:50 +0000
Received: by outflank-mailman (input) for mailman id 1023301;
 Tue, 24 Jun 2025 08:05:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTyf7-0001Tj-0L
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 08:05:49 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08c749a8-50d2-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 10:05:47 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so4234438f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 01:05:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f118ea2esm8317814a12.7.2025.06.24.01.05.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 01:05:45 -0700 (PDT)
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
X-Inumbo-ID: 08c749a8-50d2-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750752346; x=1751357146; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BBKazxvzJ8Fm94ZBi7O25USsSSV4tLiKTWTkxYJUPrs=;
        b=YiUQN4b8vLiRJe+lWH672u9NBR1zWBIXAQs3K80BHKp0zUcGH5f03U9VK7MO0cPTgE
         0YAw93/ULo1noH6vadS2/rBB6V5Vau/2MS2fXZy2R9QsTK68aElGTwssxIQjEakY/S5n
         HwZpue967HxhktplZP/l06Q0PFaqFd32NVqHOWFNCFCYOPSVqrow9Dw63wjlWVcNLqJ/
         9Dlh8rLeAQknvUoJu7WxyxfITesVl4lkWAcpWZ8G00GlOzmOc4wu3lnOeuBhenZIwXAQ
         rSrW4SIq1/BSCOXFH/RvEpa8joCB0Yi9xCDq++4J8GmjMNZBKIOmT3BnyuRalOMxZ5EI
         0bbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750752346; x=1751357146;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBKazxvzJ8Fm94ZBi7O25USsSSV4tLiKTWTkxYJUPrs=;
        b=YoAPoodiIs1z5yCpNiq1zZLuFmAycEvty/m+IeSEap2vnAbjywkQNPfEcIzkr9x/9V
         Vpj7szM3IbgIPcaIDm7ymEGb/+YrxkcrQWJ6/8MhAnnxCWaUcuI3AZLeAftDW/U+gTE8
         hs2Yg1Zq7jnrnyvkEMGoMVkveh1iXO67mBbB0T6TeN39m0URJbkdF8PbY3dgV2WIhBKG
         P8bpcelUsWMP8RZQcEJp+PLMyZooxlSxvfajnPqE7szvKCwzixwMuXLS+mUhrRY04YMm
         PvT27QEqw9eUtCyrZsgafmOjHlP5RuPsoWhbHOhlstnT2/nZGudXdtP6I0/dlTh209T6
         L3yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz+WoEkxF42gg+PKQxDKj0/lGcAYm255UpqzXM5RVHhlUiKZcnhamzTvphfsIfIf4lXdDrzL4qjd8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxH38VLCNz7Tq/Cmrj+cvbGg/FkzNCu5pQByJiOkABYk1F6xnoD
	M43EBgUT3A9HiJCWyUFScz54IDAi6orku9QF29PVJya8C/1rFr0MdGpV5AYWdfXMGQ==
X-Gm-Gg: ASbGncvSv/tRzXbvU69nH3oynDeq42xkP9YtHGObQ0nCk1CjnIBRzecjun+mx85RJ1M
	N7uGgYIzIh9YvqrmB1eOlt3Yw1UEtfdh+/8pZK6Y3med2CWU9cDNIBcK9IgcMW3KwNg7Gsx3Fg4
	Ib6n7LmO3JkCLcszBFv/l4ckmuVA3JLw+MQVx8rhIx5ZLH6pNwIjshRhcxdIoyPi5YG7zC68gUk
	lHRvlP8lZWXzdlAhzp4UsrooBTNU3DkJ2ALQmaFkFkfjkDU3Q1vwLPbU3bVo4qAfn/kaM2UCGO8
	n18ycWvrjxxpC7GoGbbIgmyhnFFRjWIXxGgkTEawUhK4H6sHcd94ENwRfuHRLTukoi0FU/W5WEv
	pmmuxEYzUP1NvqDOEPmHJAdLJOz1MUDAwh8VZTTB5EBXCFaw=
X-Google-Smtp-Source: AGHT+IFNyP+CJTgUfZHZDIosdc6RJ5qDfxwe8oFudZ3DjzF+XqxjuOlUQ5VS7E5ePfEUc34h4PsVPQ==
X-Received: by 2002:a05:6000:2912:b0:3a4:fbd9:58e6 with SMTP id ffacd0b85a97d-3a6d12eb835mr10923314f8f.50.1750752346357;
        Tue, 24 Jun 2025 01:05:46 -0700 (PDT)
Message-ID: <5c4b186e-686e-4fc8-bcf1-854bc1f5ec8b@suse.com>
Date: Tue, 24 Jun 2025 10:05:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-3-Jiqian.Chen@amd.com>
 <516a3adc-320d-46ce-b235-8ef91469abcf@suse.com>
 <BL1PR12MB5849F696814E17D20012BAC2E77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <227df6d3-a2c3-4576-bde9-d8057c378e7a@suse.com>
 <BL1PR12MB5849C69BD1485B1B98F7D0FDE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849C69BD1485B1B98F7D0FDE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2025 10:02, Chen, Jiqian wrote:
> On 2025/6/20 14:38, Jan Beulich wrote:
>> On 19.06.2025 08:39, Chen, Jiqian wrote:
>>> On 2025/6/18 22:05, Jan Beulich wrote:
>>>> On 12.06.2025 11:29, Jiqian Chen wrote:
>>>>> --- a/xen/drivers/vpci/msix.c
>>>>> +++ b/xen/drivers/vpci/msix.c
>>>>> @@ -703,9 +703,13 @@ static int cf_check init_msix(struct pci_dev *pdev)
>>>>>      pdev->vpci->msix = msix;
>>>>>      list_add(&msix->next, &d->arch.hvm.msix_tables);
>>>>>  
>>>>> -    return 0;
>>>>> +    spin_lock(&pdev->vpci->lock);
>>>>> +    rc = vpci_make_msix_hole(pdev);
>>>>> +    spin_unlock(&pdev->vpci->lock);
>>>>
>>>> If you add a call to vpci_make_msix_hole() here, doesn't it need (or at
>>>> least want) removing somewhere else? Otherwise maybe a code comment is
>>>> warranted next to the new call site?
> Sorry, I misunderstood you in my last email.
> After here's change, it seems the call in modify_decoding() is redundant.
> What's your taste? Removing the call in modify_decoding() or adding a code comment?

I'd prefer the other call to be dropped if it's provably redundant. But Roger
has the final say here anyway.

>>> The removing operation in modify_bars() and vpci_deassign_device() is not enough?
>>
>> I fear I don't understand this reply of yours. Which suggests that the patch
>> description may want extending as to this part of the change.
>>
>>>>> @@ -29,9 +30,22 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
>>>>>   */
>>>>>  #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
>>>>>  
>>>>> -#define REGISTER_VPCI_INIT(x, p)                \
>>>>> -  static vpci_register_init_t *const x##_entry  \
>>>>> -               __used_section(".data.vpci." p) = (x)
>>>>> +#define REGISTER_VPCI_CAPABILITY(cap, finit, fclean, ext) \
>>>>> +    static const vpci_capability_t finit##_t = { \
>>>>> +        .id = (cap), \
>>>>> +        .init = (finit), \
>>>>> +        .cleanup = (fclean), \
>>>>> +        .is_ext = (ext), \
>>>>> +    }; \
>>>>> +    static const vpci_capability_t *const finit##_entry  \
>>>>> +        __used_section(".data.rel.ro.vpci") = &finit##_t
>>>>
>>>> Could you remind me why the extra level of indirection is necessary here?
>>>> That is, why can't .data.rel.ro.vpci be an array of vpci_capability_t?
>>> You mean I should change to be:
>>> #define REGISTER_VPCI_CAPABILITY(cap, finit, fclean, ext) \
>>>     static const vpci_capability_t finit##_t \
>>>         __used_section(".data.rel.ro.vpci") = { \
>>>         .id = (cap), \
>>>         .init = (finit), \
>>>         .cleanup = (fclean), \
>>>         .is_ext = (ext), \
>>>     }
>>>
>>> Right?
>>
>> Yes, subject to the earlier comments on the identifier choice.
> Got it.
> One more question, if change to be that, then how should I modify the definition of VPCI_ARRAY?
> Is POINTER_ALIGN still right?

Yes. The struct doesn't require bigger alignment afaics. (In fact in principle
no alignment should need specifying there, except that this would require
keeping the section separate in the final image. Which I don't think we want.)

> Since I encountered errors that the values of __start_vpci_array are not right when I use them in vpci_init_capabilities().

Details please.

Jan

