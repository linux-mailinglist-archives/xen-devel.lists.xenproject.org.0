Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 672F6A17CE6
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 12:21:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875393.1285844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taCIx-0004Iy-9S; Tue, 21 Jan 2025 11:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875393.1285844; Tue, 21 Jan 2025 11:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taCIx-0004GW-6W; Tue, 21 Jan 2025 11:20:23 +0000
Received: by outflank-mailman (input) for mailman id 875393;
 Tue, 21 Jan 2025 11:20:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gode=UN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1taCIw-0004GQ-A1
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 11:20:22 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b27ae025-d7e9-11ef-99a4-01e77a169b0f;
 Tue, 21 Jan 2025 12:20:19 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43621d27adeso37314885e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 03:20:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c0efccf7sm152892055e9.0.2025.01.21.03.20.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 03:20:18 -0800 (PST)
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
X-Inumbo-ID: b27ae025-d7e9-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737458419; x=1738063219; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=I6y2pyU3STAQWtek6i/q7gL4MQuoPOasqN9mkUC/6gE=;
        b=X7x/+28CcEHFori4UbnhJZRXeUTFOFtZStX0l30VEEK67ilEXBmF1wEIZOYJkA9qQC
         jQ+aTz60m6ufussk/tbWrTItjQGLgZI0Y4LbWjNLs9K+HB9X91+RCP1wEiWLosPFxbKE
         BjDDmN0kuZzM2BX1ttPK7ksiFwsjLGLLWpOT12h7P/2LsjExUBY449zj8hzfRcYbRpJe
         cAFdX25L64G4xi4KJMucl4JXWRyH4frX7nhqZ2KXgMu2OT+Y9PJ+wNeXaZFSdC1Ww4IF
         IVHcmkrAcp2gBThjErxPzuyFyHoNE0coUrShtzVXAM+6wlLtZ2GEz6EAtO1OA03QZq8q
         TpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737458419; x=1738063219;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6y2pyU3STAQWtek6i/q7gL4MQuoPOasqN9mkUC/6gE=;
        b=iuZscUAulYIcGrNbF5muQBiMt6hGEScO4xACYb/sGVHUa8lx+ALKaWoVI+ymSL9MJb
         kO+c72KZ6sqZnaPa3dLK2DEBUROhBNR7sqKOc+2SjwxOGbvcHGO4n9Fps9teC7Dpqj4N
         NMR1Jb2Qc1ReSQe9AkwVUu6fmjQUlcAfdXgbrGgxW01MJTsYMQYVpAQBFin8lpvWkj2a
         6IVMfSVJyeGqeSVmxneSxN2uS7AcHuMgORxU9NU/OeSr1LmuTJravw9GIoGc2kJXu1Tv
         E6TTgxycZ0IYssQMJqZSKpxphyVoxzcVUs6XytyRIJIfwDWGmh5Qjc5QzL9Tcv4GPoT2
         kKcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOzmUZxWhftQlOICIdHJPb65Wppu3j7MUNfrFy3PnWFhqmfSLVkzD+4qDZ6Ge3AI8W502kTx7ebXs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyc5nPP8fzRaBj6w3TADWpBiyyomFxOCy64bpB8YliFZAjrlVK5
	rJ52hhNer5EqiAOhqryO8xuNVoplLk9Ky5yGfELtOdDJyu/n9vIVgIAC3GLxNA==
X-Gm-Gg: ASbGncvd04+i/TjqI8mcpmZT9ohrtJR67Ce6cjvfezjsx3ffuSyiE1YoMPa1+LiuBqS
	Ggh8F/zVIqmC+L9MTvB7w7zjfrTLUDVoIQjeEjplm5ZCi08rkamq3x3KGiR2YwTLVu0zJjXjfzH
	uY6Lj6Lq0uiUZO7zM2eFmJKdi//1q/AM6raPIzslXMSIpoOgHz3IO6g1MXBnHuq92yCexElHhuG
	Va3U2pagspHDZ49Fl9ln9ukejSFWE2tlYm4GfVlU/kuMzr+fGsn5iluNyl9b34Q7rLd7gLX47JA
	3ikcG2niyGXIgFwKssPEwWzjg+TS750yBV9ecF9ybC0UwX+4z0+vfws=
X-Google-Smtp-Source: AGHT+IHVVG71nnomT4BWJ6Quz7D+hXKNrrRX4iOzK4cYZqXLSqOKAdhlgLsC9r+C3wMevkEbDD7WfA==
X-Received: by 2002:a05:600c:4e0b:b0:434:a525:7257 with SMTP id 5b1f17b1804b1-43891433febmr133233915e9.21.1737458418768;
        Tue, 21 Jan 2025 03:20:18 -0800 (PST)
Message-ID: <885982e1-fb1b-4b6a-a0bf-2251e5d9acf1@suse.com>
Date: Tue, 21 Jan 2025 12:20:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5 1/3] x86/iommu: Disable IOMMU if cx16 isn't
 supported
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1713433029.git.teddy.astie@vates.tech>
 <4656eab84f7b4b807fc61f54b9ba5c0fc4fae64d.1713433029.git.teddy.astie@vates.tech>
 <8cab0372-8c40-4648-bdbe-ff56844f289d@suse.com>
 <Z4-AbI2oKWCR5bws@macbook.local>
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
In-Reply-To: <Z4-AbI2oKWCR5bws@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.01.2025 12:09, Roger Pau Monné wrote:
> On Wed, Apr 24, 2024 at 04:27:10PM +0200, Jan Beulich wrote:
>> On 18.04.2024 13:57, Teddy Astie wrote:
>>> All hardware with VT-d/AMD-Vi has CMPXCHG16B support. Check this at
>>> initialisation time, and remove the effectively-dead logic for the
>>> non-cx16 case.
>>
>> As before: What about Xen itself running virtualized, and the underlying
>> hypervisor surfacing an IOMMU but not CX16? It may be okay to ignore the
>> IOMMU in such an event, but by not mentioning the case you give the
>> appearance of not having considered it at all.
>>
>>> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
>>> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
>>> @@ -305,6 +305,12 @@ static int __init cf_check iov_detect(void)
>>>      if ( !iommu_enable && !iommu_intremap )
>>>          return 0;
>>>  
>>> +    if ( unlikely(!cpu_has_cx16) )
>>> +    {
>>> +        printk("AMD-Vi: CPU doesn't support CMPXCHG16B, disabling\n");
>>> +        return -ENODEV;
>>> +    }
>>> +
>>>      if ( (init_done ? amd_iommu_init_late()
>>>                      : amd_iommu_init(false)) != 0 )
>>>      {
>>
>> I did previously point out (and that's even visible in patch context here)
>> that the per-vendor .setup() hooks aren't necessarily the first thing to
>> run. Please can you make sure you address (verbally or by code) prior to
>> submitting new versions?
> 
> I've re-visiting this as part of my other IOMMU IRTE atomic update
> fix.
> 
> Would you prefer the check for CX16 be in the common x86
> iommu_hardware_setup()?  That would be kind of layering violation, as
> in principle a further IOMMU implementation on x86 might not require
> CX16.  However I find it very unlikely, and hence I would be fine in
> placing the check in iommu_hardware_setup() if you prefer it there.

No. The check needs replicating into the other hook that may run first,
->supports_x2apic(). And the ->enable_x2apic() hooks may want to gain
respective assertions then.

Jan

