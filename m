Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2DB8801C0
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 17:16:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695489.1085291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmc8F-0005Hh-BI; Tue, 19 Mar 2024 16:16:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695489.1085291; Tue, 19 Mar 2024 16:16:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmc8F-0005Fz-7n; Tue, 19 Mar 2024 16:16:07 +0000
Received: by outflank-mailman (input) for mailman id 695489;
 Tue, 19 Mar 2024 16:16:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aOUF=KZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmc8D-0005Ft-RS
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 16:16:05 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa8c5360-e60b-11ee-a1ee-f123f15fe8a2;
 Tue, 19 Mar 2024 17:16:01 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a465ddc2c09so389516166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 09:16:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s14-20020a056402014e00b0056b81da18c0sm1745979edu.17.2024.03.19.09.16.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 09:16:01 -0700 (PDT)
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
X-Inumbo-ID: fa8c5360-e60b-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710864961; x=1711469761; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZAD2pA23WrR6O/crsHzWBoKV29m/NxlQoWgxo8hwufc=;
        b=b4Nw3kWnNSDBSq5YEpdzt65d1U/xhIrjQGNiG/4BpscqcBzvC0qhy3TnZjW/alyISU
         MdMaRTEcrw5+5zcd7tbAL9jGySUFRcxp7JmIzOpTkv55z/fvCwcOb1I/7Cf+ibSDXhkY
         a8euJ67BByEmxGl3Qqj6X7arzgUVCCfogrbHq8ueEQzzPJz6Ny+cEx76QgX3+uePfrqv
         Zp/Ua7aCBoVJcrYQNim23p8yEpghFADuTvEnwhcfkWIFNCjzDtIaG6Tt06HZigbessR3
         XfxggFXMZvPFKIpu24ChYKoYAvSsdRypH2gGW0hqrX3hCgRpfzkSCdDb8faO3XGMdJF/
         RnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710864961; x=1711469761;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZAD2pA23WrR6O/crsHzWBoKV29m/NxlQoWgxo8hwufc=;
        b=QVCE6fdqCfgGIaPXgqMB5EBiYG5QUSIt5Yr7T0gLuQGQwh/Z5t3Q5yacYDP1ssLXFa
         FDruJUhcMeavDGfKmswxkoYNkp+G/qABisG1CAvlT+hAim9Es2dX2EJplzjrweRC6ybd
         cedQpPWESdBfilxc0+rqkiEmIUsRzpx9VFq6rzF69w23EQSBAuf3ICT9bFQUcHlmlhrq
         +n5WUZzfCtLqZ08Vh9yPWnkgc6HTnM/Eup8eTVC8+KfvuobcXAXnDeqLCiv8yBAxy1NY
         M5ynjPd5VSqvu9Y/K3oZGKbwrFtEyp4VQ09OWJcerV4GFN9RhgyhX15Q8FQOB5XyS7St
         Xegg==
X-Forwarded-Encrypted: i=1; AJvYcCWDT+8pW0Xl4fykQKrbfILnyYZosH/VUMFtMsyFNGLgcjm7IZkByjcaEeZx0RkFNTJnLKt1P4LtJfyeVGzIDp/t30VHNfbXTlUn+yqnlBU=
X-Gm-Message-State: AOJu0YwVIMNJdNzwRwnz9MVDg6t3qBksQFro1iCQ9NoxUA3UlToAHIpa
	p1IHFBe4nGQoNniSGs8RYhijC+ehzKLDl1HzSnDTfzhlKh/2SCAJic9TGThTEQ==
X-Google-Smtp-Source: AGHT+IHVSaJvWmv6hpAzfqE2aEhcxREg9WiQZkQ4Wv36s5o83bWqZXrlnPYlTgdMIeVjTIHloo5fEg==
X-Received: by 2002:a05:6402:5d0:b0:565:6e34:da30 with SMTP id n16-20020a05640205d000b005656e34da30mr10889400edx.21.1710864961432;
        Tue, 19 Mar 2024 09:16:01 -0700 (PDT)
Message-ID: <5ebf9310-7815-45ca-ac8b-5acc98a9e3df@suse.com>
Date: Tue, 19 Mar 2024 17:15:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 14/14] xen/arm: add cache coloring support for Xen
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-15-carlo.nonato@minervasys.tech>
 <147ba010-3776-4ebd-a871-894921bcd4c4@suse.com>
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
In-Reply-To: <147ba010-3776-4ebd-a871-894921bcd4c4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.03.2024 16:58, Jan Beulich wrote:
> On 15.03.2024 11:59, Carlo Nonato wrote:
>> @@ -326,6 +328,27 @@ unsigned int get_max_nr_llc_colors(void)
>>      return max_nr_colors;
>>  }
>>  
>> +paddr_t __init xen_colored_map_size(void)
>> +{
>> +    return ROUNDUP((_end - _start) * max_nr_colors, XEN_PADDR_ALIGN);
>> +}
> 
> XEN_PADDR_ALIGN is an inherently Arm thing. Such better wouldn't appear
> in common code.

And actually in patch 10 you introduce get_max_nr_llc_colors). With
that, this calculation can more to Arm code.

Jan

