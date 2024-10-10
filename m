Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E06E1997DFB
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 08:58:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815544.1229514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syn7b-0002rN-7j; Thu, 10 Oct 2024 06:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815544.1229514; Thu, 10 Oct 2024 06:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syn7b-0002pk-4v; Thu, 10 Oct 2024 06:58:03 +0000
Received: by outflank-mailman (input) for mailman id 815544;
 Thu, 10 Oct 2024 06:58:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syn7a-0002pe-8R
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 06:58:02 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd14885b-86d4-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 08:58:01 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a9932aa108cso92421966b.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 23:58:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80dc290sm42184466b.155.2024.10.09.23.57.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 23:58:00 -0700 (PDT)
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
X-Inumbo-ID: fd14885b-86d4-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728543480; x=1729148280; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3f1cs4vRMiAIR0Tyerecg8LrYpdr8hdkQ11FEYfW0sw=;
        b=SKfGC0q16vOfwl5dTYqPwacT4pgn2AuMp9U4G8eoAJOsnSjtnGm/odpjGZLSe4zp9y
         FROKdDZvKwfe8vEDoof/CETYNeW60TpUm3eclT0qX8vHoEfIjQyZZKPVLvQlOhuYDbF1
         18dPiMOMx89WzDIeNvrl+pf+dqzr/R7MDVhXM73hnietDKAmCbbRSAvvtEKdzCNB8Z8R
         GfNQ5Fy1zpED6HJI511ERuvDMv9BR7W9G1w+q4FjsDdj2JZtZ9Ljvxbq05tbX4BBLRnE
         NLjPIWHxCy+GxLxNyoehCjFGa3PXj8z4wm4bSKXE0rxylwVvQXfNgLknMvMJK7hRhfFi
         NCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728543480; x=1729148280;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3f1cs4vRMiAIR0Tyerecg8LrYpdr8hdkQ11FEYfW0sw=;
        b=wOP3Nb50lZraGYCWZB7wmAPdaad3UPbTizJ8xNYaSDVvTj2cwUtPBH4jn5VsX+VRLo
         40oIxvGYI4tipONW8uscB5pt/4BxTZ1AjFFIcBiKKog58x5Ceb/binMxl8M6T0uwjQ74
         7hkceqYoN+dFPbNzHDsdAPn58RtAJAgVBLL6JmNvqul327vRFeztYfWcRpwMB6XfLUbs
         uUcbrD0R5vxqd+/nsy/jBq7JcORhgG6BxfSCLfcyTseHCi/yQuQIdKw3cCB6L/uWeaJt
         bhIXwTTp7h06h3HG9Gz4S60d24/5FESJx33I898ffQYUVdnEv9vUyh2qwbXBGJR9rzcU
         x1Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWoO+/2nne0z5XSTBI3wYeejKawN9AXxRn6yPqZXOwsvs/mKZEuJevCHpIm5GxOoVlXNlh1laSyeoM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpaoRMe9L3u7KtRJ04rlD/o/GYygPKxuXhtkEpH4HsuzAUO8cB
	v14vs71VTdzc6DlWsNli7kpMS+wQrRU84O4U9AmQxLVsIdVaV2Ua/4PO8RHSqg==
X-Google-Smtp-Source: AGHT+IEFKwY2BDjwUt0kJvdbl6wMoBik8+q0V/TAGDkvOIHWQeOiCG+R1J/xS+HI1bKFiciSsCPTKw==
X-Received: by 2002:a17:907:8688:b0:a99:76a4:7052 with SMTP id a640c23a62f3a-a998d34db43mr463200366b.65.1728543480335;
        Wed, 09 Oct 2024 23:58:00 -0700 (PDT)
Message-ID: <28061203-6e40-473e-a231-291e6c62fba6@suse.com>
Date: Thu, 10 Oct 2024 08:57:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] x86/msi: fix locking for SR-IOV devices
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20240827035929.118003-1-stewart.hildebrand@amd.com>
 <0742fd21-d606-440a-a7fa-dd3bfccfa1c4@suse.com>
 <695c81b1-1cc0-40f2-ba41-8c96a461c668@amd.com>
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
In-Reply-To: <695c81b1-1cc0-40f2-ba41-8c96a461c668@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.10.2024 21:44, Stewart Hildebrand wrote:
> On 8/28/24 06:36, Jan Beulich wrote:
>> On 27.08.2024 05:59, Stewart Hildebrand wrote:
>>> --- a/xen/drivers/passthrough/pci.c
>>> +++ b/xen/drivers/passthrough/pci.c
>>> @@ -341,6 +341,8 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>>>  
>>>      list_add(&pdev->alldevs_list, &pseg->alldevs_list);
>>>  
>>> +    INIT_LIST_HEAD(&pdev->physfn.vf_list);
>>
>> There is a certain risk with doing such uniformly when the field is part
>> of a union. Yes, little initialization has happened up to here, but I'm
>> still concerned. (One of the reasons I don't like the struct list_head
>> instances to be split, despite your legitimate point regarding naming.)
>> At the very least this wants moving yet earlier in the function, before
>> the new struct is passed anywhere else.
> 
> Understood. I personally have a slight preference for keeping the entry
> and head names distinct, so I'll plan to move the initialization
> earlier. However, I could easily be convinced to un-split the struct
> list_head instances if that's your preference. Let me know.

I indicated before that this would be my preference, without meaning to
insist on this folding.

>>> +                list_for_each_entry_safe(vf_pdev, tmp, &pdev->physfn.vf_list,
>>> +                                         virtfn.entry)
>>> +                    ret = pci_remove_device(vf_pdev->sbdf.seg,
>>> +                                            vf_pdev->sbdf.bus,
>>> +                                            vf_pdev->sbdf.devfn) ?: ret;
>>
>> And if this fails, the VF will still remain orphaned. I think in the
>> model I had suggested no such risk would exist.
>>
>> Misra also isn't going to like the recursion here.
> 
> With the ASSERTs being addressed directly, there's no need to remove
> the VFs right away with the PF.
> 
> BTW, I don't think refusing a removal "request" would be a good idea.
> Dom0 isn't really requesting the device to be removed. Dom0 has already
> removed the device (e.g. in response to hot-unplug or SR-IOV disable),
> and is merely informing Xen of the removal.

Just to clarify: I don't mean returning an error here to indicate
"refusal". As you say, this is merely a notification. Yet I think it's
still legitimate to pass back an error. Whether the Dom0 kernel can
do anything useful with that error is a separate question.

> So during PF removal, I'll plan (for v5) to unlink the the VFs from the
> PF, and continue to rely on dom0 to inform Xen of PF and VF removal
> individually. By unlink, I mean set vf_pdev->virtfn.pf_pdev = NULL and
> remove the VFs from the list. Probably also set vf_pdev->broken = true.

As to the latter - yes. For the rest I guess I need to see the new code.

Jan

