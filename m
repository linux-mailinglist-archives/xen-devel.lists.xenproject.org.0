Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5D38B518D
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 08:38:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713846.1114726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1KeD-000666-Vz; Mon, 29 Apr 2024 06:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713846.1114726; Mon, 29 Apr 2024 06:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1KeD-00063I-TB; Mon, 29 Apr 2024 06:37:57 +0000
Received: by outflank-mailman (input) for mailman id 713846;
 Mon, 29 Apr 2024 06:37:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GJEf=MC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1KeC-000638-JO
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 06:37:56 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02cb9a9e-05f3-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 08:37:55 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41bca450fa3so13231275e9.2
 for <xen-devel@lists.xenproject.org>; Sun, 28 Apr 2024 23:37:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a12-20020a056000188c00b00347eb354b30sm28947611wri.84.2024.04.28.23.37.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Apr 2024 23:37:54 -0700 (PDT)
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
X-Inumbo-ID: 02cb9a9e-05f3-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714372675; x=1714977475; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zh6cdYX/huOKuFWrusrKq0ktzt/2mAkgjKO4CpEgiBs=;
        b=hB6hC/YhHVmVxZO2lc/aj+FVYNHKVf1P9yBos5LLr8yXWyphq9e9iVogIMpRuppgdX
         sSso9Bz0EZpsIMVX3pLALbWBGqiUQwvhSqs8Wzr5zRF+ub/wSftoKMy1wI5HLoKaTuN8
         r3V1Xyy9RtnRifSL4jG2jL8CuXhdATo0xS8t4bQfogzU3Pw42kGnZIYXSWwK8D0xsM3r
         mKayJO1RJvTHC0X1viMBsT2lwyLGsJ/fCeS339ksvoSuYeToXhwvRM92AY/uOV8++Le0
         jb9mcouluooZiRNdW+0Mmp7H7AnSYfExmhaX5mPmafutxF0QsWvXGnxDM7S4Ts3FRGip
         Zm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714372675; x=1714977475;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zh6cdYX/huOKuFWrusrKq0ktzt/2mAkgjKO4CpEgiBs=;
        b=ke62ZwKNleY8Ny1VLdLZl9R/2AySEf99uJo8uhxdFrRkVvstfUhnQhlqgwdsli7ld0
         E8Eyrmh7nM5v7Vm6HaUSL5OAcbBadqo0VEcPn/88WCJmJTvfxFfgyTKKjokWJJ3lY8dI
         g/PlgoVQ5Phn+1M/bNqTTWC/e7CSOMM6XQR+HSbnN9fAkgzEgw7PflffLQyvsenEiLcJ
         LNCWnZtvANkirD79IDo9xYS5F6b4J4ups6CI4Qa1kro8K/JTmfZCZjrFl8NuKo6fWlE3
         zQlpEzLf8kC8Pvo4BxSMy61IaIkzLQwksA7T6DT6av8yZjXIK86xyyYEKLfgGl0NHNwi
         ZtIw==
X-Forwarded-Encrypted: i=1; AJvYcCVpWKYmXsSZNh329dhd4rJOVrYNpWXbvifSIz8gVRS+Ki946voUokK20uX0OSIjTZTwR8o0N8fK6E9/xGokk9RcSMsuzHfw/1/2Y4PDXtw=
X-Gm-Message-State: AOJu0YyUGY8XSkahSE9xGmeoOiDCEP0i7puT7IWjDUnpgpA+KqJtf9v+
	UKpn+DNKAA/HVHnzVm1JbXX373479KzynwWmMgugXg/1k24XJZ1tJEse620euLAefSKZyzpHZ2c
	=
X-Google-Smtp-Source: AGHT+IHxJHfRdfsv1QT82cvbq29vstFXBRThmWbQ+wARhKOkBAReMnjSuooDF19JG2J32BgHweoaOw==
X-Received: by 2002:a05:6000:1544:b0:34d:3d05:cf3a with SMTP id 4-20020a056000154400b0034d3d05cf3amr406209wry.22.1714372675059;
        Sun, 28 Apr 2024 23:37:55 -0700 (PDT)
Message-ID: <59a59477-f343-454a-9f83-e9df28286065@suse.com>
Date: Mon, 29 Apr 2024 08:37:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/7] x86/hvm: Allow access to registers on the same
 page as MSI-X table
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.afa2d89161590f5193dd6bfd340c5e9347877aae.1710342968.git-series.marmarek@invisiblethingslab.com>
 <a040f703a884ff4516314f88b22ee0f9f17329a9.1710342968.git-series.marmarek@invisiblethingslab.com>
 <68f99f0a-e27a-449f-8d13-fb5ca9f6069a@suse.com> <ZivHw9RUUN1CV4Hi@mail-itl>
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
In-Reply-To: <ZivHw9RUUN1CV4Hi@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.04.2024 17:26, Marek Marczykowski-Górecki wrote:
> On Thu, Apr 25, 2024 at 01:15:34PM +0200, Jan Beulich wrote:
>> On 13.03.2024 16:16, Marek Marczykowski-Górecki wrote:
>>> +    hwaddr = fix_to_virt(fixmap_idx) + PAGE_OFFSET(address);
>>> +
>>> +    switch ( len )
>>> +    {
>>> +    case 1:
>>> +        *pval = readb(hwaddr);
>>> +        break;
>>> +
>>> +    case 2:
>>> +        *pval = readw(hwaddr);
>>> +        break;
>>> +
>>> +    case 4:
>>> +        *pval = readl(hwaddr);
>>> +        break;
>>> +
>>> +    case 8:
>>> +        *pval = readq(hwaddr);
>>> +        break;
>>> +
>>> +    default:
>>> +        ASSERT_UNREACHABLE();
>>
>> Misra demands "break;" to be here for release builds. In fact I wonder
>> why "*pval = ~0UL;" isn't put here, too. Question of course is whether
>> in such a case a true error indicator wouldn't be yet better.
> 
> I don't think it possible for the msixtbl_read() (that calls
> adjacent_read()) to be called with other sizes.

I agree, but scanners won't know.

Jan

> The default label is here exactly to make it obvious for the reader.
> 


