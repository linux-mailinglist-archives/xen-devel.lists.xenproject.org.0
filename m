Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B721B17CB0
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 07:59:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066821.1431889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhinm-0002WR-0r; Fri, 01 Aug 2025 05:59:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066821.1431889; Fri, 01 Aug 2025 05:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhinl-0002Tf-TR; Fri, 01 Aug 2025 05:59:33 +0000
Received: by outflank-mailman (input) for mailman id 1066821;
 Fri, 01 Aug 2025 05:59:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIvO=2N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhink-0002TZ-Bf
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 05:59:32 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b10239d0-6e9c-11f0-a320-13f23c93f187;
 Fri, 01 Aug 2025 07:59:31 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3b77673fd78so714205f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 22:59:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f6bfsm3186912b3a.23.2025.07.31.22.59.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 22:59:30 -0700 (PDT)
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
X-Inumbo-ID: b10239d0-6e9c-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754027971; x=1754632771; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4/0v1tmnV7HIQqvmy3mH/pRHBTmHyoMQNOpz1PhJQc0=;
        b=Iu89HoXcpN5d3V92s5g3KgLvkfK6qk7H6wZVNFQntQkZNtV0EEThAb/+vyMD2CpDIR
         ViWmWyaqxO+7jL5DdoP3Hvkm0llH7Kgr8CeC6lugs+aXfa9RXmiT1UQeB1emZodAsbRn
         HmifKtcmwef7BjDnADijKKLVQO92mh73/DxdENxjj6qEPOTVW5PmRNhB/KM87s8jyO3i
         VZ3oFhDCRODxE2eWeOqCid9gFGpLzxdu89RBb99d1E9sbhrhM7WxD/4howGIJ1FrsmWQ
         tbMphCItaSAtopJJzJ+iRYVuZ4tbGWBPympBoAw/U4cwARodUGY3D+rlmBKLYIf+mUsM
         TJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754027971; x=1754632771;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/0v1tmnV7HIQqvmy3mH/pRHBTmHyoMQNOpz1PhJQc0=;
        b=E5oJCN9v57Qa74o9nFnkGX4ieS3qBuYw31Ika6nxlKGu3vpqOF1WW1So59g/hXDIvd
         ymo5WzRR0+JD8zuqU3vJzSM1t+r5JUhfEUn/4dlY5EMgbxX1O0Nm7RpFDbQ+ntpd3If3
         E4oo8K7bbCYbE0iADfqFgaE/Txb953bLVAQU+tZbplv8egS15rMG0hLRmTuC5K5w7Cgu
         YE9CTjxj+UxqgWePOiHda5sf5nYjuN4mCnmOdlwyi9DJZYGa0YI3xJW5loDXaUWFNIbW
         Kvuouwx2OD8WmM0lacHrKI73gnVuNfVpCiRMHL86uwjfwyKgg0pUWF7GKyR6X+/ydaua
         Iirw==
X-Forwarded-Encrypted: i=1; AJvYcCXIcJ5Yhwhm11vEK5DuHGhh3dAwF3SXuQH8e8EfcumFrP9N9WJpuTqKtinkqqfDpIhozrxYOYd78Vc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTwpaUBUwJrMcu8qGcZPjqylTslAzArAq5239EbyUeBgM7UMzB
	xQOdaW4qAObN9Ao1p+QzGVhCwnHPsz+3C7drd8HI/JIymKsLsNOwnqL7dsD2Evby131/YZz+naQ
	dXV4=
X-Gm-Gg: ASbGncu9jUIR4t9U/3gb/uaK7w2+Z+RZRJ95hMIkYLIROFTCGRl6FyyJcMyiythA/iy
	iUk1+TDKJGs9AkPKHqkONZTlTT+poSuurWcj5nzMcdUAo47IN54GihYioyNeBBos0CqUoGcO7D1
	fwsx1k3ocQM2OJ+P/hLRTbfISUaSPwnaySPLNi0DQQdvwXSTNwtMNug2B8imlPFjsOhr9Ig2Qtq
	pfSEFHtU77Y+KTLpmHS5OHQB2i+kj7ovtO7cowUWJDS+h1/dG9eicVcS5Hy3n8kUIpGzitGKp/A
	GXggX/OJhYcIS7rEiPqnGltdni2uBN/l+0VOk5MXNKj9RZCza5I4o2h88OjdcXRV+rgU2N8wtt8
	EMMRbW0QTznvhxTT8HEMRFoJZdTFruX/kZI3iklNl5FmgGBGZkvMsncwrvMOJD9i2/cmPmhh/Wj
	GZI3potEcJznEBS7rSsg==
X-Google-Smtp-Source: AGHT+IFKCcj9Q+pZOm/XMW38YxdKv1fOdfAjaayhVPr264gvAP3yK+VcFAXwAfzPGc03TyyddDEwtw==
X-Received: by 2002:a05:6000:1886:b0:3b7:9d83:50ef with SMTP id ffacd0b85a97d-3b8d34b2a39mr1067171f8f.55.1754027970762;
        Thu, 31 Jul 2025 22:59:30 -0700 (PDT)
Message-ID: <69c7e79b-944a-432c-b86a-6cc73d94fc08@suse.com>
Date: Fri, 1 Aug 2025 07:59:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/3] vmx: Rewrite vpid_sync_vcpu_gva
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1750770621.git.teddy.astie@vates.tech>
 <f92b18bd9ec6b5b83a4b8a66dea2440b65060c27.1750770621.git.teddy.astie@vates.tech>
 <edb8bd9d-e5ca-42ad-a551-b7162d5e0f80@suse.com>
 <b708c59f-353a-418a-a859-c8b0aef428eb@vates.tech>
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
In-Reply-To: <b708c59f-353a-418a-a859-c8b0aef428eb@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.07.2025 18:18, Teddy Astie wrote:
> Le 31/07/2025 à 17:54, Jan Beulich a écrit :
>> On 26.06.2025 16:01, Teddy Astie wrote:
>>> Rewrite this function such as it doesn't rely on goto, also change the
>>> type of "type" to match the __invvpid function call.
>>
>> While this type change is probably okay (and benign to code generation), ...
>>
>>> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>>> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>>> @@ -287,10 +287,10 @@ extern uint8_t posted_intr_vector;
>>>   #define cpu_has_vmx_vpid_invvpid_single_context_retaining_global    \
>>>       (vmx_caps.vpid & VMX_VPID_INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL)
>>>   
>>> -#define INVVPID_INDIVIDUAL_ADDR                 0
>>> -#define INVVPID_SINGLE_CONTEXT                  1
>>> -#define INVVPID_ALL_CONTEXT                     2
>>> -#define INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 3
>>> +#define INVVPID_INDIVIDUAL_ADDR                 0UL
>>> +#define INVVPID_SINGLE_CONTEXT                  1UL
>>> +#define INVVPID_ALL_CONTEXT                     2UL
>>> +#define INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 3UL
>>
>> ... I don't follow the need for these extra adjustments. Preferably with
>> them dropped
> 
> With the type change from int to unsigned long to match __invvpid() 
> parameter, IIUC MISRA rule 7.2 requires that integer literals that are 
> used for unsigned must have the proper suffix.

No, it doesn't. Please re-read carefully what docs/misra/rules.rst says
in this regard.

Jan

