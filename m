Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B0BAF8B61
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 10:26:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032993.1406407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXbk1-00013t-0Q; Fri, 04 Jul 2025 08:25:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032993.1406407; Fri, 04 Jul 2025 08:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXbk0-000115-TU; Fri, 04 Jul 2025 08:25:52 +0000
Received: by outflank-mailman (input) for mailman id 1032993;
 Fri, 04 Jul 2025 08:25:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXbjz-00010g-9k
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 08:25:51 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d5161a2-58b0-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 10:25:49 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a503d9ef59so445015f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 01:25:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee450db7sm1512523a12.4.2025.07.04.01.25.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jul 2025 01:25:47 -0700 (PDT)
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
X-Inumbo-ID: 7d5161a2-58b0-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751617548; x=1752222348; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WPAH42PuLVsHZeGsUYbSdPVqmLwpofnTbcVS+2THMqA=;
        b=fFyhE+eJWaWtO7Z2h06Yxi6St+QBI20gny1h15FryWa8HhHcEviuSkb2JiUb+3qeFu
         ou7rNKtGZKD75O3/SQ4mNE2IvGP6ujf8JZGL8kapYTqwrtPerswmVqk7HMQz+N2vMzpc
         6k7tP6xHU1+UVEqG7i9OzaH1aqwmlxhtbJohjtjNJyOJlhUjVXJAhkqcc7fDEO8WJAvn
         I2+8AS913IHxrj9YJzuTJBWeh2Qi0Gp27iWlE5MrZVgvAQvXH0oDpTcrAfApYErQiv1j
         kuCbyReSHCksIyJrcs54TPsRE21w68iU/yKlXoZBbUddVMK7ybwYilAs3usOaiT17tpx
         a5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751617548; x=1752222348;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPAH42PuLVsHZeGsUYbSdPVqmLwpofnTbcVS+2THMqA=;
        b=tFyHLPPCGKZCD9R+e8xd3gzurOlPcbfvFKcAd5JtkMur4cODGqW8CVrEDWIw+NKI93
         YSJjNKsYRmQvbb1UwcO69KNYmRwGWHvMy308tf6a91R12EwucGosgRBBi7CM8Z0eHPSX
         fMdpW78xCu/yGqciXwKn3DTpgzBzgB23ygUDmxq6SgxHEswF0VU4l4SxpltPdg3IWb33
         wq6vK1zR9+IbnXVJnd1ysKE7I91uTea/alr19yiJjUDwK23JRc2pf5Ger+JI1RGsaD7p
         oTeQ/7Wq2VHdx/FvGq2kDB9D4TzM7icSAu5WccJRwp/WqyrEyUbpYNxSBBdnyE84M6ru
         cE4g==
X-Forwarded-Encrypted: i=1; AJvYcCXBsprnmYUAGAXXQhodqefrm4G1VYaGqUiOq8wQfgd89N026jseEme3ay71cZI+hEZE2WjrhgqSa2E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrcQBmcu5hNW+bb00qpEZhlgvd8Qf/MrZSUsjnBOS2vV/wvdkS
	+cnGEbFbRo0wH+9mdEiWcb/0ITcLu1rynwhbH9cV6SPdz4bodZKvrPiDLyJlkYtlr2jw5OFEgMm
	CVJA=
X-Gm-Gg: ASbGncuXNIeJFO5GzZk/OaELmbYRFO75H2dDNwVWfu1nuORKaUmCJiLXuyGFvzPx1bY
	1BuH1dW3mcpyZdaa97pNFTJVcQMI6gWx+t8C8LxVn+I4eW754hYmCdg/RDpbQUpcQWlAfmJG2cg
	eLHcfQtK6BsOVNmQtst+10VhFUaOA6dgk29U7twP/n8hayycUZmu06gdGRZDH6yJciRF+qRM820
	wXGWEOjtSN5Scg6D2y9r2VF3d3Repke6kanp58Vxgy+SJZ6rDYAMfoLAIj/3c1NLuouLluECmug
	r0c9mkLLijLm6Ov8u8UxhIVre/JxCbQF0mGEOWiK5ih9g7gHD9jzN4xFnVYe3cLn9mrFg/XXdOu
	ajlvbyXu9m/SKn14TSsVFAkS+vuCxFA0En4x+LoH5n55JKgA=
X-Google-Smtp-Source: AGHT+IEXej/qvT9IRpA0KHgr6lo0tcjcXkpRRJ8I76A2E0Hun3gOKTqR/2SN8Mr/xK1t2AFTmGMf5g==
X-Received: by 2002:a05:6000:2512:b0:3a4:db49:94aa with SMTP id ffacd0b85a97d-3b4970195e6mr1031627f8f.21.1751617548233;
        Fri, 04 Jul 2025 01:25:48 -0700 (PDT)
Message-ID: <27dcd1b8-e735-4ab1-a5a8-d71a46e59955@suse.com>
Date: Fri, 4 Jul 2025 10:25:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] xen/softirq: Rework arch_skip_send_event_check() into
 arch_pend_softirq()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
 <20250702144121.1096448-4-andrew.cooper3@citrix.com>
 <aGat-VxBF5jOErzy@macbook.local>
 <86dde581-40ad-405e-8d98-0b4485529581@suse.com>
 <aGeI_k1H3oju26hf@macbook.local>
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
In-Reply-To: <aGeI_k1H3oju26hf@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.07.2025 09:55, Roger Pau Monné wrote:
> On Fri, Jul 04, 2025 at 09:23:29AM +0200, Jan Beulich wrote:
>> On 03.07.2025 18:21, Roger Pau Monné wrote:
>>> On Wed, Jul 02, 2025 at 03:41:18PM +0100, Andrew Cooper wrote:
>>>> --- a/xen/include/xen/softirq.h
>>>> +++ b/xen/include/xen/softirq.h
>>>> @@ -23,6 +23,22 @@ enum {
>>>>  
>>>>  #define NR_SOFTIRQS (NR_COMMON_SOFTIRQS + NR_ARCH_SOFTIRQS)
>>>>  
>>>> +/*
>>>> + * Ensure softirq @nr is pending on @cpu.  Return true if an IPI can be
>>>> + * skipped, false if the IPI cannot be skipped.
>>>> + */
>>>> +#ifndef arch_pend_softirq
>>>> +static always_inline bool arch_pend_softirq(unsigned int nr, unsigned int cpu)
>>>
>>> Nit: I would maybe it arch_set_softirq(), I find `pend` not that clear
>>> (I would rather fully spell `pending` instead).
>>
>> I, too, did wonder about the naming here. But using "pending" as you suggest
>> has the effect of giving the function a name we would normally associate with
>> a predicate ("Is it pending?"), whereas here the function is used to _mark_ a
>> softirq as pending. Hence in the end I didn't comment at all; I'd be fine
>> with "set", but I'm also okay with "pend".
> 
> It's a set and check kind of function, so I don't care much.  Just
> found the pend a bit too short, I don't think we usually abbreviate
> pending to pend.

Aiui it's not an abbreviation, but kind of a verb (inverse-)derived from pending.
I don't know whether that's "official"; my dictionary doesn't have it.

Jan

