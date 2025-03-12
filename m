Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6811FA5D84B
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 09:35:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910062.1316843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsHYD-0007W1-OM; Wed, 12 Mar 2025 08:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910062.1316843; Wed, 12 Mar 2025 08:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsHYD-0007TN-Kl; Wed, 12 Mar 2025 08:34:53 +0000
Received: by outflank-mailman (input) for mailman id 910062;
 Wed, 12 Mar 2025 08:34:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ASRr=V7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsHYC-0007TH-14
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 08:34:52 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dccb2bfd-ff1c-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 09:34:50 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso38286015e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 01:34:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a74c848sm13866695e9.9.2025.03.12.01.34.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Mar 2025 01:34:49 -0700 (PDT)
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
X-Inumbo-ID: dccb2bfd-ff1c-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741768489; x=1742373289; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cfud79DCYLt7xSFt1frzceEEUeBnioKtW6RhEpqlqBc=;
        b=aTK4AnQvLV55DFCyk4KE1D0Xr9Vx/blCzly336yX0uau+NUB3nzOSmltDSAm+peHK4
         5n1ysaACwgqNCrykkLDtSxOhAg0HC55T1rg2oNADQRAIErsbd5FVBVFwl4x94SzvnH3A
         ZVtgHWuhXBbHkbyv6WSlBdzBPIOC3EZjWeiVjNXsYH+IRkm/ybVVRsAC9pW7OfN3EJZW
         hsN0JJiLOKjvP8e8nqbNBic9myjJes60qSBV3R6oJwayft/CDtYI4dWyp5GC6HpfImFz
         RvNDATXqYAY2MMUwpru73/rN4EuaJv7l9meMIHSdU5ob2IaFoF0cf2fbsVmmDaiecrlY
         3B9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741768489; x=1742373289;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfud79DCYLt7xSFt1frzceEEUeBnioKtW6RhEpqlqBc=;
        b=oO4p41H6PptPI++36IrXYRU2vrF5SJGfD/xSHlgFnDIOt8oMXAsy9395QCKbWZQfjS
         JK0drWXYKE5x6aSD9ar4vfgi671eqiKTruT0Rg0/HwAwsBNrcHGX0FwGZOQTrRcVgse/
         yDfYv2M2w2iOq4WmJNmo7ccsVQc1aN2BW4fosAypCKrXzTSf122sBAncLhAtjgT+laSr
         vRQ49mdeyJCV8jlW2VVcDaPSEgR7KtyBeKsxvcnOAECoGbN2QF4fnwI4BQGI7+C2WVI+
         iyysOBdNB+3xyZQJv33RibvpQtGMgN0bZmdVDlkmi/h+q4nElta7YsOEs7187AZe9lxe
         Cb3g==
X-Forwarded-Encrypted: i=1; AJvYcCVooIoYWStDZpttyzuMWTG78GCOQqqSYOyDzhmLkKWWfy8Y6oyDxulejhaaS9OMxtgiwFI1/MCI8xk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykCmFFkgIt284WLUmxEOWa6hynwJ7z6H28/erptmMonMRZGXou
	xpEDmWmQe17GbfZMGtBqetks5KkiqBD5HXztOkfAhNLDrVyVlsHq5mjAqCTnuA==
X-Gm-Gg: ASbGncu+RCGKDauqk92UCzYb7+gtsnDjbo2CBvSfL52IvB2SVWMDVjWuiZLR/qEWKDG
	m6L3kcKWxx5NNrySZCG4IRTq14eVwvw++zAnDJZgixMhb2SqOawyIn9o/6W3yBq6wD9UsZA+zuB
	Q+Lx5hxqySpV3CiKZ2WW+lVdp+v0U4J2KKyuevOHp11C8x0vmuJtIHd59ZkGOlTjrDIk8IoV2Wl
	J75FgjxOQkB5ZLQsV9BMPm6b6sGmbcQU5npUml/MoNKUTrADesw3heAQsjCK0We0b+wHL7Juziz
	8/b5fLORoIqMP6mvpu+rNGiXbqhUyBZbKCw77ObCxkfSIS3u3TOBw/YRdnR+0el7HlNMaS/E6AO
	iANlVyiRo12nKP32EaviLUJu/fioxmA==
X-Google-Smtp-Source: AGHT+IEmeDVqa6LO75yMezs6cRlHJRYz4nKwdHRef4WmKWHvuBj8M4/F5U7j+VgHuOE350MnRhXP4g==
X-Received: by 2002:a05:600c:4f8b:b0:43d:649:4e50 with SMTP id 5b1f17b1804b1-43d064952fbmr43400755e9.13.1741768489623;
        Wed, 12 Mar 2025 01:34:49 -0700 (PDT)
Message-ID: <d05bd416-0643-4d7c-bb7b-39b5b82de0cc@suse.com>
Date: Wed, 12 Mar 2025 09:34:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/19] xen: introduce CONFIG_SYSCTL
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-2-Penny.Zheng@amd.com>
 <DM4PR12MB845105949CCBCD7780A718FFE1D02@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB845105949CCBCD7780A718FFE1D02@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.03.2025 05:10, Penny, Zheng wrote:
> [Public]
> 
> Hi,
> 
>> -----Original Message-----
>> From: Penny, Zheng <penny.zheng@amd.com>
>> Sent: Wednesday, March 12, 2025 12:06 PM
>> To: xen-devel@lists.xenproject.org
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Stabellini, Stefano
>> <stefano.stabellini@amd.com>; Andrew Cooper <andrew.cooper3@citrix.com>;
>> Anthony PERARD <anthony.perard@vates.tech>; Orzel, Michal
>> <Michal.Orzel@amd.com>; Jan Beulich <jbeulich@suse.com>; Julien Grall
>> <julien@xen.org>; Roger Pau Monné <roger.pau@citrix.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Sergiy Kibrik <Sergiy_Kibrik@epam.com>; Penny, Zheng
>> <penny.zheng@amd.com>
>> Subject: [PATCH v1 01/19] xen: introduce CONFIG_SYSCTL
>>
>> From: Stefano Stabellini <stefano.stabellini@amd.com>
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>> ---
>>  xen/common/Kconfig | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/xen/common/Kconfig b/xen/common/Kconfig index
>> 6166327f4d..72e1d7ea97 100644
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -519,6 +519,15 @@ config TRACEBUFFER
>>         to be collected at run time for debugging or performance analysis.
>>         Memory and execution overhead when not active is minimal.
>>
>> +menu "Supported hypercall interfaces"
>> +     visible if EXPERT
>> +
>> +config SYSCTL
>> +     bool "Enable sysctl hypercall"
>> +     depends on !PV_SHIM_EXCLUSIVE
> 
> I'm aware of the commit of "x86: provide an inverted Kconfig control for shim-exclusive mode"[1]
> And I'll rebase whenever it gets merged.

Except that meanwhile it was agreed upon that it won't be merged. Instead
iirc the plan is for someone to go and remove all the "depends on
!PV_SHIM_EXCLUSIVE". Which means new ones better won't be added anymore.

Jan

