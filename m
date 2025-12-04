Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E93C9CA30C4
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 10:41:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177463.1501741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR5pf-0005Gn-6C; Thu, 04 Dec 2025 09:41:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177463.1501741; Thu, 04 Dec 2025 09:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR5pf-0005Dt-3P; Thu, 04 Dec 2025 09:41:03 +0000
Received: by outflank-mailman (input) for mailman id 1177463;
 Thu, 04 Dec 2025 09:41:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jX19=6K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vR5pe-0005Dl-0R
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 09:41:02 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5731e789-d0f5-11f0-980a-7dc792cee155;
 Thu, 04 Dec 2025 10:40:59 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42b3d7c1321so414623f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Dec 2025 01:40:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d3319ccsm2099990f8f.34.2025.12.04.01.40.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 01:40:58 -0800 (PST)
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
X-Inumbo-ID: 5731e789-d0f5-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764841259; x=1765446059; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xYsgryKDP8RVXhT+eXWM597Ck76L+IkzFj5LQ93t4yQ=;
        b=RZJGeU57iHLogswuPj06x4WoiulnsRQ3L2P1EM/IwJylz0JXsqU/Cu11Y4LJW/1ieV
         k3kVwBLq/1NHpDroqLAPseSQ2BPVXn7htQ5zapamcc60w2CtEMJ0phmLWGlaS9/n3MDt
         AkEURrQwECJas8nWJzcJPnRY3Ufw1WEL1wKUzGBOspNckjCpxiu705goxIXwdBaVcJdi
         TZE8Il4m4usjsSst8YDcoQo+k8vxFzW61+MPasaoya7zKhLbnpxT37XgPhzdltfVdO+i
         DH0M23gDR8gayqeMi/UwqJTfIJW+Kp10wphseqYb2024Xv0XmrhYFMtcJSxTCXdNNCya
         EpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764841259; x=1765446059;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYsgryKDP8RVXhT+eXWM597Ck76L+IkzFj5LQ93t4yQ=;
        b=bq38S3pAWN401xAcsNnIuNa0mEFSyL5wRybR0y/sMj9agbNXm49290EyS7Qk8VZICA
         eT/qQGQTmXUOiz+tadyPQOTDm+JdkRn5y+kfSobeREGgSpOkHVHN0FlgENUgwngTLprw
         +WptK7lBBjbTJyesQlv8uraZOohzbZ+2Tw6EHUOXgrCK/5g2uMSqiwYL5zgbocrzMZ2b
         k6YQoapyd17i5VmwutKLUkAu3IKK9j9OAlbLyPST9uPmoY+mKdgR+1Y5eWDxUMP6YR6x
         nVDtei9lv8k+Fk95lnP3/fx1FdztTeg9v2FTMaEyTRnkUALGUkwzV/YgahzcmU7Ofi7X
         q9jg==
X-Forwarded-Encrypted: i=1; AJvYcCW65MeLOelY3lfC/mu7LJ7IoKvvAcuuV571nj38TwWna//WMad32OGpVJXOpLKPp3ewhHSzJ2pv5I8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyCiFxSRZzFlEopFD/Rdixh33TImYahpMsURDi2RD1dedOfhR3o
	rr4ObfHARIe1NCOhS1xGQ6lOUyONr+hwymkm3Twuyr4V0DvCr9IT6cDS1qBl7Kih8VHJKDThg3D
	rhRk=
X-Gm-Gg: ASbGncsIShO7LRjeLof8xXZXy6oK08g/Wt3OjxVBSMWatYgpjLbQ9wqB1BgOkj35Z+N
	4ZprY/iv3ntQn3Fd8h9IiRTZEVxQbxQKysKPoVGH37HQDOjUqW49G+GF3Gk8IeZoKG44NdgtUO3
	XnHVOkkMG12b3RPAcdA1F7uW4q4XWRe79SDCHx3EKRVP1CfHGuShMJTh8/lJkVQPNIsNgFjRRo+
	APIPc0fpXRaAzzylTGuNn0zVKjjYMtX/QuCym5oUWzzA5B+q8bMe+mhj4vZ1rmg0X8R439eANGt
	+H7X+X7nUsdx2+dBHuIZyII6u/U15YlQhXre/3Ss6/aW/dCso57EcdPxq7x2MSjQ5Qk3iCUB3DK
	dGRLdt4zIpVtlSYY276/zDYFSUishc6NlNW9djFWwLv3wF8Sh5VCiyKMQBeX8HNG/LeeCc8oDJr
	PHIt2u0sYmt+5m+dr3puqcbUkqclxJKa0yYhCYtIY+CXw2G4GXS4fC3aLpFLgh5321xL5lLBuMA
	fA=
X-Google-Smtp-Source: AGHT+IGlZBAq0gsp1AsQ0UPXC2nBjtJoxvY+EDPZJp6bVuBUHBhpz3PyOja0ZFTFqwwfOMexkqHNdQ==
X-Received: by 2002:a05:6000:2dc6:b0:42b:3220:9412 with SMTP id ffacd0b85a97d-42f798482d6mr2287855f8f.28.1764841259136;
        Thu, 04 Dec 2025 01:40:59 -0800 (PST)
Message-ID: <57dea7ef-9bbe-44f8-a0dc-c933a6235c05@suse.com>
Date: Thu, 4 Dec 2025 10:40:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/24] xen/x86: wrap x86-specific domctl-op with
 CONFIG_MGMT_HYPERCALLS
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "grygorii_strashko@epam.com" <grygorii_strashko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-21-Penny.Zheng@amd.com>
 <de34ea34-1558-46b3-b5a6-79edd60ad45f@suse.com>
 <DM4PR12MB84519D61527BF82117F65CAEE1A6A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB84519D61527BF82117F65CAEE1A6A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.12.2025 05:23, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, November 26, 2025 1:00 AM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; grygorii_strashko@epam.com; Andrew
>> Cooper <andrew.cooper3@citrix.com>; Anthony PERARD
>> <anthony.perard@vates.tech>; Orzel, Michal <Michal.Orzel@amd.com>; Julien
>> Grall <julien@xen.org>; Roger Pau Monné <roger.pau@citrix.com>; Stefano
>> Stabellini <sstabellini@kernel.org>; Daniel P. Smith
>> <dpsmith@apertussolutions.com>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v4 20/24] xen/x86: wrap x86-specific domctl-op with
>> CONFIG_MGMT_HYPERCALLS
>>
>> On 21.11.2025 11:57, Penny Zheng wrote:
>>> --- a/xen/arch/x86/Kconfig
>>> +++ b/xen/arch/x86/Kconfig
>>> @@ -29,7 +29,7 @@ config X86
>>>     select HAS_PCI_MSI
>>>     select HAS_PIRQ
>>>     select HAS_SCHED_GRANULARITY
>>> -   imply HAS_SOFT_RESET
>>> +   select HAS_SOFT_RESET if MGMT_HYPERCALLS
>>
>> Why would you undo an "imply", when really we should use it more? One of its
>> purposes is so that you can add "depends on MGMT_HYPERCALLS" there, and it
>> then won't be auto-enabled if that dependency isn't fulfilled.
>>
>>> --- a/xen/arch/x86/include/asm/paging.h
>>> +++ b/xen/arch/x86/include/asm/paging.h
>>> @@ -55,7 +55,7 @@
>>>  #define PG_translate   0
>>>  #define PG_external    0
>>>  #endif
>>> -#if defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
>>> +#if defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
>> &&
>>> +defined(CONFIG_MGMT_HYPERCALLS)
>>
>> This line is too long now.
> 
> Hmm, how about I introduce a new Kconfig, something like:
> ```
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index c808c989fc..ec8f51b0b1 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -166,6 +166,9 @@ config SHADOW_PAGING
>  config PAGING
>         def_bool HVM || SHADOW_PAGING
> 
> +config PAGING_LOG_DIRTY
> +       def_bool PAGING
> +
>  config BIGMEM
>         bool "big memory support"
>         default n
> ```
> Then, later future dependency could be added to PAGING_LOG_DIRTY

I fear I don't see how having an option merely aliasing another option
would help the line length issue. I may simply be missing some context ...

Jan

