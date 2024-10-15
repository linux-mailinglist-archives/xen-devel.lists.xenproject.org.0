Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FFD99DE8F
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 08:39:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818975.1232266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0bCn-00035U-V0; Tue, 15 Oct 2024 06:38:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818975.1232266; Tue, 15 Oct 2024 06:38:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0bCn-00032g-R2; Tue, 15 Oct 2024 06:38:53 +0000
Received: by outflank-mailman (input) for mailman id 818975;
 Tue, 15 Oct 2024 06:38:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ic8h=RL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t0bCm-00032a-A2
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 06:38:52 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22a372e7-8ac0-11ef-99a2-01e77a169b0f;
 Tue, 15 Oct 2024 08:38:49 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37d447de11dso3619073f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2024 23:38:50 -0700 (PDT)
Received: from ?IPV6:2003:ca:b721:c8b5:94fc:ce22:8335:8123?
 (p200300cab721c8b594fcce2283358123.dip0.t-ipconnect.de.
 [2003:ca:b721:c8b5:94fc:ce22:8335:8123])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d7fa87775sm725509f8f.27.2024.10.14.23.38.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 23:38:49 -0700 (PDT)
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
X-Inumbo-ID: 22a372e7-8ac0-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728974330; x=1729579130; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5iSnmjekMrgf9MsLKJnZ3l+1ZJpzo13Ep98ZVlmlM+Q=;
        b=Kqd2zkAQ/inhye0ZvM+OmeipwzF18XJBsdU0pLYXddfeOR9FFFT2ubMfdGhCYsCDJW
         jXxWMmsBe6N4Gl8rTzip0QRz00oS8Y7F27KFxCIJuavfgiE0oNNA6886CXfkjZ6vJXe8
         87GXHKHTcQ+9ZY+bu7TAfAtoLZZurskRXbtSPIiRci4qHi5E4vGpIzPbe20pRdQm8658
         hu/J20DtvPkZxzS3t3LuIWVT3c3B2MDeiX990vK/3+6DnPqh+fhTxAF4KyUBAQly4ffc
         OSLi3TrDAKojoFr98M0TrTHBCGtIJNw6v1SJn+WxFZpwpETfrRV90DnbZZooCerYfpZX
         Q67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728974330; x=1729579130;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iSnmjekMrgf9MsLKJnZ3l+1ZJpzo13Ep98ZVlmlM+Q=;
        b=h1KqjCbZnBhOvOHmQZZ3GIyASLsP0n6NvfHtutBZ3+AQ2DUS3K8R99na7hF8ijujkM
         xShRwgnTqNq5GwP+mYzrV10piSg67A/WB0Aj6fcskNsiJzFMoIOk1IAkIfUMXN8ZJqlL
         JuIdokAX1ylUh7VO/jrSdah4bBrL+UuzrxaBoqH5KTFMzkCBdUKQHNYJ470DLcgd+z4t
         uBAxZ9g1rUqqGWg8xIhQpMDAnMogUM23E/u6cvkgewpAHrri7htldmuBtwGT70YpPJOo
         6XgQQAHt4zFtgvBcrJImMHC+fcl31uPI/Kkl3RaSZ7s416najok5v0bzmhtfMp68kKhV
         uF1w==
X-Forwarded-Encrypted: i=1; AJvYcCWetSrhNMPjCcHhSjUOGtERNcFPWXLcW2Q6jV6rjZa/wlDKtoBPXSpg1PaR1QtlFKz1nQ7bMkDmk1g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLRXelXspSPhjuXzJeWXKYixhGJPH2kvAeT5wNi6t8zgr0g2f9
	ZOuGCAks5WhNV5+NQKYONeUL2DAL7IRL2gAyHZ+fG0jdLY8yqWQN2E/5odXvmg==
X-Google-Smtp-Source: AGHT+IEBNnAyct2aztxNFyYd+Dwavw19IJsiELhFfQrhxxWe3f20oVh8KdLoDncZBEnEKacV7iEy4A==
X-Received: by 2002:adf:b35c:0:b0:369:9358:4634 with SMTP id ffacd0b85a97d-37d551d65aamr10875938f8f.19.1728974329703;
        Mon, 14 Oct 2024 23:38:49 -0700 (PDT)
Message-ID: <5b9b6623-cb35-44a5-b714-e13ad07aa8a5@suse.com>
Date: Tue, 15 Oct 2024 08:38:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/amd-vi: do not error if device referenced in IVMD
 is not behind any IOMMU
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Willi Junga
 <xenproject@ymy.be>, xen-devel@lists.xenproject.org
References: <20241008104706.74001-1-roger.pau@citrix.com>
 <d6489e43-2cfe-4ad7-824e-a3212367dbca@suse.com>
 <ZwY4ym2Gnlx4tytP@macbook.local>
 <5a2a4ff4-a2c7-46f6-bd18-a4837fe8d4c1@suse.com>
 <ZwZlVlU2nHkBedyo@macbook.local>
 <703fa416-c7d5-4862-a871-5831125c2e25@suse.com>
 <ZwZtR6ZTl2gUWN2T@macbook.local>
 <34f73ec6-0e10-41f4-8894-c367264afefc@suse.com>
 <ZwaHAqVGeeJNu4Dp@macbook.local>
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
In-Reply-To: <ZwaHAqVGeeJNu4Dp@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.10.2024 15:37, Roger Pau Monné wrote:
> On Wed, Oct 09, 2024 at 02:09:33PM +0200, Jan Beulich wrote:
>> On 09.10.2024 13:47, Roger Pau Monné wrote:
>>> On Wed, Oct 09, 2024 at 01:28:19PM +0200, Jan Beulich wrote:
>>>> On 09.10.2024 13:13, Roger Pau Monné wrote:
>>>>> I also think returning an error when no device in the IVMD range is
>>>>> covered by an IOMMU is dubious.  Xen will already print warning
>>>>> messages about such firmware inconsistencies, but refusing to boot is
>>>>> too strict.
>>>>
>>>> I disagree. We shouldn't enable DMA remapping in such an event. Whereas
>>>
>>> I'm not sure I understand why you would go as far as refusing to
>>> enable DMA remapping.  How is a IVMD block having references to some
>>> devices not assigned to any IOMMU different to all devices referenced
>>> not assigned to any IOMMU?  We should deal with both in the same
>>> way.
>>
>> Precisely because of ...
>>
>>> If all devices in the IVMD block are not covered by an IOMMU, the
>>> IVMD block is useless.
>>
>> ... this. We simply can't judge whether such a useless block really was
>> meant to cover something. If it was, we're hosed. Or maybe we screwed up
>> and wrongly conclude it's useless.
> 
> The same could be stated about devices in a IVMD block that are not
> assigned to an IOMMU: it could also be Xen that screwed up and wrongly
> concluded they are not assigned to an IOMMU.
> 
>>>  But there's nothing for Xen to action, due to
>>> the devices not having an IOMMU assigned.  IOW: it would be the same
>>> as booting natively without parsing the IVRS in the first place.
>>
>> Not really, no. Not parsing IVRS means not turning on any IOMMU. We
>> then know we can't pass through any devices. We can't assess the
>> security of passing through devices (as far as it's under our control)
>> if we enable the IOMMU in perhaps a flawed way.
>>
>> A formally valid IVMD we can't make sense of is imo no different from
>> a formally invalid IVMD, for which we would return ENODEV as well (and
>> hence fail to enable the IOMMU). Whereas what you're suggesting is, if
>> I take it further, to basically ignore (almost) all errors in table
>> parsing, and enable the IOMMU(s) in a best effort manner, no matter
>> whether that leads to a functional (let alone secure [to the degree
>> possible]) system.
> 
> No, don't take it further: not ignore all errors, I think we should
> ignore errors when the device in the IVMD is not behind an IOMMU.  And
> I think that should apply globally, regardless of whether all devices
> in the IVMD block fall in that category.
> 
> That will bring AMD-Vi inline with VT-d RMRR, as from what I can see
> acpi_parse_one_rmrr() doesn't care whether the device scope in the
> entry is behind an IOMMU or not, or whether the whole RMRR doesn't
> effectively apply to any device because none of them is covered by an
> IOMMU.
> 
>> What I don't really understand is why you want to relax our checking
>> beyond what's necessary for the one issue at hand.
> 
> This issue has been reported to us and we have been able to debug.
> However, I worry what other malformed IVMD blocks might be out there,
> for example an IVMD block that applies to a single device (type 21h),
> but such single device doesn't exist (or it's not behind an IOMMU).
> Maybe next time we simply won't get a report, the user will try Xen,
> see it's not working and move to something else.
> 
> I've taken a quick look at Linux, and when parsing the IVMD blocks
> there's no checking that referred devices are behind an IOMMU, the
> regions are just added to a list.

Hmm, okay, after some more chewing on it on this basis
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

