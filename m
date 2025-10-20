Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE86BF197F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 15:43:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146394.1478828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAqAd-0007ee-KR; Mon, 20 Oct 2025 13:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146394.1478828; Mon, 20 Oct 2025 13:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAqAd-0007bk-HA; Mon, 20 Oct 2025 13:43:31 +0000
Received: by outflank-mailman (input) for mailman id 1146394;
 Mon, 20 Oct 2025 13:43:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vAqAb-0007be-FK
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 13:43:29 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c24cb30b-adba-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 15:43:28 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-46fcf9f63b6so23233855e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 06:43:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4715257d8b2sm172958215e9.3.2025.10.20.06.43.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 06:43:27 -0700 (PDT)
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
X-Inumbo-ID: c24cb30b-adba-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760967808; x=1761572608; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ODB2vxdrLVxgFP6LBf1Vtrqqvk5Vxxtq6W9bEq9jhl8=;
        b=Jf1eGB69OYk6BvcmuE9GRHRgDmzgvEjpapNRR1yVDfHZpxHdg8+i1Fh+YsicjE2V3Y
         lvWwBDtEH8mTv8NGn+zUKo/EmEcrY5Lv774WIa5zp9iYrhGbMOy79IPtDa6my+pEJRL3
         EHPdv4lJEDsoxnV92KPbxIdQ5DBqmlOgLLGkXuCgsG850oiMv1ikWXq+2YjQw7FH3aiZ
         KxLfPCEh3+kOdHkhQdu/jw2zQIdbQOEKuietRGbbveXWcH8v1w8HiUdURh14Hem189Y7
         tMnF7s7AvkOEK5GZ6+jLYDGIMPe+W0Wnngs3TbG49kF0o/d/gafH2gbWFytEvmTChl8g
         y3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760967808; x=1761572608;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODB2vxdrLVxgFP6LBf1Vtrqqvk5Vxxtq6W9bEq9jhl8=;
        b=M0Y2rvpBB0hmYfSILCb2RjVJAlpXO+h10v+epxrGkwpYdNaaOyWU81/be0ekeB4LM0
         voE3T9gmoNNz0ni23pBBv+DnU/0JTrZA62E2SDVQKkk6+nJAH2MbB7A23xGh2Habrjb5
         Lny0egKtSCCbUB2F3777zqfhdjDd7t1J2Mw/YSzXjajAklN4+30ZMS/D4pd7VIU7iWj8
         g+ZLgFoXsirqG0tWa1WHW3+RpSgRKWSMR7s2TicaT3RYnCupPZ31XoIMYEJhPXVsGk4d
         1yy+Y0m45Hw20WoHTTXaBuYciP6eigxWU9f6V4HHrSSxf6NPHbxvl1vZsFz9cDhdPd+5
         HEFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP2L//o3JVirZ1Y7X3vG1SVbVCmG7UDD5Oa+HIsn3G8SoeUh11/UKMh9r3/r4ASl3UetWLdXSKBaI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxS+kxp3GJEC7ukPj4XMdYjAkLRdDZdvCdi3P6gG9TUsljMZc95
	eW+FSySvnLkMehObfKtka+5wHLKlWfx1bIKHdYDg4jsH8scNrUm3XvUAELzp6cSg/tC6s61/2Ws
	yNqQ=
X-Gm-Gg: ASbGncvsKM6k2gMILcXZqdqoOdplYnD/+ErNrRjzP41RHdscHt+jY//8Kb1+w+r5fwm
	+MDrJ8hWA2uVbPpkL2VFPyoPsu0iOvh+giRtddDl8+6v/PuAcC/97CzTggwnnAUGu7uCAtwLflo
	mU9PvAJ4NX53Bywa85dTPUV6SSjhky3/cl4nF0mHEDvD8FEuem4PXciDL5utH/vwtS/VXgpI6v6
	Bn2Wpl5iOlkOky0J7QqOu0ERxgrgz2dpY52BA1JpdpH6g1GdA3Omeh7IaDaZSw/BguMBVM/4a9U
	J70a9PJtqXVsVSBafrHmB7M2FzwQZNmDzzubT7eeofEj+U24/Iml0M2xJj+oyPXM4FtMIv1MG+b
	gR6nJHPuI2SZJ7vGCe5/MQPuCWDp/Uu9CX4Ds9yjC8y25JEjF30dPkBV4LwU6zSg1RQ61xEx4+W
	xo84mW+86Zt2hPYSqpdTf8GmW5wTYJxFh1wr4li1XMsVtSO0oubyZDJ6pCILggj3is0CeEwjK3P
	9SaVxMb4Q==
X-Google-Smtp-Source: AGHT+IHKDSDYPvf2l/KD9cWFT5KU2yCXvOw5rruWtjgLUmIpkmzw6GefuOIqN3803azepriM0cXmQg==
X-Received: by 2002:a05:600d:41cc:b0:46f:d897:516f with SMTP id 5b1f17b1804b1-4711791c880mr110869945e9.34.1760967807959;
        Mon, 20 Oct 2025 06:43:27 -0700 (PDT)
Message-ID: <2b6bfd5e-7d55-442a-b46c-094cb4289f49@suse.com>
Date: Mon, 20 Oct 2025 15:43:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/9] hvm: Introduce "fixed memory layout" feature
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1755785258.git.teddy.astie@vates.tech>
 <640223e5e7ee18a73f62152dd27883bf5978fbfe.1755785258.git.teddy.astie@vates.tech>
 <5ba550db-5e36-4d98-bce7-cbb3e2d874b9@suse.com>
 <b3c490fc-e1ca-488e-b96c-e059bdbdb466@vates.tech>
 <0fa33a24-a6a4-40d9-88a8-af48350e1f4f@suse.com>
 <c29f65b9-c513-4e91-a083-0773fa502b97@vates.tech>
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
In-Reply-To: <c29f65b9-c513-4e91-a083-0773fa502b97@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.10.2025 15:26, Teddy Astie wrote:
> Le 01/09/2025 à 17:50, Jan Beulich a écrit :
>> On 29.08.2025 15:32, Teddy Astie wrote:
>>> Le 28/08/2025 à 14:30, Jan Beulich a écrit :
>>>> On 21.08.2025 17:25, Teddy Astie wrote:
>>>>> --- a/xen/include/public/arch-x86/hvm/start_info.h
>>>>> +++ b/xen/include/public/arch-x86/hvm/start_info.h
>>>>> @@ -99,6 +99,13 @@
>>>>>    #define XEN_HVM_MEMMAP_TYPE_DISABLED  6
>>>>>    #define XEN_HVM_MEMMAP_TYPE_PMEM      7
>>>>>    
>>>>> +/* Xen-specific types (OEM-specific range of the ACPI spec) */
>>>>> +#define XEN_HVM_MEMMAP_TYPE_SHARED_INFO   0xF0000001 /* Shared info page */
>>>>> +#define XEN_HVM_MEMMAP_TYPE_GRANT_TABLE   0xF0000002 /* Grant table pages */
>>>>> +#define XEN_HVM_MEMMAP_TYPE_GNTTAB_STATUS 0xF0000003 /* Grant table status page (v2) */
>>>>> +#define XEN_HVM_MEMMAP_TYPE_FOREIGN_REG   0xF0000004 /* Suitable region for grant mappings */
>>>>> +                                                     /* and foreign mappings */
>>>>
>>>> I question it being legitimate for us to introduce new E820 types.
>>>
>>> These E820 types are (at least in ACPI specification) in the OEM-defined
>>> range which seems appropriate for me to use for Xen-specific mappings.
>>
>> Just that we're not an OEM.
> 
> How should such information be provided alternatively ?
> 
> Currently, premapped pages (xenstore, PV console, ...) locations are 
> provided through hvm parameters, but I don't think introducing new hvm 
> parameters is very wise.
> 
> One way of another, we would need to provide to the guest a xen-specific 
> memory map for implementing this.

Yes, I don't think there's a way around something custom. (I am, btw, also
not overly happy about seeing "fixed memory layout" appear in the first
place.)

Jan

