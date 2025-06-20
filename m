Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A710AAE138C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 08:01:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020554.1396703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSUom-000636-VV; Fri, 20 Jun 2025 06:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020554.1396703; Fri, 20 Jun 2025 06:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSUom-00060Q-Sn; Fri, 20 Jun 2025 06:01:40 +0000
Received: by outflank-mailman (input) for mailman id 1020554;
 Fri, 20 Jun 2025 06:01:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SdMF=ZD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uSUol-00060K-Kl
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 06:01:39 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0637daa1-4d9c-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 08:01:36 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so1197342f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jun 2025 23:01:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7490a46b071sm1206158b3a.33.2025.06.19.23.01.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jun 2025 23:01:35 -0700 (PDT)
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
X-Inumbo-ID: 0637daa1-4d9c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750399296; x=1751004096; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4XxbcB49y/2OkJdJbJfvewYz5lPjPV7Fj2tZ9BgYDYs=;
        b=CMWb8Jm0leR97Kw4Da+B0B3K5+WJfoTVS9rK75DAIJE9W4B66c19fu/TzMEwCp1Fnc
         WG3CEXIuPdIpgUdX+41xip2FNcQktpx5r/Qjr5FCy5jKzTQPg1bEsSNJGM5cXoTinp/r
         pNPdMAx41+Asc3I+erruHpFenApI/1ykhmaFxxOC2fVKdx98N22iZbw7YUz09TAdHrhQ
         lfMVvSSO1sE0tOyoqk7E3hDvWzK2XajkAnMkw0t3qW4U8fdHtKwzuRSh88semdltbB5/
         ZZvbK886FYve8RCR91Dvx8cscTLfLVxN168wfSj6PPeXvgyH9x+imXTqPfZe1phK/BPT
         uZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750399296; x=1751004096;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XxbcB49y/2OkJdJbJfvewYz5lPjPV7Fj2tZ9BgYDYs=;
        b=CvoJuasvaKEesIxT2IbdECriKUUULvT6350y3OhURjZaMEvZabF+ghJhsEkw23054+
         eXm/q/Vw+U/bzriUX/8UtEUdgGkHGnR/HG69osyPbRgJtm541lU7+Z43dqP0KGnl3faL
         ICPrddudVDVhQvik8IBj4w273UihXOJSSf/6SYxjPAURvM08EWIyoC+gGRDm1E9F4sLI
         Dq8gkYX4nie/lXSv2Ks4zge62iiPK6YPJ8lbNWd4svQf34o9TSq5/iEYAZi+G+CdfrjX
         wvnvDL+wd3rXaNifFrEwxfC5XkzpStoyq+5xwAqQiR30HZILwH5BQMZd/CozVUU7acbm
         uccw==
X-Forwarded-Encrypted: i=1; AJvYcCVhziMaQptUqQ7zFRvw9X4Q7a+e/47dFsbScjPo/foA1SAedxLq1mFfB6j8NrqvLIn7lnuE982UP6I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+7cB9AgTcn9mj+PhBUCaOYcEJDP6J6hRbasfIiwJ8jvI7+i5V
	uXDXRcVOjbXJ+s1DRjIG03LNKYruM+HlEt8BMNVEh6r5LEV3VXOguuG6CniI/RVQUg==
X-Gm-Gg: ASbGncvL31BnVwTWJSQS0TaCSiPQRABUsImb6Yg+Qzdw666SIDVFLf4jQm/2jonP2BC
	bknIQKJ9DZk0gIf6o5HWaZoSP70GgDa/mpinQyWAjETSA27Np5W080astVZGw6L9fuTSB93RNO4
	VZ3igILiimwfMA2zRdVMdg6odygF6bdwrZK8VuglosK5/ZrFynmGtnSH7kUDiL/kwrpmYiKM9ab
	4zCJOMrDNM+A6hP20xlo+OwVrGtej1St5uFWue1Gayl3co62ldaJfpMhSvQg9hHBfoqZNtYj6cA
	UKlYU3fm7pAeuMcwaQonWJNheq02AWiGFJbuu/TWZW0lv4SYKrClz3WHBhMUzh6CjtF80rbHm4V
	ycTVT8BiI83bJwwhT5K69Hnfw4KCgHn3cadzIl+Ahmqa/96I=
X-Google-Smtp-Source: AGHT+IHrUed61YY+nAbuKwCu3tWSiHvtsgLBZ1N73VasCzFqopCeuSMx8vFnbY+bIHRdRvXzjv8KZg==
X-Received: by 2002:adf:9c8c:0:b0:3a4:f7af:db9c with SMTP id ffacd0b85a97d-3a6d1318226mr994551f8f.59.1750399296119;
        Thu, 19 Jun 2025 23:01:36 -0700 (PDT)
Message-ID: <ca98ed6d-a6a7-4624-9b0f-b87b7986fea2@suse.com>
Date: Fri, 20 Jun 2025 08:01:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/18] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-7-Penny.Zheng@amd.com>
 <3edeeff2-5728-46cc-9436-01e5e3cf2bd3@suse.com>
 <DM4PR12MB8451AD27C6E39F0781749156E17DA@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451AD27C6E39F0781749156E17DA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.06.2025 10:43, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, June 12, 2025 6:42 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Anthony PERARD <anthony.perard@vates.tech>;
>> Orzel, Michal <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Roger Pau
>> Monné <roger.pau@citrix.com>; Stefano Stabellini <sstabellini@kernel.org>; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH v5 06/18] xen/x86: introduce "cpufreq=amd-cppc" xen
>> cmdline
>>
>> On 27.05.2025 10:48, Penny Zheng wrote:
>>> --- a/xen/arch/x86/platform_hypercall.c
>>> +++ b/xen/arch/x86/platform_hypercall.c
>>> @@ -94,6 +95,8 @@ static int __init handle_cpufreq_cmdline(enum
>>> cpufreq_xen_opt option)  {
>>>      int ret = 0;
>>>
>>> +    /* Do not occupy bits reserved for public xen-pm */
>>> +    BUILD_BUG_ON(MASK_INSR(XEN_PROCESSOR_PM_CPPC,
>> SIF_PM_MASK));
>>
>> This looks like an abuse of MASK_INSR(). Why not simply
>>
>>     BUILD_BUG_ON(XEN_PROCESSOR_PM_CPPC & SIF_PM_MASK);
>>
>> ?
> 
> Because in SIF_PM_MASK, it's bit 8 to 15 reserved for xen-pm options,
> See "
> #define SIF_PM_MASK       (0xFF<<8) /* reserve 1 byte for xen-pm options */
> "
> So I'm trying to use MASK_INSR() to do the necessary right shift (other than using 8 directly, in case SIF_PM_MASK changes in the future...)

Oh, right, so my replacement suggestion was wrong. But XEN_PROCESSOR_PM_CPPC
isn't contained within the 8 bits. MASK_INSR() could conceivably have a
(debug) check that the passed value actually fits the mask.

     BUILD_BUG_ON(XEN_PROCESSOR_PM_CPPC & MASK_EXTR(~0, SIF_PM_MASK));

?

Jan

