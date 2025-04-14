Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F76A88693
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 17:13:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950636.1346900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4LV9-00024v-O0; Mon, 14 Apr 2025 15:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950636.1346900; Mon, 14 Apr 2025 15:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4LV9-00023S-L2; Mon, 14 Apr 2025 15:13:35 +0000
Received: by outflank-mailman (input) for mailman id 950636;
 Mon, 14 Apr 2025 15:13:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4LV8-00023M-Cq
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 15:13:34 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0733f0b0-1943-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 17:13:32 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso45373725e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 08:13:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f20a897b6sm108713885e9.1.2025.04.14.08.13.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 08:13:31 -0700 (PDT)
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
X-Inumbo-ID: 0733f0b0-1943-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744643612; x=1745248412; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=glLrtcBIJfemlL+di4dRWTK237buUWLFpTyZJFXBbTY=;
        b=bX0Df3SIITdlum9MI0TJ/QR3I6Rz2Vr3oADlVUZhiG0B87j9Oimv6h7mu0LJzq/WdO
         TLOUBxKOdMnl9XXJRsZRtczlsbCvZfMOgWdqENh8hqGHRTouosdzM4KUizN/Gqdb2gkS
         Mh9b1Wx6gWBMzr6qQ3HU9al5fxKYwcGCFXgKKJDiyivaI5c4nJQYkXQV/p92Jr1AEhBT
         2IE1joIDnmgnb2UEDR+lkPtlCINYduWcC8bFI2vjeWKNDdcHHVAe/ir2O1jMwFhjBAMn
         kBOxG28Pp75MU1WQb+aCFqHw3CMeLzdLcPhkm8CcRRBklf6mrA/XfR4jH/pHZRBWAvNy
         oI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744643612; x=1745248412;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glLrtcBIJfemlL+di4dRWTK237buUWLFpTyZJFXBbTY=;
        b=C4bKDqL7BvzyTL0JKt47GEPhDZKu0Q3dCWRYPc/eu6rOm7to+vodQXfeZFg8U9arbr
         qneQrJnhUXltJHKgKMIH2T0VEphX3pylBGXJTtlE6OxrBEHa7W5PmAtg79se8L91Ps+V
         xxjsUWrqJKeEPfhKLNCyHNlGLcLjBxD0D1WPNnjttSjsjY/V5gDxNW7F47+gEdXqFpyw
         /AmCREnnCJQQNzIeev3CEq13ry4uIxuK0Lh3iO++DK/6VIo/FKaJ8+KMyUxEsrd7Dhw2
         VoFoy9o4jddObRwLUg6YLkBDPyqYaWPkKq88LE/D4jQqqX6asj5oxcJOtpiRYkaPaPi2
         Flmw==
X-Forwarded-Encrypted: i=1; AJvYcCWuL2KTS5QcC5VRpKHtXKtJBiNTkS+gAuyvH2gq/PUCrbOR75GQ3uBt2PlvC3mh9vJ1L0RIDkgMW5U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJcj90ABTl8k6okriLVcNBK1fKhIUnEto5p3gIN9m7E1Tlxws3
	0Ys7MhoalR4UNgJ6S8Km1oaj50pdGNTPtx5hDdARumHrbYAxK6i8eM1a033wUw==
X-Gm-Gg: ASbGncsfNdOPpzldJjWMIS3JaUeuf/CZgOLmg1WzcLRRGW5RBq5fZC/Prl2+fXS5Qy+
	PBvbrIRQgwS7dautvhjfic1wyL4hNN4T9e0kOV6OWlnVNI+4epVu5UxLPfmLQUFx62tuKHy9lCj
	25aAvi0imEfe5mQ/UqNP9xQm4tIwWsw4Nk4p/cP/4K7ONUOD3s1YfouQBnv7i+yqK66C5HyRgXU
	wJ6C1G6IzzF05QfAm4XIawkMioJ5qG+QBl5njBjx37X7ovBGiC92PLmaz0Tw1TSSZDA2eG/qhJw
	H3iv1pHWIlF9430OUPEEG1M352/Pcq5jXdCWoVQy7xlLNJx/k/YjTUK89B7FEgCzhj+ts57Eher
	fnCVYB18sSMhWX/MlI01C0WxgGw==
X-Google-Smtp-Source: AGHT+IFtMzAJEGMIQ3O+EERHY5ePNeZI6o47bAYZGuIYiy76gMtRD6XsavcuYmYE0YJZDP+GGyp5Ig==
X-Received: by 2002:a05:600c:5107:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-43f3a925ba8mr97366025e9.6.1744643611670;
        Mon, 14 Apr 2025 08:13:31 -0700 (PDT)
Message-ID: <21a06f22-0efe-4a82-be6c-dd3b744c28ff@suse.com>
Date: Mon, 14 Apr 2025 17:13:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/14] xen/riscv: introduce smp_clear_cpu_maps()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <ce3460b3857cca9e6f3072a8ddd50b31cb46b855.1744126720.git.oleksii.kurochko@gmail.com>
 <18277077-2cf0-466f-8bde-f7955806bcb2@suse.com>
 <127265c3-b572-4763-932a-4bb1d53af0b9@gmail.com>
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
In-Reply-To: <127265c3-b572-4763-932a-4bb1d53af0b9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 17:05, Oleksii Kurochko wrote:
> On 4/10/25 3:10 PM, Jan Beulich wrote:
>> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>>> +void __init smp_clear_cpu_maps(void)
>>> +{
>>> +    cpumask_clear(&cpu_possible_map);
>>> +    cpumask_clear(&cpu_online_map);
>> What's the point of these? All three maps start out fully zeroed.
> 
> It could be really dropped. I saw your patch for Arm, I'll align the current
> patch with that changes.
> 
>>> +    cpumask_set_cpu(0, &cpu_possible_map);
>>> +    cpumask_set_cpu(0, &cpu_online_map);
>> These are contradicting the name of the function. The somewhat equivalent
>> function we have on x86 is smp_prepare_boot_cpu().
>>
>>> +    cpumask_copy(&cpu_present_map, &cpu_possible_map);
>> Another cpumask_set_cpu() is probably cheaper here then.
> 
> What do you mean by cheaper here?

Less code to execute to achieve the same effect.

Jan

