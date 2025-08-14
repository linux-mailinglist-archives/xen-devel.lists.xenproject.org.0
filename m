Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6900B2648C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 13:44:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081554.1441625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umWNd-0001jm-47; Thu, 14 Aug 2025 11:44:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081554.1441625; Thu, 14 Aug 2025 11:44:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umWNd-0001hf-1F; Thu, 14 Aug 2025 11:44:25 +0000
Received: by outflank-mailman (input) for mailman id 1081554;
 Thu, 14 Aug 2025 11:44:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umWNb-0001hX-MJ
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 11:44:23 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04d493fc-7904-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 13:44:21 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6188b794743so1435381a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 04:44:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a23fec4sm2576494466b.121.2025.08.14.04.44.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 04:44:20 -0700 (PDT)
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
X-Inumbo-ID: 04d493fc-7904-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755171861; x=1755776661; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nene8atz6aV5i9gCzUzOiEHu3ahBtWEzh7ISYeQCBSc=;
        b=Die3xe8QfXs01EauZzSHAjzN7p6nLa7WPJNiigSdYrgdk0LBpg961G28v7Y2akMuV0
         xWk+XWywNsHX3kQOr/lcC6L2tCxWhE9ERtri8uXx991N2ipAl6YO5vK38Wl2mYBxfuYQ
         h/IRGfC3W3dTtB17WCohxUBnCw5/G7J7Ub5oqRIM+gUsp7ibZvA3AJDcwxShVYSG1ELb
         zIHCczGCOAqj/47QcEHnpQZpekZ1rtzw/SEPzKPPj5U1axHUp3DOrLU8lj8p9yb8yEcq
         CVjGM1X641iXjUfX5oTcGnCdGo7sFypji2z2p6QS/K4ZQ93U+dnc7mJCQ8DZCr5htR22
         4DQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755171861; x=1755776661;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nene8atz6aV5i9gCzUzOiEHu3ahBtWEzh7ISYeQCBSc=;
        b=agDkLq74m7+iHMY9gSU29sADUi5mXIwSVXe2B04lTf4riecXDmjfFo5o5pVn/vqAhS
         LSx/WxWosWpoKT4gd/LC0DqFbQk/+hPlSIx1FiaFk0t7qfwjK/qg6XaGkss4Mv6OjVUb
         HXhTdwiD+pgYhYxZIdX27av/DP0ZUK2eaxIzAR0VhgRDyNl8r6I/9+juklXDWw7Gztjp
         2uQvfdvpFqgLEOTeSVoJmgD3lOVbHaWdYvPV7N6sLZJ5ClAGycWh2W6yp7c6I6vrc2cq
         4OTiwrIg4/w8PFxnLL25Io+zfciBy7ywjTlNgsN5CgRklCH8OU1wUkv2zi8nm7ENayU3
         UlCA==
X-Forwarded-Encrypted: i=1; AJvYcCXB1OQpaXyMjIPso1s13WayLVT5AfSrpNCK4FCX7EQX4KDtU+nsoE+Q/Alr2lzcSSnR62oW+Ups/Kw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzqgmar+h+tFlaoSC/Ort5dwCVaa2Q/bYLRymUl1JtthwxJkSap
	gQ+b9DKNTLM1AVEbqQnscK4n587jSLUtIFQFnFcS+M9gzLi1mmAK5+C+IBAVG7ZnX5CsBs9oLQ7
	sHCE=
X-Gm-Gg: ASbGncsZhdUs5TV6vZcgep7rhkyIoTIFjHRh15BS2KFdmPUA8u6WxtKNgqbyCnFz8RI
	ApK1oXrZl/Z+Txxthvu/hFTICEV4Jd1nD0bmZHNZdymYLitm5yE6YNG89Nwq/OJ/jsk67Xog9G0
	FHP0XRC8znstxwHdcc4lEvnapPhAVhj4M80lDu9XSn9jwjnGd9BdZs3JCk/3wxiIP11KUh61cqG
	+evP7Eh6tfFrJyMUwcLEEUM4k+p3EE2WMoIclLEFIqsTjDaCG6NyT44KfPODBBLRVz3yN8ncs3Z
	1L8COCA9LQc1N2oG1cRUmi5jnrGP+y0anT/4y/HCVqW/L1Y9Q1sjzjeL2nUvl5mGpPsSpXMfKAG
	eSieH2a9M9Fvhv47KBFb6IinO7GQnQqkQIHqc8UuWqJ/HibmlNycRSzcrpkkjD9VqRWsAJIyzw/
	4Z0NBc2wB3hq/H5m4Trg==
X-Google-Smtp-Source: AGHT+IFVW2NKfRwS0UX64cJur9pPvVw1GX9a37CIzK1LXQNot37G4+p9SeXPnKPKPl+541U3Y8T3Wg==
X-Received: by 2002:a17:907:60d1:b0:af1:8336:6651 with SMTP id a640c23a62f3a-afcb996b1fcmr258655766b.33.1755171861105;
        Thu, 14 Aug 2025 04:44:21 -0700 (PDT)
Message-ID: <c7e82bee-1b38-41e1-89c6-d1d3717087b2@suse.com>
Date: Thu, 14 Aug 2025 13:44:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/22] x86: FRED enumerations
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-14-andrew.cooper3@citrix.com>
 <9b4da5b3-dd68-4052-92cc-fe322164eaa5@suse.com>
 <9cc46920-b1a6-4085-8481-abf0f1cd0aab@citrix.com>
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
In-Reply-To: <9cc46920-b1a6-4085-8481-abf0f1cd0aab@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.08.2025 13:42, Andrew Cooper wrote:
> On 14/08/2025 12:20 pm, Jan Beulich wrote:
>> On 08.08.2025 22:23, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/include/asm/x86-defns.h
>>> +++ b/xen/arch/x86/include/asm/x86-defns.h
>>> @@ -75,6 +75,7 @@
>>>  #define X86_CR4_PKE        0x00400000 /* enable PKE */
>>>  #define X86_CR4_CET        0x00800000 /* Control-flow Enforcement Technology */
>>>  #define X86_CR4_PKS        0x01000000 /* Protection Key Supervisor */
>>> +#define X86_CR4_FRED      0x100000000 /* Fast Return and Event Delivery */
>> ... a UL suffix added here for Misra.
> 
> I was surprised, but Eclair is entirely fine with this.

And there is a use of the identifier in a monitored C file?

Jan

